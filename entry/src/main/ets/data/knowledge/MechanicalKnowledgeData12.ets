/**
 * 机械电气 - 知识库文章数据第12部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_12: KnowledgeArticle[] = [
  {
    id: 'mech_article_033',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 明渠流量测量',
    summary: '介绍明渠流量测量的断面选择及测点布置要求',
    content: '明渠的流量测量：测量断面的选择应足够重视流速仪测量断面的选择，以确保测试精度满足要求。测量断面的选择需注意下面几点：矩形、梯形测量断面的宽度和深度都必须大于0.8米，或为流速仪叶轮直径的8倍。测量断面应选在平直的渠段内，其底部应尽可能水平，测量断面上游侧的直渠段至少为测量断面宽度的2倍，测量断面的上游侧和下游侧应避免干扰，以免引起流速分布的异常变化。流速仪的轴线应与水流方向平行，测流断面应与水流方向垂直。如果现场不具备这些条件，则不应采用流速仪测量。这些条件意味着只有在已被证实了具有良好水力条件的人工渠道上才能采用流速仪进行流量测量。测点数目：对于矩形或梯形测量断面，至少需要布置25个测点，如测量断面面积为A，则测点数目H乘以Z可按下式计算：24乘以A的立方根小于等于Z小于等于36乘以A的立方根。式中A为测量断面的面积，单位平方米。',
    contentType: ContentType.TEXT,
    tags: ['明渠测量', '断面选择', '测点布置', '流速仪'],
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
    id: 'mech_article_034',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 明渠测点布置与水位检测',
    summary: '介绍明渠流量测量的测点布置原则及水流稳定水位检测方法',
    content: '测点布置：在流速梯度较大的区域，比如测量断面的边壁、底部及自由水面附近，测点应布置密一些。靠近渠道边壁或底部的流速仪，其轴线与渠道边壁或底部的距离应在下列范围内。最小为0.75倍的流速仪叶轮外径。最大为0.20米。每列顶部流速仪的轴线至少应在自由水面以下一个叶轮直径处。水流稳定水位检测：由于测量断面的水位通常用于确定过水断面的水深，所以在每个试验测程中应对水位进行检测。水深的变化值不得超过平均水深的正负1%。在整个试验过程中应监视任何一部或多部流速仪的变化而引起的平均流速的变化。试验中应确保流速分布尽可能的规律性，在试验前应了解被测量断面的流速分布规律。如果在明渠或引水结构进口处发现流速分布很不规则，则应安装导流板、潜水顶板、稳流栅、浮箱等以改善测量断面的流态。',
    contentType: ContentType.TEXT,
    tags: ['测点布置', '水位检测', '流速分布', '流态改善'],
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
    id: 'mech_article_035',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 圆形封闭管道流量测量',
    summary: '介绍圆形封闭管道流量测量的标准要求及测点布置方法',
    content: '圆形封闭管道的流量测量：圆形封闭管道的流量测量按标准ISO3354有关规定进行。测量断面的选择：测量断面必须位于直管段内，测量断面的上游侧直管段长度宜达到管道直径的20倍，下游侧直管段长度宜达到管道直径的5倍。如果不满足这一条件，则测点数目应增加，增加的测点数目由相关双方协商确定。测点数目：要确定整个圆断面上的流速分布，其测点必须布置在同心圆的圆周上，且至少在2根互相垂直的直径上，每个半径上至少布置3个测点，再加上管道断面的中心布置一个测点，这样圆断面管道测点数目至少为13点。流速仪测流法可采用一部流速仪或固定的一组流速仪沿测量断面移动进行测量。但是，采用固定的一组流速仪测量受限于管道直径和测点数目。一方面由于阻塞的影响，流速仪支架的总面积与管道测量断面的面积之比应小于6%，另一方面由于旁边流速仪的影响，当管道直径小于7.5d加0.18米时，d为流速仪叶轮外径，无论在什么情况下都不允许采用固定的一组流速仪进行测量。',
    contentType: ContentType.TEXT,
    tags: ['封闭管道', '流量测量', 'ISO3354', '测点布置'],
    source: '机械电气第3版',
    readTime: 12,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  }
];
