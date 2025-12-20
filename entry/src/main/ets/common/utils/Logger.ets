/**
 * 日志工具类
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0000;
const TAG: string = 'HydroQuiz';

export class Logger {
  /**
   * 输出调试日志
   */
  static debug(message: string, ...args: Object[]): void {
    if (args.length > 0) {
      hilog.debug(DOMAIN, TAG, `${message} %{public}s`, JSON.stringify(args));
    } else {
      hilog.debug(DOMAIN, TAG, message);
    }
  }

  /**
   * 输出信息日志
   */
  static info(message: string, ...args: Object[]): void {
    if (args.length > 0) {
      hilog.info(DOMAIN, TAG, `${message} %{public}s`, JSON.stringify(args));
    } else {
      hilog.info(DOMAIN, TAG, message);
    }
  }

  /**
   * 输出警告日志
   */
  static warn(message: string, ...args: Object[]): void {
    if (args.length > 0) {
      hilog.warn(DOMAIN, TAG, `${message} %{public}s`, JSON.stringify(args));
    } else {
      hilog.warn(DOMAIN, TAG, message);
    }
  }

  /**
   * 输出错误日志
   */
  static error(message: string, error?: Error): void {
    if (error) {
      hilog.error(DOMAIN, TAG, `${message}: %{public}s`, error.message);
    } else {
      hilog.error(DOMAIN, TAG, message);
    }
  }
}
