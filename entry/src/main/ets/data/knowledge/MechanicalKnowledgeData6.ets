/**
 * 机械电气 - 知识库文章数据第6部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_6: KnowledgeArticle[] = [
  {
    id: 'mech_article_016',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '半导体传感器 - 热敏电阻',
    summary: '介绍热敏电阻的特点、分类及温度特性',
    content: '热敏电阻是用半导体材料制成的热敏器件。相对于一般的金属热电阻而言，它主要有如下特点：电阻温度系数大，灵敏度高，比一般金属电阻大10至100倍。结构简单，体积小，可以测量点温度。电阻率高，热惯性小，适宜动态测量。阻值与温度变化呈非线性关系。稳定性和互换性较差。大部分半导体热敏电阻是由各种氧化物按一定比例混合，经高温烧结而成的。多数热敏电阻具有负的温度系数，即当温度升高时，其电阻值下降，同时灵敏度也下降。由于这个原因，限制了它在高温下的使用。目前，热敏电阻的使用上限温度约为300摄氏度。图1-49为负温度系数热敏电阻的电阻温度特性曲线，用如下经验公式描述：电阻值等于常数A乘以e的B除以温度次方。式中电阻值为温度为T开尔文时的电阻值；常数A与热敏电阻的材料和几何尺寸有关的常数；常数B为热敏电阻常数。',
    contentType: ContentType.TEXT,
    tags: ['热敏电阻', '温度系数', '半导体', '温度测量'],
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
    id: 'mech_article_017',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '半导体传感器 - 热敏电阻特性与非线性校正',
    summary: '介绍热敏电阻的伏安特性及非线性校正方法',
    content: '由图1-50可知热敏电阻的伏安特性：当流过热敏电阻的电流较小时，曲线呈直线状，服从欧姆定律。当电流增加时，热敏电阻自身温度明显增加，由于负温度系数的关系，阻值下降，于是电压上升速度减慢，出现了非线性。当电流继续增加时，热敏电阻自身温度上升更快，阻值大幅度下降，其减小速度超过电流增加速度，于是出现电压随电流增加而降低的现象。由于热敏电阻特性的严重非线性，扩大测温范围和提高精度必须进行补偿校正。解决办法：串联或并联温度系数很小的金属电阻，使热敏电阻阻值在一定范围内呈线性关系。图1-51介绍了一种金属电阻与热敏电阻串联以实现非线性校正的方法。只要金属电阻选得合适，在一定温度范围内可得到近似双曲线特性，即温度与电阻的倒数呈线性关系，从而使温度与电流呈线性关系。近年来，已出现利用微机实现较宽温度范围内线性化校正的方案。',
    contentType: ContentType.TEXT,
    tags: ['热敏电阻', '伏安特性', '非线性校正', '温度测量'],
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
    id: 'mech_article_018',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '红外测试系统 - 红外辐射原理',
    summary: '介绍红外辐射的基本原理及红外检测的特点',
    content: '红外线像其他电磁波一样遵循相同的物理定律：以光速传播，可被吸收、散射、反射、折射等，可用普朗克等辐射定律描述。红外线的波长范围是0.76至1000微米，这个范围通常又被分为四个波段范围。近红外区0.76至3微米，中红外区3至6微米，远红外区6至15微米，极远红外区15至1000微米。大气有三个窗口：1至2.5微米，3至5微米，8至13微米。这三个窗口分别位于近、中和远红外区内。各种红外仪器的工作波段，原则上都应选在这三个波段的窗口之内。热辐射的现象极为普遍，任何物体，只要它的温度高于绝对零度负273.15摄氏度，就有一部分热能变为辐射能，物体温度不同，辐射的波长组成成分不同，辐射能的大小也不同，该能量中包含可见光与不可见光的红外线两部分。红外辐射指的就是从可见光的红端到毫米波的宽广波长范围内的电磁波辐射，从光子角度看，它是低能量子流。',
    contentType: ContentType.TEXT,
    tags: ['红外辐射', '红外线', '波长范围', '热辐射'],
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
