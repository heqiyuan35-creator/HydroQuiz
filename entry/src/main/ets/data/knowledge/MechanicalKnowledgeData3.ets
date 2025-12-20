/**
 * 机械电气 - 知识库文章数据第3部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_3: KnowledgeArticle[] = [
  {
    id: 'mech_article_007',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 机械式传感器',
    summary: '介绍机械式传感器的原理、应用及优缺点',
    content: '机械式传感器应用很广。在测试技术中，常常以弹性体作为传感器的敏感元件，故又称之为弹性敏感元件。它的输入量可以是力、压力、温度等物理量，而输出则为弹性元件本身的弹性变形。这种变形经放大后可成为仪表指针的偏转，借助刻度指示出被测量的大小。这种传感器的典型应用有：用于测力或称重的环形测力计；用于测量流体压力的波纹膜片、波纹管等；用于温度测量的双金属片等。机械式传感器做成的机械式指示仪表具有结构简单、可靠、使用方便、价格低廉、读数直观等优点。但弹性变形不宜过大，以减小线性误差。此外，由于放大和指示环节多为机械传动，不仅受间隙影响，而且惯性大，固有频率低，只宜用于检测缓变成静态被测量。',
    contentType: ContentType.TEXT,
    tags: ['机械式传感器', '弹性敏感元件', '测力计', '波纹膜片'],
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
    id: 'mech_article_008',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 电阻式传感器概述',
    summary: '介绍电阻式传感器的工作原理及分类',
    content: '电阻式传感器按工作原理可分为变阻器式即电位器式和电阻应变式两种。变阻器式传感器：变阻器式传感器也称为电位器式传感器，其工作原理是将物体的位移转换为电阻的变化，即电阻R等于电阻率乘以电阻丝长度除以电阻丝截面面积。式中电阻率为材料特性，电阻丝长度为电阻丝长度，截面面积为电阻丝截面面积。变阻器式传感器可分为直线位移型、角位移型与非线性型等。直线位移型传感器的灵敏度S等于电阻变化率对位移的导数，为常数。角位移型传感器的灵敏度S等于电阻变化率对角度的导数，也为常数。非线性型传感器又称函数电位器。它是输出电阻或电压与电刷位移包括线位移或角位移之间具有非线性函数关系的一种电位器。它可以是指数函数、三角函数、对数函数等各种特定函数，也可以是其他任意函数。非线性电位器可以应用于测量控制系统、解算装置及对某些传感器某些环节非线性进行补偿等。',
    contentType: ContentType.TEXT,
    tags: ['电阻式传感器', '变阻器式', '电位器式', '位移传感器'],
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
    id: 'mech_article_009',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第四节 常用传感器与检测仪器 - 电阻应变式传感器',
    summary: '介绍电阻应变式传感器的分类及金属电阻应变片的工作原理',
    content: '电阻应变式传感器有金属电阻应变片和半导体应变片两种，常用来测定结构的应变或应力。金属电阻应变片的结构见图1-8。其工作原理是：应变片发生变形时，阻值发生变化。电阻R等于电阻率乘以长度除以截面积。当应变片受力变形时，其长度、截面积和电阻率都会发生变化，从而引起电阻变化。电阻的相对变化量等于纵向应变加上横向应变的影响再加上电阻率变化的影响。式中纵向应变等于长度变化量除以原长度，横向应变等于负的泊松比乘以纵向应变。金属电阻应变片的灵敏系数一般为1.7至3.6。金属电阻应变片的优点是结构简单、性能稳定、价格低。缺点是精度不高、灵敏度低。',
    contentType: ContentType.TEXT,
    tags: ['电阻应变式', '金属应变片', '应变测量', '灵敏系数'],
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
