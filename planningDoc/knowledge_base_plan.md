# 知识库构建计划

## 一、概述

根据题库的七大科目分类，构建与之对应的知识库系统，为用户提供系统化的学习资料。

## 二、七大科目分类

| 序号 | 科目ID | 科目名称 | 知识库分类 |
|------|--------|----------|------------|
| 1 | basic | 基础知识 | 水利检测基础理论 |
| 2 | concrete | 混凝土工程 | 混凝土检测技术 |
| 3 | geotechnical_rock | 岩土工程（岩石、土工） | 岩土检测技术 |
| 4 | geotechnical_foundation | 岩土工程（地基与基础） | 地基基础检测 |
| 5 | measurement | 量测 | 工程量测技术 |
| 6 | metal | 金属结构 | 金属结构检测 |
| 7 | mechanical | 机械电气 | 机电检测技术 |

## 三、知识库数据结构设计

### 3.1 知识文章类型定义

```typescript
// entry/src/main/ets/common/types/KnowledgeTypes.ets

// 知识文章类型
export interface KnowledgeArticle {
  id: string;                    // 文章唯一ID
  subjectId: string;             // 所属科目ID（对应七大项）
  categoryId: string;            // 分类ID（二级分类）
  categoryName: string;          // 分类名称
  title: string;                 // 文章标题
  summary: string;               // 摘要
  content: string;               // 正文内容（支持富文本/Markdown）
  contentType: 'text' | 'pdf' | 'video' | 'image';  // 内容类型
  tags: string[];                // 标签
  source?: string;               // 来源（如：GB 26860-2011）
  readTime: number;              // 预计阅读时间（分钟）
  isPinned: boolean;             // 是否置顶
  isDownloaded: boolean;         // 是否已下载
  createTime: number;            // 创建时间
  updateTime: number;            // 更新时间
  viewCount: number;             // 阅读次数
  relatedQuestionIds?: string[]; // 关联题目ID（可选）
}

// 知识分类
export interface KnowledgeCategory {
  id: string;                    // 分类ID
  subjectId: string;             // 所属科目ID
  name: string;                  // 分类名称
  icon?: string;                 // 图标
  articleCount: number;          // 文章数量
  order: number;                 // 排序
}

// 知识库科目扩展
export interface KnowledgeSubject {
  id: string;                    // 科目ID
  name: string;                  // 科目名称
  categories: KnowledgeCategory[]; // 下属分类
  articleCount: number;          // 文章总数
}
```

### 3.2 各科目知识分类规划

#### 1. 基础知识
- 水利工程概论
- 检测基础理论
- 安全规范
- 质量标准
- 法律法规

#### 2. 混凝土工程
- 水泥检测
- 骨料检测
- 外加剂检测
- 配合比设计
- 强度检测
- 耐久性检测
- 结构检测

#### 3. 岩土工程（岩石、土工）
- 岩石物理性质
- 岩石力学性质
- 土工试验
- 土的物理性质
- 土的力学性质

#### 4. 岩土工程（地基与基础）
- 地基处理
- 基础检测
- 桩基检测
- 地基承载力
- 沉降观测

#### 5. 量测
- 测量基础
- 变形监测
- 渗流监测
- 应力应变监测
- 仪器设备

#### 6. 金属结构
- 焊接检测
- 无损检测
- 防腐检测
- 闸门检测
- 启闭机检测

#### 7. 机械电气
- 水轮机检测
- 发电机检测
- 电气设备检测
- 继电保护
- 自动化系统

## 四、文件结构规划

```
entry/src/main/ets/
├── common/types/
│   └── KnowledgeTypes.ets          # 知识库类型定义
├── data/
│   └── knowledge/                   # 知识库数据目录
│       ├── KnowledgeCategoryData.ets    # 分类数据
│       ├── BasicKnowledgeData.ets       # 基础知识文章
│       ├── ConcreteKnowledgeData.ets    # 混凝土工程文章
│       ├── GeotechnicalRockKnowledgeData.ets    # 岩土（岩石土工）文章
│       ├── GeotechnicalFoundationKnowledgeData.ets  # 岩土（地基基础）文章
│       ├── MeasurementKnowledgeData.ets # 量测文章
│       ├── MetalKnowledgeData.ets       # 金属结构文章
│       └── MechanicalKnowledgeData.ets  # 机械电气文章
├── services/
│   └── KnowledgeService.ets        # 知识库服务
└── pages/
    ├── KnowledgeListPage.ets       # 知识库列表页
    └── KnowledgeDetailPage.ets     # 知识详情页
```

## 五、实施步骤

### 阶段一：基础架构（需要先完成）
| 任务 | 文件 | 说明 | 状态 |
|------|------|------|------|
| 1.1 | KnowledgeTypes.ets | 创建知识库类型定义 | ✅ |
| 1.2 | KnowledgeCategoryData.ets | 创建分类数据 | ✅ |
| 1.3 | KnowledgeService.ets | 创建知识库服务 | ✅ |

### 阶段二：数据填充（示例数据已创建，等待用户提供真实数据）
| 任务 | 文件 | 说明 | 状态 |
|------|------|------|------|
| 2.1 | BasicKnowledgeData.ets | 基础知识文章数据 | ✅ 示例 |
| 2.2 | ConcreteKnowledgeData.ets | 混凝土工程文章数据 | ✅ 示例 |
| 2.3 | GeotechnicalRockKnowledgeData.ets | 岩土（岩石土工）文章数据 | ✅ 示例 |
| 2.4 | GeotechnicalFoundationKnowledgeData.ets | 岩土（地基基础）文章数据 | ✅ 示例 |
| 2.5 | MeasurementKnowledgeData.ets | 量测文章数据 | ✅ 示例 |
| 2.6 | MetalKnowledgeData.ets | 金属结构文章数据 | ✅ 示例 |
| 2.7 | MechanicalKnowledgeData.ets | 机械电气文章数据 | ✅ 示例 |

### 阶段三：页面开发
| 任务 | 文件 | 说明 |
|------|------|------|
| 3.1 | MainTabPage.ets | 改造知识库Tab，使用真实数据 |
| 3.2 | KnowledgeListPage.ets | 知识库分类列表页 |
| 3.3 | KnowledgeDetailPage.ets | 知识详情页（支持富文本/Markdown渲染） |

### 阶段四：功能增强
| 任务 | 说明 |
|------|------|
| 4.1 | 搜索功能 |
| 4.2 | 收藏功能 |
| 4.3 | 阅读历史 |
| 4.4 | 离线下载 |
| 4.5 | 题目关联（从知识点跳转到相关题目） |

## 六、数据准备要求

请按以下格式准备各科目的知识文章数据：

```json
{
  "subjectId": "concrete",
  "categoryName": "水泥检测",
  "articles": [
    {
      "title": "水泥细度检测方法",
      "summary": "介绍水泥细度的检测原理和操作步骤...",
      "content": "正文内容...",
      "contentType": "text",
      "tags": ["水泥", "细度", "检测方法"],
      "source": "GB/T 1345-2005",
      "readTime": 10
    }
  ]
}
```

### 建议的内容类型：
1. **理论知识** - 基础概念、原理解释
2. **规范标准** - 国标、行标摘要
3. **操作指南** - 检测步骤、操作流程
4. **案例分析** - 实际案例、常见问题
5. **公式速查** - 计算公式、参数表

## 七、与题库的关联

知识库文章可以关联到相关题目，实现：
- 做题时查看相关知识点
- 知识点页面跳转到相关练习题
- 错题分析时推荐相关知识文章

---

**状态**: ✅ 阶段一完成，阶段二示例数据已创建，等待用户提供真实数据替换
