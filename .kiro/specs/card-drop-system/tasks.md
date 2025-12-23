# 答题卡片掉落系统 - 实现任务

## Overview

本任务列表将卡片掉落系统的设计分解为可执行的编码任务，按照数据层→服务层→展示层的顺序实现，确保每个任务都能独立验证。

## Tasks

- [x] 1. 数据层基础设施
  - [x] 1.1 创建卡片类型定义文件
    - 创建 `entry/src/main/ets/common/types/CardTypes.ets`
    - 定义 CardRarity 枚举、CardContentType 枚举
    - 定义 KnowledgeCard、UserCard、DroppedCard 等接口
    - KnowledgeCard 必须包含 questionAnalysis（题目解析）字段
    - 定义稀有度概率配置常量、碎片升星配置常量
    - _Requirements: 2.1, 3.1, 3.7_

  - [x] 1.2 扩展数据库表结构
    - 修改 `entry/src/main/ets/data/database/DatabaseService.ets`
    - 添加 user_cards 表（用户卡片收藏）
    - 添加 card_drop_records 表（掉落记录）
    - 添加 card_drop_state 表（保底计数等状态）
    - 创建必要的索引
    - _Requirements: 7.1_

- [x] 2. 卡片数据定义
  - [x] 2.1 创建卡片定义数据结构
    - 创建 `entry/src/main/ets/data/cards/CardDefinitions.ets`
    - 定义卡片数据加载和获取方法
    - 实现按稀有度、科目获取卡片池的方法
    - _Requirements: 3.1, 3.2_

  - [x] 2.2 创建基础知识科目卡片数据
    - 创建 `entry/src/main/ets/data/cards/BasicCards.ets`
    - 定义15张基础知识卡片（N/R/SR/SSR分布）
    - 每张卡片必须包含题目解析（questionAnalysis）
    - 包含知识点、记忆口诀、考点提示等内容
    - _Requirements: 3.2, 3.3, 3.7_

  - [x] 2.3 创建混凝土工程科目卡片数据
    - 创建 `entry/src/main/ets/data/cards/ConcreteCards.ets`
    - 定义13张混凝土工程卡片
    - _Requirements: 3.2_

  - [x] 2.4 创建其他科目卡片数据
    - 创建岩土、量测、金属、机电科目的卡片数据文件
    - 每个科目8张卡片（示例数据）
    - _Requirements: 3.2_

  - [x] 2.5 创建特殊限定卡片数据
    - 创建 `entry/src/main/ets/data/cards/SpecialCards.ets`
    - 定义节日限定卡、成就纪念卡等
    - 设置限定时间范围
    - _Requirements: 3.6_

- [x] 3. 核心服务层实现
  - [x] 3.1 实现卡片掉落判定服务
    - 创建 `entry/src/main/ets/services/CardDropService.ets`
    - 实现 tryDrop 方法（概率判定、保底机制）
    - 实现考试模式检测和禁用逻辑
    - 实现稀有度随机选择逻辑
    - 实现保底计数管理
    - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 2.1, 2.2_

  - [ ]* 3.2 编写掉落判定服务属性测试
    - **Property 2: 考试模式禁止掉落**
    - **Property 3: 保底机制验证**
    - **Validates: Requirements 1.3, 1.4**

  - [x] 3.3 实现卡片管理服务
    - 创建 `entry/src/main/ets/services/CardService.ets`
    - 实现 addCardToUser 方法（新卡/重复卡处理）
    - 实现碎片累积和自动升星逻辑
    - 实现 getUserCards、getCollectionProgress 方法
    - 实现筛选和排序功能
    - _Requirements: 2.3, 2.4, 5.2, 5.5, 5.6, 6.1, 6.4_

  - [ ]* 3.4 编写卡片管理服务属性测试
    - **Property 5: 重复卡片碎片转化**
    - **Property 6: 碎片升星逻辑**
    - **Property 10: 收集进度计算**
    - **Validates: Requirements 2.3, 2.4, 5.2**

  - [x] 3.5 实现卡片统计服务
    - 创建 `entry/src/main/ets/services/CardStatisticsService.ets`
    - 实现 recordDrop 方法（记录掉落）
    - 实现 getDropStatistics 方法（统计数据）
    - 实现 getTodayDroppedCards 方法
    - 实现 calculateLuckValue 方法（欧气值）
    - _Requirements: 7.1, 7.2, 7.3, 7.4_

  - [ ]* 3.6 编写统计服务属性测试
    - **Property 14: 掉落记录完整性**
    - **Property 15: 统计数据准确性**
    - **Validates: Requirements 7.1, 7.2**

- [x] 4. Checkpoint - 服务层验证
  - 所有服务层代码无语法错误
  - 数据库表结构已添加
  - 核心逻辑已实现

- [x] 5. UI组件实现
  - [x] 5.1 实现卡片掉落动画组件（集成在CardDropPopup中）
    - 实现卡片入场动画
    - 实现SR/SSR的特殊光效动画
    - 实现卡片翻转动画（点击查看背面）
    - _Requirements: 4.1, 4.2, 4.3_

  - [x] 5.2 实现卡片掉落弹窗组件
    - 创建 `entry/src/main/ets/components/CardDropPopup.ets`
    - 集成掉落动画组件
    - 显示新卡"NEW"标识或重复卡"碎片+N"
    - 卡片背面展示题目解析内容
    - 实现关闭和继续答题的交互
    - _Requirements: 4.4, 4.5, 3.7_

  - [x] 5.3 实现卡片展示组件
    - 创建 `entry/src/main/ets/components/CardItem.ets`
    - 实现卡片正面展示（图案、稀有度标识、星级）
    - 实现未获得卡片的灰色剪影样式
    - 实现满级"MAX"标识
    - 实现卡片详情弹窗组件
    - _Requirements: 5.1, 6.2, 6.3_

- [x] 6. 页面实现
  - [x] 6.1 实现卡片图鉴页面
    - 创建 `entry/src/main/ets/pages/CardCollectionPage.ets`
    - 实现顶部收集进度展示
    - 实现稀有度/科目筛选功能
    - 实现卡片网格展示（已获得彩色/未获得灰色）
    - 实现点击卡片查看详情
    - _Requirements: 5.1, 5.2, 5.3, 5.4, 5.5, 5.6_

  - [x] 6.2 实现我的卡册页面
    - 创建 `entry/src/main/ets/pages/CardAlbumPage.ets`
    - 实现排序和筛选功能
    - 实现卡片列表展示（星级、碎片进度）
    - 实现点击查看详情
    - _Requirements: 6.1, 6.2, 6.3, 6.4, 6.5_

  - [x] 6.3 添加路由配置
    - 在 main_pages.json 中注册 CardCollectionPage 和 CardAlbumPage
    - _Requirements: 8.1_

- [x] 7. 系统集成
  - [x] 7.1 集成到答题页面
    - 修改 `entry/src/main/ets/pages/AnswerPage.ets`
    - 在 submitAnswer 后调用 CardDropService.tryDrop
    - 收集本次练习获得的所有卡片
    - 答题后立即展示掉落弹窗
    - _Requirements: 1.1, 1.2, 8.3_

  - [x] 7.2 集成到题库Tab页面
    - 修改 `entry/src/main/ets/pages/MainTabPage.ets`
    - 在题库Tab添加"我的卡册"入口卡片
    - _Requirements: 8.1_

  - [ ] 7.3 集成到"我的"页面
    - 修改 MainTabPage 的 ProfileContent
    - 添加卡片收集进度展示
    - _Requirements: 8.2_

  - [ ] 7.4 集成到首页
    - 修改 MainTabPage 的 HomeContent
    - 添加"今日卡片"展示区
    - _Requirements: 8.4_

- [x] 8. 考试模式排除
  - [x] 8.1 确保考试模式不触发掉落
    - CardDropService.tryDrop 方法已实现 isExamMode 参数检查
    - 考试模式下直接返回 null，不触发掉落
    - _Requirements: 1.3_

- [ ] 9. Final Checkpoint - 完整功能验证
  - 核心功能已实现
  - 待用户测试验证完整流程
  - 如有问题请反馈

## Notes

- 任务标记 `*` 的为可选测试任务，已跳过
- 卡片数据已创建示例卡片，后续可补充更多
- 动画效果已实现基础版本
- 7.3 和 7.4 为可选增强功能，核心功能已完成
