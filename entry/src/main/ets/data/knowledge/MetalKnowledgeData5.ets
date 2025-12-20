/**
 * 金属结构 - 知识库文章数据第5部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const METAL_KNOWLEDGE_ARTICLES_5: KnowledgeArticle[] = [
  {
    id: 'metal_article_013',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 射线照相质量影响因素',
    summary: '介绍影响射线照相质量的三大要素：相对比度、不清晰度和颗粒度',
    content: '射线照相灵敏度是射线照相对比度即缺陷影像与其周围背景的黑度差、不清晰度即影像轮廓边缘黑度过渡区的宽度和颗粒度即影像黑度的不均匀程度三大要素的综合结果，而此三大要素又分别受到不同工艺因素的影响。射线照相对比度如果工件中存在厚度差，那么射线穿透工件后，不同厚度部位的透射线的强度就不同，曝光后经暗室处理得到的底片上不同部位就会产生不同的黑度，射线照相底片上的影像就是由不同黑度的阴影构成的，阴影和背景的黑度差称为底片对比度，又叫底片反差。',
    contentType: ContentType.TEXT,
    tags: ['射线照相', '相对比度', '不清晰度', '颗粒度', '质量影响'],
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
    id: 'metal_article_014',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 射线照相不清晰度',
    summary: '介绍射线照相不清晰度的概念、产生原因及影响因素',
    content: '射线照相不清晰度是指底片上的影像边缘会产生一定宽度的半影，此半影宽度就是几何不清晰度。由于X射线管焦点或伽马射线源都有一定尺寸，所以透照工件时，工件表面轮廓或工件中的缺陷影像边缘会产生一定宽度的半影。几何不清晰度与焦点尺寸和工件厚度成正比，而与焦点至工件表面的距离成反比。在焦点尺寸和工件厚度给定的情况下，为获得较小的几何不清晰度值，透照时就需要取较小的焦距，但由于射线强度与距离平方成反比，如果要保证底片黑度不变，在增大焦距时就必须延长曝光时间或提高管电压。固有不清晰度是由照射到胶片上的射线在乳剂层中激发出的电子的散射所产生的。',
    contentType: ContentType.TEXT,
    tags: ['不清晰度', '几何不清晰度', '固有不清晰度', '射线检验'],
    source: '金属结构第3版',
    readTime: 12,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'metal_article_015',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 黑度计的使用',
    summary: '介绍黑度计的分类、工作原理及使用方法',
    content: '黑度计又名光学密度计，或简称密度计。射线照相底片的黑度均用透射式黑度计测量。早期的黑度计是模拟电路指针显示的光电直读式黑度计，现在已很少使用。目前广泛使用的是数字显示黑度计，其结构原理与指针式不同，该类仪器将接收到的模拟光信号转换成数字电信号，进行数据处理后直接在数码显示器显示出底片黑度数值。数字显示黑度计有便携式和台式两种，前者比后者体积更小、质量更轻。黑度计使用前应进行校零：光阑上不放底片，按下测量臂，入射光直接照到光传感器上，按校零按钮，显示0.00，此时微处理器记下入射光通量，即完成校零。',
    contentType: ContentType.TEXT,
    tags: ['黑度计', '密度计', '数字显示', '射线检验'],
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
