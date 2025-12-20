/**
 * 错题统计服务
 * HydroQuiz - 水利工程检测员刷题宝
 * 提供错题统计分析数据
 */
import { relationalStore } from '@kit.ArkData';
import { databaseService } from '../data/database/DatabaseService';
import { questionService } from './QuestionService';
import { answerRecordService } from './AnswerRecordService';
import { WrongQuestion } from '../common/types/QuestionTypes';
import { Logger } from '../common/utils/Logger';
import { SUBJECT_LIST } from '../data/SubjectData';
import { SubjectInfo } from '../common/types/QuestionTypes';

/**
 * 科目错题分布
 */
export interface SubjectDistribution {
  subjectId: string;
  count: number;
}

/**
 * 题型错误分布
 */
export interface TypeDistribution {
  type: string;
  totalCount: number;
  wrongCount: number;
  wrongRate: number;
}

/**
 * 每日趋势数据
 */
export interface DayTrend {
  date: string;
  totalCount: number;
  wrongCount: number;
}

/**
 * 每日统计
 */
export interface DayStats {
  day: number;
  correctCount: number;
  wrongCount: number;
}

/**
 * 高频错题项
 */
export interface HighFreqWrongItem {
  questionId: string;
  content: string;
  subjectId: string;
  wrongCount: number;
  type: string;
}

/**
 * 错题统计数据
 */
export interface WrongStatisticsData {
  // 概览数据
  totalWrong: number;
  todayWrong: number;
  masteredCount: number;
  avgWrongRate: number;
  
  // 科目分布
  subjectDistribution: SubjectDistribution[];
  
  // 题型分布
  typeDistribution: TypeDistribution[];
  
  // 近7天趋势
  weekTrend: DayTrend[];
  
  // 本周每日统计
  weekStats: DayStats[];
  
  // 高频错题 Top 10
  highFreqWrong: HighFreqWrongItem[];
}

/**
 * 错题统计服务类
 */
class WrongStatisticsService {
  /**
   * 获取完整的统计数据
   */
  async getStatisticsData(): Promise<WrongStatisticsData> {
    try {
      // 等待数据库初始化完成
      const isReady = await databaseService.waitForReady(10000);
      if (!isReady) {
        Logger.warn('[WrongStatisticsService] Database not ready, returning empty data');
        return this.getEmptyData();
      }

      const totalWrong = await this.getTotalWrongCount();
      const todayWrong = await this.getTodayWrongCount();
      const masteredCount = await this.getMasteredCount();
      const avgWrongRate = await this.getAvgWrongRate();
      const subjectDistribution = await this.getSubjectDistribution();
      const typeDistribution = await this.getTypeDistribution();
      const weekTrend = await this.getWeekTrend();
      const weekStats = await this.getWeekStats();
      const highFreqWrong = await this.getHighFreqWrong();

      const result: WrongStatisticsData = {
        totalWrong: totalWrong,
        todayWrong: todayWrong,
        masteredCount: masteredCount,
        avgWrongRate: avgWrongRate,
        subjectDistribution: subjectDistribution,
        typeDistribution: typeDistribution,
        weekTrend: weekTrend,
        weekStats: weekStats,
        highFreqWrong: highFreqWrong
      };

      Logger.info(`[WrongStatisticsService] Statistics loaded: totalWrong=${totalWrong}`);
      return result;
    } catch (error) {
      Logger.error('[WrongStatisticsService] Failed to get statistics data', error as Error);
      return this.getEmptyData();
    }
  }

  /**
   * 获取空数据
   */
  private getEmptyData(): WrongStatisticsData {
    const emptyData: WrongStatisticsData = {
      totalWrong: 0,
      todayWrong: 0,
      masteredCount: 0,
      avgWrongRate: 0,
      subjectDistribution: [],
      typeDistribution: [],
      weekTrend: [],
      weekStats: [],
      highFreqWrong: []
    };
    return emptyData;
  }

  /**
   * 获取错题总数
   */
  private async getTotalWrongCount(): Promise<number> {
    try {
      const wrongQuestions = await answerRecordService.getWrongQuestions();
      return wrongQuestions.length;
    } catch (error) {
      Logger.error('[WrongStatisticsService] Failed to get total wrong count', error as Error);
      return 0;
    }
  }

  /**
   * 获取今日新增错题数
   */
  private async getTodayWrongCount(): Promise<number> {
    try {
      const todayWrong = await answerRecordService.getTodayWrongQuestions();
      return todayWrong.length;
    } catch (error) {
      Logger.error('[WrongStatisticsService] Failed to get today wrong count', error as Error);
      return 0;
    }
  }

  /**
   * 获取已掌握数量
   */
  private async getMasteredCount(): Promise<number> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('wrong_questions');
      predicates.equalTo('is_mastered', 1);

      const resultSet = await store.query(predicates);
      const count = resultSet.rowCount;
      resultSet.close();
      return count;
    } catch (error) {
      Logger.error('[WrongStatisticsService] Failed to get mastered count', error as Error);
      return 0;
    }
  }

  /**
   * 获取平均错误率
   */
  private async getAvgWrongRate(): Promise<number> {
    try {
      const stats = await answerRecordService.getTodayStatistics();
      if (stats.total > 0) {
        return Math.round((1 - stats.accuracy / 100) * 100);
      }
      return 0;
    } catch (error) {
      Logger.error('[WrongStatisticsService] Failed to get avg wrong rate', error as Error);
      return 0;
    }
  }

  /**
   * 获取科目错题分布
   */
  private async getSubjectDistribution(): Promise<SubjectDistribution[]> {
    try {
      const wrongQuestions = await answerRecordService.getWrongQuestions();
      const distribution: Map<string, number> = new Map();

      // 初始化所有科目
      SUBJECT_LIST.forEach((subject: SubjectInfo) => {
        distribution.set(subject.id, 0);
      });

      // 统计每个科目的错题数
      for (const wrong of wrongQuestions) {
        const question = await questionService.getQuestionById(wrong.questionId);
        if (question) {
          const current = distribution.get(question.subjectId) || 0;
          distribution.set(question.subjectId, current + 1);
        }
      }

      // 转换为数组
      const result: SubjectDistribution[] = [];
      distribution.forEach((count: number, subjectId: string) => {
        const item: SubjectDistribution = { subjectId, count };
        result.push(item);
      });

      return result;
    } catch (error) {
      Logger.error('[WrongStatisticsService] Failed to get subject distribution', error as Error);
      return [];
    }
  }

  /**
   * 获取题型错误分布
   */
  private async getTypeDistribution(): Promise<TypeDistribution[]> {
    try {
      const store = databaseService.getStore();
      const types = ['single', 'multiple', 'judge', 'case'];
      const result: TypeDistribution[] = [];

      for (const type of types) {
        // 获取该题型的总答题数
        const totalPredicates = new relationalStore.RdbPredicates('answer_records');
        const totalResultSet = await store.query(totalPredicates);
        
        let totalCount = 0;
        let wrongCount = 0;

        // 遍历答题记录，统计该题型的数据
        while (totalResultSet.goToNextRow()) {
          const questionId = totalResultSet.getString(totalResultSet.getColumnIndex('question_id'));
          const isCorrect = totalResultSet.getLong(totalResultSet.getColumnIndex('is_correct')) === 1;
          
          const question = await questionService.getQuestionById(questionId);
          if (question && question.type === type) {
            totalCount++;
            if (!isCorrect) {
              wrongCount++;
            }
          }
        }
        totalResultSet.close();

        const wrongRate = totalCount > 0 ? Math.round(wrongCount / totalCount * 100) : 0;
        const item: TypeDistribution = {
          type,
          totalCount,
          wrongCount,
          wrongRate
        };
        result.push(item);
      }

      return result;
    } catch (error) {
      Logger.error('[WrongStatisticsService] Failed to get type distribution', error as Error);
      return [];
    }
  }

  /**
   * 获取近7天趋势数据
   */
  private async getWeekTrend(): Promise<DayTrend[]> {
    try {
      const store = databaseService.getStore();
      const result: DayTrend[] = [];
      const now = new Date();

      for (let i = 6; i >= 0; i--) {
        const date = new Date(now);
        date.setDate(date.getDate() - i);
        date.setHours(0, 0, 0, 0);
        
        // 使用本地时间格式
        const dateStr = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')}`;
        const dayStart = date.getTime();
        const dayEnd = dayStart + 24 * 60 * 60 * 1000;

        // 查询当天的答题记录
        const predicates = new relationalStore.RdbPredicates('answer_records');
        predicates.greaterThanOrEqualTo('create_time', dayStart);
        predicates.lessThan('create_time', dayEnd);

        const resultSet = await store.query(predicates);
        let totalCount = 0;
        let wrongCount = 0;

        while (resultSet.goToNextRow()) {
          totalCount++;
          const isCorrect = resultSet.getLong(resultSet.getColumnIndex('is_correct')) === 1;
          if (!isCorrect) {
            wrongCount++;
          }
        }
        resultSet.close();

        const item: DayTrend = {
          date: dateStr,
          totalCount,
          wrongCount
        };
        result.push(item);
      }

      return result;
    } catch (error) {
      Logger.error('[WrongStatisticsService] Failed to get week trend', error as Error);
      return [];
    }
  }

  /**
   * 获取本周每日统计（周一到周日）
   */
  private async getWeekStats(): Promise<DayStats[]> {
    try {
      const store = databaseService.getStore();
      const result: DayStats[] = [];
      const now = new Date();
      
      // 获取本周一的日期
      const dayOfWeek = now.getDay();
      const mondayOffset = dayOfWeek === 0 ? -6 : 1 - dayOfWeek;
      const monday = new Date(now);
      monday.setDate(monday.getDate() + mondayOffset);
      monday.setHours(0, 0, 0, 0);

      for (let i = 0; i < 7; i++) {
        const date = new Date(monday);
        date.setDate(date.getDate() + i);
        
        const dayStart = date.getTime();
        const dayEnd = dayStart + 24 * 60 * 60 * 1000;

        // 查询当天的答题记录
        const predicates = new relationalStore.RdbPredicates('answer_records');
        predicates.greaterThanOrEqualTo('create_time', dayStart);
        predicates.lessThan('create_time', dayEnd);

        const resultSet = await store.query(predicates);
        let correctCount = 0;
        let wrongCount = 0;

        while (resultSet.goToNextRow()) {
          const isCorrect = resultSet.getLong(resultSet.getColumnIndex('is_correct')) === 1;
          if (isCorrect) {
            correctCount++;
          } else {
            wrongCount++;
          }
        }
        resultSet.close();

        const item: DayStats = {
          day: i + 1,
          correctCount,
          wrongCount
        };
        result.push(item);
      }

      return result;
    } catch (error) {
      Logger.error('[WrongStatisticsService] Failed to get week stats', error as Error);
      return [];
    }
  }

  /**
   * 获取高频错题 Top 10
   */
  private async getHighFreqWrong(): Promise<HighFreqWrongItem[]> {
    try {
      const wrongQuestions = await answerRecordService.getWrongQuestions();

      // 按错误次数排序，取前10
      const sorted = wrongQuestions
        .sort((a: WrongQuestion, b: WrongQuestion) => b.wrongCount - a.wrongCount)
        .slice(0, 10);

      const result: HighFreqWrongItem[] = [];

      for (const wrong of sorted) {
        const question = await questionService.getQuestionById(wrong.questionId);
        if (question) {
          const item: HighFreqWrongItem = {
            questionId: wrong.questionId,
            content: question.content,
            subjectId: question.subjectId,
            wrongCount: wrong.wrongCount,
            type: question.type
          };
          result.push(item);
        }
      }

      return result;
    } catch (error) {
      Logger.error('[WrongStatisticsService] Failed to get high freq wrong', error as Error);
      return [];
    }
  }
}

// 导出单例
export const wrongStatisticsService = new WrongStatisticsService();
