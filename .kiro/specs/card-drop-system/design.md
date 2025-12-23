# 答题卡片掉落系统 - 设计文档

## Overview

本设计文档描述答题卡片掉落系统的技术架构和实现方案。该系统为水利工程检测员刷题宝增加类似游戏"开箱"的惊喜机制，用户在答题过程中有概率获得知识卡片，增加刷题的趣味性和期待感。

系统采用分层架构设计：
- **数据层**：卡片定义数据、用户卡片收藏数据、掉落记录数据
- **服务层**：掉落判定服务、卡片管理服务、统计服务
- **展示层**：掉落动画组件、卡片图鉴页面、卡册页面

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        展示层 (UI)                           │
├─────────────┬─────────────┬─────────────┬──────────────────┤
│ CardDropAnim│ CardCollect │ CardAlbum   │ CardDropPopup    │
│ (掉落动画)   │ (卡片图鉴)   │ (我的卡册)   │ (掉落弹窗)        │
└──────┬──────┴──────┬──────┴──────┬──────┴────────┬─────────┘
       │             │             │               │
┌──────▼─────────────▼─────────────▼───────────────▼─────────┐
│                       服务层 (Services)                      │
├─────────────────┬─────────────────┬────────────────────────┤
│ CardDropService │ CardService     │ CardStatisticsService  │
│ (掉落判定)       │ (卡片管理)       │ (统计服务)              │
└────────┬────────┴────────┬────────┴───────────┬────────────┘
         │                 │                    │
┌────────▼─────────────────▼────────────────────▼────────────┐
│                       数据层 (Data)                          │
├─────────────────┬─────────────────┬────────────────────────┤
│ KnowledgeCard   │ user_cards      │ card_drop_records      │
│ Data (卡片定义)  │ (用户卡片表)     │ (掉落记录表)            │
└─────────────────┴─────────────────┴────────────────────────┘
```

## Components and Interfaces

### 1. CardDropService - 卡片掉落判定服务

负责答题后的掉落判定逻辑，包括概率计算、保底机制、稀有度选择。

```typescript
interface CardDropService {
  // 答题后触发掉落判定
  // isCorrect: 是否答对, isExamMode: 是否考试模式
  // 返回: 掉落的卡片，null表示未掉落
  tryDrop(isCorrect: boolean, isExamMode: boolean): Promise<DroppedCard | null>;
  
  // 获取当前保底计数（连续未掉落次数）
  getPityCount(): Promise<number>;
  
  // 重置保底计数（获得卡片后调用）
  resetPityCount(): Promise<void>;
  
  // 获取当前掉落概率（考虑保底加成）
  getCurrentDropRate(isCorrect: boolean): Promise<number>;
}

interface DroppedCard {
  card: KnowledgeCard;      // 掉落的卡片
  isNew: boolean;           // 是否首次获得
  fragmentCount: number;    // 如果是重复卡，获得的碎片数量
}
```

### 2. CardService - 卡片管理服务

负责卡片数据的增删改查、碎片管理、升星逻辑。

```typescript
interface CardService {
  // 获取所有卡片定义
  getAllCardDefinitions(): KnowledgeCard[];
  
  // 根据稀有度获取卡片池
  getCardPoolByRarity(rarity: CardRarity): KnowledgeCard[];
  
  // 获取用户拥有的卡片
  getUserCards(): Promise<UserCard[]>;
  
  // 添加卡片到用户收藏（处理新卡/重复卡逻辑）
  addCardToUser(cardId: string): Promise<AddCardResult>;
  
  // 获取卡片收集进度
  getCollectionProgress(): Promise<CollectionProgress>;
  
  // 按条件筛选用户卡片
  filterUserCards(filter: CardFilter): Promise<UserCard[]>;
  
  // 检查卡片是否可升级
  canUpgrade(cardId: string): Promise<boolean>;
  
  // 升级卡片（消耗碎片）
  upgradeCard(cardId: string): Promise<boolean>;
}

interface AddCardResult {
  isNew: boolean;           // 是否新卡
  card: UserCard;           // 用户卡片数据
  fragmentsAdded: number;   // 新增碎片数（重复卡时）
  didUpgrade: boolean;      // 是否触发自动升级
  newStarLevel: number;     // 升级后的星级
}

interface CollectionProgress {
  total: number;            // 总卡片数
  collected: number;        // 已收集数
  byRarity: Map<CardRarity, RarityProgress>;  // 按稀有度统计
  bySubject: Map<string, SubjectProgress>;    // 按科目统计
}

interface CardFilter {
  rarity?: CardRarity;      // 稀有度筛选
  subjectId?: string;       // 科目筛选
  starLevel?: number;       // 星级筛选
  sortBy?: 'time' | 'rarity' | 'star' | 'subject';  // 排序方式
  sortOrder?: 'asc' | 'desc';  // 排序顺序
}
```

### 3. CardStatisticsService - 卡片统计服务

负责掉落记录、统计数据、欧气值计算。

```typescript
interface CardStatisticsService {
  // 记录卡片掉落
  recordDrop(cardId: string, source: DropSource): Promise<void>;
  
  // 获取掉落统计
  getDropStatistics(): Promise<DropStatistics>;
  
  // 获取今日掉落卡片
  getTodayDroppedCards(): Promise<DroppedCardRecord[]>;
  
  // 获取SSR获取记录
  getSSRRecords(): Promise<DroppedCardRecord[]>;
  
  // 计算欧气值（SSR获取率与平均值对比）
  calculateLuckValue(): Promise<number>;
}

interface DropSource {
  questionId: string;       // 题目ID
  subjectId: string;        // 科目ID
  mode: string;             // 练习模式
}

interface DropStatistics {
  totalDrops: number;       // 总掉落次数
  byRarity: Map<CardRarity, number>;  // 按稀有度统计
  luckValue: number;        // 欧气值
}

interface DroppedCardRecord {
  cardId: string;
  cardName: string;
  rarity: CardRarity;
  dropTime: number;
  source: DropSource;
}
```

## Data Models

### 卡片稀有度枚举

```typescript
enum CardRarity {
  N = 'N',      // 普通 - 70%
  R = 'R',      // 稀有 - 20%
  SR = 'SR',    // 史诗 - 8%
  SSR = 'SSR'   // 传说 - 2%
}

// 稀有度掉落概率配置
const RARITY_DROP_RATES: Map<CardRarity, number> = new Map([
  [CardRarity.N, 0.70],
  [CardRarity.R, 0.20],
  [CardRarity.SR, 0.08],
  [CardRarity.SSR, 0.02]
]);

// 碎片升星所需数量
const FRAGMENTS_FOR_UPGRADE: number[] = [0, 2, 4, 8, 16]; // 1→2星需2碎片，2→3星需4碎片...
```

### 卡片内容类型枚举

```typescript
enum CardContentType {
  KNOWLEDGE = 'knowledge',    // 知识点
  QUOTE = 'quote',            // 名人名言
  TRIVIA = 'trivia',          // 趣味知识
  SPECIAL = 'special'         // 特殊限定
}
```

### 知识卡片定义

```typescript
interface KnowledgeCard {
  id: string;                 // 卡片ID，格式：{科目}_{序号}_{稀有度}
  name: string;               // 卡片名称
  rarity: CardRarity;         // 稀有度
  subjectId: string;          // 所属科目ID
  contentType: CardContentType; // 内容类型
  frontImage: string;         // 卡面图案资源路径
  backContent: string;        // 背面知识内容
  questionAnalysis: string;   // 题目解析（核心学习内容）
  relatedQuestionId?: string; // 关联的题目ID（可选）
  correctAnswer?: string;     // 正确答案（关联题目时）
  memoryTip?: string;         // 记忆口诀（知识点类型）
  author?: string;            // 作者（名言类型）
  examPoint?: string;         // 考点提示
  isLimited: boolean;         // 是否限定卡
  limitedStartTime?: number;  // 限定开始时间
  limitedEndTime?: number;    // 限定结束时间
}
```

### 用户卡片数据

```typescript
interface UserCard {
  id: string;                 // 记录ID
  cardId: string;             // 卡片定义ID
  starLevel: number;          // 星级 1-5
  fragments: number;          // 当前碎片数
  firstObtainTime: number;    // 首次获取时间
  lastObtainTime: number;     // 最后获取时间
  obtainCount: number;        // 总获取次数
}
```

### 数据库表设计

```sql
-- 用户卡片表
CREATE TABLE IF NOT EXISTS user_cards (
  id TEXT PRIMARY KEY,
  card_id TEXT NOT NULL UNIQUE,
  star_level INTEGER DEFAULT 1,
  fragments INTEGER DEFAULT 0,
  first_obtain_time INTEGER NOT NULL,
  last_obtain_time INTEGER NOT NULL,
  obtain_count INTEGER DEFAULT 1
);

-- 卡片掉落记录表
CREATE TABLE IF NOT EXISTS card_drop_records (
  id TEXT PRIMARY KEY,
  card_id TEXT NOT NULL,
  drop_time INTEGER NOT NULL,
  question_id TEXT,
  subject_id TEXT,
  practice_mode TEXT,
  is_new INTEGER DEFAULT 0
);

-- 掉落状态表（保底计数等）
CREATE TABLE IF NOT EXISTS card_drop_state (
  id TEXT PRIMARY KEY,
  pity_count INTEGER DEFAULT 0,
  last_drop_time INTEGER DEFAULT 0,
  total_drops INTEGER DEFAULT 0
);

-- 索引
CREATE INDEX IF NOT EXISTS idx_user_cards_card_id ON user_cards(card_id);
CREATE INDEX IF NOT EXISTS idx_drop_records_time ON card_drop_records(drop_time);
CREATE INDEX IF NOT EXISTS idx_drop_records_card ON card_drop_records(card_id);
```

## Correctness Properties

*A property is a characteristic or behavior that should hold true across all valid executions of a system-essentially, a formal statement about what the system should do. Properties serve as the bridge between human-readable specifications and machine-verifiable correctness guarantees.*

### Property 1: 掉落概率验证

*For any* 非考试模式的答题场景，答对时掉落概率应接近30%，答错时掉落概率应接近10%（在大量样本下统计验证）

**Validates: Requirements 1.1, 1.2**

### Property 2: 考试模式禁止掉落

*For any* 考试模式下的答题，无论答对答错，都不应触发卡片掉落

**Validates: Requirements 1.3**

### Property 3: 保底机制验证

*For any* 连续20次未掉落的情况，第21次答题必定触发掉落

**Validates: Requirements 1.4**

### Property 4: 稀有度分布验证

*For any* 大量掉落样本，各稀有度的分布应接近：N-70%、R-20%、SR-8%、SSR-2%

**Validates: Requirements 2.1, 2.2**

### Property 5: 重复卡片碎片转化

*For any* 用户已拥有的卡片再次掉落时，应转化为碎片而非新增卡片记录

**Validates: Requirements 2.3**

### Property 6: 碎片升星逻辑

*For any* 卡片碎片达到升级所需数量时，应自动升级星级并扣除相应碎片

**Validates: Requirements 2.4**

### Property 7: 卡片数据完整性

*For any* 知识卡片，必须包含完整的必填字段：id、name、rarity、subjectId、contentType、frontImage、backContent、questionAnalysis

**Validates: Requirements 3.1, 3.7**

### Property 8: 限定卡片时间限制

*For any* 限定卡片，只有在限定时间范围内才能被掉落

**Validates: Requirements 3.6**

### Property 9: 新卡/重复卡标识

*For any* 掉落的卡片，首次获得应标记为isNew=true，重复获得应标记为isNew=false并返回碎片数量

**Validates: Requirements 4.4, 4.5**

### Property 10: 收集进度计算

*For any* 用户的卡片收藏，收集进度应等于已获得的不重复卡片数除以总卡片数

**Validates: Requirements 5.2, 5.6**

### Property 11: 筛选功能正确性

*For any* 筛选条件，返回的卡片列表应只包含满足该条件的卡片

**Validates: Requirements 5.5, 6.4**

### Property 12: 卡册排序正确性

*For any* 用户卡册，默认按获取时间倒序排列，即最新获得的卡片在前

**Validates: Requirements 6.1**

### Property 13: 满级标识

*For any* 达到5星的卡片，应标记为满级状态

**Validates: Requirements 6.3**

### Property 14: 掉落记录完整性

*For any* 卡片掉落事件，应记录完整的掉落信息：时间、卡片ID、来源题目、来源科目

**Validates: Requirements 7.1**

### Property 15: 统计数据准确性

*For any* 掉落统计查询，各稀有度的数量之和应等于总掉落次数

**Validates: Requirements 7.2, 7.3, 7.4**

### Property 16: 批量掉落收集

*For any* 答题练习过程中获得的多张卡片，应在练习结束时统一展示

**Validates: Requirements 8.3**

## Error Handling

### 数据库错误处理

```typescript
// 数据库操作失败时的降级策略
try {
  await cardService.addCardToUser(cardId);
} catch (error) {
  Logger.error('[CardService] Failed to add card', error);
  // 降级：将掉落信息暂存到内存，稍后重试
  pendingDrops.push({ cardId, timestamp: Date.now() });
  // 仍然显示掉落动画，提升用户体验
  return { success: false, showAnimation: true };
}
```

### 概率计算边界处理

```typescript
// 确保概率值在有效范围内
function clampProbability(rate: number): number {
  return Math.max(0, Math.min(1, rate));
}

// 保底计数溢出保护
function incrementPityCount(current: number): number {
  return Math.min(current + 1, 100); // 最大100，防止溢出
}
```

### 卡片数据校验

```typescript
// 卡片定义数据校验
function validateCard(card: KnowledgeCard): boolean {
  if (!card.id || !card.name || !card.rarity) return false;
  if (!Object.values(CardRarity).includes(card.rarity)) return false;
  if (card.isLimited && (!card.limitedStartTime || !card.limitedEndTime)) return false;
  return true;
}
```

## Testing Strategy

### 单元测试

1. **CardDropService 测试**
   - 测试考试模式下不触发掉落
   - 测试保底机制在第21次触发
   - 测试概率计算边界值

2. **CardService 测试**
   - 测试新卡添加逻辑
   - 测试重复卡碎片转化
   - 测试碎片升星逻辑
   - 测试筛选和排序功能

3. **CardStatisticsService 测试**
   - 测试掉落记录保存
   - 测试统计数据计算
   - 测试欧气值计算

### 属性测试

使用属性测试框架验证核心逻辑：

1. **掉落概率属性测试**
   - 生成大量随机答题场景
   - 验证掉落率是否接近预期值（允许统计误差）

2. **稀有度分布属性测试**
   - 生成大量掉落事件
   - 验证各稀有度占比是否接近配置值

3. **碎片升星属性测试**
   - 生成随机碎片累积场景
   - 验证升星逻辑的正确性

### 集成测试

1. **答题流程集成测试**
   - 模拟完整答题流程
   - 验证掉落判定、卡片添加、记录保存的完整链路

2. **UI集成测试**
   - 验证掉落动画触发
   - 验证卡片图鉴数据展示
   - 验证卡册筛选功能

## UI Components

### CardDropPopup - 卡片掉落弹窗组件

```typescript
@Component
struct CardDropPopup {
  @Prop droppedCard: DroppedCard;
  @Prop isVisible: boolean;
  @State cardScale: number = 0;
  @State cardRotation: number = 0;
  @State showBack: boolean = false;
  
  // 入场动画：卡片从上方飘落
  // SR/SSR：额外的光效动画
  // 点击翻转查看背面
}
```

### CardCollectionPage - 卡片图鉴页面

```typescript
@Entry
@Component
struct CardCollectionPage {
  @State selectedRarity: CardRarity | 'all' = 'all';
  @State selectedSubject: string = 'all';
  @State allCards: KnowledgeCard[] = [];
  @State userCards: Map<string, UserCard> = new Map();
  @State progress: CollectionProgress;
  
  // 顶部：收集进度展示
  // 筛选栏：稀有度/科目筛选
  // 卡片网格：已获得彩色，未获得灰色剪影
}
```

### CardAlbumPage - 我的卡册页面

```typescript
@Entry
@Component
struct CardAlbumPage {
  @State userCards: UserCard[] = [];
  @State sortBy: string = 'time';
  @State filterRarity: CardRarity | 'all' = 'all';
  
  // 顶部：排序和筛选选项
  // 卡片列表：展示星级、碎片进度
  // 长按：显示获取记录
}
```

## File Structure

```
entry/src/main/ets/
├── common/types/
│   └── CardTypes.ets              # 卡片相关类型定义
├── data/
│   └── cards/
│       ├── CardDefinitions.ets    # 所有卡片定义数据
│       ├── BasicCards.ets         # 基础知识卡片
│       ├── ConcreteCards.ets      # 混凝土工程卡片
│       ├── GeotechnicalCards.ets  # 岩土工程卡片
│       ├── MeasurementCards.ets   # 量测卡片
│       ├── MetalCards.ets         # 金属结构卡片
│       ├── MechanicalCards.ets    # 机械电气卡片
│       └── SpecialCards.ets       # 特殊限定卡片
├── services/
│   ├── CardDropService.ets        # 掉落判定服务
│   ├── CardService.ets            # 卡片管理服务
│   └── CardStatisticsService.ets  # 统计服务
├── pages/
│   ├── CardCollectionPage.ets     # 卡片图鉴页面
│   └── CardAlbumPage.ets          # 我的卡册页面
└── components/
    ├── CardDropPopup.ets          # 掉落弹窗组件
    ├── CardItem.ets               # 卡片展示组件
    └── CardDropAnimation.ets      # 掉落动画组件
```
