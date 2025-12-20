/**
 * 模拟考试入口页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import { mockExamService, ExamType, MockExamRecord } from '../services/MockExamService';
import { SUBJECT_LIST, getSubjectShortName } from '../data/SubjectData';
import { SubjectInfo } from '../common/types/QuestionTypes';
import { Logger } from '../common/utils/Logger';
import { promptAction } from '@kit.ArkUI';

/**
 * 考试类型统计接口
 */
interface ExamTypeStat {
  type: string;
  name: string;
  count: number;
  percentage: number;
  color: ResourceColor;
}

/**
 * 考试类型配置接口
 */
interface ExamTypeConfig {
  name: string;
  color: ResourceColor;
}

/**
 * 考试类型图表数据接口
 */
interface ExamTypeChartItem {
  type: string;
  name: string;
  count: number;
  passCount: number;
  totalHeight: number;
  passHeight: number;
  color: ResourceColor;
}

/**
 * 考试类型计数接口
 */
interface ExamTypeCount {
  count: number;
  passCount: number;
}

@Entry
@Component
struct MockExamEntryPage {
  @State isLoading: boolean = true;
  @State hasProgress: boolean = false;
  @State showSubjectPicker: boolean = false;
  @State selectedExamType: ExamType = 'full';
  @State examRecords: MockExamRecord[] = [];

  aboutToAppear(): void {
    this.loadData();
  }

  onPageShow(): void {
    this.loadData();
  }

  private async loadData(): Promise<void> {
    try {
      // 初始化表
      await mockExamService.initTables();
      // 检查是否有未完成的考试
      const progress = await mockExamService.loadProgress();
      Logger.info(`[MockExamEntryPage] loadData: progress=${progress !== null}, remainingTime=${progress?.remainingTime}`);
      
      // 如果进度存在但剩余时间为0或无效，清除进度
      if (progress !== null) {
        if (progress.remainingTime <= 0 || progress.questionIds.length === 0) {
          Logger.info('[MockExamEntryPage] Clearing invalid/expired progress');
          await mockExamService.clearProgress();
          this.hasProgress = false;
        } else {
          this.hasProgress = true;
        }
      } else {
        this.hasProgress = false;
      }
      
      Logger.info(`[MockExamEntryPage] hasProgress=${this.hasProgress}`);
      
      // 加载考试记录用于分析
      this.examRecords = await mockExamService.getExamHistory(50);
    } catch (error) {
      Logger.error('[MockExamEntryPage] Failed to load data', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  private startExam(type: ExamType, subjectId?: string): void {
    const params: RouteParams = {};
    params['examType'] = type as Object;
    if (subjectId) {
      params['subjectId'] = subjectId as Object;
    }
    Router.push('pages/MockExamPage', params);
  }

  private continueExam(): void {
    const params: RouteParams = {};
    params['continueExam'] = true as Object;
    Router.push('pages/MockExamPage', params);
  }

  private onExamTypeClick(type: ExamType): void {
    if (type === 'subject') {
      this.selectedExamType = type;
      this.showSubjectPicker = true;
    } else {
      this.startExam(type);
    }
  }

  build() {
    Stack() {
      // 顶部背景色延伸到状态栏
      Column()
        .width('100%')
        .height(AppConstants.STATUS_BAR_HEIGHT + 56)
        .backgroundColor(ThemeColors.SURFACE)

      Column() {
        // 导航栏
        this.NavigationBar()

        if (this.isLoading) {
          this.LoadingState()
        } else {
          Scroll() {
            Column() {
              // 续考提示
              if (this.hasProgress) {
                this.ContinueExamCard()
              }
              // 考试类型选择
              this.ExamTypeSection()
              // 考试分析
              this.ExamAnalysisSection()
            }
            .width('100%')
            .padding({ left: 16, right: 16, top: 16, bottom: 24 })
          }
          .scrollBar(BarState.Off)
          .layoutWeight(1)
          .align(Alignment.Top)
        }

        // 科目选择弹窗
        if (this.showSubjectPicker) {
          this.SubjectPickerDialog()
        }
      }
      .width('100%')
      .height('100%')
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(ThemeColors.BACKGROUND)
  }

  @Builder
  NavigationBar() {
    Row() {
      Row() {
        Image($r('app.media.back'))
          .width(24)
          .height(24)
      }
      .width(48)
      .height(48)
      .justifyContent(FlexAlign.Center)
      .onClick(() => { Router.back(); })

      Text('模拟考试')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Row() {
        Image($r('app.media.Examresults'))
          .width(20)
          .height(20)
          .objectFit(ImageFit.Contain)
      }
      .width(48)
      .height(48)
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        Router.push('pages/MockExamHistoryPage');
      })
    }
    .width('100%')
    .height(56)
    .backgroundColor(ThemeColors.SURFACE)
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
  ContinueExamCard() {
    Row() {
      Column() {
        Row() {
          Image($r('app.media.Edit'))
            .width(15)
            .height(15)
            .objectFit(ImageFit.Contain)
          Text(' 有未完成的考试')
            .fontSize(15)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.TEXT_PRIMARY)
        }
        Text('点击继续上次的考试')
          .fontSize(13)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .margin({ top: 4 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Button('继续考试')
        .fontSize(14)
        .fontColor(ThemeColors.WHITE)
        .backgroundColor(ThemeColors.WARNING)
        .borderRadius(20)
        .height(36)
        .onClick(() => { this.continueExam(); })
    }
    .width('100%')
    .padding(16)
    .margin({ top: 16 })
    .backgroundColor('#FFF7E6')
    .borderRadius(12)
    .border({ width: 1, color: '#FFE4B5' })
  }

  @Builder
  ExamTypeSection() {
    Column() {
      Text('选择考试类型')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .width('100%')
        .margin({ top: 20, bottom: 12 })

      // 2x2 网格
      Grid() {
        // 全真模拟
        GridItem() {
          this.ExamTypeCard('full', $r('app.media.Exam'), '全真模拟', '100题', '120分钟', ThemeColors.PRIMARY)
        }
        // 专项模拟
        GridItem() {
          this.ExamTypeCard('subject', $r('app.media.Questionbank'), '专项模拟', '50题', '60分钟', ThemeColors.SUCCESS)
        }
        // 快速测验
        GridItem() {
          this.ExamTypeCard('quick', $r('app.media.Persevere'), '快速测验', '20题', '20分钟', ThemeColors.WARNING)
        }
        // 错题重考
        GridItem() {
          this.ExamTypeCard('wrong', $r('app.media.WrongQuestion'), '错题重考', '30题', '30分钟', ThemeColors.ERROR)
        }
      }
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(12)
      .rowsGap(12)
      .width('100%')
      .height(240)
    }
    .width('100%')
  }

  @Builder
  ExamTypeCard(type: ExamType, icon: Resource, title: string, count: string, time: string, color: ResourceColor) {
    Column() {
      Image(icon)
        .width(32)
        .height(32)
        .objectFit(ImageFit.Contain)
        .margin({ bottom: 8 })

      Text(title)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)

      Row({ space: 8 }) {
        Text(count)
          .fontSize(12)
          .fontColor(ThemeColors.TEXT_SECONDARY)
        Text('|')
          .fontSize(12)
          .fontColor(ThemeColors.BORDER)
        Text(time)
          .fontSize(12)
          .fontColor(ThemeColors.TEXT_SECONDARY)
      }
      .margin({ top: 6 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
    .border({ width: 2, color: color })
    .onClick(() => { this.onExamTypeClick(type); })
  }

  /**
   * 考试分析模块
   */
  @Builder
  ExamAnalysisSection() {
    Column() {
      // 标题
      Row() {
        Text('📊')
          .fontSize(18)
        Text(' 考试分析')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Blank()

        if (this.examRecords.length > 0) {
          Text('查看详情 >')
            .fontSize(13)
            .fontColor(ThemeColors.PRIMARY)
            .onClick(() => {
              Router.push('pages/MockExamHistoryPage');
            })
        }
      }
      .width('100%')
      .margin({ top: 24, bottom: 12 })

      if (this.examRecords.length === 0) {
        // 无数据提示
        this.EmptyAnalysisCard()
      } else {
        // 有数据显示分析
        this.AnalysisContent()
      }
    }
    .width('100%')
  }

  /**
   * 无数据提示卡片
   */
  @Builder
  EmptyAnalysisCard() {
    Column() {
      Image($r('app.media.Exam'))
        .width(64)
        .height(64)
        .objectFit(ImageFit.Contain)
        .opacity(0.6)

      Text('暂无考试记录')
        .fontSize(16)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: 16 })

      Text('完成一次模拟考试后，这里将展示你的考试分析数据')
        .fontSize(13)
        .fontColor(ThemeColors.TEXT_HINT)
        .textAlign(TextAlign.Center)
        .margin({ top: 8 })

      Button('开始第一次考试')
        .fontSize(14)
        .fontColor(ThemeColors.WHITE)
        .backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(20)
        .height(40)
        .margin({ top: 20 })
        .onClick(() => {
          this.startExam('full');
        })
    }
    .width('100%')
    .padding({ top: 32, bottom: 32, left: 24, right: 24 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
  }

  /**
   * 分析内容
   */
  @Builder
  AnalysisContent() {
    Column() {
      // 统计概览
      this.StatsOverview()

      // 考试类型统计图表
      this.ExamTypeChart()
    }
    .width('100%')
  }

  /**
   * 统计概览
   */
  @Builder
  StatsOverview() {
    Row() {
      this.StatItem('考试次数', `${this.examRecords.length}`, ThemeColors.PRIMARY)
      this.StatItem('通过率', `${this.getPassRate()}%`, this.getPassRate() >= 60 ? ThemeColors.SUCCESS : ThemeColors.ERROR)
      this.StatItem('平均分', `${this.getAvgScore()}`, ThemeColors.WARNING)
      this.StatItem('最高分', `${this.getHighestScore()}`, ThemeColors.SUCCESS)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
    .justifyContent(FlexAlign.SpaceAround)
  }

  @Builder
  StatItem(label: string, value: string, color: ResourceColor) {
    Column() {
      Text(value)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(color)
      Text(label)
        .fontSize(12)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: 4 })
    }
  }

  /**
   * 考试类型统计图表
   */
  @Builder
  ExamTypeChart() {
    Column() {
      Row() {
        Text('📊')
          .fontSize(14)
        Text(' 考试统计')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.TEXT_PRIMARY)
      }
      .width('100%')
      .margin({ bottom: 16 })

      // 柱状图
      Row() {
        ForEach(this.getExamTypeChartData(), (item: ExamTypeChartItem) => {
          Column() {
            // 合格/总数标签
            Text(`${item.passCount}/${item.count}`)
              .fontSize(11)
              .fontColor(ThemeColors.TEXT_SECONDARY)
              .margin({ bottom: 4 })

            // 柱子容器
            Stack({ alignContent: Alignment.Bottom }) {
              // 总数柱子（灰色背景）
              Column()
                .width(32)
                .height(item.totalHeight)
                .backgroundColor(ThemeColors.GRAY_200)
                .borderRadius(4)

              // 合格柱子（彩色）
              Column()
                .width(32)
                .height(item.passHeight)
                .backgroundColor(item.color)
                .borderRadius(4)
            }
            .height(80)

            // 类型名称
            Text(item.name)
              .fontSize(11)
              .fontColor(ThemeColors.TEXT_SECONDARY)
              .margin({ top: 8 })
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Center)
        }, (item: ExamTypeChartItem) => item.type)
      }
      .width('100%')

      // 图例
      Row({ space: 16 }) {
        Row({ space: 4 }) {
          Column()
            .width(12)
            .height(12)
            .backgroundColor(ThemeColors.GRAY_200)
            .borderRadius(2)
          Text('考试次数')
            .fontSize(11)
            .fontColor(ThemeColors.TEXT_HINT)
        }

        Row({ space: 4 }) {
          Column()
            .width(12)
            .height(12)
            .backgroundColor(ThemeColors.SUCCESS)
            .borderRadius(2)
          Text('合格次数')
            .fontSize(11)
            .fontColor(ThemeColors.TEXT_HINT)
        }
      }
      .width('100%')
      .margin({ top: 12 })
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .padding(16)
    .margin({ top: 12 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
  }

  // 统计方法
  private getPassRate(): number {
    if (this.examRecords.length === 0) return 0;
    const passed = this.examRecords.filter(r => r.isPassed).length;
    return Math.round(passed / this.examRecords.length * 100);
  }

  private getAvgScore(): number {
    if (this.examRecords.length === 0) return 0;
    const total = this.examRecords.reduce((sum, r) => sum + r.score, 0);
    return Math.round(total / this.examRecords.length);
  }

  private getHighestScore(): number {
    if (this.examRecords.length === 0) return 0;
    return Math.round(Math.max(...this.examRecords.map(r => r.score)));
  }

  private getExamTypeStats(): ExamTypeStat[] {
    const typeMap: Map<string, number> = new Map();
    this.examRecords.forEach(r => {
      const count = typeMap.get(r.examType) || 0;
      typeMap.set(r.examType, count + 1);
    });

    const total = this.examRecords.length;
    const stats: ExamTypeStat[] = [];

    const fullConfig: ExamTypeConfig = { name: '全真模拟', color: ThemeColors.PRIMARY };
    const subjectConfig: ExamTypeConfig = { name: '专项模拟', color: ThemeColors.SUCCESS };
    const quickConfig: ExamTypeConfig = { name: '快速测验', color: ThemeColors.WARNING };
    const wrongConfig: ExamTypeConfig = { name: '错题重考', color: ThemeColors.ERROR };
    const defaultConfig: ExamTypeConfig = { name: '其他', color: ThemeColors.GRAY_400 };

    typeMap.forEach((count, type) => {
      let config: ExamTypeConfig;
      if (type === 'full') {
        config = fullConfig;
      } else if (type === 'subject') {
        config = subjectConfig;
      } else if (type === 'quick') {
        config = quickConfig;
      } else if (type === 'wrong') {
        config = wrongConfig;
      } else {
        config = defaultConfig;
      }

      const stat: ExamTypeStat = {
        type: type,
        name: config.name,
        count: count,
        percentage: Math.round(count / total * 100),
        color: config.color
      };
      stats.push(stat);
    });

    return stats;
  }

  private getExamTypeChartData(): ExamTypeChartItem[] {
    const typeMap: Map<string, ExamTypeCount> = new Map();
    
    // 统计每种类型的考试次数和合格次数
    this.examRecords.forEach(r => {
      const existing = typeMap.get(r.examType);
      if (existing) {
        existing.count += 1;
        if (r.isPassed) existing.passCount += 1;
      } else {
        const newCount: ExamTypeCount = { count: 1, passCount: r.isPassed ? 1 : 0 };
        typeMap.set(r.examType, newCount);
      }
    });

    let maxCount = 1;
    typeMap.forEach((value) => {
      if (value.count > maxCount) maxCount = value.count;
    });
    const maxHeight = 70;

    const fullConfig: ExamTypeConfig = { name: '全真模拟', color: ThemeColors.PRIMARY };
    const subjectConfig: ExamTypeConfig = { name: '专项模拟', color: ThemeColors.SUCCESS };
    const quickConfig: ExamTypeConfig = { name: '快速测验', color: ThemeColors.WARNING };
    const wrongConfig: ExamTypeConfig = { name: '错题重考', color: ThemeColors.ERROR };

    const result: ExamTypeChartItem[] = [];
    const types: string[] = ['full', 'subject', 'quick', 'wrong'];

    types.forEach(type => {
      let config: ExamTypeConfig;
      if (type === 'full') config = fullConfig;
      else if (type === 'subject') config = subjectConfig;
      else if (type === 'quick') config = quickConfig;
      else config = wrongConfig;

      const data = typeMap.get(type);
      const count = data ? data.count : 0;
      const passCount = data ? data.passCount : 0;

      const item: ExamTypeChartItem = {
        type: type,
        name: config.name,
        count: count,
        passCount: passCount,
        totalHeight: count > 0 ? Math.max(10, (count / maxCount) * maxHeight) : 10,
        passHeight: passCount > 0 ? Math.max(5, (passCount / maxCount) * maxHeight) : 0,
        color: config.color
      };
      result.push(item);
    });

    return result;
  }

  @Builder
  SubjectPickerDialog() {
    Column() {
      // 遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.5)')
        .onClick(() => { this.showSubjectPicker = false; })
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })

    Column() {
      // 拖动条
      Row() {
        Column().width(40).height(4).backgroundColor(ThemeColors.GRAY_300).borderRadius(2)
      }
      .width('100%')
      .padding({ top: 12, bottom: 8 })
      .justifyContent(FlexAlign.Center)

      Text('选择科目')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ bottom: 16 })

      // 科目列表
      Scroll() {
        Column() {
          ForEach(SUBJECT_LIST, (subject: SubjectInfo) => {
            Row() {
              Text(subject.shortName)
                .fontSize(12)
                .fontColor(ThemeColors.WHITE)
                .padding({ left: 10, right: 10, top: 4, bottom: 4 })
                .backgroundColor(subject.color)
                .borderRadius(10)

              Text(subject.name)
                .fontSize(15)
                .fontColor(ThemeColors.TEXT_PRIMARY)
                .margin({ left: 12 })
                .layoutWeight(1)

              Text('>')
                .fontSize(16)
                .fontColor(ThemeColors.TEXT_HINT)
            }
            .width('100%')
            .padding(14)
            .margin({ bottom: 8 })
            .backgroundColor(ThemeColors.GRAY_50)
            .borderRadius(10)
            .onClick(() => {
              this.showSubjectPicker = false;
              this.startExam('subject', subject.id);
            })
          }, (subject: SubjectInfo) => subject.id)
        }
        .width('100%')
      }
      .scrollBar(BarState.Off)
      .layoutWeight(1)

      // 取消按钮
      Button('取消')
        .width('100%')
        .height(48)
        .fontSize(16)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .backgroundColor(ThemeColors.GRAY_100)
        .borderRadius(24)
        .margin({ top: 16 })
        .onClick(() => { this.showSubjectPicker = false; })
    }
    .width('100%')
    .height('60%')
    .padding({ left: 20, right: 20, bottom: 32 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius({ topLeft: 20, topRight: 20 })
    .position({ x: 0, y: '40%' })
  }
}
