/**
 * 卡片数据同步服务
 * 将 App 数据同步到 Preferences，供卡片读取
 */
import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import { formBindingData, formProvider } from '@kit.FormKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../common/utils/Logger';

const PREFERENCES_NAME: string = 'hydro_quiz_prefs';

/**
 * 卡片更新数据类
 */
class WidgetUpdateData {
  todayCount: number = 0;
  targetCount: number = 20; // 与App默认值一致
  correctCount: number = 0;
  wrongCount: number = 0;
  accuracy: number = 0;
  isCheckedIn: boolean = false;
  streakDays: number = 0;
  progressPercent: number = 0;
  encourageText: string = '';
}

/**
 * 卡片数据接口
 */
export interface WidgetData {
  todayCount: number;
  targetCount: number;
  correctCount: number;
  wrongCount: number;
  isCheckedIn: boolean;
  streakDays: number;
  totalQuestions: number;
}

class WidgetDataService {
  private context: common.UIAbilityContext | null = null;

  /**
   * 初始化服务
   */
  init(context: common.UIAbilityContext): void {
    this.context = context;
  }

  /**
   * 同步数据到 Preferences 并更新卡片
   */
  async syncData(data: WidgetData): Promise<void> {
    if (!this.context) {
      Logger.error('[WidgetDataService] Context not initialized');
      return;
    }

    try {
      const pref = preferences.getPreferencesSync(this.context, { name: PREFERENCES_NAME });
      const today = new Date().toDateString();

      // 保存数据
      pref.putSync('lastStudyDate', today);
      pref.putSync('todayAnswerCount', data.todayCount);
      pref.putSync('dailyTarget', data.targetCount);
      pref.putSync('todayCorrectCount', data.correctCount);
      pref.putSync('todayWrongCount', data.wrongCount);
      pref.putSync('isCheckedInToday', data.isCheckedIn);
      pref.putSync('streakDays', data.streakDays);
      pref.putSync('totalQuestions', data.totalQuestions);

      await pref.flush();

      Logger.info('[WidgetDataService] Data synced to preferences');

      // 更新所有卡片
      await this.updateAllWidgets(data);
    } catch (error) {
      Logger.error('[WidgetDataService] Failed to sync data', error as Error);
    }
  }

  /**
   * 更新今日答题数据
   */
  async updateTodayStats(correctCount: number, wrongCount: number): Promise<void> {
    if (!this.context) return;

    try {
      const pref = preferences.getPreferencesSync(this.context, { name: PREFERENCES_NAME });
      const today = new Date().toDateString();
      const lastDate = pref.getSync('lastStudyDate', '') as string;

      // 如果是新的一天，重置统计
      if (lastDate !== today) {
        pref.putSync('lastStudyDate', today);
        pref.putSync('todayAnswerCount', 0);
        pref.putSync('todayCorrectCount', 0);
        pref.putSync('todayWrongCount', 0);
        pref.putSync('isCheckedInToday', false);
      }

      // 更新统计
      const currentTotal = pref.getSync('todayAnswerCount', 0) as number;
      const currentCorrect = pref.getSync('todayCorrectCount', 0) as number;
      const currentWrong = pref.getSync('todayWrongCount', 0) as number;

      pref.putSync('todayAnswerCount', currentTotal + correctCount + wrongCount);
      pref.putSync('todayCorrectCount', currentCorrect + correctCount);
      pref.putSync('todayWrongCount', currentWrong + wrongCount);

      await pref.flush();

      // 获取完整数据并更新卡片
      const data = await this.getWidgetData();
      await this.updateAllWidgets(data);

      Logger.info('[WidgetDataService] Today stats updated');
    } catch (error) {
      Logger.error('[WidgetDataService] Failed to update today stats', error as Error);
    }
  }

  /**
   * 更新打卡状态
   */
  async updateCheckInStatus(isCheckedIn: boolean, streakDays: number): Promise<void> {
    if (!this.context) return;

    try {
      const pref = preferences.getPreferencesSync(this.context, { name: PREFERENCES_NAME });

      pref.putSync('isCheckedInToday', isCheckedIn);
      pref.putSync('streakDays', streakDays);

      await pref.flush();

      // 获取完整数据并更新卡片
      const data = await this.getWidgetData();
      await this.updateAllWidgets(data);

      Logger.info('[WidgetDataService] Check-in status updated');
    } catch (error) {
      Logger.error('[WidgetDataService] Failed to update check-in status', error as Error);
    }
  }

  /**
   * 更新每日目标
   */
  async updateDailyTarget(target: number): Promise<void> {
    if (!this.context) {
      Logger.error('[WidgetDataService] Context not initialized when updating daily target');
      return;
    }

    try {
      const pref = preferences.getPreferencesSync(this.context, { name: PREFERENCES_NAME });
      pref.putSync('dailyTarget', target);
      await pref.flush();

      Logger.info(`[WidgetDataService] Daily target saved to preferences: ${target}`);

      // 获取完整数据并更新卡片
      const data = await this.getWidgetData();
      Logger.info(`[WidgetDataService] Widget data for update: todayCount=${data.todayCount}, targetCount=${data.targetCount}`);
      await this.updateAllWidgets(data);

      Logger.info(`[WidgetDataService] Daily target updated to ${target}`);
    } catch (error) {
      Logger.error('[WidgetDataService] Failed to update daily target', error as Error);
    }
  }

  /**
   * 初始化同步 - App 启动时调用，从数据库同步当前数据到卡片 Preferences
   */
  async initSync(todayCount: number, correctCount: number, wrongCount: number, dailyTarget: number, isCheckedIn: boolean): Promise<void> {
    if (!this.context) return;

    try {
      const pref = preferences.getPreferencesSync(this.context, { name: PREFERENCES_NAME });
      const today = new Date().toDateString();

      pref.putSync('lastStudyDate', today);
      pref.putSync('todayAnswerCount', todayCount);
      pref.putSync('todayCorrectCount', correctCount);
      pref.putSync('todayWrongCount', wrongCount);
      pref.putSync('dailyTarget', dailyTarget);
      pref.putSync('isCheckedInToday', isCheckedIn);

      await pref.flush();

      // 更新卡片
      const data: WidgetData = {
        todayCount: todayCount,
        targetCount: dailyTarget,
        correctCount: correctCount,
        wrongCount: wrongCount,
        isCheckedIn: isCheckedIn,
        streakDays: 0,
        totalQuestions: 0
      };
      await this.updateAllWidgets(data);

      Logger.info(`[WidgetDataService] Init sync completed - today: ${todayCount}/${dailyTarget}, checked: ${isCheckedIn}`);
    } catch (error) {
      Logger.error('[WidgetDataService] Failed to init sync', error as Error);
    }
  }

  /**
   * 获取卡片数据
   */
  async getWidgetData(): Promise<WidgetData> {
    if (!this.context) {
      Logger.error('[WidgetDataService] Context not initialized when getting widget data');
      return this.getDefaultData();
    }

    try {
      const pref = preferences.getPreferencesSync(this.context, { name: PREFERENCES_NAME });
      const today = new Date().toDateString();
      const lastDate = pref.getSync('lastStudyDate', '') as string;
      const dailyTarget = pref.getSync('dailyTarget', 20) as number; // 默认20与App一致

      // 如果不是今天的数据，返回默认值（但保留dailyTarget）
      if (lastDate !== today) {
        return {
          todayCount: 0,
          targetCount: dailyTarget,
          correctCount: 0,
          wrongCount: 0,
          isCheckedIn: false,
          streakDays: pref.getSync('streakDays', 0) as number,
          totalQuestions: pref.getSync('totalQuestions', 0) as number
        };
      }

      return {
        todayCount: pref.getSync('todayAnswerCount', 0) as number,
        targetCount: dailyTarget,
        correctCount: pref.getSync('todayCorrectCount', 0) as number,
        wrongCount: pref.getSync('todayWrongCount', 0) as number,
        isCheckedIn: pref.getSync('isCheckedInToday', false) as boolean,
        streakDays: pref.getSync('streakDays', 0) as number,
        totalQuestions: pref.getSync('totalQuestions', 0) as number
      };
    } catch (error) {
      Logger.error('[WidgetDataService] Failed to get widget data', error as Error);
      return this.getDefaultData();
    }
  }

  /**
   * 获取默认数据
   */
  private getDefaultData(): WidgetData {
    return {
      todayCount: 0,
      targetCount: 20, // 与App默认值一致
      correctCount: 0,
      wrongCount: 0,
      isCheckedIn: false,
      streakDays: 0,
      totalQuestions: 0
    };
  }

  /**
   * 更新所有卡片
   */
  private async updateAllWidgets(data: WidgetData): Promise<void> {
    if (!this.context) return;

    try {
      const pref = preferences.getPreferencesSync(this.context, { name: PREFERENCES_NAME });
      const formIdsStr = pref.getSync('formIds', '') as string;

      if (!formIdsStr) {
        Logger.info('[WidgetDataService] No form ids found');
        return;
      }

      const formIds = formIdsStr.split(',').filter((id: string) => id.length > 0);
      const accuracy = data.todayCount > 0
        ? Math.round((data.correctCount / data.todayCount) * 100)
        : 0;
      const progressPercent = data.targetCount > 0
        ? Math.min(100, Math.round((data.todayCount / data.targetCount) * 100))
        : 0;

      // 构建更新数据
      const updateData = new WidgetUpdateData();
      updateData.todayCount = data.todayCount;
      updateData.targetCount = data.targetCount;
      updateData.correctCount = data.correctCount;
      updateData.wrongCount = data.wrongCount;
      updateData.accuracy = accuracy;
      updateData.isCheckedIn = data.isCheckedIn;
      updateData.streakDays = data.streakDays;
      updateData.progressPercent = progressPercent;
      updateData.encourageText = this.getEncourageText(data.todayCount, data.targetCount, data.isCheckedIn);

      const formData = formBindingData.createFormBindingData(updateData);

      // 更新所有卡片
      for (const formId of formIds) {
        formProvider.updateForm(formId, formData)
          .then(() => {
            Logger.info(`[WidgetDataService] Updated form: ${formId}`);
          })
          .catch((err: BusinessError) => {
            Logger.error(`[WidgetDataService] Failed to update form ${formId}: ${err.message}`);
          });
      }
    } catch (error) {
      Logger.error('[WidgetDataService] Failed to update widgets', error as Error);
    }
  }

  /**
   * 获取鼓励文案
   */
  private getEncourageText(todayCount: number, targetCount: number, isCheckedIn: boolean): string {
    if (todayCount === 0) {
      return '📚 开始今天的学习吧！';
    }
    if (isCheckedIn) {
      return '🎉 今日已打卡，继续保持！';
    }
    if (todayCount >= targetCount) {
      return '🔥 目标达成，继续猛冲！';
    }
    const remaining = targetCount - todayCount;
    return `💪 还差 ${remaining} 题完成目标`;
  }
}

export const widgetDataService = new WidgetDataService();
