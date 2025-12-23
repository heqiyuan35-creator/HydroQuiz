/**
 * 金属结构科目卡片数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeCard, CardRarity, CardContentType } from '../../common/types/CardTypes';

export const MetalCards: KnowledgeCard[] = [
  // N级卡片
  {
    id: 'metal_001_N',
    name: '钢材力学性能',
    rarity: CardRarity.N,
    subjectId: 'metal',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_metal_mechanical',
    backContent: '钢材的主要力学性能指标包括屈服强度、抗拉强度、伸长率和冲击韧性。',
    questionAnalysis: '屈服强度σs是钢材开始塑性变形的应力。抗拉强度σb是钢材能承受的最大应力。伸长率δ反映塑性。冲击韧性反映抗脆断能力。Q235表示屈服强度235MPa的碳素结构钢。',
    memoryTip: '屈服抗拉伸长冲击，Q后数字是屈服值',
    examPoint: '钢材力学性能指标',
    isLimited: false
  },
  {
    id: 'metal_002_N',
    name: '焊缝质量等级',
    rarity: CardRarity.N,
    subjectId: 'metal',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_metal_weld',
    backContent: '焊缝质量等级分为一、二、三级，一级要求最高，需100%无损检测。',
    questionAnalysis: '一级焊缝：重要结构，100%超声或射线检测。二级焊缝：一般结构，20%抽检。三级焊缝：次要结构，外观检查。水工钢闸门主要受力焊缝一般要求一级或二级。',
    memoryTip: '一级全检二级抽，三级外观看一看',
    examPoint: '焊缝质量等级与检测要求',
    isLimited: false
  },
  {
    id: 'metal_003_N',
    name: '超声波探伤',
    rarity: CardRarity.N,
    subjectId: 'metal',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_metal_ut',
    backContent: '超声波探伤利用超声波在材料中传播遇到缺陷时产生反射的原理检测内部缺陷。',
    questionAnalysis: '超声波探伤可检测裂纹、未焊透、未熔合、气孔、夹渣等缺陷。A型显示最常用，横坐标表示距离，纵坐标表示回波高度。探头频率一般2-5MHz，频率越高分辨率越高但穿透力越弱。',
    memoryTip: 'A显距离和回波，频率高分辨好穿透弱',
    examPoint: '超声波探伤原理与应用',
    isLimited: false
  },
  // R级卡片
  {
    id: 'metal_004_R',
    name: '射线探伤',
    rarity: CardRarity.R,
    subjectId: 'metal',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_metal_rt',
    backContent: '射线探伤利用X射线或γ射线穿透材料在底片上成像，检测内部缺陷。',
    questionAnalysis: '射线探伤可直观显示缺陷形状和位置，底片可长期保存。X射线穿透力较弱，适合薄件；γ射线穿透力强，适合厚件。射线对人体有害，需要防护。像质计用于评价底片质量。',
    memoryTip: 'X薄γ厚要防护，像质计评底片质量',
    examPoint: '射线探伤方法与安全',
    isLimited: false
  },
  {
    id: 'metal_005_R',
    name: '磁粉探伤',
    rarity: CardRarity.R,
    subjectId: 'metal',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_metal_mt',
    backContent: '磁粉探伤利用铁磁性材料表面缺陷处漏磁场吸附磁粉的原理检测表面缺陷。',
    questionAnalysis: '磁粉探伤只能检测铁磁性材料的表面和近表面缺陷。磁化方法：周向磁化检测纵向缺陷，纵向磁化检测横向缺陷。湿法灵敏度高于干法。荧光磁粉配合紫外灯使用效果更好。',
    memoryTip: '周向查纵向，纵向查横向，湿法比干法灵敏',
    examPoint: '磁粉探伤原理与方法',
    isLimited: false
  },
  {
    id: 'metal_006_R',
    name: '渗透探伤',
    rarity: CardRarity.R,
    subjectId: 'metal',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_metal_pt',
    backContent: '渗透探伤利用渗透液渗入表面开口缺陷，再用显像剂将其吸出显示的原理。',
    questionAnalysis: '渗透探伤适用于各种材料的表面开口缺陷检测。步骤：预清洗→施加渗透液→去除多余渗透液→施加显像剂→观察。渗透时间一般10-30分钟。荧光渗透比着色渗透灵敏度高。',
    memoryTip: '清洗渗透去余显像观，荧光比着色灵敏',
    examPoint: '渗透探伤步骤与应用',
    isLimited: false
  },
  // SR级卡片
  {
    id: 'metal_007_SR',
    name: '疲劳与断裂',
    rarity: CardRarity.SR,
    subjectId: 'metal',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_metal_fatigue',
    backContent: '疲劳破坏是金属在交变应力作用下，经过一定循环次数后发生的突然断裂。',
    questionAnalysis: '疲劳破坏特点：应力低于屈服强度、无明显塑性变形、突然断裂。疲劳裂纹从应力集中处萌生，逐渐扩展直至断裂。S-N曲线描述应力与疲劳寿命的关系。水工闸门启闭频繁，需关注疲劳问题。',
    memoryTip: '低应力无变形突然断，应力集中是起点',
    examPoint: '疲劳破坏机理与预防',
    isLimited: false
  },
  // SSR级卡片
  {
    id: 'metal_008_SSR',
    name: '无损检测之父',
    rarity: CardRarity.SSR,
    subjectId: 'metal',
    contentType: CardContentType.QUOTE,
    frontImage: 'card_metal_ndt',
    backContent: '1895年伦琴发现X射线，开创了无损检测技术的新纪元。',
    questionAnalysis: '威廉·伦琴1895年发现X射线，1901年获首届诺贝尔物理学奖。X射线的发现使人类能够"看穿"物体内部，是无损检测技术的起源。此后超声波、磁粉、渗透等方法相继发展，形成完整的无损检测体系。',
    author: 'Wilhelm Röntgen',
    examPoint: '无损检测发展史',
    isLimited: false
  }
];
