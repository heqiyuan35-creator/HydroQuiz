/**
 * 卡片系统类型定义
 * HydroQuiz - 水利工程检测员刷题宝
 */

/**
 * 卡片稀有度枚举
 */
export enum CardRarity {
  N = 'N',      // 普通 - 70%
  R = 'R',      // 稀有 - 20%
  SR = 'SR',    // 史诗 - 8%
  SSR = 'SSR'   // 传说 - 2%
}

/**
 * 卡片内容类型枚举
 */
export enum CardContentType {
  KNOWLEDGE = 'knowledge',    // 知识点
  QUOTE = 'quote',            // 名人名言
  TRIVIA = 'trivia',          // 趣味知识
  SPECIAL = 'special'         // 特殊限定
}

/**
 * 稀有度掉落概率配置
 */
export const RARITY_DROP_RATES: Map<CardRarity, number> = new Map([
  [CardRarity.N, 0.70],
  [CardRarity.R, 0.20],
  [CardRarity.SR, 0.08],
  [CardRarity.SSR, 0.02]
]);

/**
 * 碎片升星所需数量
 * 索引对应当前星级，值为升级到下一星级所需碎片数
 * 1→2星需2碎片，2→3星需4碎片，3→4星需8碎片，4→5星需16碎片
 */
export const FRAGMENTS_FOR_UPGRADE: number[] = [0, 2, 4, 8, 16];

/**
 * 掉落概率配置
 */
export const DROP_RATE_CORRECT: number = 0.30;    // 答对掉落概率 30%
export const DROP_RATE_WRONG: number = 0.10;      // 答错掉落概率 10%
export const PITY_THRESHOLD: number = 20;          // 保底阈值，连续20次不掉落后必掉

/**
 * 知识卡片定义接口
 */
export interface KnowledgeCard {
  id: string;                     // 卡片ID，格式：{科目}_{序号}_{稀有度}
  name: string;                   // 卡片名称
  rarity: CardRarity;             // 稀有度
  subjectId: string;              // 所属科目ID
  contentType: CardContentType;   // 内容类型
  frontImage: string;             // 卡面图案资源路径
  backContent: string;            // 背面知识内容
  questionAnalysis: string;       // 题目解析（核心学习内容）
  relatedQuestionId?: string;     // 关联的题目ID（可选）
  correctAnswer?: string;         // 正确答案（关联题目时）
  memoryTip?: string;             // 记忆口诀（知识点类型）
  author?: string;                // 作者（名言类型）
  examPoint?: string;             // 考点提示
  isLimited: boolean;             // 是否限定卡
  limitedStartTime?: number;      // 限定开始时间
  limitedEndTime?: number;        // 限定结束时间
}


/**
 * 用户卡片数据接口
 */
export interface UserCard {
  id: string;                     // 记录ID
  cardId: string;                 // 卡片定义ID
  starLevel: number;              // 星级 1-5
  fragments: number;              // 当前碎片数
  firstObtainTime: number;        // 首次获取时间
  lastObtainTime: number;         // 最后获取时间
  obtainCount: number;            // 总获取次数
}

/**
 * 掉落的卡片接口
 */
export interface DroppedCard {
  card: KnowledgeCard;            // 掉落的卡片
  isNew: boolean;                 // 是否首次获得
  fragmentCount: number;          // 如果是重复卡，获得的碎片数量
}

/**
 * 添加卡片结果接口
 */
export interface AddCardResult {
  isNew: boolean;                 // 是否新卡
  card: UserCard;                 // 用户卡片数据
  fragmentsAdded: number;         // 新增碎片数（重复卡时）
  didUpgrade: boolean;            // 是否触发自动升级
  newStarLevel: number;           // 升级后的星级
}

/**
 * 稀有度进度接口
 */
export interface RarityProgress {
  total: number;                  // 该稀有度总卡片数
  collected: number;              // 已收集数
}

/**
 * 科目进度接口
 */
export interface SubjectProgress {
  subjectId: string;              // 科目ID
  subjectName: string;            // 科目名称
  total: number;                  // 该科目总卡片数
  collected: number;              // 已收集数
}

/**
 * 收集进度接口
 */
export interface CollectionProgress {
  total: number;                  // 总卡片数
  collected: number;              // 已收集数
  byRarity: Map<CardRarity, RarityProgress>;    // 按稀有度统计
  bySubject: Map<string, SubjectProgress>;      // 按科目统计
}

/**
 * 卡片筛选条件接口
 */
export interface CardFilter {
  rarity?: CardRarity;            // 稀有度筛选
  subjectId?: string;             // 科目筛选
  starLevel?: number;             // 星级筛选
  sortBy?: 'time' | 'rarity' | 'star' | 'subject';  // 排序方式
  sortOrder?: 'asc' | 'desc';     // 排序顺序
}

/**
 * 掉落来源接口
 */
export interface DropSource {
  questionId: string;             // 题目ID
  subjectId: string;              // 科目ID
  mode: string;                   // 练习模式
}

/**
 * 掉落统计接口
 */
export interface DropStatistics {
  totalDrops: number;             // 总掉落次数
  byRarity: Map<CardRarity, number>;  // 按稀有度统计
  luckValue: number;              // 欧气值
}

/**
 * 掉落记录接口
 */
export interface DroppedCardRecord {
  id: string;                     // 记录ID
  cardId: string;                 // 卡片ID
  cardName: string;               // 卡片名称
  rarity: CardRarity;             // 稀有度
  dropTime: number;               // 掉落时间
  source: DropSource;             // 掉落来源
  isNew: boolean;                 // 是否新卡
}

/**
 * 掉落状态接口
 */
export interface CardDropState {
  pityCount: number;              // 保底计数（连续未掉落次数）
  lastDropTime: number;           // 上次掉落时间
  totalDrops: number;             // 总掉落次数
  totalAnswers: number;           // 总答题次数（用于新手保护）
}
