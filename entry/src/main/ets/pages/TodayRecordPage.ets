/**
 * 今日刷题记录页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { answerRecordService } from '../services/AnswerRecordService';
import { questionService } from '../services/QuestionService';
import { Question, AnswerRecord } from '../common/types/QuestionTypes';
import { getSubjectShortName, getSubjectColor } from '../data/SubjectData';
import { Logger } from '../common/utils/Logger';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 今日记录显示项
 */
interface TodayRecordItem {
  record: AnswerRecord;
  question: Question;
}

@Entry
@Component
struct TodayRecordPage {
  @State isDarkMode: boolean = false;
  @State isLoading: boolean = true;
  @State recordItems: TodayRecordItem[] = [];
  @State correctCount: number = 0;
  @State totalCount: number = 0;

  aboutToAppear(): void {
    this.loadTodayRecords();
  }

  /**
   * 加载今日记录
   */
  private async loadTodayRecords(): Promise<void> {
    try {
      const records = await answerRecordService.getTodayAnswerRecords();
      const items: TodayRecordItem[] = [];
      let correct = 0;

      // 去重，只保留每道题最新的一条记录
      const seenQuestions = new Set<string>();

      for (const record of records) {
        if (seenQuestions.has(record.questionId)) {
          continue;
        }
        seenQuestions.add(record.questionId);

        const question = await questionService.getQuestionById(record.questionId);
        if (question) {
          items.push({ record, question });
          if (record.isCorrect) {
            correct++;
          }
        }
      }

      this.recordItems = items;
      this.correctCount = correct;
      this.totalCount = items.length;
      Logger.info(`[TodayRecordPage] Loaded ${items.length} today records`);
    } catch (error) {
      Logger.error('[TodayRecordPage] Failed to load today records', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  /**
   * 查看单个题目
   */
  private viewQuestion(item: TodayRecordItem): void {
    const params: RouteParams = {};
    params['questionId'] = item.question.id as Object;
    params['mode'] = 'single' as Object;
    Router.goToAnswer(params);
  }

  build() {
    Column() {
      // 顶部导航栏
      this.NavigationBar()

      if (this.isLoading) {
        Column() {
          LoadingProgress()
            .width(48)
            .height(48)
            .color(ThemeColors.PRIMARY)
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else if (this.recordItems.length === 0) {
        this.EmptyState()
      } else {
        // 统计卡片
        this.StatisticsCard()
        // 记录列表
        this.RecordList()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.isDarkMode ? ThemeColors.BACKGROUND_DARK : ThemeColors.BACKGROUND)
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
      .width(40)
      .height(40)
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        Router.back();
      })

      Text('今日刷题')
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
  }

  @Builder
  StatisticsCard() {
    Row() {
      Column() {
        Text(`${this.totalCount}`)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.PRIMARY)
        Text('总题数')
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 4 })
      }
      .layoutWeight(1)

      Column() {
        Text(`${this.correctCount}`)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.SUCCESS)
        Text('正确')
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 4 })
      }
      .layoutWeight(1)

      Column() {
        Text(`${this.totalCount - this.correctCount}`)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.ERROR)
        Text('错误')
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 4 })
      }
      .layoutWeight(1)

      Column() {
        Text(this.totalCount > 0 ? `${Math.round((this.correctCount / this.totalCount) * 100)}%` : '0%')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.WARNING)
        Text('正确率')
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 4 })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
  }

  @Builder
  EmptyState() {
    Column() {
      Text('📝')
        .fontSize(64)

      Text('今天还没有做题')
        .fontSize(ThemeConstants.FONT_SIZE_XL)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ top: ThemeConstants.SPACING_MD })

      Text('开始刷题，记录会显示在这里')
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: ThemeConstants.SPACING_SM })

      Button('去做题')
        .width(120)
        .height(44)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .backgroundColor(ThemeColors.PRIMARY)
        .margin({ top: ThemeConstants.SPACING_LG })
        .onClick(() => {
          Router.goToPractice();
        })
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  RecordList() {
    List() {
      ForEach(this.recordItems, (item: TodayRecordItem) => {
        ListItem() {
          this.RecordItem(item)
        }
      })
    }
    .width('100%')
    .layoutWeight(1)
    .padding(ThemeConstants.SPACING_MD)
  }

  @Builder
  RecordItem(item: TodayRecordItem) {
    Row() {
      // 正确/错误标识
      Column() {
        Text(item.record.isCorrect ? '✓' : '✗')
          .fontSize(16)
          .fontColor(ThemeColors.WHITE)
      }
      .width(28)
      .height(28)
      .borderRadius(14)
      .backgroundColor(item.record.isCorrect ? ThemeColors.SUCCESS : ThemeColors.ERROR)
      .justifyContent(FlexAlign.Center)

      // 题目信息
      Column() {
        Row() {
          // 科目标签 - 使用实色背景确保可读性
          Text(getSubjectShortName(item.question.subjectId))
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.WHITE)
            .padding({ left: 8, right: 8, top: 3, bottom: 3 })
            .backgroundColor(this.getSubjectTagColor(item.question.subjectId))
            .borderRadius(4)

          Text(this.formatTime(item.record.createTime))
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_HINT)
            .margin({ left: ThemeConstants.SPACING_SM })
        }

        Text(item.question.content)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: ThemeConstants.SPACING_XS })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({ left: ThemeConstants.SPACING_SM })

      // 箭头
      Image($r('app.media.Rightarrow'))
        .width(16)
        .height(16)
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ bottom: ThemeConstants.SPACING_SM })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .onClick(() => {
      this.viewQuestion(item);
    })
  }

  /**
   * 获取科目标签颜色（确保深色可读）
   */
  private getSubjectTagColor(subjectId: string): string {
    const color = getSubjectColor(subjectId);
    // 如果颜色无效或太浅，使用默认蓝色
    if (!color || color === ThemeColors.PRIMARY) {
      return '#1677FF';
    }
    return color;
  }

  /**
   * 格式化时间
   */
  private formatTime(timestamp: number): string {
    const date = new Date(timestamp);
    const hour = date.getHours().toString().padStart(2, '0');
    const minute = date.getMinutes().toString().padStart(2, '0');
    return `${hour}:${minute}`;
  }
}
