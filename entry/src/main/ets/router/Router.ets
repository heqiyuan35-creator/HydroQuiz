/**
 * 路由管理器
 * HydroQuiz - 水利工程检测员刷题宝
 */
import router from '@ohos.router';
import { Logger } from '../common/utils/Logger';
import { AppConstants } from '../common/constants/AppConstants';

export type RouteParams = Record<string, Object>;

interface PushUrlOptions {
  url: string;
  params?: ESObject;
}

interface ReplaceUrlOptions {
  url: string;
  params?: ESObject;
}

export class Router {
  /**
   * 导航到指定页面
   * @param url 页面路径
   * @param params 参数
   */
  static async push(url: string, params?: RouteParams): Promise<void> {
    try {
      const extendedParams: RouteParams = params || {};

      // 自动记录来源页面
      if (!extendedParams['previousRoute']) {
        const currentPath: string = Router.getPath();
        const currentParams: RouteParams = Router.getParams();

        const businessParams: RouteParams = {};
        Object.keys(currentParams).forEach((key: string) => {
          if (key !== 'previousRoute' && key !== 'previousParams') {
            businessParams[key] = currentParams[key];
          }
        });

        extendedParams['previousRoute'] = currentPath as Object;
        extendedParams['previousParams'] = businessParams as Object;
      }

      Logger.info(`[Router] Navigating to: ${url}`);
      const options: PushUrlOptions = {
        url: url,
        params: extendedParams as ESObject
      };
      await router.pushUrl(options);
    } catch (error) {
      Logger.error(`[Router] Failed to navigate to ${url}`, error as Error);
    }
  }

  /**
   * 替换当前页面
   * @param url 页面路径
   * @param params 参数
   */
  static async replace(url: string, params?: RouteParams): Promise<void> {
    try {
      Logger.info(`[Router] Replacing with: ${url}`);
      const options: ReplaceUrlOptions = {
        url: url,
        params: params as ESObject || {} as ESObject
      };
      await router.replaceUrl(options);
    } catch (error) {
      Logger.error(`[Router] Failed to replace with ${url}`, error as Error);
    }
  }

  /**
   * 返回上一页
   * @param delta 返回层数
   */
  static async back(delta: number = 1): Promise<void> {
    try {
      const params: RouteParams = Router.getParams();

      if (params['previousRoute']) {
        const previousRoute: string = params['previousRoute'] as string;
        const isValidRoute: boolean = previousRoute.length > 6 &&
          previousRoute.includes('Page') &&
          previousRoute.split('/').length >= 2;

        if (isValidRoute) {
          const previousParams: RouteParams = (params['previousParams'] as RouteParams) || {};
          Logger.info(`[Router] Navigating back to: ${previousRoute}`);
          const options: ReplaceUrlOptions = {
            url: previousRoute,
            params: previousParams as ESObject
          };
          await router.replaceUrl(options);
          return;
        }
      }

      Logger.info(`[Router] Going back ${delta} page(s)`);
      router.back();
    } catch (error) {
      Logger.error(`[Router] Failed to go back`, error as Error);
    }
  }

  /**
   * 清空路由栈并导航到指定页面
   * @param url 页面路径
   * @param params 参数
   */
  static async clearAndPush(url: string, params?: RouteParams): Promise<void> {
    try {
      Logger.info(`[Router] Clearing stack and navigating to: ${url}`);
      router.clear();
      const options: PushUrlOptions = {
        url: url,
        params: params as ESObject || {} as ESObject
      };
      await router.pushUrl(options);
    } catch (error) {
      Logger.error(`[Router] Failed to clear and navigate to ${url}`, error as Error);
    }
  }

  /**
   * 获取当前页面参数
   */
  static getParams(): RouteParams {
    return router.getParams() as RouteParams || {};
  }

  /**
   * 获取当前页面路径
   */
  static getPath(): string {
    return router.getState()?.path || '';
  }

  /**
   * 判断是否可以返回
   */
  static canGoBack(): boolean {
    const length: number = Number(router.getLength());
    return length > 1;
  }

  // ========== 预定义路由方法 ==========

  /**
   * 跳转到主页
   */
  static async goToMain(): Promise<void> {
    await Router.clearAndPush(AppConstants.ROUTE_MAIN);
  }

  /**
   * 跳转到首页
   */
  static async goToHome(): Promise<void> {
    await Router.push(AppConstants.ROUTE_HOME);
  }

  /**
   * 跳转到练习页
   */
  static async goToPractice(subjectId?: string, mode?: string): Promise<void> {
    const params: RouteParams = {};
    if (subjectId) {
      params['subjectId'] = subjectId as Object;
    }
    if (mode) {
      params['mode'] = mode as Object;
    }
    await Router.push(AppConstants.ROUTE_PRACTICE, params);
  }

  /**
   * 跳转到答题页
   */
  static async goToAnswer(params: RouteParams): Promise<void> {
    await Router.push(AppConstants.ROUTE_ANSWER, params);
  }

  /**
   * 跳转到考试页
   */
  static async goToExam(examType?: string, subjectId?: string): Promise<void> {
    const params: RouteParams = {};
    if (examType) {
      params['examType'] = examType as Object;
    }
    if (subjectId) {
      params['subjectId'] = subjectId as Object;
    }
    await Router.push(AppConstants.ROUTE_EXAM, params);
  }

  /**
   * 跳转到考试结果页
   */
  static async goToExamResult(examRecordId: string): Promise<void> {
    const params: RouteParams = {};
    params['examRecordId'] = examRecordId as Object;
    await Router.push(AppConstants.ROUTE_EXAM_RESULT, params);
  }

  /**
   * 跳转到统计页
   */
  static async goToStatistics(): Promise<void> {
    await Router.push(AppConstants.ROUTE_STATISTICS);
  }

  /**
   * 跳转到错题本
   */
  static async goToWrongBook(): Promise<void> {
    await Router.push(AppConstants.ROUTE_WRONG_BOOK);
  }

  /**
   * 跳转到错题统计分析
   */
  static async goToWrongStatistics(): Promise<void> {
    await Router.push(AppConstants.ROUTE_WRONG_STATISTICS);
  }

  /**
   * 跳转到收藏页
   */
  static async goToFavorite(): Promise<void> {
    await Router.push(AppConstants.ROUTE_FAVORITE);
  }

  /**
   * 跳转到个人中心
   */
  static async goToProfile(): Promise<void> {
    await Router.push(AppConstants.ROUTE_PROFILE);
  }

  /**
   * 跳转到设置页
   */
  static async goToSettings(): Promise<void> {
    await Router.push(AppConstants.ROUTE_SETTINGS);
  }

  /**
   * 跳转到题库页
   */
  static async goToQuestionBank(subjectId?: string): Promise<void> {
    const params: RouteParams = {};
    if (subjectId) {
      params['subjectId'] = subjectId as Object;
    }
    await Router.push(AppConstants.ROUTE_QUESTION_BANK, params);
  }

  // ========== 闯关模式相关路由 ==========

  /**
   * 跳转到闯关模式
   */
  static async goToGameMode(): Promise<void> {
    await Router.push(AppConstants.ROUTE_GAME_MODE);
  }

  /**
   * 跳转到关卡答题页
   */
  static async goToGameLevel(levelId: string, chapterId: string): Promise<void> {
    const params: RouteParams = {};
    params['levelId'] = levelId as Object;
    params['chapterId'] = chapterId as Object;
    await Router.push(AppConstants.ROUTE_GAME_LEVEL, params);
  }

  /**
   * 跳转到地图页面
   */
  static async goToMap(): Promise<void> {
    await Router.push('pages/MapPage');
  }
}
