/**
 * 考试结果页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';

@Entry
@Component
struct ExamResultPage {
  @State isDarkMode: boolean = false;
  @State totalCount: number = 0;
  @State correctCount: number = 0;
  @State score: number = 0;
  @State duration: number = 0;
  @State passScore: number = 60;

  aboutToAppear(): void {
    const params: RouteParams = Router.getParams();
    if (params['totalCount']) {
      this.totalCount = params['totalCount'] as number;
    }
    if (params['correctCount']) {
      this.correctCount = params['correctCount'] as number;
    }
    if (params['score']) {
      this.score = params['score'] as number;
    }
    if (params['duration']) {
      this.duration = params['duration'] as number;
    }
    if (params['passScore']) {
      this.passScore = params['passScore'] as number;
    }
  }

  /**
   * 格式化用时
   */
  private formatDuration(seconds: number): string {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    if (mins > 0) {
      return `${mins}分${secs}秒`;
    }
    return `${secs}秒`;
  }

  /**
   * 是否及格
   */
  private isPassed(): boolean {
    return this.score >= this.passScore;
  }

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Row().width(40).height(40)

        Text('考试结果')
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

      // 结果内容
      Scroll() {
        Column() {
          // 成绩展示
          this.ScoreCard()

          // 详细数据
          this.DetailCard()

          // 评价
          this.EvaluationCard()

          // 操作按钮
          this.ActionButtons()
        }
        .padding(ThemeConstants.SPACING_MD)
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.isDarkMode ? ThemeColors.BACKGROUND_DARK : ThemeColors.BACKGROUND)
    .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
  }


  @Builder
  ScoreCard() {
    Column() {
      // 结果图标
      Text(this.isPassed() ? '🎉' : '😔')
        .fontSize(64)

      // 分数
      Row() {
        Text(`${this.score}`)
          .fontSize(72)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.isPassed() ? ThemeColors.SUCCESS : ThemeColors.ERROR)

        Text('分')
          .fontSize(ThemeConstants.FONT_SIZE_XL)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .margin({ left: ThemeConstants.SPACING_XS, bottom: 16 })
      }
      .alignItems(VerticalAlign.Bottom)
      .margin({ top: ThemeConstants.SPACING_MD })

      // 及格状态
      Text(this.isPassed() ? '恭喜通过！' : '未通过，继续加油！')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Medium)
        .fontColor(this.isPassed() ? ThemeColors.SUCCESS : ThemeColors.ERROR)
        .margin({ top: ThemeConstants.SPACING_SM })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_LG)
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
  }

  @Builder
  DetailCard() {
    Column() {
      Text('考试详情')
        .fontSize(ThemeConstants.FONT_SIZE_MD)
        .fontWeight(FontWeight.Medium)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .width('100%')

      Row() {
        this.DetailItem('📝', '总题数', `${this.totalCount}题`)
        this.DetailItem('✅', '正确数', `${this.correctCount}题`)
        this.DetailItem('❌', '错误数', `${this.totalCount - this.correctCount}题`)
      }
      .width('100%')
      .margin({ top: ThemeConstants.SPACING_MD })
      .justifyContent(FlexAlign.SpaceAround)

      Divider()
        .margin({ top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_MD })
        .color(ThemeColors.BORDER)

      Row() {
        this.DetailItem('⏱️', '用时', this.formatDuration(this.duration))
        this.DetailItem('📊', '正确率', `${this.totalCount > 0 ? Math.round((this.correctCount / this.totalCount) * 100) : 0}%`)
        this.DetailItem('🎯', '及格线', `${this.passScore}分`)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ top: ThemeConstants.SPACING_SM })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
  }

  @Builder
  DetailItem(icon: string, label: string, value: string) {
    Column() {
      Text(icon)
        .fontSize(24)

      Text(value)
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ top: ThemeConstants.SPACING_XS })

      Text(label)
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: ThemeConstants.SPACING_XXS })
    }
  }

  @Builder
  EvaluationCard() {
    Column() {
      Text('学习建议')
        .fontSize(ThemeConstants.FONT_SIZE_MD)
        .fontWeight(FontWeight.Medium)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .width('100%')

      Text(this.getEvaluation())
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .lineHeight(22)
        .margin({ top: ThemeConstants.SPACING_SM })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ top: ThemeConstants.SPACING_SM })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * 获取评价建议
   */
  private getEvaluation(): string {
    if (this.score >= 90) {
      return '太棒了！你的掌握程度非常好，继续保持这种学习状态，考试一定能取得好成绩！';
    } else if (this.score >= 80) {
      return '很不错！基础知识掌握得比较扎实，建议针对错题进行复习，查漏补缺。';
    } else if (this.score >= 60) {
      return '及格了！但还有提升空间，建议多做练习，重点关注错题和薄弱知识点。';
    } else if (this.score >= 40) {
      return '还需努力！建议系统复习各科目知识点，多做题巩固基础。';
    } else {
      return '基础较薄弱，建议从基础知识开始系统学习，循序渐进，不要急于求成。';
    }
  }

  @Builder
  ActionButtons() {
    Column() {
      // 再考一次
      Button('再考一次')
        .width('100%')
        .height(48)
        .fontSize(ThemeConstants.FONT_SIZE_MD)
        .fontColor(ThemeColors.WHITE)
        .backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(ThemeConstants.RADIUS_BASE)
        .onClick(() => {
          Router.replace('pages/ExamPage');
        })

      // 返回首页
      Button('返回首页')
        .width('100%')
        .height(48)
        .fontSize(ThemeConstants.FONT_SIZE_MD)
        .fontColor(ThemeColors.PRIMARY)
        .backgroundColor(ThemeColors.TRANSPARENT)
        .borderWidth(1)
        .borderColor(ThemeColors.PRIMARY)
        .borderRadius(ThemeConstants.RADIUS_BASE)
        .margin({ top: ThemeConstants.SPACING_SM })
        .onClick(() => {
          Router.replace('pages/MainTabPage');
        })
    }
    .width('100%')
    .margin({ top: ThemeConstants.SPACING_LG })
  }
}
