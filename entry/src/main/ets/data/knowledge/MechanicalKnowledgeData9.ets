/**
 * 机械电气 - 知识库文章数据第9部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_9: KnowledgeArticle[] = [
  {
    id: 'mech_article_025',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '光纤传感器 - 光纤电流与温度传感器',
    summary: '介绍光纤电流传感器和光纤温度传感器的工作原理',
    content: '光纤电流传感器：图1-43为偏振态调制型光纤电流传感器原理图。根据法拉第旋光效应，由电流所形成的磁场会引起光纤中线偏振光的偏转；检测偏转角的大小，就可得到相应的电流值。光纤温度传感器：光纤温度传感器工作原理如图1-44所示：利用半导体材料的能量隙随温度几乎成线性变化。敏感元件是一个半导体光吸收器，光纤用来传输信号。当光源的光以恒定的强度经光纤到达半导体薄片时，透过薄片的光强受温度的调制，透过光由光纤传送到探测器。温度T升高，半导体能带宽度下降，材料吸收光波长向长波移动，半导体薄片透过的光强度变化。光纤角速度传感器即光纤陀螺，其理论测量精度远高于机械和激光陀螺仪。它以塞格纳克效应为其物理基础。',
    contentType: ContentType.TEXT,
    tags: ['光纤电流传感器', '光纤温度传感器', '法拉第效应', '半导体'],
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
    id: 'mech_article_026',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '传感器与检测仪器 - 综合总结',
    summary: '总结常用传感器与检测仪器的分类及应用特点',
    content: '常用传感器与检测仪器涵盖多种类型，包括机械式传感器、电阻式传感器、半导体传感器、红外测试系统、激光式传感器和光纤传感器等。机械式传感器以弹性体作为敏感元件，结构简单、可靠、价格低廉。电阻式传感器分为变阻器式和电阻应变式，常用于位移和应变测量。半导体传感器包括磁敏传感器和热敏电阻，具有灵敏度高的特点。红外测试系统利用红外辐射原理，可实现非接触式温度测量。激光式传感器具有方向性强、精度高的特点，广泛用于精密测量。光纤传感器分为功能型和非功能型，适用于特殊环境下的测量。选择传感器时应综合考虑量程、精度、灵敏度、线性度、稳定性、频率响应等性能指标，并根据测量对象和环境条件选择合适的类型。传感器的正确选用是保证测量精度和可靠性的关键。',
    contentType: ContentType.TEXT,
    tags: ['传感器总结', '检测仪器', '选型原则', '应用特点'],
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
