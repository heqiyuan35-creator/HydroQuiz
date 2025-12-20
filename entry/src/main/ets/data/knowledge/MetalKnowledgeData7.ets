/**
 * 金属结构 - 知识库文章数据第7部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const METAL_KNOWLEDGE_ARTICLES_7: KnowledgeArticle[] = [
  {
    id: 'metal_article_019',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 表面清洁度检验',
    summary: '介绍表面清洁度的概念、评定方法及除锈等级标准',
    content: '表面清洁度是指除去钢铁表面氧化皮、铁锈以及其他附着物的程度。清洁度等级越高，涂层保护效果越好。表面清洁度等级评定时，应用GBT 8923.1、GBT 8923.2中相应的照片与被检基体金属表面进行目视比较，评定方法应按其规定执行。喷抛射处理后，钢闸门、启闭机以及压力钢管的明管、埋管内壁的基体金属表面清洁度等级宜不低于GBT 8923.1中的规定，清洁度等级共分为Sa1、Sa2、Sa2.5、Sa3级。明管、埋管外壁经喷抛射处理后，其除锈等级根据设计规定采用水泥浆防腐蚀或涂料防腐蚀的不同，应达到表3-1中所规定的除锈等级标准。明管外壁喷涂涂料要求除锈等级Sa2.5，表面粗糙度40至70微米；埋管外壁改性水泥胶浆要求除锈等级Sa1。',
    contentType: ContentType.TEXT,
    tags: ['表面清洁度', '除锈等级', 'Sa2.5', '目视评定'],
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
    id: 'metal_article_020',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 表面粗糙度检验',
    summary: '介绍表面粗糙度的概念、选择范围及检验方法',
    content: '表面粗糙度是指预处理后基体金属表面的粗糙程度。合理的粗糙度可使涂层与基底很好咬合，从而具有理想的结合强度。喷抛射处理后，SL 105规定表面粗糙度应为40至150微米。具体取值可根据涂层类别按表3-2选定。非厚浆型涂料表面粗糙度40至70微米，厚浆型涂料60至100微米，超厚浆型涂料100至150微米，金属热喷涂60至100微米。评定表面粗糙度等级时，应按照GBT 13288.1、GBT 13288.2、GBT 13288.3、GBT 13288.4、GBT 13288.5用标准样块目视比较评定粗糙度等级，或用仪器直接测定表面粗糙度值。比较样块法应根据不同的磨料选择相应的样块进行评定。将样块靠近被检表面的某一测定点进行目视比较，必要时可借助不大于7倍的放大镜，以基体金属表面外观最接近的样块所示的粗糙度等级作为评定结果。',
    contentType: ContentType.TEXT,
    tags: ['表面粗糙度', '比较样块法', '仪器法', '涂层类别'],
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
    id: 'metal_article_021',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 涂料保护质量检验概述',
    summary: '介绍涂料保护系统的选择原则及防腐蚀涂层系统的组成',
    content: '用于水工金属结构防腐蚀的涂料，宜选用经过工程实践证明其综合性能良好的产品；否则，应经过试验论证确认其性能优异并满足设计要求。构成涂层系统的所有涂料宜由同一制造厂生产，不同厂家的涂料进行配套使用时，应进行配套试验并证明其性能满足要求。构成涂层系统的各层涂料之间应有良好的配套性。涂层系统的选择应根据所处的环境按照SL 105的要求执行。防腐蚀涂层系统宜由底漆、中间漆和面漆构成。底漆应具有良好的附着力和防锈性能，中间漆应具有屏蔽性能且与底、面漆结合良好，面漆应具有耐候性或耐水性。涂装前应对表面预处理的质量进行检验，合格后方能进行涂装。进行涂装施工时，环境空气相对湿度应低于85%，基体金属表面温度应不低于大气露点以上3摄氏度以及现场环境温度不低于10摄氏度，启闭机为不低于5摄氏度。',
    contentType: ContentType.TEXT,
    tags: ['涂料保护', '涂层系统', '底漆', '面漆', '配套性'],
    source: '金属结构第3版',
    readTime: 12,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  }
];
