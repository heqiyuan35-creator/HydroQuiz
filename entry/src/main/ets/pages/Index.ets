/**
 * Index页面 - 重定向到主页
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router } from '../router/Router';
import { AppConstants } from '../common/constants/AppConstants';

@Entry
@Component
struct Index {
  aboutToAppear(): void {
    // 重定向到主Tab页
    Router.replace(AppConstants.ROUTE_MAIN);
  }

  build() {
    Column() {
      // 空白页面，等待重定向
    }
    .width('100%')
    .height('100%')
  }
}