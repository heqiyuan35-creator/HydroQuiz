/**
 * 错题统计分析页面
 * HydroQuiz - 水利工程检测员刷题宝
 * 使用 ArkWeb + ECharts 实现图表展示
 */
import { webview } from '@kit.ArkWeb';
import { Router } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import { Logger } from '../common/utils/Logger';
import { wrongStatisticsService, WrongStatisticsData } from '../services/WrongStatisticsService';

@Entry
@Component
struct WrongStatisticsPage {
  @State isDarkMode: boolean = false;
  @State isLoading: boolean = true;
  @State statisticsData: WrongStatisticsData | null = null;
  
  private webController: webview.WebviewController = new webview.WebviewController();
  private isWebReady: boolean = false;

  aboutToAppear(): void {
    // 开启调试模式（开发阶段）
    try {
      webview.WebviewController.setWebDebuggingAccess(true);
    } catch (error) {
      Logger.error('[WrongStatisticsPage] Failed to set web debugging', error as Error);
    }
    
    // 加载统计数据
    this.loadStatisticsData();
  }

  /**
   * 加载统计数据
   */
  private async loadStatisticsData(): Promise<void> {
    try {
      this.statisticsData = await wrongStatisticsService.getStatisticsData();
      Logger.info(`[WrongStatisticsPage] Statistics data loaded, totalWrong: ${this.statisticsData.totalWrong}, highFreq: ${this.statisticsData.highFreqWrong.length}`);

      // 如果 Web 已就绪，立即初始化图表
      if (this.isWebReady) {
        this.initCharts();
      }
    } catch (error) {
      Logger.error('[WrongStatisticsPage] Failed to load statistics', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  /**
   * 初始化图表
   */
  private initCharts(): void {
    if (!this.statisticsData) return;

    try {
      const dataJson = JSON.stringify(this.statisticsData);
      // 转义特殊字符，确保 JavaScript 能正确解析
      const escapedJson = dataJson
        .replace(/\\/g, '\\\\')
        .replace(/'/g, "\\'")
        .replace(/\n/g, '\\n')
        .replace(/\r/g, '\\r');
      this.webController.runJavaScript(`initCharts('${escapedJson}')`);
      Logger.info(`[WrongStatisticsPage] Charts initialized, totalWrong: ${this.statisticsData.totalWrong}`);
    } catch (error) {
      Logger.error('[WrongStatisticsPage] Failed to init charts', error as Error);
    }
  }

  /**
   * 刷新数据
   */
  private async refreshData(): Promise<void> {
    this.isLoading = true;
    await this.loadStatisticsData();

    if (this.isWebReady && this.statisticsData) {
      try {
        const dataJson = JSON.stringify(this.statisticsData);
        const escapedJson = dataJson
          .replace(/\\/g, '\\\\')
          .replace(/'/g, "\\'")
          .replace(/\n/g, '\\n')
          .replace(/\r/g, '\\r');
        this.webController.runJavaScript(`updateCharts('${escapedJson}')`);
      } catch (error) {
        Logger.error('[WrongStatisticsPage] Failed to update charts', error as Error);
      }
    }
  }

  build() {
    Column() {
      // 顶部导航栏
      this.NavigationBar()

      // 内容区域
      Stack() {
        // Web 图表容器
        Web({ src: $rawfile('wrong_statistics.html'), controller: this.webController })
          .width('100%')
          .height('100%')
          .backgroundColor(ThemeColors.BACKGROUND)
          .onControllerAttached(() => {
            Logger.info('[WrongStatisticsPage] Web controller attached');
          })
          .onPageEnd(() => {
            Logger.info('[WrongStatisticsPage] Web page loaded');
            this.isWebReady = true;
            
            // 页面加载完成后初始化图表
            if (this.statisticsData) {
              this.initCharts();
            }
          })
          .onErrorReceive((event) => {
            if (event) {
              Logger.error(`[WrongStatisticsPage] Web error: ${event.error.getErrorInfo()}`);
            }
          })
          .javaScriptAccess(true)
          .domStorageAccess(true)
          .fileAccess(true)

        // 加载遮罩
        if (this.isLoading) {
          Column() {
            LoadingProgress()
              .width(40)
              .height(40)
              .color(ThemeColors.PRIMARY)
          }
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(255, 255, 255, 0.8)')
          .justifyContent(FlexAlign.Center)
        }
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(ThemeColors.BACKGROUND)
    .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
  }

  @Builder
  NavigationBar() {
    Row() {
      // 返回按钮
      Row() {
        Image($r('app.media.back'))
          .width(24)
          .height(24)
      }
      .width(48)
      .height(48)
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        Router.back();
      })

      // 标题
      Text('错题统计分析')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      // 刷新按钮
      Text('刷新')
        .fontSize(14)
        .fontColor(ThemeColors.PRIMARY)
        .padding({ left: 12, right: 12 })
        .onClick(() => {
          this.refreshData();
        })
    }
    .width('100%')
    .height(56)
    .backgroundColor(ThemeColors.SURFACE)
  }
}
