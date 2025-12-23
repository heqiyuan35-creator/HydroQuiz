/**
 * 闯关模式服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { preferences } from '@kit.ArkData';
import { Logger } from '../common/utils/Logger';
import { GameChapter, GameLevel, GameProgress, GameResult, calculateStars, calculateLevelPoints } from '../common/types/GameTypes';
import { GAME_CHAPTERS, getChapterById, getLevelById } from '../data/GameLevelData';

/**
 * 闯关模式服务类
 */
class GameService {
  private store: preferences.Preferences | null = null;
  private readonly STORE_NAME = 'game_progress_store';
  private readonly KEY_PROGRESS = 'game_progress';
  private readonly KEY_TOTAL_STARS = 'total_stars';

  /**
   * 初始化服务
   */
  async init(context: Context): Promise<void> {
    try {
      this.store = await preferences.getPreferences(context, this.STORE_NAME);
      Logger.info('[GameService] Initialized successfully');
    } catch (error) {
      Logger.error('[GameService] Init failed', error as Error);
    }
  }

  /**
   * 获取所有章节（带进度）
   */
  async getAllChapters(): Promise<GameChapter[]> {
    const chapters: GameChapter[] = [];

    for (const chapterDef of GAME_CHAPTERS) {
      const chapter = await this.getChapterWithProgress(chapterDef.id);
      if (chapter) {
        // 所有章节都解锁，让用户自由选择
        chapter.isUnlocked = true;
        chapters.push(chapter);
      }
    }

    return chapters;
  }

  /**
   * 获取章节（带进度）
   */
  async getChapterWithProgress(chapterId: string): Promise<GameChapter | null> {
    const chapterDef = getChapterById(chapterId);
    if (!chapterDef) return null;

    const levels: GameLevel[] = [];
    let earnedStars = 0;

    for (const levelDef of chapterDef.levels) {
      const progress = await this.getLevelProgress(levelDef.id);
      const bestStars = progress?.bestStars || 0;

      // 解锁逻辑：前3关默认解锁，后续关卡需要累计足够星星
      const isUnlocked = levelDef.levelNumber <= 3 || earnedStars >= levelDef.requiredStars;

      const level: GameLevel = {
        id: levelDef.id,
        chapterId: levelDef.chapterId,
        levelNumber: levelDef.levelNumber,
        name: levelDef.name,
        description: levelDef.description,
        questionCount: levelDef.questionCount,
        difficulty: levelDef.difficulty,
        requiredStars: levelDef.requiredStars,
        isUnlocked: isUnlocked,
        bestStars: bestStars,
        bestScore: progress?.bestScore || 0,
        completedTimes: progress?.completedTimes || 0
      };

      levels.push(level);
      earnedStars += bestStars;
    }

    const result: GameChapter = {
      id: chapterDef.id,
      subjectId: chapterDef.subjectId,
      name: chapterDef.name,
      shortName: chapterDef.shortName,
      icon: chapterDef.icon,
      color: chapterDef.color,
      levels: levels,
      totalStars: chapterDef.totalStars,
      earnedStars: earnedStars,
      isUnlocked: chapterDef.isUnlocked,
      order: chapterDef.order
    };

    return result;
  }

  /**
   * 获取关卡进度
   */
  async getLevelProgress(levelId: string): Promise<GameProgress | null> {
    if (!this.store) return null;
    try {
      const progressStr = await this.store.get(this.KEY_PROGRESS, '{}') as string;
      const allProgress: Record<string, GameProgress> = JSON.parse(progressStr);
      return allProgress[levelId] || null;
    } catch (error) {
      return null;
    }
  }

  /**
   * 保存关卡进度
   */
  async saveLevelProgress(result: GameResult): Promise<boolean> {
    if (!this.store) return false;

    try {
      const progressStr = await this.store.get(this.KEY_PROGRESS, '{}') as string;
      const allProgress: Record<string, GameProgress> = JSON.parse(progressStr);

      const existingProgress = allProgress[result.levelId];
      const isNewRecord = !existingProgress || result.stars > existingProgress.bestStars;

      const progress: GameProgress = {
        id: result.levelId,
        chapterId: result.chapterId,
        levelId: result.levelId,
        bestStars: Math.max(result.stars, existingProgress?.bestStars || 0),
        bestScore: Math.max(result.score, existingProgress?.bestScore || 0),
        completedTimes: (existingProgress?.completedTimes || 0) + 1,
        lastPlayTime: Date.now()
      };

      allProgress[result.levelId] = progress;
      await this.store.put(this.KEY_PROGRESS, JSON.stringify(allProgress));

      // 更新总星星数
      await this.updateTotalStars();

      await this.store.flush();

      Logger.info(`[GameService] Level progress saved: ${result.levelId}, stars: ${result.stars}`);
      return true;
    } catch (error) {
      Logger.error('[GameService] Save progress failed', error as Error);
      return false;
    }
  }

  /**
   * 更新总星星数
   */
  private async updateTotalStars(): Promise<void> {
    if (!this.store) return;
    try {
      const progressStr = await this.store.get(this.KEY_PROGRESS, '{}') as string;
      const allProgress: Record<string, GameProgress> = JSON.parse(progressStr);

      let totalStars = 0;
      for (const key of Object.keys(allProgress)) {
        totalStars += allProgress[key].bestStars;
      }

      await this.store.put(this.KEY_TOTAL_STARS, totalStars);
    } catch (error) {
      Logger.error('[GameService] Update total stars failed', error as Error);
    }
  }

  /**
   * 获取总星星数
   */
  async getTotalStars(): Promise<number> {
    if (!this.store) return 0;
    try {
      return await this.store.get(this.KEY_TOTAL_STARS, 0) as number;
    } catch (error) {
      return 0;
    }
  }

  /**
   * 获取总关卡数
   */
  getTotalLevels(): number {
    let total = 0;
    for (const chapter of GAME_CHAPTERS) {
      total += chapter.levels.length;
    }
    return total;
  }

  /**
   * 获取已完成关卡数
   */
  async getCompletedLevels(): Promise<number> {
    if (!this.store) return 0;
    try {
      const progressStr = await this.store.get(this.KEY_PROGRESS, '{}') as string;
      const allProgress: Record<string, GameProgress> = JSON.parse(progressStr);

      let completed = 0;
      for (const key of Object.keys(allProgress)) {
        if (allProgress[key].bestStars > 0) {
          completed++;
        }
      }
      return completed;
    } catch (error) {
      return 0;
    }
  }

  /**
   * 计算闯关结果
   */
  calculateResult(
    levelId: string,
    chapterId: string,
    totalQuestions: number,
    correctCount: number,
    duration: number
  ): GameResult {
    const wrongCount = totalQuestions - correctCount;
    const accuracy = totalQuestions > 0 ? (correctCount / totalQuestions) * 100 : 0;
    const stars = calculateStars(accuracy);
    const score = Math.round(accuracy);
    const earnedPoints = calculateLevelPoints(stars);

    return {
      levelId,
      chapterId,
      totalQuestions,
      correctCount,
      wrongCount,
      accuracy,
      stars,
      score,
      earnedPoints,
      isNewRecord: false,
      duration
    };
  }

  /**
   * 获取游戏统计
   */
  async getGameStats(): Promise<GameStats> {
    const totalStars = await this.getTotalStars();
    const completedLevels = await this.getCompletedLevels();
    const totalLevels = this.getTotalLevels();
    const maxStars = totalLevels * 3;

    return {
      totalStars,
      maxStars,
      completedLevels,
      totalLevels,
      progress: totalLevels > 0 ? (completedLevels / totalLevels) * 100 : 0
    };
  }
}

/**
 * 游戏统计
 */
export interface GameStats {
  totalStars: number;
  maxStars: number;
  completedLevels: number;
  totalLevels: number;
  progress: number;
}

export const gameService = new GameService();
