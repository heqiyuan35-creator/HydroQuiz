/**
 * 题目服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { relationalStore } from '@kit.ArkData';
import { databaseService } from '../data/database/DatabaseService';
import { Question, QuestionType, QuestionOption, DifficultyLevel } from '../common/types/QuestionTypes';
import { Logger } from '../common/utils/Logger';

/**
 * 题目查询条件
 */
export interface QuestionQuery {
  subjectId?: string;
  type?: QuestionType;
  difficulty?: DifficultyLevel;
  chapter?: string;
  limit?: number;
  offset?: number;
  random?: boolean;
}

/**
 * 题目服务类
 */
class QuestionService {
  /**
   * 获取题目列表
   */
  async getQuestions(query: QuestionQuery): Promise<Question[]> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('questions');

      // 构建查询条件
      if (query.subjectId) {
        predicates.equalTo('subject_id', query.subjectId);
      }
      if (query.type) {
        predicates.equalTo('type', query.type);
      }
      if (query.difficulty) {
        predicates.equalTo('difficulty', query.difficulty);
      }
      if (query.chapter) {
        predicates.equalTo('chapter', query.chapter);
      }

      // 普通排序
      predicates.orderByAsc('id');

      const resultSet = await store.query(predicates);
      const questions: Question[] = [];

      while (resultSet.goToNextRow()) {
        questions.push(this.parseQuestion(resultSet));
      }

      resultSet.close();

      // 如果需要随机，在内存中打乱顺序
      if (query.random && questions.length > 0) {
        this.shuffleArray(questions);
      }

      // 如果有limit限制，截取指定数量
      if (query.limit && query.limit > 0 && questions.length > query.limit) {
        return questions.slice(0, query.limit);
      }

      return questions;
    } catch (error) {
      Logger.error('[QuestionService] Failed to get questions', error as Error);
      return [];
    }
  }

  /**
   * 数组随机打乱（Fisher-Yates算法）
   */
  private shuffleArray<T>(array: T[]): void {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      const temp = array[i];
      array[i] = array[j];
      array[j] = temp;
    }
  }

  /**
   * 根据ID获取题目
   */
  async getQuestionById(id: string): Promise<Question | null> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('questions');
      predicates.equalTo('id', id);

      const resultSet = await store.query(predicates);

      if (resultSet.goToNextRow()) {
        const question = this.parseQuestion(resultSet);
        resultSet.close();
        return question;
      }

      resultSet.close();
      return null;
    } catch (error) {
      Logger.error('[QuestionService] Failed to get question by id', error as Error);
      return null;
    }
  }

  /**
   * 根据ID列表获取题目
   * 返回的题目顺序与输入的ids顺序一致
   */
  async getQuestionsByIds(ids: string[]): Promise<Question[]> {
    try {
      if (ids.length === 0) {
        return [];
      }

      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('questions');
      predicates.in('id', ids);

      const resultSet = await store.query(predicates);
      const questionMap = new Map<string, Question>();

      while (resultSet.goToNextRow()) {
        const question = this.parseQuestion(resultSet);
        questionMap.set(question.id, question);
      }

      resultSet.close();

      // 按照输入的ids顺序返回题目
      const orderedQuestions: Question[] = [];
      for (const id of ids) {
        const question = questionMap.get(id);
        if (question) {
          orderedQuestions.push(question);
        }
      }

      return orderedQuestions;
    } catch (error) {
      Logger.error('[QuestionService] Failed to get questions by ids', error as Error);
      return [];
    }
  }

  /**
   * 获取科目题目数量
   */
  async getQuestionCount(subjectId?: string): Promise<number> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('questions');

      if (subjectId) {
        predicates.equalTo('subject_id', subjectId);
      }

      const resultSet = await store.query(predicates);
      const count = resultSet.rowCount;
      resultSet.close();
      return count;
    } catch (error) {
      Logger.error('[QuestionService] Failed to get question count', error as Error);
      return 0;
    }
  }

  /**
   * 添加题目
   */
  async addQuestion(question: Question): Promise<boolean> {
    try {
      const store = databaseService.getStore();
      const valueBucket: relationalStore.ValuesBucket = {
        id: question.id,
        type: question.type,
        subject_id: question.subjectId,
        chapter: question.chapter,
        content: question.content,
        options: JSON.stringify(question.options),
        answer: question.answer,
        analysis: question.analysis,
        difficulty: question.difficulty,
        tags: JSON.stringify(question.tags),
        create_time: question.createTime,
        update_time: question.updateTime
      };

      const rowId = await store.insert('questions', valueBucket);
      return rowId > 0;
    } catch (error) {
      Logger.error('[QuestionService] Failed to add question', error as Error);
      return false;
    }
  }

  /**
   * 批量添加题目
   */
  async addQuestions(questions: Question[]): Promise<number> {
    try {
      const store = databaseService.getStore();
      let successCount = 0;

      for (const question of questions) {
        const valueBucket: relationalStore.ValuesBucket = {
          id: question.id,
          type: question.type,
          subject_id: question.subjectId,
          chapter: question.chapter,
          content: question.content,
          options: JSON.stringify(question.options),
          answer: question.answer,
          analysis: question.analysis,
          difficulty: question.difficulty,
          tags: JSON.stringify(question.tags),
          create_time: question.createTime,
          update_time: question.updateTime
        };

        try {
          const rowId = await store.insert('questions', valueBucket);
          if (rowId > 0) {
            successCount++;
          }
        } catch (e) {
          // 忽略重复插入错误
          Logger.warn(`[QuestionService] Skip duplicate question: ${question.id}`);
        }
      }

      Logger.info(`[QuestionService] Added ${successCount} questions`);
      return successCount;
    } catch (error) {
      Logger.error('[QuestionService] Failed to add questions', error as Error);
      return 0;
    }
  }

  /**
   * 删除所有题目
   */
  async clearAllQuestions(): Promise<boolean> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('questions');
      await store.delete(predicates);
      Logger.info('[QuestionService] All questions cleared');
      return true;
    } catch (error) {
      Logger.error('[QuestionService] Failed to clear questions', error as Error);
      return false;
    }
  }

  /**
   * 解析题目数据
   */
  private parseQuestion(resultSet: relationalStore.ResultSet): Question {
    const optionsStr = resultSet.getString(resultSet.getColumnIndex('options'));
    const tagsStr = resultSet.getString(resultSet.getColumnIndex('tags'));

    let options: QuestionOption[] = [];
    let tags: string[] = [];

    try {
      options = JSON.parse(optionsStr) as QuestionOption[];
    } catch (e) {
      options = [];
    }

    try {
      tags = JSON.parse(tagsStr) as string[];
    } catch (e) {
      tags = [];
    }

    return {
      id: resultSet.getString(resultSet.getColumnIndex('id')),
      type: resultSet.getString(resultSet.getColumnIndex('type')) as QuestionType,
      subjectId: resultSet.getString(resultSet.getColumnIndex('subject_id')),
      chapter: resultSet.getString(resultSet.getColumnIndex('chapter')),
      content: resultSet.getString(resultSet.getColumnIndex('content')),
      options: options,
      answer: resultSet.getString(resultSet.getColumnIndex('answer')),
      analysis: resultSet.getString(resultSet.getColumnIndex('analysis')),
      difficulty: resultSet.getLong(resultSet.getColumnIndex('difficulty')) as DifficultyLevel,
      tags: tags,
      createTime: resultSet.getLong(resultSet.getColumnIndex('create_time')),
      updateTime: resultSet.getLong(resultSet.getColumnIndex('update_time'))
    };
  }
}

// 导出单例
export const questionService = new QuestionService();
