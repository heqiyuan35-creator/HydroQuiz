/**
 * 题目相关类型定义
 * HydroQuiz - 水利工程检测员刷题宝
 */

/**
 * 题型枚举
 */
export enum QuestionType {
  SINGLE = 'single',       // 单选题
  MULTIPLE = 'multiple',   // 多选题
  JUDGE = 'judge',         // 判断题
  CASE = 'case'            // 案例分析题
}

/**
 * 难度等级枚举
 */
export enum DifficultyLevel {
  EASY = 1,      // 简单
  MEDIUM = 2,    // 中等
  HARD = 3       // 困难
}

/**
 * 科目信息接口
 */
export interface SubjectInfo {
  id: string;              // 科目ID
  name: string;            // 科目名称
  shortName: string;       // 简称
  icon: string;            // 图标
  color: string;           // 主题色
  questionCount: number;   // 题目总数
  description: string;     // 描述
}

/**
 * 选项接口
 */
export interface QuestionOption {
  key: string;             // 选项标识 A/B/C/D
  content: string;         // 选项内容
}

/**
 * 题目接口
 */
export interface Question {
  id: string;                    // 题目ID
  type: QuestionType;            // 题型
  subjectId: string;             // 科目ID
  chapter: string;               // 章节
  content: string;               // 题目内容
  options: QuestionOption[];     // 选项（选择题）
  answer: string;                // 正确答案（单选/判断为字符串，多选为逗号分隔）
  analysis: string;              // 解析
  difficulty: DifficultyLevel;   // 难度等级
  tags: string[];                // 标签
  createTime: number;            // 创建时间
  updateTime: number;            // 更新时间
}

/**
 * 答题记录接口
 */
export interface AnswerRecord {
  id: string;                    // 记录ID
  questionId: string;            // 题目ID
  userAnswer: string;            // 用户答案
  isCorrect: boolean;            // 是否正确
  answerTime: number;            // 答题用时（秒）
  createTime: number;            // 创建时间
}

/**
 * 错题接口
 */
export interface WrongQuestion {
  id: string;                    // 记录ID
  questionId: string;            // 题目ID
  wrongCount: number;            // 错误次数
  lastWrongTime: number;         // 最后错误时间
  isMastered: boolean;           // 是否已掌握
  note: string;                  // 错题笔记
}

/**
 * 收藏接口
 */
export interface FavoriteQuestion {
  id: string;                    // 记录ID
  questionId: string;            // 题目ID
  groupName: string;             // 分组名称
  createTime: number;            // 收藏时间
}

/**
 * 考试记录接口
 */
export interface ExamRecord {
  id: string;                    // 记录ID
  examType: string;              // 考试类型
  subjectId: string;             // 科目ID（可选）
  totalCount: number;            // 总题数
  correctCount: number;          // 正确数
  score: number;                 // 得分
  duration: number;              // 用时（秒）
  createTime: number;            // 考试时间
  questionIds: string[];         // 题目ID列表
  answers: string[];             // 用户答案列表
}

/**
 * 学习统计接口
 */
export interface StudyStatistics {
  id: string;                    // 记录ID
  date: string;                  // 日期 YYYY-MM-DD
  studyTime: number;             // 学习时长（分钟）
  questionCount: number;         // 做题数量
  correctCount: number;          // 正确数量
}

/**
 * 练习进度接口
 */
export interface PracticeProgress {
  subjectId: string;             // 科目ID
  totalCount: number;            // 总题数
  doneCount: number;             // 已做题数
  correctCount: number;          // 正确数
  lastQuestionIndex: number;     // 最后做题位置
}

/**
 * 用户设置接口
 */
export interface UserSettings {
  themeMode: string;             // 主题模式: light/dark/auto
  fontSize: number;              // 字体大小倍率
  showAnswerAfterSubmit: boolean; // 答题后立即显示答案
  dailyGoal: number;             // 每日目标题数
  enableReminder: boolean;       // 启用提醒
  reminderTime: string;          // 提醒时间 HH:mm
}
