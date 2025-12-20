/**
 * 考试答案查看页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import { Question, QuestionType, QuestionOption } from '../common/types/QuestionTypes';
import { questionService } from '../services/QuestionService';
import { ExamResult } from '../services/MockExamService';
import { getSubjectShortName, getSubjectColor } from '../data/SubjectData';
import { Logger } from '../common/utils/Logger';
import { relationalStore } from '@kit.ArkData';
import { databaseService } from '../data/database/DatabaseService';

@Entry
@Component
struct ExamAnswerPage {
  @State isLoading: boolean = true;
  @State questions: Question[] = [];
  @State userAnswers: Map<string, string> = new Map();
  @State currentIndex: number = 0;
  @State currentQuestion: Question | null = null;
  @State examResult: ExamResult | null = null;
  @State showAnswerCard: boolean = false;

  aboutToAppear(): void {
    this.loadExamData();
  }

  private async loadExamData(): Promise<void> {
    try {
      const params: RouteParams = Router.getParams();
      const examRecordId = params['examRecordId'] as string;
      this.examResult = params['examResult'] as ExamResult;

      if (!examRecordId) {
        Logger.error('[ExamAnswerPage] No exam record id');
        Router.back();
        return;
      }

      // 从数据库加载考试记录
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('exam_records');
      predicates.equalTo('id', examRecordId);
      const resultSet = await store.query(predicates);

      if (resultSet.goToNextRow()) {
        const questionIdsStr = resultSet.getString(resultSet.getColumnIndex('question_ids'));
        const answersStr = resultSet.getString(resultSet.getColumnIndex('answers'));
        
        // 尝试获取存储的题目数据
        let questionsDataStr = '';
        try {
          const colIndex = resultSet.getColumnIndex('questions_data');
          if (colIndex >= 0) {
            questionsDataStr = resultSet.getString(colIndex) || '';
          }
        } catch (e) { /* 字段不存在 */ }

        let answersObj: Record<string, string> = {};
        try { answersObj = JSON.parse(answersStr); } catch (e) { /* ignore */ }

        // 恢复用户答案
        Object.keys(answersObj).forEach(k => {
          this.userAnswers.set(k, answersObj[k]);
        });

        // 优先从存储的题目数据加载
        if (questionsDataStr) {
          try {
            const questionsData = JSON.parse(questionsDataStr) as Question[];
            this.questions = questionsData.map(q => {
              const question: Question = {
                id: q.id,
                type: q.type,
                subjectId: q.subjectId,
                chapter: '',
                content: q.content,
                options: q.options,
                answer: q.answer,
                analysis: q.analysis || '',
                difficulty: 1,
                tags: [],
                createTime: 0,
                updateTime: 0
              };
              return question;
            });
            Logger.info(`[ExamAnswerPage] Loaded ${this.questions.length} questions from stored data`);
          } catch (e) {
            Logger.error('[ExamAnswerPage] Failed to parse questions data', e as Error);
          }
        }

        // 如果没有存储的题目数据，从题库加载（兼容旧数据）
        if (this.questions.length === 0) {
          let questionIds: string[] = [];
          try { questionIds = JSON.parse(questionIdsStr); } catch (e) { /* ignore */ }
          if (questionIds.length > 0) {
            this.questions = await questionService.getQuestionsByIds(questionIds);
            Logger.info(`[ExamAnswerPage] Loaded ${this.questions.length} questions from question bank`);
          }
        }

        if (this.questions.length > 0) {
          this.setCurrentQuestion(0);
        }
      }

      resultSet.close();
      this.isLoading = false;
    } catch (error) {
      Logger.error('[ExamAnswerPage] Failed to load exam data', error as Error);
      this.isLoading = false;
    }
  }

  private setCurrentQuestion(index: number): void {
    if (index >= 0 && index < this.questions.length) {
      this.currentIndex = index;
      const q = this.questions[index];
      // 创建新对象以触发UI更新
      const newQuestion: Question = {
        id: q.id,
        type: q.type,
        subjectId: q.subjectId,
        chapter: q.chapter,
        content: q.content,
        options: q.options.slice(),
        answer: q.answer,
        analysis: q.analysis,
        difficulty: q.difficulty,
        tags: q.tags.slice(),
        createTime: q.createTime,
        updateTime: q.updateTime
      };
      this.currentQuestion = newQuestion;
    }
  }

  private goToQuestion(index: number): void {
    this.setCurrentQuestion(index);
    this.showAnswerCard = false;
  }

  private prevQuestion(): void {
    if (this.currentIndex > 0) {
      this.goToQuestion(this.currentIndex - 1);
    }
  }

  private nextQuestion(): void {
    if (this.currentIndex < this.questions.length - 1) {
      this.goToQuestion(this.currentIndex + 1);
    }
  }

  private isCorrectAnswer(question: Question, optionKey: string): boolean {
    return question.answer.toUpperCase().includes(optionKey.toUpperCase());
  }

  private isUserAnswer(questionId: string, optionKey: string): boolean {
    const userAns = this.userAnswers.get(questionId) || '';
    return userAns.toUpperCase().includes(optionKey.toUpperCase());
  }

  private isQuestionCorrect(question: Question): boolean {
    const userAns = this.userAnswers.get(question.id) || '';
    if (!userAns) return false;
    const correctAnswer = question.answer.toUpperCase().split(',').sort().join(',');
    const userAnswer = userAns.toUpperCase().split(',').sort().join(',');
    return correctAnswer === userAnswer;
  }

  private getQuestionTypeName(type: QuestionType): string {
    switch (type) {
      case QuestionType.SINGLE: return '单选';
      case QuestionType.MULTIPLE: return '多选';
      case QuestionType.JUDGE: return '判断';
      default: return '其他';
    }
  }

  build() {
    Stack() {
      Column()
        .width('100%')
        .height(AppConstants.STATUS_BAR_HEIGHT + 56)
        .backgroundColor($r('app.color.surface'))

      Column() {
        this.NavigationBar()

        if (this.isLoading) {
          this.LoadingState()
        } else if (this.questions.length === 0) {
          this.EmptyState()
        } else {
          this.QuestionContent()
          this.BottomBar()
        }

        if (this.showAnswerCard) {
          this.AnswerCardDialog()
        }
      }
      .width('100%')
      .height('100%')
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background'))
  }

  @Builder
  NavigationBar() {
    Row() {
      Row() {
        Image($r('app.media.back'))
          .width(24)
          .height(24)
          .fillColor($r('app.color.text_primary'))
      }
      .width(40)
      .height(40)
      .justifyContent(FlexAlign.Center)
      .onClick(() => { Router.back(); })

      Text('答案解析')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.text_primary'))
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Text(`${this.currentIndex + 1}/${this.questions.length}`)
        .fontSize(14)
        .fontColor($r('app.color.text_secondary'))
        .width(60)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height(56)
    .padding({ left: 8, right: 8 })
    .backgroundColor($r('app.color.surface'))
  }

  @Builder
  LoadingState() {
    Column() {
      LoadingProgress().width(48).height(48).color(ThemeColors.PRIMARY)
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  EmptyState() {
    Column() {
      Text('😕')
        .fontSize(64)
      Text('未找到考试记录')
        .fontSize(16)
        .fontColor($r('app.color.text_secondary'))
        .margin({ top: 16 })
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  QuestionContent() {
    Scroll() {
      Column() {
        if (this.currentQuestion) {
          // 答题状态标签
          Row({ space: 8 }) {
            Text(this.isQuestionCorrect(this.currentQuestion) ? '✓ 正确' : '✗ 错误')
              .fontSize(12)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
              .backgroundColor(this.isQuestionCorrect(this.currentQuestion) ? ThemeColors.SUCCESS : ThemeColors.ERROR)
              .borderRadius(12)

            Text(this.getQuestionTypeName(this.currentQuestion.type) + '题')
              .fontSize(12)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
              .backgroundColor(ThemeColors.PRIMARY)
              .borderRadius(12)

            Text(getSubjectShortName(this.currentQuestion.subjectId))
              .fontSize(12)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
              .backgroundColor(getSubjectColor(this.currentQuestion.subjectId))
              .borderRadius(12)
          }
          .width('100%')

          // 题目内容
          Text(this.currentQuestion.content)
            .fontSize(17)
            .fontColor($r('app.color.text_primary'))
            .lineHeight(28)
            .margin({ top: 16, bottom: 24 })
            .width('100%')

          // 选项列表
          Column({ space: 12 }) {
            ForEach(this.currentQuestion.options, (option: QuestionOption) => {
              this.OptionItem(option, this.currentQuestion!)
            }, (option: QuestionOption) => `${this.currentQuestion!.id}_${option.key}`)
          }
          .width('100%')

          // 答案和解析
          Column() {
            Row() {
              Text('正确答案：')
                .fontSize(14)
                .fontColor($r('app.color.text_secondary'))
              Text(this.currentQuestion.answer)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(ThemeColors.SUCCESS)
            }
            .width('100%')

            Row() {
              Text('你的答案：')
                .fontSize(14)
                .fontColor($r('app.color.text_secondary'))
              Text(this.userAnswers.get(this.currentQuestion.id) || '未作答')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(this.isQuestionCorrect(this.currentQuestion) ? ThemeColors.SUCCESS : ThemeColors.ERROR)
            }
            .width('100%')
            .margin({ top: 8 })

            if (this.currentQuestion.analysis) {
              Column() {
                Text('解析：')
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor($r('app.color.text_primary'))
                  .width('100%')
                Text(this.currentQuestion.analysis)
                  .fontSize(14)
                  .fontColor($r('app.color.text_secondary'))
                  .lineHeight(22)
                  .margin({ top: 4 })
                  .width('100%')
              }
              .width('100%')
              .margin({ top: 12 })
            }
          }
          .width('100%')
          .padding(16)
          .margin({ top: 20 })
          .backgroundColor($r('app.color.analysis_bg'))
          .borderRadius(12)
        }
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 16, bottom: 16 })
      .alignItems(HorizontalAlign.Start)
    }
    .scrollBar(BarState.Off)
    .layoutWeight(1)
    .backgroundColor($r('app.color.surface'))
  }

  @Builder
  OptionItem(option: QuestionOption, question: Question) {
    Row() {
      Row() {
        Text(option.key)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.getOptionTextColor(question, option.key))
      }
      .width(32)
      .height(32)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(this.getOptionBgColor(question, option.key))
      .border({ width: 1.5, color: this.getOptionBorderColor(question, option.key) })
      .borderRadius(16)

      Text(option.content)
        .fontSize(15)
        .fontColor($r('app.color.text_primary'))
        .layoutWeight(1)
        .margin({ left: 14 })
        .maxLines(10)

      // 标记图标
      if (this.isCorrectAnswer(question, option.key)) {
        Text('✓')
          .fontSize(18)
          .fontColor(ThemeColors.SUCCESS)
      } else if (this.isUserAnswer(question.id, option.key) && !this.isCorrectAnswer(question, option.key)) {
        Text('✗')
          .fontSize(18)
          .fontColor(ThemeColors.ERROR)
      }
    }
    .width('100%')
    .padding({ left: 14, right: 16, top: 16, bottom: 16 })
    .backgroundColor($r('app.color.surface'))
    .borderRadius(12)
    .border({ width: 1, color: this.getOptionBorderColor(question, option.key) })
  }

  private getOptionTextColor(question: Question, optionKey: string): ResourceColor {
    if (this.isCorrectAnswer(question, optionKey)) {
      return ThemeColors.WHITE;
    }
    if (this.isUserAnswer(question.id, optionKey)) {
      return ThemeColors.WHITE;
    }
    return $r('app.color.text_primary');
  }

  private getOptionBgColor(question: Question, optionKey: string): ResourceColor {
    if (this.isCorrectAnswer(question, optionKey)) {
      return ThemeColors.SUCCESS;
    }
    if (this.isUserAnswer(question.id, optionKey)) {
      return ThemeColors.ERROR;
    }
    return $r('app.color.surface');
  }

  private getOptionBorderColor(question: Question, optionKey: string): ResourceColor {
    if (this.isCorrectAnswer(question, optionKey)) {
      return ThemeColors.SUCCESS;
    }
    if (this.isUserAnswer(question.id, optionKey)) {
      return ThemeColors.ERROR;
    }
    return $r('app.color.border');
  }

  @Builder
  BottomBar() {
    Column() {
      Row() {
        Text('答题卡')
          .fontSize(14)
          .fontColor(ThemeColors.PRIMARY)
        Text(this.showAnswerCard ? ' ▲' : ' ▼')
          .fontSize(12)
          .fontColor(ThemeColors.PRIMARY)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding({ top: 10, bottom: 8 })
      .onClick(() => { this.showAnswerCard = !this.showAnswerCard; })

      Row({ space: 12 }) {
        Button('上一题')
          .fontSize(15)
          .fontColor(this.currentIndex > 0 ? ThemeColors.PRIMARY : $r('app.color.text_hint'))
          .backgroundColor($r('app.color.background'))
          .borderRadius(24)
          .height(44)
          .layoutWeight(1)
          .enabled(this.currentIndex > 0)
          .onClick(() => { this.prevQuestion(); })

        Button('下一题')
          .fontSize(15)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.PRIMARY)
          .borderRadius(24)
          .height(44)
          .layoutWeight(1)
          .enabled(this.currentIndex < this.questions.length - 1)
          .onClick(() => { this.nextQuestion(); })
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 32 })
    }
    .width('100%')
    .backgroundColor($r('app.color.surface'))
    .border({ width: { top: 1 }, color: $r('app.color.border') })
  }

  @Builder
  AnswerCardDialog() {
    Column() {
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.5)')
        .onClick(() => { this.showAnswerCard = false; })
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })

    Column() {
      Row() {
        Text('答题卡')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))
        Blank()
        Text('✕')
          .fontSize(20)
          .fontColor($r('app.color.text_hint'))
          .onClick(() => { this.showAnswerCard = false; })
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 16, bottom: 12 })

      Row({ space: 16 }) {
        this.LegendItem('●', '正确', ThemeColors.SUCCESS)
        this.LegendItem('●', '错误', ThemeColors.ERROR)
        this.LegendItem('○', '未答', ThemeColors.GRAY_300)
      }
      .width('100%')
      .padding({ left: 20, right: 20, bottom: 12 })

      Scroll() {
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(this.questions, (question: Question, index: number) => {
            this.AnswerCardItem(question, index)
          }, (question: Question, index: number) => `${question.id}_${index}`)
        }
        .width('100%')
        .padding({ left: 16, right: 16 })
      }
      .scrollBar(BarState.Off)
      .layoutWeight(1)
    }
    .width('100%')
    .height('50%')
    .backgroundColor($r('app.color.surface'))
    .borderRadius({ topLeft: 20, topRight: 20 })
    .position({ x: 0, y: '50%' })
  }

  @Builder
  LegendItem(icon: string, label: string, color: ResourceColor) {
    Row({ space: 4 }) {
      Text(icon)
        .fontSize(14)
        .fontColor(color)
      Text(label)
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
    }
  }

  @Builder
  AnswerCardItem(question: Question, index: number) {
    Column() {
      Text(`${index + 1}`)
        .fontSize(13)
        .fontColor(ThemeColors.WHITE)
    }
    .width(40)
    .height(40)
    .margin(4)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.getCardItemBgColor(question))
    .borderRadius(8)
    .border({
      width: this.currentIndex === index ? 2 : 1,
      color: this.currentIndex === index ? ThemeColors.PRIMARY : $r('app.color.border')
    })
    .onClick(() => { this.goToQuestion(index); })
  }

  private getCardItemBgColor(question: Question): ResourceColor {
    const userAns = this.userAnswers.get(question.id);
    if (!userAns) {
      return ThemeColors.GRAY_300;
    }
    return this.isQuestionCorrect(question) ? ThemeColors.SUCCESS : ThemeColors.ERROR;
  }
}
