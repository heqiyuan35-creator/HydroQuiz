/**
 * 数据导入服务
 * HydroQuiz - 水利工程检测员刷题宝
 * 用于导入题库JSON数据
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { questionService } from './QuestionService';
import { Logger } from '../common/utils/Logger';

/**
 * JSON题目格式
 */
interface JsonQuestion {
  id?: string;
  type: string; // 'single' | 'multiple' | 'judge'
  subjectId: string;
  chapter?: string;
  content: string;
  options: JsonOption[];
  answer: string;
  analysis?: string;
  difficulty?: number;
  tags?: string[];
}

interface JsonOption {
  key: string;
  content: string;
}

interface ImportResult {
  success: boolean;
  total: number;
  imported: number;
  failed: number;
  errors: string[];
}

/**
 * 数据导入服务类
 */
class DataImportService {
  /**
   * 从JSON字符串导入题目
   */
  async importFromJson(jsonString: string): Promise<ImportResult> {
    const result: ImportResult = {
      success: false,
      total: 0,
      imported: 0,
      failed: 0,
      errors: []
    };

    try {
      const data = JSON.parse(jsonString);
      const jsonQuestions: JsonQuestion[] = data.questions || data;

      if (!Array.isArray(jsonQuestions)) {
        result.errors.push('Invalid JSON format: expected array of questions');
        return result;
      }

      result.total = jsonQuestions.length;
      const questions: Question[] = [];

      for (let i = 0; i < jsonQuestions.length; i++) {
        try {
          const question = this.convertJsonQuestion(jsonQuestions[i], i);
          questions.push(question);
        } catch (error) {
          result.failed++;
          result.errors.push(`Question ${i + 1}: ${(error as Error).message}`);
        }
      }

      if (questions.length > 0) {
        const addedCount = await questionService.addQuestions(questions);
        result.imported = addedCount;
        result.success = addedCount > 0;
      }

      Logger.info(`[DataImportService] Import result: ${result.imported}/${result.total} questions`);
    } catch (error) {
      result.errors.push(`Parse error: ${(error as Error).message}`);
      Logger.error('[DataImportService] Failed to import', error as Error);
    }

    return result;
  }

  /**
   * 转换JSON题目为Question对象
   */
  private convertJsonQuestion(json: JsonQuestion, index: number): Question {
    // 验证必填字段
    if (!json.content) {
      throw new Error('Missing content');
    }
    if (!json.type) {
      throw new Error('Missing type');
    }
    if (!json.subjectId) {
      throw new Error('Missing subjectId');
    }
    if (!json.answer) {
      throw new Error('Missing answer');
    }
    if (!json.options || json.options.length === 0) {
      throw new Error('Missing options');
    }

    const now = Date.now();
    const id = json.id || `q_${json.subjectId}_${now}_${index}`;

    return {
      id: id,
      type: this.convertQuestionType(json.type),
      subjectId: json.subjectId,
      chapter: json.chapter || '',
      content: json.content,
      options: json.options.map((opt: JsonOption) => ({
        key: opt.key,
        content: opt.content
      })),
      answer: json.answer,
      analysis: json.analysis || '暂无解析',
      difficulty: (json.difficulty as DifficultyLevel) || DifficultyLevel.MEDIUM,
      tags: json.tags || [],
      createTime: now,
      updateTime: now
    };
  }

  /**
   * 转换题型字符串
   */
  private convertQuestionType(type: string): QuestionType {
    switch (type.toLowerCase()) {
      case 'single':
      case '单选':
      case '单选题':
        return QuestionType.SINGLE;
      case 'multiple':
      case '多选':
      case '多选题':
        return QuestionType.MULTIPLE;
      case 'judge':
      case 'truefalse':
      case '判断':
      case '判断题':
        return QuestionType.JUDGE;
      case 'case':
      case '案例':
      case '案例分析':
        return QuestionType.CASE;
      default:
        return QuestionType.SINGLE;
    }
  }

  /**
   * 清空所有题目（谨慎使用）
   */
  async clearAllQuestions(): Promise<boolean> {
    try {
      await questionService.clearAllQuestions();
      Logger.info('[DataImportService] All questions cleared');
      return true;
    } catch (error) {
      Logger.error('[DataImportService] Failed to clear questions', error as Error);
      return false;
    }
  }

  /**
   * 获取导入模板
   */
  getImportTemplate(): string {
    const template = {
      questions: [
        {
          id: 'example_001',
          type: 'single',
          subjectId: '001',
          chapter: '第一章',
          content: '这是一道示例单选题？',
          options: [
            { key: 'A', content: '选项A' },
            { key: 'B', content: '选项B' },
            { key: 'C', content: '选项C' },
            { key: 'D', content: '选项D' }
          ],
          answer: 'A',
          analysis: '这是答案解析',
          difficulty: 1,
          tags: ['示例', '测试']
        },
        {
          id: 'example_002',
          type: 'multiple',
          subjectId: '001',
          chapter: '第一章',
          content: '这是一道示例多选题？',
          options: [
            { key: 'A', content: '选项A' },
            { key: 'B', content: '选项B' },
            { key: 'C', content: '选项C' },
            { key: 'D', content: '选项D' }
          ],
          answer: 'A,B,C',
          analysis: '多选题答案用逗号分隔',
          difficulty: 2,
          tags: ['示例']
        },
        {
          id: 'example_003',
          type: 'judge',
          subjectId: '001',
          chapter: '第一章',
          content: '这是一道示例判断题。',
          options: [
            { key: 'A', content: '正确' },
            { key: 'B', content: '错误' }
          ],
          answer: 'A',
          analysis: '判断题答案为A（正确）或B（错误）',
          difficulty: 1,
          tags: ['示例']
        }
      ]
    };

    return JSON.stringify(template, null, 2);
  }
}

// 导出单例
export const dataImportService = new DataImportService();
