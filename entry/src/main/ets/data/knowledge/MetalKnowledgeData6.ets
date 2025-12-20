/**
 * 金属结构 - 知识库文章数据第6部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const METAL_KNOWLEDGE_ARTICLES_6: KnowledgeArticle[] = [
  {
    id: 'metal_article_016',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 概述与主要标准',
    summary: '介绍金属腐蚀的危害及防腐蚀质量检验的主要标准规范',
    content: '金属腐蚀是破坏性的，对水工金属结构包括钢闸门、拦污栅、启闭机、压力钢管、清污机以及过坝通航金属结构等所造成的损失也是惊人的。水工金属结构的防腐蚀质量直接关系到结构的使用寿命、维护周期和工程造价。防腐蚀质量检验主要标准及规范包括水工金属结构防腐蚀规范SL 105、涂覆涂料前钢材表面处理表面清洁度的目视评定系列标准GBT 8923.1至8923.4、涂覆涂料前钢材表面处理喷射清理后的钢材表面粗糙度特性系列标准GBT 13288.1至13288.5、色漆和清漆漆膜的划格试验GBT 9286、热喷涂金属和其他无机覆盖层锌铝及其合金GBT 9793、牺牲阳极电化学性能试验方法GBT 17848、水利水电工程金属结构设备防腐蚀技术规程DLT 5358、钢结构工程施工质量验收规范GB 50205等。',
    contentType: ContentType.TEXT,
    tags: ['防腐蚀', '金属腐蚀', '标准规范', 'SL 105'],
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
    id: 'metal_article_017',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 表面预处理概述',
    summary: '介绍表面预处理的目的、要求及施工环境条件',
    content: '防腐蚀涂层的有效寿命与基体金属表面的预处理质量、涂层厚度、涂料组成以及涂装工艺等各种因素有关。在影响涂层寿命的各种因素中，基体金属表面预处理质量对提高涂层的有效寿命尤为重要。因此，水工金属结构在涂装之前必须进行表面预处理。表面预处理是指喷涂前对基体待喷涂部位的表面进行净化、粗化等以形成所希望的或规定的表面状态而进行的工作，又称前处理。表面预处理前，应将金属结构表面整修完毕，并将金属表面的焊渣、飞溅物、铁锈、氧化皮、积水、油污等附着物清除干净。表面预处理施工环境必须满足下列条件：空气相对湿度低于85%；基体金属表面温度不低于大气露点以上3摄氏度，压力钢管还规定环境温度不应低于5摄氏度。在不利气候条件下，应采取遮盖、采暖或输入净化干燥空气等措施，以满足施工环境要求。',
    contentType: ContentType.TEXT,
    tags: ['表面预处理', '防腐蚀', '施工环境', '涂层寿命'],
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
    id: 'metal_article_018',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 表面预处理方法',
    summary: '介绍水工金属结构表面预处理的主要方法，包括脱脂净化、喷抛射处理等',
    content: '水工金属结构表面预处理主要包括脱脂净化、喷抛射处理以及手工和动力工具除锈。脱脂净化的目的是除去基体金属表面的油、脂、机加工润滑剂等有机物。水工金属结构表面在进行喷抛射处理之前，必须仔细地清除焊渣、飞溅、毛刺等附着物，并清洗基体金属表面可见的油脂以及其他污物。喷抛射处理可分为干式和湿式两种方法。喷抛射处理所用的磨料分为金属磨料非金属磨料，必须清洁、干燥，并应根据基体金属的种类、表面原始锈蚀程度、除锈方法以及涂层类别来选择磨料的种类和粒度。金属热喷涂基体表面喷射处理应选用棱角状磨料。金属磨料粒度选择范围宜为0.5至1.5毫米，非金属磨料粒度选择范围宜为0.5至3.0毫米。',
    contentType: ContentType.TEXT,
    tags: ['表面预处理', '脱脂净化', '喷抛射处理', '磨料选择'],
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
