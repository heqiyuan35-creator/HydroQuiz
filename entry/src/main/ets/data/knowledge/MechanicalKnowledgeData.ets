/**
 * 机械电气 - 知识库文章数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

/**
 * 机械电气文章数据
 */
export const MECHANICAL_KNOWLEDGE_ARTICLES: KnowledgeArticle[] = [
  {
    id: 'mech_article_001',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 传感器分类',
    summary: '介绍传感器的分类方法，包括按被测物理量、工作原理、信号变换特征等分类',
    content: '传感器的分类方法很多，概括起来主要有下面几种：按被测物理量来分类，可分为位移传感器、速度传感器、加速度传感器、力传感器、温度传感器等。按传感器工作的物理原理来分类，可分为机械式、电气式、辐射式、流体式等。按信号变换特征来分类，可分为物性型和结构型。所谓物性型传感器，是利用敏感器件材料本身物理性质的变化来实现信号的检测。例如，用水银温度计测温，是利用了水银热胀冷缩的性质；用光电传感器测速，是利用了光电器件本身的光电效应。所谓结构型传感器，是通过传感器本身结构参数的变化来实现信号的转换。例如石英晶体的压电效应等。按传感器与被测量之间的关系来分类，可分为能量转换型和能量控制型。能量转换型传感器或称无源传感器，是直接由被测对象输入能量使其工作的。例如，热电偶将被测温度直接转换为电量输出。能量控制传感器，也称有源传感器，是从外部供给辅助能量使传感器工作的，并且由被测量来控制外部供给能量的变化。另外，按传感器输出量的性质可分为模拟式和数字式。',
    contentType: ContentType.TEXT,
    tags: ['传感器', '分类', '物性型', '结构型', '能量转换'],
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
    id: 'mech_article_002',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 传感器主要性能指标',
    summary: '介绍传感器的主要性能指标，包括量程、精确度、灵敏度、线性度等',
    content: '传感器性能指标较多，下面就其主要指标加以简单介绍。量程：传感器能测量的最大输入量与最小输入量之间的范围称为传感器的量程。精确度或称精度，是指测量某物理量的测定值与真值相符合的程度。灵敏度：灵敏度是指传感器在稳态下输出量变化与输入量变化的比值，即K等于输出量的变化除以输入量的变化。线性度或称非线性误差，表示传感器的输出与输入之间的关系曲线与选定的工作曲线的偏离程度。传感器的线性度用特性曲线和其选定的工作曲线也叫拟合曲线之间的最大偏差与传感器满量程输出之比来表示。迟滞：迟滞表示传感器输入量由小到大与由大到小所得输出不一致的程度。迟滞在数值上用同一输入量下最大的迟滞偏差与满量程输出的百分比表示。重复性：重复性表示传感器在输入量按同一方向作全量程连续多次变动时所得特性曲线不一致的程度。根据误差理论，重复性误差属于随机误差，因此应根据标准差来计算重复性误差。',
    contentType: ContentType.TEXT,
    tags: ['传感器', '性能指标', '量程', '精确度', '灵敏度', '线性度'],
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
    id: 'mech_article_003',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 传感器性能指标续',
    summary: '介绍传感器的零点漂移、动态特性、稳定性、精确度等性能指标',
    content: '零点漂移简称零漂，表示在零输入的状态下输出值的漂移。一般有下面两种零漂：时间零漂一般指在规定时间内，在室温不变的条件下零输出的变化。温度零漂：绝大部分传感器在温度变化时特性会有所变化。一般用零点温漂和灵敏度温漂来表示这种变化程度，即温度每变化1摄氏度，零点输出或灵敏度的变化值。动态特性：动态特性是指传感器对随时间变化的输入量的响应特性。传感器的选用原则：如何根据测试目的和实际条件正确合理地选用传感器，是进行测量时首先要解决的精度的一个重要环节。在实际中也并非要求传感器的精确度越高越好，还需要考虑到测量目的，同时还需要考虑到经济性。因为传感器的精度越高，其价格就越昂贵，所以应从实际出发来选择传感器。除以上选用传感器时应充分考虑的一些因素外，还应尽可能兼顾结构简单、体积小、质量轻、价格便宜、易于维修、易于更换等条件。',
    contentType: ContentType.TEXT,
    tags: ['传感器', '零点漂移', '动态特性', '选用原则'],
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
