/**
 * 卡片定义数据管理
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeCard, CardRarity, CardContentType } from '../../common/types/CardTypes';
import { BasicCards } from './BasicCards';
import { ConcreteCards } from './ConcreteCards';
import { GeotechnicalCards } from './GeotechnicalCards';
import { MeasurementCards } from './MeasurementCards';
import { MetalCards } from './MetalCards';
import { MechanicalCards } from './MechanicalCards';
import { SpecialCards } from './SpecialCards';

/**
 * 所有卡片定义
 */
let allCards: KnowledgeCard[] = [];

/**
 * 初始化所有卡片数据
 */
function initAllCards(): void {
  if (allCards.length > 0) return;
  
  allCards = [
    ...BasicCards,
    ...ConcreteCards,
    ...GeotechnicalCards,
    ...MeasurementCards,
    ...MetalCards,
    ...MechanicalCards,
    ...SpecialCards
  ];
}

/**
 * 获取所有卡片定义
 */
export function getAllCardDefinitions(): KnowledgeCard[] {
  initAllCards();
  return allCards;
}

/**
 * 根据ID获取卡片定义
 */
export function getCardById(cardId: string): KnowledgeCard | undefined {
  initAllCards();
  return allCards.find(card => card.id === cardId);
}

/**
 * 根据稀有度获取卡片池
 */
export function getCardPoolByRarity(rarity: CardRarity): KnowledgeCard[] {
  initAllCards();
  const now = Date.now();
  return allCards.filter(card => {
    // 稀有度匹配
    if (card.rarity !== rarity) return false;
    // 限定卡时间检查
    if (card.isLimited) {
      if (card.limitedStartTime && now < card.limitedStartTime) return false;
      if (card.limitedEndTime && now > card.limitedEndTime) return false;
    }
    return true;
  });
}

/**
 * 根据科目获取卡片池
 */
export function getCardPoolBySubject(subjectId: string): KnowledgeCard[] {
  initAllCards();
  return allCards.filter(card => card.subjectId === subjectId);
}

/**
 * 获取当前可掉落的卡片池（排除过期限定卡）
 */
export function getAvailableCardPool(): KnowledgeCard[] {
  initAllCards();
  const now = Date.now();
  return allCards.filter(card => {
    if (!card.isLimited) return true;
    if (card.limitedStartTime && now < card.limitedStartTime) return false;
    if (card.limitedEndTime && now > card.limitedEndTime) return false;
    return true;
  });
}

/**
 * 获取各稀有度卡片数量统计
 */
export function getCardCountByRarity(): Map<CardRarity, number> {
  initAllCards();
  const countMap = new Map<CardRarity, number>();
  countMap.set(CardRarity.N, 0);
  countMap.set(CardRarity.R, 0);
  countMap.set(CardRarity.SR, 0);
  countMap.set(CardRarity.SSR, 0);
  
  for (const card of allCards) {
    const current = countMap.get(card.rarity) || 0;
    countMap.set(card.rarity, current + 1);
  }
  
  return countMap;
}

/**
 * 获取各科目卡片数量统计
 */
export function getCardCountBySubject(): Map<string, number> {
  initAllCards();
  const countMap = new Map<string, number>();
  
  for (const card of allCards) {
    const current = countMap.get(card.subjectId) || 0;
    countMap.set(card.subjectId, current + 1);
  }
  
  return countMap;
}
