/**
 * 卡片统计服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { databaseService } from '../data/database/DatabaseService';
import { Logger } from '../common/utils/Logger';
import {
  CardRarity,
  DropSource,
  DropStatistics,
  DroppedCardRecord
} from '../common/types/CardTypes';
import { getCardById } from '../data/cards/CardDefinitions';

/**
 * 卡片统计服务类
 */
class CardStatisticsService {
  /**
   * 获取掉落统计
   */
  async getDropStatistics(): Promise<DropStatistics> {
    const defaultStats: DropStatistics = {
      totalDrops: 0,
      byRarity: new Map([
        [CardRarity.N, 0],
        [CardRarity.R, 0],
        [CardRarity.SR, 0],
        [CardRarity.SSR, 0]
      ]),
      luckValue: 50
    };

    if (!databaseService.isReady()) {
      return defaultStats;
    }

    try {
      const store = databaseService.getStore();
      
      // 获取总掉落次数
      const totalResult = await store.querySql('SELECT COUNT(*) as count FROM card_drop_records');
      let totalDrops = 0;
      if (totalResult.goToFirstRow()) {
        totalDrops = totalResult.getLong(totalResult.getColumnIndex('count'));
      }
      totalResult.close();

      // 获取各稀有度掉落次数
      const byRarity = new Map<CardRarity, number>([
        [CardRarity.N, 0],
        [CardRarity.R, 0],
        [CardRarity.SR, 0],
        [CardRarity.SSR, 0]
      ]);

      const recordsResult = await store.querySql('SELECT card_id FROM card_drop_records');
      while (recordsResult.goToNextRow()) {
        const cardId = recordsResult.getString(recordsResult.getColumnIndex('card_id'));
        const cardDef = getCardById(cardId);
        if (cardDef) {
          const current = byRarity.get(cardDef.rarity) || 0;
          byRarity.set(cardDef.rarity, current + 1);
        }
      }
      recordsResult.close();

      // 计算欧气值
      const luckValue = this.calculateLuckValueFromStats(totalDrops, byRarity);

      return {
        totalDrops,
        byRarity,
        luckValue
      };

    } catch (error) {
      Logger.error('[CardStatisticsService] getDropStatistics failed', error as Error);
      return defaultStats;
    }
  }

  /**
   * 获取今日掉落的卡片
   */
  async getTodayDroppedCards(): Promise<DroppedCardRecord[]> {
    if (!databaseService.isReady()) {
      return [];
    }

    try {
      const store = databaseService.getStore();
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      const todayStart = today.getTime();

      const resultSet = await store.querySql(
        `SELECT * FROM card_drop_records WHERE drop_time >= ? ORDER BY drop_time DESC`,
        [todayStart]
      );

      const records: DroppedCardRecord[] = [];
      while (resultSet.goToNextRow()) {
        const cardId = resultSet.getString(resultSet.getColumnIndex('card_id'));
        const cardDef = getCardById(cardId);
        
        records.push({
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          cardId: cardId,
          cardName: cardDef?.name || '未知卡片',
          rarity: cardDef?.rarity || CardRarity.N,
          dropTime: resultSet.getLong(resultSet.getColumnIndex('drop_time')),
          source: {
            questionId: resultSet.getString(resultSet.getColumnIndex('question_id')),
            subjectId: resultSet.getString(resultSet.getColumnIndex('subject_id')),
            mode: resultSet.getString(resultSet.getColumnIndex('practice_mode'))
          },
          isNew: resultSet.getLong(resultSet.getColumnIndex('is_new')) === 1
        });
      }
      resultSet.close();
      return records;

    } catch (error) {
      Logger.error('[CardStatisticsService] getTodayDroppedCards failed', error as Error);
      return [];
    }
  }

  /**
   * 获取SSR获取记录
   */
  async getSSRRecords(): Promise<DroppedCardRecord[]> {
    if (!databaseService.isReady()) {
      return [];
    }

    try {
      const store = databaseService.getStore();
      const resultSet = await store.querySql(
        'SELECT * FROM card_drop_records ORDER BY drop_time DESC'
      );

      const records: DroppedCardRecord[] = [];
      while (resultSet.goToNextRow()) {
        const cardId = resultSet.getString(resultSet.getColumnIndex('card_id'));
        const cardDef = getCardById(cardId);
        
        // 只返回SSR卡片
        if (cardDef && cardDef.rarity === CardRarity.SSR) {
          records.push({
            id: resultSet.getString(resultSet.getColumnIndex('id')),
            cardId: cardId,
            cardName: cardDef.name,
            rarity: CardRarity.SSR,
            dropTime: resultSet.getLong(resultSet.getColumnIndex('drop_time')),
            source: {
              questionId: resultSet.getString(resultSet.getColumnIndex('question_id')),
              subjectId: resultSet.getString(resultSet.getColumnIndex('subject_id')),
              mode: resultSet.getString(resultSet.getColumnIndex('practice_mode'))
            },
            isNew: resultSet.getLong(resultSet.getColumnIndex('is_new')) === 1
          });
        }
      }
      resultSet.close();
      return records;

    } catch (error) {
      Logger.error('[CardStatisticsService] getSSRRecords failed', error as Error);
      return [];
    }
  }

  /**
   * 计算欧气值
   * 基于SSR获取率与期望值(2%)的对比
   * 返回0-100的值，50为平均水平
   */
  async calculateLuckValue(): Promise<number> {
    const stats = await this.getDropStatistics();
    return stats.luckValue;
  }

  /**
   * 根据统计数据计算欧气值
   */
  private calculateLuckValueFromStats(totalDrops: number, byRarity: Map<CardRarity, number>): number {
    if (totalDrops === 0) {
      return 50; // 没有数据时返回平均值
    }

    const ssrCount = byRarity.get(CardRarity.SSR) || 0;
    const actualSSRRate = ssrCount / totalDrops;
    const expectedSSRRate = 0.02; // 期望SSR率2%

    // 计算欧气值：实际率/期望率，然后映射到0-100
    // 如果实际率等于期望率，欧气值为50
    // 如果实际率是期望率的2倍，欧气值约为75
    // 如果实际率是期望率的一半，欧气值约为25
    const ratio = actualSSRRate / expectedSSRRate;
    
    // 使用对数映射，使分布更合理
    let luckValue: number;
    if (ratio <= 0) {
      luckValue = 0;
    } else {
      // 映射公式：50 + 25 * log2(ratio)，限制在0-100范围
      luckValue = 50 + 25 * Math.log2(ratio);
    }

    return Math.max(0, Math.min(100, Math.round(luckValue)));
  }

  /**
   * 获取掉落记录（分页）
   */
  async getDropRecords(limit: number = 50, offset: number = 0): Promise<DroppedCardRecord[]> {
    if (!databaseService.isReady()) {
      return [];
    }

    try {
      const store = databaseService.getStore();
      const resultSet = await store.querySql(
        `SELECT * FROM card_drop_records ORDER BY drop_time DESC LIMIT ? OFFSET ?`,
        [limit, offset]
      );

      const records: DroppedCardRecord[] = [];
      while (resultSet.goToNextRow()) {
        const cardId = resultSet.getString(resultSet.getColumnIndex('card_id'));
        const cardDef = getCardById(cardId);
        
        records.push({
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          cardId: cardId,
          cardName: cardDef?.name || '未知卡片',
          rarity: cardDef?.rarity || CardRarity.N,
          dropTime: resultSet.getLong(resultSet.getColumnIndex('drop_time')),
          source: {
            questionId: resultSet.getString(resultSet.getColumnIndex('question_id')),
            subjectId: resultSet.getString(resultSet.getColumnIndex('subject_id')),
            mode: resultSet.getString(resultSet.getColumnIndex('practice_mode'))
          },
          isNew: resultSet.getLong(resultSet.getColumnIndex('is_new')) === 1
        });
      }
      resultSet.close();
      return records;

    } catch (error) {
      Logger.error('[CardStatisticsService] getDropRecords failed', error as Error);
      return [];
    }
  }

  /**
   * 获取今日掉落卡片数量
   */
  async getTodayDropCount(): Promise<number> {
    const todayCards = await this.getTodayDroppedCards();
    return todayCards.length;
  }
}

export const cardStatisticsService = new CardStatisticsService();
