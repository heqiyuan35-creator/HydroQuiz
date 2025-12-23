/**
 * 卡片掉落判定服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { databaseService } from '../data/database/DatabaseService';
import { Logger } from '../common/utils/Logger';
import {
  KnowledgeCard,
  CardRarity,
  DroppedCard,
  CardDropState,
  DropSource,
  RARITY_DROP_RATES,
  DROP_RATE_CORRECT,
  DROP_RATE_WRONG,
  PITY_THRESHOLD
} from '../common/types/CardTypes';
import { getCardPoolByRarity, getCardById, getAvailableCardPool } from '../data/cards/CardDefinitions';
import { cardService } from './CardService';

/**
 * 卡片掉落判定服务类
 */
class CardDropService {
  private readonly STATE_ID = 'default_state';

  /**
   * 答题后触发掉落判定
   * @param isCorrect 是否答对
   * @param isExamMode 是否考试模式
   * @param source 掉落来源信息
   * @returns 掉落的卡片，null表示未掉落
   */
  async tryDrop(isCorrect: boolean, isExamMode: boolean, source?: DropSource): Promise<DroppedCard | null> {
    // 考试模式不触发掉落
    if (isExamMode) {
      Logger.info('[CardDropService] Exam mode, skip drop');
      return null;
    }

    try {
      // 获取当前掉落状态
      const state = await this.getDropState();
      
      // 先增加答题次数
      const currentAnswers = state.totalAnswers + 1;
      
      // 计算当前掉落概率（传入总掉落次数和总答题次数用于新手保护判断）
      const dropRate = this.calculateDropRate(isCorrect, state.pityCount, state.totalDrops, currentAnswers);
      
      // 随机判定是否掉落
      const random = Math.random();
      const shouldDrop = random < dropRate;
      
      Logger.info(`[CardDropService] Drop check: rate=${dropRate}, random=${random}, shouldDrop=${shouldDrop}, totalDrops=${state.totalDrops}, totalAnswers=${currentAnswers}`);
      
      if (!shouldDrop) {
        // 未掉落，增加保底计数和答题次数
        await this.incrementPityCount(state);
        await this.incrementAnswerCount();
        return null;
      }
      
      // 触发掉落，选择卡片
      const card = this.selectCard();
      if (!card) {
        Logger.warn('[CardDropService] No available card to drop');
        await this.incrementAnswerCount();
        return null;
      }
      
      // 添加卡片到用户收藏
      const addResult = await cardService.addCardToUser(card.id);
      
      // 重置保底计数并记录掉落，同时增加答题次数
      await this.resetPityCountAndIncrementAnswers();
      await this.recordDrop(card.id, source, addResult.isNew);
      
      const droppedCard: DroppedCard = {
        card: card,
        isNew: addResult.isNew,
        fragmentCount: addResult.fragmentsAdded
      };
      
      Logger.info(`[CardDropService] Card dropped: ${card.name}, isNew=${addResult.isNew}`);
      return droppedCard;
      
    } catch (error) {
      Logger.error('[CardDropService] tryDrop failed', error as Error);
      return null;
    }
  }

  /**
   * 计算当前掉落概率（考虑保底加成和新手保护）
   * @param isCorrect 是否答对
   * @param pityCount 保底计数（连续未掉落次数）
   * @param totalDrops 总掉落次数
   * @param totalAnswers 总答题次数
   */
  private calculateDropRate(isCorrect: boolean, pityCount: number, totalDrops: number = 0, totalAnswers: number = 0): number {
    // 新手保护：前10次答题内如果还没掉过卡，第10次必定掉落
    // 即：前10次答题保底至少出1张卡
    if (totalDrops === 0 && totalAnswers >= 9) {
      // 第10次答题，还没掉过卡，必定掉落
      return 1.0;
    }
    
    // 基础概率
    let baseRate = isCorrect ? DROP_RATE_CORRECT : DROP_RATE_WRONG;
    
    // 保底机制：连续20次未掉落后必掉
    if (pityCount >= PITY_THRESHOLD) {
      return 1.0;
    }
    
    // 接近保底时逐渐提高概率（软保底）
    if (pityCount >= PITY_THRESHOLD - 5) {
      const bonus = (pityCount - (PITY_THRESHOLD - 5)) * 0.1;
      baseRate = Math.min(1.0, baseRate + bonus);
    }
    
    return baseRate;
  }

  /**
   * 根据稀有度概率选择卡片
   */
  private selectCard(): KnowledgeCard | null {
    // 先确定稀有度
    const rarity = this.selectRarity();
    
    // 从该稀有度卡池中随机选择
    const pool = getCardPoolByRarity(rarity);
    if (pool.length === 0) {
      // 如果该稀有度没有可用卡片，降级选择
      Logger.warn(`[CardDropService] No cards available for rarity ${rarity}, fallback to N`);
      const fallbackPool = getCardPoolByRarity(CardRarity.N);
      if (fallbackPool.length === 0) {
        return null;
      }
      return fallbackPool[Math.floor(Math.random() * fallbackPool.length)];
    }
    
    return pool[Math.floor(Math.random() * pool.length)];
  }


  /**
   * 根据概率选择稀有度
   */
  private selectRarity(): CardRarity {
    const random = Math.random();
    let cumulative = 0;
    
    // 按概率累积选择
    const rarities: CardRarity[] = [CardRarity.N, CardRarity.R, CardRarity.SR, CardRarity.SSR];
    for (const rarity of rarities) {
      cumulative += RARITY_DROP_RATES.get(rarity) || 0;
      if (random < cumulative) {
        return rarity;
      }
    }
    
    // 默认返回N
    return CardRarity.N;
  }

  /**
   * 获取当前保底计数
   */
  async getPityCount(): Promise<number> {
    const state = await this.getDropState();
    return state.pityCount;
  }

  /**
   * 获取当前掉落概率
   */
  async getCurrentDropRate(isCorrect: boolean): Promise<number> {
    const state = await this.getDropState();
    return this.calculateDropRate(isCorrect, state.pityCount, state.totalDrops);
  }

  /**
   * 获取掉落状态
   */
  private async getDropState(): Promise<CardDropState> {
    if (!databaseService.isReady()) {
      return { pityCount: 0, lastDropTime: 0, totalDrops: 0, totalAnswers: 0 };
    }

    try {
      const store = databaseService.getStore();
      const resultSet = await store.querySql(
        'SELECT pity_count, last_drop_time, total_drops, total_answers FROM card_drop_state WHERE id = ?',
        [this.STATE_ID]
      );

      if (resultSet.goToFirstRow()) {
        const totalAnswersIndex = resultSet.getColumnIndex('total_answers');
        const state: CardDropState = {
          pityCount: resultSet.getLong(resultSet.getColumnIndex('pity_count')),
          lastDropTime: resultSet.getLong(resultSet.getColumnIndex('last_drop_time')),
          totalDrops: resultSet.getLong(resultSet.getColumnIndex('total_drops')),
          totalAnswers: totalAnswersIndex >= 0 ? resultSet.getLong(totalAnswersIndex) : 0
        };
        resultSet.close();
        return state;
      }
      resultSet.close();

      // 初始化状态记录
      await this.initDropState();
      return { pityCount: 0, lastDropTime: 0, totalDrops: 0, totalAnswers: 0 };

    } catch (error) {
      Logger.error('[CardDropService] getDropState failed', error as Error);
      return { pityCount: 0, lastDropTime: 0, totalDrops: 0, totalAnswers: 0 };
    }
  }

  /**
   * 初始化掉落状态
   */
  private async initDropState(): Promise<void> {
    if (!databaseService.isReady()) return;

    try {
      const store = databaseService.getStore();
      await store.executeSql(
        'INSERT OR IGNORE INTO card_drop_state (id, pity_count, last_drop_time, total_drops, total_answers) VALUES (?, 0, 0, 0, 0)',
        [this.STATE_ID]
      );
    } catch (error) {
      Logger.error('[CardDropService] initDropState failed', error as Error);
    }
  }

  /**
   * 增加保底计数
   */
  private async incrementPityCount(currentState: CardDropState): Promise<void> {
    if (!databaseService.isReady()) return;

    try {
      const store = databaseService.getStore();
      const newCount = Math.min(currentState.pityCount + 1, 100); // 防止溢出
      await store.executeSql(
        'UPDATE card_drop_state SET pity_count = ? WHERE id = ?',
        [newCount, this.STATE_ID]
      );
    } catch (error) {
      Logger.error('[CardDropService] incrementPityCount failed', error as Error);
    }
  }

  /**
   * 重置保底计数并增加答题次数
   */
  async resetPityCountAndIncrementAnswers(): Promise<void> {
    if (!databaseService.isReady()) return;

    try {
      const store = databaseService.getStore();
      await store.executeSql(
        'UPDATE card_drop_state SET pity_count = 0, last_drop_time = ?, total_drops = total_drops + 1, total_answers = total_answers + 1 WHERE id = ?',
        [Date.now(), this.STATE_ID]
      );
    } catch (error) {
      Logger.error('[CardDropService] resetPityCountAndIncrementAnswers failed', error as Error);
    }
  }

  /**
   * 仅增加答题次数（未掉落时）
   */
  private async incrementAnswerCount(): Promise<void> {
    if (!databaseService.isReady()) return;

    try {
      const store = databaseService.getStore();
      await store.executeSql(
        'UPDATE card_drop_state SET total_answers = total_answers + 1 WHERE id = ?',
        [this.STATE_ID]
      );
    } catch (error) {
      Logger.error('[CardDropService] incrementAnswerCount failed', error as Error);
    }
  }

  /**
   * 重置保底计数（保留用于兼容）
   */
  async resetPityCount(): Promise<void> {
    await this.resetPityCountAndIncrementAnswers();
  }

  /**
   * 记录掉落
   */
  private async recordDrop(cardId: string, source?: DropSource, isNew: boolean = false): Promise<void> {
    if (!databaseService.isReady()) return;

    try {
      const store = databaseService.getStore();
      const id = `drop_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
      await store.executeSql(
        `INSERT INTO card_drop_records (id, card_id, drop_time, question_id, subject_id, practice_mode, is_new)
         VALUES (?, ?, ?, ?, ?, ?, ?)`,
        [
          id,
          cardId,
          Date.now(),
          source?.questionId || '',
          source?.subjectId || '',
          source?.mode || '',
          isNew ? 1 : 0
        ]
      );
    } catch (error) {
      Logger.error('[CardDropService] recordDrop failed', error as Error);
    }
  }

  /**
   * 获取总掉落次数
   */
  async getTotalDrops(): Promise<number> {
    const state = await this.getDropState();
    return state.totalDrops;
  }
}

export const cardDropService = new CardDropService();
