/**
 * 关于页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';

@Entry
@Component
struct AboutPage {
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Row() {
          Image($r('app.media.back'))
            .width(24)
            .height(24)
            .fillColor($r('app.color.text_primary'))
        }
        .width(40)
        .height(40)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          Router.back();
        })

        Text('关于')
          .fontSize(ThemeConstants.FONT_SIZE_LG)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Row()
          .width(40)
          .height(40)
      }
      .width('100%')
      .height(56)
      .padding({ left: ThemeConstants.SPACING_SM, right: ThemeConstants.SPACING_SM })
      .backgroundColor($r('app.color.surface'))

      // 内容区域 - 可滚动
      Scroll() {
        Column() {
          // Logo
          Stack() {
            Column()
              .width(88)
              .height(88)
              .borderRadius(44)
              .backgroundColor(ThemeColors.PRIMARY)

            Text('水')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
              .fontColor(ThemeColors.WHITE)
          }
          .margin({ top: ThemeConstants.SPACING_XL })

          // 应用名称
          Text(AppConstants.APP_NAME)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.text_primary'))
            .margin({ top: ThemeConstants.SPACING_MD })

          // 版本号
          Text('版本 ' + AppConstants.APP_VERSION)
            .fontSize(ThemeConstants.FONT_SIZE_SM)
            .fontColor($r('app.color.text_secondary'))
            .margin({ top: ThemeConstants.SPACING_XS })

          // 应用口号
          Text(AppConstants.APP_SLOGAN)
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.PRIMARY)
            .fontWeight(FontWeight.Medium)
            .margin({ top: ThemeConstants.SPACING_MD })

          // 应用介绍
          Column() {
            Text('应用介绍')
              .fontSize(ThemeConstants.FONT_SIZE_BASE)
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.text_primary'))
              .width('100%')

            Text(AppConstants.APP_DESCRIPTION)
              .fontSize(ThemeConstants.FONT_SIZE_SM)
              .fontColor($r('app.color.text_secondary'))
              .lineHeight(22)
              .margin({ top: ThemeConstants.SPACING_SM })
          }
          .width('100%')
          .padding(ThemeConstants.SPACING_MD)
          .margin({ top: ThemeConstants.SPACING_LG })
          .backgroundColor($r('app.color.surface'))
          .borderRadius(12)

          // 核心功能
          Column() {
            Text('核心功能')
              .fontSize(ThemeConstants.FONT_SIZE_BASE)
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.text_primary'))
              .width('100%')
              .margin({ bottom: ThemeConstants.SPACING_SM })

            this.FeatureItem('📚', '海量题库', '覆盖7大考试科目，3000+精选真题，题目持续更新')
            this.FeatureItem('📝', '多种练习模式', '顺序练习、随机练习、错题巩固、收藏复习，满足不同学习需求')
            this.FeatureItem('📊', '智能学习统计', '实时记录学习进度，智能分析薄弱知识点，精准提升')
            this.FeatureItem('📋', '真题模拟考试', '还原真实考试环境，限时答题，考前实战演练')
            this.FeatureItem('📕', '错题本管理', '自动收录错题，支持分类查看和针对性练习')
            this.FeatureItem('⭐', '题目收藏', '一键收藏重点难点，随时回顾巩固')
          }
          .width('100%')
          .padding(ThemeConstants.SPACING_MD)
          .margin({ top: ThemeConstants.SPACING_MD })
          .backgroundColor($r('app.color.surface'))
          .borderRadius(12)

          // 考试科目
          Column() {
            Text('涵盖科目')
              .fontSize(ThemeConstants.FONT_SIZE_BASE)
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.text_primary'))
              .width('100%')
              .margin({ bottom: ThemeConstants.SPACING_SM })

            Flex({ wrap: FlexWrap.Wrap }) {
              this.SubjectTag('基础知识')
              this.SubjectTag('混凝土工程')
              this.SubjectTag('岩土工程(岩石、土工)')
              this.SubjectTag('岩土工程(地基与基础)')
              this.SubjectTag('量测')
              this.SubjectTag('金属结构')
              this.SubjectTag('机械电气')
            }
            .width('100%')
          }
          .width('100%')
          .padding(ThemeConstants.SPACING_MD)
          .margin({ top: ThemeConstants.SPACING_MD })
          .backgroundColor($r('app.color.surface'))
          .borderRadius(12)

          // 底部版权
          Column() {
            Text('2024 水利工程检测员刷题宝')
              .fontSize(ThemeConstants.FONT_SIZE_XS)
              .fontColor($r('app.color.text_hint'))

            Text('专注水利工程检测员考试备考')
              .fontSize(ThemeConstants.FONT_SIZE_XS)
              .fontColor($r('app.color.text_hint'))
              .margin({ top: 4 })
          }
          .width('100%')
          .padding({ top: ThemeConstants.SPACING_XL, bottom: ThemeConstants.SPACING_XL })
        }
        .width('100%')
        .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background'))
    .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
  }

  @Builder
  FeatureItem(icon: string, title: string, desc: string) {
    Row() {
      Text(icon)
        .fontSize(22)
        .width(36)
        .fontColor($r('app.color.text_primary'))

      Column() {
        Text(title)
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))

        Text(desc)
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor($r('app.color.text_hint'))
          .margin({ top: 2 })
          .maxLines(2)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ left: ThemeConstants.SPACING_XS })
    }
    .width('100%')
    .padding({ top: ThemeConstants.SPACING_XS, bottom: ThemeConstants.SPACING_XS })
  }

  @Builder
  SubjectTag(name: string) {
    Text(name)
      .fontSize(ThemeConstants.FONT_SIZE_XS)
      .fontColor(ThemeColors.WHITE)
      .backgroundColor(ThemeColors.PRIMARY)
      .padding({ left: 10, right: 10, top: 6, bottom: 6 })
      .borderRadius(14)
      .margin({ right: 8, bottom: 8 })
  }
}
