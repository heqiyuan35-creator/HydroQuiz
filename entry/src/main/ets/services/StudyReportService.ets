/**
 * 学习报告服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { relationalStore } from '@kit.ArkData';
import { databaseService } from '../data/database/DatabaseService';
import { questionService } from './QuestionService';
import { questionBankService } from './QuestionBankService';
import { answerRecordService } from './AnswerRecordService';
import { mockExamService } from './MockExamService';
import { Logger } from '../common/utils/Logger';
import { SUBJECT_LIST } from '../data/SubjectData';
import { SubjectInfo } from '../common/types/QuestionTypes';

// 科目学习数据
export interface SubjectStudyData {
  subjectId: string;
  totalCount: number;
  correctCount: number;
  wrongCount: number;
  accuracy: number;
}

// 每日学习数据
export interface DailyStudyData {
  date: string;
  totalCount: number;
  correctCount: number;
  studyMinutes: number;
}

// 学习报告数据
export interface StudyReportData {
  // 概览
  totalQuestions: number;
  completedQuestions: number;
  totalCorrect: number;
  totalWrong: number;
  overallAccuracy: number;
  studyDays: number;
  totalStudyMinutes: number;
  
  // 科目分布
  subjectData: SubjectStudyData[];
  
  // 近7天趋势
  weekTrend: DailyStudyData[];
  
  // 考试统计
  examCount: number;
  examPassRate: number;
  examAvgScore: number;
  examHighestScore: number;
}

class StudyReportService {
  async getReportData(): Promise<StudyReportData> {
    try {
      const isReady = await databaseService.waitForReady(10000);
      if (!isReady) {
        return this.getEmptyData();
      }

      const totalQuestions = await questionBankService.getTotalQuestionCount();
      const completedQuestions = await this.getCompletedQuestionCount();
      const stats = await this.getOverallStats();
      const studyDays = await this.getStudyDays();
      const totalStudyMinutes = await this.getTotalStudyMinutes();
      const subjectData = await this.getSubjectData();
      const weekTrend = await this.getWeekTrend();
      const examStats = await this.getExamStats();

      const result: StudyReportData = {
        totalQuestions: totalQuestions,
        completedQuestions: completedQuestions,
        totalCorrect: stats.correct,
        totalWrong: stats.wrong,
        overallAccuracy: stats.accuracy,
        studyDays: studyDays,
        totalStudyMinutes: totalStudyMinutes,
        subjectData: subjectData,
        weekTrend: weekTrend,
        examCount: examStats.count,
        examPassRate: examStats.passRate,
        examAvgScore: examStats.avgScore,
        examHighestScore: examStats.highestScore
      };

      return result;
    } catch (error) {
      Logger.error('[StudyReportService] Failed to get report data', error as Error);
      return this.getEmptyData();
    }
  }

  private getEmptyData(): StudyReportData {
    return {
      totalQuestions: 0,
      completedQuestions: 0,
      totalCorrect: 0,
      totalWrong: 0,
      overallAccuracy: 0,
      studyDays: 0,
      totalStudyMinutes: 0,
      subjectData: [],
      weekTrend: [],
      examCount: 0,
      examPassRate: 0,
      examAvgScore: 0,
      examHighestScore: 0
    };
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

  private async getOverallStats(): Promise<OverallStats> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('answer_records');
      const resultSet = await store.query(predicates);

      let correct = 0;
      let wrong = 0;

      while (resultSet.goToNextRow()) {
        const isCorrect = resultSet.getLong(resultSet.getColumnIndex('is_correct')) === 1;
        if (isCorrect) {
          correct++;
        } else {
          wrong++;
        }
      }
      resultSet.close();

      const total = correct + wrong;
      const accuracy = total > 0 ? Math.round(correct / total * 100) : 0;

      const stats = new OverallStats();
      stats.correct = correct;
      stats.wrong = wrong;
      stats.accuracy = accuracy;
      return stats;
    } catch (error) {
      return new OverallStats();
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

  private async getTotalStudyMinutes(): Promise<number> {
    try {
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('answer_records');
      const resultSet = await store.query(predicates);
      // 估算：每道题平均1分钟
      const count = resultSet.rowCount;
      resultSet.close();
      return count;
    } catch (error) {
      return 0;
    }
  }

  private async getSubjectData(): Promise<SubjectStudyData[]> {
    try {
      const store = databaseService.getStore();
      const result: SubjectStudyData[] = [];

      for (const subject of SUBJECT_LIST) {
        const subjectInfo = subject as SubjectInfo;
        const predicates = new relationalStore.RdbPredicates('answer_records');
        const resultSet = await store.query(predicates);
        
        let totalCount = 0;
        let correctCount = 0;
        
        while (resultSet.goToNextRow()) {
          const questionId = resultSet.getString(resultSet.getColumnIndex('question_id'));
          const isCorrect = resultSet.getLong(resultSet.getColumnIndex('is_correct')) === 1;
          const question = await questionService.getQuestionById(questionId);
          
          if (question && question.subjectId === subjectInfo.id) {
            totalCount++;
            if (isCorrect) correctCount++;
          }
        }
        resultSet.close();
        
        const wrongCount = totalCount - correctCount;
        const accuracy = totalCount > 0 ? Math.round(correctCount / totalCount * 100) : 0;
        
        const item: SubjectStudyData = {
          subjectId: subjectInfo.id,
          totalCount,
          correctCount,
          wrongCount,
          accuracy
        };
        result.push(item);
      }

      return result;
    } catch (error) {
      return [];
    }
  }

  private async getWeekTrend(): Promise<DailyStudyData[]> {
    try {
      const store = databaseService.getStore();
      const result: DailyStudyData[] = [];
      const now = new Date();

      for (let i = 6; i >= 0; i--) {
        const date = new Date(now);
        date.setDate(date.getDate() - i);
        date.setHours(0, 0, 0, 0);
        
        const dateStr = date.toISOString().split('T')[0];
        const dayStart = date.getTime();
        const dayEnd = dayStart + 24 * 60 * 60 * 1000;

        const predicates = new relationalStore.RdbPredicates('answer_records');
        predicates.greaterThanOrEqualTo('create_time', dayStart);
        predicates.lessThan('create_time', dayEnd);

        const resultSet = await store.query(predicates);
        let totalCount = 0;
        let correctCount = 0;

        while (resultSet.goToNextRow()) {
          totalCount++;
          const isCorrect = resultSet.getLong(resultSet.getColumnIndex('is_correct')) === 1;
          if (isCorrect) correctCount++;
        }
        resultSet.close();

        const item: DailyStudyData = {
          date: dateStr,
          totalCount,
          correctCount,
          studyMinutes: totalCount
        };
        result.push(item);
      }

      return result;
    } catch (error) {
      return [];
    }
  }

  private async getExamStats(): Promise<ExamStats> {
    try {
      const records = await mockExamService.getExamHistory(100);
      if (records.length === 0) {
        return new ExamStats();
      }

      const passed = records.filter(r => r.isPassed).length;
      let totalScore = 0;
      let highest = 0;
      for (let i = 0; i < records.length; i++) {
        totalScore += records[i].score;
        if (records[i].score > highest) {
          highest = records[i].score;
        }
      }

      const stats = new ExamStats();
      stats.count = records.length;
      stats.passRate = Math.round(passed / records.length * 100);
      stats.avgScore = Math.round(totalScore / records.length);
      stats.highestScore = highest;
      return stats;
    } catch (error) {
      return new ExamStats();
    }
  }
}

/**
 * 总体统计类
 */
class OverallStats {
  correct: number = 0;
  wrong: number = 0;
  accuracy: number = 0;
}

/**
 * 考试统计类
 */
class ExamStats {
  count: number = 0;
  passRate: number = 0;
  avgScore: number = 0;
  highestScore: number = 0;
}

export const studyReportService = new StudyReportService();
