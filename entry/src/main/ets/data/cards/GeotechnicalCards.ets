/**
 * 岩土工程科目卡片数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeCard, CardRarity, CardContentType } from '../../common/types/CardTypes';

export const GeotechnicalCards: KnowledgeCard[] = [
  // N级卡片
  {
    id: 'geo_001_N',
    name: '土的三相组成',
    rarity: CardRarity.N,
    subjectId: 'geotechnical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_geo_phase',
    backContent: '土由固相（土粒）、液相（水）、气相（空气）三相组成。',
    questionAnalysis: '土的三相组成是土力学的基础。固相决定土的骨架，液相影响土的强度和变形，气相影响土的压缩性。饱和土只有固液两相，干土只有固气两相。三相比例关系是计算各种指标的基础。',
    memoryTip: '固液气三相，饱和无气相',
    examPoint: '土的物理性质指标',
    isLimited: false
  },
  {
    id: 'geo_002_N',
    name: '含水率测定',
    rarity: CardRarity.N,
    subjectId: 'geotechnical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_geo_moisture',
    backContent: '含水率是土中水的质量与干土质量之比，用烘干法测定。',
    questionAnalysis: '含水率w=水质量/干土质量×100%。烘干法是标准方法：105-110℃烘干至恒重。快速测定可用酒精燃烧法。含水率是判断土的状态、计算其他指标的基础参数。',
    memoryTip: '水比干土乘百分，105度烘至恒',
    examPoint: '含水率测定方法',
    isLimited: false
  },
  {
    id: 'geo_003_N',
    name: '液塑限试验',
    rarity: CardRarity.N,
    subjectId: 'geotechnical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_geo_atterberg',
    backContent: '液限是土从塑态变为流态的界限含水率，塑限是从半固态变为塑态的界限含水率。',
    questionAnalysis: '液限WL用圆锥仪法测定（锥入深度17mm对应的含水率）。塑限WP用搓条法测定（搓成3mm土条开裂时的含水率）。塑性指数IP=WL-WP，反映土的可塑性。液性指数IL判断土的状态。',
    memoryTip: '液限17mm锥入深，塑限3mm搓条裂',
    examPoint: '界限含水率测定与应用',
    isLimited: false
  },
  {
    id: 'geo_004_N',
    name: '压实度检测',
    rarity: CardRarity.N,
    subjectId: 'geotechnical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_geo_compaction',
    backContent: '压实度是现场干密度与最大干密度之比，反映土的压实程度。',
    questionAnalysis: '压实度K=现场干密度/最大干密度×100%。最大干密度由击实试验确定。现场检测方法：灌砂法、环刀法、核子密度仪法。水利工程填筑压实度一般要求≥96%。',
    memoryTip: '现场比最大，灌砂环刀核子仪',
    examPoint: '压实度检测方法',
    isLimited: false
  },
  // R级卡片
  {
    id: 'geo_005_R',
    name: '标准贯入试验',
    rarity: CardRarity.R,
    subjectId: 'geotechnical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_geo_spt',
    backContent: '标准贯入试验用63.5kg锤自76cm高度自由落下，记录贯入30cm的锤击数N。',
    questionAnalysis: '标贯试验是原位测试的重要方法。N值可判断砂土密实度、粘性土状态，估算地基承载力。N<10为松散，10-15为稍密，15-30为中密，>30为密实。杆长超过一定长度需要修正。',
    memoryTip: '63.5锤76落，30cm记锤数',
    examPoint: '标贯试验方法与N值应用',
    isLimited: false
  },
  {
    id: 'geo_006_R',
    name: '静力触探试验',
    rarity: CardRarity.R,
    subjectId: 'geotechnical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_geo_cpt',
    backContent: '静力触探是将探头匀速压入土中，测定锥尖阻力和侧壁摩阻力。',
    questionAnalysis: '静力触探可连续测定土层性质，划分土层，判断土的类型和状态。双桥探头可同时测锥尖阻力qc和侧摩阻力fs。摩阻比Rf=fs/qc×100%可判断土类。贯入速度1.2m/min。',
    memoryTip: '匀速压入测qc和fs，摩阻比判土类',
    examPoint: '静力触探原理与应用',
    isLimited: false
  },
  // SR级卡片
  {
    id: 'geo_007_SR',
    name: '地基承载力',
    rarity: CardRarity.SR,
    subjectId: 'geotechnical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_geo_bearing',
    backContent: '地基承载力特征值fak是地基土单位面积上允许承受的最大压力。',
    questionAnalysis: '承载力确定方法：①载荷试验（最可靠）②原位测试推算③理论公式计算④规范查表。载荷试验以p-s曲线确定，取比例界限或s/b=0.01-0.015对应的压力。深宽修正后得设计值fa。',
    memoryTip: '载荷试验最可靠，深宽修正得设计值',
    examPoint: '地基承载力确定方法',
    isLimited: false
  },
  // SSR级卡片
  {
    id: 'geo_008_SSR',
    name: '太沙基理论',
    rarity: CardRarity.SSR,
    subjectId: 'geotechnical',
    contentType: CardContentType.QUOTE,
    frontImage: 'card_geo_terzaghi',
    backContent: '"土力学之父"太沙基创立了有效应力原理，奠定了现代土力学基础。',
    questionAnalysis: '太沙基(Terzaghi)1925年出版《土力学》，创立有效应力原理：σ=σ\'+u（总应力=有效应力+孔隙水压力）。有效应力控制土的强度和变形，是土力学的核心理论。这一原理是理解固结、渗透、强度等问题的基础。',
    author: 'Karl Terzaghi',
    examPoint: '有效应力原理',
    isLimited: false
  }
];
