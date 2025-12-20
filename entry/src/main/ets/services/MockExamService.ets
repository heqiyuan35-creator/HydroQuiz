/**
 * 模拟考试服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { relationalStore } from '@kit.ArkData';
import { databaseService } from '../data/database/DatabaseService';
import { questionService } from './QuestionService';
import { answerRecordService } from './AnswerRecordService';
import { Question, QuestionType } from '../common/types/QuestionTypes';
import { Logger } from '../common/utils/Logger';
import { achievementService } from './AchievementService';

/**
 * 考试类型
 */
export type ExamType = 'full' | 'subject' | 'quick' | 'wrong';

/**
 * 评分规则
 */
export interface ScoreRule {
  questionType: QuestionType;
  score: number;
  halfScore?: number; // 多选题少选得分
}

/**
 * 考试配置
 */
export interface ExamConfig {
  type: ExamType;
  subjectId?: string;
  questionCount: number;
  timeLimit: number; // 秒
  scoreRules: ScoreRule[];
}

/**
 * 题型得分统计
 */
export interface TypeScore {
  type: QuestionType;
  typeName: string;
  totalCount: number;
  correctCount: number;
  totalScore: number;
  earnedScore: number;
}

/**
 * 科目得分统计
 */
export interface SubjectScore {
  subjectId: string;
  subjectName: string;
  totalCount: number;
  correctCount: number;
  accuracy: number;
}

/**
 * 考试结果
 */
export interface ExamResult {
  score: number;
  totalScore: number;
  correctCount: number;
  totalCount: number;
  duration: number;
  isPassed: boolean;
  passScore: number;
  typeScores: TypeScore[];
  subjectScores: SubjectScore[];
  wrongQuestionIds: string[];
}

/**
 * 考试进度（断点续考）
 */
export interface ExamProgress {
  id: string;
  examType: ExamType;
  subjectId?: string;
  questionIds: string[];
  userAnswers: Map<string, string>;
  markedIds: Set<string>;
  currentIndex: number;
  remainingTime: number;
  createTime: number;
  updateTime: number;
}

/**
 * 考试记录
 */
export interface MockExamRecord {
  id: string;
  examType: ExamType;
  examTypeName: string;
  subjectId?: string;
  subjectName?: string;
  totalCount: number;
  correctCount: number;
  score: number;
  duration: number;
  timeLimit: number;
  isPassed: boolean;
  createTime: number;
}

/**
 * 考试配置预设（不含 subjectId）
 */
export interface ExamPreset {
  type: ExamType;
  questionCount: number;
  timeLimit: number;
  scoreRules: ScoreRule[];
}

// 默认评分规则
function getDefaultScoreRules(): ScoreRule[] {
  const rules: ScoreRule[] = [];
  const singleRule: ScoreRule = { questionType: QuestionType.SINGLE, score: 1 };
  const multipleRule: ScoreRule = { questionType: QuestionType.MULTIPLE, score: 1.5, halfScore: 0.75 };
  const judgeRule: ScoreRule = { questionType: QuestionType.JUDGE, score: 0.5 };
  rules.push(singleRule);
  rules.push(multipleRule);
  rules.push(judgeRule);
  return rules;
}

// 获取考试预设配置
export function getExamPreset(examType: ExamType): ExamPreset {
  if (examType === 'full') {
    const preset: ExamPreset = {
      type: 'full',
      questionCount: 100,
      timeLimit: 120 * 60,
      scoreRules: getDefaultScoreRules()
    };
    return preset;
  } else if (examType === 'subject') {
    const preset: ExamPreset = {
      type: 'subject',
      questionCount: 50,
      timeLimit: 60 * 60,
      scoreRules: getDefaultScoreRules()
    };
    return preset;
  } else if (examType === 'quick') {
    const preset: ExamPreset = {
      type: 'quick',
      questionCount: 20,
      timeLimit: 20 * 60,
      scoreRules: getDefaultScoreRules()
    };
    return preset;
  } else {
    const preset: ExamPreset = {
      type: 'wrong',
      questionCount: 30,
      timeLimit: 30 * 60,
      scoreRules: getDefaultScoreRules()
    };
    return preset;
  }
}

/**
 * 模拟考试服务类
 */
class MockExamService {
  /**
   * 初始化考试相关表
   */
  async initTables(): Promise<void> {
    try {
      const store = databaseService.getStore();
      // 考试进度表
      const createProgressTable = `
        CREATE TABLE IF NOT EXISTS exam_progress (
          id TEXT PRIMARY KEY,
          exam_type TEXT NOT NULL,
          subject_id TEXT,
          question_ids TEXT NOT NULL,
          user_answers TEXT NOT NULL,
          marked_ids TEXT,
          current_index INTEGER DEFAULT 0,
          remaining_time INTEGER NOT NULL,
          create_time INTEGER NOT NULL,
          update_time INTEGER NOT NULL
        )
      `;
      await store.executeSql(createProgressTable);
      
      // 为 exam_records 添加新字段（兼容旧版本）
      try {
        await store.executeSql('ALTER TABLE exam_records ADD COLUMN time_limit INTEGER DEFAULT 7200');
      } catch (e) { /* 字段已存在 */ }
      try {
        await store.executeSql('ALTER TABLE exam_records ADD COLUMN marked_ids TEXT');
      } catch (e) { /* 字段已存在 */ }
      
      Logger.info('[MockExamService] Tables initialized');
    } catch (error) {
      Logger.error('[MockExamService] Failed to init tables', error as Error);
    }
  }

  /**
   * 生成试卷
   */
  async generateExam(config: ExamConfig): Promise<Question[]> {
    try {
      let questions: Question[] = [];
      
      if (config.type === 'wrong') {
        // 错题重考：从错题库抽取
        questions = await this.getWrongQuestions(config.questionCount);
      } else if (config.type === 'subject' && config.subjectId) {
        // 专项模拟：指定科目
        questions = await this.getSubjectQuestions(config.subjectId, config.questionCount);
      } else {
        // 全真模拟/快速测验：按题型配比随机抽取
        questions = await this.getRandomQuestions(config.questionCount, config.type === 'full');
      }
      
      Logger.info(`[MockExamService] Generated exam with ${questions.length} questions`);
      return questions;
    } catch (error) {
      Logger.error('[MockExamService] Failed to generate exam', error as Error);
      return [];
    }
  }

  /**
   * 从错题库抽取题目
   */
  private async getWrongQuestions(count: number): Promise<Question[]> {
    const wrongList = await answerRecordService.getWrongQuestions();
    const questionIds = wrongList
      .filter(w => !w.isMastered)
      .sort(() => Math.random() - 0.5)
      .slice(0, count)
      .map(w => w.questionId);
    
    if (questionIds.length === 0) {
      return [];
    }
    return await questionService.getQuestionsByIds(questionIds);
  }

  /**
   * 获取指定科目题目
   */
  private async getSubjectQuestions(subjectId: string, count: number): Promise<Question[]> {
    return await questionService.getQuestions({
      subjectId: subjectId,
      limit: count,
      random: true
    });
  }

  /**
   * 随机抽取题目（按题型配比）
   */
  private async getRandomQuestions(count: number, isFullExam: boolean): Promise<Question[]> {
    const questions: Question[] = [];
    
    if (isFullExam) {
      // 全真模拟：60单选 + 20多选 + 20判断
      const singles = await questionService.getQuestions({ type: QuestionType.SINGLE, limit: 60, random: true });
      const multiples = await questionService.getQuestions({ type: QuestionType.MULTIPLE, limit: 20, random: true });
      const judges = await questionService.getQuestions({ type: QuestionType.JUDGE, limit: 20, random: true });
      questions.push(...singles, ...multiples, ...judges);
    } else {
      // 快速测验：随机抽取
      const all = await questionService.getQuestions({ limit: count, random: true });
      questions.push(...all);
    }
    
    return questions;
  }

  /**
   * 计算考试成绩
   */
  calculateScore(questions: Question[], answers: Map<string, string>, config: ExamConfig): ExamResult {
    let totalScore = 0;
    let earnedScore = 0;
    let correctCount = 0;
    const wrongQuestionIds: string[] = [];
    
    // 题型统计
    const typeStatsMap = new Map<QuestionType, TypeScore>();
    // 科目统计
    const subjectStatsMap = new Map<string, SubjectScore>();
    
    // 初始化题型统计
    for (const rule of config.scoreRules) {
      typeStatsMap.set(rule.questionType, {
        type: rule.questionType,
        typeName: this.getTypeName(rule.questionType),
        totalCount: 0,
        correctCount: 0,
        totalScore: 0,
        earnedScore: 0
      });
    }
    
    // 遍历题目计算得分
    for (const question of questions) {
      const userAnswer = answers.get(question.id) || '';
      const rule = config.scoreRules.find(r => r.questionType === question.type);
      const questionScore = rule ? rule.score : 1;
      
      totalScore += questionScore;
      
      // 更新题型统计
      let typeStat = typeStatsMap.get(question.type);
      if (!typeStat) {
        typeStat = {
          type: question.type,
          typeName: this.getTypeName(question.type),
          totalCount: 0,
          correctCount: 0,
          totalScore: 0,
          earnedScore: 0
        };
        typeStatsMap.set(question.type, typeStat);
      }
      typeStat.totalCount++;
      typeStat.totalScore += questionScore;
      
      // 更新科目统计
      let subjectStat = subjectStatsMap.get(question.subjectId);
      if (!subjectStat) {
        subjectStat = {
          subjectId: question.subjectId,
          subjectName: '',
          totalCount: 0,
          correctCount: 0,
          accuracy: 0
        };
        subjectStatsMap.set(question.subjectId, subjectStat);
      }
      subjectStat.totalCount++;
      
      // 判断答案 - 只有作答过的题目才参与判断
      if (userAnswer) {
        const isCorrect = this.checkAnswer(question, userAnswer, rule);
        if (isCorrect === 1) {
          // 完全正确
          earnedScore += questionScore;
          correctCount++;
          typeStat.correctCount++;
          typeStat.earnedScore += questionScore;
          subjectStat.correctCount++;
        } else if (isCorrect === 0.5 && rule?.halfScore) {
          // 多选题少选
          earnedScore += rule.halfScore;
          typeStat.earnedScore += rule.halfScore;
        } else {
          // 答错了才加入错题本
          wrongQuestionIds.push(question.id);
        }
      }
      // 未作答的题目不计入错题本
    }
    
    // 计算科目正确率
    const subjectScores: SubjectScore[] = [];
    subjectStatsMap.forEach((stat) => {
      stat.accuracy = stat.totalCount > 0 ? Math.round(stat.correctCount / stat.totalCount * 100) : 0;
      subjectScores.push(stat);
    });
    
    const typeScores: TypeScore[] = [];
    typeStatsMap.forEach((stat) => {
      if (stat.totalCount > 0) {
        typeScores.push(stat);
      }
    });
    
    const passScore = totalScore * 0.6;
    
    return {
      score: Math.round(earnedScore * 10) / 10,
      totalScore: Math.round(totalScore * 10) / 10,
      correctCount,
      totalCount: questions.length,
      duration: 0,
      isPassed: earnedScore >= passScore,
      passScore: Math.round(passScore * 10) / 10,
      typeScores,
      subjectScores,
      wrongQuestionIds
    };
  }

  /**
   * 检查答案
   * @returns 1=正确, 0.5=多选少选, 0=错误
   */
  private checkAnswer(question: Question, userAnswer: string, rule?: ScoreRule): number {
    if (!userAnswer) return 0;
    
    const correctAnswer = question.answer.toUpperCase().split(',').sort().join(',');
    const userAns = userAnswer.toUpperCase().split(',').sort().join(',');
    
    if (correctAnswer === userAns) {
      return 1;
    }
    
    // 多选题少选判断
    if (question.type === QuestionType.MULTIPLE && rule?.halfScore) {
      const correctSet = new Set(correctAnswer.split(','));
      const userSet = new Set(userAns.split(','));
      let hasWrong = false;
      let matchCount = 0;
      
      userSet.forEach(ans => {
        if (correctSet.has(ans)) {
          matchCount++;
        } else {
          hasWrong = true;
        }
      });
      
      if (!hasWrong && matchCount > 0 && matchCount < correctSet.size) {
        return 0.5;
      }
    }
    
    return 0;
  }

  private getTypeName(type: QuestionType): string {
    switch (type) {
      case QuestionType.SINGLE: return '单选题';
      case QuestionType.MULTIPLE: return '多选题';
      case QuestionType.JUDGE: return '判断题';
      default: return '其他';
    }
  }

  /**
   * 保存考试进度
   */
  async saveProgress(progress: ExamProgress): Promise<void> {
    try {
      const store = databaseService.getStore();
      
      // 先删除旧进度
      const delPredicates = new relationalStore.RdbPredicates('exam_progress');
      await store.delete(delPredicates);
      
      const answersObj: Record<string, string> = {};
      progress.userAnswers.forEach((v, k) => { answersObj[k] = v; });
      
      const valueBucket: relationalStore.ValuesBucket = {
        id: progress.id,
        exam_type: progress.examType,
        subject_id: progress.subjectId || '',
        question_ids: JSON.stringify(progress.questionIds),
        user_answers: JSON.stringify(answersObj),
        marked_ids: JSON.stringify(Array.from(progress.markedIds)),
        current_index: progress.currentIndex,
        remaining_time: progress.remainingTime,
        create_time: progress.createTime,
        update_time: Date.now()
      };
      
      await store.insert('exam_progress', valueBucket);
      Logger.info('[MockExamService] Progress saved');
    } catch (error) {
      Logger.error('[MockExamService] Failed to save progress', error as Error);
    }
  }

  /**
   * 加载考试进度
   */
  async loadProgress(): Promise<ExamProgress | null> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('exam_progress');
      const resultSet = await store.query(predicates);
      
      const rowCount = resultSet.rowCount;
      Logger.info(`[MockExamService] loadProgress: found ${rowCount} rows`);
      
      if (rowCount <= 0) {
        resultSet.close();
        return null;
      }
      
      if (resultSet.goToNextRow()) {
        const answersStr = resultSet.getString(resultSet.getColumnIndex('user_answers'));
        const markedStr = resultSet.getString(resultSet.getColumnIndex('marked_ids'));
        const questionIdsStr = resultSet.getString(resultSet.getColumnIndex('question_ids'));
        
        let answersObj: Record<string, string> = {};
        let markedArr: string[] = [];
        let questionIds: string[] = [];
        
        try { answersObj = JSON.parse(answersStr); } catch (e) { /* ignore */ }
        try { markedArr = JSON.parse(markedStr); } catch (e) { /* ignore */ }
        try { questionIds = JSON.parse(questionIdsStr); } catch (e) { /* ignore */ }
        
        // 如果没有题目ID，说明进度无效
        if (questionIds.length === 0) {
          Logger.info('[MockExamService] loadProgress: invalid progress (no questions), clearing');
          resultSet.close();
          await this.clearProgress();
          return null;
        }
        
        const userAnswers = new Map<string, string>();
        Object.keys(answersObj).forEach(k => { userAnswers.set(k, answersObj[k]); });
        
        const progress: ExamProgress = {
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          examType: resultSet.getString(resultSet.getColumnIndex('exam_type')) as ExamType,
          subjectId: resultSet.getString(resultSet.getColumnIndex('subject_id')) || undefined,
          questionIds,
          userAnswers,
          markedIds: new Set(markedArr),
          currentIndex: resultSet.getLong(resultSet.getColumnIndex('current_index')),
          remainingTime: resultSet.getLong(resultSet.getColumnIndex('remaining_time')),
          createTime: resultSet.getLong(resultSet.getColumnIndex('create_time')),
          updateTime: resultSet.getLong(resultSet.getColumnIndex('update_time'))
        };
        
        resultSet.close();
        Logger.info(`[MockExamService] loadProgress: found valid progress, remainingTime=${progress.remainingTime}`);
        return progress;
      }
      
      resultSet.close();
      return null;
    } catch (error) {
      Logger.error('[MockExamService] Failed to load progress', error as Error);
      return null;
    }
  }

  /**
   * 清除考试进度
   */
  async clearProgress(): Promise<void> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('exam_progress');
      const deletedRows = await store.delete(predicates);
      Logger.info(`[MockExamService] Progress cleared, deleted ${deletedRows} rows`);
    } catch (error) {
      Logger.error('[MockExamService] Failed to clear progress', error as Error);
    }
  }

  /**
   * 保存考试记录
   */
  async saveExamRecord(
    result: ExamResult,
    config: ExamConfig,
    questionIds: string[],
    answers: Map<string, string>,
    duration: number
  ): Promise<string> {
    try {
      const store = databaseService.getStore();
      const id = `exam_${Date.now()}`;
      
      const answersObj: Record<string, string> = {};
      answers.forEach((v, k) => { answersObj[k] = v; });
      
      const valueBucket: relationalStore.ValuesBucket = {
        id,
        exam_type: config.type,
        subject_id: config.subjectId || '',
        total_count: result.totalCount,
        correct_count: result.correctCount,
        score: result.score,
        duration,
        time_limit: config.timeLimit,
        create_time: Date.now(),
        question_ids: JSON.stringify(questionIds),
        answers: JSON.stringify(answersObj)
      };
      
      await store.insert('exam_records', valueBucket);
      
      // 同步更新今日刷题统计 - 只统计实际作答的题目数量
      const answeredCount = answers.size;
      await this.updateTodayStatisticsForExam(answeredCount, result.correctCount);
      
      // 将错题添加到错题本
      for (const wrongId of result.wrongQuestionIds) {
        await answerRecordService.addToWrongBook(wrongId);
      }
      
      // 检查成就解锁
      achievementService.checkAndNotify();

      Logger.info(`[MockExamService] Exam record saved: ${id}, updated today stats: +${answeredCount} questions (answered)`);
      return id;
    } catch (error) {
      Logger.error('[MockExamService] Failed to save exam record', error as Error);
      return '';
    }
  }

  /**
   * 更新今日刷题统计（用于模拟考试）
   */
  private async updateTodayStatisticsForExam(totalCount: number, correctCount: number): Promise<void> {
    try {
      const store = databaseService.getStore();
      const today = new Date().toISOString().split('T')[0];
      const id = `stat_${today}`;

      Logger.info(`[MockExamService] Updating today stats for exam: date=${today}, answered=${totalCount}, correct=${correctCount}`);

      const predicates = new relationalStore.RdbPredicates('study_statistics');
      predicates.equalTo('date', today);
      const resultSet = await store.query(predicates);

      if (resultSet.goToNextRow()) {
        const currentTotal = resultSet.getLong(resultSet.getColumnIndex('question_count'));
        const currentCorrect = resultSet.getLong(resultSet.getColumnIndex('correct_count'));
        resultSet.close();

        const updatePredicates = new relationalStore.RdbPredicates('study_statistics');
        updatePredicates.equalTo('date', today);

        const newTotal = currentTotal + totalCount;
        const newCorrect = currentCorrect + correctCount;

        const valueBucket: relationalStore.ValuesBucket = {
          question_count: newTotal,
          correct_count: newCorrect
        };

        await store.update(valueBucket, updatePredicates);
        Logger.info(`[MockExamService] Updated today stats: ${currentTotal} -> ${newTotal} questions, ${currentCorrect} -> ${newCorrect} correct`);
      } else {
        resultSet.close();
        const valueBucket: relationalStore.ValuesBucket = {
          id: id,
          date: today,
          study_time: 0,
          question_count: totalCount,
          correct_count: correctCount
        };

        await store.insert('study_statistics', valueBucket);
        Logger.info(`[MockExamService] Created today stats: ${totalCount} questions, ${correctCount} correct`);
      }
    } catch (error) {
      Logger.error('[MockExamService] Failed to update today statistics', error as Error);
    }
  }

  /**
   * 获取考试历史记录
   */
  async getExamHistory(limit: number = 20): Promise<MockExamRecord[]> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('exam_records');
      predicates.orderByDesc('create_time');
      predicates.limitAs(limit);
      
      const resultSet = await store.query(predicates);
      const records: MockExamRecord[] = [];
      
      while (resultSet.goToNextRow()) {
        const examType = resultSet.getString(resultSet.getColumnIndex('exam_type')) as ExamType;
        const score = resultSet.getDouble(resultSet.getColumnIndex('score'));
        const totalCount = resultSet.getLong(resultSet.getColumnIndex('total_count'));
        
        // 计算总分
        let totalScore = totalCount; // 简化计算
        if (examType === 'full') {
          totalScore = 100;
        }
        
        records.push({
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          examType,
          examTypeName: this.getExamTypeName(examType),
          subjectId: resultSet.getString(resultSet.getColumnIndex('subject_id')) || undefined,
          totalCount,
          correctCount: resultSet.getLong(resultSet.getColumnIndex('correct_count')),
          score,
          duration: resultSet.getLong(resultSet.getColumnIndex('duration')),
          timeLimit: resultSet.getLong(resultSet.getColumnIndex('time_limit')) || 7200,
          isPassed: score >= totalScore * 0.6,
          createTime: resultSet.getLong(resultSet.getColumnIndex('create_time'))
        });
      }
      
      resultSet.close();
      return records;
    } catch (error) {
      Logger.error('[MockExamService] Failed to get exam history', error as Error);
      return [];
    }
  }

  /**
   * 删除考试记录
   */
  async deleteExamRecord(id: string): Promise<boolean> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('exam_records');
      predicates.equalTo('id', id);
      const rows = await store.delete(predicates);
      return rows > 0;
    } catch (error) {
      Logger.error('[MockExamService] Failed to delete exam record', error as Error);
      return false;
    }
  }

  private getExamTypeName(type: ExamType): string {
    switch (type) {
      case 'full': return '全真模拟';
      case 'subject': return '专项模拟';
      case 'quick': return '快速测验';
      case 'wrong': return '错题重考';
      default: return '模拟考试';
    }
  }
}

// 导出单例
export const mockExamService = new MockExamService();
