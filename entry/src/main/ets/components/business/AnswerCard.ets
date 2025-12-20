/**
 * 答题卡组件
 * HydroQuiz - 水利工程检测员刷题宝
 * 用于快速跳转到指定题目
 */
import { ThemeColors } from '../../theme/ThemeColors';
import { ThemeConstants } from '../../theme/ThemeConstants';

/**
 * 题目状态
 */
export enum QuestionStatus {
  UNANSWERED = 0,  // 未答
  CORRECT = 1,     // 正确
  WRONG = 2,       // 错误
  ANSWERED = 3     // 已答（未判断对错）
}

/**
 * 答题卡项数据
 */
export interface AnswerCardItem {
  index: number;
  status: QuestionStatus;
}

@Component
export struct AnswerCard {
  @Prop totalCount: number = 0;
  @Prop currentIndex: number = 0;
  @Prop answeredMap: Map<number, QuestionStatus> = new Map();
  @Prop showResult: boolean = false;
  onSelect: (index: number) => void = () => {};
  onClose: () => void = () => {};

  /**
   * 获取题目状态
   */
  private getStatus(index: number): QuestionStatus {
    return this.answeredMap.get(index) ?? QuestionStatus.UNANSWERED;
  }

  /**
   * 获取状态颜色
   */
  private getStatusColor(status: QuestionStatus): string {
    switch (status) {
      case QuestionStatus.CORRECT:
        return ThemeColors.SUCCESS;
      case QuestionStatus.WRONG:
        return ThemeColors.ERROR;
      case QuestionStatus.ANSWERED:
        return ThemeColors.PRIMARY;
      default:
        return ThemeColors.GRAY_200;
    }
  }

  /**
   * 获取统计数据
   */
  private getStatistics(): { answered: number; unanswered: number; correct: number; wrong: number } {
    let answered = 0;
    let correct = 0;
    let wrong = 0;

    this.answeredMap.forEach((status: QuestionStatus) => {
      if (status !== QuestionStatus.UNANSWERED) {
        answered++;
        if (status === QuestionStatus.CORRECT) correct++;
        if (status === QuestionStatus.WRONG) wrong++;
      }
    });

    return {
      answered,
      unanswered: this.totalCount - answered,
      correct,
      wrong
    };
  }

  build() {
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
            this.onClose();
          })
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD })

      // 统计信息
      this.StatisticsBar()

      // 题目网格
      Scroll() {
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
          ForEach(this.generateIndexArray(), (index: number) => {
            this.QuestionItem(index)
          })
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_SM)
      }
      .layoutWeight(1)

      // 图例
      this.Legend()
    }
    .width('100%')
    .height('70%')
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius({ topLeft: ThemeConstants.RADIUS_LG, topRight: ThemeConstants.RADIUS_LG })
  }

  /**
   * 生成索引数组
   */
  private generateIndexArray(): number[] {
    const arr: number[] = [];
    for (let i = 0; i < this.totalCount; i++) {
      arr.push(i);
    }
    return arr;
  }

  /**
   * 统计栏
   */
  @Builder
  StatisticsBar() {
    Row() {
      const stats = this.getStatistics();

      this.StatItem('已答', stats.answered, ThemeColors.PRIMARY)
      this.StatItem('未答', stats.unanswered, ThemeColors.GRAY_400)

      if (this.showResult) {
        this.StatItem('正确', stats.correct, ThemeColors.SUCCESS)
        this.StatItem('错误', stats.wrong, ThemeColors.ERROR)
      }
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .justifyContent(FlexAlign.SpaceAround)
  }

  @Builder
  StatItem(label: string, count: number, color: string) {
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

  /**
   * 题目项
   */
  @Builder
  QuestionItem(index: number) {
    Column() {
      Text(`${index + 1}`)
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(this.getItemTextColor(index))
    }
    .width(44)
    .height(44)
    .margin(4)
    .borderRadius(ThemeConstants.RADIUS_BASE)
    .backgroundColor(this.getItemBgColor(index))
    .border({
      width: this.currentIndex === index ? 2 : 0,
      color: ThemeColors.PRIMARY
    })
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.onSelect(index);
    })
  }

  /**
   * 获取项目背景色
   */
  private getItemBgColor(index: number): string {
    const status = this.getStatus(index);
    if (this.showResult) {
      return this.getStatusColor(status);
    }
    return status === QuestionStatus.UNANSWERED ? ThemeColors.GRAY_100 : ThemeColors.PRIMARY;
  }

  /**
   * 获取项目文字颜色
   */
  private getItemTextColor(index: number): string {
    const status = this.getStatus(index);
    if (this.showResult) {
      return status === QuestionStatus.UNANSWERED ? ThemeColors.TEXT_SECONDARY : ThemeColors.WHITE;
    }
    return status === QuestionStatus.UNANSWERED ? ThemeColors.TEXT_SECONDARY : ThemeColors.WHITE;
  }

  /**
   * 图例
   */
  @Builder
  Legend() {
    Row() {
      this.LegendItem(ThemeColors.GRAY_100, '未答')
      this.LegendItem(ThemeColors.PRIMARY, '已答')

      if (this.showResult) {
        this.LegendItem(ThemeColors.SUCCESS, '正确')
        this.LegendItem(ThemeColors.ERROR, '错误')
      }
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(ThemeColors.GRAY_50)
  }

  @Builder
  LegendItem(color: string, label: string) {
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
