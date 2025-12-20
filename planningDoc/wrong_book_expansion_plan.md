# 错题本功能拓展开发计划

## 一、当前功能现状

### 已实现功能
1. **错题列表展示** - 显示所有错题，支持科目标签、错误次数
2. **今日错题筛选** - 通过路由参数 `filter=today` 筛选当日错题
3. **单题练习** - 点击错题进入 WrongPracticePage 练习
4. **答对飞走动画** - 答对后题目飞走并标记为已掌握
5. **入场动画** - 列表渐次入场效果
6. **自动清理** - 超过1个月的错题自动清理

---

## 二、拓展功能规划

### 2.1 筛选与排序功能
**优先级：高**

| 功能 | 描述 |
|------|------|
| 科目筛选 | 按科目筛选错题（基础、混凝土、岩土等） |
| 错误次数排序 | 按错误次数降序/升序排列 |
| 时间排序 | 按最近错误时间排序 |
| 题型筛选 | 按单选/多选/判断筛选 |

**实现方案**：
- 顶部添加筛选栏（Tab 或下拉选择）
- 新增 `sortMode` 和 `subjectFilter` 状态
- 修改 `loadWrongQuestions()` 支持筛选参数

---

### 2.2 批量操作功能
**优先级：高**

| 功能 | 描述 |
|------|------|
| 多选模式 | 长按进入多选，可勾选多个错题 |
| 批量删除 | 批量标记为已掌握并删除 |
| 批量练习 | 选中的错题进入连续练习模式 |
| 全选/取消 | 快速全选或取消选择 |

**实现方案**：
- 新增 `isSelectMode` 状态
- `WrongQuestionItem` 添加 `isSelected` 属性
- 底部浮动操作栏（删除、练习按钮）

---

### 2.3 错题统计分析 ✅ 已完成
**优先级：中** → **已实现**

| 功能 | 描述 | 状态 |
|------|------|------|
| 错题概览卡片 | 错题总数、今日新增、已掌握、平均错误率 | ✅ |
| 科目分布图 | 饼图展示各科目错题占比 + 进度条列表 | ✅ |
| 题型错误分析 | 玫瑰图展示单选/多选/判断错误分布 | ✅ |
| 错误趋势 | 折线图展示近7天错题数量变化 | ✅ |
| 本周答题统计 | 堆叠柱状图展示每日答对/答错数量 | ✅ |
| 高频错题 | 整合在统计页面，展示错误次数最多的题目 | ✅ |
| 智能分析建议 | 根据用户数据动态生成个性化学习建议 | ✅ |

**实现方案**：
- ✅ 新建 `WrongStatisticsPage.ets` 统计页面
- ✅ 使用 ArkWeb + ECharts 实现图表（`wrong_statistics.html`）
- ✅ 新建 `WrongStatisticsService.ets` 统计数据服务
- ✅ ArkTS 与 Web 双向通信传递数据

---

### 2.4 智能复习提醒
**优先级：中**

| 功能 | 描述 |
|------|------|
| 艾宾浩斯复习 | 根据遗忘曲线推荐复习时间 |
| 复习提醒 | 到期错题推送本地通知 |
| 复习计划 | 自动生成每日复习任务 |

**实现方案**：
- `WrongQuestion` 添加 `nextReviewTime` 字段
- 复习间隔：1天、2天、4天、7天、15天
- 使用 HarmonyOS 本地通知 API

---

### 2.5 错题笔记功能 ✅ 已完成
**优先级：中** → **已实现**

| 功能 | 描述 | 状态 |
|------|------|------|
| 独立笔记页面 | `WrongNotePage.ets` 独立模块管理笔记 | ✅ |
| 添加/编辑笔记 | 底部弹窗编辑器，支持文本输入 | ✅ |
| 语音录入 | 使用 CoreSpeechKit 语音转文字 | ✅ |
| 笔记预览 | 卡片显示笔记摘要，有笔记的卡片高亮 | ✅ |
| 筛选功能 | 全部/有笔记 筛选，显示覆盖率 | ✅ |
| 入场动画 | 列表渐次入场效果 | ✅ |
| 拖拽删除 | 长按拖拽到底部删除笔记 | ✅ |

**实现方案**：
- ✅ 数据库 `wrong_questions` 表添加 `note` 字段
- ✅ 新建 `WrongNotePage.ets` 独立笔记管理页面
- ✅ 新建 `SpeechRecognitionService.ets` 语音识别服务
- ✅ 配置 `ohos.permission.MICROPHONE` 麦克风权限
- ✅ 错题本底部栏：📊 统计 | 📝 笔记 | 开始练习

**预留扩展**：
- 📷 拍照识别（待实现）
- 📋 笔记模板（待实现）
- 🔍 笔记搜索（待实现）

---

### 2.6 错题导出分享
**优先级：低**

| 功能 | 描述 |
|------|------|
| 导出 PDF | 将错题导出为 PDF 文件 |
| 生成图片 | 单题生成分享图片 |
| 打印支持 | 格式化打印错题 |

---

### 2.7 错题重做模式
**优先级：高**

| 功能 | 描述 |
|------|------|
| 顺序重做 | 按时间顺序重做所有错题 |
| 随机重做 | 随机抽取错题练习 |
| 限时挑战 | 限时完成 N 道错题 |
| 闯关模式 | 连续答对 N 题解锁下一关 |

**实现方案**：
- 新建 `WrongPracticeModePage.ets` 模式选择页
- 修改 AnswerPage 支持错题练习模式
- 添加计时器和关卡逻辑

---

## 三、开发优先级排序

### 第一阶段（核心功能）
1. ✅ 科目筛选
2. ✅ 排序功能
3. ✅ 批量操作（多选、批量删除）
4. ✅ 错题重做模式（已实现：顺序重做、随机重做、高频错题、限时挑战）

### 第二阶段（增强体验）
5. ✅ 错题统计分析（含高频错题展示、科目分布、趋势图表）
6. ✅ 错题笔记功能（独立模块，支持语音录入）

### 第三阶段（进阶功能）
7. 智能复习提醒
8. 错题导出分享

---

## 四、技术实现要点

### 4.1 数据库改动
```sql
-- wrong_questions 表新增字段
ALTER TABLE wrong_questions ADD COLUMN note TEXT;
ALTER TABLE wrong_questions ADD COLUMN next_review_time INTEGER;
ALTER TABLE wrong_questions ADD COLUMN review_count INTEGER DEFAULT 0;
```

### 4.2 新增页面
- ✅ `WrongStatisticsPage.ets` - 错题统计分析页（ArkWeb + ECharts）
- ✅ `WrongNotePage.ets` - 错题笔记管理页
- `WrongPracticeModePage.ets` - 练习模式选择页（待实现）

### 4.3 服务层扩展
```typescript
// AnswerRecordService 新增方法 ✅ 已实现
getWrongQuestionsBySubject(subjectId: string): Promise<WrongQuestion[]>
getWrongQuestionsSorted(sortBy: 'count' | 'time', order: 'asc' | 'desc'): Promise<WrongQuestion[]>
getWrongQuestionStats(): Promise<WrongStats>
batchMarkAsMastered(questionIds: string[]): Promise<void>
updateWrongQuestionNote(questionId: string, note: string): Promise<void>  // ✅
getWrongQuestionNote(questionId: string): Promise<string>  // ✅
getWrongQuestionsWithNotes(): Promise<WrongQuestion[]>  // ✅

// WrongStatisticsService 新增服务 ✅ 已实现
getOverviewData(): Promise<OverviewData>
getSubjectDistribution(): Promise<SubjectDistributionItem[]>
getQuestionTypeAnalysis(): Promise<QuestionTypeItem[]>
getWeeklyTrend(): Promise<TrendItem[]>
getWeeklyAnswerStats(): Promise<WeeklyAnswerItem[]>
generateSmartSuggestions(): Promise<SmartSuggestion[]>

// SpeechRecognitionService 新增服务 ✅ 已实现
initialize(): Promise<boolean>
startRecording(callback: SpeechRecognitionCallback): Promise<boolean>
stopRecording(): void
cancelRecording(): void
shutdown(): void
```

---

## 五、UI/UX 设计要点

1. **筛选栏** - 顶部横向滚动 Tab，支持科目+排序组合
2. **多选模式** - 长按触发，底部浮动操作栏
3. **统计页** - 卡片式布局，图表直观展示
4. **练习模式** - 大按钮选择，清晰的模式说明

---

---

## 六、已完成功能文件清单

| 功能模块 | 文件路径 |
|---------|---------|
| 错题统计页面 | `pages/WrongStatisticsPage.ets` |
| 统计图表HTML | `resources/rawfile/wrong_statistics.html` |
| 统计数据服务 | `services/WrongStatisticsService.ets` |
| 错题笔记页面 | `pages/WrongNotePage.ets` |
| 语音识别服务 | `services/SpeechRecognitionService.ets` |
| 麦克风权限配置 | `module.json5` |

---

**文档版本**: v1.1  
**创建时间**: 2024-12-18  
**更新时间**: 2024-12-18（完成统计分析、笔记功能）
