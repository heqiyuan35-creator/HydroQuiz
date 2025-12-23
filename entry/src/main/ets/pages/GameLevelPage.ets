/**
 * 关卡答题页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { gameService } from '../services/GameService';
import { questionService } from '../services/QuestionService';
import { encouragementService } from '../services/EncouragementService';
import { GameLevel, GameResult, calculateStars } from '../common/types/GameTypes';
import { getLevelById, getChapterById } from '../data/GameLevelData';
import { Question, QuestionOption } from '../common/types/QuestionTypes';
import { ThemeColors } from '../theme/ThemeColors';
import { AppConstants } from '../common/constants/AppConstants';

@Entry
@Component
struct GameLevelPage {
  @State levelId: string = '';
  @State chapterId: string = '';
  @State level: GameLevel | null = null;
  @State questions: Question[] = [];
  @State currentIndex: number = 0;
  @State selectedAnswer: string = '';
  @State isAnswered: boolean = false;
  @State isCorrect: boolean = false;
  @State correctCount: number = 0;
  @State comboCount: number = 0;
  @State showEncouragement: boolean = false;
  @State encouragementText: string = '';
  @State isLoading: boolean = true;
  @State startTime: number = 0;
  @State showExitDialog: boolean = false;
  @State currentQuestion: Question | null = null;
  @State currentAnswer: string = '';
  // 动画状态
  @State optionScales: Map<string, number> = new Map();
  @State comboScale: number = 1;
  @State encouragementScale: number = 0;
  @State encouragementOpacity: number = 0;
  private encouragementTimer: number = -1;

  aboutToAppear(): void {
    const params: RouteParams = Router.getParams();
    this.levelId = params['levelId'] as string || '';
    this.chapterId = params['chapterId'] as string || '';
    this.startTime = Date.now();
    this.loadLevel();
  }

  async loadLevel(): Promise<void> {
    this.isLoading = true;
    try {
      const levelDef = getLevelById(this.levelId);
      if (levelDef) {
        this.level = levelDef;
        const chapter = getChapterById(this.chapterId);
        if (chapter) {
          // 从对应科目获取随机题目
          this.questions = await questionService.getRandomQuestions(
            chapter.subjectId,
            levelDef.questionCount
          );
          this.updateCurrentQuestion();
        }
      }
    } catch (error) {
      console.error('Load level failed:', error);
    }
    this.isLoading = false;
  }

  getCurrentQuestion(): Question | null {
    if (this.currentIndex < this.questions.length) {
      return this.questions[this.currentIndex];
    }
    return null;
  }

  updateCurrentQuestion(): void {
    if (this.currentIndex < this.questions.length) {
      this.currentQuestion = this.questions[this.currentIndex];
      this.currentAnswer = this.currentQuestion?.answer || '';
    } else {
      this.currentQuestion = null;
      this.currentAnswer = '';
    }
  }

  handleSelectAnswer(answer: string): void {
    if (this.isAnswered) return;

    // 选项点击动画
    this.optionScales.set(answer, 0.92);
    this.optionScales = new Map(this.optionScales);
    setTimeout(() => {
      this.optionScales.set(answer, 1);
      this.optionScales = new Map(this.optionScales);
    }, 150);

    this.selectedAnswer = answer;
    this.isAnswered = true;

    const question = this.getCurrentQuestion();
    if (question) {
      this.isCorrect = answer === question.answer;

      if (this.isCorrect) {
        this.correctCount++;
        this.comboCount++;

        // 连击数弹跳动画
        if (this.comboCount >= 3) {
          this.comboScale = 1.3;
          animateTo({ duration: 200, curve: Curve.EaseOut }, () => {
            this.comboScale = 1;
          });
        }

        // 显示鼓励语
        this.encouragementText = encouragementService.getCorrectEncouragement(this.comboCount);
        this.showEncouragement = true;
        // 鼓励语弹出动画
        this.encouragementScale = 0.5;
        this.encouragementOpacity = 0;
        animateTo({ duration: 250, curve: Curve.EaseOut }, () => {
          this.encouragementScale = 1;
          this.encouragementOpacity = 1;
        });
      } else {
        this.comboCount = 0;
        this.encouragementText = encouragementService.getWrongEncouragement();
        this.showEncouragement = true;
        // 鼓励语弹出动画
        this.encouragementScale = 0.5;
        this.encouragementOpacity = 0;
        animateTo({ duration: 250, curve: Curve.EaseOut }, () => {
          this.encouragementScale = 1;
          this.encouragementOpacity = 1;
        });
      }

      // 清除之前的定时器
      if (this.encouragementTimer !== -1) {
        clearTimeout(this.encouragementTimer);
      }
      // 1.5秒后隐藏鼓励语
      this.encouragementTimer = setTimeout(() => {
        animateTo({ duration: 200, curve: Curve.EaseIn }, () => {
          this.encouragementOpacity = 0;
          this.encouragementScale = 0.8;
        });
        setTimeout(() => {
          this.showEncouragement = false;
        }, 200);
        this.encouragementTimer = -1;
      }, 1300);
    }
  }

  handleNext(): void {
    // 切换题目时立即隐藏鼓励语
    this.showEncouragement = false;
    if (this.encouragementTimer !== -1) {
      clearTimeout(this.encouragementTimer);
      this.encouragementTimer = -1;
    }

    if (this.currentIndex < this.questions.length - 1) {
      this.currentIndex++;
      this.selectedAnswer = '';
      this.isAnswered = false;
      this.isCorrect = false;
      this.updateCurrentQuestion();
    } else {
      // 完成关卡
      this.finishLevel();
    }
  }

  async finishLevel(): Promise<void> {
    const duration = Math.floor((Date.now() - this.startTime) / 1000);
    const result = gameService.calculateResult(
      this.levelId,
      this.chapterId,
      this.questions.length,
      this.correctCount,
      duration
    );

    // 保存进度
    await gameService.saveLevelProgress(result);

    // 跳转到结果页
    const params: Record<string, Object> = {
      'result': JSON.stringify(result) as Object,
      'levelName': (this.level?.name || '') as Object
    };
    Router.replace('pages/GameResultPage', params);
  }

  @Builder
  buildHeader() {
    Row() {
      Image($r('app.media.back'))
        .width(24)
        .height(24)
        .fillColor('#333333')
        .onClick(() => {
          this.showExitDialog = true;
        })

      Column() {
        Text(this.level?.name || '关卡')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#333333')
        Text(`${this.currentIndex + 1}/${this.questions.length}`)
          .fontSize(12)
          .fontColor('#999999')
      }
      .layoutWeight(1)

      // 连击显示
      if (this.comboCount >= 3) {
        Row() {
          Text('🔥')
            .fontSize(16)
          Text(`${this.comboCount}连击`)
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor('#FF6B00')
            .margin({ left: 4 })
        }
        .padding({ left: 8, right: 8, top: 4, bottom: 4 })
        .backgroundColor('#FFF7E6')
        .borderRadius(12)
        .scale({ x: this.comboScale, y: this.comboScale })
      }
    }
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .backgroundColor(Color.White)
  }

  @Builder
  buildProgress() {
    Column() {
      Progress({ value: this.currentIndex + 1, total: this.questions.length })
        .width('100%')
        .height(4)
        .color(ThemeColors.PRIMARY)
        .backgroundColor('#E8E8E8')

      Row() {
        Text(`正确: ${this.correctCount}`)
          .fontSize(12)
          .fontColor('#52C41A')
        Blank()
        Text(`错误: ${this.currentIndex + (this.isAnswered ? 1 : 0) - this.correctCount}`)
          .fontSize(12)
          .fontColor('#FF4D4F')
      }
      .width('100%')
      .margin({ top: 8 })
    }
    .width('100%')
    .padding({ left: 16, right: 16, top: 8 })
  }

  @Builder
  buildQuestion() {
    Column() {
      if (this.currentQuestion !== null) {
        // 题目内容
        Text(this.currentQuestion.content)
          .fontSize(16)
          .fontColor('#333333')
          .lineHeight(24)
          .width('100%')

        // 选项列表
        Column() {
          ForEach(this.currentQuestion.options, (option: QuestionOption) => {
            this.buildOptionItem(option)
          }, (option: QuestionOption) => option.key)
        }
        .margin({ top: 24 })
      }
    }
    .width('100%')
    .padding(16)
  }

  @Builder
  buildOptionItem(option: QuestionOption) {
    Row() {
      // 选项字母
      Text(option.key)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor(this.getOptionLetterColor(option.key, this.currentAnswer))
        .width(24)
        .height(24)
        .textAlign(TextAlign.Center)
        .borderRadius(12)
        .backgroundColor(this.getOptionBgColor(option.key, this.currentAnswer))

      // 选项内容
      Text(option.content)
        .fontSize(14)
        .fontColor(this.getOptionTextColor(option.key, this.currentAnswer))
        .layoutWeight(1)
        .margin({ left: 12 })

      // 正确/错误标记
      if (this.isAnswered && option.key === this.currentAnswer) {
        Text('✓')
          .fontSize(16)
          .fontColor('#52C41A')
      }
      if (this.isAnswered && option.key === this.selectedAnswer && !this.isCorrect) {
        Text('✗')
          .fontSize(16)
          .fontColor('#FF4D4F')
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(this.getOptionCardBg(option.key, this.currentAnswer))
    .borderRadius(12)
    .border({
      width: 1,
      color: this.getOptionBorderColor(option.key, this.currentAnswer)
    })
    .margin({ top: 12 })
    .scale({ x: this.optionScales.get(option.key) ?? 1, y: this.optionScales.get(option.key) ?? 1 })
    .onClick(() => this.handleSelectAnswer(option.key))
  }

  getOptionLetterColor(optionKey: string, answer: string): ResourceColor {
    if (!this.isAnswered) {
      return this.selectedAnswer === optionKey ? Color.White : '#666666';
    }
    if (optionKey === answer) return Color.White;
    if (optionKey === this.selectedAnswer) return Color.White;
    return '#666666';
  }

  getOptionBgColor(optionKey: string, answer: string): ResourceColor {
    if (!this.isAnswered) {
      return this.selectedAnswer === optionKey ? ThemeColors.PRIMARY : '#F5F5F5';
    }
    if (optionKey === answer) return '#52C41A';
    if (optionKey === this.selectedAnswer) return '#FF4D4F';
    return '#F5F5F5';
  }

  getOptionTextColor(optionKey: string, answer: string): ResourceColor {
    if (!this.isAnswered) return '#333333';
    if (optionKey === answer) return '#52C41A';
    if (optionKey === this.selectedAnswer && !this.isCorrect) return '#FF4D4F';
    return '#333333';
  }

  getOptionCardBg(optionKey: string, answer: string): ResourceColor {
    if (!this.isAnswered) return Color.White;
    if (optionKey === answer) return '#F6FFED';
    if (optionKey === this.selectedAnswer && !this.isCorrect) return '#FFF2F0';
    return Color.White;
  }

  getOptionBorderColor(optionKey: string, answer: string): ResourceColor {
    if (!this.isAnswered) {
      return this.selectedAnswer === optionKey ? ThemeColors.PRIMARY : '#E8E8E8';
    }
    if (optionKey === answer) return '#52C41A';
    if (optionKey === this.selectedAnswer && !this.isCorrect) return '#FF4D4F';
    return '#E8E8E8';
  }

  @Builder
  buildBottomBar() {
    Row() {
      if (this.isAnswered) {
        Button(this.currentIndex < this.questions.length - 1 ? '下一题' : '完成')
          .width('100%')
          .height(48)
          .fontSize(16)
          .backgroundColor(ThemeColors.PRIMARY)
          .onClick(() => this.handleNext())
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
  }

  @Builder
  buildEncouragement() {
    if (this.showEncouragement) {
      Column() {
        Text(this.isCorrect ? '✓' : '✗')
          .fontSize(48)
          .fontColor(this.isCorrect ? '#52C41A' : '#FF4D4F')

        Text(this.encouragementText)
          .fontSize(16)
          .fontColor('#333333')
          .margin({ top: 12 })
          .textAlign(TextAlign.Center)
      }
      .width(200)
      .padding(24)
      .backgroundColor(Color.White)
      .borderRadius(16)
      .shadow({ radius: 20, color: 'rgba(0,0,0,0.1)' })
      .position({ x: '50%', y: '40%' })
      .translate({ x: '-50%', y: '-50%' })
      .scale({ x: this.encouragementScale, y: this.encouragementScale })
      .opacity(this.encouragementOpacity)
    }
  }

  @Builder
  buildExitDialog() {
    if (this.showExitDialog) {
      Column() {
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(0,0,0,0.5)')
          .onClick(() => {
            this.showExitDialog = false;
          })

        Column() {
          Text('确定退出？')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor('#333333')

          Text('退出后当前进度将不会保存')
            .fontSize(14)
            .fontColor('#666666')
            .margin({ top: 8 })

          Row() {
            Button('继续答题')
              .layoutWeight(1)
              .height(44)
              .fontSize(16)
              .backgroundColor('#F5F5F5')
              .fontColor('#666666')
              .onClick(() => {
                this.showExitDialog = false;
              })

            Button('确定退出')
              .layoutWeight(1)
              .height(44)
              .fontSize(16)
              .backgroundColor(ThemeColors.PRIMARY)
              .margin({ left: 12 })
              .onClick(() => {
                Router.back();
              })
          }
          .width('100%')
          .margin({ top: 24 })
        }
        .width('85%')
        .padding(24)
        .backgroundColor(Color.White)
        .borderRadius(16)
        .position({ x: '7.5%', y: '35%' })
      }
      .width('100%')
      .height('100%')
      .position({ x: 0, y: 0 })
    }
  }

  build() {
    Stack() {
      Column() {
        this.buildHeader()
        this.buildProgress()

        Scroll() {
          this.buildQuestion()
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .align(Alignment.Top)

        this.buildBottomBar()
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F5F5F5')
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT })

      this.buildEncouragement()
      this.buildExitDialog()
    }
    .width('100%')
    .height('100%')
  }
}
