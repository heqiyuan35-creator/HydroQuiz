# HydroQuiz 水利工程检测员刷题宝 - 开发计划

## 项目概述

**项目名称**: HydroQuiz（水利工程检测员刷题宝）
**项目类型**: HarmonyOS 移动应用
**包名**: `com.example.hydroquiz`
**版本**: 1.0.0
**开发框架**: ArkTS + ArkUI
**目标平台**: HarmonyOS 5.0+

### 项目愿景

HydroQuiz 是一款专为水利工程检测员设计的职业资格考试刷题应用，帮助用户高效备考、系统学习，顺利通过水利工程检测员资格认证考试。

### 目标用户

- 水利工程检测员考证人员
- 水利工程相关专业学生
- 在职水利工程技术人员

---

## 技术架构

### 技术栈

| 技术 | 版本 | 说明 |
|------|------|------|
| HarmonyOS Next | 5.0+ | 鸿蒙操作系统 |
| ArkTS | - | 开发语言 |
| ArkUI | - | 声明式 UI 框架 |
| DevEco Studio | 5.0+ | 开发工具 |
| RDB | - | 关系型数据库（本地存储） |
| Preferences | - | 轻量级存储 |

### 项目结构

```
HydroQuiz/
├── entry/
│   └── src/
│       └── main/
│           ├── ets/
│           │   ├── common/              # 公共模块
│           │   │   ├── constants/       # 常量定义
│           │   │   ├── types/           # 类型定义
│           │   │   └── utils/           # 工具类
│           │   ├── components/          # 自定义组件
│           │   │   ├── basic/           # 基础组件
│           │   │   ├── business/        # 业务组件
│           │   │   └── layout/          # 布局组件
│           │   ├── data/                # 数据层
│           │   │   ├── database/        # 数据库服务
│           │   │   ├── models/          # 数据模型
│           │   │   └── repository/      # 数据仓库
│           │   ├── entryability/        # 应用入口
│           │   ├── pages/               # 页面
│           │   ├── router/              # 路由管理
│           │   ├── services/            # 业务服务
│           │   ├── store/               # 状态管理
│           │   └── theme/               # 主题系统
│           └── resources/               # 资源文件
│               ├── base/
│               │   ├── element/         # 字符串、颜色
│               │   ├── media/           # 图标、图片
│               │   └── profile/         # 配置文件
│               └── rawfile/             # 原始文件（题库JSON等）
├── planningDoc/                         # 开发文档
└── README.md
```

### 状态管理

采用 HarmonyOS V2 响应式状态管理：
- `@ObservedV2` - 观察类
- `@Trace` - 追踪属性变化
- `@Local` - 组件内部状态
- `@Param` - 单向数据传递
- `@Event` - 事件回调

---

## 核心功能模块

### 1. 题库管理模块

#### 1.1 题目分类
- **科目分类**（共7科，基于第3版教材）
  - 001 基础知识
  - 002 混凝土工程
  - 003 岩土工程（岩石、土工）
  - 004 岩土工程（地基与基础）
  - 005 量测
  - 006 金属结构
  - 007 机械电气

- **题型分类**
  - 单选题
  - 多选题
  - 判断题
  - 案例分析题（如有）

#### 1.2 题目数据模型

```typescript
// 题目模型
interface Question {
  id: string;                    // 题目ID
  type: QuestionType;            // 题型
  subject: string;               // 科目
  chapter: string;               // 章节
  content: string;               // 题目内容
  options: QuestionOption[];     // 选项（选择题）
  answer: string | string[];     // 正确答案
  analysis: string;              // 解析
  difficulty: DifficultyLevel;   // 难度等级
  tags: string[];                // 标签
  createTime: number;            // 创建时间
  updateTime: number;            // 更新时间
}

// 题型枚举
enum QuestionType {
  SINGLE_CHOICE = 'single',      // 单选题
  MULTIPLE_CHOICE = 'multiple',  // 多选题
  TRUE_FALSE = 'truefalse',      // 判断题
  CASE_ANALYSIS = 'case'         // 案例分析
}

// 难度等级
enum DifficultyLevel {
  EASY = 1,      // 简单
  MEDIUM = 2,    // 中等
  HARD = 3       // 困难
}
```

### 2. 刷题练习模块

#### 2.1 练习模式
- **顺序练习**: 按章节顺序刷题
- **随机练习**: 随机抽取题目
- **专项练习**: 按科目/题型专项训练
- **错题练习**: 针对错题重复练习
- **收藏练习**: 练习收藏的题目
- **智能练习**: 根据薄弱点智能推荐

#### 2.2 答题界面功能
- 题目显示与选项选择
- 上一题/下一题导航
- 题目收藏功能
- 答案解析查看
- 答题计时
- 答题进度显示
- 答题卡快速跳转

### 3. 模拟考试模块

#### 3.1 考试模式
- **真题模拟**: 历年真题组卷
- **模拟测试**: 随机组卷模拟
- **章节测试**: 章节知识点测试
- **每日一练**: 每日定量练习

#### 3.2 考试功能
- 考试倒计时
- 自动交卷
- 成绩统计
- 错题回顾
- 答案解析
- 考试记录保存

### 4. 学习统计模块

#### 4.1 统计数据
- 总做题数量
- 正确率统计
- 各科目正确率
- 学习时长统计
- 连续学习天数
- 每日/每周/每月趋势

#### 4.2 数据可视化
- 正确率饼图
- 学习趋势折线图
- 科目掌握度雷达图
- 学习日历热力图

### 5. 错题本模块

#### 5.1 错题管理
- 自动收录错题
- 错题分类（按科目/章节/时间）
- 错题标记（已掌握/未掌握）
- 错题删除
- 错题导出

#### 5.2 错题复习
- 错题重做
- 错题解析
- 相似题推荐

### 6. 收藏夹模块

- 题目收藏
- 收藏分组管理
- 收藏题目练习

### 7. 用户中心模块

#### 7.1 用户信息
- 头像设置
- 昵称设置
- 学习目标设置
- 每日提醒设置

#### 7.2 设置功能
- 主题切换（浅色/深色/跟随系统）
- 字体大小调整
- 答题模式设置（答题后显示答案/交卷后显示）
- 数据备份与恢复
- 清除缓存
- 关于应用

---

## 页面规划

### 主要页面列表

| 页面名称 | 文件名 | 说明 |
|---------|--------|------|
| 启动页 | SplashPage.ets | 应用启动页 |
| 主页 | MainTabPage.ets | 底部Tab主页面 |
| 首页 | HomePage.ets | 学习概览、快捷入口 |
| 题库页 | QuestionBankPage.ets | 题库分类浏览 |
| 练习页 | PracticePage.ets | 刷题练习主页 |
| 答题页 | AnswerPage.ets | 答题界面 |
| 考试页 | ExamPage.ets | 模拟考试界面 |
| 考试结果页 | ExamResultPage.ets | 考试成绩展示 |
| 统计页 | StatisticsPage.ets | 学习统计数据 |
| 错题本页 | WrongBookPage.ets | 错题管理 |
| 收藏页 | FavoritePage.ets | 收藏题目管理 |
| 个人中心页 | ProfilePage.ets | 用户信息与设置 |
| 设置页 | SettingsPage.ets | 应用设置 |
| 主题设置页 | ThemeSettingsPage.ets | 主题切换 |
| 关于页 | AboutPage.ets | 应用信息 |

### 页面导航结构

```
SplashPage (启动页)
    │
    └── MainTabPage (主Tab页)
            ├── Tab1: HomePage (首页)
            │       ├── QuestionBankPage (题库)
            │       ├── PracticePage (练习)
            │       │       └── AnswerPage (答题)
            │       └── ExamPage (考试)
            │               └── ExamResultPage (结果)
            │
            ├── Tab2: StatisticsPage (统计)
            │
            ├── Tab3: WrongBookPage (错题本)
            │       └── AnswerPage (错题练习)
            │
            └── Tab4: ProfilePage (我的)
                    ├── FavoritePage (收藏)
                    ├── SettingsPage (设置)
                    │       └── ThemeSettingsPage (主题)
                    └── AboutPage (关于)
```

---

## 开发阶段规划

### 第一阶段：基础架构搭建（1周）

**目标**: 完成项目基础架构和核心组件

- [x] 项目目录结构创建
- [x] 基础组件库开发
  - [x] CustomButton 按钮组件
  - [x] CustomCard 卡片组件
  - [x] AnswerCard 答题卡组件
- [x] 主题系统搭建
  - [x] ThemeColors 颜色定义
  - [x] ThemeConstants 常量定义
- [x] 路由系统搭建
- [x] 数据库服务初始化（7张表+索引）
- [x] 日志工具类

### 第二阶段：核心页面开发（2周）

**目标**: 完成主要页面UI和基础交互

- [x] SplashPage 启动页
- [x] MainTabPage 主Tab页
- [x] HomePage 首页（集成在MainTabPage中）
- [x] QuestionBankPage 题库页（集成在MainTabPage中，含题型筛选）
- [x] ProfilePage 个人中心页（集成在MainTabPage中）
- [x] SettingsPage 设置页
- [x] AboutPage 关于页

### 第三阶段：刷题功能开发（2周）

**目标**: 完成核心刷题功能

- [x] 题目数据模型定义
- [x] 题库数据导入（模拟数据15题）
- [x] PracticePage 练习页（含模式选择、科目选择）
- [x] AnswerPage 答题页
  - [x] 单选题组件
  - [x] 多选题组件
  - [x] 判断题组件
  - [x] 答题卡组件（快速跳转）
- [x] 答题逻辑实现
- [x] 答案解析功能
- [x] 答题记录保存
- [x] 收藏功能
- [x] 错题自动收录

### 第四阶段：考试功能开发（1周）

**目标**: 完成模拟考试功能

- [x] ExamPage 考试页
- [x] 考试计时功能
- [x] 自动交卷功能
- [x] ExamResultPage 考试结果页
- [x] 考试记录存储（数据库持久化）
- [x] 考试记录展示（统计页面）

### 第五阶段：统计与错题功能（1周）

**目标**: 完成学习统计和错题管理

- [x] StatisticsPage 统计页（集成在MainTabPage中）
- [x] 数据统计服务（今日统计）
- [x] 考试记录展示
- [x] WrongBookPage 错题本页
- [x] 错题自动收录
- [x] 错题标记已掌握功能
- [x] FavoritePage 收藏页
- [x] 取消收藏功能

### 第六阶段：优化与完善（1周）

**目标**: 功能完善和性能优化

- [x] 清除学习数据功能
- [x] 数据导入服务（JSON格式）
- [ ] 深色模式完整适配（可选）
- [ ] 高级统计图表（可选）
- [ ] 真实题库数据导入（等待用户提供）

---

## 当前开发进度

**更新时间**: 2024-12-16 (最新)

### 已完成功能
- ✅ 项目基础架构（主题、路由、数据库）
- ✅ 启动页动画
- ✅ 主Tab页（首页、题库、统计、我的）
- ✅ 练习模式选择（顺序、随机、错题、收藏）
- ✅ 答题页面（单选、多选、判断题）
- ✅ 答案解析与收藏功能
- ✅ 错题自动收录与管理
- ✅ 收藏题目管理
- ✅ 模拟考试（计时、自动交卷）
- ✅ 考试结果展示与评价
- ✅ 学习统计（今日数据）
- ✅ 设置页面（含清除数据功能）
- ✅ 关于页面
- ✅ 模拟题库（29道测试题，覆盖7科目）
- ✅ 答题卡快速跳转（练习和考试）
- ✅ 考试记录持久化与展示
- ✅ 错题练习模式
- ✅ 收藏练习模式
- ✅ 考试历史记录查看
- ✅ 数据导入服务（支持JSON格式）
- ✅ 清除学习数据功能

### 待完成功能（可选优化）
- ⏳ 高级统计图表（饼图、折线图等可视化）
- ⏳ 深色模式完整适配
- ⏳ 真实题库数据导入（等待用户提供JSON数据）

### 应用功能完整度: 98%
核心功能已全部实现，可正常使用。

### 已实现功能清单
| 功能模块 | 状态 | 说明 |
|---------|------|------|
| 启动页动画 | ✅ | Logo缩放+淡入动画 |
| 主Tab页 | ✅ | 首页/题库/统计/我的 |
| 练习模式 | ✅ | 顺序/随机/错题/收藏 |
| 答题界面 | ✅ | 单选/多选/判断题 |
| 答题卡 | ✅ | 快速跳转+答题状态 |
| 模拟考试 | ✅ | 计时/自动交卷/记录 |
| 考试结果 | ✅ | 分数/评价/建议 |
| 错题本 | ✅ | 自动收录/标记掌握 |
| 收藏夹 | ✅ | 收藏/取消收藏 |
| 学习统计 | ✅ | 今日数据/考试记录 |
| 设置页面 | ✅ | 清除数据功能 |
| 数据导入 | ✅ | JSON格式导入服务 |
| 模拟题库 | ✅ | 29题覆盖7科目 |

---

## 数据存储设计

### 本地数据库表结构

#### 1. 题目表 (questions)

| 字段名 | 类型 | 说明 |
|--------|------|------|
| id | TEXT | 主键 |
| type | TEXT | 题型 |
| subject | TEXT | 科目 |
| chapter | TEXT | 章节 |
| content | TEXT | 题目内容 |
| options | TEXT | 选项JSON |
| answer | TEXT | 正确答案 |
| analysis | TEXT | 解析 |
| difficulty | INTEGER | 难度 |
| tags | TEXT | 标签JSON |

#### 2. 答题记录表 (answer_records)

| 字段名 | 类型 | 说明 |
|--------|------|------|
| id | TEXT | 主键 |
| question_id | TEXT | 题目ID |
| user_answer | TEXT | 用户答案 |
| is_correct | INTEGER | 是否正确 |
| answer_time | INTEGER | 答题时间(秒) |
| create_time | INTEGER | 创建时间 |

#### 3. 错题表 (wrong_questions)

| 字段名 | 类型 | 说明 |
|--------|------|------|
| id | TEXT | 主键 |
| question_id | TEXT | 题目ID |
| wrong_count | INTEGER | 错误次数 |
| last_wrong_time | INTEGER | 最后错误时间 |
| is_mastered | INTEGER | 是否已掌握 |

#### 4. 收藏表 (favorites)

| 字段名 | 类型 | 说明 |
|--------|------|------|
| id | TEXT | 主键 |
| question_id | TEXT | 题目ID |
| group_name | TEXT | 分组名称 |
| create_time | INTEGER | 收藏时间 |

#### 5. 考试记录表 (exam_records)

| 字段名 | 类型 | 说明 |
|--------|------|------|
| id | TEXT | 主键 |
| exam_type | TEXT | 考试类型 |
| total_count | INTEGER | 总题数 |
| correct_count | INTEGER | 正确数 |
| score | REAL | 得分 |
| duration | INTEGER | 用时(秒) |
| create_time | INTEGER | 考试时间 |

#### 6. 学习统计表 (study_statistics)

| 字段名 | 类型 | 说明 |
|--------|------|------|
| id | TEXT | 主键 |
| date | TEXT | 日期 |
| study_time | INTEGER | 学习时长(分钟) |
| question_count | INTEGER | 做题数量 |
| correct_count | INTEGER | 正确数量 |

### Preferences 存储

- 用户设置（主题、字体大小、提醒等）
- 学习目标
- 首次启动标志
- 最后学习位置

---

## UI设计规范

### 配色方案

#### 主色调
- 主色: #1890FF (蓝色 - 专业、可信)
- 辅助色: #52C41A (绿色 - 正确)
- 警告色: #FAAD14 (橙色 - 警告)
- 错误色: #FF4D4F (红色 - 错误)

#### 浅色主题
- 背景色: #F5F7FA
- 卡片背景: #FFFFFF
- 主文字: #333333
- 次要文字: #666666
- 边框色: #E8E8E8

#### 深色主题
- 背景色: #121212
- 卡片背景: #1E1E1E
- 主文字: #E8E8E8
- 次要文字: #999999
- 边框色: #333333

### 字体规范

| 用途 | 大小 | 字重 |
|------|------|------|
| 大标题 | 24px | Bold |
| 标题 | 20px | Bold |
| 副标题 | 18px | Medium |
| 正文 | 16px | Regular |
| 辅助文字 | 14px | Regular |
| 小字 | 12px | Regular |

### 间距规范

- 页面边距: 16px
- 卡片间距: 12px
- 组件内边距: 16px
- 元素间距: 8px

### 圆角规范

- 大圆角: 16px (卡片)
- 中圆角: 12px (按钮)
- 小圆角: 8px (输入框)

---

## 开发规范

### 代码规范

1. **命名规范**
   - 组件: UpperCamelCase (如 `CustomButton`)
   - 变量/函数: lowerCamelCase (如 `getUserInfo`)
   - 常量: UPPER_SNAKE_CASE (如 `MAX_COUNT`)
   - 文件: UpperCamelCase.ets (如 `HomePage.ets`)

2. **类型声明**
   - 所有变量必须显式声明类型
   - 禁止使用 `any` 类型
   - 接口使用 `interface` 定义

3. **组件规范**
   - 使用 `@Component` 装饰器
   - 实现 `aboutToAppear` 和 `aboutToDisappear` 生命周期
   - UI层级不超过5层

4. **注释规范**
   - 文件头部添加文件说明
   - 复杂逻辑添加注释
   - 公共方法添加 JSDoc 注释

### Git提交规范

```
feat: 新功能
fix: Bug修复
docs: 文档更新
style: 代码格式
refactor: 重构
perf: 性能优化
test: 测试
chore: 构建/工具
```

---

## 风险与挑战

### 技术风险

1. **题库数据量大**: 需要优化数据库查询和分页加载
2. **离线存储**: 确保数据本地持久化的可靠性
3. **性能优化**: 大量题目渲染时的性能问题

### 应对策略

1. 使用数据库索引优化查询
2. 实现数据分页加载
3. 使用 LazyForEach 优化列表渲染
4. 定期数据备份机制

---

## 后续扩展

### 功能扩展

- [ ] 在线题库更新
- [ ] 学习社区
- [ ] 考试资讯
- [ ] AI智能答疑
- [ ] 多端数据同步

### 平台扩展

- [ ] 平板适配
- [ ] 折叠屏适配
- [ ] 智慧屏适配

---

## 参考资源

- [HarmonyOS开发文档](https://developer.harmonyos.com/)
- [ArkTS编程指南](https://developer.harmonyos.com/docs)
- [ArkUI开发指南](https://developer.harmonyos.com/docs)
- DigitalSprouting 项目代码参考

---

**文档版本**: v1.0
**创建时间**: 2024-12-16
**维护者**: 开发团队
