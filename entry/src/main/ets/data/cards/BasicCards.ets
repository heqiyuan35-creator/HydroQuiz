/**
 * 基础知识科目卡片数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeCard, CardRarity, CardContentType } from '../../common/types/CardTypes';

export const BasicCards: KnowledgeCard[] = [
  // N级卡片 (普通)
  {
    id: 'basic_001_N',
    name: '水利工程基础',
    rarity: CardRarity.N,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_foundation',
    backContent: '水利工程是指为了控制、调配和利用水资源而修建的工程。',
    questionAnalysis: '水利工程的定义是考试的基础考点。水利工程包括防洪、灌溉、供水、发电等多种功能，是国民经济的重要基础设施。记住：水利工程=控制+调配+利用水资源。',
    memoryTip: '水利三要素：控、调、用',
    examPoint: '水利工程定义与分类',
    isLimited: false
  },
  {
    id: 'basic_002_N',
    name: '检测基本概念',
    rarity: CardRarity.N,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_testing',
    backContent: '检测是指按照规定的程序，对产品、过程或服务的特性进行测量、检查、试验或度量。',
    questionAnalysis: '检测的四个核心动作：测量、检查、试验、度量。这是检测工作的基本内涵，考试中常以选择题形式出现，要求区分检测与检验、监测的区别。',
    memoryTip: '检测四动作：测检试度',
    examPoint: '检测定义与基本程序',
    isLimited: false
  },
  {
    id: 'basic_003_N',
    name: '质量控制要点',
    rarity: CardRarity.N,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_quality',
    backContent: '质量控制是为达到质量要求所采取的作业技术和活动。',
    questionAnalysis: '质量控制强调的是"作业技术和活动"，与质量保证（体系建设）、质量管理（全面管理）有本质区别。考试中常考三者的区分。',
    memoryTip: '控制重作业，保证重体系，管理重全面',
    examPoint: '质量控制与质量保证的区别',
    isLimited: false
  },
  {
    id: 'basic_004_N',
    name: '标准规范体系',
    rarity: CardRarity.N,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_standard',
    backContent: '水利工程检测标准分为国家标准、行业标准、地方标准和企业标准四级。',
    questionAnalysis: '标准的四级体系是重要考点。效力顺序：国标>行标>地标>企标。当不同级别标准有冲突时，以高级别标准为准，但企业标准可以严于国家标准。',
    memoryTip: '国行地企四级标准，效力依次递减',
    examPoint: '标准体系层级与效力',
    isLimited: false
  },
  {
    id: 'basic_005_N',
    name: '抽样检测原理',
    rarity: CardRarity.N,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_sampling',
    backContent: '抽样检测是从总体中随机抽取样本进行检测，用样本特性推断总体特性的方法。',
    questionAnalysis: '抽样检测的核心是"随机性"和"代表性"。样本必须能代表总体，否则检测结果无效。常见抽样方法：简单随机、分层、系统、整群抽样。',
    memoryTip: '抽样两要素：随机+代表',
    examPoint: '抽样方法与样本代表性',
    isLimited: false
  },
  {
    id: 'basic_006_N',
    name: '误差与精度',
    rarity: CardRarity.N,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_error',
    backContent: '误差分为系统误差、随机误差和粗大误差三类。',
    questionAnalysis: '系统误差有规律可循，可通过校正消除；随机误差无规律，只能通过多次测量减小；粗大误差是明显错误，应剔除。这是检测数据处理的基础。',
    memoryTip: '系统可校正，随机多测量，粗大要剔除',
    examPoint: '误差分类与处理方法',
    isLimited: false
  },
  {
    id: 'basic_007_N',
    name: '检测报告要素',
    rarity: CardRarity.N,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_report',
    backContent: '检测报告应包含：检测机构信息、委托信息、样品信息、检测依据、检测结果、结论等要素。',
    questionAnalysis: '检测报告是检测工作的最终成果，必须包含完整的信息链。重点记忆：谁检测、谁委托、测什么、依据什么、结果如何、结论是什么。',
    memoryTip: '报告六要素：机构、委托、样品、依据、结果、结论',
    examPoint: '检测报告编制要求',
    isLimited: false
  },
  // R级卡片 (稀有)
  {
    id: 'basic_008_R',
    name: '不确定度评定',
    rarity: CardRarity.R,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_uncertainty',
    backContent: '测量不确定度是表征测量结果分散性的参数，反映测量结果的可信程度。',
    questionAnalysis: '不确定度评定是高级检测人员必备技能。A类评定用统计方法，B类评定用非统计方法。合成不确定度需要考虑各分量的相关性。这是难点考点，需要掌握计算方法。',
    memoryTip: 'A类统计算，B类经验估，合成看相关',
    examPoint: '不确定度A类B类评定方法',
    isLimited: false
  },
  {
    id: 'basic_009_R',
    name: '检测方法验证',
    rarity: CardRarity.R,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_validation',
    backContent: '方法验证是确认检测方法适用于预期用途的过程，包括准确度、精密度、检出限等指标。',
    questionAnalysis: '方法验证的核心指标：准确度（与真值的接近程度）、精密度（重复测量的一致性）、检出限（能检出的最低浓度）、线性范围、稳健性等。新方法使用前必须验证。',
    memoryTip: '验证五指标：准精检线稳',
    examPoint: '方法验证的技术指标',
    isLimited: false
  },
  {
    id: 'basic_010_R',
    name: '能力验证参与',
    rarity: CardRarity.R,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_proficiency',
    backContent: '能力验证是利用实验室间比对来判定实验室检测能力的活动。',
    questionAnalysis: '能力验证是实验室认可的重要条件。通过与其他实验室的比对，评价本实验室的检测能力。Z值评价：|Z|≤2为满意，2<|Z|<3为可疑，|Z|≥3为不满意。',
    memoryTip: 'Z值判定：2内满意，3外不满意',
    examPoint: '能力验证结果评价方法',
    isLimited: false
  },
  {
    id: 'basic_011_R',
    name: '实验室认可',
    rarity: CardRarity.R,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_accreditation',
    backContent: 'CNAS是中国合格评定国家认可委员会，负责实验室认可工作。',
    questionAnalysis: 'CNAS认可是实验室能力的权威证明。认可依据是ISO/IEC 17025标准。认可周期为4年，期间需接受监督评审。CMA是计量认证，两者有区别但可同时申请。',
    memoryTip: 'CNAS认可，CMA认证，17025是依据',
    examPoint: 'CNAS与CMA的区别',
    isLimited: false
  },
  {
    id: 'basic_012_R',
    name: '数据修约规则',
    rarity: CardRarity.R,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_rounding',
    backContent: '数值修约采用"四舍六入五成双"规则，即逢五时向偶数方向修约。',
    questionAnalysis: '修约规则是数据处理的基础。"四舍六入五成双"比简单的四舍五入更科学，能减少系统偏差。例如：2.35→2.4，2.45→2.4，2.55→2.6。注意：修约应一次到位，不能连续修约。',
    memoryTip: '四舍六入五成双，一次到位不连修',
    examPoint: '数值修约的正确方法',
    isLimited: false
  },
  // SR级卡片 (史诗)
  {
    id: 'basic_013_SR',
    name: '检测体系核心',
    rarity: CardRarity.SR,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_system',
    backContent: '质量管理体系的核心是PDCA循环：计划(Plan)、执行(Do)、检查(Check)、处理(Act)。',
    questionAnalysis: 'PDCA循环是质量管理的灵魂，也叫戴明环。P-制定目标和计划；D-按计划执行；C-检查执行效果；A-总结经验，处理问题。循环往复，螺旋上升，实现持续改进。这是管理类考题的核心考点。',
    memoryTip: 'PDCA：计划执行检查处理，循环改进',
    examPoint: 'PDCA循环的应用',
    isLimited: false
  },
  {
    id: 'basic_014_SR',
    name: '溯源性原理',
    rarity: CardRarity.SR,
    subjectId: 'basic',
    contentType: CardContentType.KNOWLEDGE,
    frontImage: 'card_basic_traceability',
    backContent: '测量溯源性是指测量结果通过不间断的比较链与国家或国际标准联系起来的特性。',
    questionAnalysis: '溯源性是检测结果可信的基础。溯源链：工作器具→工作标准→参考标准→国家基准→国际基准。每一级都有不确定度，逐级传递。没有溯源性的测量结果不具有法律效力。',
    memoryTip: '溯源链不断，结果才可信',
    examPoint: '测量溯源性与量值传递',
    isLimited: false
  },
  // SSR级卡片 (传说)
  {
    id: 'basic_015_SSR',
    name: '大禹治水精神',
    rarity: CardRarity.SSR,
    subjectId: 'basic',
    contentType: CardContentType.QUOTE,
    frontImage: 'card_basic_dayu',
    backContent: '"三过家门而不入"——大禹治水的奉献精神，是水利人的精神源泉。',
    questionAnalysis: '大禹治水是中国水利史的开端，距今约4000年。大禹采用疏导法治理洪水，历时13年，三过家门而不入。这种奉献精神成为水利行业的精神图腾。考试中可能涉及水利史相关内容。',
    author: '大禹',
    examPoint: '中国水利发展史',
    isLimited: false
  }
];
