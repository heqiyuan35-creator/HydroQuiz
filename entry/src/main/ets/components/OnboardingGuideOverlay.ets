/**
 * 新手导引遮罩组件
 * HydroQuiz - 水利工程检测员刷题宝
 * 简化版：全屏遮罩 + 居中/顶部/底部说明卡片
 */
import { GuideStep, CardPosition } from '../common/types/OnboardingTypes';
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
    // 延迟启动动画，让页面先渲染
    setTimeout(() => {
      animateTo({
        duration: 400,
        curve: Curve.EaseOut
      }, () => {
        this.maskOpacity = 1;
        this.cardScale = 1;
        this.cardOpacity = 1;
      });
    }, 100);
  }

  /**
   * 处理下一步点击
   */
  private handleNext(): void {
    // 卡片淡出
    animateTo({
      duration: 200,
      curve: Curve.EaseIn
    }, () => {
      this.cardOpacity = 0;
      this.cardScale = 0.95;
    });

    setTimeout(() => {
      this.onNext();
      // 卡片淡入
      setTimeout(() => {
        animateTo({
          duration: 250,
          curve: Curve.EaseOut
        }, () => {
          this.cardOpacity = 1;
          this.cardScale = 1;
        });
      }, 100);
    }, 200);
  }

  /**
   * 处理跳过/完成点击
   */
  private handleSkip(): void {
    animateTo({
      duration: 300,
      curve: Curve.EaseIn
    }, () => {
      this.maskOpacity = 0;
      this.cardOpacity = 0;
    });
    setTimeout(() => {
      this.onSkip();
    }, 300);
  }

  /**
   * 获取卡片垂直对齐方式
   */
  private getCardAlignment(): FlexAlign {
    if (!this.currentStep) return FlexAlign.Center;
    switch (this.currentStep.position) {
      case 'top': return FlexAlign.Start;
      case 'bottom': return FlexAlign.End;
      default: return FlexAlign.Center;
    }
  }

  /**
   * 获取卡片上边距
   */
  private getCardMarginTop(): number {
    if (!this.currentStep) return 0;
    return this.currentStep.position === 'top' ? 120 : 0;
  }

  /**
   * 获取卡片下边距
   */
  private getCardMarginBottom(): number {
    if (!this.currentStep) return 0;
    return this.currentStep.position === 'bottom' ? 120 : 0;
  }

  build() {
    if (this.isVisible && this.currentStep) {
      Stack() {
        // 半透明遮罩背景
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(0, 0, 0, 0.75)')
          .opacity(this.maskOpacity)

        // 说明卡片容器
        Column() {
          this.GuideCard()
        }
        .width('100%')
        .height('100%')
        .padding({ left: 20, right: 20 })
        .justifyContent(this.getCardAlignment())
      }
      .width('100%')
      .height('100%')
    }
  }

  @Builder
  GuideCard() {
    Column() {
      // 步骤图标
      if (this.currentStep?.id === 'welcome') {
        Text('👋')
          .fontSize(48)
          .margin({ bottom: 16 })
      } else {
        // Tab图标
        Row() {
          Text(this.getTabEmoji())
            .fontSize(32)
        }
        .width(64)
        .height(64)
        .borderRadius(32)
        .backgroundColor(ThemeColors.PRIMARY + '20')
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 16 })
      }

      // 标题
      Text(this.currentStep?.title || '')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .textAlign(TextAlign.Center)

      // 描述
      Text(this.currentStep?.description || '')
        .fontSize(15)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .textAlign(TextAlign.Center)
        .margin({ top: 12 })
        .lineHeight(24)

      // 进度指示器
      Row() {
        ForEach([0, 1, 2, 3, 4], (index: number) => {
          Column()
            .width(this.isCurrentDot(index) ? 20 : 8)
            .height(8)
            .borderRadius(4)
            .backgroundColor(this.isCurrentDot(index) ? ThemeColors.PRIMARY : ThemeColors.GRAY_300)
            .margin({ left: 4, right: 4 })
        })
      }
      .margin({ top: 24 })

      // 按钮区域
      Row() {
        // 跳过按钮
        if (!this.isLastStep) {
          Text('跳过')
            .fontSize(15)
            .fontColor(ThemeColors.TEXT_HINT)
            .padding({ left: 20, right: 20, top: 12, bottom: 12 })
            .onClick(() => {
              this.handleSkip();
            })
        }

        Blank()

        // 下一步/开始使用按钮
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
      .margin({ top: 32 })
    }
    .width('100%')
    .padding(24)
    .margin({ top: this.getCardMarginTop(), bottom: this.getCardMarginBottom() })
    .backgroundColor(ThemeColors.WHITE)
    .borderRadius(20)
    .shadow({ radius: 24, color: 'rgba(0, 0, 0, 0.2)', offsetX: 0, offsetY: 12 })
    .scale({ x: this.cardScale, y: this.cardScale })
    .opacity(this.cardOpacity)
  }

  /**
   * 获取Tab对应的emoji
   */
  private getTabEmoji(): string {
    if (!this.currentStep) return '';
    switch (this.currentStep.id) {
      case 'tab-home': return '🏠';
      case 'tab-bank': return '📚';
      case 'tab-knowledge': return '💡';
      case 'tab-profile': return '👤';
      default: return '✨';
    }
  }

  /**
   * 判断是否是当前进度点
   */
  private isCurrentDot(index: number): boolean {
    const stepIndex = parseInt(this.progressText.split('/')[0]) - 1;
    return index === stepIndex;
  }
}
