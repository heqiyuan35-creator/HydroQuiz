/**
 * 学习报告页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { webview } from '@kit.ArkWeb';
import { Router } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import { Logger } from '../common/utils/Logger';
import { studyReportService, StudyReportData } from '../services/StudyReportService';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct StudyReportPage {
  @State isLoading: boolean = true;
  @State isRefreshing: boolean = false;
  @State reportData: StudyReportData | null = null;
  
  private webController: webview.WebviewController = new webview.WebviewController();
  private isWebReady: boolean = false;

  aboutToAppear(): void {
    try {
      webview.WebviewController.setWebDebuggingAccess(true);
    } catch (error) {
      Logger.error('[StudyReportPage] Failed to set web debugging', error as Error);
    }
    this.loadData();
  }

  private async loadData(): Promise<void> {
    try {
      this.reportData = await studyReportService.getReportData();
      if (this.isWebReady) {
        this.initCharts();
      }
    } catch (error) {
      Logger.error('[StudyReportPage] Failed to load data', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  private initCharts(): void {
    if (!this.reportData) return;
    try {
      const dataJson = JSON.stringify(this.reportData);
      const escapedJson = dataJson
        .replace(/\\/g, '\\\\')
        .replace(/'/g, "\\'")
        .replace(/\n/g, '\\n')
        .replace(/\r/g, '\\r');
      this.webController.runJavaScript(`initCharts('${escapedJson}')`);
    } catch (error) {
      Logger.error('[StudyReportPage] Failed to init charts', error as Error);
    }
  }

  private async refreshData(): Promise<void> {
    if (this.isRefreshing) return;
    this.isRefreshing = true;
    
    try {
      this.reportData = await studyReportService.getReportData();
      if (this.isWebReady && this.reportData) {
        const dataJson = JSON.stringify(this.reportData);
        const escapedJson = dataJson
          .replace(/\\/g, '\\\\')
          .replace(/'/g, "\\'")
          .replace(/\n/g, '\\n')
          .replace(/\r/g, '\\r');
        this.webController.runJavaScript(`updateCharts('${escapedJson}')`);
      }
      promptAction.showToast({ message: '刷新成功', duration: 1500 });
    } catch (error) {
      Logger.error('[StudyReportPage] Failed to update charts', error as Error);
      promptAction.showToast({ message: '刷新失败', duration: 1500 });
    } finally {
      this.isRefreshing = false;
    }
  }

  build() {
    Column() {
      this.NavigationBar()

      Stack() {
        Web({ src: $rawfile('study_report.html'), controller: this.webController })
          .width('100%')
          .height('100%')
          .backgroundColor(ThemeColors.BACKGROUND)
          .onPageEnd(() => {
            this.isWebReady = true;
            if (this.reportData) {
              this.initCharts();
            }
          })
          .javaScriptAccess(true)
          .domStorageAccess(true)
          .fileAccess(true)

        // 只在首次加载时显示全屏加载
        if (this.isLoading) {
          Column() {
            LoadingProgress().width(40).height(40).color(ThemeColors.PRIMARY)
          }
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(255, 255, 255, 0.9)')
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
      Row() {
        Image($r('app.media.back')).width(24).height(24)
      }
      .width(48).height(48).justifyContent(FlexAlign.Center)
      .onClick(() => { Router.back(); })

      Text('学习报告')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Row().width(48).height(48)
    }
    .width('100%')
    .height(56)
    .backgroundColor(ThemeColors.SURFACE)
  }
}
