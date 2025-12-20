/**
 * 机械电气 - 知识库文章数据第2部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_2: KnowledgeArticle[] = [
  {
    id: 'mech_article_004',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 传感器选用原则',
    summary: '介绍传感器选用时需要考虑的因素，包括灵敏度、频率响应、线性范围、稳定性等',
    content: '灵敏度的选择：通常，在传感器的线性范围内，希望传感器的灵敏度越高越好。因为只有灵敏度高时，与被测量变化对应的输出信号的值才比较大，有利于信号处理。但要注意的是，传感器的灵敏度高，与被测量无关的外界噪声也容易混入，会被放大系统放大，影响测量精度。因此，要求传感器本身应具有较高的信噪比，尽量减少从外界引入的干扰信号。传感器的灵敏度是有方向性的。当被测量是单向量，而且对其方向性要求较高时，则应选择其他方向灵敏度小的传感器；如果被测量是多维向量，则要求传感器的交叉灵敏度越小越好。频率响应特性：传感器的频率响应特性决定了被测量的频率范围，必须在允许频率范围内保持不失真的测量条件，实际上传感器的响应总有一定延迟，希望延迟时间越短越好。传感器的频率响应高，可测的信号频率范围就宽。在动态测量中，应根据信号的特点稳态、瞬态、随机等响应特性来选择，以免产生过大的误差。',
    contentType: ContentType.TEXT,
    tags: ['传感器', '选用原则', '灵敏度', '频率响应', '信噪比'],
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
    id: 'mech_article_005',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 线性范围与稳定性',
    summary: '介绍传感器的线性范围和稳定性选择原则',
    content: '线性范围：传感器的线性范围是指输出与输入成正比的范围。从理论上讲，在此范围内，灵敏度保持定值。传感器的线性范围越宽，则其量程越大，并且能保证一定的测量精度。在选择传感器时，当传感器的种类确定以后首先要看其量程是否满足要求。实际上，任何传感器都不能保证绝对的线性，其线性度也是相对的。当所要求测量精度比较低时，在一定的范围内，可将非线性误差较小的传感器近似看做线性的，这会给测量带来极大的方便。稳定性：传感器使用一段时间后，其性能保持不变的能力称为稳定性。影响传感器长期稳定性的因素除传感器本身结构外，主要是传感器的使用环境。因此，要使传感器具有良好的稳定性，传感器必须有较强的环境适应能力。在选择传感器之前，应对其使用环境进行调查，并根据具体的使用环境选择合适的传感器，或采取适当的措施，减小环境的影响。传感器的稳定性有定量指标，在超过使用期后，在使用前应重新进行标定，以确定传感器的性能是否发生变化。在某些要求传感器能长期使用而又不能轻易更换或标定的场合，所选用的传感器稳定性要求更严格，要能够经受住长时间的考验。',
    contentType: ContentType.TEXT,
    tags: ['传感器', '线性范围', '稳定性', '量程', '环境适应'],
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
    id: 'mech_article_006',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 精确度与测量环境',
    summary: '介绍传感器精确度选择及根据测量环境确定传感器类型的方法',
    content: '精确度：精确度是表示传感器的输出与被测量的对应程度的，它是关系到整个测量系统测量精度的一个重要环节。在实际中也并非要求传感器的精确度越高越好，还需要考虑到测量目的，同时还需要考虑到经济性。因为传感器的精度越高，其价格就越昂贵，所以应从实际出发来选择传感器。根据测量对象与测量环境确定传感器的类型：要进行一个具体的测量工作，首先要考虑采用何种原理的传感器。这需要根据被测量的特点和传感器的使用条件考虑以下一些具体问题：量程的大小；被测位置对传感器体积的要求；测量方式为接触式还是非接触式；信号的引出方法，有线还是非接触测量。在考虑上述问题之后就能确定选用何种类型的传感器，然后考虑传感器的具体性能指标。',
    contentType: ContentType.TEXT,
    tags: ['传感器', '精确度', '测量环境', '选型方法'],
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
