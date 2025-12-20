/**
 * 知识库相关类型定义
 * HydroQuiz - 水利工程检测员刷题宝
 */

/**
 * 内容类型枚举
 */
export enum ContentType {
  TEXT = 'text',       // 图文
  PDF = 'pdf',         // PDF文档
  VIDEO = 'video',     // 视频教程
  IMAGE = 'image'      // 图片
}

// 别名，兼容旧代码
export type KnowledgeContentType = ContentType;

/**
 * 知识文章接口
 */
export interface KnowledgeArticle {
  id: string;                    // 文章唯一ID
  subjectId: string;             // 所属科目ID（对应七大项）
  categoryId: string;            // 分类ID（二级分类）
  categoryName: string;          // 分类名称
  title: string;                 // 文章标题
  summary: string;               // 摘要
  content: string;               // 正文内容
  contentType: ContentType;      // 内容类型
  tags: string[];                // 标签
  source: string;                // 来源（如：GB 26860-2011）
  readTime: number;              // 预计阅读时间（分钟）
  isPinned: boolean;             // 是否置顶
  isDownloaded: boolean;         // 是否已下载
  createTime: number;            // 创建时间
  updateTime: number;            // 更新时间
  viewCount: number;             // 阅读次数
  relatedQuestionIds: string[];  // 关联题目ID
}

/**
 * 知识分类接口
 */
export interface KnowledgeCategory {
  id: string;                    // 分类ID
  subjectId: string;             // 所属科目ID
  name: string;                  // 分类名称
  icon: string;                  // 图标
  articleCount: number;          // 文章数量
  order: number;                 // 排序
}

/**
 * 知识库科目接口
 */
export interface KnowledgeSubject {
  id: string;                    // 科目ID
  name: string;                  // 科目名称
  shortName: string;             // 简称
  icon: string;                  // 图标
  color: string;                 // 主题色
  categories: KnowledgeCategory[]; // 下属分类
  articleCount: number;          // 文章总数
}

/**
 * 知识库阅读记录接口
 */
export interface KnowledgeReadRecord {
  id: string;                    // 记录ID
  articleId: string;             // 文章ID
  readTime: number;              // 阅读时长（秒）
  progress: number;              // 阅读进度（0-100）
  lastReadTime: number;          // 最后阅读时间
}

/**
 * 阅读记录接口（别名，兼容旧代码）
 */
export type ReadingRecord = KnowledgeReadRecord;

/**
 * 知识库收藏接口
 */
export interface KnowledgeFavorite {
  id: string;                    // 记录ID
  articleId: string;             // 文章ID
  createTime: number;            // 收藏时间
}

/**
 * 知识库搜索结果接口
 */
export interface KnowledgeSearchResult {
  article: KnowledgeArticle;     // 文章信息
  matchType: 'title' | 'content' | 'tag'; // 匹配类型
  highlight: string;             // 高亮片段
}
