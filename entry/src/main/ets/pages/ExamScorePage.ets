/**
 * 考试成绩页面
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
struct ExamScorePage {
  @State isLoading: boolean = true;
  @State records: MockExamRecord[] = [];
  @State selectedFilter: string = 'all';

  aboutToAppear(): void {
    this.loadData();
  }

  onPageShow(): void {
    this.loadData();
  }

  private async loadData(): Promise<void> {
    try {
      this.records = await mockExamService.getExamHistory(100);
    } catch (error) {
      Logger.error('[ExamScorePage] Failed to load data', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  private getFilteredRecords(): MockExamRecord[] {
    if (this.selectedFilter === 'all') return this.records;
    if (this.selectedFilter === 'passed') return this.records.filter(r => r.isPassed);
    if (this.selectedFilter === 'failed') return this.records.filter(r => !r.isPassed);
    return this.records;
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
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    const hour = date.getHours().toString().padStart(2, '0');
    const minute = date.getMinutes().toString().padStart(2, '0');
    return `${month}-${day} ${hour}:${minute}`;
  }

  private formatDuration(seconds: number): string {
    const m = Math.floor(seconds / 60);
    const s = seconds % 60;
    return `${m}分${s}秒`;
  }

  private getTotalExams(): number { return this.records.length; }
  private getPassRate(): number {
    if (this.records.length === 0) return 0;
    return Math.round(this.records.filter(r => r.isPassed).length / this.records.length * 100);
  }
  private getAvgScore(): number {
    if (this.records.length === 0) return 0;
    return Math.round(this.records.reduce((sum, r) => sum + r.score, 0) / this.records.length);
  }
  private getHighestScore(): number {
    if (this.records.length === 0) return 0;
    return Math.max(...this.records.map(r => r.score));
  }

  build() {
    Column() {
      this.NavigationBar()

      if (this.isLoading) {
        this.LoadingState()
      } else if (this.records.length === 0) {
        this.EmptyState()
      } else {
        Scroll() {
          Column() {
            this.StatsCard()
            this.FilterBar()
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
        Image($r('app.media.back')).width(24).height(24)
      }
      .width(48).height(48).justifyContent(FlexAlign.Center)
      .onClick(() => { Router.back(); })

      Text('考试成绩')
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
    .width('100%').layoutWeight(1).justifyContent(FlexAlign.Center)
  }

  @Builder
  EmptyState() {
    Column() {
      Text('📋').fontSize(64)
      Text('暂无考试记录')
        .fontSize(16).fontColor(ThemeColors.TEXT_SECONDARY).margin({ top: 16 })
      Text('完成一次模拟考试后，成绩会显示在这里')
        .fontSize(14).fontColor(ThemeColors.TEXT_HINT).margin({ top: 8 })
      Button('去考试')
        .fontSize(15).fontColor(ThemeColors.WHITE).backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(24).height(44).margin({ top: 24 })
        .onClick(() => { Router.replace('pages/MockExamEntryPage'); })
    }
    .width('100%').layoutWeight(1).justifyContent(FlexAlign.Center)
  }

  @Builder
  StatsCard() {
    Column() {
      // 最高分突出显示
      Column() {
        Text('最高分')
          .fontSize(14).fontColor('rgba(255,255,255,0.8)')
        Text(`${this.getHighestScore()}`)
          .fontSize(48).fontWeight(FontWeight.Bold).fontColor(ThemeColors.WHITE)
          .margin({ top: 4 })
      }
      .width('100%')
      .padding(20)
      .linearGradient({
        angle: 135,
        colors: [[ThemeColors.PRIMARY_DARK, 0], [ThemeColors.PRIMARY, 1]]
      })
      .borderRadius({ topLeft: 12, topRight: 12 })

      // 其他统计
      Row() {
        this.StatItem('考试次数', `${this.getTotalExams()}`)
        this.StatItem('通过率', `${this.getPassRate()}%`)
        this.StatItem('平均分', `${this.getAvgScore()}`)
      }
      .width('100%')
      .padding(16)
      .backgroundColor(ThemeColors.SURFACE)
      .borderRadius({ bottomLeft: 12, bottomRight: 12 })
      .justifyContent(FlexAlign.SpaceAround)
    }
    .width('100%')
    .margin({ top: 16 })
    .shadow({ radius: 8, color: 'rgba(0,0,0,0.08)', offsetY: 2 })
  }

  @Builder
  StatItem(label: string, value: string) {
    Column() {
      Text(value)
        .fontSize(20).fontWeight(FontWeight.Bold).fontColor(ThemeColors.PRIMARY)
      Text(label)
        .fontSize(12).fontColor(ThemeColors.TEXT_HINT).margin({ top: 4 })
    }
  }

  @Builder
  FilterBar() {
    Row({ space: 12 }) {
      this.FilterChip('all', '全部')
      this.FilterChip('passed', '已通过')
      this.FilterChip('failed', '未通过')
    }
    .width('100%')
    .margin({ top: 16 })
  }

  @Builder
  FilterChip(value: string, label: string) {
    Text(label)
      .fontSize(13)
      .fontColor(this.selectedFilter === value ? ThemeColors.WHITE : ThemeColors.TEXT_SECONDARY)
      .padding({ left: 16, right: 16, top: 8, bottom: 8 })
      .backgroundColor(this.selectedFilter === value ? ThemeColors.PRIMARY : ThemeColors.SURFACE)
      .borderRadius(20)
      .onClick(() => { this.selectedFilter = value; })
  }

  @Builder
  RecordList() {
    Column() {
      ForEach(this.getFilteredRecords(), (record: MockExamRecord) => {
        this.RecordItem(record)
      }, (record: MockExamRecord) => record.id)
    }
    .width('100%')
    .margin({ top: 12 })
  }

  @Builder
  RecordItem(record: MockExamRecord) {
    Row() {
      // 分数圆环
      Stack() {
        Progress({ value: record.score, total: 100, type: ProgressType.Ring })
          .width(56).height(56)
          .color(record.isPassed ? ThemeColors.SUCCESS : ThemeColors.ERROR)
          .backgroundColor('#F0F0F0')
          .style({ strokeWidth: 6 })
        Text(`${record.score}`)
          .fontSize(16).fontWeight(FontWeight.Bold)
          .fontColor(record.isPassed ? ThemeColors.SUCCESS : ThemeColors.ERROR)
      }

      // 信息
      Column() {
        Row({ space: 8 }) {
          Text(record.examTypeName)
            .fontSize(15).fontWeight(FontWeight.Medium).fontColor(ThemeColors.TEXT_PRIMARY)
          if (record.subjectId) {
            Text(getSubjectShortName(record.subjectId))
              .fontSize(10).fontColor(ThemeColors.WHITE)
              .padding({ left: 6, right: 6, top: 2, bottom: 2 })
              .backgroundColor(getSubjectColor(record.subjectId))
              .borderRadius(8)
          }
          Text(record.isPassed ? '通过' : '未通过')
            .fontSize(11)
            .fontColor(record.isPassed ? ThemeColors.SUCCESS : ThemeColors.ERROR)
            .padding({ left: 6, right: 6, top: 2, bottom: 2 })
            .backgroundColor(record.isPassed ? '#E6F7E6' : '#FFF0F0')
            .borderRadius(8)
        }

        Text(this.formatDate(record.createTime))
          .fontSize(12).fontColor(ThemeColors.TEXT_HINT).margin({ top: 6 })

        Row({ space: 16 }) {
          Text(`正确 ${record.correctCount}/${record.totalCount}`)
            .fontSize(12).fontColor(ThemeColors.TEXT_SECONDARY)
          Text(`用时 ${this.formatDuration(record.duration)}`)
            .fontSize(12).fontColor(ThemeColors.TEXT_SECONDARY)
        }
        .margin({ top: 4 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ left: 14 })

      // 删除
      Text('×')
        .fontSize(20).fontColor(ThemeColors.TEXT_HINT)
        .onClick(() => { this.confirmDelete(record); })
    }
    .width('100%')
    .padding(14)
    .margin({ bottom: 10 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
  }
}
