/**
 * 主题颜色定义
 * HydroQuiz - 水利工程检测员刷题宝
 */

export class ThemeColors {
  // 主色调 - 蓝色系（专业、可信）
  static readonly PRIMARY: string = '#1890FF';
  static readonly PRIMARY_LIGHT: string = '#40A9FF';
  static readonly PRIMARY_DARK: string = '#096DD9';

  // 辅助色
  static readonly SECONDARY: string = '#722ED1';
  static readonly SECONDARY_LIGHT: string = '#9254DE';

  // 背景色 - 浅色主题
  static readonly BACKGROUND: string = '#F5F7FA';
  static readonly SURFACE: string = '#FFFFFF';
  static readonly SURFACE_VARIANT: string = '#FAFAFA';

  // 背景色 - 深色主题
  static readonly BACKGROUND_DARK: string = '#121212';
  static readonly SURFACE_DARK: string = '#1E1E1E';
  static readonly SURFACE_VARIANT_DARK: string = '#2C2C2C';

  // 文字颜色 - 浅色主题
  static readonly TEXT_PRIMARY: string = '#333333';
  static readonly TEXT_SECONDARY: string = '#666666';
  static readonly TEXT_HINT: string = '#999999';
  static readonly TEXT_DISABLED: string = '#CCCCCC';

  // 文字颜色 - 深色主题
  static readonly TEXT_PRIMARY_DARK: string = '#E8E8E8';
  static readonly TEXT_SECONDARY_DARK: string = '#AAAAAA';
  static readonly TEXT_HINT_DARK: string = '#777777';

  // 状态色
  static readonly SUCCESS: string = '#52C41A';
  static readonly SUCCESS_LIGHT: string = '#95DE64';
  static readonly WARNING: string = '#FAAD14';
  static readonly WARNING_LIGHT: string = '#FFD666';
  static readonly ERROR: string = '#FF4D4F';
  static readonly ERROR_LIGHT: string = '#FF7875';
  static readonly INFO: string = '#1890FF';

  // 边框色
  static readonly BORDER: string = '#E8E8E8';
  static readonly BORDER_DARK: string = '#333333';
  static readonly DIVIDER: string = '#F0F0F0';
  static readonly DIVIDER_DARK: string = '#2C2C2C';

  // 科目主题色（确保白字可读）
  static readonly SUBJECT_BASIC: string = '#1677FF';           // 基础知识 - 蓝色
  static readonly SUBJECT_CONCRETE: string = '#389E0D';        // 混凝土工程 - 深绿色
  static readonly SUBJECT_GEOTECHNICAL_ROCK: string = '#D46B08'; // 岩土工程（岩石）- 深橙色
  static readonly SUBJECT_GEOTECHNICAL_FOUNDATION: string = '#C41D7F'; // 岩土工程（地基）- 深粉色
  static readonly SUBJECT_MEASUREMENT: string = '#531DAB';     // 量测 - 深紫色
  static readonly SUBJECT_METAL: string = '#006D75';           // 金属结构 - 深青色
  static readonly SUBJECT_MECHANICAL: string = '#AD2102';      // 机械电气 - 深红色

  // 中性色
  static readonly GRAY_50: string = '#FAFAFA';
  static readonly GRAY_100: string = '#F5F5F5';
  static readonly GRAY_200: string = '#E8E8E8';
  static readonly GRAY_300: string = '#D9D9D9';
  static readonly GRAY_400: string = '#BFBFBF';
  static readonly GRAY_500: string = '#8C8C8C';
  static readonly GRAY_600: string = '#595959';
  static readonly GRAY_700: string = '#434343';
  static readonly GRAY_800: string = '#262626';
  static readonly GRAY_900: string = '#141414';

  // 白色和黑色
  static readonly WHITE: string = '#FFFFFF';
  static readonly BLACK: string = '#000000';

  // 透明色
  static readonly TRANSPARENT: string = 'transparent';

  // 遮罩色
  static readonly MASK: string = 'rgba(0, 0, 0, 0.45)';
  static readonly MASK_LIGHT: string = 'rgba(0, 0, 0, 0.25)';
}
