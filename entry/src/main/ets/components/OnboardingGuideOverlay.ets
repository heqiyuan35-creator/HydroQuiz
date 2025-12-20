/**
 * 新手导引遮罩组件
 * HydroQuiz - 水利工程检测员刷题宝
 * 支持精确框选目标区域 + 说明卡片
 */
import { GuideStep, AreaRect, CardPosition, GUIDE_STEPS } from '../common/types/OnboardingTypes';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';

@Component
export struct OnboardingGuideOverlay {
  @Link isVisible: boolean;
  @Prop currentStep: GuideStep | null = null;
  @Prop targetRect: AreaRect | null = null;
  @Prop progressText: string = '';
  @Prop isLastStep: boolean = false;
  @Prop screenWidth: number = 360;
  @Prop screenHeight: number = 800;
  onNext: () => void = () => {};
  onSkip: () => void = () => {};

  // 动画状态
  @State maskOpacity: number = 0;
  @State cardScale: number = 0.9;
  @State cardOpacity: number = 0;
  @State highlightOpacity: number = 0;

  aboutToAppear(): void {
    setTimeout(() => {
      animateTo({ duration: 350, curve: Curve.EaseOut }, () => {
        this.maskOpacity = 1;
        this.cardScale = 1;
        this.cardOpacity = 1;
        this.highlightOpacity = 1;
      });
    }, 50);
  }

  private handleNext(): void {
    animateTo({ duration: 180, curve: Curve.EaseIn }, () => {
      this.cardOpacity = 0;
      this.cardScale = 0.95;
      this.highlightOpacity = 0;
    });
    setTimeout(() => {
      this.onNext();
      setTimeout(() => {
        animateTo({ duration: 220, curve: Curve.EaseOut }, () => {
          this.cardOpacity = 1;
          this.cardScale = 1;
          this.highlightOpacity = 1;
        });
      }, 80);
    }, 180);
  }


  private handleSkip(): void {
    animateTo({ duration: 250, curve: Curve.EaseIn }, () => {
      this.maskOpacity = 0;
      this.cardOpacity = 0;
      this.highlightOpacity = 0;
    });
    setTimeout(() => { this.onSkip(); }, 250);
  }

  // 获取卡片顶部位置
  private getCardTop(): number {
    if (!this.currentStep || !this.targetRect) {
      // 居中显示
      return (this.screenHeight - 280) / 2;
    }
    const pos = this.currentStep.cardPosition;
    if (pos === 'center') {
      return (this.screenHeight - 280) / 2;
    } else if (pos === 'top') {
      // 卡片在目标上方
      return Math.max(80, this.targetRect.y - 200);
    } else {
      // 卡片在目标下方
      return Math.min(this.targetRect.y + this.targetRect.height + 16, this.screenHeight - 300);
    }
  }

  // 获取当前步骤索引
  private getCurrentIndex(): number {
    const parts = this.progressText.split('/');
    return parts.length > 0 ? parseInt(parts[0]) - 1 : 0;
  }

  build() {
    if (this.isVisible && this.currentStep) {
      Stack() {
        // 半透明遮罩
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(0, 0, 0, 0.72)')
          .opacity(this.maskOpacity)

        // 高亮框（如果有目标区域）
        if (this.targetRect && this.targetRect.width > 0) {
          // 高亮区域背景（半透明白色）
          Column()
            .width(this.targetRect.width + 12)
            .height(this.targetRect.height + 12)
            .position({ x: this.targetRect.x - 6, y: this.targetRect.y - 6 })
            .borderRadius(12)
            .backgroundColor('rgba(255, 255, 255, 0.12)')
            .opacity(this.highlightOpacity)

          // 高亮边框
          Column()
            .width(this.targetRect.width + 12)
            .height(this.targetRect.height + 12)
            .position({ x: this.targetRect.x - 6, y: this.targetRect.y - 6 })
            .borderRadius(12)
            .border({ width: 2.5, color: ThemeColors.PRIMARY })
            .opacity(this.highlightOpacity)
        }

        // 说明卡片
        Column() {
          // 图标
          if (this.currentStep.id === 'welcome') {
            Text('👋').fontSize(42).margin({ bottom: 12 })
          } else {
            Row() {
              Text(this.getStepEmoji()).fontSize(28)
            }
            .width(56).height(56).borderRadius(28)
            .backgroundColor(ThemeColors.PRIMARY + '18')
            .justifyContent(FlexAlign.Center)
            .margin({ bottom: 12 })
          }

          // 标题
          Text(this.currentStep.title)
            .fontSize(20).fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.TEXT_PRIMARY).textAlign(TextAlign.Center)

          // 描述
          Text(this.currentStep.description)
            .fontSize(14).fontColor(ThemeColors.TEXT_SECONDARY)
            .textAlign(TextAlign.Center).margin({ top: 10 }).lineHeight(22)

          // 进度点
          Row() {
            ForEach(GUIDE_STEPS, (_: GuideStep, index: number) => {
              Column()
                .width(index === this.getCurrentIndex() ? 18 : 7)
                .height(7).borderRadius(3.5)
                .backgroundColor(index === this.getCurrentIndex() ? ThemeColors.PRIMARY : ThemeColors.GRAY_300)
                .margin({ left: 3, right: 3 })
            })
          }.margin({ top: 20 })

          // 按钮
          Row() {
            if (!this.isLastStep) {
              Text('跳过').fontSize(14).fontColor(ThemeColors.TEXT_HINT)
                .padding({ left: 16, right: 16, top: 10, bottom: 10 })
                .onClick(() => { this.handleSkip(); })
            }
            Blank()
            Row() {
              Text(this.isLastStep ? '开始使用' : '下一步')
                .fontSize(14).fontColor(ThemeColors.WHITE).fontWeight(FontWeight.Medium)
            }
            .padding({ left: 28, right: 28, top: 11, bottom: 11 })
            .backgroundColor(ThemeColors.PRIMARY).borderRadius(22)
            .onClick(() => { this.isLastStep ? this.handleSkip() : this.handleNext(); })
          }.width('100%').margin({ top: 24 })
        }
        .width('88%')
        .padding(22)
        .position({ x: '6%', y: this.getCardTop() })
        .backgroundColor(ThemeColors.WHITE)
        .borderRadius(18)
        .shadow({ radius: 20, color: 'rgba(0,0,0,0.18)', offsetY: 10 })
        .scale({ x: this.cardScale, y: this.cardScale })
        .opacity(this.cardOpacity)
      }
      .width('100%').height('100%')
    }
  }

  private getStepEmoji(): string {
    switch (this.currentStep?.id) {
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
