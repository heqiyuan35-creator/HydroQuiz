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

@Entry
@Component
struct MockExamEntryPage {
  @State isLoading: boolean = true;
  @State hasProgress: boolean = false;
  @State historyRecords: MockExamRecord[] = [];
  @State showSubjectPicker: boolean = false;
  @State selectedExamType: ExamType = 'full';

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
      // 加载历史记录
      this.historyRecords = await mockExamService.getExamHistory(5);
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

  private formatDuration(seconds: number): string {
    const mins = Math.floor(seconds / 60);
    return `${mins}分钟`;
  }

  private formatDate(timestamp: number): string {
    const date = new Date(timestamp);
    const month = date.getMonth() + 1;
    const day = date.getDate();
    return `${month}/${day}`;
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
              // 历史记录
              if (this.historyRecords.length > 0) {
                this.HistorySection()
              }
            }
            .width('100%')
            .padding({ left: 16, right: 16, bottom: 24 })
          }
          .scrollBar(BarState.Off)
          .layoutWeight(1)
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
        Text('📋')
          .fontSize(20)
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
        Text('📝 有未完成的考试')
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.TEXT_PRIMARY)
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
          this.ExamTypeCard('full', '📋', '全真模拟', '100题', '120分钟', ThemeColors.PRIMARY)
        }
        // 专项模拟
        GridItem() {
          this.ExamTypeCard('subject', '📚', '专项模拟', '50题', '60分钟', ThemeColors.SUCCESS)
        }
        // 快速测验
        GridItem() {
          this.ExamTypeCard('quick', '⚡', '快速测验', '20题', '20分钟', ThemeColors.WARNING)
        }
        // 错题重考
        GridItem() {
          this.ExamTypeCard('wrong', '🔄', '错题重考', '30题', '30分钟', ThemeColors.ERROR)
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
  ExamTypeCard(type: ExamType, icon: string, title: string, count: string, time: string, color: ResourceColor) {
    Column() {
      Text(icon)
        .fontSize(32)
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

  @Builder
  HistorySection() {
    Column() {
      Row() {
        Text('最近考试')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Blank()

        Text('查看全部 >')
          .fontSize(13)
          .fontColor(ThemeColors.PRIMARY)
          .onClick(() => {
            Router.push('pages/MockExamHistoryPage');
          })
      }
      .width('100%')
      .margin({ top: 24, bottom: 12 })

      ForEach(this.historyRecords, (record: MockExamRecord) => {
        this.HistoryItem(record)
      }, (record: MockExamRecord) => record.id)
    }
    .width('100%')
  }

  @Builder
  HistoryItem(record: MockExamRecord) {
    Row() {
      Column() {
        Row({ space: 6 }) {
          Text(record.examTypeName)
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.TEXT_PRIMARY)

          if (record.subjectId) {
            Text(getSubjectShortName(record.subjectId))
              .fontSize(11)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 6, right: 6, top: 2, bottom: 2 })
              .backgroundColor(ThemeColors.PRIMARY)
              .borderRadius(8)
          }
        }

        Text(`${this.formatDate(record.createTime)} · 用时${this.formatDuration(record.duration)}`)
          .fontSize(12)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 4 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Column() {
        Text(`${record.score}`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(record.isPassed ? ThemeColors.SUCCESS : ThemeColors.ERROR)
        Text('分')
          .fontSize(11)
          .fontColor(ThemeColors.TEXT_HINT)
      }
    }
    .width('100%')
    .padding(14)
    .margin({ bottom: 10 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(10)
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
