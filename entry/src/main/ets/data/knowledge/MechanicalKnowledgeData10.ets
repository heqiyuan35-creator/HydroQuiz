/**
 * 机械电气 - 知识库文章数据第10部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_10: KnowledgeArticle[] = [
  {
    id: 'mech_article_027',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 概述',
    summary: '介绍效率试验的目的、意义及水力机械效率的基本概念',
    content: '效率检测是水力机械质量检测的主要内容之一，效率试验在实验室内的能量试验台上进行的称为模型效率试验，在厂房真机上进行的称为原型效率试验。本书所述效率试验均为原型效率试验。效率试验的目的和意义：水轮机把通过的水流能量转化为机械能，再通过水轮发电机将机械能转化为电能。水泵将电能转化为机械能。因此，水轮机与水泵作为一种能量转换装置，其转换效率是评价能量转换装置优劣的最重要的指标。对于水电机组，如机组长期在低效率区或在低水头下运行，将严重影响机组效率的发挥，还会造成严重的振动和气蚀破坏。因此，需要摸清现有运行机组在运行中的实际效率状况。为了充分利用水力资源，提高水力发电厂的经济效益，实现水力机组乃至整个电网的经济运行，需要在水电厂开展水力机组的效率试验。实测出水力机组乃至整个水电厂的动力特性，使得各个水电厂效率试验成果成为整个电网优化运行的可靠的基础技术资料并指导水电厂的经济运行。',
    contentType: ContentType.TEXT,
    tags: ['水力机械', '效率试验', '水轮机', '能量转换'],
    source: '机械电气第3版',
    readTime: 12,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'mech_article_028',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 试验原理与方法',
    summary: '介绍水力机械效率的计算原理及试验方法分类',
    content: '试验原理：水力机械的效率是有用功即功率与总功即总功率之比，或者描述为输出功率与输入功率的比值，对于水轮机即为水轮机轴功率与水流功率的比值，对于水泵即为水泵轴功率与输入电功率的比值。水轮机效率等于发电机出力即电机功率除以水流输入功率即对水流做功。水泵效率等于水流输出功率除以电机功率。试验方法：效率试验中观测项目较多，但工作量最大的是流量测量，且各种测流方法差别很大。除热力学法直接得到效率外，流量的测量直接决定了试验的规模与性质，因此效率试验方法的分类是以流量测量方法的类别为依据的。目前，适用于现场测试的方法主要有流速仪法、压力时间法、蜗壳差压法、超声波法、示踪法以及堰测法、毕托管法、相对法等。',
    contentType: ContentType.TEXT,
    tags: ['效率计算', '试验方法', '流量测量', '水轮机效率'],
    source: '机械电气第3版',
    readTime: 10,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'mech_article_029',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 试验条件与参数波动',
    summary: '介绍效率试验的条件要求及测程中参数波动量的规定',
    content: '试验条件中测程中参数的变化波动量：波动量定义为水头或扬程、流量、功率及转速值对于其平均值的变量。可采用各种线性阻尼措施，以消除测量参数的波动，使测量参数尽可能维持在平均值附近，若发生突变，则该测程数据无效。测程内参数波动量应在表5-1给出的数值范围内。水轮机功率波动量为正负1.5%，水头或扬程波动量为正负1.0%，流量波动量为正负3%，转速波动量为正负0.5%。水泵I级功率波动量为正负3%，水头或扬程波动量为正负3%，流量波动量为正负3%，转速波动量为正负1%。水泵II级功率波动量为正负6%，水头或扬程波动量为正负6%，流量波动量为正负6%，转速波动量为正负2%。机程中水力比能和转速的平均值与规定值的偏差：验收试验时，测程中测得的平均水力比能E和转速n相对于规定值的偏离量，在所有情况下都必须在规定范围内。',
    contentType: ContentType.TEXT,
    tags: ['试验条件', '参数波动', '水轮机', '水泵'],
    source: '机械电气第3版',
    readTime: 10,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  }
];
