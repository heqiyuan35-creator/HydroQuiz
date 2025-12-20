/**
 * 练习页面 - 选择练习模式和科目
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import { SUBJECT_LIST, getSubjectById } from '../data/SubjectData';
import { SubjectInfo } from '../common/types/QuestionTypes';

@Entry
@Component
struct PracticePage {
  @State selectedSubjectId: string = '';
  @State selectedMode: string = AppConstants.PRACTICE_MODE_SEQUENCE;
  @State isDarkMode: boolean = false;

  aboutToAppear(): void {
    const params: RouteParams = Router.getParams();
    if (params['subjectId']) {
      this.selectedSubjectId = params['subjectId'] as string;
    }
    if (params['mode']) {
      this.selectedMode = params['mode'] as string;
    }
  }

  /**
   * 开始练习
   */
  private startPractice(): void {
    const params: RouteParams = {};
    params['subjectId'] = this.selectedSubjectId as Object;
    params['mode'] = this.selectedMode as Object;
    Router.goToAnswer(params);
  }

  build() {
    Column() {
      // 顶部导航栏
      this.NavigationBar()

      // 内容区域
      Scroll() {
        Column() {
          // 练习模式选择
          this.ModeSection()

          // 科目选择
          this.SubjectSection()
        }
        .padding({ bottom: ThemeConstants.SPACING_2XL })
      }
      .layoutWeight(1)

      // 底部开始按钮
      this.BottomButton()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.isDarkMode ? ThemeColors.BACKGROUND_DARK : ThemeColors.BACKGROUND)
    .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
  }

  /**
   * 导航栏
   */
  @Builder
  NavigationBar() {
    Row() {
      // 返回按钮
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

      // 标题
      Text('选择练习')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      // 占位
      Row()
        .width(40)
        .height(40)
    }
    .width('100%')
    .height(56)
    .padding({ left: ThemeConstants.SPACING_SM, right: ThemeConstants.SPACING_SM })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
  }

  /**
   * 练习模式选择区域
   */
  @Builder
  ModeSection() {
    Column() {
      Text('练习模式')
        .fontSize(ThemeConstants.FONT_SIZE_MD)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .width('100%')

      Column() {
        this.ModeItem(AppConstants.PRACTICE_MODE_SEQUENCE, '顺序练习', '按题目顺序依次练习', '📝')
        this.ModeItem(AppConstants.PRACTICE_MODE_RANDOM, '随机练习', '随机抽取题目练习', '🎲')
        this.ModeItem(AppConstants.PRACTICE_MODE_WRONG, '错题练习', '针对错题重复练习', '❌')
        this.ModeItem(AppConstants.PRACTICE_MODE_FAVORITE, '收藏练习', '练习收藏的题目', '⭐')
      }
      .margin({ top: ThemeConstants.SPACING_SM })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
  }

  /**
   * 练习模式项
   */
  @Builder
  ModeItem(mode: string, title: string, desc: string, icon: string) {
    Row() {
      // 图标
      Text(icon)
        .fontSize(24)
        .width(40)

      // 信息
      Column() {
        Text(title)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Text(desc)
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: ThemeConstants.SPACING_XXS })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ left: ThemeConstants.SPACING_SM })

      // 选中状态
      Radio({ value: mode, group: 'practiceMode' })
        .checked(this.selectedMode === mode)
        .onChange((isChecked: boolean) => {
          if (isChecked) {
            this.selectedMode = mode;
          }
        })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_BASE)
    .margin({ top: ThemeConstants.SPACING_SM })
    .backgroundColor(this.selectedMode === mode ?
      (this.isDarkMode ? 'rgba(24, 144, 255, 0.1)' : 'rgba(24, 144, 255, 0.05)') :
      (this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE))
    .borderRadius(ThemeConstants.RADIUS_MD)
    .border({
      width: this.selectedMode === mode ? 1 : 0,
      color: ThemeColors.PRIMARY
    })
    .onClick(() => {
      this.selectedMode = mode;
    })
  }

  /**
   * 科目选择区域
   */
  @Builder
  SubjectSection() {
    Column() {
      Row() {
        Text('选择科目')
          .fontSize(ThemeConstants.FONT_SIZE_MD)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Text('（可选，不选则练习全部）')
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ left: ThemeConstants.SPACING_XS })
      }
      .width('100%')

      Column() {
        // 全部科目选项
        this.SubjectItem('', '全部科目', '练习所有科目的题目', ThemeColors.PRIMARY)

        // 各科目选项
        ForEach(SUBJECT_LIST, (subject: SubjectInfo) => {
          this.SubjectItem(subject.id, subject.name, subject.description, subject.color)
        })
      }
      .margin({ top: ThemeConstants.SPACING_SM })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
  }

  /**
   * 科目项
   */
  @Builder
  SubjectItem(id: string, name: string, desc: string, color: string) {
    Row() {
      // 颜色标识
      Column()
        .width(4)
        .height(40)
        .borderRadius(2)
        .backgroundColor(color)

      // 信息
      Column() {
        Text(name)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Text(desc)
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: ThemeConstants.SPACING_XXS })
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ left: ThemeConstants.SPACING_BASE })

      // 选中状态
      Radio({ value: id, group: 'subject' })
        .checked(this.selectedSubjectId === id)
        .onChange((isChecked: boolean) => {
          if (isChecked) {
            this.selectedSubjectId = id;
          }
        })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_BASE)
    .margin({ top: ThemeConstants.SPACING_SM })
    .backgroundColor(this.selectedSubjectId === id ?
      (this.isDarkMode ? 'rgba(24, 144, 255, 0.1)' : 'rgba(24, 144, 255, 0.05)') :
      (this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE))
    .borderRadius(ThemeConstants.RADIUS_MD)
    .border({
      width: this.selectedSubjectId === id ? 1 : 0,
      color: ThemeColors.PRIMARY
    })
    .onClick(() => {
      this.selectedSubjectId = id;
    })
  }

  /**
   * 底部按钮
   */
  @Builder
  BottomButton() {
    Column() {
      Button('开始练习')
        .width('100%')
        .height(48)
        .fontSize(ThemeConstants.FONT_SIZE_MD)
        .fontWeight(FontWeight.Medium)
        .backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(ThemeConstants.RADIUS_BASE)
        .onClick(() => {
          this.startPractice();
        })
    }
    .width('100%')
    .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD, bottom: 32 })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
  }
}
