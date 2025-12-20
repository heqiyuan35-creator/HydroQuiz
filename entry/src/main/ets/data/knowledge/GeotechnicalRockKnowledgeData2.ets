/**
 * 岩土工程岩石 - 知识库文章数据第2部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const GEOTECHNICAL_ROCK_KNOWLEDGE_ARTICLES_2: KnowledgeArticle[] = [
  {
    id: 'geo_rock_article_011',
    subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
    categoryId: 'geo_rock_001',
    categoryName: '岩石物理性质',
    title: '岩石耐崩解性试验',
    summary: '介绍岩石耐崩解性试验的原理和方法',
    content: '岩石耐崩解性是指岩石抵抗与水相互作用引起崩解破坏的能力。',
    contentType: ContentType.TEXT,
    tags: ['岩石耐崩解性', '干湿循环'],
    source: '岩土工程第3版',
    readTime: 10,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  }
];
