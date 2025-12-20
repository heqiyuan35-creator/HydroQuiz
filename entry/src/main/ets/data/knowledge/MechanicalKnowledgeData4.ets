/**
 * 机械电气 - 知识库文章数据第4部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_4: KnowledgeArticle[] = [
  {
    id: 'mech_article_010',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 半导体应变片',
    summary: '介绍半导体应变片的工作原理及压阻效应',
    content: '半导体应变片的结构见图1-9，其工作原理是半导体材料的压阻效应。压阻效应：单晶片材料在沿某一轴向受到外力作用时，其电阻率会发生变化的现象。半导体应变片比金属丝的灵敏度高50至70倍。半导体应变片的优点是灵敏度高。缺点是温度稳定性能差，灵敏度分散性大，在较大应变作用下，非线性误差大等。压阻式传感器：半导体材料受到应力作用时，其电阻率会发生变化，这种现象称为压阻效应。实际上，任何材料都不同程度地呈现压阻效应，但半导体材料的这种效应特别强。电阻应变效应的分析公式也适用于半导体电阻材料，对于金属材料来说，电阻率的相对变化比较小，但对于半导体材料，电阻率的相对变化远大于机械变形引起的电阻变化可以忽略，电阻的变化率主要是由电阻率变化引起的。由半导体理论可知，电阻率的相对变化等于压阻系数乘以应力，也等于压阻系数乘以弹性模量乘以应变。式中压阻系数为沿某晶向L的压阻系数，应力为沿某晶向L的应力，弹性模量为半导体材料的弹性模量。则半导体材料的灵敏系数K0等于压阻系数乘以弹性模量。',
    contentType: ContentType.TEXT,
    tags: ['半导体应变片', '压阻效应', '灵敏度', '压阻系数'],
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
    id: 'mech_article_011',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 常用传感器总结',
    summary: '总结常用传感器的类型及其应用特点',
    content: '常用传感器主要包括机械式传感器和电阻式传感器两大类。机械式传感器应用很广，在测试技术中常常以弹性体作为传感器的敏感元件，故又称之为弹性敏感元件。它的输入量可以是力、压力、温度等物理量，而输出则为弹性元件本身的弹性变形。机械式传感器做成的机械式指示仪表具有结构简单、可靠、使用方便、价格低廉、读数直观等优点。但弹性变形不宜过大，以减小线性误差。此外，由于放大和指示环节多为机械传动，不仅受间隙影响，而且惯性大，固有频率低，只宜用于检测缓变成静态被测量。电阻式传感器按工作原理可分为变阻器式即电位器式和电阻应变式两种。电阻应变式传感器有金属电阻应变片和半导体应变片两种，常用来测定结构的应变或应力。金属电阻应变片的优点是结构简单、性能稳定、价格低，缺点是精度不高、灵敏度低。半导体应变片的优点是灵敏度高，缺点是温度稳定性能差、灵敏度分散性大。',
    contentType: ContentType.TEXT,
    tags: ['传感器总结', '机械式', '电阻式', '应用特点'],
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
    id: 'mech_article_012',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 传感器选用综合考虑',
    summary: '介绍传感器选用时需要综合考虑的各种因素',
    content: '除以上选用传感器时应充分考虑的一些因素外，还应尽可能兼顾结构简单、体积小、质量轻、价格便宜、易于维修、易于更换等条件。根据测量对象与测量环境确定传感器的类型：要进行一个具体的测量工作，首先要考虑采用何种原理的传感器。这需要根据被测量的特点和传感器的使用条件考虑以下一些具体问题：量程的大小；被测位置对传感器体积的要求；测量方式为接触式还是非接触式；信号的引出方法，有线还是非接触测量。在考虑上述问题之后就能确定选用何种类型的传感器，然后考虑传感器的具体性能指标。传感器的稳定性有定量指标，在超过使用期后，在使用前应重新进行标定，以确定传感器的性能是否发生变化。在某些要求传感器能长期使用而又不能轻易更换或标定的场合，所选用的传感器稳定性要求更严格，要能够经受住长时间的考验。',
    contentType: ContentType.TEXT,
    tags: ['传感器选用', '综合考虑', '测量环境', '稳定性'],
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
