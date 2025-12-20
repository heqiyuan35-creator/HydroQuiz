/**
 * 自定义卡片组件
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { ThemeColors } from '../../theme/ThemeColors';
import { ThemeConstants } from '../../theme/ThemeConstants';

@Component
export struct CustomCard {
  @Prop cardPadding: number = ThemeConstants.SPACING_MD;
  @Prop cardRadius: number = ThemeConstants.RADIUS_MD;
  @Prop cardBackground: string = ThemeColors.SURFACE;
  @Prop showShadow: boolean = true;
  @Prop isDarkMode: boolean = false;

  // 点击回调
  onCardClick?: () => void;

  @BuilderParam content: () => void = this.defaultContent;

  @Builder
  defaultContent() {
    // 默认空内容
  }

  build() {
    Column() {
      this.content()
    }
    .width('100%')
    .padding(this.cardPadding)
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : this.cardBackground)
    .borderRadius(this.cardRadius)
    .shadow(this.showShadow ? ThemeConstants.getShadow(this.isDarkMode, 'sm') : {
      radius: 0,
      color: ThemeColors.TRANSPARENT,
      offsetX: 0,
      offsetY: 0
    })
    .onClick(() => {
      if (this.onCardClick) {
        this.onCardClick();
      }
    })
  }
}
