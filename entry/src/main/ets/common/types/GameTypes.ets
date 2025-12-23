/**
 * 闯关模式类型定义
 * HydroQuiz - 水利工程检测员刷题宝
 */

/**
 * 难度类型
 */
export type GameDifficulty = 'easy' | 'medium' | 'hard' | 'boss';

/**
 * 关卡数据模型
 */
export interface GameLevel {
  id: string;
  chapterId: string;
  levelNumber: number;
  name: string;
  description: string;
  questionCount: number;
  difficulty: GameDifficulty;
  requiredStars: number;      // 解锁所需星星数
  isUnlocked: boolean;
  bestStars: number;          // 最佳成绩 (0-3)
  bestScore: number;          // 最佳分数
  completedTimes: number;     // 完成次数
}

/**
 * 章节数据模型
 */
export interface GameChapter {
  id: string;
  subjectId: string;
  name: string;
  shortName: string;
  icon: string;
  color: string;
  levels: GameLevel[];
  totalStars: number;         // 总星星数
  earnedStars: number;        // 已获得星星数
  isUnlocked: boolean;
  order: number;
}

/**
 * 闯关进度记录
 */
export interface GameProgress {
  id: string;
  chapterId: string;
  levelId: string;
  bestStars: number;
  bestScore: number;
  completedTimes: number;
  lastPlayTime: number;
}

/**
 * 闯关结果
 */
export interface GameResult {
  levelId: string;
  chapterId: string;
  totalQuestions: number;
  correctCount: number;
  wrongCount: number;
  accuracy: number;
  stars: number;
  score: number;
  earnedPoints: number;
  isNewRecord: boolean;
  duration: number;
}

/**
 * 难度配置项接口
 */
export interface DifficultyConfigItem {
  name: string;
  color: string;
  icon: string;
}

/**
 * 获取难度配置
 */
export function getDifficultyConfig(difficulty: GameDifficulty): DifficultyConfigItem {
  switch (difficulty) {
    case 'easy':
      return { name: '简单', color: '#52C41A', icon: '🌱' };
    case 'medium':
      return { name: '中等', color: '#FAAD14', icon: '🔥' };
    case 'hard':
      return { name: '困难', color: '#FF4D4F', icon: '💪' };
    case 'boss':
      return { name: 'Boss', color: '#722ED1', icon: '👑' };
    default:
      return { name: '简单', color: '#52C41A', icon: '🌱' };
  }
}

/**
 * 根据正确率计算星级
 */
export function calculateStars(accuracy: number): number {
  if (accuracy >= 100) return 3;
  if (accuracy >= 80) return 2;
  if (accuracy >= 60) return 1;
  return 0;
}

/**
 * 根据星级计算积分
 */
export function calculateLevelPoints(stars: number): number {
  switch (stars) {
    case 3: return 30;
    case 2: return 20;
    case 1: return 10;
    default: return 0;
  }
}
