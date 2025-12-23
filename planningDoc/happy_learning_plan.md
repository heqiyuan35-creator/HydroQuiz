# 快乐学习功能优化计划

> HydroQuiz 水利工程检测员刷题宝 - 让学习更有趣

## 项目背景

当前应用已具备完整的刷题、考试、错题管理、成就系统等功能。为了提升用户学习体验，增加学习趣味性和用户粘性，计划新增"快乐学习"系列功能。

---

## 功能规划概览

| 功能模块 | 优先级 | 预计工时 | 核心价值 |
|---------|--------|----------|----------|
| 🎮 答题闯关模式 | P0 | 3天 | 游戏化学习，增加趣味性 |
| 🎁 每日签到奖励 | P0 | 1天 | 提升用户留存 |
| 🏅 学习排行榜 | P1 | 2天 | 激发竞争动力 |
| 💬 学习鼓励语 | P1 | 0.5天 | 情感化设计，正向激励 |
| 🎯 学习挑战赛 | P1 | 2天 | 限时挑战，增加紧迫感 |
| 🎨 主题皮肤商店 | P2 | 2天 | 个性化定制 |
| 🐾 学习宠物 | P2 | 3天 | 陪伴式学习 |
| 📊 学习成就墙 | P2 | 1天 | 成就展示，满足感 |

---

## 一、答题闯关模式 🎮

### 1.1 功能描述

将刷题过程游戏化，设计关卡制度，用户通过答题解锁新关卡，获得星级评价和奖励。

### 1.2 关卡设计

```
第一章：基础入门（10关）
├── 第1关：初识水利（5题，简单）
├── 第2关：基础概念（5题，简单）
├── ...
└── 第10关：章节Boss（10题，混合难度）

第二章：混凝土工程（15关）
├── 第1关：混凝土基础（5题）
├── ...
└── 第15关：混凝土大师（15题）

... 共7章，对应7个科目
```

### 1.3 评分机制

| 正确率 | 星级 | 奖励 |
|--------|------|------|
| 100% | ⭐⭐⭐ | 30积分 + 成就徽章 |
| ≥80% | ⭐⭐ | 20积分 |
| ≥60% | ⭐ | 10积分（通关） |
| <60% | 未通关 | 0积分，可重试 |

### 1.4 技术实现

```typescript
// 关卡数据模型
interface GameLevel {
  id: string;
  chapterId: string;
  levelNumber: number;
  name: string;
  description: string;
  questionCount: number;
  difficulty: 'easy' | 'medium' | 'hard' | 'boss';
  requiredStars: number;      // 解锁所需星星数
  isUnlocked: boolean;
  bestStars: number;          // 最佳成绩
  bestScore: number;
  completedTimes: number;
}

// 章节数据模型
interface GameChapter {
  id: string;
  subjectId: string;
  name: string;
  icon: string;
  levels: GameLevel[];
  totalStars: number;
  earnedStars: number;
  isUnlocked: boolean;
}
```

### 1.5 新增文件

| 文件 | 说明 |
|------|------|
| `pages/GameModePage.ets` | 闯关模式主页 |
| `pages/GameLevelPage.ets` | 关卡答题页 |
| `pages/GameResultPage.ets` | 关卡结果页 |
| `services/GameService.ets` | 闯关数据服务 |
| `data/GameLevelData.ets` | 关卡配置数据 |

### 1.6 UI 设计要点

- 章节地图：横向滚动，显示各章节进度
- 关卡列表：纵向排列，已通关显示星级
- 关卡详情：显示最佳成绩、挑战次数
- 答题界面：增加关卡进度条、连击特效
- 结果页面：星星动画、积分飞入效果

---

## 二、每日签到奖励 🎁

### 2.1 功能描述

用户每日首次打开应用自动弹出签到页面，连续签到获得递增奖励。

### 2.2 奖励设计

| 连续天数 | 奖励内容 |
|----------|----------|
| 第1天 | 10积分 |
| 第2天 | 15积分 |
| 第3天 | 20积分 |
| 第4天 | 25积分 |
| 第5天 | 30积分 |
| 第6天 | 40积分 |
| 第7天 | 50积分 + 神秘礼包 |

### 2.3 神秘礼包内容

- 双倍积分卡（24小时）
- 专属头像框
- 限定主题皮肤
- 错题清零卡（清除1道错题）

### 2.4 技术实现

```typescript
// 签到记录
interface SignInRecord {
  userId: string;
  signInDate: string;        // YYYY-MM-DD
  continuousDays: number;    // 连续签到天数
  totalDays: number;         // 累计签到天数
  rewards: SignInReward[];
}

// 签到奖励
interface SignInReward {
  type: 'points' | 'item' | 'theme' | 'avatar';
  value: number | string;
  name: string;
}
```

### 2.5 新增文件

| 文件 | 说明 |
|------|------|
| `pages/SignInPage.ets` | 签到页面 |
| `services/SignInService.ets` | 签到服务 |
| `components/SignInCalendar.ets` | 签到日历组件 |

---

## 三、学习排行榜 🏅

### 3.1 功能描述

展示用户学习成绩排名，激发竞争动力。

### 3.2 排行榜类型

| 榜单 | 排名依据 | 刷新周期 |
|------|----------|----------|
| 今日榜 | 今日做题数 | 每日0点 |
| 周榜 | 本周做题数 | 每周一0点 |
| 月榜 | 本月做题数 | 每月1日0点 |
| 正确率榜 | 总正确率 | 实时 |
| 连续打卡榜 | 连续学习天数 | 实时 |

### 3.3 排行榜奖励

| 排名 | 奖励 |
|------|------|
| 第1名 | 100积分 + 冠军徽章 |
| 第2名 | 80积分 + 亚军徽章 |
| 第3名 | 60积分 + 季军徽章 |
| 4-10名 | 30积分 |
| 11-50名 | 10积分 |

### 3.4 技术实现

```typescript
// 排行榜数据
interface RankingItem {
  rank: number;
  userId: string;
  nickname: string;
  avatar: string;
  score: number;           // 排名分数
  isCurrentUser: boolean;
}

// 排行榜类型
type RankingType = 'daily' | 'weekly' | 'monthly' | 'accuracy' | 'streak';
```

### 3.5 新增文件

| 文件 | 说明 |
|------|------|
| `pages/RankingPage.ets` | 排行榜页面 |
| `services/RankingService.ets` | 排行榜服务 |
| `components/RankingList.ets` | 排行榜列表组件 |

---

## 四、学习鼓励语 💬

### 4.1 功能描述

在关键节点显示鼓励语，给用户正向反馈。

### 4.2 触发场景

| 场景 | 鼓励语示例 |
|------|------------|
| 答对题目 | "太棒了！继续保持！" "答对了，你真厉害！" |
| 连续答对 | "连续答对3题！你是学霸！" "5连击！无人能挡！" |
| 答错题目 | "没关系，错误是成功之母" "再接再厉，你可以的！" |
| 完成目标 | "今日目标达成！给自己点个赞👍" |
| 打卡成功 | "坚持就是胜利！明天见！" |
| 考试通过 | "恭喜通过！你离成功又近了一步！" |
| 连续学习 | "已连续学习7天，你太自律了！" |

### 4.3 技术实现

```typescript
// 鼓励语服务
class EncouragementService {
  // 获取答对鼓励语
  getCorrectEncouragement(streak: number): string;
  
  // 获取答错鼓励语
  getWrongEncouragement(): string;
  
  // 获取打卡鼓励语
  getCheckInEncouragement(days: number): string;
  
  // 获取考试鼓励语
  getExamEncouragement(score: number, isPassed: boolean): string;
}
```

### 4.4 新增文件

| 文件 | 说明 |
|------|------|
| `services/EncouragementService.ets` | 鼓励语服务 |
| `data/EncouragementData.ets` | 鼓励语数据 |
| `components/EncouragementToast.ets` | 鼓励语弹窗组件 |

---

## 五、学习挑战赛 🎯

### 5.1 功能描述

限时答题挑战，增加紧迫感和刺激感。

### 5.2 挑战模式

| 模式 | 规则 | 奖励 |
|------|------|------|
| 极速挑战 | 60秒内答对尽可能多的题 | 按答对数奖励 |
| 生存模式 | 答错即结束，看能坚持多久 | 按连续答对数奖励 |
| 限时冲刺 | 10分钟完成30题 | 按正确率奖励 |
| 每日挑战 | 每日限定题目，限时完成 | 固定奖励 |

### 5.3 技术实现

```typescript
// 挑战记录
interface ChallengeRecord {
  id: string;
  challengeType: 'speed' | 'survival' | 'sprint' | 'daily';
  score: number;
  correctCount: number;
  totalCount: number;
  duration: number;
  createTime: number;
}
```

### 5.4 新增文件

| 文件 | 说明 |
|------|------|
| `pages/ChallengePage.ets` | 挑战模式入口 |
| `pages/ChallengeGamePage.ets` | 挑战答题页 |
| `pages/ChallengeResultPage.ets` | 挑战结果页 |
| `services/ChallengeService.ets` | 挑战服务 |

---

## 六、主题皮肤商店 🎨

### 6.1 功能描述

用户可用积分兑换不同主题皮肤，个性化定制界面。

### 6.2 主题列表

| 主题名称 | 价格 | 说明 |
|----------|------|------|
| 默认蓝 | 免费 | 默认主题 |
| 清新绿 | 100积分 | 护眼绿色主题 |
| 活力橙 | 100积分 | 活力橙色主题 |
| 优雅紫 | 150积分 | 优雅紫色主题 |
| 暗夜黑 | 200积分 | 深色主题 |
| 樱花粉 | 200积分 | 粉色少女主题 |
| 星空蓝 | 300积分 | 渐变星空主题 |
| 黄金VIP | 500积分 | 尊贵金色主题 |

### 6.3 技术实现

```typescript
// 主题配置
interface ThemeSkin {
  id: string;
  name: string;
  price: number;
  primaryColor: string;
  backgroundColor: string;
  surfaceColor: string;
  textColor: string;
  accentColor: string;
  preview: Resource;
  isOwned: boolean;
  isActive: boolean;
}
```

### 6.4 新增文件

| 文件 | 说明 |
|------|------|
| `pages/ThemeStorePage.ets` | 主题商店页面 |
| `services/ThemeStoreService.ets` | 主题商店服务 |
| `data/ThemeSkinData.ets` | 主题皮肤数据 |

---

## 七、学习宠物 🐾

### 7.1 功能描述

虚拟学习伙伴，陪伴用户学习，根据学习情况变化状态。

### 7.2 宠物设计

| 宠物 | 解锁条件 | 特点 |
|------|----------|------|
| 小水滴 | 默认 | 基础宠物，表情丰富 |
| 小河狸 | 连续学习7天 | 勤劳的水利工程师 |
| 小海豚 | 累计答题500题 | 聪明的学霸 |
| 小龙王 | 考试满分 | 霸气的王者 |

### 7.3 宠物状态

| 状态 | 触发条件 | 表现 |
|------|----------|------|
| 开心 | 答对题目 | 跳跃、欢呼 |
| 加油 | 答错题目 | 鼓励动作 |
| 困倦 | 长时间未学习 | 打哈欠 |
| 兴奋 | 连续答对 | 特效动画 |
| 骄傲 | 考试通过 | 庆祝动画 |

### 7.4 技术实现

```typescript
// 宠物数据
interface StudyPet {
  id: string;
  name: string;
  type: 'droplet' | 'beaver' | 'dolphin' | 'dragon';
  level: number;
  exp: number;
  mood: 'happy' | 'encourage' | 'sleepy' | 'excited' | 'proud';
  isUnlocked: boolean;
  isActive: boolean;
}
```

### 7.5 新增文件

| 文件 | 说明 |
|------|------|
| `components/StudyPet.ets` | 学习宠物组件 |
| `services/PetService.ets` | 宠物服务 |
| `pages/PetPage.ets` | 宠物详情页 |

---

## 八、学习成就墙 📊

### 8.1 功能描述

展示用户获得的所有成就徽章，形成成就墙。

### 8.2 成就分类展示

```
┌─────────────────────────────────────┐
│  🏆 我的成就墙                       │
│  已解锁 12/20 个成就                 │
├─────────────────────────────────────┤
│  📚 学习类 (4/6)                     │
│  [🌱] [📝] [📚] [💯] [🔒] [🔒]      │
├─────────────────────────────────────┤
│  📋 考试类 (3/6)                     │
│  [📋] [✅] [🌟] [🔒] [🔒] [🔒]      │
├─────────────────────────────────────┤
│  🔥 坚持类 (3/4)                     │
│  [🔥] [💪] [📅] [🔒]                │
├─────────────────────────────────────┤
│  🎯 挑战类 (2/4)                     │
│  [🎯] [✨] [🔒] [🔒]                │
└─────────────────────────────────────┘
```

### 8.3 新增文件

| 文件 | 说明 |
|------|------|
| `pages/AchievementWallPage.ets` | 成就墙页面 |
| `components/AchievementBadge.ets` | 成就徽章组件 |

---

## 九、积分系统 💰

### 9.1 积分获取途径

| 行为 | 积分 |
|------|------|
| 每日签到 | 10-50 |
| 完成每日目标 | 20 |
| 答对一题 | 1 |
| 连续答对5题 | 5（额外） |
| 通关一个关卡 | 10-30 |
| 考试及格 | 30 |
| 考试满分 | 100 |
| 解锁成就 | 20-50 |
| 排行榜奖励 | 10-100 |

### 9.2 积分消费途径

| 用途 | 消耗 |
|------|------|
| 购买主题皮肤 | 100-500 |
| 解锁学习宠物 | 200-500 |
| 购买道具卡 | 50-100 |
| 兑换头像框 | 100-300 |

### 9.3 技术实现

```typescript
// 积分记录
interface PointsRecord {
  id: string;
  userId: string;
  type: 'earn' | 'spend';
  amount: number;
  reason: string;
  balance: number;
  createTime: number;
}

// 积分服务
class PointsService {
  // 获取当前积分
  getBalance(): Promise<number>;
  
  // 增加积分
  addPoints(amount: number, reason: string): Promise<void>;
  
  // 消费积分
  spendPoints(amount: number, reason: string): Promise<boolean>;
  
  // 获取积分记录
  getRecords(limit: number): Promise<PointsRecord[]>;
}
```

### 9.4 新增文件

| 文件 | 说明 |
|------|------|
| `services/PointsService.ets` | 积分服务 |
| `pages/PointsPage.ets` | 积分明细页 |

---

## 十、开发计划

### 第一期（核心功能）- 预计5天

| 任务 | 工时 | 优先级 |
|------|------|--------|
| 积分系统基础 | 1天 | P0 |
| 每日签到奖励 | 1天 | P0 |
| 学习鼓励语 | 0.5天 | P0 |
| 答题闯关模式 | 2.5天 | P0 |

### 第二期（增强功能）- 预计4天

| 任务 | 工时 | 优先级 |
|------|------|--------|
| 学习挑战赛 | 2天 | P1 |
| 学习排行榜 | 2天 | P1 |

### 第三期（个性化）- 预计6天

| 任务 | 工时 | 优先级 |
|------|------|--------|
| 主题皮肤商店 | 2天 | P2 |
| 学习宠物 | 3天 | P2 |
| 学习成就墙 | 1天 | P2 |

---

## 十一、数据库扩展

### 新增表

```sql
-- 积分记录表
CREATE TABLE IF NOT EXISTS points_records (
  id TEXT PRIMARY KEY,
  user_id TEXT,
  type TEXT,
  amount INTEGER,
  reason TEXT,
  balance INTEGER,
  create_time INTEGER
);

-- 签到记录表
CREATE TABLE IF NOT EXISTS sign_in_records (
  id TEXT PRIMARY KEY,
  user_id TEXT,
  sign_date TEXT,
  continuous_days INTEGER,
  total_days INTEGER,
  rewards TEXT,
  create_time INTEGER
);

-- 闯关进度表
CREATE TABLE IF NOT EXISTS game_progress (
  id TEXT PRIMARY KEY,
  user_id TEXT,
  chapter_id TEXT,
  level_id TEXT,
  best_stars INTEGER,
  best_score INTEGER,
  completed_times INTEGER,
  last_play_time INTEGER
);

-- 挑战记录表
CREATE TABLE IF NOT EXISTS challenge_records (
  id TEXT PRIMARY KEY,
  user_id TEXT,
  challenge_type TEXT,
  score INTEGER,
  correct_count INTEGER,
  total_count INTEGER,
  duration INTEGER,
  create_time INTEGER
);

-- 用户道具表
CREATE TABLE IF NOT EXISTS user_items (
  id TEXT PRIMARY KEY,
  user_id TEXT,
  item_type TEXT,
  item_id TEXT,
  quantity INTEGER,
  create_time INTEGER
);

-- 主题皮肤表
CREATE TABLE IF NOT EXISTS user_themes (
  id TEXT PRIMARY KEY,
  user_id TEXT,
  theme_id TEXT,
  is_active INTEGER,
  purchase_time INTEGER
);
```

---

## 十二、UI/UX 设计原则

### 12.1 游戏化设计原则

1. **即时反馈**: 每个操作都有视觉/听觉反馈
2. **进度可视**: 清晰展示学习进度和成长
3. **奖励驱动**: 合理的奖励机制激励持续学习
4. **社交激励**: 排行榜、成就分享增加社交属性
5. **个性化**: 主题、宠物等满足个性化需求

### 12.2 动画效果

| 场景 | 动画效果 |
|------|----------|
| 答对题目 | 绿色对勾 + 积分飞入 |
| 连击 | 连击数字放大 + 火焰特效 |
| 通关 | 星星依次点亮 + 撒花 |
| 签到 | 日历翻页 + 奖励弹出 |
| 升级 | 光效 + 等级数字变化 |
| 解锁成就 | 徽章旋转出现 + 光芒 |

---

## 十三、风险与应对

| 风险 | 应对策略 |
|------|----------|
| 积分通胀 | 设计合理的积分获取/消耗比例 |
| 用户疲劳 | 控制每日奖励上限，避免过度游戏化 |
| 性能问题 | 动画使用硬件加速，避免过度渲染 |
| 数据同步 | 本地优先，定期备份 |

---

## 十四、成功指标

| 指标 | 目标 |
|------|------|
| 日活跃用户 | 提升 30% |
| 用户留存率 | 7日留存提升至 40% |
| 平均学习时长 | 提升 50% |
| 用户满意度 | 4.5分以上 |

---

**文档版本**: v1.0  
**创建时间**: 2025-12-23  
**维护者**: 开发团队


---

## 开发进度记录

### 第一期开发完成 (2025-12-23)

✅ **已完成功能：**

1. **积分系统基础**
   - 创建 `PointsTypes.ets` - 积分类型定义
   - 创建 `PointsService.ets` - 积分服务（获取/消费/记录）
   - 创建 `PointsPage.ets` - 积分明细页面

2. **每日签到奖励**
   - 创建 `SignInTypes.ets` - 签到类型定义
   - 创建 `SignInService.ets` - 签到服务（签到/连续天数/奖励）
   - 创建 `SignInPage.ets` - 签到页面（日历/奖励预览/签到动画）

3. **学习鼓励语**
   - 创建 `EncouragementData.ets` - 鼓励语数据（答对/答错/连击/打卡/考试等）
   - 创建 `EncouragementService.ets` - 鼓励语服务

4. **答题闯关模式**
   - 创建 `GameTypes.ets` - 闯关类型定义（关卡/章节/进度/结果）
   - 创建 `GameLevelData.ets` - 关卡配置数据（7章节，每章8-10关）
   - 创建 `GameService.ets` - 闯关服务（进度管理/结果计算）
   - 创建 `GameModePage.ets` - 闯关模式主页（章节选择/关卡列表）
   - 创建 `GameLevelPage.ets` - 关卡答题页（答题/连击/鼓励语）
   - 创建 `GameResultPage.ets` - 关卡结果页（星级/积分/统计）

5. **主页入口集成**
   - 在 `MainTabPage.ets` 添加"快乐学习"功能区
   - 包含：答题闯关、每日签到、我的积分三个入口

6. **服务初始化**
   - 在 `EntryAbility.ets` 中初始化积分、签到、闯关服务

7. **路由配置**
   - 更新 `AppConstants.ets` 添加新路由常量
   - 更新 `Router.ets` 添加路由方法
   - 更新 `main_pages.json` 注册新页面

**新增文件清单：**
- `entry/src/main/ets/common/types/PointsTypes.ets`
- `entry/src/main/ets/common/types/SignInTypes.ets`
- `entry/src/main/ets/common/types/GameTypes.ets`
- `entry/src/main/ets/data/EncouragementData.ets`
- `entry/src/main/ets/data/GameLevelData.ets`
- `entry/src/main/ets/services/PointsService.ets`
- `entry/src/main/ets/services/SignInService.ets`
- `entry/src/main/ets/services/EncouragementService.ets`
- `entry/src/main/ets/services/GameService.ets`
- `entry/src/main/ets/pages/SignInPage.ets`
- `entry/src/main/ets/pages/PointsPage.ets`
- `entry/src/main/ets/pages/GameModePage.ets`
- `entry/src/main/ets/pages/GameLevelPage.ets`
- `entry/src/main/ets/pages/GameResultPage.ets`
