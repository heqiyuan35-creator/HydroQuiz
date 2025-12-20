/**
 * 启动页
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import { initializationState } from '../common/utils/InitializationState';

@Entry
@Component
struct SplashPage {
  @State logoScale: number = 0.5;
  @State logoOpacity: number = 0;
  @State textOpacity: number = 0;

  aboutToAppear(): void {
    // Logo 动画
    setTimeout(() => {
      animateTo({
        duration: 500,
        curve: Curve.EaseOut
      }, () => {
        this.logoScale = 1;
        this.logoOpacity = 1;
      });
    }, 200);

    // 文字动画
    setTimeout(() => {
      animateTo({
        duration: 400,
        curve: Curve.EaseOut
      }, () => {
        this.textOpacity = 1;
      });
    }, 600);

    // 等待初始化完成后跳转
    this.waitForInitAndNavigate();
  }

  /**
   * 等待初始化完成后跳转
   */
  private async waitForInitAndNavigate(): Promise<void> {
    // 最小等待时间（动画完成）
    const minWaitTime = 2000;
    const startTime = Date.now();

    // 等待数据库初始化完成
    await initializationState.waitForInitialization();

    // 确保最小等待时间
    const elapsed = Date.now() - startTime;
    if (elapsed < minWaitTime) {
      await this.delay(minWaitTime - elapsed);
    }

    // 跳转到主页
    Router.replace(AppConstants.ROUTE_MAIN);
  }

  /**
   * 延迟函数
   */
  private delay(ms: number): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }

  build() {
    Column() {
      // Logo 区域
      Column() {
        // Logo 图标
        Stack() {
          // 外圈
          Column()
            .width(120)
            .height(120)
            .borderRadius(60)
            .backgroundColor(ThemeColors.PRIMARY_LIGHT)
            .opacity(0.2)

          // 内圈
          Column()
            .width(90)
            .height(90)
            .borderRadius(45)
            .backgroundColor(ThemeColors.PRIMARY)

          // 图标文字
          Text('水')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.WHITE)
        }
        .scale({ x: this.logoScale, y: this.logoScale })
        .opacity(this.logoOpacity)

        // 应用名称
        Text(AppConstants.APP_NAME)
          .fontSize(ThemeConstants.FONT_SIZE_3XL)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .margin({ top: ThemeConstants.SPACING_LG })
          .opacity(this.textOpacity)

        // 副标题
        Text('水利工程检测员考试必备')
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .margin({ top: ThemeConstants.SPACING_SM })
          .opacity(this.textOpacity)
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)

      // 底部版本信息
      Column() {
        Text(`版本 ${AppConstants.APP_VERSION}`)
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.TEXT_HINT)
      }
      .padding({ bottom: ThemeConstants.SPACING_2XL })
      .opacity(this.textOpacity)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(ThemeColors.BACKGROUND)
  }
}
