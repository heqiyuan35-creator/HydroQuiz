/**
 * 量测科目卡片数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeCard, CardRarity, CardContentType } from '../../common/types/CardTypes';

export const MeasurementCards: KnowledgeCard[] = [
  // N级卡片
  {
    id: 'measure_001_N',
    name: '水准测量原理',
    rarity: CardRarity.N,
    subjectId: 'measurement',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_measure_leveling',
    backContent: '水准测量利用水平视线测定两点间的高差，是高程测量的基本方法。',
    questionAnalysis: '水准测量原理：高差h=后视读数a-前视读数b。水准仪提供水平视线，水准尺读取高度。闭合水准路线的闭合差应在允许范围内。四等水准测量闭合差限差±20√L mm（L为公里数）。',
    memoryTip: '高差=后视-前视，闭合差要检核',
    examPoint: '水准测量原理与精度',
    isLimited: false
  },
  {
    id: 'measure_002_N',
    name: '全站仪使用',
    rarity: CardRarity.N,
    subjectId: 'measurement',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_measure_totalstation',
    backContent: '全站仪集测角、测距、计算于一体，是现代测量的主要仪器。',
    questionAnalysis: '全站仪可同时测量水平角、垂直角和斜距，自动计算平距和高差。使用前需要对中整平，输入测站坐标和仪器高。棱镜常数和气象改正会影响测距精度。',
    memoryTip: '角距一体全站仪，对中整平是基础',
    examPoint: '全站仪操作与误差来源',
    isLimited: false
  },
  {
    id: 'measure_003_N',
    name: 'GPS定位原理',
    rarity: CardRarity.N,
    subjectId: 'measurement',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_measure_gps',
    backContent: 'GPS通过接收卫星信号，利用距离交会原理确定接收机位置。',
    questionAnalysis: 'GPS定位需要同时接收4颗以上卫星信号。静态测量精度高，用于控制测量；RTK实时动态测量，用于放样和碎部测量。GNSS包括GPS、北斗、GLONASS、Galileo等系统。',
    memoryTip: '4星定位是基础，静态控制RTK放样',
    examPoint: 'GPS测量方法与应用',
    isLimited: false
  },
  // R级卡片
  {
    id: 'measure_004_R',
    name: '变形监测',
    rarity: CardRarity.R,
    subjectId: 'measurement',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_measure_deformation',
    backContent: '变形监测是对建筑物或构筑物的位移、沉降、倾斜等进行周期性观测。',
    questionAnalysis: '大坝变形监测内容：水平位移、垂直位移、挠度、裂缝等。监测方法：视准线法、引张线法、垂线法、精密水准等。监测频率根据工程重要性和变形速率确定。监测数据需要进行趋势分析。',
    memoryTip: '水平垂直加挠度，周期观测看趋势',
    examPoint: '变形监测内容与方法',
    isLimited: false
  },
  {
    id: 'measure_005_R',
    name: '测量误差理论',
    rarity: CardRarity.R,
    subjectId: 'measurement',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_measure_error',
    backContent: '测量误差分为系统误差、偶然误差和粗差，偶然误差服从正态分布。',
    questionAnalysis: '系统误差有规律，可通过校正或计算消除。偶然误差无规律但服从统计规律，具有有界性、对称性、抵偿性、小误差概率大。粗差是明显错误，应剔除。中误差是评定精度的标准。',
    memoryTip: '系统可消偶然统计，粗差剔除中误差评',
    examPoint: '误差分类与处理',
    isLimited: false
  },
  // SR级卡片
  {
    id: 'measure_006_SR',
    name: '坐标系统转换',
    rarity: CardRarity.SR,
    subjectId: 'measurement',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_measure_coordinate',
    backContent: '不同坐标系统间的转换需要确定转换参数，常用七参数或四参数模型。',
    questionAnalysis: '七参数转换：3个平移、3个旋转、1个尺度。四参数转换：2个平移、1个旋转、1个尺度（平面）。参数求解需要公共点，点数越多精度越高。WGS84与国家坐标系转换涉及保密问题。',
    memoryTip: '七参数空间转，四参数平面用',
    examPoint: '坐标转换方法',
    isLimited: false
  },
  // SSR级卡片
  {
    id: 'measure_007_SSR',
    name: '北斗卫星导航',
    rarity: CardRarity.SSR,
    subjectId: 'measurement',
    contentType: CardContentType.TRIVIA,
    frontImage: 'card_measure_beidou',
    backContent: '北斗三号全球卫星导航系统于2020年建成，是中国自主建设的全球导航系统。',
    questionAnalysis: '北斗系统由空间段、地面段和用户段组成。北斗三号包含30颗卫星，提供全球服务。定位精度优于10米，授时精度优于20纳秒。北斗在水利工程监测中应用广泛，是国家重大基础设施。',
    examPoint: '北斗系统与应用',
    isLimited: false
  }
];
