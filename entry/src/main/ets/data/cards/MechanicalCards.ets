/**
 * 机械电气科目卡片数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeCard, CardRarity, CardContentType } from '../../common/types/CardTypes';

export const MechanicalCards: KnowledgeCard[] = [
  // N级卡片
  {
    id: 'mech_001_N',
    name: '启闭机类型',
    rarity: CardRarity.N,
    subjectId: 'mechanical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_mech_hoist',
    backContent: '水利工程启闭机主要有螺杆式、卷扬式、液压式三种类型。',
    questionAnalysis: '螺杆式启闭机结构简单，适用于小型闸门。卷扬式启闭机提升力大，适用于中大型闸门。液压式启闭机动作平稳，适用于快速闸门和事故闸门。选型要考虑闸门重量、启闭速度、工作条件等因素。',
    memoryTip: '螺杆小型卷扬大，液压快速又平稳',
    examPoint: '启闭机类型与选用',
    isLimited: false
  },
  {
    id: 'mech_002_N',
    name: '电机绝缘等级',
    rarity: CardRarity.N,
    subjectId: 'mechanical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_mech_insulation',
    backContent: '电机绝缘等级分为A、E、B、F、H等级，表示绝缘材料的耐热温度。',
    questionAnalysis: 'A级105℃、E级120℃、B级130℃、F级155℃、H级180℃。绝缘等级越高，允许温升越高。水利工程电机常用B级或F级绝缘。绝缘电阻测量是电机检测的重要项目。',
    memoryTip: 'AEBFH温度升，B级130F级155',
    examPoint: '电机绝缘等级与检测',
    isLimited: false
  },
  {
    id: 'mech_003_N',
    name: '振动检测',
    rarity: CardRarity.N,
    subjectId: 'mechanical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_mech_vibration',
    backContent: '振动检测是评价旋转机械运行状态的重要手段，主要测量振动位移、速度和加速度。',
    questionAnalysis: '低频振动用位移表征，中频用速度，高频用加速度。振动原因：不平衡、不对中、松动、轴承故障等。频谱分析可识别故障类型。ISO标准规定了不同设备的振动限值。',
    memoryTip: '低位移中速度高加速，频谱分析找故障',
    examPoint: '振动检测方法与诊断',
    isLimited: false
  },
  // R级卡片
  {
    id: 'mech_004_R',
    name: '液压系统检测',
    rarity: CardRarity.R,
    subjectId: 'mechanical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_mech_hydraulic',
    backContent: '液压系统检测包括压力、流量、温度、油液污染度等参数的测量。',
    questionAnalysis: '压力检测用压力表或传感器。流量检测用流量计。油液污染度用颗粒计数器，按NAS或ISO等级评定。油温过高会加速油液老化。液压系统故障多与油液污染有关，定期检测油液很重要。',
    memoryTip: '压力流量温度污染度，油液检测是关键',
    examPoint: '液压系统检测项目',
    isLimited: false
  },
  {
    id: 'mech_005_R',
    name: '接地电阻测量',
    rarity: CardRarity.R,
    subjectId: 'mechanical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_mech_grounding',
    backContent: '接地电阻是接地装置对地电阻，是电气安全的重要指标。',
    questionAnalysis: '接地电阻测量常用三极法或钳形法。三极法需要打辅助电极，测量准确但操作复杂。钳形法操作简便但只能测量有回路的接地。水利工程接地电阻一般要求≤4Ω或≤10Ω。',
    memoryTip: '三极法准钳形便，水利接地4或10欧',
    examPoint: '接地电阻测量方法',
    isLimited: false
  },
  {
    id: 'mech_006_R',
    name: '红外热成像',
    rarity: CardRarity.R,
    subjectId: 'mechanical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_mech_infrared',
    backContent: '红外热成像技术可非接触测量设备表面温度分布，发现过热故障。',
    questionAnalysis: '红外热成像可检测电气设备接头过热、机械设备轴承过热、保温层缺陷等。测量时要考虑发射率、环境温度、测量距离等因素。定期红外检测可预防设备故障，是状态检修的重要手段。',
    memoryTip: '非接触测温度，发射率环境要考虑',
    examPoint: '红外热成像应用',
    isLimited: false
  },
  // SR级卡片
  {
    id: 'mech_007_SR',
    name: '状态检修',
    rarity: CardRarity.SR,
    subjectId: 'mechanical',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_mech_cbm',
    backContent: '状态检修是根据设备实际状态确定检修时机和内容，替代传统的定期检修。',
    questionAnalysis: '状态检修基于在线监测和离线检测数据，评估设备健康状态，预测剩余寿命。优点：减少过度检修、避免突发故障、降低检修成本。关键技术：状态监测、故障诊断、寿命预测。是设备管理的发展方向。',
    memoryTip: '状态定检修，监测诊断预测寿命',
    examPoint: '状态检修理念与技术',
    isLimited: false
  },
  // SSR级卡片
  {
    id: 'mech_008_SSR',
    name: '三峡升船机',
    rarity: CardRarity.SSR,
    subjectId: 'mechanical',
    contentType: CardContentType.TRIVIA,
    frontImage: 'card_mech_shiplift',
    backContent: '三峡升船机是世界上规模最大、技术难度最高的升船机，提升高度113米。',
    questionAnalysis: '三峡升船机采用齿轮齿条爬升式，承船厢尺寸132×23.4×10米，总重约15500吨，提升高度113米，是世界之最。升船机的建成标志着中国在大型机电设备制造和安装方面达到世界领先水平。',
    examPoint: '重大水利机电工程',
    isLimited: false
  }
];
