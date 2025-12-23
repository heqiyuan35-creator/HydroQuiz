/**
 * 用户信息服务
 * 管理本地用户个人信息
 */
import { preferences } from '@kit.ArkData';
import { Logger } from '../common/utils/Logger';

const WIDGET_PREFERENCES_NAME: string = 'hydro_quiz_prefs';

/**
 * 用户信息接口
 */
export interface UserInfo {
  nickname: string;
  gender: 'male' | 'female';
  userId: string;
  status: string;
}

/**
 * 入门测试结果接口
 */
export interface EntryTestResult {
  score: number;
  accuracy: number;
  level: string;
  date: number;
}

/**
 * 打卡结果接口
 */
export interface CheckInResult {
  success: boolean;
  streakDays: number;
}

/**
 * 默认用户信息
 */
const DEFAULT_USER: UserInfo = {
  nickname: '水利学员',
  gender: 'male',
  userId: '',
  status: '水利检测员备考中'
};

class UserService {
  private static instance: UserService;
  private preferences: preferences.Preferences | null = null;
  private context: Context | null = null;
  private readonly STORE_NAME = 'user_preferences';

  private constructor() {}

  static getInstance(): UserService {
    if (!UserService.instance) {
      UserService.instance = new UserService();
    }
    return UserService.instance;
  }

  /**
   * 初始化
   */
  async init(context: Context): Promise<void> {
    try {
      this.context = context;
      this.preferences = await preferences.getPreferences(context, this.STORE_NAME);
      // 生成用户ID（如果没有）
      const userId = await this.preferences.get('userId', '');
      if (!userId) {
        const newUserId = this.generateUserId();
        await this.preferences.put('userId', newUserId);
        await this.preferences.flush();
      }
      Logger.info('[UserService] Initialized');
    } catch (error) {
      Logger.error('[UserService] Init failed', error as Error);
    }
  }


  /**
   * 生成用户ID
   */
  private generateUserId(): string {
    return Math.floor(100000 + Math.random() * 900000).toString();
  }

  /**
   * 获取用户信息
   */
  async getUserInfo(): Promise<UserInfo> {
    if (!this.preferences) {
      return DEFAULT_USER;
    }
    try {
      const nickname = await this.preferences.get('nickname', DEFAULT_USER.nickname) as string;
      const gender = await this.preferences.get('gender', DEFAULT_USER.gender) as 'male' | 'female';
      const userId = await this.preferences.get('userId', '') as string;
      const status = await this.preferences.get('status', DEFAULT_USER.status) as string;

      const userInfo: UserInfo = {
        nickname: nickname,
        gender: gender,
        userId: userId,
        status: status
      };
      return userInfo;
    } catch (error) {
      Logger.error('[UserService] Get user info failed', error as Error);
      return DEFAULT_USER;
    }
  }

  /**
   * 保存用户信息
   */
  async saveUserInfo(info: UserInfo): Promise<boolean> {
    if (!this.preferences) {
      return false;
    }
    try {
      await this.preferences.put('nickname', info.nickname);
      await this.preferences.put('gender', info.gender);
      await this.preferences.put('status', info.status);
      await this.preferences.flush();
      Logger.info('[UserService] User info saved');
      return true;
    } catch (error) {
      Logger.error('[UserService] Save user info failed', error as Error);
      return false;
    }
  }

  /**
   * 更新昵称
   */
  async updateNickname(nickname: string): Promise<boolean> {
    if (!this.preferences) {
      return false;
    }
    try {
      await this.preferences.put('nickname', nickname);
      await this.preferences.flush();
      return true;
    } catch (error) {
      Logger.error('[UserService] Update nickname failed', error as Error);
      return false;
    }
  }

  /**
   * 更新性别
   */
  async updateGender(gender: 'male' | 'female'): Promise<boolean> {
    if (!this.preferences) {
      return false;
    }
    try {
      await this.preferences.put('gender', gender);
      await this.preferences.flush();
      return true;
    } catch (error) {
      Logger.error('[UserService] Update gender failed', error as Error);
      return false;
    }
  }

  /**
   * 获取考试目标日期
   * @returns 考试日期时间戳，如果未设置返回默认值（30天后）
   */
  async getExamDate(): Promise<number> {
    if (!this.preferences) {
      return Date.now() + 30 * 24 * 60 * 60 * 1000;
    }
    try {
      const defaultDate = Date.now() + 30 * 24 * 60 * 60 * 1000;
      const examDate = await this.preferences.get('examDate', defaultDate) as number;
      return examDate;
    } catch (error) {
      Logger.error('[UserService] Get exam date failed', error as Error);
      return Date.now() + 30 * 24 * 60 * 60 * 1000;
    }
  }

  /**
   * 保存考试目标日期
   */
  async saveExamDate(timestamp: number): Promise<boolean> {
    if (!this.preferences) {
      return false;
    }
    try {
      await this.preferences.put('examDate', timestamp);
      await this.preferences.flush();
      Logger.info('[UserService] Exam date saved');
      return true;
    } catch (error) {
      Logger.error('[UserService] Save exam date failed', error as Error);
      return false;
    }
  }

  /**
   * 计算距离考试的天数
   */
  calculateDaysUntilExam(examTimestamp: number): number {
    const now = Date.now();
    const diff = examTimestamp - now;
    if (diff <= 0) {
      return 0;
    }
    return Math.ceil(diff / (24 * 60 * 60 * 1000));
  }

  /**
   * 格式化日期为显示字符串
   */
  formatExamDate(timestamp: number): string {
    const date = new Date(timestamp);
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    return `${year}年${month}月${day}日`;
  }

  /**
   * 获取每日目标题数
   */
  async getDailyGoal(): Promise<number> {
    if (!this.preferences) {
      return 50;
    }
    try {
      const goal = await this.preferences.get('dailyGoal', 20) as number;
      return goal;
    } catch (error) {
      Logger.error('[UserService] Get daily goal failed', error as Error);
      return 50;
    }
  }

  /**
   * 保存每日目标题数
   */
  async saveDailyGoal(goal: number): Promise<boolean> {
    if (!this.preferences) {
      return false;
    }
    try {
      await this.preferences.put('dailyGoal', goal);
      await this.preferences.flush();

      // 同时更新卡片的 Preferences
      await this.updateWidgetDailyTarget(goal);

      Logger.info('[UserService] Daily goal saved');
      return true;
    } catch (error) {
      Logger.error('[UserService] Save daily goal failed', error as Error);
      return false;
    }
  }

  /**
   * 更新卡片的每日目标
   */
  private async updateWidgetDailyTarget(goal: number): Promise<void> {
    if (!this.context) return;

    try {
      const widgetPref = preferences.getPreferencesSync(this.context, { name: WIDGET_PREFERENCES_NAME });
      widgetPref.putSync('dailyTarget', goal);
      await widgetPref.flush();
      Logger.info(`[UserService] Widget daily target updated to ${goal}`);
    } catch (error) {
      Logger.error('[UserService] Failed to update widget daily target', error as Error);
    }
  }

  /**
   * 获取日期字符串（本地时间，格式：YYYY-MM-DD）
   */
  private getDateString(date: Date): string {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  }

  /**
   * 获取今日打卡日期（本地时间，格式：YYYY-MM-DD）
   */
  private getTodayDateString(): string {
    return this.getDateString(new Date());
  }

  /**
   * 获取本周的起始日期（周一）
   */
  private getWeekStartDate(): Date {
    const now = new Date();
    const dayOfWeek = now.getDay(); // 0=周日, 1=周一, ..., 6=周六
    const diff = dayOfWeek === 0 ? 6 : dayOfWeek - 1; // 计算距离周一的天数
    const monday = new Date(now);
    monday.setDate(now.getDate() - diff);
    monday.setHours(0, 0, 0, 0);
    return monday;
  }

  /**
   * 检查今日是否已打卡
   */
  async hasCheckedInToday(): Promise<boolean> {
    if (!this.preferences) {
      return false;
    }
    try {
      const lastCheckIn = await this.preferences.get('lastCheckInDate', '') as string;
      return lastCheckIn === this.getTodayDateString();
    } catch (error) {
      Logger.error('[UserService] Check check-in status failed', error as Error);
      return false;
    }
  }

  /**
   * 执行今日打卡，同时更新周打卡记录和连续打卡天数
   */
  async checkInToday(): Promise<CheckInResult> {
    const failResult: CheckInResult = { success: false, streakDays: 0 };
    if (!this.preferences) {
      return failResult;
    }
    try {
      const today = this.getTodayDateString();
      const lastCheckIn = await this.preferences.get('lastCheckInDate', '') as string;

      // 如果今天已经打卡，直接返回
      if (lastCheckIn === today) {
        const streakDays = await this.getStreakDays();
        const result: CheckInResult = { success: true, streakDays: streakDays };
        return result;
      }

      // 计算连续打卡天数
      let streakDays = await this.getStreakDays();
      if (lastCheckIn) {
        const lastDate = new Date(lastCheckIn);
        const todayDate = new Date(today);
        const diffTime = todayDate.getTime() - lastDate.getTime();
        const diffDays = Math.floor(diffTime / (24 * 60 * 60 * 1000));

        if (diffDays === 1) {
          // 连续打卡
          streakDays += 1;
        } else if (diffDays > 1) {
          // 中断了，重新开始
          streakDays = 1;
        }
      } else {
        // 第一次打卡
        streakDays = 1;
      }

      // 保存打卡日期
      await this.preferences.put('lastCheckInDate', today);
      // 保存连续打卡天数
      await this.preferences.put('streakDays', streakDays);
      // 更新周打卡记录
      await this.addWeeklyCheckInRecord(today);

      await this.preferences.flush();
      Logger.info(`[UserService] Check-in successful, streak: ${streakDays} days`);
      const successResult: CheckInResult = { success: true, streakDays: streakDays };
      return successResult;
    } catch (error) {
      Logger.error('[UserService] Check-in failed', error as Error);
      return failResult;
    }
  }

  /**
   * 获取连续打卡天数
   */
  async getStreakDays(): Promise<number> {
    if (!this.preferences) {
      return 0;
    }
    try {
      // 先检查连续性是否中断
      const lastCheckIn = await this.preferences.get('lastCheckInDate', '') as string;
      if (!lastCheckIn) {
        return 0;
      }

      const lastDate = new Date(lastCheckIn);
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      lastDate.setHours(0, 0, 0, 0);

      const diffTime = today.getTime() - lastDate.getTime();
      const diffDays = Math.floor(diffTime / (24 * 60 * 60 * 1000));

      // 如果超过1天没打卡，连续天数归零
      if (diffDays > 1) {
        await this.preferences.put('streakDays', 0);
        await this.preferences.flush();
        return 0;
      }

      const streakDays = await this.preferences.get('streakDays', 0) as number;
      return streakDays;
    } catch (error) {
      Logger.error('[UserService] Get streak days failed', error as Error);
      return 0;
    }
  }

  /**
   * 添加周打卡记录
   */
  private async addWeeklyCheckInRecord(dateStr: string): Promise<void> {
    if (!this.preferences) return;

    try {
      const weekStart = this.getWeekStartDate();
      const weekStartStr = this.getDateString(weekStart);

      // 获取当前周的打卡记录
      let weeklyRecordsStr = await this.preferences.get('weeklyCheckInRecords', '') as string;
      let weeklyRecordsWeek = await this.preferences.get('weeklyCheckInWeek', '') as string;

      // 如果是新的一周，清空记录
      if (weeklyRecordsWeek !== weekStartStr) {
        weeklyRecordsStr = '';
        weeklyRecordsWeek = weekStartStr;
      }

      // 添加今天的打卡记录
      const records = weeklyRecordsStr ? weeklyRecordsStr.split(',') : [];
      if (!records.includes(dateStr)) {
        records.push(dateStr);
      }

      await this.preferences.put('weeklyCheckInRecords', records.join(','));
      await this.preferences.put('weeklyCheckInWeek', weekStartStr);
    } catch (error) {
      Logger.error('[UserService] Add weekly check-in record failed', error as Error);
    }
  }

  /**
   * 获取本周打卡记录（返回已打卡的星期几数组，1=周一，7=周日）
   */
  async getWeeklyCheckInDays(): Promise<number[]> {
    if (!this.preferences) {
      return [];
    }
    try {
      const weekStart = this.getWeekStartDate();
      const weekStartStr = this.getDateString(weekStart);

      // 检查是否是当前周的记录
      const weeklyRecordsWeek = await this.preferences.get('weeklyCheckInWeek', '') as string;
      if (weeklyRecordsWeek !== weekStartStr) {
        // 不是当前周，返回空
        return [];
      }

      const weeklyRecordsStr = await this.preferences.get('weeklyCheckInRecords', '') as string;
      if (!weeklyRecordsStr) {
        return [];
      }

      const records = weeklyRecordsStr.split(',');
      const checkedDays: number[] = [];

      records.forEach((dateStr: string) => {
        const date = new Date(dateStr);
        let dayOfWeek = date.getDay(); // 0=周日, 1=周一, ..., 6=周六
        // 转换为 1=周一, 7=周日
        dayOfWeek = dayOfWeek === 0 ? 7 : dayOfWeek;
        if (!checkedDays.includes(dayOfWeek)) {
          checkedDays.push(dayOfWeek);
        }
      });

      return checkedDays;
    } catch (error) {
      Logger.error('[UserService] Get weekly check-in days failed', error as Error);
      return [];
    }
  }

  /**
   * 获取周计划学习天数
   * @returns 学习天数数组，如 [1,2,3,4,5] 表示周一到周五
   */
  async getWeeklyPlanDays(): Promise<number[]> {
    if (!this.preferences) {
      return [1, 2, 3, 4, 5, 6, 7];
    }
    try {
      const daysStr = await this.preferences.get('weeklyPlanDays', '1,2,3,4,5,6,7') as string;
      const days = daysStr.split(',').map((d: string) => parseInt(d)).filter((d: number) => !isNaN(d));
      return days.length > 0 ? days : [1, 2, 3, 4, 5, 6, 7];
    } catch (error) {
      Logger.error('[UserService] Get weekly plan days failed', error as Error);
      return [1, 2, 3, 4, 5, 6, 7];
    }
  }

  /**
   * 保存周计划学习天数
   */
  async saveWeeklyPlanDays(days: number[]): Promise<boolean> {
    if (!this.preferences) {
      return false;
    }
    try {
      const daysStr = days.join(',');
      await this.preferences.put('weeklyPlanDays', daysStr);
      await this.preferences.flush();
      Logger.info('[UserService] Weekly plan days saved');
      return true;
    } catch (error) {
      Logger.error('[UserService] Save weekly plan days failed', error as Error);
      return false;
    }
  }

  /**
   * 判断某天是否在周计划中
   */
  isDayInPlan(dayIndex: number, planDays: number[]): boolean {
    return planDays.includes(dayIndex);
  }

  /**
   * 获取"答题后显示答案"设置
   */
  async getShowAnswerImmediately(): Promise<boolean> {
    if (!this.preferences) {
      return true;
    }
    try {
      const show = await this.preferences.get('showAnswerImmediately', true) as boolean;
      return show;
    } catch (error) {
      Logger.error('[UserService] Get showAnswerImmediately failed', error as Error);
      return true;
    }
  }

  /**
   * 保存"答题后显示答案"设置
   */
  async saveShowAnswerImmediately(show: boolean): Promise<boolean> {
    if (!this.preferences) {
      return false;
    }
    try {
      await this.preferences.put('showAnswerImmediately', show);
      await this.preferences.flush();
      Logger.info(`[UserService] showAnswerImmediately saved: ${show}`);
      return true;
    } catch (error) {
      Logger.error('[UserService] Save showAnswerImmediately failed', error as Error);
      return false;
    }
  }

  /**
   * 检查是否已完成入门测试
   */
  async hasCompletedEntryTest(): Promise<boolean> {
    if (!this.preferences) {
      return false;
    }
    try {
      const completed = await this.preferences.get('hasCompletedEntryTest', false) as boolean;
      return completed;
    } catch (error) {
      Logger.error('[UserService] Check entry test status failed', error as Error);
      return false;
    }
  }

  /**
   * 标记入门测试已完成
   */
  async markEntryTestCompleted(): Promise<boolean> {
    if (!this.preferences) {
      return false;
    }
    try {
      await this.preferences.put('hasCompletedEntryTest', true);
      await this.preferences.flush();
      Logger.info('[UserService] Entry test marked as completed');
      return true;
    } catch (error) {
      Logger.error('[UserService] Mark entry test completed failed', error as Error);
      return false;
    }
  }

  /**
   * 保存入门测试结果
   */
  async saveEntryTestResult(score: number, accuracy: number, level: string): Promise<boolean> {
    if (!this.preferences) {
      return false;
    }
    try {
      await this.preferences.put('entryTestScore', score);
      await this.preferences.put('entryTestAccuracy', accuracy);
      await this.preferences.put('entryTestLevel', level);
      await this.preferences.put('entryTestDate', Date.now());
      await this.preferences.flush();
      Logger.info(`[UserService] Entry test result saved: score=${score}, accuracy=${accuracy}, level=${level}`);
      return true;
    } catch (error) {
      Logger.error('[UserService] Save entry test result failed', error as Error);
      return false;
    }
  }

  /**
   * 获取入门测试结果
   */
  async getEntryTestResult(): Promise<EntryTestResult | null> {
    if (!this.preferences) {
      return null;
    }
    try {
      const hasCompleted = await this.preferences.get('hasCompletedEntryTest', false) as boolean;
      if (!hasCompleted) {
        return null;
      }
      const score = await this.preferences.get('entryTestScore', 0) as number;
      const accuracy = await this.preferences.get('entryTestAccuracy', 0) as number;
      const level = await this.preferences.get('entryTestLevel', '') as string;
      const date = await this.preferences.get('entryTestDate', 0) as number;
      const result: EntryTestResult = { score, accuracy, level, date };
      return result;
    } catch (error) {
      Logger.error('[UserService] Get entry test result failed', error as Error);
      return null;
    }
  }
}

export const userService = UserService.getInstance();
