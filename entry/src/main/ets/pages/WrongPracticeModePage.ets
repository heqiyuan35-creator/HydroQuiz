/**
 * 错题重做模式选择页
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { answerRecordService } from '../services/AnswerRecordService';
import { AppConstants } from '../common/constants/AppConstants';
import { Logger } from '../common/utils/Logger';

// 练习模式定义
interface PracticeMode {
  id: string;
  name: string;
  icon: string;
  description: string;
  color: string;
}

const PRACTICE_MODES: PracticeMode[] = [
  {
    id: 'sequence',
    name: '顺序重做',
    icon: '📋',
    description: '按错题添加时间顺序练习',
    color: '#1890FF'
  },
  {
    id: 'random',
    name: '随机重做',
    icon: '🎲',
    description: '随机抽取错题进行练习',
    color: '#52C41A'
  },
  {
    id: 'highFreq',
    name: '高频错题',
    icon: '🔥',
    description: '优先练习错误次数最多的题目',
    color: '#FA541C'
  },
  {
    id: 'timed',
    name: '限时挑战',
    icon: '⏱️',
    description: '限时完成错题，提升答题速度',
    color: '#722ED1'
  }
];

@Entry
@Component
struct WrongPracticeModePage {
  @State wrongCount: number = 0;
  @State isLoading: boolean = true;
  @State selectedMode: string = '';
  @State timedMinutes: number = 5; // 限时挑战的分钟数
  @State questionCount: number = 10; // 练习题目数量

  aboutToAppear(): void {
    this.loadWrongCount();
  }

  private async loadWrongCount(): Promise<void> {
    try {
      const wrongIds = await answerRecordService.getWrongQuestionIds();
      this.wrongCount = wrongIds.length;
    } catch (error) {
      Logger.error('[WrongPracticeModePage] Failed to load wrong count', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  private startPractice(mode: PracticeMode): void {
    if (this.wrongCount === 0) return;

    const params: RouteParams = {};
    params['mode'] = 'wrong' as Object;
    params['wrongMode'] = mode.id as Object;

    // 限时模式传递时间参数
    if (mode.id === 'timed') {
      params['timeLimit'] = (this.timedMinutes * 60) as Object; // 转换为秒
    }

    // 传递题目数量
    params['questionCount'] = Math.min(this.questionCount, this.wrongCount) as Object;

    Router.push('pages/AnswerPage', params);
  }

  build() {
    Column() {
      // 导航栏
      this.NavigationBar()

      if (this.isLoading) {
        Column() {
          LoadingProgress().width(48).height(48).color(ThemeColors.PRIMARY)
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else if (this.wrongCount === 0) {
        // 无错题
        this.EmptyState()
      } else {
        Scroll() {
          Column() {
            // 错题统计卡片
            this.StatsCard()

            // 练习设置
            this.PracticeSettings()

            // 模式选择
            this.ModeList()
          }
          .width('100%')
          .padding(ThemeConstants.SPACING_MD)
        }
        .scrollBar(BarState.Off)
        .layoutWeight(1)
        .align(Alignment.Top)
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
      .width(40).height(40)
      .justifyContent(FlexAlign.Center)
      .onClick(() => { Router.back(); })

      Text('错题重做')
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
    .backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  EmptyState() {
    Column() {
      Text('🎉')
        .fontSize(64)

      Text('太棒了！')
        .fontSize(ThemeConstants.FONT_SIZE_XL)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ top: ThemeConstants.SPACING_MD })

      Text('暂无错题，继续保持！')
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
  StatsCard() {
    Column() {
      Row() {
        Column() {
          Text(`${this.wrongCount}`)
            .fontSize(36)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.ERROR)
          Text('待攻克错题')
            .fontSize(ThemeConstants.FONT_SIZE_SM)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .margin({ top: 4 })
        }
        .layoutWeight(1)

        Column() {
          Text('📚')
            .fontSize(48)
        }
      }
      .width('100%')
      .padding(ThemeConstants.SPACING_MD)
    }
    .width('100%')
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .margin({ bottom: ThemeConstants.SPACING_MD })
  }

  @Builder
  PracticeSettings() {
    Column() {
      Text('练习设置')
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontWeight(FontWeight.Medium)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .width('100%')

      // 题目数量选择
      Row() {
        Text('练习题数')
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.TEXT_SECONDARY)

        Blank()

        Row() {
          ForEach([5, 10, 20, 0], (count: number) => {
            Text(count === 0 ? '全部' : `${count}题`)
              .fontSize(ThemeConstants.FONT_SIZE_SM)
              .fontColor((count === 0 ? this.wrongCount : count) === this.questionCount
                ? ThemeColors.WHITE : ThemeColors.TEXT_SECONDARY)
              .padding({ left: 12, right: 12, top: 6, bottom: 6 })
              .backgroundColor((count === 0 ? this.wrongCount : count) === this.questionCount
                ? ThemeColors.PRIMARY : ThemeColors.GRAY_100)
              .borderRadius(14)
              .margin({ left: 8 })
              .onClick(() => {
                this.questionCount = count === 0 ? this.wrongCount : count;
              })
          })
        }
      }
      .width('100%')
      .margin({ top: ThemeConstants.SPACING_MD })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .margin({ bottom: ThemeConstants.SPACING_MD })
  }

  @Builder
  ModeList() {
    Column() {
      Text('选择模式')
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontWeight(FontWeight.Medium)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .width('100%')
        .margin({ bottom: ThemeConstants.SPACING_MD })

      ForEach(PRACTICE_MODES, (mode: PracticeMode) => {
        this.ModeCard(mode)
      })
    }
    .width('100%')
  }

  @Builder
  ModeCard(mode: PracticeMode) {
    Row() {
      // 图标
      Column() {
        Text(mode.icon)
          .fontSize(32)
      }
      .width(60)
      .height(60)
      .borderRadius(12)
      .backgroundColor(mode.color + '15')
      .justifyContent(FlexAlign.Center)

      // 文字信息
      Column() {
        Text(mode.name)
          .fontSize(ThemeConstants.FONT_SIZE_MD)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Text(mode.description)
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .margin({ top: 4 })

        // 限时模式显示时间选择
        if (mode.id === 'timed') {
          Row() {
            ForEach([3, 5, 10], (minutes: number) => {
              Text(`${minutes}分钟`)
                .fontSize(11)
                .fontColor(this.timedMinutes === minutes ? ThemeColors.WHITE : mode.color)
                .padding({ left: 8, right: 8, top: 4, bottom: 4 })
                .backgroundColor(this.timedMinutes === minutes ? mode.color : mode.color + '20')
                .borderRadius(10)
                .margin({ right: 8 })
                .onClick(() => {
                  this.timedMinutes = minutes;
                })
            })
          }
          .margin({ top: 8 })
        }
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({ left: ThemeConstants.SPACING_MD })

      // 箭头
      Text('›')
        .fontSize(24)
        .fontColor(ThemeColors.TEXT_HINT)
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .margin({ bottom: ThemeConstants.SPACING_SM })
    .onClick(() => {
      this.startPractice(mode);
    })
  }
}
