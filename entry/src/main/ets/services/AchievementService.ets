/**
 * 成就系统服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { preferences } from '@kit.ArkData';
import { databaseService } from '../data/database/DatabaseService';
import { answerRecordService } from './AnswerRecordService';
import { mockExamService } from './MockExamService';
import { Logger } from '../common/utils/Logger';
import { achievementNotificationService } from './AchievementNotificationService';

// 成就定义
export interface Achievement {
  id: string;
  name: string;
  description: string;
  icon: string;
  category: string;
  condition: string;
  targetValue: number;
  isUnlocked: boolean;
  unlockTime: number;
  progress: number;
}

// 成就类别
export const ACHIEVEMENT_CATEGORIES: string[] = ['学习', '考试', '坚持', '挑战'];

// 成就定义列表
const ACHIEVEMENT_DEFINITIONS: Achievement[] = [
  // 学习类
  { id: 'first_question', name: '初出茅庐', description: '完成第一道题目', icon: '🌱', category: '学习', condition: 'questions', targetValue: 1, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'questions_10', name: '小试牛刀', description: '累计完成10道题目', icon: '📝', category: '学习', condition: 'questions', targetValue: 10, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'questions_50', name: '勤学苦练', description: '累计完成50道题目', icon: '📚', category: '学习', condition: 'questions', targetValue: 50, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'questions_100', name: '百题斩', description: '累计完成100道题目', icon: '💯', category: '学习', condition: 'questions', targetValue: 100, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'questions_500', name: '题海战术', description: '累计完成500道题目', icon: '🏆', category: '学习', condition: 'questions', targetValue: 500, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'questions_1000', name: '千题大师', description: '累计完成1000道题目', icon: '👑', category: '学习', condition: 'questions', targetValue: 1000, isUnlocked: false, unlockTime: 0, progress: 0 },
  
  // 考试类
  { id: 'first_exam', name: '初次模考', description: '完成第一次模拟考试', icon: '📋', category: '考试', condition: 'exams', targetValue: 1, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'exam_pass', name: '首战告捷', description: '模拟考试首次及格', icon: '✅', category: '考试', condition: 'exam_pass', targetValue: 1, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'exam_90', name: '优秀学员', description: '模拟考试得分90分以上', icon: '🌟', category: '考试', condition: 'exam_score', targetValue: 90, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'exam_100', name: '满分达人', description: '模拟考试获得满分', icon: '💎', category: '考试', condition: 'exam_score', targetValue: 100, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'exams_5', name: '考试达人', description: '累计完成5次模拟考试', icon: '🎯', category: '考试', condition: 'exams', targetValue: 5, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'exams_10', name: '身经百战', description: '累计完成10次模拟考试', icon: '⚔️', category: '考试', condition: 'exams', targetValue: 10, isUnlocked: false, unlockTime: 0, progress: 0 },
  
  // 坚持类
  { id: 'streak_3', name: '三天打鱼', description: '连续学习3天', icon: '🔥', category: '坚持', condition: 'streak', targetValue: 3, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'streak_7', name: '一周坚持', description: '连续学习7天', icon: '💪', category: '坚持', condition: 'streak', targetValue: 7, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'streak_30', name: '月度之星', description: '连续学习30天', icon: '🌙', category: '坚持', condition: 'streak', targetValue: 30, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'study_days_7', name: '学习新手', description: '累计学习7天', icon: '📅', category: '坚持', condition: 'study_days', targetValue: 7, isUnlocked: false, unlockTime: 0, progress: 0 },
  
  // 挑战类
  { id: 'accuracy_80', name: '准确射手', description: '总正确率达到80%', icon: '🎯', category: '挑战', condition: 'accuracy', targetValue: 80, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'accuracy_90', name: '神枪手', description: '总正确率达到90%', icon: '🏹', category: '挑战', condition: 'accuracy', targetValue: 90, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'wrong_master_10', name: '错题克星', description: '掌握10道错题', icon: '✨', category: '挑战', condition: 'mastered', targetValue: 10, isUnlocked: false, unlockTime: 0, progress: 0 },
  { id: 'wrong_master_50', name: '错题终结者', description: '掌握50道错题', icon: '🔮', category: '挑战', condition: 'mastered', targetValue: 50, isUnlocked: false, unlockTime: 0, progress: 0 }
];

class AchievementService {
  private store: preferences.Preferences | null = null;
  private readonly STORE_NAME = 'achievements';

  async init(context: Context): Promise<void> {
    try {
      this.store = await preferences.getPreferences(context, this.STORE_NAME);
    } catch (error) {
      Logger.error('[AchievementService] Init failed', error as Error);
    }
  }

  // 获取所有成就及其状态
  async getAllAchievements(): Promise<Achievement[]> {
    const achievements: Achievement[] = [];
    
    for (const def of ACHIEVEMENT_DEFINITIONS) {
      const achievement: Achievement = {
        id: def.id,
        name: def.name,
        description: def.description,
        icon: def.icon,
        category: def.category,
        condition: def.condition,
        targetValue: def.targetValue,
        isUnlocked: await this.isUnlocked(def.id),
        unlockTime: await this.getUnlockTime(def.id),
        progress: await this.getProgress(def)
      };
      achievements.push(achievement);
    }
    
    return achievements;
  }

  // 检查并解锁成就，返回新解锁的成就
  async checkAndUnlock(): Promise<Achievement[]> {
    const newlyUnlocked: Achievement[] = [];
    
    for (const def of ACHIEVEMENT_DEFINITIONS) {
      if (await this.isUnlocked(def.id)) continue;
      
      const progress = await this.getProgress(def);
      if (progress >= def.targetValue) {
        await this.unlock(def.id);
        const achievement: Achievement = {
          id: def.id,
          name: def.name,
          description: def.description,
          icon: def.icon,
          category: def.category,
          condition: def.condition,
          targetValue: def.targetValue,
          isUnlocked: true,
          unlockTime: Date.now(),
          progress: progress
        };
        newlyUnlocked.push(achievement);
      }
    }
    
    return newlyUnlocked;
  }

  /**
   * 检查成就并自动通知（用于实时触发）
   * 在答题、考试完成等关键时刻调用
   */
  async checkAndNotify(): Promise<void> {
    try {
      const newlyUnlocked = await this.checkAndUnlock();
      for (const achievement of newlyUnlocked) {
        achievementNotificationService.notify(achievement);
        Logger.info(`[AchievementService] Achievement unlocked: ${achievement.name}`);
      }
    } catch (error) {
      Logger.error('[AchievementService] Failed to check and notify', error as Error);
    }
  }

  private async getProgress(def: Achievement): Promise<number> {
    try {
      switch (def.condition) {
        case 'questions':
          return await this.getCompletedQuestionCount();
        case 'exams':
          return await this.getExamCount();
        case 'exam_pass':
          return await this.getPassedExamCount();
        case 'exam_score':
          return await this.getHighestExamScore();
        case 'streak':
          return await this.getCurrentStreak();
        case 'study_days':
          return await this.getStudyDays();
        case 'accuracy':
          return await this.getOverallAccuracy();
        case 'mastered':
          return await this.getMasteredCount();
        default:
          return 0;
      }
    } catch (error) {
      return 0;
    }
  }

  private async getCompletedQuestionCount(): Promise<number> {
    try {
      const store = databaseService.getStore();
      const resultSet = await store.querySql(
        'SELECT COUNT(DISTINCT question_id) as count FROM answer_records'
      );
      if (resultSet.goToFirstRow()) {
        const count = resultSet.getLong(resultSet.getColumnIndex('count'));
        resultSet.close();
        return count;
      }
      resultSet.close();
      return 0;
    } catch (error) {
      return 0;
    }
  }

  private async getExamCount(): Promise<number> {
    try {
      const records = await mockExamService.getExamHistory(100);
      return records.length;
    } catch (error) {
      return 0;
    }
  }

  private async getPassedExamCount(): Promise<number> {
    try {
      const records = await mockExamService.getExamHistory(100);
      return records.filter(r => r.isPassed).length;
    } catch (error) {
      return 0;
    }
  }

  private async getHighestExamScore(): Promise<number> {
    try {
      const records = await mockExamService.getExamHistory(100);
      if (records.length === 0) return 0;
      return Math.max(...records.map(r => r.score));
    } catch (error) {
      return 0;
    }
  }

  private async getCurrentStreak(): Promise<number> {
    try {
      const stats = await answerRecordService.getTodayStatistics();
      return stats.streak || 0;
    } catch (error) {
      return 0;
    }
  }

  private async getStudyDays(): Promise<number> {
    try {
      const store = databaseService.getStore();
      const resultSet = await store.querySql(
        "SELECT COUNT(DISTINCT date(create_time/1000, 'unixepoch', 'localtime')) as days FROM answer_records"
      );
      if (resultSet.goToFirstRow()) {
        const days = resultSet.getLong(resultSet.getColumnIndex('days'));
        resultSet.close();
        return days;
      }
      resultSet.close();
      return 0;
    } catch (error) {
      return 0;
    }
  }

  private async getOverallAccuracy(): Promise<number> {
    try {
      const stats = await answerRecordService.getTodayStatistics();
      return Math.round(stats.accuracy);
    } catch (error) {
      return 0;
    }
  }

  private async getMasteredCount(): Promise<number> {
    try {
      const store = databaseService.getStore();
      const resultSet = await store.querySql(
        'SELECT COUNT(*) as count FROM wrong_questions WHERE is_mastered = 1'
      );
      if (resultSet.goToFirstRow()) {
        const count = resultSet.getLong(resultSet.getColumnIndex('count'));
        resultSet.close();
        return count;
      }
      resultSet.close();
      return 0;
    } catch (error) {
      return 0;
    }
  }

  private async isUnlocked(achievementId: string): Promise<boolean> {
    if (!this.store) return false;
    try {
      return await this.store.get(`unlocked_${achievementId}`, false) as boolean;
    } catch (error) {
      return false;
    }
  }

  private async getUnlockTime(achievementId: string): Promise<number> {
    if (!this.store) return 0;
    try {
      return await this.store.get(`unlock_time_${achievementId}`, 0) as number;
    } catch (error) {
      return 0;
    }
  }

  private async unlock(achievementId: string): Promise<void> {
    if (!this.store) return;
    try {
      await this.store.put(`unlocked_${achievementId}`, true);
      await this.store.put(`unlock_time_${achievementId}`, Date.now());
      await this.store.flush();
    } catch (error) {
      Logger.error('[AchievementService] Unlock failed', error as Error);
    }
  }

  // 获取统计数据
  async getStats(): Promise<AchievementStats> {
    const total = ACHIEVEMENT_DEFINITIONS.length;
    let unlocked = 0;
    const categories = new Map<string, number>();

    for (const cat of ACHIEVEMENT_CATEGORIES) {
      categories.set(cat, 0);
    }

    for (const def of ACHIEVEMENT_DEFINITIONS) {
      if (await this.isUnlocked(def.id)) {
        unlocked++;
        const current = categories.get(def.category) || 0;
        categories.set(def.category, current + 1);
      }
    }

    const stats = new AchievementStats();
    stats.total = total;
    stats.unlocked = unlocked;
    stats.categories = categories;
    return stats;
  }
}

/**
 * 成就统计结果类
 */
export class AchievementStats {
  total: number = 0;
  unlocked: number = 0;
  categories: Map<string, number> = new Map();
}

export const achievementService = new AchievementService();
