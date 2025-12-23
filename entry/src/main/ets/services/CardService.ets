/**
 * 卡片管理服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { databaseService } from '../data/database/DatabaseService';
import { Logger } from '../common/utils/Logger';
import {
  KnowledgeCard,
  CardRarity,
  UserCard,
  AddCardResult,
  CollectionProgress,
  RarityProgress,
  SubjectProgress,
  CardFilter,
  FRAGMENTS_FOR_UPGRADE
} from '../common/types/CardTypes';
import { getAllCardDefinitions, getCardById, getCardCountByRarity, getCardCountBySubject } from '../data/cards/CardDefinitions';

/**
 * 卡片管理服务类
 */
class CardService {
  /**
   * 获取所有卡片定义
   */
  getAllCardDefinitions(): KnowledgeCard[] {
    return getAllCardDefinitions();
  }

  /**
   * 根据ID获取卡片定义
   */
  getCardById(cardId: string): KnowledgeCard | undefined {
    return getCardById(cardId);
  }

  /**
   * 获取用户拥有的所有卡片
   */
  async getUserCards(): Promise<UserCard[]> {
    if (!databaseService.isReady()) {
      return [];
    }

    try {
      const store = databaseService.getStore();
      const resultSet = await store.querySql(
        'SELECT * FROM user_cards ORDER BY last_obtain_time DESC'
      );

      const cards: UserCard[] = [];
      while (resultSet.goToNextRow()) {
        cards.push({
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          cardId: resultSet.getString(resultSet.getColumnIndex('card_id')),
          starLevel: resultSet.getLong(resultSet.getColumnIndex('star_level')),
          fragments: resultSet.getLong(resultSet.getColumnIndex('fragments')),
          firstObtainTime: resultSet.getLong(resultSet.getColumnIndex('first_obtain_time')),
          lastObtainTime: resultSet.getLong(resultSet.getColumnIndex('last_obtain_time')),
          obtainCount: resultSet.getLong(resultSet.getColumnIndex('obtain_count'))
        });
      }
      resultSet.close();
      return cards;

    } catch (error) {
      Logger.error('[CardService] getUserCards failed', error as Error);
      return [];
    }
  }

  /**
   * 添加卡片到用户收藏
   */
  async addCardToUser(cardId: string): Promise<AddCardResult> {
    const defaultResult: AddCardResult = {
      isNew: false,
      card: { id: '', cardId: '', starLevel: 1, fragments: 0, firstObtainTime: 0, lastObtainTime: 0, obtainCount: 0 },
      fragmentsAdded: 0,
      didUpgrade: false,
      newStarLevel: 1
    };

    if (!databaseService.isReady()) {
      return defaultResult;
    }

    try {
      const store = databaseService.getStore();
      const now = Date.now();

      // 检查是否已拥有该卡片
      const existingCard = await this.getUserCardByCardId(cardId);

      if (existingCard) {
        // 重复卡片，转化为碎片
        const fragmentsToAdd = this.getFragmentsForDuplicate(existingCard.starLevel);
        const newFragments = existingCard.fragments + fragmentsToAdd;
        
        // 检查是否可以升级
        let newStarLevel = existingCard.starLevel;
        let didUpgrade = false;
        let remainingFragments = newFragments;

        if (existingCard.starLevel < 5) {
          const requiredFragments = FRAGMENTS_FOR_UPGRADE[existingCard.starLevel];
          if (newFragments >= requiredFragments) {
            newStarLevel = existingCard.starLevel + 1;
            remainingFragments = newFragments - requiredFragments;
            didUpgrade = true;
          }
        }

        // 更新数据库
        await store.executeSql(
          `UPDATE user_cards SET 
            fragments = ?, 
            star_level = ?, 
            last_obtain_time = ?, 
            obtain_count = obtain_count + 1 
           WHERE card_id = ?`,
          [remainingFragments, newStarLevel, now, cardId]
        );

        const updatedCard: UserCard = {
          id: existingCard.id,
          cardId: existingCard.cardId,
          fragments: remainingFragments,
          starLevel: newStarLevel,
          firstObtainTime: existingCard.firstObtainTime,
          lastObtainTime: now,
          obtainCount: existingCard.obtainCount + 1
        };

        return {
          isNew: false,
          card: updatedCard,
          fragmentsAdded: fragmentsToAdd,
          didUpgrade: didUpgrade,
          newStarLevel: newStarLevel
        };

      } else {
        // 新卡片
        const id = `card_${now}_${Math.random().toString(36).substr(2, 9)}`;
        await store.executeSql(
          `INSERT INTO user_cards (id, card_id, star_level, fragments, first_obtain_time, last_obtain_time, obtain_count)
           VALUES (?, ?, 1, 0, ?, ?, 1)`,
          [id, cardId, now, now]
        );

        const newCard: UserCard = {
          id: id,
          cardId: cardId,
          starLevel: 1,
          fragments: 0,
          firstObtainTime: now,
          lastObtainTime: now,
          obtainCount: 1
        };

        return {
          isNew: true,
          card: newCard,
          fragmentsAdded: 0,
          didUpgrade: false,
          newStarLevel: 1
        };
      }

    } catch (error) {
      Logger.error('[CardService] addCardToUser failed', error as Error);
      return defaultResult;
    }
  }


  /**
   * 根据卡片ID获取用户卡片
   */
  private async getUserCardByCardId(cardId: string): Promise<UserCard | null> {
    if (!databaseService.isReady()) {
      return null;
    }

    try {
      const store = databaseService.getStore();
      const resultSet = await store.querySql(
        'SELECT * FROM user_cards WHERE card_id = ?',
        [cardId]
      );

      if (resultSet.goToFirstRow()) {
        const card: UserCard = {
          id: resultSet.getString(resultSet.getColumnIndex('id')),
          cardId: resultSet.getString(resultSet.getColumnIndex('card_id')),
          starLevel: resultSet.getLong(resultSet.getColumnIndex('star_level')),
          fragments: resultSet.getLong(resultSet.getColumnIndex('fragments')),
          firstObtainTime: resultSet.getLong(resultSet.getColumnIndex('first_obtain_time')),
          lastObtainTime: resultSet.getLong(resultSet.getColumnIndex('last_obtain_time')),
          obtainCount: resultSet.getLong(resultSet.getColumnIndex('obtain_count'))
        };
        resultSet.close();
        return card;
      }
      resultSet.close();
      return null;

    } catch (error) {
      Logger.error('[CardService] getUserCardByCardId failed', error as Error);
      return null;
    }
  }

  /**
   * 获取重复卡片转化的碎片数量
   */
  private getFragmentsForDuplicate(currentStarLevel: number): number {
    // 星级越高，重复卡获得的碎片越多
    return Math.max(1, currentStarLevel);
  }

  /**
   * 获取卡片收集进度
   */
  async getCollectionProgress(): Promise<CollectionProgress> {
    const allCards = getAllCardDefinitions();
    const userCards = await this.getUserCards();
    const collectedCardIds = new Set<string>();
    for (const uc of userCards) {
      collectedCardIds.add(uc.cardId);
    }

    // 按稀有度统计
    const byRarity = new Map<CardRarity, RarityProgress>();
    const rarityCount = getCardCountByRarity();
    const rarityEntries = rarityCount.entries();
    let rarityEntry = rarityEntries.next();
    while (!rarityEntry.done) {
      const rarity = rarityEntry.value[0];
      const total = rarityEntry.value[1];
      const collected = allCards.filter(c => c.rarity === rarity && collectedCardIds.has(c.id)).length;
      byRarity.set(rarity, { total: total, collected: collected });
      rarityEntry = rarityEntries.next();
    }

    // 按科目统计
    const bySubject = new Map<string, SubjectProgress>();
    const subjectCount = getCardCountBySubject();
    const subjectNames: Map<string, string> = new Map<string, string>();
    subjectNames.set('basic', '基础知识');
    subjectNames.set('concrete', '混凝土工程');
    subjectNames.set('geotechnical', '岩土工程');
    subjectNames.set('measurement', '量测');
    subjectNames.set('metal', '金属结构');
    subjectNames.set('mechanical', '机械电气');
    subjectNames.set('special', '特殊卡片');

    const subjectEntries = subjectCount.entries();
    let subjectEntry = subjectEntries.next();
    while (!subjectEntry.done) {
      const subjectId = subjectEntry.value[0];
      const total = subjectEntry.value[1];
      const collected = allCards.filter(c => c.subjectId === subjectId && collectedCardIds.has(c.id)).length;
      const progress: SubjectProgress = {
        subjectId: subjectId,
        subjectName: subjectNames.get(subjectId) || subjectId,
        total: total,
        collected: collected
      };
      bySubject.set(subjectId, progress);
      subjectEntry = subjectEntries.next();
    }

    return {
      total: allCards.length,
      collected: collectedCardIds.size,
      byRarity,
      bySubject
    };
  }

  /**
   * 按条件筛选用户卡片
   */
  async filterUserCards(filter: CardFilter): Promise<UserCard[]> {
    let userCards = await this.getUserCards();
    const allCardDefs = getAllCardDefinitions();
    const cardDefMap = new Map(allCardDefs.map(c => [c.id, c]));

    // 筛选
    if (filter.rarity) {
      userCards = userCards.filter(uc => {
        const def = cardDefMap.get(uc.cardId);
        return def && def.rarity === filter.rarity;
      });
    }

    if (filter.subjectId) {
      userCards = userCards.filter(uc => {
        const def = cardDefMap.get(uc.cardId);
        return def && def.subjectId === filter.subjectId;
      });
    }

    if (filter.starLevel !== undefined) {
      userCards = userCards.filter(uc => uc.starLevel === filter.starLevel);
    }

    // 排序
    const sortOrder = filter.sortOrder === 'asc' ? 1 : -1;
    switch (filter.sortBy) {
      case 'time':
        userCards.sort((a, b) => (b.lastObtainTime - a.lastObtainTime) * sortOrder);
        break;
      case 'rarity':
        const rarityOrder: Record<string, number> = { 'N': 1, 'R': 2, 'SR': 3, 'SSR': 4 };
        userCards.sort((a, b) => {
          const defA = cardDefMap.get(a.cardId);
          const defB = cardDefMap.get(b.cardId);
          const orderA = defA ? rarityOrder[defA.rarity] || 0 : 0;
          const orderB = defB ? rarityOrder[defB.rarity] || 0 : 0;
          return (orderB - orderA) * sortOrder;
        });
        break;
      case 'star':
        userCards.sort((a, b) => (b.starLevel - a.starLevel) * sortOrder);
        break;
      case 'subject':
        userCards.sort((a, b) => {
          const defA = cardDefMap.get(a.cardId);
          const defB = cardDefMap.get(b.cardId);
          const subjectA = defA?.subjectId || '';
          const subjectB = defB?.subjectId || '';
          return subjectA.localeCompare(subjectB) * sortOrder;
        });
        break;
      default:
        // 默认按时间倒序
        userCards.sort((a, b) => b.lastObtainTime - a.lastObtainTime);
    }

    return userCards;
  }

  /**
   * 检查卡片是否可升级
   */
  async canUpgrade(cardId: string): Promise<boolean> {
    const userCard = await this.getUserCardByCardId(cardId);
    if (!userCard || userCard.starLevel >= 5) {
      return false;
    }
    const requiredFragments = FRAGMENTS_FOR_UPGRADE[userCard.starLevel];
    return userCard.fragments >= requiredFragments;
  }

  /**
   * 手动升级卡片
   */
  async upgradeCard(cardId: string): Promise<boolean> {
    if (!databaseService.isReady()) {
      return false;
    }

    const userCard = await this.getUserCardByCardId(cardId);
    if (!userCard || userCard.starLevel >= 5) {
      return false;
    }

    const requiredFragments = FRAGMENTS_FOR_UPGRADE[userCard.starLevel];
    if (userCard.fragments < requiredFragments) {
      return false;
    }

    try {
      const store = databaseService.getStore();
      await store.executeSql(
        'UPDATE user_cards SET star_level = star_level + 1, fragments = fragments - ? WHERE card_id = ?',
        [requiredFragments, cardId]
      );
      return true;
    } catch (error) {
      Logger.error('[CardService] upgradeCard failed', error as Error);
      return false;
    }
  }

  /**
   * 获取用户卡片数量
   */
  async getUserCardCount(): Promise<number> {
    const cards = await this.getUserCards();
    return cards.length;
  }

  /**
   * 检查用户是否拥有某张卡片
   */
  async hasCard(cardId: string): Promise<boolean> {
    const card = await this.getUserCardByCardId(cardId);
    return card !== null;
  }
}

export const cardService = new CardService();
