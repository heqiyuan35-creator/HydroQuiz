/**
 * 混凝土工程科目卡片数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeCard, CardRarity, CardContentType } from '../../common/types/CardTypes';

export const ConcreteCards: KnowledgeCard[] = [
  // N级卡片 (普通)
  {
    id: 'concrete_001_N',
    name: '混凝土组成',
    rarity: CardRarity.N,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_composition',
    backContent: '混凝土由水泥、水、骨料（砂、石）和外加剂组成。',
    questionAnalysis: '混凝土四大组分：水泥（胶凝材料）、水（拌合用水）、骨料（细骨料砂+粗骨料石）、外加剂（改善性能）。水灰比是影响强度的关键因素，水灰比越小，强度越高。',
    memoryTip: '水泥水骨外加剂，水灰比小强度高',
    examPoint: '混凝土组成材料',
    isLimited: false
  },
  {
    id: 'concrete_002_N',
    name: '坍落度试验',
    rarity: CardRarity.N,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_slump',
    backContent: '坍落度是衡量混凝土和易性的重要指标，用坍落度筒测定。',
    questionAnalysis: '坍落度试验步骤：润湿坍落度筒→分三层装料→每层捣25次→提起筒→测量坍落值。坍落度越大，流动性越好。水利工程常用坍落度：30-50mm（干硬性）、50-90mm（塑性）、>90mm（流动性）。',
    memoryTip: '三层装料各25捣，提筒测落差',
    examPoint: '坍落度试验方法',
    isLimited: false
  },
  {
    id: 'concrete_003_N',
    name: '标准养护条件',
    rarity: CardRarity.N,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_curing',
    backContent: '混凝土标准养护条件：温度20±2℃，相对湿度≥95%。',
    questionAnalysis: '标准养护是混凝土强度评定的基准条件。温度20±2℃，湿度≥95%，养护28天。同条件养护则模拟实际施工环境。两种养护方式的强度结果不能直接比较。',
    memoryTip: '标养20度95湿，28天定强度',
    examPoint: '混凝土养护条件与龄期',
    isLimited: false
  },
  {
    id: 'concrete_004_N',
    name: '抗压强度试验',
    rarity: CardRarity.N,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_compression',
    backContent: '混凝土抗压强度试验采用150mm立方体试件，加载速度0.5-0.8MPa/s。',
    questionAnalysis: '标准试件尺寸150×150×150mm，非标准试件需乘换算系数。加载速度0.5-0.8MPa/s，过快或过慢都会影响结果。三个试件取平均值，最大最小值与中间值相差超过15%时取中间值。',
    memoryTip: '150立方标准件，0.5-0.8加载速',
    examPoint: '抗压强度试验方法',
    isLimited: false
  },
  {
    id: 'concrete_005_N',
    name: '水泥品种选择',
    rarity: CardRarity.N,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_cement',
    backContent: '水利工程常用水泥：普通硅酸盐水泥、中热硅酸盐水泥、低热矿�ite水泥。',
    questionAnalysis: '大体积混凝土宜用中热或低热水泥，减少水化热。有抗硫酸盐要求时用抗硫酸盐水泥。普通硅酸盐水泥适用于一般工程。水泥选择要考虑：强度、水化热、耐久性等因素。',
    memoryTip: '大体积用低热，抗硫用抗硫',
    examPoint: '水泥品种与适用条件',
    isLimited: false
  },
  {
    id: 'concrete_006_N',
    name: '骨料级配',
    rarity: CardRarity.N,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_aggregate',
    backContent: '骨料级配是指骨料中各粒径颗粒的搭配比例，良好级配可减少空隙率。',
    questionAnalysis: '级配良好的骨料空隙率小，需要的水泥浆少，混凝土更经济耐久。细度模数表示砂的粗细程度：粗砂3.7-3.1，中砂3.0-2.3，细砂2.2-1.6。连续级配优于间断级配。',
    memoryTip: '级配好空隙小，细度模数分粗细',
    examPoint: '骨料级配与细度模数',
    isLimited: false
  },
  // R级卡片 (稀有)
  {
    id: 'concrete_007_R',
    name: '配合比设计',
    rarity: CardRarity.R,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_mix',
    backContent: '混凝土配合比设计的核心是确定水灰比、砂率和用水量。',
    questionAnalysis: '配合比设计步骤：①确定配制强度（考虑标准差）②计算水灰比③确定用水量④计算水泥用量⑤确定砂率⑥计算骨料用量⑦试配调整。配制强度=设计强度+1.645×标准差。',
    memoryTip: '配制强度加标差，水灰砂率定配比',
    examPoint: '配合比设计计算',
    isLimited: false
  },
  {
    id: 'concrete_008_R',
    name: '回弹法检测',
    rarity: CardRarity.R,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_rebound',
    backContent: '回弹法是用回弹仪测定混凝土表面硬度，推算抗压强度的无损检测方法。',
    questionAnalysis: '回弹法原理：弹击锤撞击混凝土表面后回弹，回弹值与强度相关。测区要求：每个测区弹击16点，去掉3个最大和3个最小值，取10个平均。碳化深度会影响结果，需要修正。',
    memoryTip: '16点去6取10均，碳化深度要修正',
    examPoint: '回弹法检测原理与修正',
    isLimited: false
  },
  {
    id: 'concrete_009_R',
    name: '超声波检测',
    rarity: CardRarity.R,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_ultrasonic',
    backContent: '超声波法通过测定超声波在混凝土中的传播速度来评估混凝土质量。',
    questionAnalysis: '超声波检测可发现内部缺陷、裂缝、不密实区域。声速与强度正相关，声速越高强度越高。对测法精度最高，斜测法次之，平测法最低。钢筋会影响声速，需要修正。',
    memoryTip: '对测精度高，钢筋要修正',
    examPoint: '超声波检测方法与应用',
    isLimited: false
  },
  {
    id: 'concrete_010_R',
    name: '钻芯取样法',
    rarity: CardRarity.R,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_core',
    backContent: '钻芯法是从结构中钻取芯样进行抗压试验，是最直接的强度检测方法。',
    questionAnalysis: '钻芯法是破损检测，但结果最可靠。芯样直径宜为100mm或150mm，高径比1:1。芯样端面需要加工平整。钻芯位置应避开钢筋密集区和预应力筋。一个检测批至少3个芯样。',
    memoryTip: '芯样高径比1:1，避开钢筋取3个',
    examPoint: '钻芯取样要求与评定',
    isLimited: false
  },
  // SR级卡片 (史诗)
  {
    id: 'concrete_011_SR',
    name: '耐久性设计',
    rarity: CardRarity.SR,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_durability',
    backContent: '混凝土耐久性包括抗渗性、抗冻性、抗侵蚀性、抗碳化性等。',
    questionAnalysis: '耐久性是水工混凝土的核心要求。抗渗等级W表示能抵抗的最大水压力（0.1MPa为单位）。抗冻等级F表示能承受的冻融循环次数。提高耐久性的措施：降低水灰比、掺加矿物掺合料、使用引气剂等。',
    memoryTip: 'W抗渗F抗冻，低水灰比是关键',
    examPoint: '混凝土耐久性指标与措施',
    isLimited: false
  },
  {
    id: 'concrete_012_SR',
    name: '大体积混凝土',
    rarity: CardRarity.SR,
    subjectId: 'concrete',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_concrete_mass',
    backContent: '大体积混凝土施工的关键是控制温度裂缝，内外温差不宜超过25℃。',
    questionAnalysis: '大体积混凝土定义：最小尺寸≥1m，或水化热引起的温度变化可能导致裂缝。控制措施：①选用低热水泥②掺加粉煤灰③分层浇筑④埋设冷却水管⑤保温养护。内外温差控制在25℃以内。',
    memoryTip: '内外温差25度，低热掺灰分层浇',
    examPoint: '大体积混凝土温控措施',
    isLimited: false
  },
  // SSR级卡片 (传说)
  {
    id: 'concrete_013_SSR',
    name: '三峡大坝混凝土',
    rarity: CardRarity.SSR,
    subjectId: 'concrete',
    contentType: CardContentType.TRIVIA,
    frontImage: 'card_concrete_sanxia',
    backContent: '三峡大坝混凝土浇筑量达2800万立方米，是世界上混凝土用量最大的水利工程。',
    questionAnalysis: '三峡大坝是世界最大的水利枢纽工程，混凝土浇筑量2800万m³，创造了多项世界纪录。大坝采用了先进的温控技术和质量控制体系，是中国水利工程的里程碑。了解重大工程案例有助于理解检测技术的实际应用。',
    examPoint: '重大水利工程案例',
    isLimited: false
  }
];
