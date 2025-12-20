/**
 * 智能推荐服务
 * HydroQuiz - 水利工程检测员刷题宝
 * 基于用户学习数据提供个性化推荐
 */
import { answerRecordService } from './AnswerRecordService';
import { questionBankService, SubjectStats } from './QuestionBankService';
import { WrongQuestion } from '../common/types/QuestionTypes';
import { Logger } from '../common/utils/Logger';

/**
 * 推荐类型
 */
export enum RecommendType {
  WEAK_POINT = 'weak_point',
  WRONG_REVIEW = 'wrong_review',
  NEW_LEARN = 'new_learn',
  DAILY_TASK = 'daily_task'
}

/**
 * 推荐卡片数据
 */
export interface RecommendCard {
  type: RecommendType;
  title: string;
  subtitle: string;
  icon: string;
  count: number;
  color: string;
  subjectId?: string;
  questionIds?: string[];
}

/**
 * 科目学习进度
 */
export interface SubjectProgress {
  subjectId: string;
  subjectName: string;
  shortName: string;
  color: string;
  totalCount: number;
  completedCount: number;
  correctCount: number;
  wrongCount: number;
  progress: number;
  accuracy: number;
  masteryLevel: string;
  masteryColor: string;
}

/**
 * 掌握程度结果
 */
interface MasteryResult {
  level: string;
  color: string;
}

/**
 * 学习建议
 */
export interface StudySuggestion {
  icon: string;
  title: string;
  description: string;
  action: string;
  priority: number;
}

/**
 * 智能推荐服务类
 */
class SmartRecommendService {
  private static instance: SmartRecommendService;

  private constructor() {}

  public static getInstance(): SmartRecommendService {
    if (!SmartRecommendService.instance) {
      SmartRecommendService.instance = new SmartRecommendService();
    }
    return SmartRecommendService.instance;
  }

  /**
   * 获取今日推荐卡片
   */
  async getTodayRecommendCards(): Promise<RecommendCard[]> {
    const cards: RecommendCard[] = [];

    try {
      // 1. 获取错题数量
      const wrongCount = await answerRecordService.getWrongQuestionCount();
      if (wrongCount > 0) {
        const wrongCard: RecommendCard = {
          type: RecommendType.WRONG_REVIEW,
          title: '错题回顾',
          subtitle: '巩固薄弱知识点',
          icon: '📕',
          count: Math.min(wrongCount, 20),
          color: '#FF6B6B'
        };
        cards.push(wrongCard);
      }

      // 2. 分析薄弱科目
      const weakSubject = await this.getWeakestSubject();
      if (weakSubject) {
        const weakCard: RecommendCard = {
          type: RecommendType.WEAK_POINT,
          title: '薄弱攻克',
          subtitle: weakSubject.subjectName,
          icon: '🎯',
          count: 15,
          color: '#FFB347',
          subjectId: weakSubject.subjectId
        };
        cards.push(weakCard);
      }

      // 3. 新题学习推荐
      const todayStats = await answerRecordService.getTodayStatistics();
      const remainingGoal = Math.max(0, 50 - todayStats.total);
      if (remainingGoal > 0) {
        const newCard: RecommendCard = {
          type: RecommendType.NEW_LEARN,
          title: '继续学习',
          subtitle: `距今日目标还差 ${remainingGoal} 题`,
          icon: '📚',
          count: Math.min(remainingGoal, 30),
          color: '#4ECDC4'
        };
        cards.push(newCard);
      }

      // 如果没有任何推荐，添加默认推荐
      if (cards.length === 0) {
        const defaultCard: RecommendCard = {
          type: RecommendType.DAILY_TASK,
          title: '开始学习',
          subtitle: '每天进步一点点',
          icon: '🚀',
          count: 20,
          color: '#667eea'
        };
        cards.push(defaultCard);
      }

    } catch (error) {
      Logger.error('[SmartRecommendService] Failed to get recommend cards', error as Error);
    }

    return cards;
  }

  /**
   * 获取最薄弱的科目
   */
  async getWeakestSubject(): Promise<SubjectProgress | null> {
    try {
      const progressList = await this.getAllSubjectProgress();
      
      // 筛选出有做过题目但正确率较低的科目
      const weakSubjects = progressList.filter((p: SubjectProgress) => 
        p.completedCount > 0 && p.accuracy < 70
      );

      if (weakSubjects.length === 0) {
        // 如果没有薄弱科目，返回进度最低的科目
        const lowProgress = progressList.filter((p: SubjectProgress) => p.progress < 50);
        if (lowProgress.length > 0) {
          lowProgress.sort((a: SubjectProgress, b: SubjectProgress) => a.progress - b.progress);
          return lowProgress[0];
        }
        return null;
      }

      // 按正确率排序，返回最低的
      weakSubjects.sort((a: SubjectProgress, b: SubjectProgress) => a.accuracy - b.accuracy);
      return weakSubjects[0];
    } catch (error) {
      Logger.error('[SmartRecommendService] Failed to get weakest subject', error as Error);
      return null;
    }
  }

  /**
   * 获取所有科目的学习进度
   */
  async getAllSubjectProgress(): Promise<SubjectProgress[]> {
    const progressList: SubjectProgress[] = [];

    try {
      const stats = await questionBankService.getQuestionBankStats();
      
      for (const subject of stats.subjects) {
        const progress = await this.getSubjectProgress(subject);
        progressList.push(progress);
      }
    } catch (error) {
      Logger.error('[SmartRecommendService] Failed to get all subject progress', error as Error);
    }

    return progressList;
  }

  /**
   * 获取单个科目的学习进度
   */
  async getSubjectProgress(subject: SubjectStats): Promise<SubjectProgress> {
    try {
      // 获取该科目的错题数（简化处理）
      const wrongQuestions = await answerRecordService.getWrongQuestions();
      let wrongCount = 0;
      
      // 简化：按比例估算该科目的错题数
      const stats = await questionBankService.getQuestionBankStats();
      const totalQuestions = stats.totalCount;
      if (totalQuestions > 0 && subject.questionCount > 0) {
        const ratio = subject.questionCount / totalQuestions;
        wrongCount = Math.round(wrongQuestions.length * ratio);
      }

      // 估算完成数量
      const completedCount = await this.getSubjectCompletedCount(subject.id);
      const correctCount = Math.max(0, completedCount - wrongCount);

      // 计算进度和正确率
      const progress = subject.questionCount > 0 
        ? Math.round((completedCount / subject.questionCount) * 100) 
        : 0;
      const accuracy = completedCount > 0 
        ? Math.round((correctCount / completedCount) * 100) 
        : 0;

      // 计算掌握程度
      const mastery = this.calculateMasteryLevel(progress, accuracy);

      const result: SubjectProgress = {
        subjectId: subject.id,
        subjectName: subject.name,
        shortName: subject.shortName,
        color: subject.color,
        totalCount: subject.questionCount,
        completedCount: completedCount,
        correctCount: correctCount,
        wrongCount: wrongCount,
        progress: Math.min(progress, 100),
        accuracy: accuracy,
        masteryLevel: mastery.level,
        masteryColor: mastery.color
      };

      return result;
    } catch (error) {
      Logger.error('[SmartRecommendService] Failed to get subject progress', error as Error);
      const defaultResult: SubjectProgress = {
        subjectId: subject.id,
        subjectName: subject.name,
        shortName: subject.shortName,
        color: subject.color,
        totalCount: subject.questionCount,
        completedCount: 0,
        correctCount: 0,
        wrongCount: 0,
        progress: 0,
        accuracy: 0,
        masteryLevel: '未开始',
        masteryColor: '#999999'
      };
      return defaultResult;
    }
  }

  /**
   * 获取科目已完成题目数（去重）
   */
  private async getSubjectCompletedCount(subjectId: string): Promise<number> {
    try {
      const totalCompleted = await answerRecordService.getCompletedQuestionCount();
      const stats = await questionBankService.getQuestionBankStats();
      const totalQuestions = stats.totalCount;
      
      if (totalQuestions === 0) return 0;
      
      const subjectStats = stats.subjects.find((s: SubjectStats) => s.id === subjectId);
      if (!subjectStats) return 0;

      // 按比例估算
      const ratio = subjectStats.questionCount / totalQuestions;
      return Math.round(totalCompleted * ratio);
    } catch (error) {
      return 0;
    }
  }

  /**
   * 计算掌握程度
   */
  private calculateMasteryLevel(progress: number, accuracy: number): MasteryResult {
    if (progress === 0) {
      const result: MasteryResult = { level: '未开始', color: '#999999' };
      return result;
    }
    
    // 综合评分 = 进度 * 0.4 + 正确率 * 0.6
    const score = progress * 0.4 + accuracy * 0.6;

    if (score >= 90) {
      const result: MasteryResult = { level: '精通', color: '#52C41A' };
      return result;
    } else if (score >= 75) {
      const result: MasteryResult = { level: '掌握', color: '#1890FF' };
      return result;
    } else if (score >= 60) {
      const result: MasteryResult = { level: '熟悉', color: '#FAAD14' };
      return result;
    } else if (score >= 30) {
      const result: MasteryResult = { level: '入门', color: '#FF7A45' };
      return result;
    } else {
      const result: MasteryResult = { level: '学习中', color: '#FF4D4F' };
      return result;
    }
  }

  /**
   * 获取学习建议
   */
  async getStudySuggestions(): Promise<StudySuggestion[]> {
    const suggestions: StudySuggestion[] = [];

    try {
      const todayStats = await answerRecordService.getTodayStatistics();
      const wrongCount = await answerRecordService.getWrongQuestionCount();
      const weakSubject = await this.getWeakestSubject();

      // 根据今日学习情况给出建议
      if (todayStats.total === 0) {
        const suggestion: StudySuggestion = {
          icon: '🌅',
          title: '开始今日学习',
          description: '新的一天，从刷题开始！建议先完成20道基础题热身。',
          action: 'start_practice',
          priority: 1
        };
        suggestions.push(suggestion);
      } else if (todayStats.total < 30) {
        const suggestion: StudySuggestion = {
          icon: '💪',
          title: '继续加油',
          description: `今日已完成 ${todayStats.total} 题，再做 ${30 - todayStats.total} 题达到基础目标！`,
          action: 'continue_practice',
          priority: 1
        };
        suggestions.push(suggestion);
      }

      // 错题建议
      if (wrongCount > 10) {
        const suggestion: StudySuggestion = {
          icon: '📕',
          title: '错题需要复习',
          description: `你有 ${wrongCount} 道错题待复习，建议每天复习10道巩固记忆。`,
          action: 'review_wrong',
          priority: 2
        };
        suggestions.push(suggestion);
      }

      // 薄弱科目建议
      if (weakSubject && weakSubject.accuracy < 60) {
        const suggestion: StudySuggestion = {
          icon: '🎯',
          title: `${weakSubject.shortName}需要加强`,
          description: `该科目正确率仅 ${weakSubject.accuracy}%，建议重点突破。`,
          action: 'focus_weak',
          priority: 3
        };
        suggestions.push(suggestion);
      }

      // 正确率建议
      if (todayStats.total > 10 && todayStats.accuracy < 70) {
        const suggestion: StudySuggestion = {
          icon: '📖',
          title: '建议先看知识点',
          description: '今日正确率较低，建议先学习相关知识点再做题。',
          action: 'learn_knowledge',
          priority: 2
        };
        suggestions.push(suggestion);
      }

    } catch (error) {
      Logger.error('[SmartRecommendService] Failed to get suggestions', error as Error);
    }

    // 按优先级排序
    suggestions.sort((a: StudySuggestion, b: StudySuggestion) => a.priority - b.priority);
    return suggestions;
  }
}

export const smartRecommendService = SmartRecommendService.getInstance();
