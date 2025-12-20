/**
 * 量测 - 知识库文章数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MEASUREMENT_KNOWLEDGE_ARTICLES: KnowledgeArticle[] = [
  {
    id: 'measure_article_001',
    subjectId: AppConstants.SUBJECT_MEASUREMENT,
    categoryId: 'measure_001',
    categoryName: '测量基础',
    title: '第一章 概述 - 施工测量工作',
    summary: '介绍水利水电工程质量检测测量的概念和施工测量工作的特点',
    content: '工程建设阶段测量工作的主要任务是针对施工现场的不同要求，放样水工建筑物轮廓点，将建筑物的位置、形状、大小及高程在实地标定，作为工程施工的依据。',
    contentType: ContentType.TEXT,
    tags: ['施工测量', '质量检测', '控制测量'],
    source: '量测第3版',
    readTime: 14,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'measure_article_002',
    subjectId: AppConstants.SUBJECT_MEASUREMENT,
    categoryId: 'measure_001',
    categoryName: '测量基础',
    title: '第一章 概述 - 施工控制网的建立',
    summary: '介绍施工控制网的建立目的和布网方法',
    content: '建立施工控制网的主要目的是为建筑物的施工放样提供控制依据，也可为工程维护保养、扩建改建所进行的测量提供控制依据。',
    contentType: ContentType.TEXT,
    tags: ['施工控制网', '平面控制', '高程控制'],
    source: '量测第3版',
    readTime: 12,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  }
];
