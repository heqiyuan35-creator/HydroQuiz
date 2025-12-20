/**
 * 自定义按钮组件
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { ThemeColors } from '../../theme/ThemeColors';
import { ThemeConstants } from '../../theme/ThemeConstants';

/**
 * 按钮类型枚举
 */
export enum ButtonType {
  PRIMARY = 'primary',
  SECONDARY = 'secondary',
  SUCCESS = 'success',
  WARNING = 'warning',
  ERROR = 'error',
  GHOST = 'ghost',
  TEXT = 'text'
}

/**
 * 按钮大小枚举
 */
export enum ButtonSize {
  SMALL = 'small',
  MEDIUM = 'medium',
  LARGE = 'large'
}

/**
 * 按钮颜色配置接口
 */
interface ButtonColors {
  background: string;
  text: string;
  border: string;
}

@Component
export struct CustomButton {
  @Prop text: string = '';
  @Prop buttonType: ButtonType = ButtonType.PRIMARY;
  @Prop buttonSize: ButtonSize = ButtonSize.MEDIUM;
  @Prop disabled: boolean = false;
  @Prop loading: boolean = false;
  @Prop fullWidth: boolean = false;
  @Prop borderRadius: number = ThemeConstants.RADIUS_BASE;

  // 点击回调
  onButtonClick?: () => void;

  /**
   * 获取按钮颜色配置
   */
  private getButtonColors(): ButtonColors {
    switch (this.buttonType) {
      case ButtonType.PRIMARY:
        return {
          background: ThemeColors.PRIMARY,
          text: ThemeColors.WHITE,
          border: ThemeColors.PRIMARY
        };
      case ButtonType.SECONDARY:
        return {
          background: ThemeColors.SURFACE,
          text: ThemeColors.PRIMARY,
          border: ThemeColors.PRIMARY
        };
      case ButtonType.SUCCESS:
        return {
          background: ThemeColors.SUCCESS,
          text: ThemeColors.WHITE,
          border: ThemeColors.SUCCESS
        };
      case ButtonType.WARNING:
        return {
          background: ThemeColors.WARNING,
          text: ThemeColors.WHITE,
          border: ThemeColors.WARNING
        };
      case ButtonType.ERROR:
        return {
          background: ThemeColors.ERROR,
          text: ThemeColors.WHITE,
          border: ThemeColors.ERROR
        };
      case ButtonType.GHOST:
        return {
          background: ThemeColors.TRANSPARENT,
          text: ThemeColors.PRIMARY,
          border: ThemeColors.BORDER
        };
      case ButtonType.TEXT:
        return {
          background: ThemeColors.TRANSPARENT,
          text: ThemeColors.PRIMARY,
          border: ThemeColors.TRANSPARENT
        };
      default:
        return {
          background: ThemeColors.PRIMARY,
          text: ThemeColors.WHITE,
          border: ThemeColors.PRIMARY
        };
    }
  }

  /**
   * 获取按钮高度
   */
  private getButtonHeight(): number {
    switch (this.buttonSize) {
      case ButtonSize.SMALL:
        return ThemeConstants.HEIGHT_SM;
      case ButtonSize.MEDIUM:
        return ThemeConstants.HEIGHT_BASE;
      case ButtonSize.LARGE:
        return ThemeConstants.HEIGHT_LG;
      default:
        return ThemeConstants.HEIGHT_BASE;
    }
  }

  /**
   * 获取字体大小
   */
  private getFontSize(): number {
    switch (this.buttonSize) {
      case ButtonSize.SMALL:
        return ThemeConstants.FONT_SIZE_SM;
      case ButtonSize.MEDIUM:
        return ThemeConstants.FONT_SIZE_BASE;
      case ButtonSize.LARGE:
        return ThemeConstants.FONT_SIZE_MD;
      default:
        return ThemeConstants.FONT_SIZE_BASE;
    }
  }

  /**
   * 获取水平内边距
   */
  private getPaddingHorizontal(): number {
    switch (this.buttonSize) {
      case ButtonSize.SMALL:
        return ThemeConstants.SPACING_SM;
      case ButtonSize.MEDIUM:
        return ThemeConstants.SPACING_MD;
      case ButtonSize.LARGE:
        return ThemeConstants.SPACING_LG;
      default:
        return ThemeConstants.SPACING_MD;
    }
  }

  build() {
    Button() {
      Row() {
        if (this.loading) {
          LoadingProgress()
            .width(ThemeConstants.ICON_SIZE_SM)
            .height(ThemeConstants.ICON_SIZE_SM)
            .color(this.getButtonColors().text)
            .margin({ right: ThemeConstants.SPACING_XS })
        }

        Text(this.text)
          .fontSize(this.getFontSize())
          .fontColor(this.disabled ? ThemeColors.TEXT_DISABLED : this.getButtonColors().text)
          .fontWeight(FontWeight.Medium)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
    }
    .type(ButtonType.PRIMARY === this.buttonType ? ButtonType.Capsule : ButtonType.Normal)
    .width(this.fullWidth ? '100%' : 'auto')
    .height(this.getButtonHeight())
    .padding({ left: this.getPaddingHorizontal(), right: this.getPaddingHorizontal() })
    .backgroundColor(this.disabled ? ThemeColors.GRAY_200 : this.getButtonColors().background)
    .borderRadius(this.borderRadius)
    .borderWidth(this.buttonType === ButtonType.SECONDARY || this.buttonType === ButtonType.GHOST ? 1 : 0)
    .borderColor(this.getButtonColors().border)
    .enabled(!this.disabled && !this.loading)
    .onClick(() => {
      if (!this.disabled && !this.loading && this.onButtonClick) {
        this.onButtonClick();
      }
    })
    .stateStyles({
      pressed: {
        .opacity(ThemeConstants.OPACITY_PRESSED)
      },
      disabled: {
        .opacity(ThemeConstants.OPACITY_DISABLED)
      }
    })
  }
}
