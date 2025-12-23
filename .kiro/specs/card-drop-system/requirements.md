# 答题卡片掉落系统 - 需求文档

## Introduction

为水利工程检测员刷题宝增加卡片掉落系统，让用户在答题过程中有概率获得知识卡片，增加刷题的趣味性和惊喜感。类似游戏中的"开箱"机制，每次答题都可能触发卡片掉落，不同稀有度的卡片有不同的掉落概率。

## Glossary

- **Card_Drop_System**: 卡片掉落系统，负责判定答题后是否掉落卡片及掉落哪张卡片
- **Knowledge_Card**: 知识卡片，包含水利工程相关的知识点、名人名言、趣味知识等
- **Rarity**: 稀有度等级，分为普通(N)、稀有(R)、史诗(SR)、传说(SSR)四个等级
- **Drop_Rate**: 掉落概率，每次答题触发卡片掉落的基础概率
- **Card_Collection**: 卡片图鉴，展示用户已收集和未收集的所有卡片
- **Card_Album**: 卡册，用户收集的卡片存放处
- **Pity_System**: 保底机制，连续多次未掉落后提高掉落概率

## Requirements

### Requirement 1: 答题触发卡片掉落判定

**User Story:** 作为用户，我希望在答题后有机会获得卡片，这样刷题会更有期待感和惊喜感。

#### Acceptance Criteria

1. WHEN 用户在非考试模式下答对一道题 THEN Card_Drop_System SHALL 以30%的基础概率触发掉落判定
2. WHEN 用户在非考试模式下答错一道题 THEN Card_Drop_System SHALL 以10%的基础概率触发掉落判定
3. WHEN 用户处于模拟考试模式 THEN Card_Drop_System SHALL NOT 触发任何掉落判定
4. WHEN 用户连续20题未获得卡片 THEN Card_Drop_System SHALL 将下一题的掉落概率提升至100%（保底机制）
5. WHEN 掉落判定成功触发 THEN Card_Drop_System SHALL 根据稀有度概率随机选择一张卡片

---

### Requirement 2: 卡片稀有度与掉落概率

**User Story:** 作为用户，我希望有不同稀有度的卡片，稀有卡片更难获得，这样收集会更有成就感。

#### Acceptance Criteria

1. THE Card_Drop_System SHALL 支持四种稀有度等级：普通(N)-70%、稀有(R)-20%、史诗(SR)-8%、传说(SSR)-2%
2. WHEN 掉落判定成功 THEN Card_Drop_System SHALL 先按稀有度概率确定等级，再从该等级卡池随机选择具体卡片
3. WHEN 用户获得已拥有的卡片 THEN Card_Drop_System SHALL 将该卡片转化为"卡片碎片"
4. WHEN 用户累计获得同一张卡片的碎片达到指定数量 THEN Card_Drop_System SHALL 自动将卡片升级（增加星级）

---

### Requirement 3: 知识卡片内容设计

**User Story:** 作为用户，我希望卡片内容有趣且有价值，不仅是收藏品还能学到知识，寓教于乐。

#### Acceptance Criteria

1. THE Knowledge_Card SHALL 包含以下信息：卡片ID、名称、稀有度、所属科目、卡面图案、知识内容、题目解析、获取时间
2. THE Card_Drop_System SHALL 按科目分类设计卡片，每个科目至少20张卡片
3. WHEN 卡片内容为知识点类型 THEN Knowledge_Card SHALL 展示简洁的知识要点、记忆口诀和相关题目解析
4. WHEN 卡片内容为名人名言类型 THEN Knowledge_Card SHALL 展示水利工程领域名人的经典语录及其背景知识
5. WHEN 卡片内容为趣味知识类型 THEN Knowledge_Card SHALL 展示水利工程的冷知识或历史故事，并关联相关考点
6. THE Card_Drop_System SHALL 设计特殊限定卡片（如节日卡、纪念卡），仅在特定时间可获得
7. THE Knowledge_Card SHALL 在背面展示详细的题目解析，帮助用户理解和记忆知识点
8. WHEN 卡片关联特定题目 THEN Knowledge_Card SHALL 显示该题目的正确答案和解析说明

---

### Requirement 4: 卡片掉落动画与展示

**User Story:** 作为用户，我希望获得卡片时有炫酷的动画效果，增强惊喜感和仪式感。

#### Acceptance Criteria

1. WHEN 触发卡片掉落 THEN Card_Drop_System SHALL 播放"卡片出现"动画（卡片从屏幕上方飘落）
2. WHEN 卡片稀有度为SR或SSR THEN Card_Drop_System SHALL 播放特殊光效动画（金光闪烁/彩虹特效）
3. WHEN 卡片展示时 THEN Card_Drop_System SHALL 显示卡片正面，用户点击可翻转查看背面知识内容
4. WHEN 用户获得新卡片（首次获得）THEN Card_Drop_System SHALL 显示"NEW"标识并播放庆祝音效
5. WHEN 用户获得重复卡片 THEN Card_Drop_System SHALL 显示"碎片+N"并播放较简单的动画

---

### Requirement 5: 卡片图鉴与收藏展示

**User Story:** 作为用户，我希望能查看我收集的所有卡片，了解收集进度和缺少哪些卡片。

#### Acceptance Criteria

1. THE Card_Collection SHALL 按科目分类展示所有卡片，已获得的显示彩色，未获得的显示灰色剪影
2. WHEN 用户查看卡片图鉴 THEN Card_Collection SHALL 显示总收集进度（如：已收集 45/150）
3. WHEN 用户点击已获得的卡片 THEN Card_Collection SHALL 展示卡片详情（正反面、获取时间、拥有数量）
4. WHEN 用户点击未获得的卡片 THEN Card_Collection SHALL 显示卡片剪影和"???"提示，不透露具体内容
5. THE Card_Collection SHALL 支持按稀有度筛选查看（全部/N/R/SR/SSR）
6. THE Card_Collection SHALL 显示各稀有度的收集进度统计

---

### Requirement 6: 卡册与卡片管理

**User Story:** 作为用户，我希望能管理我的卡片，查看详情和碎片数量。

#### Acceptance Criteria

1. THE Card_Album SHALL 展示用户拥有的所有卡片，按获取时间倒序排列
2. WHEN 用户查看卡册 THEN Card_Album SHALL 显示每张卡片的星级（1-5星，通过碎片升级）
3. WHEN 卡片达到5星满级 THEN Card_Album SHALL 在卡片上显示"MAX"标识
4. THE Card_Album SHALL 支持按科目、稀有度、星级排序和筛选
5. WHEN 用户长按卡片 THEN Card_Album SHALL 显示卡片的获取记录（首次获取时间、总获取次数）

---

### Requirement 7: 卡片掉落记录与统计

**User Story:** 作为用户，我希望能查看我的卡片获取历史和运气统计。

#### Acceptance Criteria

1. THE Card_Drop_System SHALL 记录每次卡片掉落的时间、卡片ID、来源（哪道题/哪个科目）
2. WHEN 用户查看掉落统计 THEN Card_Drop_System SHALL 显示各稀有度卡片的获取数量和占比
3. THE Card_Drop_System SHALL 统计用户的"欧气值"（SSR获取率与平均值的对比）
4. WHEN 用户获得SSR卡片 THEN Card_Drop_System SHALL 记录并可在统计页展示"SSR获取记录"

---

### Requirement 8: 卡片系统入口与集成

**User Story:** 作为用户，我希望能方便地进入卡片系统查看我的收藏。

#### Acceptance Criteria

1. THE Card_Drop_System SHALL 在题库Tab页面增加"我的卡册"入口按钮
2. THE Card_Drop_System SHALL 在"我的"页面增加卡片收集进度展示
3. WHEN 用户在答题页面获得卡片 THEN Card_Drop_System SHALL 在答题结束后统一展示本次获得的所有卡片
4. THE Card_Drop_System SHALL 在首页增加"今日卡片"展示区，显示今日获得的卡片数量

---

## 卡片内容规划（示例）

### 按科目分类

| 科目 | 卡片数量 | 内容类型 |
|------|----------|----------|
| 基础知识 | 25张 | 基础概念、检测原理 |
| 混凝土工程 | 25张 | 配合比、强度检测 |
| 岩土工程 | 25张 | 土工试验、地基处理 |
| 量测 | 20张 | 测量仪器、精度要求 |
| 金属结构 | 20张 | 焊接检测、无损检测 |
| 机械电气 | 20张 | 设备检测、安全规范 |
| 通用/趣味 | 15张 | 名人名言、水利历史 |

### 稀有度分布

| 稀有度 | 数量 | 内容特点 |
|--------|------|----------|
| N (普通) | 100张 | 基础知识点 |
| R (稀有) | 35张 | 重要考点、易错点 |
| SR (史诗) | 12张 | 核心公式、关键技术 |
| SSR (传说) | 3张 | 大师语录、行业里程碑 |

### 特殊卡片

- 🎄 节日限定卡（春节、国庆等）
- 🏆 成就纪念卡（首次满分、连续打卡等触发）
- ⭐ 隐藏卡（特定条件触发，如答对100道难题）
