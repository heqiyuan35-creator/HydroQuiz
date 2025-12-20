/**
 * 入门测试页面
 * HydroQuiz - 水利工程检测员刷题宝
 * 首次使用时进行水平测试，了解用户基础
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { Question, QuestionOption, QuestionType, SubjectInfo } from '../common/types/QuestionTypes';
import { getSubjectShortName, getSubjectColor, SUBJECT_LIST } from '../data/SubjectData';
import { questionService } from '../services/QuestionService';
import { answerRecordService, AnswerRecordInput } from '../services/AnswerRecordService';
import { userService } from '../services/UserService';
import { AppConstants } from '../common/constants/AppConstants';
import { Logger } from '../common/utils/Logger';
import { onboardingService } from '../services/OnboardingService';

/**
 * 科目错题统计
 */
interface SubjectWrongStat {
  subjectId: string;
  shortName: string;
  color: string;
  wrongCount: number;
}

/**
 * 知识类型定义
 */
interface KnowledgeType {
  id: string;
  name: string;
  color: string;
}

// 知识类型列表
const KNOWLEDGE_TYPES: KnowledgeType[] = [
  { id: 'concept', name: '概念理解', color: '#1677FF' },
  { id: 'standard', name: '规范标准', color: '#722ED1' },
  { id: 'calculation', name: '计算应用', color: '#13C2C2' },
  { id: 'process', name: '工艺流程', color: '#FA8C16' },
  { id: 'safety', name: '安全规程', color: '#F5222D' },
  { id: 'equipment', name: '设备仪器', color: '#52C41A' },
  { id: 'material', name: '材料性能', color: '#EB2F96' },
  { id: 'method', name: '检测方法', color: '#2F54EB' },
  { id: 'quality', name: '质量控制', color: '#FAAD14' },
  { id: 'analysis', name: '数据分析', color: '#A0D911' }
];

/**
 * 用户等级定义
 */
interface UserLevel {
  title: string;
  description: string;
  emoji: string;
  color: string;
}

// 根据正确率获取用户等级
function getUserLevel(correctRate: number): UserLevel {
  if (correctRate >= 0.8) {
    return {
      title: '水利专家',
      description: '您的水利知识储备非常扎实，继续保持！',
      emoji: '🏆',
      color: '#FFD700'
    };
  } else if (correctRate >= 0.6) {
    return {
      title: '水利老手',
      description: '您已经有不错的基础，再接再厉！',
      emoji: '⭐',
      color: '#1677FF'
    };
  } else {
    return {
      title: '水利学员',
      description: '每个专家都是从学员开始的，加油！',
      emoji: '🌱',
      color: '#52C41A'
    };
  }
}

@Entry
@Component
struct EntryTestPage {
  @State currentIndex: number = 0;
  @State questions: Question[] = [];
  @State userAnswers: Map<string, string> = new Map();
  @State answerResultMap: Map<string, boolean> = new Map();
  @State showAnswer: boolean = false;
  @State selectedOptions: string[] = [];
  @State isLoading: boolean = true;
  @State currentQuestion: Question | null = null;
  @State showResult: boolean = false;
  @State weakSubjects: SubjectWrongStat[] = [];
  @State showWelcome: boolean = true;
  @State questionKnowledgeTypes: Map<string, string> = new Map();

  private readonly TEST_COUNT: number = 10; // 测试题目数量改为10题

  aboutToAppear(): void {
    // 不自动加载，等用户点击开始测试
  }

  /**
   * 开始测试
   */
  private startTest(): void {
    this.showWelcome = false;
    this.loadTestQuestions();
  }

  /**
   * 加载测试题目 - 每个科目随机抽取题目，并分配知识类型
   */
  private async loadTestQuestions(): Promise<void> {
    try {
      const allQuestions: Question[] = [];
      const questionsPerSubject = Math.ceil(this.TEST_COUNT / SUBJECT_LIST.length);

      // 从每个科目随机抽取题目
      for (const subject of SUBJECT_LIST) {
        const questions = await questionService.getQuestions({
          subjectId: subject.id,
          random: true,
          limit: questionsPerSubject
        });
        allQuestions.push(...questions);
      }

      // 打乱顺序并取前10题
      this.questions = this.shuffleArray(allQuestions).slice(0, this.TEST_COUNT);

      // 为每道题分配知识类型
      this.questions.forEach((q: Question, index: number) => {
        const typeIndex = index % KNOWLEDGE_TYPES.length;
        this.questionKnowledgeTypes.set(q.id, KNOWLEDGE_TYPES[typeIndex].id);
      });

      if (this.questions.length > 0) {
        this.currentQuestion = this.questions[0];
      }

      Logger.info(`[EntryTestPage] Loaded ${this.questions.length} test questions`);
    } catch (error) {
      Logger.error('[EntryTestPage] Failed to load questions', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  private shuffleArray<T>(array: T[]): T[] {
    const result = [...array];
    for (let i = result.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      const temp = result[i];
      result[i] = result[j];
      result[j] = temp;
    }
    return result;
  }

  /**
   * 获取题目的知识类型
   */
  private getQuestionKnowledgeType(questionId: string): KnowledgeType {
    const typeId = this.questionKnowledgeTypes.get(questionId) || 'concept';
    return KNOWLEDGE_TYPES.find((t: KnowledgeType) => t.id === typeId) || KNOWLEDGE_TYPES[0];
  }

  private selectOption(optionKey: string): void {
    if (this.showAnswer) return;
    const question = this.currentQuestion;
    if (!question) return;

    if (question.type === QuestionType.SINGLE || question.type === QuestionType.JUDGE) {
      this.selectedOptions = [optionKey];
      this.submitAnswer();
    } else if (question.type === QuestionType.MULTIPLE) {
      const index = this.selectedOptions.indexOf(optionKey);
      if (index > -1) {
        this.selectedOptions = this.selectedOptions.filter((item: string) => item !== optionKey);
      } else {
        this.selectedOptions = [...this.selectedOptions, optionKey];
      }
    }
  }

  private async submitAnswer(): Promise<void> {
    if (this.selectedOptions.length === 0) return;
    const question = this.currentQuestion;
    if (!question) return;

    const userAnswer = [...this.selectedOptions].sort().join(',');
    this.userAnswers.set(question.id, userAnswer);
    const isCorrect = userAnswer === question.answer;
    this.answerResultMap.set(question.id, isCorrect);

    // 保存答题记录
    try {
      const recordInput: AnswerRecordInput = {
        questionId: question.id,
        userAnswer: userAnswer,
        isCorrect: isCorrect,
        answerTime: 0,
        createTime: Date.now()
      };
      await answerRecordService.saveAnswerRecord(recordInput);
    } catch (error) {
      Logger.error('[EntryTestPage] Failed to save answer', error as Error);
    }

    this.showAnswer = true;
  }

  private nextQuestion(): void {
    if (this.currentIndex < this.questions.length - 1) {
      this.currentIndex++;
      this.currentQuestion = this.questions[this.currentIndex];
      this.selectedOptions = [];
      this.showAnswer = false;
    } else {
      // 测试完成
      this.finishTest();
    }
  }

  private async finishTest(): Promise<void> {
    // 计算结果
    const correctCount = this.getCorrectCount();
    const accuracy = Math.round(correctCount / this.questions.length * 100);
    const correctRate = correctCount / this.questions.length;
    const userLevel = getUserLevel(correctRate);

    // 计算薄弱科目
    this.weakSubjects = this.calculateWeakSubjects();

    // 保存测试结果和用户称号
    await userService.saveEntryTestResult(correctCount, accuracy, userLevel.title);
    await userService.updateNickname(userLevel.title);
    await userService.markEntryTestCompleted();

    this.showResult = true;
  }

  private getCorrectCount(): number {
    let count = 0;
    this.answerResultMap.forEach((isCorrect: boolean) => {
      if (isCorrect) count++;
    });
    return count;
  }

  private calculateWeakSubjects(): SubjectWrongStat[] {
    const subjectWrongMap: Map<string, number> = new Map();

    this.answerResultMap.forEach((isCorrect: boolean, questionId: string) => {
      if (!isCorrect) {
        const question = this.questions.find((q: Question) => q.id === questionId);
        if (question) {
          const count = subjectWrongMap.get(question.subjectId) || 0;
          subjectWrongMap.set(question.subjectId, count + 1);
        }
      }
    });

    const result: SubjectWrongStat[] = [];
    subjectWrongMap.forEach((wrongCount: number, subjectId: string) => {
      const subject = SUBJECT_LIST.find((s: SubjectInfo) => s.id === subjectId);
      if (subject) {
        result.push({
          subjectId: subjectId,
          shortName: subject.shortName,
          color: subject.color,
          wrongCount: wrongCount
        });
      }
    });

    result.sort((a: SubjectWrongStat, b: SubjectWrongStat) => b.wrongCount - a.wrongCount);
    return result.slice(0, 3);
  }

  private isOptionCorrect(optionKey: string): boolean {
    if (!this.currentQuestion) return false;
    return this.currentQuestion.answer.split(',').includes(optionKey);
  }

  private isAnswerCorrect(): boolean {
    if (!this.currentQuestion) return false;
    const userAnswer = [...this.selectedOptions].sort().join(',');
    return userAnswer === this.currentQuestion.answer;
  }

  private getQuestionTypeName(type: QuestionType): string {
    switch (type) {
      case QuestionType.SINGLE: return '单选题';
      case QuestionType.MULTIPLE: return '多选题';
      case QuestionType.JUDGE: return '判断题';
      default: return '未知';
    }
  }

  /**
   * 获取鼓励语
   */
  private getEncouragementText(): string {
    const correctCount = this.getCorrectCount();
    const answeredCount = this.currentIndex + 1;
    const rate = correctCount / answeredCount;

    if (rate >= 0.8) {
      const texts = ['太棒了！继续保持！', '你真厉害！', '完美表现！', '知识储备很扎实！'];
      return texts[Math.floor(Math.random() * texts.length)];
    } else if (rate >= 0.6) {
      const texts = ['不错哦，继续加油！', '稳扎稳打！', '很有潜力！', '再接再厉！'];
      return texts[Math.floor(Math.random() * texts.length)];
    } else {
      const texts = ['别灰心，这只是开始！', '错题是最好的老师！', '每一步都是进步！', '坚持就是胜利！'];
      return texts[Math.floor(Math.random() * texts.length)];
    }
  }

  build() {
    Stack() {
      Column() {
        if (this.showWelcome) {
          this.WelcomeView()
        } else if (this.isLoading) {
          this.LoadingView()
        } else if (this.showResult) {
          this.ResultView()
        } else if (this.currentQuestion) {
          this.TestView()
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor(ThemeColors.BACKGROUND)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  WelcomeView() {
    Stack() {
      // 背景图
      Image($r('app.media.CardBackground'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      // 渐变遮罩
      Column()
        .width('100%')
        .height('100%')
        .linearGradient({
          direction: GradientDirection.Bottom,
          colors: [['rgba(22, 119, 255, 0.85)', 0], ['rgba(22, 119, 255, 0.95)', 1]]
        })

      // 内容
      Column() {
        Column() {
          Text('👋')
            .fontSize(64)
        }
        .width(120)
        .height(120)
        .borderRadius(60)
        .backgroundColor('rgba(255, 255, 255, 0.2)')
        .justifyContent(FlexAlign.Center)
        .margin({ top: 80 })

        Text('欢迎来到水利刷题宝！')
          .fontSize(26)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.WHITE)
          .margin({ top: 24 })

        Text('很高兴认识你，让我们开始一段精彩的学习之旅')
          .fontSize(15)
          .fontColor('rgba(255, 255, 255, 0.9)')
          .margin({ top: 8 })

        // 测试说明卡片
        Column() {
          Row() {
            Text('📝')
              .fontSize(24)
            Text('水平测试')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor(ThemeColors.TEXT_PRIMARY)
              .margin({ left: 8 })
          }
          .width('100%')
          .margin({ bottom: 16 })

          Text('在开始学习之前，我们需要了解一下你的水利知识水平，这将帮助我们：')
            .fontSize(14)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .lineHeight(22)

          Column() {
            this.WelcomeFeatureItem('🎯', '精准定位你的知识薄弱点')
            this.WelcomeFeatureItem('📚', '为你智能推荐学习内容')
            this.WelcomeFeatureItem('📊', '建立初始错题数据库')
            this.WelcomeFeatureItem('🏅', '获得专属学习称号')
          }
          .width('100%')
          .margin({ top: 12 })
          .alignItems(HorizontalAlign.Start)

          Row() {
            Text('⏱️')
              .fontSize(14)
            Text('共10道题，约需3分钟')
              .fontSize(13)
              .fontColor(ThemeColors.TEXT_HINT)
              .margin({ left: 4 })
          }
          .margin({ top: 16 })
          .padding({ left: 12, right: 12, top: 6, bottom: 6 })
          .backgroundColor(ThemeColors.GRAY_100)
          .borderRadius(12)
        }
        .width('100%')
        .padding(20)
        .margin({ top: 32 })
        .backgroundColor(ThemeColors.WHITE)
        .borderRadius(16)

        Blank()

        // 开始按钮
        Button('开始水平测试')
          .width('100%')
          .height(52)
          .fontSize(17)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.PRIMARY)
          .backgroundColor(ThemeColors.WHITE)
          .borderRadius(26)
          .margin({ bottom: 40 })
          .onClick(() => this.startTest())
      }
      .width('100%')
      .height('100%')
      .padding({ left: 24, right: 24 })
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  WelcomeFeatureItem(emoji: string, text: string) {
    Row() {
      Text(emoji)
        .fontSize(16)
      Text(text)
        .fontSize(14)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ left: 8 })
    }
    .width('100%')
    .margin({ top: 8 })
  }

  @Builder
  LoadingView() {
    Column() {
      LoadingProgress().width(48).height(48).color(ThemeColors.PRIMARY)
      Text('正在为你准备测试题目...')
        .fontSize(14)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: 16 })
      Text('请稍候 ☕')
        .fontSize(12)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: 8 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  TestView() {
    Column() {
      // 顶部进度
      Row() {
        Text('水平测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Blank()

        Text(`${this.currentIndex + 1}/${this.questions.length}`)
          .fontSize(14)
          .fontColor(ThemeColors.TEXT_SECONDARY)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: AppConstants.STATUS_BAR_HEIGHT + 8, bottom: 8 })

      // 进度条
      Row() {
        Progress({ value: this.currentIndex + 1, total: this.questions.length })
          .width('100%')
          .height(4)
          .color(ThemeColors.PRIMARY)
          .backgroundColor(ThemeColors.GRAY_200)
      }
      .width('100%')
      .padding({ left: 16, right: 16 })

      // 题目内容
      Scroll() {
        Column() {
          // 题型、科目和知识类型标签
          Row() {
            Text(this.getQuestionTypeName(this.currentQuestion!.type))
              .fontSize(11)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 8, right: 8, top: 3, bottom: 3 })
              .backgroundColor(ThemeColors.PRIMARY)
              .borderRadius(8)

            Text(getSubjectShortName(this.currentQuestion!.subjectId))
              .fontSize(11)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 8, right: 8, top: 3, bottom: 3 })
              .backgroundColor(getSubjectColor(this.currentQuestion!.subjectId))
              .borderRadius(8)
              .margin({ left: 8 })

            // 知识类型标签
            Text(this.getQuestionKnowledgeType(this.currentQuestion!.id).name)
              .fontSize(11)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 8, right: 8, top: 3, bottom: 3 })
              .backgroundColor(this.getQuestionKnowledgeType(this.currentQuestion!.id).color)
              .borderRadius(8)
              .margin({ left: 8 })
          }
          .width('100%')

          // 题目
          Text(this.currentQuestion!.content)
            .fontSize(16)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .lineHeight(24)
            .margin({ top: 16 })

          // 选项
          ForEach(this.currentQuestion!.options, (option: QuestionOption) => {
            this.OptionItem(option)
          })

          // 答案解析
          if (this.showAnswer) {
            this.AnswerAnalysis()
          }
        }
        .width('100%')
        .padding(16)
        .alignItems(HorizontalAlign.Start)
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)

      // 底部按钮
      if (this.showAnswer) {
        Row() {
          Button(this.currentIndex < this.questions.length - 1 ? '下一题' : '查看结果')
            .width('100%')
            .height(48)
            .fontSize(16)
            .fontColor(ThemeColors.WHITE)
            .backgroundColor(ThemeColors.PRIMARY)
            .borderRadius(24)
            .onClick(() => this.nextQuestion())
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 24 })
      } else if (this.currentQuestion?.type === QuestionType.MULTIPLE && this.selectedOptions.length > 0) {
        Row() {
          Button('确认答案')
            .width('100%')
            .height(48)
            .fontSize(16)
            .fontColor(ThemeColors.WHITE)
            .backgroundColor(ThemeColors.PRIMARY)
            .borderRadius(24)
            .onClick(() => this.submitAnswer())
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 24 })
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  OptionItem(option: QuestionOption) {
    Row() {
      Column() {
        Text(option.key)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.getOptionKeyColor(option.key))
      }
      .width(28)
      .height(28)
      .borderRadius(14)
      .backgroundColor(this.getOptionKeyBgColor(option.key))
      .justifyContent(FlexAlign.Center)

      Text(option.content)
        .fontSize(14)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .margin({ left: 12 })

      if (this.showAnswer) {
        if (this.isOptionCorrect(option.key)) {
          Text('✓').fontSize(16).fontColor(ThemeColors.SUCCESS)
        } else if (this.selectedOptions.includes(option.key)) {
          Text('✗').fontSize(16).fontColor(ThemeColors.ERROR)
        }
      }
    }
    .width('100%')
    .padding(12)
    .margin({ top: 10 })
    .backgroundColor(this.getOptionBgColor(option.key))
    .borderRadius(10)
    .border({ width: 1, color: this.getOptionBorderColor(option.key) })
    .onClick(() => this.selectOption(option.key))
  }

  private getOptionKeyColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) return ThemeColors.WHITE;
      if (this.selectedOptions.includes(key)) return ThemeColors.WHITE;
    } else if (this.selectedOptions.includes(key)) {
      return ThemeColors.WHITE;
    }
    return ThemeColors.TEXT_SECONDARY;
  }

  private getOptionKeyBgColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) return ThemeColors.SUCCESS;
      if (this.selectedOptions.includes(key)) return ThemeColors.ERROR;
    } else if (this.selectedOptions.includes(key)) {
      return ThemeColors.PRIMARY;
    }
    return ThemeColors.GRAY_100;
  }

  private getOptionBgColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) return 'rgba(82, 196, 26, 0.1)';
      if (this.selectedOptions.includes(key)) return 'rgba(255, 77, 79, 0.1)';
    }
    return ThemeColors.SURFACE;
  }

  private getOptionBorderColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) return ThemeColors.SUCCESS;
      if (this.selectedOptions.includes(key)) return ThemeColors.ERROR;
    } else if (this.selectedOptions.includes(key)) {
      return ThemeColors.PRIMARY;
    }
    return ThemeColors.BORDER;
  }

  @Builder
  AnswerAnalysis() {
    Column() {
      Row() {
        Column() {
          Text(this.isAnswerCorrect() ? '✓' : '✗')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.WHITE)
        }
        .width(40)
        .height(40)
        .borderRadius(20)
        .backgroundColor(this.isAnswerCorrect() ? ThemeColors.SUCCESS : ThemeColors.ERROR)
        .justifyContent(FlexAlign.Center)

        Column() {
          Text(this.isAnswerCorrect() ? '回答正确！' : '回答错误')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.isAnswerCorrect() ? ThemeColors.SUCCESS : ThemeColors.ERROR)

          Text(this.getEncouragementText())
            .fontSize(12)
            .fontColor(ThemeColors.TEXT_HINT)
            .margin({ top: 2 })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 12 })
      }
      .width('100%')
      .padding(12)
      .backgroundColor(this.isAnswerCorrect() ? 'rgba(82, 196, 26, 0.1)' : 'rgba(255, 77, 79, 0.1)')
      .borderRadius(10)

      if (this.currentQuestion?.analysis) {
        Column() {
          Text('💡 解析')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.TEXT_PRIMARY)

          Text(this.currentQuestion.analysis)
            .fontSize(13)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .lineHeight(20)
            .margin({ top: 8 })
        }
        .width('100%')
        .padding(12)
        .margin({ top: 10 })
        .backgroundColor(ThemeColors.SURFACE)
        .borderRadius(10)
        .alignItems(HorizontalAlign.Start)
      }
    }
    .width('100%')
    .margin({ top: 16 })
  }

  @Builder
  ResultView() {
    Scroll() {
      Column() {
        // 顶部称号卡片
        Column() {
          // 称号图标
          Column() {
            Text(getUserLevel(this.getCorrectCount() / this.questions.length).emoji)
              .fontSize(56)
          }
          .width(100)
          .height(100)
          .borderRadius(50)
          .backgroundColor(ThemeColors.WHITE)
          .justifyContent(FlexAlign.Center)
          .shadow({ radius: 16, color: 'rgba(0, 0, 0, 0.1)', offsetY: 4 })

          Text('恭喜你完成水平测试！')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .margin({ top: 20 })

          // 称号展示
          Row() {
            Text('你的称号')
              .fontSize(13)
              .fontColor(ThemeColors.TEXT_HINT)
          }
          .margin({ top: 8 })

          Text(getUserLevel(this.getCorrectCount() / this.questions.length).title)
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor(getUserLevel(this.getCorrectCount() / this.questions.length).color)
            .margin({ top: 4 })

          Text(getUserLevel(this.getCorrectCount() / this.questions.length).description)
            .fontSize(13)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .margin({ top: 8 })
            .textAlign(TextAlign.Center)
        }
        .width('100%')
        .padding({ top: AppConstants.STATUS_BAR_HEIGHT + 32, bottom: 24, left: 16, right: 16 })
        .alignItems(HorizontalAlign.Center)
        .linearGradient({
          direction: GradientDirection.Bottom,
          colors: [['#E8F4FF', 0], [ThemeColors.BACKGROUND, 1]]
        })

        // 成绩卡片
        Column() {
          Text('📊 测试成绩')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .width('100%')

          Row() {
            Column() {
              Text(`${this.getCorrectCount()}`)
                .fontSize(36)
                .fontWeight(FontWeight.Bold)
                .fontColor(ThemeColors.SUCCESS)
              Text('正确')
                .fontSize(12)
                .fontColor(ThemeColors.TEXT_HINT)
                .margin({ top: 4 })
            }
            .layoutWeight(1)

            Column() {
              Text(`${this.questions.length - this.getCorrectCount()}`)
                .fontSize(36)
                .fontWeight(FontWeight.Bold)
                .fontColor(ThemeColors.ERROR)
              Text('错误')
                .fontSize(12)
                .fontColor(ThemeColors.TEXT_HINT)
                .margin({ top: 4 })
            }
            .layoutWeight(1)

            Column() {
              Text(`${Math.round(this.getCorrectCount() / this.questions.length * 100)}%`)
                .fontSize(36)
                .fontWeight(FontWeight.Bold)
                .fontColor(ThemeColors.PRIMARY)
              Text('正确率')
                .fontSize(12)
                .fontColor(ThemeColors.TEXT_HINT)
                .margin({ top: 4 })
            }
            .layoutWeight(1)
          }
          .width('100%')
          .margin({ top: 20 })
        }
        .width('100%')
        .padding(20)
        .margin({ left: 16, right: 16 })
        .backgroundColor(ThemeColors.SURFACE)
        .borderRadius(16)

        // 薄弱科目
        if (this.weakSubjects.length > 0) {
          Column() {
            Text('📚 需要加强的科目')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor(ThemeColors.TEXT_PRIMARY)
              .width('100%')
              .margin({ bottom: 12 })

            ForEach(this.weakSubjects, (item: SubjectWrongStat) => {
              Row() {
                Row() {
                  Text('')
                    .width(4)
                    .height(16)
                    .backgroundColor(item.color)
                    .borderRadius(2)
                  Text(item.shortName)
                    .fontSize(14)
                    .fontColor(ThemeColors.TEXT_PRIMARY)
                    .margin({ left: 8 })
                }

                Blank()

                Text(`${item.wrongCount} 道错题`)
                  .fontSize(13)
                  .fontColor(ThemeColors.ERROR)
              }
              .width('100%')
              .padding(12)
              .margin({ bottom: 8 })
              .backgroundColor(ThemeColors.GRAY_50)
              .borderRadius(8)
            }, (item: SubjectWrongStat) => item.subjectId)
          }
          .width('100%')
          .padding(20)
          .margin({ top: 12, left: 16, right: 16 })
          .backgroundColor(ThemeColors.SURFACE)
          .borderRadius(16)
        }

        // 开始学习按钮
        Button('开启学习之旅 🚀')
          .width('100%')
          .height(52)
          .fontSize(17)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.PRIMARY)
          .borderRadius(26)
          .margin({ top: 24, left: 16, right: 16, bottom: 40 })
          .onClick(async () => {
            // 设置导引标记，进入主页后显示新手导引
            await onboardingService.setShowGuideAfterTest(true);
            Router.replace('pages/MainTabPage');
          })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .backgroundColor(ThemeColors.BACKGROUND)
  }
}
