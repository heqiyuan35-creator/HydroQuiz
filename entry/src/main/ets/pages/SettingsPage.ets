/**
 * 设置页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import { questionService } from '../services/QuestionService';
import { answerRecordService } from '../services/AnswerRecordService';
import { userService } from '../services/UserService';
import { widgetDataService } from '../services/WidgetDataService';
import { Logger } from '../common/utils/Logger';

@Entry
@Component
struct SettingsPage {
  @State isDarkMode: boolean = false;
  @State showAnswerImmediately: boolean = true;
  @State dailyGoal: number = AppConstants.DEFAULT_DAILY_GOAL;
  @State weeklyPlanDays: number[] = [1, 2, 3, 4, 5, 6, 7]; // 默认每天都学习
  @State questionCount: number = 0;
  @State showClearDialog: boolean = false;
  @State showGoalPicker: boolean = false;
  @State showWeekPlanPicker: boolean = false;

  aboutToAppear(): void {
    this.loadSettings();
  }

  private async loadSettings(): Promise<void> {
    try {
      this.questionCount = await questionService.getQuestionCount();
      this.dailyGoal = await userService.getDailyGoal();
      this.weeklyPlanDays = await userService.getWeeklyPlanDays();
      this.showAnswerImmediately = await userService.getShowAnswerImmediately();
    } catch (error) {
      Logger.error('[SettingsPage] Failed to load settings', error as Error);
    }
  }

  build() {
    Stack() {
      Column() {
        // 顶部导航栏
        this.NavigationBar()

        // 设置列表
        Scroll() {
          Column() {
            // 学习设置
            this.LearningSettings()

            // 数据管理
            this.DataManagement()

            // 关于
            this.AboutSection()
          }
          .padding({ bottom: ThemeConstants.SPACING_2XL })
        }
        .layoutWeight(1)
      }
      .width('100%')
      .height('100%')
      .backgroundColor(this.isDarkMode ? ThemeColors.BACKGROUND_DARK : ThemeColors.BACKGROUND)
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT })

      // 清除数据确认弹窗
      if (this.showClearDialog) {
        this.ClearDataDialog()
      }

      // 每日目标选择弹窗
      if (this.showGoalPicker) {
        this.GoalPickerDialog()
      }

      // 周计划选择弹窗
      if (this.showWeekPlanPicker) {
        this.WeekPlanPickerDialog()
      }
    }
    .width('100%')
    .height('100%')
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

      Text('设置')
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
  LearningSettings() {
    Column() {
      Text('学习设置')
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_HINT)
        .width('100%')
        .padding({ left: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_SM })

      Column() {
        // 每日目标
        Row() {
          Text('每日目标')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .layoutWeight(1)

          Text(`${this.dailyGoal} 题`)
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.PRIMARY)
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_MD)
        .border({ width: { bottom: 0.5 }, color: ThemeColors.DIVIDER })
        .onClick(() => {
          this.showGoalPicker = true;
        })

        // 周计划
        Row() {
          Text('周计划')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .layoutWeight(1)

          Text(this.getWeekPlanText())
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.PRIMARY)
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_MD)
        .border({ width: { bottom: 0.5 }, color: ThemeColors.DIVIDER })
        .onClick(() => {
          this.showWeekPlanPicker = true;
        })

        // 答题后立即显示答案
        Row() {
          Text('答题后显示答案')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .layoutWeight(1)

          Toggle({ type: ToggleType.Switch, isOn: this.showAnswerImmediately })
            .width(50)
            .height(26)
            .onChange((isOn: boolean) => {
              this.showAnswerImmediately = isOn;
              userService.saveShowAnswerImmediately(isOn);
            })
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_MD)
      }
      .backgroundColor(ThemeColors.SURFACE)
      .borderRadius(ThemeConstants.RADIUS_MD)
      .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
    }
  }

  /**
   * 获取周计划显示文字
   */
  private getWeekPlanText(): string {
    if (this.weeklyPlanDays.length === 7) {
      return '每天';
    } else if (this.weeklyPlanDays.length === 5 &&
      this.weeklyPlanDays.includes(1) && this.weeklyPlanDays.includes(2) &&
      this.weeklyPlanDays.includes(3) && this.weeklyPlanDays.includes(4) &&
      this.weeklyPlanDays.includes(5)) {
      return '工作日';
    } else if (this.weeklyPlanDays.length === 2 &&
      this.weeklyPlanDays.includes(6) && this.weeklyPlanDays.includes(7)) {
      return '周末';
    } else {
      return `每周${this.weeklyPlanDays.length}天`;
    }
  }

  @Builder
  DataManagement() {
    Column() {
      Text('数据管理')
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_HINT)
        .width('100%')
        .padding({ left: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_SM })

      Column() {
        // 题库数量
        Row() {
          Text('题库数量')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .layoutWeight(1)

          Text(`${this.questionCount} 题`)
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.TEXT_HINT)
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_MD)
        .border({ width: { bottom: 0.5 }, color: ThemeColors.DIVIDER })

        // 清除学习记录
        Row() {
          Text('清除学习记录')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.ERROR)
            .layoutWeight(1)

          Image($r('app.media.Rightarrow'))
            .width(16)
            .height(16)
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_MD)
        .onClick(() => {
          this.showClearDialog = true;
        })
      }
      .backgroundColor(ThemeColors.SURFACE)
      .borderRadius(ThemeConstants.RADIUS_MD)
      .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
    }
  }

  @Builder
  AboutSection() {
    Column() {
      Text('关于')
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_HINT)
        .width('100%')
        .padding({ left: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_SM })

      Column() {
        // 版本
        Row() {
          Text('版本')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .layoutWeight(1)

          Text(AppConstants.APP_VERSION)
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.TEXT_HINT)
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_MD)
        .border({ width: { bottom: 0.5 }, color: ThemeColors.DIVIDER })

        // 关于我们
        Row() {
          Text('关于我们')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .layoutWeight(1)

          Image($r('app.media.Rightarrow'))
            .width(16)
            .height(16)
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_MD)
        .onClick(() => {
          Router.push('pages/AboutPage');
        })
      }
      .backgroundColor(ThemeColors.SURFACE)
      .borderRadius(ThemeConstants.RADIUS_MD)
      .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
    }
  }

  @Builder
  ClearDataDialog() {
    Column() {
      // 遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.5)')
        .onClick(() => {
          this.showClearDialog = false;
        })
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })
    .justifyContent(FlexAlign.Center)

    // 弹窗内容
    Column() {
      Text('确认清除')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)

      Text('清除后将删除所有学习记录、错题本和收藏，此操作不可恢复。')
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .textAlign(TextAlign.Center)
        .margin({ top: ThemeConstants.SPACING_MD })

      Row() {
        Button('取消')
          .width('45%')
          .height(44)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .backgroundColor(ThemeColors.GRAY_100)
          .borderRadius(ThemeConstants.RADIUS_BASE)
          .onClick(() => {
            this.showClearDialog = false;
          })

        Button('确认清除')
          .width('45%')
          .height(44)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.ERROR)
          .borderRadius(ThemeConstants.RADIUS_BASE)
          .onClick(() => {
            this.clearAllData();
          })
      }
      .width('100%')
      .margin({ top: ThemeConstants.SPACING_LG })
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('80%')
    .padding(ThemeConstants.SPACING_LG)
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .position({ x: '10%', y: '35%' })
  }

  private async clearAllData(): Promise<void> {
    try {
      const success = await answerRecordService.clearAllData();
      if (success) {
        Logger.info('[SettingsPage] All data cleared successfully');
      }
      this.showClearDialog = false;
    } catch (error) {
      Logger.error('[SettingsPage] Failed to clear data', error as Error);
      this.showClearDialog = false;
    }
  }

  @Builder
  GoalPickerDialog() {
    Column() {
      // 遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.5)')
        .onClick(() => {
          this.showGoalPicker = false;
        })
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })
    .justifyContent(FlexAlign.Center)

    // 弹窗内容
    Column() {
      Text('设置每日目标')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ bottom: ThemeConstants.SPACING_MD })

      // 目标选项
      this.GoalOption(20)
      this.GoalOption(30)
      this.GoalOption(50)
      this.GoalOption(80)
      this.GoalOption(100)

      Button('取消')
        .width('100%')
        .height(44)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .backgroundColor(ThemeColors.GRAY_100)
        .borderRadius(ThemeConstants.RADIUS_BASE)
        .margin({ top: ThemeConstants.SPACING_MD })
        .onClick(() => {
          this.showGoalPicker = false;
        })
    }
    .width('80%')
    .padding(ThemeConstants.SPACING_LG)
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .position({ x: '10%', y: '25%' })
  }

  @Builder
  GoalOption(goal: number) {
    Row() {
      Text(`${goal} 题/天`)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)

      if (this.dailyGoal === goal) {
        Text('✓')
          .fontSize(ThemeConstants.FONT_SIZE_LG)
          .fontColor(ThemeColors.PRIMARY)
      }
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .backgroundColor(this.dailyGoal === goal ? ThemeColors.PRIMARY + '10' : ThemeColors.TRANSPARENT)
    .borderRadius(ThemeConstants.RADIUS_BASE)
    .onClick(() => {
      this.dailyGoal = goal;
      userService.saveDailyGoal(goal);
      // 同步到卡片
      widgetDataService.updateDailyTarget(goal);
      this.showGoalPicker = false;
    })
  }

  @Builder
  WeekPlanPickerDialog() {
    Column() {
      // 遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.5)')
        .onClick(() => {
          this.showWeekPlanPicker = false;
        })
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })
    .justifyContent(FlexAlign.Center)

    // 弹窗内容
    Column() {
      Text('设置周计划')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ bottom: ThemeConstants.SPACING_SM })

      Text('选择每周学习的日子')
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ bottom: ThemeConstants.SPACING_MD })

      // 快捷选项
      Row() {
        this.WeekPlanQuickOption('每天', [1, 2, 3, 4, 5, 6, 7])
        this.WeekPlanQuickOption('工作日', [1, 2, 3, 4, 5])
        this.WeekPlanQuickOption('周末', [6, 7])
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: ThemeConstants.SPACING_MD })

      // 单独选择每天
      Row() {
        this.WeekDayToggle('一', 1)
        this.WeekDayToggle('二', 2)
        this.WeekDayToggle('三', 3)
        this.WeekDayToggle('四', 4)
        this.WeekDayToggle('五', 5)
        this.WeekDayToggle('六', 6)
        this.WeekDayToggle('日', 7)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Button('确定')
        .width('100%')
        .height(44)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.WHITE)
        .backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(ThemeConstants.RADIUS_BASE)
        .margin({ top: ThemeConstants.SPACING_LG })
        .onClick(() => {
          userService.saveWeeklyPlanDays(this.weeklyPlanDays);
          this.showWeekPlanPicker = false;
        })
    }
    .width('85%')
    .padding(ThemeConstants.SPACING_LG)
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .position({ x: '7.5%', y: '30%' })
  }

  @Builder
  WeekPlanQuickOption(label: string, days: number[]) {
    Text(label)
      .fontSize(ThemeConstants.FONT_SIZE_SM)
      .fontColor(this.isQuickOptionSelected(days) ? ThemeColors.WHITE : ThemeColors.PRIMARY)
      .padding({ left: 16, right: 16, top: 8, bottom: 8 })
      .backgroundColor(this.isQuickOptionSelected(days) ? ThemeColors.PRIMARY : ThemeColors.PRIMARY + '15')
      .borderRadius(ThemeConstants.RADIUS_FULL)
      .onClick(() => {
        this.weeklyPlanDays = [...days];
      })
  }

  private isQuickOptionSelected(days: number[]): boolean {
    if (days.length !== this.weeklyPlanDays.length) {
      return false;
    }
    const sortedDays = [...days].sort();
    const sortedPlan = [...this.weeklyPlanDays].sort();
    for (let i = 0; i < sortedDays.length; i++) {
      if (sortedDays[i] !== sortedPlan[i]) {
        return false;
      }
    }
    return true;
  }

  @Builder
  WeekDayToggle(label: string, dayIndex: number) {
    Column() {
      Text(label)
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ bottom: 4 })

      Column()
        .width(36)
        .height(36)
        .borderRadius(18)
        .backgroundColor(this.weeklyPlanDays.includes(dayIndex) ? ThemeColors.PRIMARY : ThemeColors.GRAY_200)
        .onClick(() => {
          this.toggleWeekDay(dayIndex);
        })
    }
  }

  private toggleWeekDay(dayIndex: number): void {
    if (this.weeklyPlanDays.includes(dayIndex)) {
      // 至少保留一天
      if (this.weeklyPlanDays.length > 1) {
        this.weeklyPlanDays = this.weeklyPlanDays.filter((d: number) => d !== dayIndex);
      }
    } else {
      this.weeklyPlanDays = [...this.weeklyPlanDays, dayIndex].sort();
    }
  }
}
