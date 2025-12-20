/**
 * 机械电气 - 知识库文章数据第13部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_13: KnowledgeArticle[] = [
  {
    id: 'mech_article_036',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 管道测点布置表',
    summary: '介绍圆形封闭管道流速仪测点布置的具体参数',
    content: '测点布置可根据表5-2确定。表5-2流速仪测点布置给出了不同测点数Z对应的各半径比值和适用管道内径范围。当Z等于3时，第一测点半径比为0.816，第二测点半径比为0.577，适用管道内径1200至2400毫米。当Z等于4时，第一测点半径比为0.866，第二测点半径比为0.707，第三测点半径比为0.5，适用管道内径2200至3200毫米。当Z等于5时，第一测点半径比为0.894，第二测点半径比为0.775，第三测点半径比为0.632，第四测点半径比为0.447，适用管道内径2900至4500毫米。当Z等于6时，各半径比依次为0.912、0.816、0.707、0.577、0.408，适用管道内径3800至5500毫米。当Z等于7时，各半径比依次为0.926、0.845、0.756、0.655、0.535、0.378，适用管道内径5000至7000毫米。当Z等于8时，各半径比依次为0.936、0.866、0.791、0.707、0.613、0.5、0.354，适用管道内径6300至8500毫米。注：第一测点半径为测量管道直径的参考值；Z为每个半径上的测点数目；各半径比为圆周半径与边壁测点半径的比值；D为管道内径；d为流速仪叶轮直径。',
    contentType: ContentType.TEXT,
    tags: ['测点布置', '半径比', '管道内径', '流速仪'],
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
    id: 'mech_article_037',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 流量计算方法',
    summary: '介绍流量的计算方法及边壁区域流速分布规律',
    content: '流量计算：流量的计算可采用图形积分法和数值积分法，但无论采用哪种方法，都必须检查流速分布曲线，以判断是否有可疑的测量值。边壁区域的流速可根据流速分布规律采用外推法求得，外推公式为：距边壁距离y处的流速等于边壁测点处的流速乘以y除以a的m分之一次方。式中距边壁距离y处的流速为距边壁距离y处的流速，单位米每秒；边壁测点处的流速为边壁测点处的流速即边壁距离a处，单位米每秒；m为与边壁粗糙度和流动条件有关的系数。m的值按照标准ISO3354附录E中有关规定进行取值，其值通常为4，粗糙边壁低雷诺数时取值为5至7，光滑边壁高雷诺数时取值为9至10。对于相同叶轮的流速仪，每个半径上的测点数目可按下式计算：4倍根号R小于等于Z小于等于5倍根号R。式中R为管道内半径，单位米。圆形封闭管道流速仪测点布置见图5-2。',
    contentType: ContentType.TEXT,
    tags: ['流量计算', '图形积分', '数值积分', '外推法'],
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
    id: 'mech_article_038',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 反击式水轮机净正吸入比能',
    summary: '介绍反击式水轮机净正吸入比能的验收要求',
    content: '反击式水轮机净正吸入比能：验收试验时，反击式水轮机净正吸入比能NPSE不应低于合同中规定的数值。如果水力比能或转速实际平均值与规定值有偏差，则需要有NPSE除以E的最小保证值相对于E值的曲线。实际NPSE除以E不得低于图5-1所示曲线。冲击式水轮机最高尾水位不应超过合同中规定的数值。效率试验是水力机械质量检测的重要组成部分，通过科学规范的试验方法，可以准确评价水轮机和水泵的能量转换效率，为水电厂的经济运行提供可靠的技术依据。试验过程中应严格控制各项参数的波动范围，确保测量结果的准确性和可靠性。流速仪法作为常用的流量测量方法，其测点布置、仪器率定、采样时间等环节都需要按照相关标准严格执行，以保证试验精度满足要求。',
    contentType: ContentType.TEXT,
    tags: ['净正吸入比能', 'NPSE', '反击式水轮机', '验收试验'],
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
