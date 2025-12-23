/**
 * 特殊限定卡片数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeCard, CardRarity, CardContentType } from '../../common/types/CardTypes';

export const SpecialCards: KnowledgeCard[] = [
  // 节日限定卡 - 春节
  {
    id: 'special_001_SR',
    name: '龙年水利',
    rarity: CardRarity.SR,
    subjectId: 'special',
    contentType: CardContentType.SPECIAL,
    frontImage: 'card_special_spring',
    backContent: '龙是中华民族的图腾，也是水的象征。龙年祝愿水利事业蒸蒸日上！',
    questionAnalysis: '中国古代将龙视为水神，掌管江河湖海。许多水利工程都与龙有关：龙王庙、龙门、龙口等。这体现了中华民族对水的敬畏和对水利的重视。水利是农业的命脉，是国民经济的基础。',
    examPoint: '水利文化与历史',
    isLimited: true,
    limitedStartTime: new Date('2024-02-01').getTime(),
    limitedEndTime: new Date('2024-02-29').getTime()
  },
  // 节日限定卡 - 世界水日
  {
    id: 'special_002_SR',
    name: '世界水日',
    rarity: CardRarity.SR,
    subjectId: 'special',
    contentType: CardContentType.SPECIAL,
    frontImage: 'card_special_waterday',
    backContent: '每年3月22日是世界水日，旨在唤起公众的节水意识。',
    questionAnalysis: '世界水日由联合国于1993年设立。中国水周为3月22-28日。水资源是有限的，人均水资源仅为世界平均水平的1/4。节约用水、保护水资源是每个公民的责任，也是水利工作者的使命。',
    examPoint: '水资源保护',
    isLimited: true,
    limitedStartTime: new Date('2024-03-15').getTime(),
    limitedEndTime: new Date('2024-03-31').getTime()
  },
  // 成就纪念卡
  {
    id: 'special_003_R',
    name: '百题达人',
    rarity: CardRarity.R,
    subjectId: 'special',
    contentType: CardContentType.SPECIAL,
    frontImage: 'card_special_100',
    backContent: '恭喜你完成100道题目！坚持就是胜利，继续加油！',
    questionAnalysis: '学习贵在坚持。完成100道题目是一个重要的里程碑，说明你已经建立了良好的学习习惯。继续保持，相信你一定能够顺利通过考试。记住：不积跬步，无以至千里。',
    examPoint: '学习方法与态度',
    isLimited: false
  },
  {
    id: 'special_004_R',
    name: '满分荣耀',
    rarity: CardRarity.R,
    subjectId: 'special',
    contentType: CardContentType.SPECIAL,
    frontImage: 'card_special_perfect',
    backContent: '模拟考试满分！你已经具备了扎实的专业知识，考试必过！',
    questionAnalysis: '获得满分说明你对知识点的掌握已经非常全面。但不要骄傲，考试中可能遇到新题型或偏题。保持谦虚，继续巩固，查漏补缺。祝你在正式考试中也能取得优异成绩！',
    examPoint: '考试心态调整',
    isLimited: false
  },
  // 通用趣味卡
  {
    id: 'special_005_N',
    name: '都江堰智慧',
    rarity: CardRarity.N,
    subjectId: 'special',
    contentType: CardContentType.TRIVIA,
    frontImage: 'card_special_dujiangyan',
    backContent: '都江堰是世界上最古老的无坝引水工程，至今仍在发挥作用。',
    questionAnalysis: '都江堰由李冰父子于公元前256年修建，距今2200多年。采用"深淘滩、低作堰"的治水原则，利用地形和水流规律，实现自动分水、排沙、泄洪。是古代水利工程的杰作，被列入世界文化遗产。',
    examPoint: '古代水利工程',
    isLimited: false
  },
  {
    id: 'special_006_N',
    name: '郑国渠传奇',
    rarity: CardRarity.N,
    subjectId: 'special',
    contentType: CardContentType.TRIVIA,
    frontImage: 'card_special_zhengguo',
    backContent: '郑国渠是中国古代最大的灌溉工程之一，使关中成为"天府之国"。',
    questionAnalysis: '郑国渠由韩国水工郑国于公元前246年修建，全长300余里，灌溉面积4万余顷。虽然最初是韩国的"疲秦"之计，但建成后使秦国国力大增，为统一六国奠定了经济基础。',
    examPoint: '古代水利工程',
    isLimited: false
  },
  {
    id: 'special_007_SSR',
    name: '李冰治水',
    rarity: CardRarity.SSR,
    subjectId: 'special',
    contentType: CardContentType.QUOTE,
    frontImage: 'card_special_libing',
    backContent: '"深淘滩，低作堰"——李冰治水六字诀，蕴含着朴素的水利智慧。',
    questionAnalysis: '李冰是战国时期秦国蜀郡太守，主持修建都江堰。"深淘滩"保证河床不淤积，"低作堰"保证洪水能够排泄。这六个字体现了顺应自然、因势利导的治水理念，至今仍是水利工程的重要原则。',
    author: '李冰',
    examPoint: '治水理念与原则',
    isLimited: false
  }
];
