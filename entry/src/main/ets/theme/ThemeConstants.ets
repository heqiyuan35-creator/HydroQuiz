/**
 * 主题常量定义
 * HydroQuiz - 水利工程检测员刷题宝
 */

/**
 * 阴影配置接口
 */
interface ShadowConfig {
  radius: number;
  color: string;
  offsetX: number;
  offsetY: number;
}

export class ThemeConstants {
  // 字体大小
  static readonly FONT_SIZE_XS: number = 10;
  static readonly FONT_SIZE_SM: number = 12;
  static readonly FONT_SIZE_BASE: number = 14;
  static readonly FONT_SIZE_MD: number = 16;
  static readonly FONT_SIZE_LG: number = 18;
  static readonly FONT_SIZE_XL: number = 20;
  static readonly FONT_SIZE_2XL: number = 24;
  static readonly FONT_SIZE_3XL: number = 28;
  static readonly FONT_SIZE_4XL: number = 32;

  // 间距
  static readonly SPACING_XXS: number = 2;
  static readonly SPACING_XS: number = 4;
  static readonly SPACING_SM: number = 8;
  static readonly SPACING_BASE: number = 12;
  static readonly SPACING_MD: number = 16;
  static readonly SPACING_LG: number = 20;
  static readonly SPACING_XL: number = 24;
  static readonly SPACING_2XL: number = 32;
  static readonly SPACING_3XL: number = 40;
  static readonly SPACING_4XL: number = 48;

  // 圆角
  static readonly RADIUS_XS: number = 2;
  static readonly RADIUS_SM: number = 4;
  static readonly RADIUS_BASE: number = 8;
  static readonly RADIUS_MD: number = 12;
  static readonly RADIUS_LG: number = 16;
  static readonly RADIUS_XL: number = 20;
  static readonly RADIUS_2XL: number = 24;
  static readonly RADIUS_FULL: number = 9999;

  // 组件高度
  static readonly HEIGHT_XS: number = 24;
  static readonly HEIGHT_SM: number = 32;
  static readonly HEIGHT_BASE: number = 40;
  static readonly HEIGHT_MD: number = 44;
  static readonly HEIGHT_LG: number = 48;
  static readonly HEIGHT_XL: number = 56;

  // 图标大小
  static readonly ICON_SIZE_XS: number = 12;
  static readonly ICON_SIZE_SM: number = 16;
  static readonly ICON_SIZE_BASE: number = 20;
  static readonly ICON_SIZE_MD: number = 24;
  static readonly ICON_SIZE_LG: number = 32;
  static readonly ICON_SIZE_XL: number = 40;
  static readonly ICON_SIZE_2XL: number = 48;

  // 动画时长
  static readonly DURATION_FAST: number = 100;
  static readonly DURATION_NORMAL: number = 200;
  static readonly DURATION_SLOW: number = 300;
  static readonly DURATION_SLOWER: number = 500;

  // 层级
  static readonly Z_INDEX_NORMAL: number = 1;
  static readonly Z_INDEX_DROPDOWN: number = 1000;
  static readonly Z_INDEX_STICKY: number = 1020;
  static readonly Z_INDEX_FIXED: number = 1030;
  static readonly Z_INDEX_MODAL_BACKDROP: number = 1040;
  static readonly Z_INDEX_MODAL: number = 1050;
  static readonly Z_INDEX_POPOVER: number = 1060;
  static readonly Z_INDEX_TOOLTIP: number = 1070;
  static readonly Z_INDEX_TOAST: number = 1080;

  // 透明度
  static readonly OPACITY_DISABLED: number = 0.4;
  static readonly OPACITY_HOVER: number = 0.8;
  static readonly OPACITY_PRESSED: number = 0.6;

  // 边框宽度
  static readonly BORDER_WIDTH_SM: number = 0.5;
  static readonly BORDER_WIDTH_BASE: number = 1;
  static readonly BORDER_WIDTH_MD: number = 2;

  /**
   * 获取阴影配置
   * @param isDarkMode 是否深色模式
   * @param size 阴影大小 sm/md/lg
   */
  static getShadow(isDarkMode: boolean, size: string): ShadowConfig {
    const shadowColor: string = isDarkMode ? 'rgba(0, 0, 0, 0.5)' : 'rgba(0, 0, 0, 0.1)';

    switch (size) {
      case 'sm':
        return {
          radius: 4,
          color: shadowColor,
          offsetX: 0,
          offsetY: 2
        };
      case 'md':
        return {
          radius: 8,
          color: shadowColor,
          offsetX: 0,
          offsetY: 4
        };
      case 'lg':
        return {
          radius: 16,
          color: shadowColor,
          offsetX: 0,
          offsetY: 8
        };
      default:
        return {
          radius: 4,
          color: shadowColor,
          offsetX: 0,
          offsetY: 2
        };
    }
  }
}
