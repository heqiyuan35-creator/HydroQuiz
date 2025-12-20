/**
 * 卡片扩展能力
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { formBindingData, FormExtensionAbility, formInfo, formProvider } from '@kit.FormKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { preferences } from '@kit.ArkData';

const TAG: string = 'EntryFormAbility';
const DOMAIN_NUMBER: number = 0xFF00;
const PREFERENCES_NAME: string = 'hydro_quiz_prefs';

// 卡片数据类
class StudyReminderData {
  todayCount: number = 0;
  targetCount: number = 20;
  isCheckedIn: boolean = false;
  streakDays: number = 0;
  encourageText: string = '';
}

class StudyProgressData {
  todayCount: number = 0;
  targetCount: number = 20; // 与App默认值一致
  correctCount: number = 0;
  wrongCount: number = 0;
  accuracy: number = 0;
  isCheckedIn: boolean = false;
  streakDays: number = 0;
  totalQuestions: number = 0;
  progressPercent: number = 0;
}

class FormUpdateData {
  todayCount: number = 0;
  targetCount: number = 20; // 与App默认值一致
  correctCount: number = 0;
  wrongCount: number = 0;
  accuracy: number = 0;
  isCheckedIn: boolean = false;
  streakDays: number = 0;
  totalQuestions: number = 0;
  progressPercent: number = 0;
  encourageText: string = '';
}

export default class EntryFormAbility extends FormExtensionAbility {
  /**
   * 卡片添加时触发
   */
  onAddForm(want: Want): formBindingData.FormBindingData {
    hilog.info(DOMAIN_NUMBER, TAG, '[EntryFormAbility] onAddForm');

    const formId = want.parameters?.[formInfo.FormParam.IDENTITY_KEY] as string;
    const formName = want.parameters?.[formInfo.FormParam.NAME_KEY] as string;
    hilog.info(DOMAIN_NUMBER, TAG, `Form name: ${formName}, formId: ${formId}`);

    // 保存 formId 到 Preferences
    this.saveFormId(formId);

    // 根据卡片名称返回不同数据
    if (formName === 'StudyProgress') {
      return this.getStudyProgressData();
    } else {
      return this.getStudyReminderData();
    }
  }

  /**
   * 卡片更新时触发
   */
  onUpdateForm(formId: string): void {
    hilog.info(DOMAIN_NUMBER, TAG, `[EntryFormAbility] onUpdateForm, formId: ${formId}`);
    this.updateFormData(formId);
  }

  /**
   * 卡片事件触发
   */
  onFormEvent(formId: string, message: string): void {
    hilog.info(DOMAIN_NUMBER, TAG, `[EntryFormAbility] onFormEvent, formId: ${formId}, message: ${message}`);

    try {
      const msgObj = JSON.parse(message) as Record<string, string>;
      const action = msgObj['action'];

      if (action === 'refresh') {
        this.updateFormData(formId);
      }
    } catch (error) {
      hilog.error(DOMAIN_NUMBER, TAG, `Parse message error: ${JSON.stringify(error)}`);
    }
  }

  onCastToNormalForm(formId: string): void {
    hilog.info(DOMAIN_NUMBER, TAG, '[EntryFormAbility] onCastToNormalForm');
  }

  onRemoveForm(formId: string): void {
    hilog.info(DOMAIN_NUMBER, TAG, `[EntryFormAbility] onRemoveForm, formId: ${formId}`);
    // 移除 formId
    this.removeFormId(formId);
  }

  /**
   * 保存 formId 到 Preferences
   */
  private saveFormId(formId: string): void {
    try {
      const pref = preferences.getPreferencesSync(this.context, { name: PREFERENCES_NAME });
      const formIdsStr = pref.getSync('formIds', '') as string;
      const formIds = formIdsStr ? formIdsStr.split(',') : [];

      if (!formIds.includes(formId)) {
        formIds.push(formId);
        pref.putSync('formIds', formIds.join(','));
        pref.flush();
        hilog.info(DOMAIN_NUMBER, TAG, `Saved formId: ${formId}, total: ${formIds.length}`);
      }
    } catch (error) {
      hilog.error(DOMAIN_NUMBER, TAG, `Save formId error: ${JSON.stringify(error)}`);
    }
  }

  /**
   * 移除 formId
   */
  private removeFormId(formId: string): void {
    try {
      const pref = preferences.getPreferencesSync(this.context, { name: PREFERENCES_NAME });
      const formIdsStr = pref.getSync('formIds', '') as string;
      const formIds = formIdsStr ? formIdsStr.split(',') : [];

      const index = formIds.indexOf(formId);
      if (index > -1) {
        formIds.splice(index, 1);
        pref.putSync('formIds', formIds.join(','));
        pref.flush();
        hilog.info(DOMAIN_NUMBER, TAG, `Removed formId: ${formId}, remaining: ${formIds.length}`);
      }
    } catch (error) {
      hilog.error(DOMAIN_NUMBER, TAG, `Remove formId error: ${JSON.stringify(error)}`);
    }
  }

  onAcquireFormState(want: Want): formInfo.FormState {
    return formInfo.FormState.READY;
  }

  /**
   * 获取学习提醒卡片数据
   */
  private getStudyReminderData(): formBindingData.FormBindingData {
    const rawData = this.loadStudyData();
    const reminderData = new StudyReminderData();
    reminderData.todayCount = rawData.todayCount;
    reminderData.targetCount = rawData.targetCount;
    reminderData.isCheckedIn = rawData.isCheckedIn;
    reminderData.streakDays = rawData.streakDays;
    reminderData.encourageText = this.getEncourageText(rawData.todayCount, rawData.targetCount, rawData.isCheckedIn);

    return formBindingData.createFormBindingData(reminderData);
  }

  /**
   * 获取学习进度卡片数据
   */
  private getStudyProgressData(): formBindingData.FormBindingData {
    const rawData = this.loadStudyData();
    const progressData = new StudyProgressData();
    progressData.todayCount = rawData.todayCount;
    progressData.targetCount = rawData.targetCount;
    progressData.correctCount = rawData.correctCount;
    progressData.wrongCount = rawData.wrongCount;
    progressData.accuracy = rawData.todayCount > 0 ? Math.round((rawData.correctCount / rawData.todayCount) * 100) : 0;
    progressData.isCheckedIn = rawData.isCheckedIn;
    progressData.streakDays = rawData.streakDays;
    progressData.totalQuestions = rawData.totalQuestions;
    progressData.progressPercent = rawData.targetCount > 0
      ? Math.min(100, Math.round((rawData.todayCount / rawData.targetCount) * 100))
      : 0;

    return formBindingData.createFormBindingData(progressData);
  }

  /**
   * 从 Preferences 加载学习数据
   */
  private loadStudyData(): StudyProgressData {
    const result = new StudyProgressData();

    try {
      const context = this.context;
      const pref = preferences.getPreferencesSync(context, { name: PREFERENCES_NAME });

      const today = new Date().toDateString();
      const lastStudyDate = pref.getSync('lastStudyDate', '') as string;

      // 如果不是今天的数据，重置今日统计
      if (lastStudyDate !== today) {
        result.todayCount = 0;
        result.targetCount = pref.getSync('dailyTarget', 20) as number; // 与App默认值一致
        result.correctCount = 0;
        result.wrongCount = 0;
        result.isCheckedIn = false;
        result.streakDays = pref.getSync('streakDays', 0) as number;
        result.totalQuestions = pref.getSync('totalQuestions', 0) as number;
        return result;
      }

      result.todayCount = pref.getSync('todayAnswerCount', 0) as number;
      result.targetCount = pref.getSync('dailyTarget', 20) as number; // 与App默认值一致
      result.correctCount = pref.getSync('todayCorrectCount', 0) as number;
      result.wrongCount = pref.getSync('todayWrongCount', 0) as number;
      result.isCheckedIn = pref.getSync('isCheckedInToday', false) as boolean;
      result.streakDays = pref.getSync('streakDays', 0) as number;
      result.totalQuestions = pref.getSync('totalQuestions', 0) as number;
    } catch (error) {
      hilog.error(DOMAIN_NUMBER, TAG, `Load study data error: ${JSON.stringify(error)}`);
    }

    return result;
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

  /**
   * 更新卡片数据
   */
  private updateFormData(formId: string): void {
    const rawData = this.loadStudyData();

    const updateData = new FormUpdateData();
    updateData.todayCount = rawData.todayCount;
    updateData.targetCount = rawData.targetCount;
    updateData.correctCount = rawData.correctCount;
    updateData.wrongCount = rawData.wrongCount;
    updateData.accuracy = rawData.todayCount > 0
      ? Math.round((rawData.correctCount / rawData.todayCount) * 100)
      : 0;
    updateData.isCheckedIn = rawData.isCheckedIn;
    updateData.streakDays = rawData.streakDays;
    updateData.totalQuestions = rawData.totalQuestions;
    updateData.progressPercent = rawData.targetCount > 0
      ? Math.min(100, Math.round((rawData.todayCount / rawData.targetCount) * 100))
      : 0;
    updateData.encourageText = this.getEncourageText(rawData.todayCount, rawData.targetCount, rawData.isCheckedIn);

    const formData = formBindingData.createFormBindingData(updateData);

    formProvider.updateForm(formId, formData)
      .then(() => {
        hilog.info(DOMAIN_NUMBER, TAG, 'Update form success');
      })
      .catch((error: BusinessError) => {
        hilog.error(DOMAIN_NUMBER, TAG, `Update form failed: ${JSON.stringify(error)}`);
      });
  }
}
