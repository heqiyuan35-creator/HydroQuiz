/**
 * 答题记录服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { relationalStore } from '@kit.ArkData';
import { databaseService } from '../data/database/DatabaseService';
import { AnswerRecord, WrongQuestion, FavoriteQuestion, Question } from '../common/types/QuestionTypes';
import { Logger } from '../common/utils/Logger';
import { widgetDataService } from './WidgetDataService';
import { achievementService } from './AchievementService';
import { questionService } from './QuestionService';

/**
 * 生成唯一ID
 */
function generateId(): string {
  return Date.now().toString(36) + Math.random().toString(36).substring(2);
}

/**
 * 科目错题统计
 */
export interface SubjectWrongStat {
  subjectId: string;
  wrongCount: number;
}

/**
 * 考试记录类型
 */
export interface ExamRecord {
  id: string;
  examType: string;
  subjectId: string;
  totalCount: number;
  correctCount: number;
  score: number;
  duration: number;
  createTime: number;
}

/**
 * 答题记录输入参数
 */
export interface AnswerRecordInput {
  questionId: string;
  userAnswer: string;
  isCorrect: boolean;
  answerTime: number;
  createTime: number;
}

/**
 * 考试记录输入参数
 */
export interface ExamRecordInput {
  examType: string;
  subjectId: string;
  totalCount: number;
  correctCount: number;
  score: number;
  duration: number;
  questionIds: string;
  answers: string;
}

/**
 * 今日统计结果
 */
export interface TodayStatistics {
  total: number;
  correct: number;
  accuracy: number;
  streak: number;
}


/**
 * 答题记录服务类
 */
class AnswerRecordService {
  /**
   * 保存答题记录
   */
  async saveAnswerRecord(record: AnswerRecordInput): Promise<string> {
    try {
      const store = databaseService.getStore();
      const id = generateId();

      const valueBucket: relationalStore.ValuesBucket = {
        id: id,
        question_id: record.questionId,
        user_answer: record.userAnswer,
        is_correct: record.isCorrect ? 1 : 0,
        answer_time: record.answerTime,
        create_time: record.createTime
      };

      await store.insert('answer_records', valueBucket);

      // 如果答错，添加到错题本
      if (!record.isCorrect) {
        await this.addToWrongBook(record.questionId);
      }

      // 更新今日统计
      await this.updateTodayStatistics(record.isCorrect);

      // 检查成就解锁
      achievementService.checkAndNotify();

      Logger.info(`[AnswerRecordService] Saved answer record: ${id}`);
      return id;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to save answer record', error as Error);
      throw new Error('Failed to save answer record');
    }
  }

  /**
   * 获取题目的答题记录
   */
  async getRecordsByQuestionId(questionId: string): Promise<AnswerRecord[]> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('answer_records');
      predicates.equalTo('question_id', questionId);
      predicates.orderByDesc('create_time');

      const resultSet = await store.query(predicates);
      const records: AnswerRecord[] = [];

      while (resultSet.goToNextRow()) {
        const record: AnswerRecord = {
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          questionId: resultSet.getString(resultSet.getColumnIndex('question_id')),
          userAnswer: resultSet.getString(resultSet.getColumnIndex('user_answer')),
          isCorrect: resultSet.getLong(resultSet.getColumnIndex('is_correct')) === 1,
          answerTime: resultSet.getLong(resultSet.getColumnIndex('answer_time')),
          createTime: resultSet.getLong(resultSet.getColumnIndex('create_time'))
        };
        records.push(record);
      }

      resultSet.close();
      return records;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get records', error as Error);
      return [];
    }
  }

  /**
   * 获取今日答题统计
   */
  async getTodayStatistics(): Promise<TodayStatistics> {
    try {
      const store = databaseService.getStore();
      // 使用本地时间，格式：YYYY-MM-DD
      const now = new Date();
      const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

      const predicates = new relationalStore.RdbPredicates('study_statistics');
      predicates.equalTo('date', today);

      const resultSet = await store.query(predicates);

      if (resultSet.goToNextRow()) {
        const total = resultSet.getLong(resultSet.getColumnIndex('question_count'));
        const correct = resultSet.getLong(resultSet.getColumnIndex('correct_count'));
        resultSet.close();

        // 计算连续学习天数
        const streak = await this.calculateStreak();

        const result: TodayStatistics = {
          total: total,
          correct: correct,
          accuracy: total > 0 ? Math.round((correct / total) * 100) : 0,
          streak: streak
        };
        return result;
      }

      resultSet.close();
      const emptyResult: TodayStatistics = { total: 0, correct: 0, accuracy: 0, streak: 0 };
      return emptyResult;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get today statistics', error as Error);
      const errorResult: TodayStatistics = { total: 0, correct: 0, accuracy: 0, streak: 0 };
      return errorResult;
    }
  }

  /**
   * 计算连续学习天数
   */
  private async calculateStreak(): Promise<number> {
    try {
      const store = databaseService.getStore();
      const resultSet = await store.querySql(
        "SELECT DISTINCT date FROM study_statistics WHERE question_count > 0 ORDER BY date DESC LIMIT 100"
      );

      let streak = 0;
      let expectedDate = new Date();

      while (resultSet.goToNextRow()) {
        const dateStr = resultSet.getString(resultSet.getColumnIndex('date'));
        // 使用本地时间格式比较
        const expected = `${expectedDate.getFullYear()}-${String(expectedDate.getMonth() + 1).padStart(2, '0')}-${String(expectedDate.getDate()).padStart(2, '0')}`;

        if (dateStr === expected) {
          streak++;
          expectedDate.setDate(expectedDate.getDate() - 1);
        } else {
          break;
        }
      }

      resultSet.close();
      return streak;
    } catch (error) {
      return 0;
    }
  }


  /**
   * 更新今日统计
   */
  private async updateTodayStatistics(isCorrect: boolean): Promise<void> {
    try {
      const store = databaseService.getStore();
      // 使用本地时间，格式：YYYY-MM-DD
      const now = new Date();
      const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;
      const id = `stat_${today}`;

      const predicates = new relationalStore.RdbPredicates('study_statistics');
      predicates.equalTo('date', today);
      const resultSet = await store.query(predicates);

      if (resultSet.goToNextRow()) {
        const currentTotal = resultSet.getLong(resultSet.getColumnIndex('question_count'));
        const currentCorrect = resultSet.getLong(resultSet.getColumnIndex('correct_count'));
        resultSet.close();

        const updatePredicates = new relationalStore.RdbPredicates('study_statistics');
        updatePredicates.equalTo('date', today);

        const valueBucket: relationalStore.ValuesBucket = {
          question_count: currentTotal + 1,
          correct_count: isCorrect ? currentCorrect + 1 : currentCorrect
        };

        await store.update(valueBucket, updatePredicates);
      } else {
        resultSet.close();
        const valueBucket: relationalStore.ValuesBucket = {
          id: id,
          date: today,
          study_time: 0,
          question_count: 1,
          correct_count: isCorrect ? 1 : 0
        };

        await store.insert('study_statistics', valueBucket);
      }

      // 同步数据到卡片
      await widgetDataService.updateTodayStats(isCorrect ? 1 : 0, isCorrect ? 0 : 1);
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to update today statistics', error as Error);
    }
  }

  // ========== 错题本相关 ==========

  /**
   * 添加到错题本
   */
  async addToWrongBook(questionId: string): Promise<void> {
    try {
      const store = databaseService.getStore();

      const predicates = new relationalStore.RdbPredicates('wrong_questions');
      predicates.equalTo('question_id', questionId);
      const resultSet = await store.query(predicates);

      if (resultSet.goToNextRow()) {
        const currentCount = resultSet.getLong(resultSet.getColumnIndex('wrong_count'));
        resultSet.close();

        const updatePredicates = new relationalStore.RdbPredicates('wrong_questions');
        updatePredicates.equalTo('question_id', questionId);

        const valueBucket: relationalStore.ValuesBucket = {
          wrong_count: currentCount + 1,
          last_wrong_time: Date.now(),
          is_mastered: 0
        };

        await store.update(valueBucket, updatePredicates);
      } else {
        resultSet.close();
        const valueBucket: relationalStore.ValuesBucket = {
          id: generateId(),
          question_id: questionId,
          wrong_count: 1,
          last_wrong_time: Date.now(),
          is_mastered: 0
        };

        await store.insert('wrong_questions', valueBucket);
      }

      Logger.info(`[AnswerRecordService] Added to wrong book: ${questionId}`);
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to add to wrong book', error as Error);
    }
  }

  /**
   * 获取错题列表
   */
  async getWrongQuestions(limit?: number): Promise<WrongQuestion[]> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('wrong_questions');
      predicates.equalTo('is_mastered', 0);
      predicates.orderByDesc('last_wrong_time');

      if (limit) {
        predicates.limitAs(limit);
      }

      const resultSet = await store.query(predicates);
      const wrongQuestions: WrongQuestion[] = [];

      while (resultSet.goToNextRow()) {
        let noteValue = '';
        try {
          const noteIndex = resultSet.getColumnIndex('note');
          if (noteIndex >= 0) {
            noteValue = resultSet.getString(noteIndex) || '';
          }
        } catch (e) {
          // note 字段可能不存在（旧版本数据库）
        }

        const wq: WrongQuestion = {
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          questionId: resultSet.getString(resultSet.getColumnIndex('question_id')),
          wrongCount: resultSet.getLong(resultSet.getColumnIndex('wrong_count')),
          lastWrongTime: resultSet.getLong(resultSet.getColumnIndex('last_wrong_time')),
          isMastered: resultSet.getLong(resultSet.getColumnIndex('is_mastered')) === 1,
          note: noteValue
        };
        wrongQuestions.push(wq);
      }

      resultSet.close();
      return wrongQuestions;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get wrong questions', error as Error);
      return [];
    }
  }

  /**
   * 获取错题数量
   */
  async getWrongQuestionCount(): Promise<number> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('wrong_questions');
      predicates.equalTo('is_mastered', 0);

      const resultSet = await store.query(predicates);
      const count = resultSet.rowCount;
      resultSet.close();
      return count;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get wrong question count', error as Error);
      return 0;
    }
  }

  /**
   * 标记错题为已掌握
   */
  async markAsMastered(questionId: string): Promise<void> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('wrong_questions');
      predicates.equalTo('question_id', questionId);

      const valueBucket: relationalStore.ValuesBucket = {
        is_mastered: 1
      };

      await store.update(valueBucket, predicates);
      Logger.info(`[AnswerRecordService] Marked as mastered: ${questionId}`);
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to mark as mastered', error as Error);
    }
  }

  /**
   * 获取错题ID列表
   */
  async getWrongQuestionIds(): Promise<string[]> {
    try {
      const wrongQuestions = await this.getWrongQuestions();
      return wrongQuestions.map((wq: WrongQuestion) => wq.questionId);
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get wrong question ids', error as Error);
      return [];
    }
  }

  /**
   * 按科目统计错题数量
   */
  async getWrongQuestionsBySubject(): Promise<SubjectWrongStat[]> {
    try {
      const wrongQuestions = await this.getWrongQuestions();
      if (wrongQuestions.length === 0) {
        return [];
      }

      // 获取所有错题的详细信息
      const questionIds = wrongQuestions.map((wq: WrongQuestion) => wq.questionId);
      const questions = await questionService.getQuestionsByIds(questionIds);

      // 按科目分组统计
      const subjectMap = new Map<string, number>();
      questions.forEach((q: Question) => {
        const current = subjectMap.get(q.subjectId) || 0;
        subjectMap.set(q.subjectId, current + 1);
      });

      // 转换为数组并按错题数量降序排列
      const result: SubjectWrongStat[] = [];
      subjectMap.forEach((count: number, subjectId: string) => {
        result.push({ subjectId, wrongCount: count });
      });
      result.sort((a, b) => b.wrongCount - a.wrongCount);

      return result;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get wrong questions by subject', error as Error);
      return [];
    }
  }

  /**
   * 获取今日错题列表（当天做错的题目）
   */
  async getTodayWrongQuestions(): Promise<WrongQuestion[]> {
    try {
      const store = databaseService.getStore();
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      const todayStart = today.getTime();
      const todayEnd = todayStart + 24 * 60 * 60 * 1000;

      const predicates = new relationalStore.RdbPredicates('wrong_questions');
      predicates.equalTo('is_mastered', 0);
      predicates.greaterThanOrEqualTo('last_wrong_time', todayStart);
      predicates.lessThan('last_wrong_time', todayEnd);
      predicates.orderByDesc('last_wrong_time');

      const resultSet = await store.query(predicates);
      const wrongQuestions: WrongQuestion[] = [];

      while (resultSet.goToNextRow()) {
        let noteValue = '';
        try {
          const noteIndex = resultSet.getColumnIndex('note');
          if (noteIndex >= 0) {
            noteValue = resultSet.getString(noteIndex) || '';
          }
        } catch (e) {
          // note 字段可能不存在
        }

        const wq: WrongQuestion = {
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          questionId: resultSet.getString(resultSet.getColumnIndex('question_id')),
          wrongCount: resultSet.getLong(resultSet.getColumnIndex('wrong_count')),
          lastWrongTime: resultSet.getLong(resultSet.getColumnIndex('last_wrong_time')),
          isMastered: resultSet.getLong(resultSet.getColumnIndex('is_mastered')) === 1,
          note: noteValue
        };
        wrongQuestions.push(wq);
      }

      resultSet.close();
      return wrongQuestions;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get today wrong questions', error as Error);
      return [];
    }
  }

  /**
   * 获取今日答题记录（当天做过的所有题目）
   */
  async getTodayAnswerRecords(): Promise<AnswerRecord[]> {
    try {
      const store = databaseService.getStore();
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      const todayStart = today.getTime();
      const todayEnd = todayStart + 24 * 60 * 60 * 1000;

      const predicates = new relationalStore.RdbPredicates('answer_records');
      predicates.greaterThanOrEqualTo('create_time', todayStart);
      predicates.lessThan('create_time', todayEnd);
      predicates.orderByDesc('create_time');

      const resultSet = await store.query(predicates);
      const records: AnswerRecord[] = [];

      while (resultSet.goToNextRow()) {
        const record: AnswerRecord = {
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          questionId: resultSet.getString(resultSet.getColumnIndex('question_id')),
          userAnswer: resultSet.getString(resultSet.getColumnIndex('user_answer')),
          isCorrect: resultSet.getLong(resultSet.getColumnIndex('is_correct')) === 1,
          answerTime: resultSet.getLong(resultSet.getColumnIndex('answer_time')),
          createTime: resultSet.getLong(resultSet.getColumnIndex('create_time'))
        };
        records.push(record);
      }

      resultSet.close();
      return records;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get today answer records', error as Error);
      return [];
    }
  }

  /**
   * 获取今日做过的题目ID列表（去重）
   */
  async getTodayQuestionIds(): Promise<string[]> {
    try {
      const records = await this.getTodayAnswerRecords();
      const uniqueIds = new Set<string>();
      records.forEach((record: AnswerRecord) => {
        uniqueIds.add(record.questionId);
      });
      return Array.from(uniqueIds);
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get today question ids', error as Error);
      return [];
    }
  }

  /**
   * 清理超过一个月的错题数据
   */
  async cleanOldWrongQuestions(): Promise<void> {
    try {
      const store = databaseService.getStore();
      const oneMonthAgo = Date.now() - 30 * 24 * 60 * 60 * 1000;

      const predicates = new relationalStore.RdbPredicates('wrong_questions');
      predicates.lessThan('last_wrong_time', oneMonthAgo);

      await store.delete(predicates);
      Logger.info('[AnswerRecordService] Cleaned old wrong questions');
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to clean old wrong questions', error as Error);
    }
  }


  // ========== 收藏相关 ==========

  /**
   * 添加收藏
   */
  async addFavorite(questionId: string, groupName: string = '默认'): Promise<void> {
    try {
      const store = databaseService.getStore();

      const predicates = new relationalStore.RdbPredicates('favorites');
      predicates.equalTo('question_id', questionId);
      const resultSet = await store.query(predicates);

      if (resultSet.goToNextRow()) {
        resultSet.close();
        Logger.info(`[AnswerRecordService] Already favorited: ${questionId}`);
        return;
      }

      resultSet.close();

      const valueBucket: relationalStore.ValuesBucket = {
        id: generateId(),
        question_id: questionId,
        group_name: groupName,
        create_time: Date.now()
      };

      await store.insert('favorites', valueBucket);
      Logger.info(`[AnswerRecordService] Added favorite: ${questionId}`);
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to add favorite', error as Error);
    }
  }

  /**
   * 取消收藏
   */
  async removeFavorite(questionId: string): Promise<void> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('favorites');
      predicates.equalTo('question_id', questionId);

      await store.delete(predicates);
      Logger.info(`[AnswerRecordService] Removed favorite: ${questionId}`);
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to remove favorite', error as Error);
    }
  }

  /**
   * 检查是否已收藏
   */
  async isFavorite(questionId: string): Promise<boolean> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('favorites');
      predicates.equalTo('question_id', questionId);

      const resultSet = await store.query(predicates);
      const isFav = resultSet.rowCount > 0;
      resultSet.close();
      return isFav;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to check favorite', error as Error);
      return false;
    }
  }

  /**
   * 获取收藏列表
   */
  async getFavorites(groupName?: string): Promise<FavoriteQuestion[]> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('favorites');

      if (groupName) {
        predicates.equalTo('group_name', groupName);
      }

      predicates.orderByDesc('create_time');

      const resultSet = await store.query(predicates);
      const favorites: FavoriteQuestion[] = [];

      while (resultSet.goToNextRow()) {
        const fav: FavoriteQuestion = {
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          questionId: resultSet.getString(resultSet.getColumnIndex('question_id')),
          groupName: resultSet.getString(resultSet.getColumnIndex('group_name')),
          createTime: resultSet.getLong(resultSet.getColumnIndex('create_time'))
        };
        favorites.push(fav);
      }

      resultSet.close();
      return favorites;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get favorites', error as Error);
      return [];
    }
  }

  /**
   * 获取收藏数量
   */
  async getFavoriteCount(): Promise<number> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('favorites');

      const resultSet = await store.query(predicates);
      const count = resultSet.rowCount;
      resultSet.close();
      return count;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get favorite count', error as Error);
      return 0;
    }
  }

  /**
   * 获取收藏题目ID列表
   */
  async getFavoriteQuestionIds(): Promise<string[]> {
    try {
      const favorites = await this.getFavorites();
      return favorites.map((fav: FavoriteQuestion) => fav.questionId);
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get favorite question ids', error as Error);
      return [];
    }
  }


  // ========== 考试记录相关 ==========

  /**
   * 保存考试记录
   */
  async saveExamRecord(record: ExamRecordInput): Promise<string> {
    try {
      const store = databaseService.getStore();
      const id = generateId();

      const valueBucket: relationalStore.ValuesBucket = {
        id: id,
        exam_type: record.examType,
        subject_id: record.subjectId,
        total_count: record.totalCount,
        correct_count: record.correctCount,
        score: record.score,
        duration: record.duration,
        create_time: Date.now(),
        question_ids: record.questionIds,
        answers: record.answers
      };

      await store.insert('exam_records', valueBucket);
      Logger.info(`[AnswerRecordService] Saved exam record: ${id}`);
      return id;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to save exam record', error as Error);
      throw new Error('Failed to save exam record');
    }
  }

  /**
   * 获取考试记录列表
   */
  async getExamRecords(limit?: number): Promise<ExamRecord[]> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('exam_records');
      predicates.orderByDesc('create_time');

      if (limit) {
        predicates.limitAs(limit);
      }

      const resultSet = await store.query(predicates);
      const records: ExamRecord[] = [];

      while (resultSet.goToNextRow()) {
        const rec: ExamRecord = {
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          examType: resultSet.getString(resultSet.getColumnIndex('exam_type')),
          subjectId: resultSet.getString(resultSet.getColumnIndex('subject_id')),
          totalCount: resultSet.getLong(resultSet.getColumnIndex('total_count')),
          correctCount: resultSet.getLong(resultSet.getColumnIndex('correct_count')),
          score: resultSet.getDouble(resultSet.getColumnIndex('score')),
          duration: resultSet.getLong(resultSet.getColumnIndex('duration')),
          createTime: resultSet.getLong(resultSet.getColumnIndex('create_time'))
        };
        records.push(rec);
      }

      resultSet.close();
      return records;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get exam records', error as Error);
      return [];
    }
  }

  /**
   * 获取考试记录数量
   */
  async getExamRecordCount(): Promise<number> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('exam_records');

      const resultSet = await store.query(predicates);
      const count = resultSet.rowCount;
      resultSet.close();
      return count;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get exam record count', error as Error);
      return 0;
    }
  }

  /**
   * 获取已完成的不重复题目数量（总体进度）
   */
  async getCompletedQuestionCount(): Promise<number> {
    try {
      const store = databaseService.getStore();
      // 使用 DISTINCT 查询不重复的 question_id 数量
      const resultSet = await store.querySql(
        'SELECT COUNT(DISTINCT question_id) as count FROM answer_records'
      );

      if (resultSet.goToNextRow()) {
        const count = resultSet.getLong(resultSet.getColumnIndex('count'));
        resultSet.close();
        return count;
      }

      resultSet.close();
      return 0;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get completed question count', error as Error);
      return 0;
    }
  }

  // ========== 数据清除 ==========

  /**
   * 清除所有学习数据
   */
  async clearAllData(): Promise<boolean> {
    try {
      const store = databaseService.getStore();

      // 清除答题记录
      const answerPredicates = new relationalStore.RdbPredicates('answer_records');
      await store.delete(answerPredicates);

      // 清除错题
      const wrongPredicates = new relationalStore.RdbPredicates('wrong_questions');
      await store.delete(wrongPredicates);

      // 清除收藏
      const favoritePredicates = new relationalStore.RdbPredicates('favorites');
      await store.delete(favoritePredicates);

      // 清除考试记录
      const examPredicates = new relationalStore.RdbPredicates('exam_records');
      await store.delete(examPredicates);

      // 清除统计
      const statsPredicates = new relationalStore.RdbPredicates('study_statistics');
      await store.delete(statsPredicates);

      Logger.info('[AnswerRecordService] All data cleared');
      return true;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to clear all data', error as Error);
      return false;
    }
  }

  // ========== 错题笔记相关 ==========

  /**
   * 更新错题笔记
   */
  async updateWrongQuestionNote(questionId: string, note: string): Promise<boolean> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('wrong_questions');
      predicates.equalTo('question_id', questionId);

      const valueBucket: relationalStore.ValuesBucket = {
        note: note
      };

      const rowCount = await store.update(valueBucket, predicates);
      Logger.info(`[AnswerRecordService] Updated note for question: ${questionId}`);
      return rowCount > 0;
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to update note', error as Error);
      return false;
    }
  }

  /**
   * 获取错题笔记
   */
  async getWrongQuestionNote(questionId: string): Promise<string> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('wrong_questions');
      predicates.equalTo('question_id', questionId);

      const resultSet = await store.query(predicates);

      if (resultSet.goToNextRow()) {
        let noteValue = '';
        try {
          const noteIndex = resultSet.getColumnIndex('note');
          if (noteIndex >= 0) {
            noteValue = resultSet.getString(noteIndex) || '';
          }
        } catch (e) {
          // note 字段可能不存在
        }
        resultSet.close();
        return noteValue;
      }

      resultSet.close();
      return '';
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get note', error as Error);
      return '';
    }
  }

  /**
   * 获取有笔记的错题列表
   */
  async getWrongQuestionsWithNotes(): Promise<WrongQuestion[]> {
    try {
      const allWrong = await this.getWrongQuestions();
      return allWrong.filter((wq: WrongQuestion) => wq.note && wq.note.length > 0);
    } catch (error) {
      Logger.error('[AnswerRecordService] Failed to get questions with notes', error as Error);
      return [];
    }
  }
}

// 导出单例
export const answerRecordService = new AnswerRecordService();
