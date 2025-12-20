/**
 * 新手导引服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { preferences } from '@kit.ArkData';
import { GuideStep, OnboardingState, GUIDE_STEPS } from '../common/types/OnboardingTypes';

const PREFERENCES_NAME = 'onboarding_preferences';
const KEY_HAS_COMPLETED = 'has_completed_onboarding';
const KEY_SHOULD_SHOW_AFTER_TEST = 'should_show_guide_after_test';

/**
 * 新手导引服务 - 单例模式
 */
class OnboardingServiceClass {
  private static instance: OnboardingServiceClass;
  private preferencesInstance: preferences.Preferences | null = null;
  private state: OnboardingState = {
    isActive: false,
    currentStepIndex: 0,
    hasCompleted: false
  };
  private initialized: boolean = false;

  private constructor() {}

  /**
   * 获取单例实例
   */
  public static getInstance(): OnboardingServiceClass {
    if (!OnboardingServiceClass.instance) {
      OnboardingServiceClass.instance = new OnboardingServiceClass();
    }
    return OnboardingServiceClass.instance;
  }

  /**
   * 初始化服务
   */
  public async init(context: Context): Promise<void> {
    if (this.initialized) {
      return;
    }
    try {
      this.preferencesInstance = await preferences.getPreferences(context, PREFERENCES_NAME);
      // 读取已完成状态
      const hasCompleted = await this.preferencesInstance.get(KEY_HAS_COMPLETED, false);
      this.state.hasCompleted = hasCompleted as boolean;
      this.initialized = true;
    } catch (error) {
      console.error('OnboardingService init error:', error);
      // 使用默认状态
      this.state.hasCompleted = false;
      this.initialized = true;
    }
  }

  /**
   * 检查是否需要显示导引
   * 条件：未完成导引 且 刚完成水平测试
   */
  public async shouldShowGuide(): Promise<boolean> {
    if (this.state.hasCompleted) {
      return false;
    }
    // 检查是否刚完成水平测试
    if (this.preferencesInstance) {
      try {
        const shouldShow = await this.preferencesInstance.get(KEY_SHOULD_SHOW_AFTER_TEST, false);
        return shouldShow as boolean;
      } catch (error) {
        return false;
      }
    }
    return false;
  }


  /**
   * 设置水平测试完成后需要显示导引的标记
   */
  public async setShowGuideAfterTest(show: boolean): Promise<void> {
    if (this.preferencesInstance) {
      try {
        await this.preferencesInstance.put(KEY_SHOULD_SHOW_AFTER_TEST, show);
        await this.preferencesInstance.flush();
      } catch (error) {
        console.error('setShowGuideAfterTest error:', error);
      }
    }
  }

  /**
   * 清除水平测试后显示导引的标记
   */
  public async clearShowGuideAfterTest(): Promise<void> {
    await this.setShowGuideAfterTest(false);
  }

  /**
   * 开始导引
   */
  public startGuide(): void {
    this.state.isActive = true;
    this.state.currentStepIndex = 0;
  }

  /**
   * 下一步
   */
  public nextStep(): boolean {
    if (!this.state.isActive) {
      return false;
    }
    if (this.isLastStep()) {
      // 最后一步，完成导引
      this.completeGuide();
      return false;
    }
    this.state.currentStepIndex++;
    return true;
  }

  /**
   * 跳过导引
   */
  public async skipGuide(): Promise<void> {
    this.state.isActive = false;
    this.state.hasCompleted = true;
    await this.saveCompletedState();
    await this.clearShowGuideAfterTest();
  }

  /**
   * 完成导引
   */
  public async completeGuide(): Promise<void> {
    this.state.isActive = false;
    this.state.hasCompleted = true;
    await this.saveCompletedState();
    await this.clearShowGuideAfterTest();
  }

  /**
   * 重置导引状态（用于设置页面重新查看）
   */
  public async resetGuide(): Promise<void> {
    this.state.hasCompleted = false;
    this.state.currentStepIndex = 0;
    this.state.isActive = false;
    if (this.preferencesInstance) {
      try {
        await this.preferencesInstance.put(KEY_HAS_COMPLETED, false);
        await this.preferencesInstance.flush();
      } catch (error) {
        console.error('resetGuide error:', error);
      }
    }
  }

  /**
   * 获取当前步骤
   */
  public getCurrentStep(): GuideStep | null {
    if (!this.state.isActive || this.state.currentStepIndex >= GUIDE_STEPS.length) {
      return null;
    }
    return GUIDE_STEPS[this.state.currentStepIndex];
  }

  /**
   * 获取步骤总数
   */
  public getTotalSteps(): number {
    return GUIDE_STEPS.length;
  }

  /**
   * 获取当前步骤索引
   */
  public getCurrentStepIndex(): number {
    return this.state.currentStepIndex;
  }

  /**
   * 判断是否为最后一步
   */
  public isLastStep(): boolean {
    return this.state.currentStepIndex >= GUIDE_STEPS.length - 1;
  }

  /**
   * 获取进度文本
   */
  public getProgressText(): string {
    return `${this.state.currentStepIndex + 1}/${GUIDE_STEPS.length}`;
  }

  /**
   * 获取导引是否激活
   */
  public isActive(): boolean {
    return this.state.isActive;
  }

  /**
   * 获取是否已完成导引
   */
  public hasCompletedGuide(): boolean {
    return this.state.hasCompleted;
  }

  /**
   * 保存完成状态到本地存储
   */
  private async saveCompletedState(): Promise<void> {
    if (this.preferencesInstance) {
      try {
        await this.preferencesInstance.put(KEY_HAS_COMPLETED, this.state.hasCompleted);
        await this.preferencesInstance.flush();
      } catch (error) {
        console.error('saveCompletedState error:', error);
      }
    }
  }
}

// 导出单例实例
export const onboardingService = OnboardingServiceClass.getInstance();
