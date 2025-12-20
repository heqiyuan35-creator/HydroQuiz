/**
 * 模拟考试历史记录页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import { mockExamService, MockExamRecord } from '../services/MockExamService';
import { getSubjectShortName, getSubjectColor } from '../data/SubjectData';
import { Logger } from '../common/utils/Logger';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct MockExamHistoryPage {
  @State isLoading: boolean = true;
  @State records: MockExamRecord[] = [];

  aboutToAppear(): void {
    this.loadData();
  }

  onPageShow(): void {
    this.loadData();
  }

  private async loadData(): Promise<void> {
    try {
      this.records = await mockExamService.getExamHistory(50);
    } catch (error) {
      Logger.error('[MockExamHistoryPage] Failed to load data', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  private confirmDelete(record: MockExamRecord): void {
    promptAction.showDialog({
      title: '删除记录',
      message: '确定要删除这条考试记录吗？',
      buttons: [
        { text: '取消', color: ThemeColors.TEXT_SECONDARY },
        { text: '删除', color: ThemeColors.ERROR }
      ]
    }).then(async (result) => {
      if (result.index === 1) {
        const success = await mockExamService.deleteExamRecord(record.id);
        if (success) {
          this.records = this.records.filter(r => r.id !== record.id);
          promptAction.showToast({ message: '已删除', duration: 1500 });
        }
      }
    });
  }

  private formatDate(timestamp: number): string {
    const date = new Date(timestamp);
    const year = date.getFullYear();
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    const hour = date.getHours().toString().padStart(2, '0');
    const minute = date.getMinutes().toString().padStart(2, '0');
    return `${year}-${month}-${day} ${hour}:${minute}`;
  }

  private formatDuration(seconds: number): string {
    const h = Math.floor(seconds / 3600);
    const m = Math.floor((seconds % 3600) / 60);
    if (h > 0) {
      return `${h}小时${m}分`;
    }
    return `${m}分钟`;
  }

  // 统计数据
  private getTotalExams(): number {
    return this.records.length;
  }

  private getPassRate(): number {
    if (this.records.length === 0) return 0;
    const passed = this.records.filter(r => r.isPassed).length;
    return Math.round(passed / this.records.length * 100);
  }

  private getAvgScore(): number {
    if (this.records.length === 0) return 0;
    const total = this.records.reduce((sum, r) => sum + r.score, 0);
    return Math.round(total / this.records.length);
  }

  private getHighestScore(): number {
    if (this.records.length === 0) return 0;
    return Math.max(...this.records.map(r => r.score));
  }

  build() {
    Column() {
      // 导航栏
      this.NavigationBar()

      if (this.isLoading) {
        this.LoadingState()
      } else if (this.records.length === 0) {
        this.EmptyState()
      } else {
        Scroll() {
          Column() {
            // 统计卡片
            this.StatsCard()
            // 记录列表
            this.RecordList()
          }
          .width('100%')
          .padding({ left: 16, right: 16, bottom: 24 })
        }
        .scrollBar(BarState.Off)
        .layoutWeight(1)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(ThemeColors.BACKGROUND)
    .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
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

      Text('考试记录')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Row().width(48).height(48)
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
  EmptyState() {
    Column() {
      Text('📋')
        .fontSize(64)
      Text('暂无考试记录')
        .fontSize(16)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: 16 })
      Text('完成一次模拟考试后，记录会显示在这里')
        .fontSize(14)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: 8 })

      Button('去考试')
        .fontSize(15)
        .fontColor(ThemeColors.WHITE)
        .backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(24)
        .height(44)
        .margin({ top: 24 })
        .onClick(() => {
          Router.replace('pages/MockExamEntryPage');
        })
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  StatsCard() {
    Row() {
      this.StatItem('考试次数', `${this.getTotalExams()}`)
      this.StatItem('通过率', `${this.getPassRate()}%`)
      this.StatItem('平均分', `${this.getAvgScore()}`)
      this.StatItem('最高分', `${this.getHighestScore()}`)
    }
    .width('100%')
    .padding(16)
    .margin({ top: 16 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
    .justifyContent(FlexAlign.SpaceAround)
  }

  @Builder
  StatItem(label: string, value: string) {
    Column() {
      Text(value)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.PRIMARY)
      Text(label)
        .fontSize(12)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: 4 })
    }
  }

  @Builder
  RecordList() {
    Column() {
      Text('历史记录')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .width('100%')
        .margin({ top: 20, bottom: 12 })

      ForEach(this.records, (record: MockExamRecord) => {
        this.RecordItem(record)
      }, (record: MockExamRecord) => record.id)
    }
    .width('100%')
  }

  @Builder
  RecordItem(record: MockExamRecord) {
    Row() {
      // 左侧信息
      Column() {
        Row({ space: 8 }) {
          Text(record.examTypeName)
            .fontSize(15)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.TEXT_PRIMARY)

          if (record.subjectId) {
            Text(getSubjectShortName(record.subjectId))
              .fontSize(11)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 6, right: 6, top: 2, bottom: 2 })
              .backgroundColor(getSubjectColor(record.subjectId))
              .borderRadius(8)
          }

          Text(record.isPassed ? '✅' : '❌')
            .fontSize(14)
        }

        Text(this.formatDate(record.createTime))
          .fontSize(12)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 6 })

        Row({ space: 12 }) {
          Text(`答对 ${record.correctCount}/${record.totalCount}`)
            .fontSize(12)
            .fontColor(ThemeColors.TEXT_SECONDARY)
          Text(`用时 ${this.formatDuration(record.duration)}`)
            .fontSize(12)
            .fontColor(ThemeColors.TEXT_SECONDARY)
        }
        .margin({ top: 4 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      // 右侧分数
      Column() {
        Text(`${record.score}`)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(record.isPassed ? ThemeColors.SUCCESS : ThemeColors.ERROR)
        Text('分')
          .fontSize(12)
          .fontColor(ThemeColors.TEXT_HINT)
      }
      .margin({ left: 16 })

      // 删除按钮
      Text('🗑')
        .fontSize(18)
        .margin({ left: 12 })
        .onClick(() => { this.confirmDelete(record); })
    }
    .width('100%')
    .padding(14)
    .margin({ bottom: 10 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
  }
}
