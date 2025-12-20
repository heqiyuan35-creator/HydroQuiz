/**
 * 题库服务
 * HydroQuiz - 水利工程检测员刷题宝
 * 统一管理科目信息和题目数量统计
 */
import { questionService } from './QuestionService';
import { AppConstants } from '../common/constants/AppConstants';
import { ThemeColors } from '../theme/ThemeColors';
import { Logger } from '../common/utils/Logger';

/**
 * 科目统计信息接口
 */
export interface SubjectStats {
  id: string;
  name: string;
  shortName: string;
  color: string;
  questionCount: number;
  description: string;
}

/**
 * 题库统计信息接口
 */
export interface QuestionBankStats {
  totalCount: number;
  subjects: SubjectStats[];
}

/**
 * 题库服务类
 */
class QuestionBankService {
  // 缓存科目统计数据
  private cachedStats: QuestionBankStats | null = null;
  private lastUpdateTime: number = 0;
  private readonly CACHE_DURATION = 60000; // 缓存1分钟

  /**
   * 科目基础配置
   */
  private readonly SUBJECT_CONFIG: SubjectStats[] = [
    {
      id: AppConstants.SUBJECT_BASIC,
      name: '基础知识',
      shortName: '基础',
      color: ThemeColors.SUBJECT_BASIC,
      questionCount: 0,
      description: '水利检测基础理论知识'
    },
    {
      id: AppConstants.SUBJECT_CONCRETE,
      name: '混凝土工程',
      shortName: '混凝土',
      color: ThemeColors.SUBJECT_CONCRETE,
      questionCount: 0,
      description: '混凝土工程检测技术'
    },
    {
      id: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      name: '岩土工程（岩石、土工）',
      shortName: '岩土',
      color: ThemeColors.SUBJECT_GEOTECHNICAL_ROCK,
      questionCount: 0,
      description: '岩石与土工检测技术'
    },
    {
      id: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      name: '岩土工程（地基与基础）',
      shortName: '地基',
      color: ThemeColors.SUBJECT_GEOTECHNICAL_FOUNDATION,
      questionCount: 0,
      description: '地基与基础检测技术'
    },
    {
      id: AppConstants.SUBJECT_MEASUREMENT,
      name: '量测',
      shortName: '量测',
      color: ThemeColors.SUBJECT_MEASUREMENT,
      questionCount: 0,
      description: '工程量测技术'
    },
    {
      id: AppConstants.SUBJECT_METAL,
      name: '金属结构',
      shortName: '金属',
      color: ThemeColors.SUBJECT_METAL,
      questionCount: 0,
      description: '金属结构检测技术'
    },
    {
      id: AppConstants.SUBJECT_MECHANICAL,
      name: '机械电气',
      shortName: '机电',
      color: ThemeColors.SUBJECT_MECHANICAL,
      questionCount: 0,
      description: '机械电气检测技术'
    }
  ];

  /**
   * 获取题库统计信息（带缓存）
   */
  async getQuestionBankStats(forceRefresh: boolean = false): Promise<QuestionBankStats> {
    const now = Date.now();

    // 检查缓存是否有效
    if (!forceRefresh && this.cachedStats && (now - this.lastUpdateTime) < this.CACHE_DURATION) {
      return this.cachedStats;
    }

    try {
      // 获取各科目题目数量
      const subjects: SubjectStats[] = [];
      let totalCount = 0;

      for (const config of this.SUBJECT_CONFIG) {
        const count = await questionService.getQuestionCount(config.id);
        const subject: SubjectStats = {
          id: config.id,
          name: config.name,
          shortName: config.shortName,
          color: config.color,
          questionCount: count,
          description: config.description
        };
        subjects.push(subject);
        totalCount += count;
      }

      // 更新缓存
      this.cachedStats = { totalCount, subjects };
      this.lastUpdateTime = now;

      return this.cachedStats;
    } catch (error) {
      Logger.error('[QuestionBankService] Failed to get stats', error as Error);
      // 返回默认值
      return {
        totalCount: 0,
        subjects: this.SUBJECT_CONFIG
      };
    }
  }

  /**
   * 获取单个科目的统计信息
   */
  async getSubjectStats(subjectId: string): Promise<SubjectStats | null> {
    const stats = await this.getQuestionBankStats();
    return stats.subjects.find((s: SubjectStats) => s.id === subjectId) || null;
  }

  /**
   * 获取科目题目数量
   */
  async getSubjectQuestionCount(subjectId: string): Promise<number> {
    const stats = await this.getSubjectStats(subjectId);
    return stats ? stats.questionCount : 0;
  }

  /**
   * 获取总题目数量
   */
  async getTotalQuestionCount(): Promise<number> {
    const stats = await this.getQuestionBankStats();
    return stats.totalCount;
  }

  /**
   * 获取所有科目列表（带题目数量）
   */
  async getSubjectList(): Promise<SubjectStats[]> {
    const stats = await this.getQuestionBankStats();
    return stats.subjects;
  }

  /**
   * 根据科目ID获取科目名称
   */
  getSubjectName(subjectId: string): string {
    const config = this.SUBJECT_CONFIG.find((c: SubjectStats) => c.id === subjectId);
    return config ? config.name : '未知科目';
  }

  /**
   * 根据科目ID获取科目短名称
   */
  getSubjectShortName(subjectId: string): string {
    const config = this.SUBJECT_CONFIG.find((c: SubjectStats) => c.id === subjectId);
    return config ? config.shortName : '未知';
  }

  /**
   * 根据科目ID获取科目颜色
   */
  getSubjectColor(subjectId: string): string {
    const config = this.SUBJECT_CONFIG.find((c: SubjectStats) => c.id === subjectId);
    return config ? config.color : ThemeColors.PRIMARY;
  }

  /**
   * 清除缓存（题目数据变化时调用）
   */
  clearCache(): void {
    this.cachedStats = null;
    this.lastUpdateTime = 0;
  }
}

// 导出单例
export const questionBankService = new QuestionBankService();
