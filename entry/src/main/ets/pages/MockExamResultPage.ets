/**
 * 模拟考试结果页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import {
  ExamResult,
  ExamConfig,
  TypeScore,
  SubjectScore,
  ExamType,
  mockExamService
} from '../services/MockExamService';
import { answerRecordService } from '../services/AnswerRecordService';
import { getSubjectShortName, getSubjectColor } from '../data/SubjectData';
import { Logger } from '../common/utils/Logger';

@Entry
@Component
struct MockExamResultPage {
  @State examResult: ExamResult | null = null;
  @State examConfig: ExamConfig | null = null;
  @State examRecordId: string = '';

  aboutToAppear(): void {
    const params: RouteParams = Router.getParams();
    this.examResult = params['examResult'] as ExamResult;
    this.examConfig = params['examConfig'] as ExamConfig;
    this.examRecordId = params['examRecordId'] as string || '';

    // 确保清除考试进度
    this.clearExamProgress();

    // 将错题加入错题本
    if (this.examResult && this.examResult.wrongQuestionIds.length > 0) {
      this.addWrongQuestions();
    }
  }

  private async clearExamProgress(): Promise<void> {
    try {
      await mockExamService.clearProgress();
      Logger.info('[MockExamResultPage] Exam progress cleared');
    } catch (error) {
      Logger.error('[MockExamResultPage] Failed to clear progress', error as Error);
    }
  }

  private async addWrongQuestions(): Promise<void> {
    if (!this.examResult) return;
    for (const questionId of this.examResult.wrongQuestionIds) {
      await answerRecordService.addToWrongBook(questionId);
    }
    Logger.info(`[MockExamResultPage] Added ${this.examResult.wrongQuestionIds.length} wrong questions`);
  }

  private formatDuration(seconds: number): string {
    const h = Math.floor(seconds / 3600);
    const m = Math.floor((seconds % 3600) / 60);
    const s = seconds % 60;
    if (h > 0) {
      return `${h}小时${m}分${s}秒`;
    }
    if (m > 0) {
      return `${m}分${s}秒`;
    }
    return `${s}秒`;
  }

  private getExamTypeName(): string {
    if (!this.examConfig) return '模拟考试';
    switch (this.examConfig.type) {
      case 'full': return '全真模拟';
      case 'subject': return '专项模拟';
      case 'quick': return '快速测验';
      case 'wrong': return '错题重考';
      default: return '模拟考试';
    }
  }

  private retakeExam(): void {
    if (!this.examConfig) {
      Router.back();
      return;
    }
    const params: RouteParams = {};
    params['examType'] = this.examConfig.type as Object;
    if (this.examConfig.subjectId) {
      params['subjectId'] = this.examConfig.subjectId as Object;
    }
    Router.replace('pages/MockExamPage', params);
  }

  private goHome(): void {
    Router.clearAndPush(AppConstants.ROUTE_MAIN);
  }

  private goToWrongBook(): void {
    Router.push(AppConstants.ROUTE_WRONG_BOOK);
  }

  build() {
    Column() {
      // 导航栏
      this.NavigationBar()

      if (!this.examResult) {
        this.EmptyState()
      } else {
        Scroll() {
          Column() {
            // 成绩卡片
            this.ScoreCard()
            // 查看答案解析按钮
            Button('查看答案解析')
              .fontSize(16)
              .fontColor(ThemeColors.WHITE)
              .backgroundColor(ThemeColors.SUCCESS)
              .borderRadius(24)
              .height(48)
              .width('100%')
              .margin({ top: 16 })
              .onClick(() => { this.viewAnswers(); })
            // 得分明细
            this.TypeScoreSection()
            // 科目分析
            if (this.examResult.subjectScores.length > 1) {
              this.SubjectScoreSection()
            }
            // 错题提示
            if (this.examResult.wrongQuestionIds.length > 0) {
              this.WrongQuestionTip()
            }
            // 操作按钮
            this.ActionButtons()
          }
          .width('100%')
          .padding({ left: 16, right: 16, bottom: 32 })
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
      Row().width(48).height(48)

      Text('考试结果')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Row() {
        Text('✕')
          .fontSize(20)
          .fontColor(ThemeColors.TEXT_HINT)
      }
      .width(48)
      .height(48)
      .justifyContent(FlexAlign.Center)
      .onClick(() => { this.goHome(); })
    }
    .width('100%')
    .height(56)
    .backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  EmptyState() {
    Column() {
      Text('😕')
        .fontSize(64)
      Text('未找到考试结果')
        .fontSize(16)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: 16 })
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  ScoreCard() {
    Column() {
      // 考试类型
      Text(this.getExamTypeName())
        .fontSize(14)
        .fontColor(ThemeColors.TEXT_SECONDARY)

      // 分数
      Row({ space: 4 }) {
        Text(`${this.examResult!.score}`)
          .fontSize(64)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.examResult!.isPassed ? ThemeColors.SUCCESS : ThemeColors.ERROR)
        Text(`/ ${this.examResult!.totalScore}`)
          .fontSize(20)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ bottom: 12 })
      }
      .margin({ top: 8 })

      // 及格状态
      Row({ space: 6 }) {
        Text(this.examResult!.isPassed ? '✅' : '❌')
          .fontSize(18)
        Text(this.examResult!.isPassed ? '恭喜通过！' : '未通过，继续加油！')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.examResult!.isPassed ? ThemeColors.SUCCESS : ThemeColors.ERROR)
      }

      // 统计信息
      Row({ space: 24 }) {
        this.StatItem('用时', this.formatDuration(this.examResult!.duration))
        this.StatItem('正确率', `${Math.round(this.examResult!.correctCount / this.examResult!.totalCount * 100)}%`)
        this.StatItem('答对', `${this.examResult!.correctCount}/${this.examResult!.totalCount}`)
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .padding(24)
    .margin({ top: 16 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(16)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  StatItem(label: string, value: string) {
    Column() {
      Text(value)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
      Text(label)
        .fontSize(12)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: 4 })
    }
  }

  @Builder
  TypeScoreSection() {
    Column() {
      Text('📊 得分明细')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .width('100%')

      Column({ space: 10 }) {
        ForEach(this.examResult!.typeScores, (item: TypeScore) => {
          Row() {
            Text(item.typeName)
              .fontSize(14)
              .fontColor(ThemeColors.TEXT_PRIMARY)
              .width(60)

            // 进度条
            Stack() {
              Row()
                .width('100%')
                .height(8)
                .backgroundColor(ThemeColors.GRAY_200)
                .borderRadius(4)

              Row()
                .width(`${item.totalCount > 0 ? (item.correctCount / item.totalCount * 100) : 0}%`)
                .height(8)
                .backgroundColor(ThemeColors.PRIMARY)
                .borderRadius(4)
            }
            .layoutWeight(1)
            .margin({ left: 12, right: 12 })

            Text(`${item.earnedScore}/${item.totalScore}`)
              .fontSize(13)
              .fontColor(ThemeColors.TEXT_SECONDARY)
              .width(60)
              .textAlign(TextAlign.End)
          }
          .width('100%')
        }, (item: TypeScore) => item.type)
      }
      .width('100%')
      .margin({ top: 12 })
    }
    .width('100%')
    .padding(16)
    .margin({ top: 16 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
  }

  @Builder
  SubjectScoreSection() {
    Column() {
      Text('📈 科目分析')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .width('100%')

      Column({ space: 10 }) {
        ForEach(this.examResult!.subjectScores, (item: SubjectScore) => {
          Row() {
            Text(getSubjectShortName(item.subjectId))
              .fontSize(12)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 8, right: 8, top: 3, bottom: 3 })
              .backgroundColor(getSubjectColor(item.subjectId))
              .borderRadius(8)
              .width(50)

            // 进度条
            Stack() {
              Row()
                .width('100%')
                .height(8)
                .backgroundColor(ThemeColors.GRAY_200)
                .borderRadius(4)

              Row()
                .width(`${item.accuracy}%`)
                .height(8)
                .backgroundColor(this.getAccuracyColor(item.accuracy))
                .borderRadius(4)
            }
            .layoutWeight(1)
            .margin({ left: 12, right: 12 })

            Text(`${item.accuracy}%`)
              .fontSize(13)
              .fontColor(this.getAccuracyColor(item.accuracy))
              .width(45)
              .textAlign(TextAlign.End)
          }
          .width('100%')
        }, (item: SubjectScore) => item.subjectId)
      }
      .width('100%')
      .margin({ top: 12 })
    }
    .width('100%')
    .padding(16)
    .margin({ top: 12 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
  }

  @Builder
  WrongQuestionTip() {
    Row() {
      Text('❌')
        .fontSize(20)

      Column() {
        Text(`本次考试错了 ${this.examResult!.wrongQuestionIds.length} 题`)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.TEXT_PRIMARY)
        Text('已自动加入错题本，记得复习哦')
          .fontSize(12)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .margin({ top: 2 })
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 12 })
      .layoutWeight(1)

      Text('去复习 >')
        .fontSize(13)
        .fontColor(ThemeColors.PRIMARY)
        .onClick(() => { this.goToWrongBook(); })
    }
    .width('100%')
    .padding(14)
    .margin({ top: 12 })
    .backgroundColor('#FFF1F0')
    .borderRadius(12)
    .border({ width: 1, color: '#FFCCC7' })
  }

  @Builder
  ActionButtons() {
    Row({ space: 16 }) {
      Button('再考一次')
        .fontSize(16)
        .fontColor(ThemeColors.PRIMARY)
        .backgroundColor(ThemeColors.GRAY_100)
        .borderRadius(24)
        .height(48)
        .layoutWeight(1)
        .onClick(() => { this.retakeExam(); })

      Button('返回首页')
        .fontSize(16)
        .fontColor(ThemeColors.WHITE)
        .backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(24)
        .height(48)
        .layoutWeight(1)
        .onClick(() => { this.goHome(); })
    }
    .width('100%')
    .margin({ top: 24 })
  }

  private viewAnswers(): void {
    const params: RouteParams = {};
    params['examRecordId'] = this.examRecordId as Object;
    params['examResult'] = this.examResult as Object;
    Router.push('pages/ExamAnswerPage', params);
  }

  private getAccuracyColor(accuracy: number): ResourceColor {
    if (accuracy >= 80) return ThemeColors.SUCCESS;
    if (accuracy >= 60) return ThemeColors.WARNING;
    return ThemeColors.ERROR;
  }
}
