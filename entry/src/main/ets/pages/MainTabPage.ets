/**
 * 主Tab页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { Router, RouteParams } from '../router/Router';
import { answerRecordService, ExamRecord, TodayStatistics } from '../services/AnswerRecordService';
import { questionBankService, SubjectStats } from '../services/QuestionBankService';
import { AppConstants } from '../common/constants/AppConstants';
import { userService, UserInfo } from '../services/UserService';
import { widgetDataService } from '../services/WidgetDataService';
import { databaseService } from '../data/database/DatabaseService';
import { TipsDialog } from '@kit.ArkUI';
import { KnowledgeService } from '../services/KnowledgeService';
import { KnowledgeArticle, KnowledgeSubject, KnowledgeCategory, ContentType } from '../common/types/KnowledgeTypes';
import { achievementNotificationService, AchievementUnlockCallback } from '../services/AchievementNotificationService';
import { Achievement } from '../services/AchievementService';
import { smartRecommendService, RecommendCard, SubjectProgress, RecommendType } from '../services/SmartRecommendService';

/**
 * Tab项配置接口
 */
interface TabItem {
  title: string;
  icon: string;
  iconSelected: string;
}

// TodayStatistics 从 AnswerRecordService 导入

/**
 * 题型筛选类型
 */
type QuestionFilterType = 'all' | 'single' | 'multiple' | 'judge';

@Entry
@Component
struct MainTabPage {
  @State currentIndex: number = 0;
  @State isDarkMode: boolean = false;
  @State todayStats: TodayStatistics = { total: 0, correct: 0, accuracy: 0, streak: 0 };
  @State wrongCount: number = 0;
  @State favoriteCount: number = 0;
  @State totalQuestionCount: number = 0;
  @State selectedFilter: QuestionFilterType = 'all';
  @State examRecords: ExamRecord[] = [];
  @State examCount: number = 0;
  @State userInfo: UserInfo = { nickname: '水利学员', gender: 'male', userId: '', status: '水利检测员备考中' };
  @State examDate: number = Date.now() + 30 * 24 * 60 * 60 * 1000;
  @State daysUntilExam: number = 30;
  @State showDatePicker: boolean = false;
  @State selectedDate: Date = new Date(Date.now() + 30 * 24 * 60 * 60 * 1000);
  @State dailyGoal: number = 50;
  @State weeklyPlanDays: number[] = [1, 2, 3, 4, 5, 6, 7];
  @State hasCheckedIn: boolean = false;
  @State showCheckInSuccess: boolean = false;
  // 科目列表（从题库服务获取）
  @State subjectList: SubjectStats[] = [];
  // 总体进度（已完成的不重复题目数）
  @State completedQuestionCount: number = 0;
  // 知识库相关状态
  @State selectedKnowledgeCategory: string = '全部';
  @State knowledgeSubjects: KnowledgeSubject[] = [];
  @State allKnowledgeArticles: KnowledgeArticle[] = [];
  @State knowledgeSearchText: string = '';
  @State expandedSubjects: Set<string> = new Set<string>();
  @State expandedCategories: Set<string> = new Set<string>();
  // 成就解锁弹窗状态
  @State showAchievementDialog: boolean = false;
  @State unlockedAchievement: Achievement | null = null;
  // 智能推荐相关状态
  @State recommendCards: RecommendCard[] = [];
  @State subjectProgressList: SubjectProgress[] = [];
  private knowledgeService: KnowledgeService = KnowledgeService.getInstance();
  private achievementCallback: AchievementUnlockCallback | null = null;

  private tabList: TabItem[] = [
    { title: '首页', icon: 'Home', iconSelected: 'HomeSelected' },
    { title: '题库', icon: 'Questionbank', iconSelected: 'Questionbankselected' },
    { title: '知识库', icon: 'KnowledgeBase', iconSelected: 'Knowledgebaseselected' },
    { title: '我的', icon: 'My', iconSelected: 'Myselection' }
  ];

  private tabController: TabsController = new TabsController();

  // 未达标提示弹框
  checkInTipsDialog: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('app.media.Questionbank'),
      title: '还差一点点~',
      content: `今日目标 ${this.dailyGoal} 题，你已完成 ${this.todayStats.total} 题，再做 ${this.dailyGoal - this.todayStats.total} 题就能打卡啦！`,
      primaryButton: {
        value: '继续加油',
        action: () => {
          Router.goToPractice(undefined, 'sequence');
        },
      },
      secondaryButton: {
        value: '稍后再说',
        action: () => {
          // 关闭弹框
        },
      },
    }),
  });

  aboutToAppear(): void {
    // 获取路由参数中的初始Tab
    const params: RouteParams = Router.getParams();
    if (params['initialTab'] !== undefined) {
      this.currentIndex = params['initialTab'] as number;
    }

    // 注册成就解锁通知监听
    this.achievementCallback = (achievement: Achievement) => {
      this.unlockedAchievement = achievement;
      this.showAchievementDialog = true;
    };
    achievementNotificationService.register(this.achievementCallback);

    // 加载统计数据
    this.loadStatistics();
  }

  aboutToDisappear(): void {
    // 取消成就通知监听
    if (this.achievementCallback) {
      achievementNotificationService.unregister(this.achievementCallback);
      this.achievementCallback = null;
    }
  }

  onPageShow(): void {
    // 页面显示时刷新统计数据
    this.loadStatistics();
  }


  /**
   * 加载统计数据
   */
  private async loadStatistics(): Promise<void> {
    try {
      // 等待数据库初始化完成（最多等待10秒）
      const isReady = await databaseService.waitForReady(10000);
      if (!isReady) {
        // 数据库未就绪，使用默认值
        return;
      }

      this.todayStats = await answerRecordService.getTodayStatistics();
      this.wrongCount = await answerRecordService.getWrongQuestionCount();
      this.favoriteCount = await answerRecordService.getFavoriteCount();
      this.examRecords = await answerRecordService.getExamRecords(5);
      this.examCount = await answerRecordService.getExamRecordCount();
      this.userInfo = await userService.getUserInfo();
      // 加载考试日期
      this.examDate = await userService.getExamDate();
      this.daysUntilExam = userService.calculateDaysUntilExam(this.examDate);
      this.selectedDate = new Date(this.examDate);
      // 加载每日目标
      this.dailyGoal = await userService.getDailyGoal();
      // 加载今日打卡状态
      this.hasCheckedIn = await userService.hasCheckedInToday();
      // 加载周计划
      this.weeklyPlanDays = await userService.getWeeklyPlanDays();
      // 加载科目列表（含题目数量）- 使用统一的题库服务，强制刷新
      const stats = await questionBankService.getQuestionBankStats(true);
      this.subjectList = stats.subjects;
      this.totalQuestionCount = stats.totalCount;
      // 加载总体进度（已完成的不重复题目数）
      this.completedQuestionCount = await answerRecordService.getCompletedQuestionCount();

      // 加载知识库数据
      this.knowledgeSubjects = this.knowledgeService.getSubjects();
      this.allKnowledgeArticles = this.knowledgeService.getAllArticles();

      // 加载智能推荐数据
      this.recommendCards = await smartRecommendService.getTodayRecommendCards();
      this.subjectProgressList = await smartRecommendService.getAllSubjectProgress();
    } catch (error) {
      // 忽略错误，使用默认值
    }
  }

  /**
   * 获取头像资源
   */
  private getAvatarResource(): Resource {
    return this.userInfo.gender === 'male' ? $r('app.media.Maleavatar') : $r('app.media.Femaleavatar');
  }

  /**
   * 构建Tab栏项
   */
  @Builder
  TabBarBuilder(item: TabItem, index: number) {
    Column() {
      // 图标
      Image(this.getTabIconResource(index))
        .width(24)
        .height(24)

      // 标题
      Text(item.title)
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(this.currentIndex === index ? ThemeColors.PRIMARY : ThemeColors.TEXT_HINT)
        .margin({ top: ThemeConstants.SPACING_XXS })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = index;
      this.tabController.changeIndex(index);
    })
  }

  /**
   * 获取Tab图标资源
   */
  private getTabIconResource(index: number): Resource {
    const isSelected = this.currentIndex === index;
    if (index === 0) {
      return isSelected ? $r('app.media.HomeSelected') : $r('app.media.Home');
    } else if (index === 1) {
      return isSelected ? $r('app.media.Questionbankselected') : $r('app.media.Questionbank');
    } else if (index === 2) {
      return isSelected ? $r('app.media.Knowledgebaseselected') : $r('app.media.KnowledgeBase');
    } else {
      return isSelected ? $r('app.media.Myselection') : $r('app.media.My');
    }
  }


  build() {
    Stack() {
      Column() {
        Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
          // 首页Tab
          TabContent() {
            this.HomeContent()
          }
          .tabBar(this.TabBarBuilder(this.tabList[0], 0))

          // 题库Tab
          TabContent() {
            this.QuestionBankContent()
          }
          .tabBar(this.TabBarBuilder(this.tabList[1], 1))

          // 统计Tab
          TabContent() {
            this.StatisticsContent()
          }
          .tabBar(this.TabBarBuilder(this.tabList[2], 2))

          // 我的Tab
          TabContent() {
            this.ProfileContent()
          }
          .tabBar(this.TabBarBuilder(this.tabList[3], 3))
        }
        .barHeight(56)
        .barBackgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
        .onChange((index: number) => {
          this.currentIndex = index;
        })
      }
      .width('100%')
      .height('100%')
      .backgroundColor(this.isDarkMode ? ThemeColors.BACKGROUND_DARK : ThemeColors.BACKGROUND)
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT, bottom: AppConstants.BOTTOM_NAV_HEIGHT })

      // 日期选择弹窗
      if (this.showDatePicker) {
        this.DatePickerDialog()
      }

      // 打卡成功弹窗
      if (this.showCheckInSuccess) {
        this.CheckInSuccessDialog()
      }

      // 成就解锁弹窗
      if (this.showAchievementDialog && this.unlockedAchievement) {
        this.AchievementUnlockDialog()
      }
    }
    .width('100%')
    .height('100%')
  }

  /**
   * 成就解锁弹窗
   */
  @Builder
  AchievementUnlockDialog() {
    Column() {
      // 遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.5)')
        .onClick(() => { this.showAchievementDialog = false; })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)

    // 弹框内容
    Column() {
      // 光效背景
      Column() {
        Text('🎉')
          .fontSize(48)
          .margin({ bottom: 8 })
        Text('成就解锁!')
          .fontSize(20).fontWeight(FontWeight.Bold).fontColor('#FFD700')
      }
      .width('100%')
      .padding({ top: 30, bottom: 20 })
      .linearGradient({
        angle: 180,
        colors: [['#667eea', 0], ['#764ba2', 1]]
      })
      .borderRadius({ topLeft: 20, topRight: 20 })

      // 成就信息
      Column() {
        Text(this.unlockedAchievement?.icon || '')
          .fontSize(56)
          .margin({ top: 20 })
        Text(this.unlockedAchievement?.name || '')
          .fontSize(22).fontWeight(FontWeight.Bold).fontColor(ThemeColors.TEXT_PRIMARY)
          .margin({ top: 12 })
        Text(this.unlockedAchievement?.description || '')
          .fontSize(14).fontColor(ThemeColors.TEXT_SECONDARY)
          .margin({ top: 8 })

        Button('太棒了!')
          .fontSize(16).fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.PRIMARY)
          .borderRadius(24).height(48).width('80%')
          .margin({ top: 30, bottom: 24 })
          .onClick(() => { this.showAchievementDialog = false; })
      }
      .width('100%')
      .backgroundColor(ThemeColors.WHITE)
      .borderRadius({ bottomLeft: 20, bottomRight: 20 })
    }
    .width('85%')
    .position({ x: '7.5%', y: '25%' })
    .shadow({ radius: 20, color: 'rgba(0,0,0,0.3)', offsetY: 10 })
  }


  /**
   * 日期选择弹窗
   */
  @Builder
  DatePickerDialog() {
    Column() {
      // 遮罩层
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('#00000066')
        .onClick(() => {
          this.showDatePicker = false;
        })
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })
    .justifyContent(FlexAlign.End)

    Column() {
      // 弹窗内容
      Column() {
        // 标题栏
        Row() {
          Text('取消')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .onClick(() => {
              this.showDatePicker = false;
            })

          Text('选择考试日期')
            .fontSize(ThemeConstants.FONT_SIZE_MD)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY)

          Text('确定')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.PRIMARY)
            .onClick(() => {
              this.examDate = this.selectedDate.getTime();
              this.daysUntilExam = userService.calculateDaysUntilExam(this.examDate);
              userService.saveExamDate(this.examDate);
              this.showDatePicker = false;
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD })

        // 日期选择器
        DatePicker({
          start: new Date(),
          end: new Date('2030-12-31'),
          selected: this.selectedDate
        })
          .width('100%')
          .height(200)
          .onChange((value: DatePickerResult) => {
            const year = value.year as number;
            const month = value.month as number;
            const day = value.day as number;
            this.selectedDate = new Date(year, month, day);
          })
      }
      .width('100%')
      .backgroundColor(ThemeColors.SURFACE)
      .borderRadius({ topLeft: 16, topRight: 16 })
      .padding({ bottom: ThemeConstants.SPACING_LG })
    }
    .width('100%')
    .position({ x: 0, y: 0 })
    .height('100%')
    .justifyContent(FlexAlign.End)
  }

  /**
   * 打卡成功弹窗
   */
  @Builder
  CheckInSuccessDialog() {
    Column() {
      // 遮罩层
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.5)')
        .onClick(() => {
          this.showCheckInSuccess = false;
        })
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })
    .justifyContent(FlexAlign.Center)

    // 弹窗内容
    Column() {
      // 顶部装饰
      Stack() {
        Column()
          .width(100)
          .height(100)
          .borderRadius(50)
          .linearGradient({
            angle: 135,
            colors: [[ThemeColors.SUCCESS, 0], ['#73D13D', 1]]
          })

        Text('🎉')
          .fontSize(48)
      }
      .margin({ top: -50 })

      Text('打卡成功！')
        .fontSize(ThemeConstants.FONT_SIZE_2XL)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ top: ThemeConstants.SPACING_LG })

      Text('今天的学习任务已完成')
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: ThemeConstants.SPACING_SM })

      Row() {
        Text('🔥')
          .fontSize(16)
        Text(' 继续保持，明天见！')
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.TEXT_HINT)
      }
      .margin({ top: ThemeConstants.SPACING_XS })

      Row() {
        Text('太棒了')
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.WHITE)
      }
      .width('85%')
      .height(48)
      .margin({ top: ThemeConstants.SPACING_XL })
      .borderRadius(ThemeConstants.RADIUS_LG)
      .justifyContent(FlexAlign.Center)
      .linearGradient({
        angle: 90,
        colors: [[ThemeColors.SUCCESS, 0], ['#73D13D', 1]]
      })
      .shadow({ radius: 8, color: 'rgba(82, 196, 26, 0.4)', offsetX: 0, offsetY: 4 })
      .onClick(() => {
        this.showCheckInSuccess = false;
      })
    }
    .width('85%')
    .padding({ left: ThemeConstants.SPACING_LG, right: ThemeConstants.SPACING_LG, top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_LG })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_XL)
    .shadow({ radius: 24, color: 'rgba(0,0,0,0.15)', offsetX: 0, offsetY: 12 })
    .position({ x: '7.5%', y: '28%' })
  }


  /**
   * 首页内容
   */
  @Builder
  HomeContent() {
    Scroll() {
      Column() {
        // 顶部用户问候区
        this.HomeHeader()

        // 考试倒计时卡片
        this.ExamCountdownCard()

        // 今日推荐（智能推荐模块）
        this.TodayRecommendSection()

        // 学习进度与打卡（合并）
        this.LearningAndCheckInSection()

        // 核心功能区
        this.CoreFunctionSection()
      }
      .padding({ bottom: ThemeConstants.SPACING_2XL })
    }
    .scrollBar(BarState.Off)
    .width('100%')
    .height('100%')
  }

  /**
   * 今日推荐模块
   */
  @Builder
  TodayRecommendSection() {
    Column() {
      // 标题
      Row() {
        Row() {
          Text('🎯')
            .fontSize(18)
          Text(' 今日推荐')
            .fontSize(ThemeConstants.FONT_SIZE_MD)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY)
        }

        Blank()

        Text('基于你的学习数据')
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })

      // 推荐卡片列表
      if (this.recommendCards.length > 0) {
        Row() {
          ForEach(this.recommendCards.slice(0, 2), (card: RecommendCard, index: number) => {
            this.RecommendCardItem(card)
          }, (card: RecommendCard) => card.type)
        }
        .width('100%')
        .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
        .margin({ top: ThemeConstants.SPACING_SM })
      }
    }
    .width('100%')
    .margin({ top: ThemeConstants.SPACING_MD })
  }

  /**
   * 推荐卡片项
   */
  @Builder
  RecommendCardItem(card: RecommendCard) {
    Column() {
      Row() {
        Column() {
          Text(card.icon)
            .fontSize(28)
        }
        .width(48)
        .height(48)
        .borderRadius(ThemeConstants.RADIUS_MD)
        .backgroundColor(card.color + '20')
        .justifyContent(FlexAlign.Center)

        Blank()

        Column() {
          Text(`${card.count}`)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(card.color)
          Text('题')
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_HINT)
        }
      }
      .width('100%')

      Text(card.title)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ top: ThemeConstants.SPACING_SM })

      Text(card.subtitle)
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: 4 })
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      // 开始按钮
      Row() {
        Text('开始练习')
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.WHITE)
      }
      .width('100%')
      .height(32)
      .margin({ top: ThemeConstants.SPACING_SM })
      .borderRadius(16)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(card.color)
      .onClick(() => {
        this.handleRecommendCardClick(card);
      })
    }
    .layoutWeight(1)
    .padding(ThemeConstants.SPACING_BASE)
    .margin({ left: 4, right: 4 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_LG)
    .border({ width: 1, color: ThemeColors.GRAY_200 })
    .shadow({ radius: 4, color: 'rgba(0,0,0,0.05)', offsetX: 0, offsetY: 2 })
  }

  /**
   * 处理推荐卡片点击
   */
  private handleRecommendCardClick(card: RecommendCard): void {
    const params: RouteParams = {};
    switch (card.type) {
      case RecommendType.WRONG_REVIEW:
        Router.goToWrongBook();
        break;
      case RecommendType.WEAK_POINT:
        if (card.subjectId) {
          Router.goToPractice(card.subjectId, 'sequence');
        } else {
          Router.goToPractice(undefined, 'sequence');
        }
        break;
      case RecommendType.NEW_LEARN:
      case RecommendType.DAILY_TASK:
      default:
        Router.goToPractice(undefined, 'sequence');
        break;
    }
  }

  /**
   * 首页顶部问候区
   */
  @Builder
  HomeHeader() {
    Row() {
      // 头像 - 添加渐变边框效果
      Stack() {
        // 渐变边框背景
        Column()
          .width(52)
          .height(52)
          .borderRadius(26)
          .linearGradient({
            angle: 135,
            colors: [[ThemeColors.PRIMARY, 0], [ThemeColors.SECONDARY, 1]]
          })

        // 头像
        Image(this.getAvatarResource())
          .width(48)
          .height(48)
          .borderRadius(24)
          .objectFit(ImageFit.Cover)
          .border({ width: 2, color: ThemeColors.WHITE })
      }

      // 问候语
      Column() {
        Row() {
          Text(this.getGreetingText())
            .fontSize(ThemeConstants.FONT_SIZE_SM)
            .fontColor(ThemeColors.TEXT_SECONDARY)

          Text(' 👋')
            .fontSize(14)
        }

        Text(`${this.userInfo.nickname}，加油！`)
          .fontSize(ThemeConstants.FONT_SIZE_XL)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .margin({ top: 4 })
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: ThemeConstants.SPACING_BASE })

      Blank()

      // 设置图标 - 添加背景
      Column() {
        Image($r('app.media.Settings'))
          .width(22)
          .height(22)
      }
      .width(40)
      .height(40)
      .borderRadius(20)
      .backgroundColor(ThemeColors.GRAY_100)
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        Router.goToSettings();
      })
    }
    .width('100%')
    .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_LG })
  }

  /**
   * 获取问候语
   */
  private getGreetingText(): string {
    const hour = new Date().getHours();
    if (hour < 6) {
      return '夜深了';
    } else if (hour < 9) {
      return '早上好';
    } else if (hour < 12) {
      return '上午好';
    } else if (hour < 14) {
      return '中午好';
    } else if (hour < 18) {
      return '下午好';
    } else if (hour < 22) {
      return '晚上好';
    } else {
      return '夜深了';
    }
  }


  /**
   * 考试倒计时卡片
   */
  @Builder
  ExamCountdownCard() {
    Stack() {
      // 背景图片
      Image($r('app.media.Wavebackground'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)
        .borderRadius(ThemeConstants.RADIUS_LG)

      // 渐变遮罩层
      Column()
        .width('100%')
        .height('100%')
        .borderRadius(ThemeConstants.RADIUS_LG)
        .linearGradient({
          angle: 135,
          colors: [['rgba(24, 144, 255, 0.85)', 0], ['rgba(114, 46, 209, 0.9)', 1]]
        })

      // 内容层
      Column() {
        // 上半部分 - 倒计时
        Row() {
          Column() {
            // 标签
            Row() {
              Text('🎯')
                .fontSize(14)
              Text(' 水利检测员资格考试')
                .fontSize(ThemeConstants.FONT_SIZE_SM)
                .fontColor(ThemeColors.WHITE)
                .opacity(0.95)
            }
            .padding({ left: 10, right: 10, top: 5, bottom: 5 })
            .backgroundColor('rgba(255,255,255,0.15)')
            .borderRadius(ThemeConstants.RADIUS_LG)

            // 倒计时数字
            Row() {
              Text('距考试')
                .fontSize(ThemeConstants.FONT_SIZE_BASE)
                .fontColor(ThemeColors.WHITE)
                .opacity(0.9)

              Text(`${this.daysUntilExam}`)
                .fontSize(56)
                .fontWeight(FontWeight.Bold)
                .fontColor(ThemeColors.WHITE)
                .margin({ left: 12, right: 4 })
                .textShadow({ radius: 8, color: 'rgba(0,0,0,0.3)', offsetX: 0, offsetY: 2 })

              Text('天')
                .fontSize(ThemeConstants.FONT_SIZE_LG)
                .fontColor(ThemeColors.WHITE)
                .opacity(0.9)
            }
            .margin({ top: ThemeConstants.SPACING_SM })
            .alignItems(VerticalAlign.Bottom)
          }
          .alignItems(HorizontalAlign.Start)

          Blank()

          // 右侧装饰
          Column() {
            Text('📚')
              .fontSize(48)
              .opacity(0.3)
          }
        }
        .width('100%')
        .padding({ left: ThemeConstants.SPACING_LG, right: ThemeConstants.SPACING_LG, top: ThemeConstants.SPACING_LG })

        Blank()

        // 下半部分 - 考试日期和编辑按钮
        Row() {
          Row() {
            Column() {
              Text('📅')
                .fontSize(16)
            }
            .width(28)
            .height(28)
            .borderRadius(14)
            .backgroundColor('rgba(255,255,255,0.15)')
            .justifyContent(FlexAlign.Center)

            Text(`${userService.formatExamDate(this.examDate)}`)
              .fontSize(ThemeConstants.FONT_SIZE_SM)
              .fontColor(ThemeColors.WHITE)
              .margin({ left: ThemeConstants.SPACING_SM })
          }

          Blank()

          Row() {
            Text('设置日期')
              .fontSize(ThemeConstants.FONT_SIZE_SM)
              .fontColor(ThemeColors.WHITE)
            Text(' →')
              .fontSize(ThemeConstants.FONT_SIZE_SM)
              .fontColor(ThemeColors.WHITE)
          }
          .padding({ left: 12, right: 12, top: 6, bottom: 6 })
          .backgroundColor('rgba(255,255,255,0.2)')
          .borderRadius(ThemeConstants.RADIUS_LG)
          .onClick(() => {
            this.showDatePicker = true;
          })
        }
        .width('100%')
        .padding({ left: ThemeConstants.SPACING_LG, right: ThemeConstants.SPACING_LG, top: 14, bottom: 14 })
        .backgroundColor('rgba(0,0,0,0.2)')
        .borderRadius({ bottomLeft: ThemeConstants.RADIUS_LG, bottomRight: ThemeConstants.RADIUS_LG })
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height(190)
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD })
    .borderRadius(ThemeConstants.RADIUS_LG)
    .shadow({ radius: 16, color: 'rgba(24, 144, 255, 0.25)', offsetX: 0, offsetY: 8 })
  }


  /**
   * 学习进度概览
   */
  @Builder
  LearningAndCheckInSection() {
    Column() {
      // 上半部分：三个统计卡片
      Row() {
        // 总掌握度 - 点击进入今日错题
        Column() {
          Stack() {
            // 背景圆环
            Progress({ value: this.todayStats.accuracy, total: 100, type: ProgressType.Ring })
              .width(50)
              .height(50)
              .color(ThemeColors.PRIMARY)
              .backgroundColor(ThemeColors.GRAY_200)
              .style({ strokeWidth: 5 })

            Text(`${this.todayStats.accuracy}%`)
              .fontSize(ThemeConstants.FONT_SIZE_SM)
              .fontWeight(FontWeight.Bold)
              .fontColor(ThemeColors.PRIMARY)
          }

          Text('掌握度')
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .margin({ top: ThemeConstants.SPACING_SM })
        }
        .layoutWeight(1)
        .padding({ top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_MD })
        .backgroundColor(ThemeColors.SURFACE)
        .borderRadius(ThemeConstants.RADIUS_MD)
        .justifyContent(FlexAlign.Center)
        .border({ width: 1, color: ThemeColors.GRAY_200 })
        .onClick(() => {
          const params: RouteParams = {};
          params['filter'] = 'today' as Object;
          Router.push('pages/WrongBookPage', params);
        })

        // 连续打卡
        Column() {
          Row() {
            Text('🔥')
              .fontSize(20)
            Text(`${this.isTodayChecked() ? 1 : 0}`)
              .fontSize(26)
              .fontWeight(FontWeight.Bold)
              .fontColor(ThemeColors.WARNING)
              .margin({ left: 4 })
            Text('天')
              .fontSize(ThemeConstants.FONT_SIZE_XS)
              .fontColor(ThemeColors.WARNING)
              .margin({ left: 2, bottom: 2 })
          }
          .alignItems(VerticalAlign.Bottom)

          Text('连续打卡')
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .margin({ top: ThemeConstants.SPACING_SM })
        }
        .layoutWeight(1)
        .padding({ top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_MD })
        .margin({ left: ThemeConstants.SPACING_SM })
        .backgroundColor(ThemeColors.SURFACE)
        .borderRadius(ThemeConstants.RADIUS_MD)
        .justifyContent(FlexAlign.Center)
        .border({ width: 1, color: ThemeColors.GRAY_200 })

        // 今日刷题
        Column() {
          Row() {
            Text('📝')
              .fontSize(20)
            Text(`${this.todayStats.total}`)
              .fontSize(26)
              .fontWeight(FontWeight.Bold)
              .fontColor(ThemeColors.SUCCESS)
              .margin({ left: 4 })
            Text('题')
              .fontSize(ThemeConstants.FONT_SIZE_XS)
              .fontColor(ThemeColors.SUCCESS)
              .margin({ left: 2, bottom: 2 })
          }
          .alignItems(VerticalAlign.Bottom)

          Text('今日刷题')
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .margin({ top: ThemeConstants.SPACING_SM })
        }
        .layoutWeight(1)
        .padding({ top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_MD })
        .margin({ left: ThemeConstants.SPACING_SM })
        .backgroundColor(ThemeColors.SURFACE)
        .borderRadius(ThemeConstants.RADIUS_MD)
        .justifyContent(FlexAlign.Center)
        .border({ width: 1, color: ThemeColors.GRAY_200 })
        .onClick(() => {
          Router.push('pages/TodayRecordPage');
        })
      }
      .width('100%')

      // 下半部分：本周学习记录
      Column() {
        Row() {
          Row() {
            Text('📅')
              .fontSize(14)
            Text(' 本周学习')
              .fontSize(ThemeConstants.FONT_SIZE_SM)
              .fontWeight(FontWeight.Medium)
              .fontColor(ThemeColors.TEXT_PRIMARY)
          }

          Blank()

          Text(this.getWeekDateRange())
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_HINT)
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .backgroundColor(ThemeColors.GRAY_100)
            .borderRadius(ThemeConstants.RADIUS_SM)
        }
        .width('100%')

        // 周打卡状态
        Row() {
          this.WeekDayCheckItem('一', 1)
          this.WeekDayCheckItem('二', 2)
          this.WeekDayCheckItem('三', 3)
          this.WeekDayCheckItem('四', 4)
          this.WeekDayCheckItem('五', 5)
          this.WeekDayCheckItem('六', 6)
          this.WeekDayCheckItem('日', 7)
        }
        .width('100%')
        .margin({ top: ThemeConstants.SPACING_BASE })
        .justifyContent(FlexAlign.SpaceBetween)

        // 今日打卡按钮
        Row() {
          if (this.hasCheckedIn) {
            Text('✓')
              .fontSize(18)
              .fontColor(ThemeColors.WHITE)
              .margin({ right: 6 })
          }
          Text(this.getCheckInButtonText())
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.WHITE)
        }
        .width('100%')
        .height(46)
        .margin({ top: ThemeConstants.SPACING_MD })
        .borderRadius(ThemeConstants.RADIUS_LG)
        .justifyContent(FlexAlign.Center)
        .linearGradient(this.hasCheckedIn ? {
          angle: 90,
          colors: [[ThemeColors.SUCCESS, 0], ['#73D13D', 1]]
        } : {
          angle: 90,
          colors: [[ThemeColors.PRIMARY, 0], [ThemeColors.PRIMARY_LIGHT, 1]]
        })
        .shadow({ radius: 8, color: this.hasCheckedIn ? 'rgba(82, 196, 26, 0.3)' : 'rgba(24, 144, 255, 0.3)', offsetX: 0, offsetY: 4 })
        .onClick(() => {
          this.doCheckIn();
        })
      }
      .width('100%')
      .padding(ThemeConstants.SPACING_MD)
      .margin({ top: ThemeConstants.SPACING_SM })
      .backgroundColor(ThemeColors.SURFACE)
      .borderRadius(ThemeConstants.RADIUS_MD)
      .border({ width: 1, color: ThemeColors.GRAY_200 })
    }
    .width('100%')
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD })
  }


  /**
   * 核心功能区 - 2x2网格布局
   */
  @Builder
  CoreFunctionSection() {
    Column() {
      // 标题区
      Row() {
        Row() {
          Text('🚀')
            .fontSize(18)
          Text(' 开始学习')
            .fontSize(ThemeConstants.FONT_SIZE_MD)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY)
        }

        Blank()

        Text('共 ' + this.totalQuestionCount + ' 题')
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })

      // 第一行：题库（大卡片） + 模拟考试
      Row() {
        // 题库 - 蓝色渐变大卡片
        Stack() {
          Column()
            .width('100%')
            .height('100%')
            .borderRadius(ThemeConstants.RADIUS_LG)
            .linearGradient({
              angle: 135,
              colors: [[ThemeColors.PRIMARY, 0], [ThemeColors.SECONDARY, 1]]
            })

          // 装饰圆圈
          Column()
            .width(80)
            .height(80)
            .borderRadius(40)
            .backgroundColor('rgba(255,255,255,0.1)')
            .position({ x: '60%', y: -20 })

          Column()
            .width(50)
            .height(50)
            .borderRadius(25)
            .backgroundColor('rgba(255,255,255,0.08)')
            .position({ x: '75%', y: 70 })

          Column() {
            // 推荐标签
            Row() {
              Text('⭐')
                .fontSize(12)
              Text(' 推荐')
                .fontSize(ThemeConstants.FONT_SIZE_XS)
                .fontColor(ThemeColors.WHITE)
            }
            .padding({ left: 10, right: 10, top: 5, bottom: 5 })
            .backgroundColor('rgba(255,255,255,0.2)')
            .borderRadius(ThemeConstants.RADIUS_LG)

            Blank()

            Text('题库练习')
              .fontSize(ThemeConstants.FONT_SIZE_XL)
              .fontWeight(FontWeight.Bold)
              .fontColor(ThemeColors.WHITE)

            Text('智能刷题 · 高效备考')
              .fontSize(ThemeConstants.FONT_SIZE_XS)
              .fontColor(ThemeColors.WHITE)
              .opacity(0.85)
              .margin({ top: 6 })
          }
          .width('100%')
          .height('100%')
          .padding(ThemeConstants.SPACING_MD)
          .alignItems(HorizontalAlign.Start)
        }
        .layoutWeight(1)
        .height(130)
        .borderRadius(ThemeConstants.RADIUS_LG)
        .shadow({ radius: 12, color: 'rgba(24, 144, 255, 0.3)', offsetX: 0, offsetY: 6 })
        .onClick(() => {
          Router.goToPractice(undefined, 'sequence');
        })

        // 模拟考试 - 绿色主题
        Column() {
          Column() {
            Text('📋')
              .fontSize(28)
          }
          .width(48)
          .height(48)
          .borderRadius(ThemeConstants.RADIUS_MD)
          .backgroundColor('#E6F7E6')
          .justifyContent(FlexAlign.Center)

          Blank()

          Text('模拟考试')
            .fontSize(ThemeConstants.FONT_SIZE_LG)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY)

          Text('全真模拟')
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.SUCCESS)
            .margin({ top: 4 })
        }
        .layoutWeight(1)
        .height(130)
        .padding(ThemeConstants.SPACING_MD)
        .margin({ left: ThemeConstants.SPACING_SM })
        .backgroundColor(ThemeColors.SURFACE)
        .borderRadius(ThemeConstants.RADIUS_LG)
        .alignItems(HorizontalAlign.Start)
        .border({ width: 1, color: ThemeColors.GRAY_200 })
        .onClick(() => {
          Router.push('pages/MockExamEntryPage');
        })
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
      .margin({ top: ThemeConstants.SPACING_SM })

      // 第二行：错题本 + 我的收藏
      Row() {
        // 错题本 - 红色主题
        Column() {
          Row() {
            Column() {
              Text('📕')
                .fontSize(28)
            }
            .width(48)
            .height(48)
            .borderRadius(ThemeConstants.RADIUS_MD)
            .backgroundColor('#FFEBE8')
            .justifyContent(FlexAlign.Center)

            Blank()

            // 错题数量角标
            if (this.wrongCount > 0) {
              Column() {
                Text(`${this.wrongCount}`)
                  .fontSize(ThemeConstants.FONT_SIZE_XS)
                  .fontColor(ThemeColors.WHITE)
              }
              .padding({ left: 8, right: 8, top: 3, bottom: 3 })
              .backgroundColor(ThemeColors.ERROR)
              .borderRadius(ThemeConstants.RADIUS_LG)
            }
          }
          .width('100%')

          Blank()

          Text('错题本')
            .fontSize(ThemeConstants.FONT_SIZE_LG)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY)

          Text('重点攻克')
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.ERROR)
            .margin({ top: 4 })
        }
        .layoutWeight(1)
        .height(130)
        .padding(ThemeConstants.SPACING_MD)
        .backgroundColor(ThemeColors.SURFACE)
        .borderRadius(ThemeConstants.RADIUS_LG)
        .alignItems(HorizontalAlign.Start)
        .border({ width: 1, color: ThemeColors.GRAY_200 })
        .onClick(() => {
          Router.goToWrongBook();
        })

        // 我的收藏 - 橙色主题
        Column() {
          Row() {
            Column() {
              Text('⭐')
                .fontSize(28)
            }
            .width(48)
            .height(48)
            .borderRadius(ThemeConstants.RADIUS_MD)
            .backgroundColor('#FFF4E6')
            .justifyContent(FlexAlign.Center)

            Blank()

            // 收藏数量角标
            if (this.favoriteCount > 0) {
              Column() {
                Text(`${this.favoriteCount}`)
                  .fontSize(ThemeConstants.FONT_SIZE_XS)
                  .fontColor(ThemeColors.WHITE)
              }
              .padding({ left: 8, right: 8, top: 3, bottom: 3 })
              .backgroundColor(ThemeColors.WARNING)
              .borderRadius(ThemeConstants.RADIUS_LG)
            }
          }
          .width('100%')

          Blank()

          Text('我的收藏')
            .fontSize(ThemeConstants.FONT_SIZE_LG)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY)

          Text('高频考点')
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.WARNING)
            .margin({ top: 4 })
        }
        .layoutWeight(1)
        .height(130)
        .padding(ThemeConstants.SPACING_MD)
        .margin({ left: ThemeConstants.SPACING_SM })
        .backgroundColor(ThemeColors.SURFACE)
        .borderRadius(ThemeConstants.RADIUS_LG)
        .alignItems(HorizontalAlign.Start)
        .border({ width: 1, color: ThemeColors.GRAY_200 })
        .onClick(() => {
          Router.goToFavorite();
        })
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
      .margin({ top: ThemeConstants.SPACING_SM })
    }
    .width('100%')
    .margin({ top: ThemeConstants.SPACING_LG })
  }


  /**
   * 获取本周日期范围
   */
  private getWeekDateRange(): string {
    const now = new Date();
    const dayOfWeek = now.getDay() || 7;
    const monday = new Date(now);
    monday.setDate(now.getDate() - dayOfWeek + 1);
    const sunday = new Date(monday);
    sunday.setDate(monday.getDate() + 6);

    const startMonth = monday.getMonth() + 1;
    const startDay = monday.getDate();
    const endMonth = sunday.getMonth() + 1;
    const endDay = sunday.getDate();

    return `${startMonth}月${startDay}日 - ${endMonth}月${endDay}日`;
  }

  /**
   * 获取今天是周几（1-7）
   */
  private getTodayWeekDay(): number {
    const day = new Date().getDay();
    return day === 0 ? 7 : day;
  }

  /**
   * 判断某天是否在周计划中
   */
  private isDayInPlan(dayIndex: number): boolean {
    return this.weeklyPlanDays.includes(dayIndex);
  }

  /**
   * 判断某天是否已打卡（手动打卡）
   */
  private isDayChecked(dayIndex: number): boolean {
    if (!this.isDayInPlan(dayIndex)) {
      return false;
    }
    return dayIndex === this.getTodayWeekDay() && this.hasCheckedIn;
  }

  /**
   * 判断今日是否已打卡（手动打卡）
   */
  private isTodayChecked(): boolean {
    return this.hasCheckedIn;
  }

  /**
   * 判断是否可以打卡（今日刷题数 >= 每日目标）
   */
  private canCheckIn(): boolean {
    return this.todayStats.total >= this.dailyGoal;
  }

  /**
   * 获取打卡按钮文字
   */
  private getCheckInButtonText(): string {
    if (this.hasCheckedIn) {
      return ' 今日已打卡';
    } else {
      return '点击打卡';
    }
  }

  /**
   * 执行手动打卡
   */
  private async doCheckIn(): Promise<void> {
    if (this.hasCheckedIn) return;

    if (!this.canCheckIn()) {
      this.checkInTipsDialog.open();
      return;
    }

    const success = await userService.checkInToday();
    if (success) {
      this.hasCheckedIn = true;
      this.showCheckInSuccess = true;
      widgetDataService.updateCheckInStatus(true, 1);
    }
  }

  /**
   * 获取周打卡项的背景色
   */
  private getWeekDayBgColor(dayIndex: number): ResourceColor {
    if (this.isDayChecked(dayIndex)) {
      return ThemeColors.PRIMARY;
    }
    if (!this.isDayInPlan(dayIndex)) {
      return ThemeColors.GRAY_100;
    }
    return ThemeColors.GRAY_200;
  }

  /**
   * 判断是否是今天
   */
  private isToday(dayIndex: number): boolean {
    return dayIndex === this.getTodayWeekDay();
  }

  /**
   * 周打卡项
   */
  @Builder
  WeekDayCheckItem(label: string, dayIndex: number) {
    Column() {
      Text(label)
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(this.isToday(dayIndex) ? ThemeColors.PRIMARY : ThemeColors.TEXT_HINT)
        .fontWeight(this.isToday(dayIndex) ? FontWeight.Bold : FontWeight.Normal)

      Stack() {
        Column()
          .width(36)
          .height(36)
          .borderRadius(18)
          .backgroundColor(this.getWeekDayBgColor(dayIndex))
          .border({
            width: this.isToday(dayIndex) ? 2 : 0,
            color: ThemeColors.PRIMARY
          })

        if (this.isDayChecked(dayIndex)) {
          Text('✓')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.WHITE)
        } else if (!this.isDayInPlan(dayIndex)) {
          Text('休')
            .fontSize(10)
            .fontColor(ThemeColors.TEXT_HINT)
        } else if (this.isToday(dayIndex)) {
          Text('今')
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.PRIMARY)
        }
      }
      .margin({ top: ThemeConstants.SPACING_SM })
    }
  }

  /**
   * 计算总体进度百分比
   */
  private getOverallProgress(): number {
    if (this.totalQuestionCount === 0) return 0;
    return Math.round((this.completedQuestionCount / this.totalQuestionCount) * 100);
  }

  /**
   * 获取进度鼓励语
   */
  private getProgressEncouragement(): string {
    const progress = this.getOverallProgress();
    if (progress >= 80) {
      return '太棒了！你已经掌握了大部分内容，继续保持！';
    } else if (progress >= 60) {
      return '进度不错，坚持就是胜利，已超过 60% 的考生';
    } else if (progress >= 40) {
      return '加油！你已经完成了近一半的学习任务';
    } else if (progress >= 20) {
      return '良好的开始是成功的一半，继续努力！';
    } else {
      return '开始你的学习之旅吧，每天进步一点点！';
    }
  }

  /**
   * 获取最高模拟考试分数
   */
  private getHighestExamScore(): string {
    if (this.examRecords.length === 0) {
      return '--';
    }
    let highest = 0;
    this.examRecords.forEach((record: ExamRecord) => {
      if (record.score > highest) {
        highest = record.score;
      }
    });
    return highest > 0 ? `${Math.round(highest)}` : '--';
  }


  /**
   * 题库内容
   */
  @Builder
  QuestionBankContent() {
    Column() {
      // 顶部标题栏
      Row() {
        Text('题库分类')
          .fontSize(ThemeConstants.FONT_SIZE_XL)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Blank()

        Row() {
          Text('📚')
            .fontSize(14)
          Text(`${this.totalQuestionCount} 题`)
            .fontSize(ThemeConstants.FONT_SIZE_SM)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .margin({ left: 4 })
        }
        .padding({ left: 10, right: 10, top: 4, bottom: 4 })
        .backgroundColor(ThemeColors.PRIMARY + '15')
        .borderRadius(12)
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD,
        top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_SM })

      Scroll() {
        Column() {
          // 总体进度卡片
          this.QuestionBankProgressCard()

          // 所有分类标题
          Row() {
            Text('科目进度')
              .fontSize(ThemeConstants.FONT_SIZE_MD)
              .fontWeight(FontWeight.Bold)
              .fontColor(ThemeColors.TEXT_PRIMARY)

            Blank()

            Text(`${this.subjectList.length} 个科目`)
              .fontSize(ThemeConstants.FONT_SIZE_SM)
              .fontColor(ThemeColors.TEXT_HINT)
          }
          .width('100%')
          .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD,
            top: ThemeConstants.SPACING_LG, bottom: ThemeConstants.SPACING_XS })

          // 科目列表（带进度可视化）
          Column() {
            ForEach(this.subjectProgressList, (progress: SubjectProgress) => {
              this.QuestionBankItemWithProgress(progress)
            }, (progress: SubjectProgress) => progress.subjectId)
          }
          .padding({ bottom: ThemeConstants.SPACING_2XL })
        }
      }
      .scrollBar(BarState.Off)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }

  /**
   * 题库总体进度卡片
   */
  @Builder
  QuestionBankProgressCard() {
    Column() {
      Row() {
        Column() {
          Text('学习进度')
            .fontSize(ThemeConstants.FONT_SIZE_LG)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY)

          Row() {
            Text(`已完成 `)
              .fontSize(ThemeConstants.FONT_SIZE_SM)
              .fontColor(ThemeColors.TEXT_SECONDARY)
            Text(`${this.completedQuestionCount}`)
              .fontSize(ThemeConstants.FONT_SIZE_SM)
              .fontWeight(FontWeight.Bold)
              .fontColor(ThemeColors.PRIMARY)
            Text(` / ${this.totalQuestionCount} 题`)
              .fontSize(ThemeConstants.FONT_SIZE_SM)
              .fontColor(ThemeColors.TEXT_SECONDARY)
          }
          .margin({ top: ThemeConstants.SPACING_XS })
        }
        .alignItems(HorizontalAlign.Start)

        Blank()

        Stack() {
          Progress({ value: this.getOverallProgress(), total: 100, type: ProgressType.Ring })
            .width(70)
            .height(70)
            .color(ThemeColors.PRIMARY)
            .backgroundColor(ThemeColors.GRAY_200)
            .style({ strokeWidth: 6 })

          Text(`${this.getOverallProgress()}%`)
            .fontSize(ThemeConstants.FONT_SIZE_MD)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.PRIMARY)
        }
      }
      .width('100%')

      Text(this.getProgressEncouragement())
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: ThemeConstants.SPACING_SM })
        .width('100%')
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_SM })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_LG)
    .border({ width: 1, color: ThemeColors.GRAY_200 })
  }

  /**
   * 带进度可视化的题库项
   */
  @Builder
  QuestionBankItemWithProgress(progress: SubjectProgress) {
    Column() {
      Row() {
        // 左侧图标
        Column() {
          Text(this.getSubjectEmoji(progress.subjectId))
            .fontSize(24)
        }
        .width(48)
        .height(48)
        .borderRadius(ThemeConstants.RADIUS_MD)
        .backgroundColor(progress.color + '20')
        .justifyContent(FlexAlign.Center)

        // 中间信息
        Column() {
          Row() {
            Text(progress.subjectName)
              .fontSize(ThemeConstants.FONT_SIZE_BASE)
              .fontWeight(FontWeight.Medium)
              .fontColor(ThemeColors.TEXT_PRIMARY)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .layoutWeight(1)

            // 掌握程度标签
            Text(progress.masteryLevel)
              .fontSize(10)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 8, right: 8, top: 2, bottom: 2 })
              .backgroundColor(progress.masteryColor)
              .borderRadius(10)
          }
          .width('100%')

          // 进度条
          Row() {
            Progress({ value: progress.progress, total: 100, type: ProgressType.Linear })
              .width('100%')
              .height(6)
              .color(progress.color)
              .backgroundColor(ThemeColors.GRAY_200)
              .borderRadius(3)
          }
          .width('100%')
          .margin({ top: 8 })

          // 统计信息
          Row() {
            Text(`${progress.completedCount}/${progress.totalCount} 题`)
              .fontSize(ThemeConstants.FONT_SIZE_XS)
              .fontColor(ThemeColors.TEXT_HINT)

            Blank()

            Text(`正确率 ${progress.accuracy}%`)
              .fontSize(ThemeConstants.FONT_SIZE_XS)
              .fontColor(progress.accuracy >= 70 ? ThemeColors.SUCCESS : ThemeColors.WARNING)
          }
          .width('100%')
          .margin({ top: 4 })
        }
        .layoutWeight(1)
        .margin({ left: ThemeConstants.SPACING_SM })
        .alignItems(HorizontalAlign.Start)

        // 右侧箭头
        Image($r('app.media.Rightarrow'))
          .width(16)
          .height(16)
          .fillColor(ThemeColors.TEXT_HINT)
          .margin({ left: ThemeConstants.SPACING_SM })
      }
      .width('100%')
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_SM })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .border({ width: 1, color: ThemeColors.GRAY_200 })
    .onClick(() => {
      Router.goToPractice(progress.subjectId, 'sequence');
    })
  }

  /**
   * 动态题库项（保留兼容）
   */
  @Builder
  QuestionBankItemDynamic(subject: SubjectStats) {
    Row() {
      Column() {
        Text(this.getSubjectEmoji(subject.id))
          .fontSize(24)
      }
      .width(48)
      .height(48)
      .borderRadius(ThemeConstants.RADIUS_MD)
      .backgroundColor(subject.color + '20')
      .justifyContent(FlexAlign.Center)

      Column() {
        Text(subject.name)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        Row() {
          Text(`${subject.questionCount} 题`)
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_HINT)
        }
        .margin({ top: 4 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ left: ThemeConstants.SPACING_SM })

      Image($r('app.media.Rightarrow'))
        .width(16)
        .height(16)
        .fillColor(ThemeColors.TEXT_HINT)
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_SM })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .border({ width: 1, color: ThemeColors.GRAY_200 })
    .onClick(() => {
      Router.goToPractice(subject.id, 'sequence');
    })
  }


  /**
   * 知识库内容（统计Tab）
   */
  @Builder
  StatisticsContent() {
    Column() {
      // 顶部标题栏
      Row() {
        Text('知识库')
          .fontSize(ThemeConstants.FONT_SIZE_XL)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Blank()

        Row() {
          Text('📖')
            .fontSize(14)
          Text(`${this.allKnowledgeArticles.length} 篇`)
            .fontSize(ThemeConstants.FONT_SIZE_SM)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .margin({ left: 4 })
        }
        .padding({ left: 10, right: 10, top: 4, bottom: 4 })
        .backgroundColor(ThemeColors.PRIMARY + '15')
        .borderRadius(12)
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD,
        top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_SM })

      // 搜索框
      Row() {
        Text('🔍')
          .fontSize(18)
          .margin({ left: 12 })

        TextInput({ placeholder: '搜索知识点...', text: this.knowledgeSearchText })
          .placeholderColor(ThemeColors.TEXT_HINT)
          .placeholderFont({ size: 14 })
          .fontSize(14)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .backgroundColor(Color.Transparent)
          .layoutWeight(1)
          .height(40)
          .onChange((value: string) => {
            this.knowledgeSearchText = value;
          })
      }
      .width('100%')
      .height(44)
      .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
      .backgroundColor(ThemeColors.GRAY_100)
      .borderRadius(22)

      // 知识库内容
      if (this.knowledgeSearchText.trim()) {
        // 搜索模式：显示搜索结果列表
        this.KnowledgeSearchResults()
      } else {
        // 树形目录模式
        this.KnowledgeTreeView()
      }
    }
    .width('100%')
    .height('100%')
  }

  /**
   * 知识库树形目录视图
   */
  @Builder
  KnowledgeTreeView() {
    Scroll() {
      Column() {
        // 学习进度概览卡片
        this.KnowledgeProgressCard()

        // 科目树形列表
        ForEach(this.knowledgeSubjects, (subject: KnowledgeSubject) => {
          this.KnowledgeSubjectTree(subject)
        }, (subject: KnowledgeSubject) => subject.id)
      }
      .padding({ bottom: ThemeConstants.SPACING_2XL })
    }
    .scrollBar(BarState.Off)
    .layoutWeight(1)
    .margin({ top: ThemeConstants.SPACING_SM })
  }

  /**
   * 知识库学习进度卡片
   */
  @Builder
  KnowledgeProgressCard() {
    Column() {
      Row() {
        Column() {
          Text('知识学习')
            .fontSize(ThemeConstants.FONT_SIZE_MD)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY)

          Text(`共 ${this.knowledgeSubjects.length} 个科目，${this.allKnowledgeArticles.length} 篇知识点`)
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_HINT)
            .margin({ top: 4 })
        }
        .alignItems(HorizontalAlign.Start)

        Blank()

        Column() {
          Text('📚')
            .fontSize(32)
        }
        .width(56)
        .height(56)
        .borderRadius(28)
        .backgroundColor(ThemeColors.PRIMARY + '15')
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')

      // 快捷入口
      Row() {
        this.KnowledgeQuickEntry('📕', '最近阅读', () => {
          // TODO: 跳转最近阅读
        })
        this.KnowledgeQuickEntry('⭐', '我的收藏', () => {
          // TODO: 跳转收藏
        })
        this.KnowledgeQuickEntry('📝', '学习笔记', () => {
          Router.push('pages/StudyNotesPage');
        })
      }
      .width('100%')
      .margin({ top: ThemeConstants.SPACING_MD })
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_LG)
    .border({ width: 1, color: ThemeColors.GRAY_200 })
  }

  /**
   * 知识库快捷入口
   */
  @Builder
  KnowledgeQuickEntry(icon: string, title: string, onClick: () => void) {
    Column() {
      Text(icon)
        .fontSize(20)
      Text(title)
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: 4 })
    }
    .width('30%')
    .padding({ top: 10, bottom: 10 })
    .backgroundColor(ThemeColors.GRAY_100)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .onClick(onClick)
  }

  /**
   * 科目树形节点
   */
  @Builder
  KnowledgeSubjectTree(subject: KnowledgeSubject) {
    Column() {
      // 科目标题行（可展开/折叠）
      Row() {
        // 展开/折叠图标
        Text(this.isSubjectExpanded(subject.id) ? '▼' : '▶')
          .fontSize(12)
          .fontColor(ThemeColors.TEXT_HINT)
          .width(20)

        // 科目图标
        Column() {
          Text(subject.icon)
            .fontSize(20)
        }
        .width(36)
        .height(36)
        .borderRadius(ThemeConstants.RADIUS_SM)
        .backgroundColor(subject.color + '20')
        .justifyContent(FlexAlign.Center)

        // 科目信息
        Column() {
          Text(subject.name)
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.TEXT_PRIMARY)

          Text(`${subject.articleCount} 篇知识点`)
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_HINT)
            .margin({ top: 2 })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: ThemeConstants.SPACING_SM })
        .layoutWeight(1)

        // 进度指示
        Text(`${this.getSubjectReadProgress(subject.id)}%`)
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(subject.color)
          .padding({ left: 8, right: 8, top: 2, bottom: 2 })
          .backgroundColor(subject.color + '15')
          .borderRadius(10)
      }
      .width('100%')
      .padding(ThemeConstants.SPACING_BASE)
      .backgroundColor(ThemeColors.SURFACE)
      .borderRadius(ThemeConstants.RADIUS_MD)
      .border({ width: 1, color: ThemeColors.GRAY_200 })
      .onClick(() => {
        this.toggleSubjectExpand(subject.id);
      })

      // 展开的分类列表
      if (this.isSubjectExpanded(subject.id)) {
        Column() {
          ForEach(subject.categories, (category: KnowledgeCategory) => {
            this.KnowledgeCategoryTree(subject, category)
          }, (category: KnowledgeCategory) => category.id)
        }
        .width('100%')
        .padding({ left: 20 })
        .margin({ top: 4 })
      }
    }
    .width('100%')
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_SM })
  }

  /**
   * 分类树形节点
   */
  @Builder
  KnowledgeCategoryTree(subject: KnowledgeSubject, category: KnowledgeCategory) {
    Column() {
      // 分类标题行
      Row() {
        // 展开/折叠图标
        Text(this.isCategoryExpanded(category.id) ? '▼' : '▶')
          .fontSize(10)
          .fontColor(ThemeColors.TEXT_HINT)
          .width(16)

        // 分类图标
        Text(category.icon)
          .fontSize(14)

        // 分类名称
        Text(category.name)
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .margin({ left: 6 })
          .layoutWeight(1)

        // 文章数量
        Text(`${category.articleCount}`)
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
      }
      .width('100%')
      .padding({ left: 8, right: 12, top: 10, bottom: 10 })
      .backgroundColor(ThemeColors.GRAY_100)
      .borderRadius(ThemeConstants.RADIUS_SM)
      .onClick(() => {
        this.toggleCategoryExpand(category.id);
      })

      // 展开的文章列表
      if (this.isCategoryExpanded(category.id)) {
        Column() {
          ForEach(this.getArticlesByCategory(category.id), (article: KnowledgeArticle) => {
            this.KnowledgeArticleTreeItem(article, subject.color)
          }, (article: KnowledgeArticle) => article.id)
        }
        .width('100%')
        .padding({ left: 16 })
        .margin({ top: 4 })
      }
    }
    .width('100%')
    .margin({ top: 4 })
  }

  /**
   * 文章树形项
   */
  @Builder
  KnowledgeArticleTreeItem(article: KnowledgeArticle, color: string) {
    Row() {
      // 连接线指示
      Column()
        .width(2)
        .height(16)
        .backgroundColor(color + '40')
        .borderRadius(1)

      // 文章标题
      Text(article.title)
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ left: 8 })
        .layoutWeight(1)

      // 阅读状态
      if (article.viewCount > 0) {
        Text('✓')
          .fontSize(12)
          .fontColor(ThemeColors.SUCCESS)
      }
    }
    .width('100%')
    .padding({ left: 8, right: 12, top: 8, bottom: 8 })
    .onClick(() => {
      const params: RouteParams = {};
      params['articleId'] = article.id;
      Router.push('pages/KnowledgeDetailPage', params);
    })
  }

  /**
   * 知识库搜索结果
   */
  @Builder
  KnowledgeSearchResults() {
    Scroll() {
      Column() {
        ForEach(this.getFilteredKnowledgeArticles(), (article: KnowledgeArticle) => {
          this.KnowledgeArticleItem(article)
        }, (article: KnowledgeArticle) => article.id)

        if (this.getFilteredKnowledgeArticles().length === 0) {
          Column() {
            Text('🔍')
              .fontSize(48)
              .margin({ top: 60 })
            Text('未找到相关知识点')
              .fontSize(ThemeConstants.FONT_SIZE_BASE)
              .fontColor(ThemeColors.TEXT_HINT)
              .margin({ top: ThemeConstants.SPACING_MD })
          }
          .width('100%')
        }
      }
      .padding({ bottom: ThemeConstants.SPACING_2XL })
    }
    .scrollBar(BarState.Off)
    .layoutWeight(1)
    .margin({ top: ThemeConstants.SPACING_SM })
  }

  /**
   * 判断科目是否展开
   */
  private isSubjectExpanded(subjectId: string): boolean {
    return this.expandedSubjects.has(subjectId);
  }

  /**
   * 切换科目展开状态
   */
  private toggleSubjectExpand(subjectId: string): void {
    const newSet = new Set<string>(this.expandedSubjects);
    if (newSet.has(subjectId)) {
      newSet.delete(subjectId);
    } else {
      newSet.add(subjectId);
    }
    this.expandedSubjects = newSet;
  }

  /**
   * 判断分类是否展开
   */
  private isCategoryExpanded(categoryId: string): boolean {
    return this.expandedCategories.has(categoryId);
  }

  /**
   * 切换分类展开状态
   */
  private toggleCategoryExpand(categoryId: string): void {
    const newSet = new Set<string>(this.expandedCategories);
    if (newSet.has(categoryId)) {
      newSet.delete(categoryId);
    } else {
      newSet.add(categoryId);
    }
    this.expandedCategories = newSet;
  }

  /**
   * 获取分类下的文章
   */
  private getArticlesByCategory(categoryId: string): KnowledgeArticle[] {
    return this.allKnowledgeArticles.filter((a: KnowledgeArticle) => a.categoryId === categoryId);
  }

  /**
   * 获取科目阅读进度
   */
  private getSubjectReadProgress(subjectId: string): number {
    const subjectArticles = this.allKnowledgeArticles.filter((a: KnowledgeArticle) => a.subjectId === subjectId);
    if (subjectArticles.length === 0) return 0;
    const readCount = subjectArticles.filter((a: KnowledgeArticle) => a.viewCount > 0).length;
    return Math.round((readCount / subjectArticles.length) * 100);
  }

  /**
   * 获取过滤后的知识文章
   */
  private getFilteredKnowledgeArticles(): KnowledgeArticle[] {
    let articles = this.allKnowledgeArticles;

    // 按分类过滤
    if (this.selectedKnowledgeCategory !== '全部') {
      const subject = this.knowledgeSubjects.find(s => s.name === this.selectedKnowledgeCategory);
      if (subject) {
        articles = articles.filter(a => a.subjectId === subject.id);
      }
    }

    // 按搜索关键词过滤
    if (this.knowledgeSearchText.trim()) {
      const keyword = this.knowledgeSearchText.trim().toLowerCase();
      articles = articles.filter(a =>
        a.title.toLowerCase().includes(keyword) ||
        a.summary.toLowerCase().includes(keyword)
      );
    }

    return articles;
  }

  /**
   * 知识分类标签
   */
  @Builder
  KnowledgeCategoryTag(name: string, isSelected: boolean) {
    Text(name)
      .fontSize(ThemeConstants.FONT_SIZE_SM)
      .fontColor(isSelected ? ThemeColors.WHITE : ThemeColors.TEXT_SECONDARY)
      .padding({ left: 14, right: 14, top: 8, bottom: 8 })
      .backgroundColor(isSelected ? ThemeColors.PRIMARY : ThemeColors.GRAY_100)
      .borderRadius(16)
      .onClick(() => {
        this.selectedKnowledgeCategory = name;
      })
  }

  /**
   * 知识文章项
   */
  @Builder
  KnowledgeArticleItem(article: KnowledgeArticle) {
    Column() {
      Row() {
        Column() {
          Text(article.title)
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })

          Text(article.summary)
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_HINT)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .margin({ top: 6 })
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
      }
      .width('100%')

      Row() {
        Text(this.getSubjectName(article.subjectId))
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.PRIMARY)
          .padding({ left: 8, right: 8, top: 2, bottom: 2 })
          .backgroundColor(ThemeColors.PRIMARY + '15')
          .borderRadius(4)

        Text(this.getContentTypeName(article.contentType))
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ left: 8 })

        Blank()

        Text(`${article.viewCount} 阅读`)
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
      }
      .width('100%')
      .margin({ top: 10 })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_SM })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .border({ width: 1, color: ThemeColors.GRAY_200 })
    .onClick(() => {
      const params: RouteParams = {};
      params['articleId'] = article.id;
      Router.push('pages/KnowledgeDetailPage', params);
    })
  }

  /**
   * 获取科目名称
   */
  private getSubjectName(subjectId: string): string {
    const subject = this.knowledgeSubjects.find(s => s.id === subjectId);
    return subject ? subject.name : '未分类';
  }

  /**
   * 获取内容类型名称
   */
  private getContentTypeName(type: ContentType): string {
    switch (type) {
      case ContentType.TEXT: return '图文';
      case ContentType.VIDEO: return '视频';
      case ContentType.PDF: return '文档';
      case ContentType.IMAGE: return '图片';
      default: return '其他';
    }
  }

  /**
   * 获取科目对应的emoji图标
   */
  private getSubjectEmoji(subjectId: string): string {
    switch (subjectId) {
      case AppConstants.SUBJECT_BASIC: return '📚';
      case AppConstants.SUBJECT_CONCRETE: return '🏗️';
      case AppConstants.SUBJECT_GEOTECHNICAL_ROCK: return '🪨';
      case AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION: return '🏛️';
      case AppConstants.SUBJECT_MEASUREMENT: return '📏';
      case AppConstants.SUBJECT_METAL: return '🔩';
      case AppConstants.SUBJECT_MECHANICAL: return '⚙️';
      default: return '📖';
    }
  }


  /**
   * 我的页面内容
   */
  @Builder
  ProfileContent() {
    Column() {
      // 顶部标题栏
      Row() {
        Text('个人中心')
          .fontSize(ThemeConstants.FONT_SIZE_XL)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Blank()

        Column() {
          Image($r('app.media.Settings'))
            .width(22)
            .height(22)
        }
        .width(40)
        .height(40)
        .borderRadius(20)
        .backgroundColor(ThemeColors.GRAY_100)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          Router.goToSettings();
        })
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD,
        top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_SM })

      Scroll() {
        Column() {
          // 用户信息卡片
          this.ProfileUserCard()

          // 学习数据统计行
          this.ProfileStatsRow()

          // 考试进度卡片
          this.ProfileExamProgressCard()

          // 常用功能 2x2 网格
          this.ProfileCommonFunctions()

          // 更多服务
          this.ProfileMoreServices()
        }
        .padding({ bottom: ThemeConstants.SPACING_2XL })
      }
      .scrollBar(BarState.Off)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }

  /**
   * 用户信息卡片
   */
  @Builder
  ProfileUserCard() {
    Row() {
      // 头像
      Stack() {
        Column()
          .width(68)
          .height(68)
          .borderRadius(34)
          .linearGradient({
            angle: 135,
            colors: [[ThemeColors.PRIMARY, 0], [ThemeColors.SECONDARY, 1]]
          })

        Image(this.getAvatarResource())
          .width(64)
          .height(64)
          .borderRadius(32)
          .objectFit(ImageFit.Cover)
          .border({ width: 2, color: ThemeColors.WHITE })
      }

      Column() {
        Text(this.userInfo.nickname)
          .fontSize(ThemeConstants.FONT_SIZE_LG)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Text(`ID: ${this.userInfo.userId || '未设置'}`)
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 4 })

        Row() {
          Text(this.userInfo.status)
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.PRIMARY)
            .padding({ left: 8, right: 8, top: 2, bottom: 2 })
            .backgroundColor(ThemeColors.PRIMARY + '15')
            .borderRadius(10)
        }
        .margin({ top: 6 })
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: ThemeConstants.SPACING_MD })
      .layoutWeight(1)

      // 编辑按钮
      Row() {
        Text('编辑')
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.PRIMARY)
        Image($r('app.media.Rightarrow'))
          .width(12)
          .height(12)
          .fillColor(ThemeColors.PRIMARY)
          .margin({ left: 2 })
      }
      .padding({ left: 10, right: 10, top: 6, bottom: 6 })
      .backgroundColor(ThemeColors.PRIMARY + '10')
      .borderRadius(14)
      .onClick(() => {
        Router.push('pages/ProfileEditPage');
      })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_SM })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_LG)
    .border({ width: 1, color: ThemeColors.GRAY_200 })
  }

  /**
   * 学习数据统计行
   */
  @Builder
  ProfileStatsRow() {
    Row() {
      // 已做题数
      Column() {
        Text(`${this.completedQuestionCount}`)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
        Text('已做题数')
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 4 })
      }
      .layoutWeight(1)

      // 分隔线
      Column()
        .width(1)
        .height(30)
        .backgroundColor(ThemeColors.GRAY_200)

      // 完成进度
      Column() {
        Text(`${this.getOverallProgress()}%`)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
        Text('完成进度')
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 4 })
      }
      .layoutWeight(1)

      // 分隔线
      Column()
        .width(1)
        .height(30)
        .backgroundColor(ThemeColors.GRAY_200)

      // 最高模拟分
      Column() {
        Text(this.getHighestExamScore())
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
        Text('最高模拟分')
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 4 })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .padding({ top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_MD })
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_SM })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_LG)
    .border({ width: 1, color: ThemeColors.GRAY_200 })
  }

  /**
   * 考试进度卡片
   */
  @Builder
  ProfileExamProgressCard() {
    Stack() {
      // 渐变背景
      Column()
        .width('100%')
        .height('100%')
        .borderRadius(ThemeConstants.RADIUS_LG)
        .linearGradient({
          angle: 135,
          colors: [[ThemeColors.PRIMARY, 0], [ThemeColors.SECONDARY, 1]]
        })

      Column() {
        Row() {
          Column() {
            Text('考试进度')
              .fontSize(ThemeConstants.FONT_SIZE_MD)
              .fontWeight(FontWeight.Bold)
              .fontColor(ThemeColors.WHITE)

            Row() {
              Text('距离考试还有 ')
                .fontSize(ThemeConstants.FONT_SIZE_SM)
                .fontColor(ThemeColors.WHITE)
                .opacity(0.9)
              Text(`${this.daysUntilExam}`)
                .fontSize(ThemeConstants.FONT_SIZE_LG)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FFD700')
              Text(' 天')
                .fontSize(ThemeConstants.FONT_SIZE_SM)
                .fontColor(ThemeColors.WHITE)
                .opacity(0.9)
            }
            .margin({ top: 8 })
          }
          .alignItems(HorizontalAlign.Start)

          Blank()

          Text('📅')
            .fontSize(40)
            .opacity(0.3)
        }
        .width('100%')

        // 进度条
        Column() {
          Row() {
            Text('学习进度')
              .fontSize(ThemeConstants.FONT_SIZE_XS)
              .fontColor(ThemeColors.WHITE)
              .opacity(0.9)
            Blank()
            Text(`${this.getOverallProgress()}%`)
              .fontSize(ThemeConstants.FONT_SIZE_XS)
              .fontColor(ThemeColors.WHITE)
          }
          .width('100%')

          Progress({ value: this.getOverallProgress(), total: 100, type: ProgressType.Linear })
            .width('100%')
            .height(8)
            .color('#FFD700')
            .backgroundColor('rgba(255,255,255,0.3)')
            .borderRadius(4)
            .margin({ top: 6 })
        }
        .margin({ top: ThemeConstants.SPACING_MD })
      }
      .width('100%')
      .height('100%')
      .padding(ThemeConstants.SPACING_MD)
    }
    .width('100%')
    .height(130)
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_SM })
    .borderRadius(ThemeConstants.RADIUS_LG)
    .shadow({ radius: 12, color: 'rgba(24, 144, 255, 0.3)', offsetX: 0, offsetY: 6 })
  }

  /**
   * 常用功能 2x2 网格
   */
  @Builder
  ProfileCommonFunctions() {
    Column() {
      Row() {
        Text('常用功能')
          .fontSize(ThemeConstants.FONT_SIZE_MD)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.TEXT_PRIMARY)
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_LG, bottom: ThemeConstants.SPACING_SM })

      // 2x2 网格
      Column() {
        Row() {
          // 学习报告
          this.ProfileFunctionItem('📊', '学习报告', ThemeColors.PRIMARY, () => {
            Router.push('pages/StudyReportPage');
          })

          // 考试成绩
          this.ProfileFunctionItem('📋', '考试成绩', ThemeColors.SUCCESS, () => {
            Router.push('pages/ExamHistoryPage');
          })
        }
        .width('100%')

        Row() {
          // 我的成就
          this.ProfileFunctionItem('🏆', '我的成就', ThemeColors.WARNING, () => {
            Router.push('pages/AchievementPage');
          })

          // 错题本
          this.ProfileFunctionItem('📕', '错题本', ThemeColors.ERROR, () => {
            Router.goToWrongBook();
          })
        }
        .width('100%')
        .margin({ top: ThemeConstants.SPACING_SM })
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
    }
    .width('100%')
  }

  /**
   * 功能项
   */
  @Builder
  ProfileFunctionItem(icon: string, title: string, color: ResourceColor, onClick: () => void) {
    Column() {
      Column() {
        Text(icon)
          .fontSize(28)
      }
      .width(50)
      .height(50)
      .borderRadius(ThemeConstants.RADIUS_MD)
      .backgroundColor(color + '15')
      .justifyContent(FlexAlign.Center)

      Text(title)
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ top: 8 })
    }
    .layoutWeight(1)
    .padding({ top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_MD })
    .margin({ left: ThemeConstants.SPACING_XS, right: ThemeConstants.SPACING_XS })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .border({ width: 1, color: ThemeColors.GRAY_200 })
    .onClick(onClick)
  }

  /**
   * 更多服务
   */
  @Builder
  ProfileMoreServices() {
    Column() {
      Row() {
        Text('更多服务')
          .fontSize(ThemeConstants.FONT_SIZE_MD)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.TEXT_PRIMARY)
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_LG, bottom: ThemeConstants.SPACING_SM })

      Column() {
        // 我的收藏
        this.ProfileServiceItem('⭐', '我的收藏', `${this.favoriteCount} 道收藏`, () => {
          Router.goToFavorite();
        })

        Divider()
          .color(ThemeColors.GRAY_200)
          .margin({ left: 44 })

        // 学习笔记
        this.ProfileServiceItem('📝', '学习笔记', '记录学习心得', () => {
          Router.push('pages/NotesPage');
        })

        Divider()
          .color(ThemeColors.GRAY_200)
          .margin({ left: 44 })

        // 关于应用
        this.ProfileServiceItem('ℹ️', '关于应用', '版本信息', () => {
          Router.push('pages/AboutPage');
        })
      }
      .width('100%')
      .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
      .backgroundColor(ThemeColors.SURFACE)
      .borderRadius(ThemeConstants.RADIUS_MD)
      .border({ width: 1, color: ThemeColors.GRAY_200 })
    }
    .width('100%')
  }

  /**
   * 服务项
   */
  @Builder
  ProfileServiceItem(icon: string, title: string, desc: string, onClick: () => void) {
    Row() {
      Text(icon)
        .fontSize(22)

      Text(title)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ left: ThemeConstants.SPACING_SM })
        .layoutWeight(1)

      Text(desc)
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ right: ThemeConstants.SPACING_XS })

      Image($r('app.media.Rightarrow'))
        .width(16)
        .height(16)
        .fillColor(ThemeColors.TEXT_HINT)
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .onClick(onClick)
  }
}
