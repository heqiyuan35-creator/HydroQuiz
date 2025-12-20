/**
 * 新手导引遮罩组件
 * HydroQuiz - 水利工程检测员刷题宝
 * 简化版：全屏半透明遮罩 + 说明卡片（不做精确框选）
 */
import { GuideStep, GUIDE_STEPS } from '../common/types/OnboardingTypes';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';

@Component
export struct OnboardingGuideOverlay {
  @Link isVisible: boolean;
  @Prop currentStep: GuideStep | null = null;
  @Prop progressText: string = '';
  @Prop isLastStep: boolean = false;
  onNext: () => void = () => {};
  onSkip: () => void = () => {};

  // 动画状态
  @State maskOpacity: number = 0;
  @State cardScale: number = 0.9;
  @State cardOpacity: number = 0;

  aboutToAppear(): void {
    setTimeout(() => {
      animateTo({ duration: 300, curve: Curve.EaseOut }, () => {
        this.maskOpacity = 1;
        this.cardScale = 1;
        this.cardOpacity = 1;
      });
    }, 50);
  }

  private handleNext(): void {
    animateTo({ duration: 150, curve: Curve.EaseIn }, () => {
      this.cardOpacity = 0;
      this.cardScale = 0.95;
    });
    setTimeout(() => {
      this.onNext();
      setTimeout(() => {
        animateTo({ duration: 200, curve: Curve.EaseOut }, () => {
          this.cardOpacity = 1;
          this.cardScale = 1;
        });
      }, 50);
    }, 150);
  }

  private handleSkip(): void {
    animateTo({ duration: 200, curve: Curve.EaseIn }, () => {
      this.maskOpacity = 0;
      this.cardOpacity = 0;
    });
    setTimeout(() => { this.onSkip(); }, 200);
  }


  // 获取当前步骤索引
  private getCurrentIndex(): number {
    const parts = this.progressText.split('/');
    return parts.length > 0 ? parseInt(parts[0]) - 1 : 0;
  }

  build() {
    if (this.isVisible && this.currentStep) {
      Stack() {
        // 全屏半透明遮罩
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(0, 0, 0, 0.75)')
          .opacity(this.maskOpacity)
          .onClick(() => {
            // 点击遮罩不做任何操作，防止误触
          })

        // 说明卡片
        Column() {
          // 图标
          Row() {
            Text(this.getStepEmoji())
              .fontSize(36)
          }
          .width(72)
          .height(72)
          .borderRadius(36)
          .backgroundColor(ThemeColors.PRIMARY + '15')
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 16 })

          // 标题
          Text(this.currentStep.title)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .textAlign(TextAlign.Center)

          // 描述
          Text(this.currentStep.description)
            .fontSize(15)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .textAlign(TextAlign.Center)
            .margin({ top: 12 })
            .lineHeight(24)

          // 进度点
          Row() {
            ForEach(GUIDE_STEPS, (_: GuideStep, index: number) => {
              Column()
                .width(index === this.getCurrentIndex() ? 20 : 8)
                .height(8)
                .borderRadius(4)
                .backgroundColor(index === this.getCurrentIndex() ? ThemeColors.PRIMARY : ThemeColors.GRAY_300)
                .margin({ left: 3, right: 3 })
            })
          }
          .margin({ top: 24 })

          // 按钮区域
          Row() {
            if (!this.isLastStep) {
              Text('跳过')
                .fontSize(15)
                .fontColor(ThemeColors.TEXT_HINT)
                .padding({ left: 20, right: 20, top: 12, bottom: 12 })
                .onClick(() => { this.handleSkip(); })
            }

            Blank()

            Row() {
              Text(this.isLastStep ? '开始使用' : '下一步')
                .fontSize(15)
                .fontColor(ThemeColors.WHITE)
                .fontWeight(FontWeight.Medium)
            }
            .padding({ left: 32, right: 32, top: 12, bottom: 12 })
            .backgroundColor(ThemeColors.PRIMARY)
            .borderRadius(24)
            .onClick(() => {
              if (this.isLastStep) {
                this.handleSkip();
              } else {
                this.handleNext();
              }
            })
          }
          .width('100%')
          .margin({ top: 28 })
        }
        .width('88%')
        .padding(24)
        .backgroundColor(ThemeColors.WHITE)
        .borderRadius(20)
        .shadow({ radius: 24, color: 'rgba(0, 0, 0, 0.2)', offsetY: 12 })
        .scale({ x: this.cardScale, y: this.cardScale })
        .opacity(this.cardOpacity)
      }
      .width('100%')
      .height('100%')
      .alignContent(Alignment.Center)
    }
  }

  private getStepEmoji(): string {
    switch (this.currentStep?.id) {
      case 'welcome': return '👋';
      case 'user-header': return '👤';
      case 'daily-stats': return '📊';
      case 'daily-practice': return '📝';
      case 'intensive': return '💪';
      case 'tab-bank': return '📚';
      case 'tab-knowledge': return '💡';
      case 'tab-profile': return '⚙️';
      default: return '✨';
    }
  }
}
