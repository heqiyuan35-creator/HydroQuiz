/**
 * 应用初始化状态管理
 * HydroQuiz - 水利工程检测员刷题宝
 */

class InitializationStateManager {
  private _isInitialized: boolean = false;
  private _initPromise: Promise<void> | null = null;
  private _resolveInit: (() => void) | null = null;

  constructor() {
    this._initPromise = new Promise((resolve) => {
      this._resolveInit = resolve;
    });
  }

  /**
   * 标记初始化完成
   */
  markInitialized(): void {
    this._isInitialized = true;
    if (this._resolveInit) {
      this._resolveInit();
    }
  }

  /**
   * 检查是否已初始化
   */
  isInitialized(): boolean {
    return this._isInitialized;
  }

  /**
   * 等待初始化完成
   */
  async waitForInitialization(): Promise<void> {
    if (this._isInitialized) {
      return;
    }
    return this._initPromise!;
  }
}

// 导出单例
export const initializationState = new InitializationStateManager();
