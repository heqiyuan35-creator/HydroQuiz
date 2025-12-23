/**
 * 关卡结果页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { encouragementService } from '../services/EncouragementService';
import { GameResult } from '../common/types/GameTypes';
import { ThemeColors } from '../theme/ThemeColors';
import { AppConstants } from '../common/constants/AppConstants';

@Entry
@Component
struct GameResultPage {
  @State result: GameResult | null = null;
  @State levelName: string = '';
  @State encouragement: string = '';
  // 星星动画状态
  @State star1Visible: boolean = false;
  @State star2Visible: boolean = false;
  @State star3Visible: boolean = false;
  @State star1Scale: number = 0;
  @State star2Scale: number = 0;
  @State star3Scale: number = 0;

  aboutToAppear(): void {
    const params: RouteParams = Router.getParams();
    const resultStr = params['result'] as string || '';
    this.levelName = params['levelName'] as string || '';

    if (resultStr) {
      this.result = JSON.parse(resultStr) as GameResult;
      this.encouragement = encouragementService.getLevelCompleteEncouragement(this.result.stars);

      // 依次播放星星动画
      this.playStarAnimation();
    }
  }

  /**
   * 播放星星动画：左 → 右 → 中
   */
  private playStarAnimation(): void {
    if (!this.result) return;
    const stars = this.result.stars;

    // 第一颗星（左边）- 300ms后显示
    if (stars >= 1) {
      setTimeout(() => {
        this.star1Visible = true;
        animateTo({
          duration: 400,
          curve: Curve.EaseOut,
          onFinish: () => {
            // 弹跳效果
            animateTo({ duration: 150, curve: Curve.EaseInOut }, () => {
              this.star1Scale = 0.9;
            });
            setTimeout(() => {
              animateTo({ duration: 150, curve: Curve.EaseInOut }, () => {
                this.star1Scale = 1;
              });
            }, 150);
          }
        }, () => {
          this.star1Scale = 1.2;
        });
      }, 300);
    }

    // 第二颗星（右边）- 600ms后显示
    if (stars >= 2) {
      setTimeout(() => {
        this.star2Visible = true;
        animateTo({
          duration: 400,
          curve: Curve.EaseOut,
          onFinish: () => {
            animateTo({ duration: 150, curve: Curve.EaseInOut }, () => {
              this.star2Scale = 0.9;
            });
            setTimeout(() => {
              animateTo({ duration: 150, curve: Curve.EaseInOut }, () => {
                this.star2Scale = 1;
              });
            }, 150);
          }
        }, () => {
          this.star2Scale = 1.2;
        });
      }, 600);
    }

    // 第三颗星（中间大星星）- 900ms后显示
    if (stars >= 3) {
      setTimeout(() => {
        this.star3Visible = true;
        animateTo({
          duration: 500,
          curve: Curve.EaseOut,
          onFinish: () => {
            animateTo({ duration: 200, curve: Curve.EaseInOut }, () => {
              this.star3Scale = 0.85;
            });
            setTimeout(() => {
              animateTo({ duration: 200, curve: Curve.EaseInOut }, () => {
                this.star3Scale = 1;
              });
            }, 200);
          }
        }, () => {
          this.star3Scale = 1.3;
        });
      }, 900);
    }
  }

  formatDuration(seconds: number): string {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins}分${secs}秒`;
  }

  @Builder
  buildHeader() {
    Row() {
      Row().width(24)

      Text('关卡结果')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .fontColor(Color.White)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Row().width(24)
    }
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
  }

  @Builder
  buildStarDisplay() {
    Row() {
      // 左边小星星
      Column() {
        Text('⭐')
          .fontSize(40)
          .opacity(this.star1Visible ? 1 : 0)
          .scale({ x: this.star1Scale, y: this.star1Scale })
      }
      .width(60)
      .height(60)
      .justifyContent(FlexAlign.Center)

      // 中间大星星
      Column() {
        Text('⭐')
          .fontSize(64)
          .opacity(this.star3Visible ? 1 : 0)
          .scale({ x: this.star3Scale, y: this.star3Scale })
      }
      .width(80)
      .height(80)
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 20 })

      // 右边小星星
      Column() {
        Text('⭐')
          .fontSize(40)
          .opacity(this.star2Visible ? 1 : 0)
          .scale({ x: this.star2Scale, y: this.star2Scale })
      }
      .width(60)
      .height(60)
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Bottom)
    .height(100)
    .margin({ top: 16 })
  }

  @Builder
  buildEmptyStars() {
    // 未获得星星时显示灰色空星
    Row() {
      Text('☆').fontSize(40).fontColor('#CCCCCC')
      Text('☆').fontSize(64).fontColor('#CCCCCC').margin({ left: 8, right: 8, bottom: 20 })
      Text('☆').fontSize(40).fontColor('#CCCCCC')
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Bottom)
    .height(100)
    .margin({ top: 16 })
  }

  @Builder
  buildResultCard() {
    if (this.result) {
      Column() {
        // 关卡名称
        Text(this.levelName)
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .fontColor(Color.White)

        // 星级显示
        if (this.result.stars > 0) {
          this.buildStarDisplay()
        } else {
          this.buildEmptyStars()
        }

        // 结果状态
        Text(this.result.stars > 0 ? '🎉 通关成功！' : '😢 未能通关')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .margin({ top: 16 })

        // 鼓励语
        Text(this.encouragement)
          .fontSize(14)
          .fontColor('rgba(255,255,255,0.9)')
          .margin({ top: 8 })

        // 星星数量提示
        if (this.result.stars > 0) {
          Row() {
            Text('🌟')
              .fontSize(18)
            Text(`获得 ${this.result.stars} 颗星星`)
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#FFD700')
              .margin({ left: 8 })
          }
          .margin({ top: 16 })
          .padding({ left: 16, right: 16, top: 8, bottom: 8 })
          .backgroundColor('rgba(255,255,255,0.2)')
          .borderRadius(20)
        }
      }
      .width('100%')
      .padding({ top: 32, bottom: 32 })
    }
  }

  @Builder
  buildStatsCard() {
    if (this.result) {
      Column() {
        Row() {
          Column() {
            Text(this.result.correctCount.toString())
              .fontSize(32)
              .fontWeight(FontWeight.Bold)
              .fontColor('#52C41A')
            Text('答对')
              .fontSize(14)
              .fontColor('#666666')
              .margin({ top: 4 })
          }
          .layoutWeight(1)

          Divider()
            .vertical(true)
            .height(50)
            .color('#E8E8E8')

          Column() {
            Text(this.result.wrongCount.toString())
              .fontSize(32)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF4D4F')
            Text('答错')
              .fontSize(14)
              .fontColor('#666666')
              .margin({ top: 4 })
          }
          .layoutWeight(1)

          Divider()
            .vertical(true)
            .height(50)
            .color('#E8E8E8')

          Column() {
            Text(`${Math.round(this.result.accuracy)}%`)
              .fontSize(32)
              .fontWeight(FontWeight.Bold)
              .fontColor(ThemeColors.PRIMARY)
            Text('正确率')
              .fontSize(14)
              .fontColor('#666666')
              .margin({ top: 4 })
          }
          .layoutWeight(1)
        }
        .width('100%')

        Divider()
          .width('100%')
          .color('#E8E8E8')
          .margin({ top: 20, bottom: 20 })

        Row() {
          Text('用时')
            .fontSize(14)
            .fontColor('#666666')
          Blank()
          Text(this.formatDuration(this.result.duration))
            .fontSize(14)
            .fontColor('#333333')
        }
        .width('100%')

        Row() {
          Text('题目数量')
            .fontSize(14)
            .fontColor('#666666')
          Blank()
          Text(`${this.result.totalQuestions}题`)
            .fontSize(14)
            .fontColor('#333333')
        }
        .width('100%')
        .margin({ top: 12 })
      }
      .width('100%')
      .padding(20)
      .backgroundColor(Color.White)
      .borderRadius(16)
      .margin({ top: -40 })
    }
  }

  @Builder
  buildButtons() {
    Column() {
      Button('再战一次')
        .width('100%')
        .height(48)
        .fontSize(16)
        .backgroundColor(ThemeColors.PRIMARY)
        .onClick(() => {
          if (this.result) {
            const params: Record<string, Object> = {
              'levelId': this.result.levelId as Object,
              'chapterId': this.result.chapterId as Object
            };
            Router.replace('pages/GameLevelPage', params);
          }
        })

      Button('返回关卡')
        .width('100%')
        .height(48)
        .fontSize(16)
        .backgroundColor('#F5F5F5')
        .fontColor('#666666')
        .margin({ top: 12 })
        .onClick(() => {
          Router.replace('pages/GameModePage');
        })
    }
    .width('100%')
    .padding({ left: 16, right: 16, bottom: 32 })
  }

  build() {
    Column() {
      // 渐变背景头部
      Column() {
        this.buildHeader()
        this.buildResultCard()
      }
      .width('100%')
      .linearGradient({
        direction: GradientDirection.Bottom,
        colors: this.result && this.result.stars > 0
          ? [[ThemeColors.PRIMARY, 0], ['#4A90E2', 1]]
          : [['#999999', 0], ['#666666', 1]]
      })
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT, bottom: 60 })

      // 统计卡片
      Column() {
        this.buildStatsCard()
      }
      .width('100%')
      .padding({ left: 16, right: 16 })

      Blank()

      // 按钮
      this.buildButtons()
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
