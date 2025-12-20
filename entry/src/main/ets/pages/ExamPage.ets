/**
 * 模拟考试页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { Question, QuestionOption, QuestionType } from '../common/types/QuestionTypes';
import { questionService, QuestionQuery } from '../services/QuestionService';
import { answerRecordService, ExamRecordInput } from '../services/AnswerRecordService';
import { getSubjectShortName, getSubjectColor } from '../data/SubjectData';
import { Logger } from '../common/utils/Logger';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 考试配置
 */
interface ExamConfig {
  totalQuestions: number;
  timeLimit: number; // 分钟
  passScore: number; // 及格分数
}

@Entry
@Component
struct ExamPage {
  @State examType: string = 'mock';
  @State subjectId: string = '';
  @State isDarkMode: boolean = false;
  @State isStarted: boolean = false;
  @State isSubmitted: boolean = false;
  @State isLoading: boolean = false;
  @State showAnswerCard: boolean = false;

  // 考试数据
  @State questions: Question[] = [];
  @State currentIndex: number = 0;
  @State userAnswers: Map<string, string> = new Map();
  @State selectedOptions: string[] = [];
  @State answeredIndexMap: Map<number, number> = new Map(); // index -> status (0=未答, 3=已答)

  // 计时器
  @State remainingTime: number = 0; // 剩余秒数
  private timerId: number = -1;

  // 考试配置
  private examConfig: ExamConfig = {
    totalQuestions: 20,
    timeLimit: 30,
    passScore: 60
  };

  aboutToAppear(): void {
    const params: RouteParams = Router.getParams();
    if (params['examType']) {
      this.examType = params['examType'] as string;
    }
    if (params['subjectId']) {
      this.subjectId = params['subjectId'] as string;
    }
  }

  aboutToDisappear(): void {
    this.stopTimer();
  }


  /**
   * 开始考试
   */
  private async startExam(): Promise<void> {
    this.isLoading = true;
    try {
      const query: QuestionQuery = {
        limit: this.examConfig.totalQuestions,
        random: true
      };

      if (this.subjectId) {
        query.subjectId = this.subjectId;
      }

      this.questions = await questionService.getQuestions(query);

      if (this.questions.length > 0) {
        this.isStarted = true;
        this.remainingTime = this.examConfig.timeLimit * 60;
        this.startTimer();
      }

      Logger.info(`[ExamPage] Started exam with ${this.questions.length} questions`);
    } catch (error) {
      Logger.error('[ExamPage] Failed to start exam', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  /**
   * 开始计时
   */
  private startTimer(): void {
    this.timerId = setInterval(() => {
      if (this.remainingTime > 0) {
        this.remainingTime--;
      } else {
        this.submitExam();
      }
    }, 1000);
  }

  /**
   * 停止计时
   */
  private stopTimer(): void {
    if (this.timerId !== -1) {
      clearInterval(this.timerId);
      this.timerId = -1;
    }
  }

  /**
   * 格式化时间
   */
  private formatTime(seconds: number): string {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  }

  /**
   * 选择选项
   */
  private selectOption(optionKey: string): void {
    const question = this.questions[this.currentIndex];
    if (!question) return;

    if (question.type === QuestionType.SINGLE || question.type === QuestionType.JUDGE) {
      this.selectedOptions = [optionKey];
    } else if (question.type === QuestionType.MULTIPLE) {
      const index = this.selectedOptions.indexOf(optionKey);
      if (index > -1) {
        this.selectedOptions = this.selectedOptions.filter((item: string) => item !== optionKey);
      } else {
        this.selectedOptions = [...this.selectedOptions, optionKey];
      }
    }
  }

  /**
   * 保存当前答案
   */
  private saveCurrentAnswer(): void {
    if (this.selectedOptions.length > 0) {
      const question = this.questions[this.currentIndex];
      const answer = this.selectedOptions.sort().join(',');
      this.userAnswers.set(question.id, answer);
      // 更新答题状态
      this.answeredIndexMap.set(this.currentIndex, 3); // 3 = 已答
    }
  }

  /**
   * 获取答题卡状态Map
   */
  private getAnswerCardMap(): Map<number, number> {
    return this.answeredIndexMap;
  }

  /**
   * 下一题
   */
  private nextQuestion(): void {
    this.saveCurrentAnswer();
    if (this.currentIndex < this.questions.length - 1) {
      this.currentIndex++;
      this.loadSavedAnswer();
    }
  }

  /**
   * 上一题
   */
  private prevQuestion(): void {
    this.saveCurrentAnswer();
    if (this.currentIndex > 0) {
      this.currentIndex--;
      this.loadSavedAnswer();
    }
  }

  /**
   * 跳转到指定题目
   */
  private goToQuestion(index: number): void {
    this.saveCurrentAnswer();
    this.currentIndex = index;
    this.loadSavedAnswer();
  }

  /**
   * 加载已保存的答案
   */
  private loadSavedAnswer(): void {
    const question = this.questions[this.currentIndex];
    const savedAnswer = this.userAnswers.get(question.id);
    if (savedAnswer) {
      this.selectedOptions = savedAnswer.split(',');
    } else {
      this.selectedOptions = [];
    }
  }

  /**
   * 提交考试
   */
  private submitExam(): void {
    this.saveCurrentAnswer();
    this.stopTimer();

    // 计算成绩并收集错题
    let correctCount = 0;
    const wrongQuestionIds: string[] = [];

    this.questions.forEach((question: Question) => {
      const userAnswer = this.userAnswers.get(question.id);
      if (userAnswer === question.answer) {
        correctCount++;
      } else {
        // 收集错题ID
        wrongQuestionIds.push(question.id);
      }
    });

    const score = Math.round((correctCount / this.questions.length) * 100);
    const duration = this.examConfig.timeLimit * 60 - this.remainingTime;

    // 保存考试记录到数据库
    this.saveExamRecordToDb(correctCount, score, duration);

    // 将错题添加到错题本
    this.saveWrongQuestionsToDb(wrongQuestionIds);

    // 跳转到结果页
    const params: RouteParams = {};
    params['totalCount'] = this.questions.length as Object;
    params['correctCount'] = correctCount as Object;
    params['score'] = score as Object;
    params['duration'] = duration as Object;
    params['passScore'] = this.examConfig.passScore as Object;

    Router.push('pages/ExamResultPage', params);
  }

  /**
   * 将错题保存到错题本
   */
  private async saveWrongQuestionsToDb(wrongQuestionIds: string[]): Promise<void> {
    try {
      for (const questionId of wrongQuestionIds) {
        await answerRecordService.addToWrongBook(questionId);
      }
      Logger.info(`[ExamPage] Added ${wrongQuestionIds.length} wrong questions to wrong book`);
    } catch (error) {
      Logger.error('[ExamPage] Failed to save wrong questions', error as Error);
    }
  }

  /**
   * 保存考试记录到数据库
   */
  private async saveExamRecordToDb(correctCount: number, score: number, duration: number): Promise<void> {
    try {
      const questionIds = this.questions.map((q: Question) => q.id).join(',');
      const answersArr: string[] = [];
      this.userAnswers.forEach((value: string, key: string) => {
        answersArr.push(`${key}:${value}`);
      });

      const examRecordInput: ExamRecordInput = {
        examType: this.examType,
        subjectId: this.subjectId,
        totalCount: this.questions.length,
        correctCount: correctCount,
        score: score,
        duration: duration,
        questionIds: questionIds,
        answers: answersArr.join(';')
      };
      await answerRecordService.saveExamRecord(examRecordInput);

      Logger.info('[ExamPage] Exam record saved');
    } catch (error) {
      Logger.error('[ExamPage] Failed to save exam record', error as Error);
    }
  }

  /**
   * 获取题型名称
   */
  private getQuestionTypeName(type: QuestionType): string {
    switch (type) {
      case QuestionType.SINGLE: return '单选题';
      case QuestionType.MULTIPLE: return '多选题';
      case QuestionType.JUDGE: return '判断题';
      default: return '未知';
    }
  }

  /**
   * 获取已答题数
   */
  private getAnsweredCount(): number {
    return this.userAnswers.size;
  }


  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        if (!this.isStarted) {
          this.ExamIntro()
        } else {
          this.ExamContent()
        }
      }
      .width('100%')
      .height('100%')

      // 答题卡弹窗
      if (this.showAnswerCard) {
        Column() {
          // 遮罩层
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor('rgba(0,0,0,0.5)')
            .onClick(() => {
              this.showAnswerCard = false;
            })
        }
        .width('100%')
        .height('100%')
        .position({ x: 0, y: 0 })

        // 答题卡内容
        this.AnswerCardPanel()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.isDarkMode ? ThemeColors.BACKGROUND_DARK : ThemeColors.BACKGROUND)
    .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
  }

  /**
   * 考试介绍页
   */
  @Builder
  ExamIntro() {
    Column() {
      // 顶部导航
      Row() {
        Row() {
          Image($r('app.media.back'))
            .width(24)
            .height(24)
        }
        .width(40)
        .height(40)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          Router.back();
        })

        Text('模拟考试')
          .fontSize(ThemeConstants.FONT_SIZE_LG)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Row().width(40).height(40)
      }
      .width('100%')
      .height(56)
      .padding({ left: ThemeConstants.SPACING_SM, right: ThemeConstants.SPACING_SM })
      .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)

      // 考试信息卡片
      Column() {
        Text('📋')
          .fontSize(64)
          .margin({ top: ThemeConstants.SPACING_2XL })

        Text('模拟考试')
          .fontSize(ThemeConstants.FONT_SIZE_2XL)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .margin({ top: ThemeConstants.SPACING_MD })

        // 考试规则
        Column() {
          this.RuleItem('📝', '题目数量', `${this.examConfig.totalQuestions} 题`)
          this.RuleItem('⏱️', '考试时间', `${this.examConfig.timeLimit} 分钟`)
          this.RuleItem('✅', '及格分数', `${this.examConfig.passScore} 分`)
          this.RuleItem('🎯', '题型', '单选、多选、判断')
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_MD)
        .margin({ top: ThemeConstants.SPACING_LG, left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
        .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
        .borderRadius(ThemeConstants.RADIUS_MD)

        // 注意事项
        Column() {
          Text('注意事项')
            .fontSize(ThemeConstants.FONT_SIZE_MD)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .width('100%')

          Text('1. 考试开始后计时器自动启动')
            .fontSize(ThemeConstants.FONT_SIZE_SM)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .margin({ top: ThemeConstants.SPACING_SM })

          Text('2. 时间结束自动交卷')
            .fontSize(ThemeConstants.FONT_SIZE_SM)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .margin({ top: ThemeConstants.SPACING_XS })

          Text('3. 可随时点击答题卡查看进度')
            .fontSize(ThemeConstants.FONT_SIZE_SM)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .margin({ top: ThemeConstants.SPACING_XS })
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_MD)
        .margin({ top: ThemeConstants.SPACING_SM, left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
        .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
        .borderRadius(ThemeConstants.RADIUS_MD)
        .alignItems(HorizontalAlign.Start)

        Blank()

        // 开始按钮
        Button(this.isLoading ? '加载中...' : '开始考试')
          .width('90%')
          .height(48)
          .fontSize(ThemeConstants.FONT_SIZE_MD)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.PRIMARY)
          .borderRadius(ThemeConstants.RADIUS_BASE)
          .margin({ bottom: ThemeConstants.SPACING_2XL })
          .enabled(!this.isLoading)
          .onClick(() => {
            this.startExam();
          })
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  RuleItem(icon: string, label: string, value: string) {
    Row() {
      Text(icon)
        .fontSize(20)
        .width(32)

      Text(label)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .layoutWeight(1)

      Text(value)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontWeight(FontWeight.Medium)
        .fontColor(ThemeColors.TEXT_PRIMARY)
    }
    .width('100%')
    .padding({ top: ThemeConstants.SPACING_SM, bottom: ThemeConstants.SPACING_SM })
  }


  /**
   * 考试内容页
   */
  @Builder
  ExamContent() {
    Column() {
      // 顶部状态栏
      this.ExamHeader()

      if (this.questions.length > 0) {
        // 题目内容
        Scroll() {
          Column() {
            this.QuestionInfo()
            this.QuestionContent()
            this.OptionList()
          }
          .padding(ThemeConstants.SPACING_MD)
        }
        .layoutWeight(1)

        // 底部操作栏
        this.ExamBottomBar()
      } else {
        Column() {
          Text('暂无题目')
            .fontSize(ThemeConstants.FONT_SIZE_LG)
            .fontColor(ThemeColors.TEXT_SECONDARY)
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  ExamHeader() {
    Row() {
      // 返回/退出
      Row() {
        Text('退出')
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.ERROR)
      }
      .padding({ left: 12, right: 12 })
      .onClick(() => {
        // TODO: 添加确认弹窗
        this.stopTimer();
        Router.back();
      })

      // 计时器
      Row() {
        Text('⏱️')
          .fontSize(ThemeConstants.FONT_SIZE_MD)

        Text(this.formatTime(this.remainingTime))
          .fontSize(ThemeConstants.FONT_SIZE_LG)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.remainingTime < 300 ? ThemeColors.ERROR : ThemeColors.TEXT_PRIMARY)
          .margin({ left: ThemeConstants.SPACING_XS })
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)

      // 进度
      Text(`${this.getAnsweredCount()}/${this.questions.length}`)
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .padding({ left: 12, right: 12 })
    }
    .width('100%')
    .height(56)
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
  }

  @Builder
  QuestionInfo() {
    Row() {
      Text(`第 ${this.currentIndex + 1} 题`)
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.PRIMARY)
        .padding({ left: 8, right: 8, top: 2, bottom: 2 })
        .backgroundColor(ThemeColors.PRIMARY + '20')
        .borderRadius(4)

      Text(this.getQuestionTypeName(this.questions[this.currentIndex].type))
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.WHITE)
        .padding({ left: 8, right: 8, top: 2, bottom: 2 })
        .backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(4)
        .margin({ left: ThemeConstants.SPACING_SM })
    }
    .width('100%')
  }

  @Builder
  QuestionContent() {
    Column() {
      Text(this.questions[this.currentIndex].content)
        .fontSize(ThemeConstants.FONT_SIZE_MD)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .lineHeight(24)
    }
    .width('100%')
    .padding({ top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_MD })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  OptionList() {
    Column() {
      ForEach(this.questions[this.currentIndex].options, (option: QuestionOption) => {
        this.OptionItem(option)
      })
    }
    .width('100%')
  }

  @Builder
  OptionItem(option: QuestionOption) {
    Row() {
      Column() {
        Text(option.key)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.selectedOptions.includes(option.key) ? ThemeColors.WHITE : ThemeColors.TEXT_SECONDARY)
      }
      .width(32)
      .height(32)
      .borderRadius(16)
      .backgroundColor(this.selectedOptions.includes(option.key) ? ThemeColors.PRIMARY : ThemeColors.GRAY_100)
      .justifyContent(FlexAlign.Center)

      Text(option.content)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .margin({ left: ThemeConstants.SPACING_BASE })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_BASE)
    .margin({ top: ThemeConstants.SPACING_SM })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .border({
      width: 1,
      color: this.selectedOptions.includes(option.key) ? ThemeColors.PRIMARY : ThemeColors.BORDER
    })
    .onClick(() => {
      this.selectOption(option.key);
    })
  }

  @Builder
  ExamBottomBar() {
    Row() {
      Button('上一题')
        .width(90)
        .height(44)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(this.currentIndex > 0 ? ThemeColors.PRIMARY : ThemeColors.TEXT_DISABLED)
        .backgroundColor(ThemeColors.TRANSPARENT)
        .borderWidth(1)
        .borderColor(this.currentIndex > 0 ? ThemeColors.PRIMARY : ThemeColors.BORDER)
        .borderRadius(ThemeConstants.RADIUS_BASE)
        .enabled(this.currentIndex > 0)
        .onClick(() => {
          this.prevQuestion();
        })

      // 答题卡按钮
      Button('答题卡')
        .width(90)
        .height(44)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .backgroundColor(ThemeColors.GRAY_100)
        .borderRadius(ThemeConstants.RADIUS_BASE)
        .onClick(() => {
          this.saveCurrentAnswer();
          this.showAnswerCard = true;
        })

      if (this.currentIndex < this.questions.length - 1) {
        Button('下一题')
          .width(90)
          .height(44)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.PRIMARY)
          .borderRadius(ThemeConstants.RADIUS_BASE)
          .onClick(() => {
            this.nextQuestion();
          })
      } else {
        Button('交卷')
          .width(90)
          .height(44)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.SUCCESS)
          .borderRadius(ThemeConstants.RADIUS_BASE)
          .onClick(() => {
            this.submitExam();
          })
      }
    }
    .width('100%')
    .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD, bottom: 32 })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  /**
   * 答题卡面板
   */
  @Builder
  AnswerCardPanel() {
    Column() {
      // 标题栏
      Row() {
        Text('答题卡')
          .fontSize(ThemeConstants.FONT_SIZE_LG)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Blank()

        Text('✕')
          .fontSize(ThemeConstants.FONT_SIZE_XL)
          .fontColor(ThemeColors.TEXT_HINT)
          .onClick(() => {
            this.showAnswerCard = false;
          })
      }
      .width('100%')
      .padding(ThemeConstants.SPACING_MD)

      // 统计信息
      Row() {
        this.CardStatItem('已答', this.userAnswers.size, ThemeColors.PRIMARY)
        this.CardStatItem('未答', this.questions.length - this.userAnswers.size, ThemeColors.GRAY_400)
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
      .justifyContent(FlexAlign.SpaceAround)

      // 题目网格
      Scroll() {
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
          ForEach(this.generateIndexArray(), (index: number) => {
            this.CardQuestionItem(index)
          })
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_SM)
      }
      .layoutWeight(1)

      // 图例
      Row() {
        this.CardLegendItem(ThemeColors.GRAY_200, '未答')
        this.CardLegendItem(ThemeColors.PRIMARY, '已答')
      }
      .width('100%')
      .padding(ThemeConstants.SPACING_MD)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(ThemeColors.GRAY_50)
    }
    .width('100%')
    .height('60%')
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius({ topLeft: ThemeConstants.RADIUS_LG, topRight: ThemeConstants.RADIUS_LG })
  }

  /**
   * 生成索引数组
   */
  private generateIndexArray(): number[] {
    const arr: number[] = [];
    for (let i = 0; i < this.questions.length; i++) {
      arr.push(i);
    }
    return arr;
  }

  @Builder
  CardStatItem(label: string, count: number, color: string) {
    Row() {
      Circle()
        .width(12)
        .height(12)
        .fill(color)

      Text(`${label}: ${count}`)
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ left: ThemeConstants.SPACING_XS })
    }
  }

  @Builder
  CardQuestionItem(index: number) {
    Column() {
      Text(`${index + 1}`)
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(this.isQuestionAnswered(index) ? ThemeColors.WHITE : ThemeColors.TEXT_SECONDARY)
    }
    .width(44)
    .height(44)
    .margin(4)
    .borderRadius(ThemeConstants.RADIUS_BASE)
    .backgroundColor(this.isQuestionAnswered(index) ? ThemeColors.PRIMARY : ThemeColors.GRAY_200)
    .border({
      width: this.currentIndex === index ? 2 : 0,
      color: ThemeColors.WARNING
    })
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.goToQuestion(index);
      this.showAnswerCard = false;
    })
  }

  /**
   * 判断题目是否已答
   */
  private isQuestionAnswered(index: number): boolean {
    if (index >= this.questions.length) return false;
    const question = this.questions[index];
    return this.userAnswers.has(question.id);
  }

  @Builder
  CardLegendItem(color: string, label: string) {
    Row() {
      Column()
        .width(16)
        .height(16)
        .borderRadius(4)
        .backgroundColor(color)

      Text(label)
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ left: ThemeConstants.SPACING_XXS })
    }
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
  }
}
