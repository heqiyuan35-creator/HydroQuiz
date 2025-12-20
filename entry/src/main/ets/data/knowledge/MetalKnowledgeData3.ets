/**
 * 金属结构 - 知识库文章数据第3部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const METAL_KNOWLEDGE_ARTICLES_3: KnowledgeArticle[] = [
  {
    id: 'metal_article_007',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 焊缝内部缺陷检验人员要求',
    summary: '介绍焊接检验人员和无损检测人员的资质要求',
    content: '焊接检验人员应经过专门的技术培训，并取得相应的上岗资格证书。无损检测人员必须按照无损检测人员资格鉴定与认证GB/T 9445的要求进行培训和资格鉴定合格，取得全国通用资格证书并通过相关行业部门的资格认可。各级无损检测人员应按照无损检测应用导则GB/T 5616的原则和程序开展与其资格证书准许项目相同的检测工作，质量评定和检测报告审核应由2级及以上的无损检测人员担任。',
    contentType: ContentType.TEXT,
    tags: ['检验人员', '无损检测', '资格证书', 'GB/T 9445'],
    source: '金属结构第3版',
    readTime: 8,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'metal_article_008',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 无损探伤方法',
    summary: '介绍常用的无损探伤方法及其特点',
    content: '常用的无损探伤方法有射线检验RT、超声波探伤UT、磁粉探伤MT、渗透探伤PT、衍射时差法超声检测TOFD等。射线检验、超声波探伤、衍射时差法超声检测主要用于检验焊缝内部缺陷。磁粉探伤和渗透探伤主要用于检验焊缝表面及近表面缺陷。射线检验适用于一般金属和非金属焊件，不适用于锻件及轧制的型材。超声波探伤适用于管材、棒材和锻件焊缝的探伤检验。磁粉探伤限于铁磁性材料。渗透探伤适用于各种金属和非金属焊件。',
    contentType: ContentType.TEXT,
    tags: ['无损探伤', '射线检验', '超声波探伤', '磁粉探伤', '渗透探伤'],
    source: '金属结构第3版',
    readTime: 10,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'metal_article_009',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 焊缝外观质量要求',
    summary: '介绍闸门及启闭机焊缝外观质量的具体要求',
    content: '水工金属结构的所有焊缝均须进行外观检查，闸门及启闭机焊缝外观质量应符合相关规定。压力钢管焊缝外观质量应符合相关规定。焊缝外观质量检验项目包括：裂纹、表面夹渣、咬边、未焊满、表面气孔、焊瘤、飞溅、焊缝余高、对接接头焊缝宽度、角焊缝焊脚等。其中裂纹不允许存在，表面夹渣不允许存在，咬边深度应小于等于0.5毫米，未焊满不允许存在，表面气孔不允许存在，焊瘤不允许存在，飞溅不允许存在。',
    contentType: ContentType.TEXT,
    tags: ['外观质量', '焊缝检验', '质量要求', '缺陷检验'],
    source: '金属结构第3版',
    readTime: 10,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  }
];
