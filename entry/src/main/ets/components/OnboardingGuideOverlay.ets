/**
 * 新手导引遮罩组件
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { GuideStep, AreaRect, CardPosition } from '../common/types/OnboardingTypes';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';

/**
 * 新手导引遮罩组件
 */
@Component
export struct OnboardingGuideOverlay {
  @Link isVisible: boolean;
  @Prop currentStep: GuideStep | null = null;
  @Prop targetRect: AreaRect | null = null;
  @Prop progressText: string = '';
  @Prop isLastStep: boolean = false;
  onNext: () => void = () => {};
  onSkip: () => void = () => {};

  // 动画状态
  @State opacity: number = 0;
  @State cardOpacity: number = 0;
  @State cardTranslateY: number = 20;

  // 屏幕尺寸
  @State screenHeight: number = 800;

  aboutToAppear(): void {
    // 启动淡入动画
    animateTo({
      duration: 300,
      curve: Curve.EaseOut
    }, () => {
      this.opacity = 1;
    });
    // 卡片延迟淡入
    setTimeout(() => {
      animateTo({
        duration: 250,
        curve: Curve.EaseOut
      }, () => {
        this.cardOpacity = 1;
        this.cardTranslateY = 0;
      });
    }, 150);
  }

  /**
   * 计算说明卡片位置
   */
  private getCardPosition(): CardPosition {
    if (!this.currentStep || !this.targetRect) {
      return 'bottom';
    }
    if (this.currentStep.position !== 'auto') {
      return this.currentStep.position;
    }
    // auto模式：根据目标区域位置自动判断
    const targetCenterY = this.targetRect.y + this.targetRect.height / 2;
    return targetCenterY < this.screenHeight / 2 ? 'bottom' : 'top';
  }


  /**
   * 获取卡片顶部位置
   */
  private getCardTop(): number {
    if (!this.targetRect) {
      return 200;
    }
    const position = this.getCardPosition();
    if (position === 'top') {
      // 卡片在目标区域上方
      return Math.max(60, this.targetRect.y - 180);
    } else {
      // 卡片在目标区域下方
      return this.targetRect.y + this.targetRect.height + 16;
    }
  }

  /**
   * 处理下一步点击
   */
  private handleNext(): void {
    // 先执行淡出动画
    animateTo({
      duration: 150,
      curve: Curve.EaseIn
    }, () => {
      this.cardOpacity = 0;
      this.cardTranslateY = -10;
    });
    // 延迟执行下一步
    setTimeout(() => {
      this.onNext();
      // 重新淡入
      setTimeout(() => {
        animateTo({
          duration: 200,
          curve: Curve.EaseOut
        }, () => {
          this.cardOpacity = 1;
          this.cardTranslateY = 0;
        });
      }, 50);
    }, 150);
  }

  /**
   * 处理跳过点击
   */
  private handleSkip(): void {
    animateTo({
      duration: 200,
      curve: Curve.EaseIn
    }, () => {
      this.opacity = 0;
    });
    setTimeout(() => {
      this.onSkip();
    }, 200);
  }

  build() {
    if (this.isVisible && this.currentStep) {
      Stack() {
        // 遮罩层背景
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(0, 0, 0, 0.7)')
          .opacity(this.opacity)

        // 高亮区域（透明镂空效果）
        if (this.targetRect) {
          // 使用白色边框高亮目标区域
          Column()
            .width(this.targetRect.width + 8)
            .height(this.targetRect.height + 8)
            .position({
              x: this.targetRect.x - 4,
              y: this.targetRect.y - 4
            })
            .borderRadius(ThemeConstants.RADIUS_MD)
            .border({
              width: 3,
              color: ThemeColors.PRIMARY
            })
            .backgroundColor('rgba(255, 255, 255, 0.15)')
            .opacity(this.opacity)
        }

        // 说明卡片
        this.GuideCard()
      }
      .width('100%')
      .height('100%')
      .onAreaChange((oldValue: Area, newValue: Area) => {
        this.screenHeight = newValue.height as number;
      })
    }
  }

  /**
   * 说明卡片
   */
  @Builder
  GuideCard() {
    Column() {
      // 标题
      Row() {
        Text(this.currentStep?.title || '')
          .fontSize(ThemeConstants.FONT_SIZE_LG)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Blank()

        // 进度指示
        Text(this.progressText)
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
          .padding({ left: 8, right: 8, top: 4, bottom: 4 })
          .backgroundColor(ThemeColors.GRAY_100)
          .borderRadius(10)
      }
      .width('100%')

      // 描述
      Text(this.currentStep?.description || '')
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: ThemeConstants.SPACING_SM })
        .lineHeight(22)

      // 按钮区域
      Row() {
        // 跳过按钮
        Text('跳过')
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.TEXT_HINT)
          .padding({ left: 16, right: 16, top: 10, bottom: 10 })
          .onClick(() => {
            this.handleSkip();
          })

        Blank()

        // 下一步/完成按钮
        Row() {
          Text(this.isLastStep ? '完成' : '下一步')
            .fontSize(ThemeConstants.FONT_SIZE_SM)
            .fontColor(ThemeColors.WHITE)
            .fontWeight(FontWeight.Medium)
        }
        .padding({ left: 24, right: 24, top: 10, bottom: 10 })
        .backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(20)
        .onClick(() => {
          this.handleNext();
        })
      }
      .width('100%')
      .margin({ top: ThemeConstants.SPACING_MD })
    }
    .width('90%')
    .padding(ThemeConstants.SPACING_MD)
    .backgroundColor(ThemeColors.WHITE)
    .borderRadius(ThemeConstants.RADIUS_LG)
    .shadow({ radius: 16, color: 'rgba(0, 0, 0, 0.15)', offsetX: 0, offsetY: 8 })
    .position({
      x: '5%',
      y: this.getCardTop()
    })
    .opacity(this.cardOpacity)
    .translate({ y: this.cardTranslateY })
  }
}
