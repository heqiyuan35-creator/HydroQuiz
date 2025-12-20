/**
 * 岩土工程题目数据
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（岩石、土工、土工合成材料）第3版 第一章 岩石概述
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_001',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩石是一种自然造物，其形成受（）作用支配，这是岩石与其他人工制造的材料和结构物根本不同之处。',
      options: [
        { key: 'A', content: '物理' },
        { key: 'B', content: '化学' },
        { key: 'C', content: '地质' },
        { key: 'D', content: '力学' }
      ],
      answer: 'C',
      analysis: '岩石是一种自然造物，其形成受地质作用支配，这是岩石与其他人工制造的材料和结构物根本不同之处。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '岩石', '基本概念'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_002',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '把结构面和结构体的组合称为（），而把不包含结构面的结构体称为岩块。',
      options: [
        { key: 'A', content: '岩石' },
        { key: 'B', content: '岩体' },
        { key: 'C', content: '岩层' },
        { key: 'D', content: '岩芯' }
      ],
      answer: 'B',
      analysis: '我们把结构面和结构体的组合称为岩体，而把不包含结构面的结构体称为岩块。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '岩体', '岩块'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_003',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '由于岩块相对完整，因此可以近似作为一种均质材料，即具有连续性、均匀性、（）。',
      options: [
        { key: 'A', content: '各向异性' },
        { key: 'B', content: '各向同性' },
        { key: 'C', content: '非均匀性' },
        { key: 'D', content: '非连续性' }
      ],
      answer: 'B',
      analysis: '由于岩块相对完整，因此可以近似作为一种均质材料，即具有连续性、均匀性、各向同性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '岩块', '材料特性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_004',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩体由于包含了结构面，不是一种均质材料，因此岩体的基本属性是非连续、非均匀、（）的。',
      options: [
        { key: 'A', content: '各向同性' },
        { key: 'B', content: '各向异性' },
        { key: 'C', content: '均匀性' },
        { key: 'D', content: '连续性' }
      ],
      answer: 'B',
      analysis: '而岩体由于包含了结构面，不是一种均质材料，因此岩体的基本属性是非连续、非均匀、各向异性的。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '岩体', '基本属性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_005',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩体基本力学性质是岩体在简单载荷（应力）条件下的变形、强度和破坏特性，所谓简单载荷条件指的是单轴压缩或拉伸、剪切以及（）下的压缩加载。',
      options: [
        { key: 'A', content: '三轴' },
        { key: 'B', content: '双轴' },
        { key: 'C', content: '等围压' },
        { key: 'D', content: '单向' }
      ],
      answer: 'C',
      analysis: '岩体基本力学性质是岩体在简单载荷（应力）条件下的变形、强度和破坏特性，所谓简单载荷条件指的是单轴压缩或拉伸、剪切（包括压剪和拉剪）以及等围压下的压缩加载。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '岩体', '力学性质'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_006',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '一般来说，结构面的强度最低，完整岩块的强度最高，包含结构面的岩体强度在（）。',
      options: [
        { key: 'A', content: '最高' },
        { key: 'B', content: '最低' },
        { key: 'C', content: '两者之间' },
        { key: 'D', content: '无法确定' }
      ],
      answer: 'C',
      analysis: '一般来说，结构面的强度最低，完整岩块的强度最高，包含结构面的岩体强度在两者之间。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '岩体强度', '结构面'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_007',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '描述岩体变形特征的力学参数主要有弹性模量（变形模量）和（），其分别表示在轴向应力作用下的轴向变形响应和横向变形响应。',
      options: [
        { key: 'A', content: '抗压强度' },
        { key: 'B', content: '泊松比' },
        { key: 'C', content: '抗拉强度' },
        { key: 'D', content: '剪切强度' }
      ],
      answer: 'B',
      analysis: '描述岩体变形特征的力学参数主要有弹性模量（变形模量）和泊松比，其分别表示在轴向应力作用下的轴向变形响应和横向变形响应。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '变形特征', '力学参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_008',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '描述岩体强度特征的力学参数有单轴抗压强度、单轴抗拉强度、三轴抗压强度和抗剪强度，通常用黏聚力c和摩擦角φ（或摩擦系数f）表达（）参数。',
      options: [
        { key: 'A', content: '抗压强度' },
        { key: 'B', content: '抗拉强度' },
        { key: 'C', content: '剪切强度' },
        { key: 'D', content: '弹性模量' }
      ],
      answer: 'C',
      analysis: '描述岩体强度特征的力学参数有单轴抗压强度、单轴抗拉强度、三轴抗压强度和抗剪强度，通常用黏聚力c和摩擦角φ（或摩擦系数f）表达剪切强度参数。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '强度特征', '剪切强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_009',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '由于工程岩体强度较高，岩体的破坏形式主要为（）和剪破坏。',
      options: [
        { key: 'A', content: '压破坏' },
        { key: 'B', content: '拉破坏' },
        { key: 'C', content: '弯曲破坏' },
        { key: 'D', content: '扭转破坏' }
      ],
      answer: 'B',
      analysis: '由于工程岩体强度较高，岩体的破坏形式主要为拉破坏和剪破坏，因此抗拉强度和剪切强度是测试的重点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '破坏形式', '岩体强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_010',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩石的坚硬程度是岩体最基本的性质之一，表征为岩石在外部载荷作用下，抵抗变形直至破坏的能力，它与岩石的矿物成分、结构、致密程度、风化程度以及（）有关。',
      options: [
        { key: 'A', content: '颜色' },
        { key: 'B', content: '软化程度' },
        { key: 'C', content: '年代' },
        { key: 'D', content: '产地' }
      ],
      answer: 'B',
      analysis: '岩石的坚硬程度是岩体最基本的性质之一，表征为岩石在外部载荷作用下，抵抗变形直至破坏的能力，它与岩石的矿物成分、结构、致密程度、风化程度以及软化程度有关。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '坚硬程度', '影响因素'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_011',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '表征岩石坚硬程度的定量指标有岩石单轴抗压强度、弹性（变形）模量等。在这些力学指标中，（）容易测得，代表性强，使用最广。',
      options: [
        { key: 'A', content: '弹性模量' },
        { key: 'B', content: '单轴抗压强度' },
        { key: 'C', content: '抗拉强度' },
        { key: 'D', content: '剪切强度' }
      ],
      answer: 'B',
      analysis: '表征岩石坚硬程度的定量指标有岩石单轴抗压强度、弹性（变形）模量等。在这些力学指标中，单轴抗压强度容易测得，代表性强，使用最广，与其他强度指标相关密切，同时又能反映出岩石遇水软化的性质。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '坚硬程度', '定量指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_012',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '硬质岩的单轴饱和抗压强度Rc（MPa）范围是（）。',
      options: [
        { key: 'A', content: '>60' },
        { key: 'B', content: '60~30' },
        { key: 'C', content: '30~15' },
        { key: 'D', content: '<5' }
      ],
      answer: 'A',
      analysis: '根据岩石的坚硬程度分类表，硬质岩的单轴饱和抗压强度Rc>60MPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '岩石分类', '抗压强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_013',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩体完整性系数Kv值作为反映岩体完整程度的定量指标，当Kv>0.75时，岩体的完整程度为（）。',
      options: [
        { key: 'A', content: '完整' },
        { key: 'B', content: '较完整' },
        { key: 'C', content: '较破碎' },
        { key: 'D', content: '破碎' }
      ],
      answer: 'A',
      analysis: '根据岩体的完整程度分类表，当完整性系数Kv>0.75时，岩体的完整程度为完整。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '完整程度', '完整性系数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_014',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩体基本质量指标（BQ）的计算公式为BQ=90+3Rc+（）Kv。',
      options: [
        { key: 'A', content: '150' },
        { key: 'B', content: '200' },
        { key: 'C', content: '250' },
        { key: 'D', content: '300' }
      ],
      answer: 'C',
      analysis: '岩体基本质量指标（BQ）采用岩石的坚硬程度和岩体的完整程度两个定量指标确定。以两个分级因素的定量指标Rc及Kv为参数，按式BQ=90+3Rc+250Kv计算BQ值。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '基本质量指标', 'BQ值'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_015',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩体基本质量分级中，I级岩体的BQ值范围是（）。',
      options: [
        { key: 'A', content: '>550' },
        { key: 'B', content: '550~451' },
        { key: 'C', content: '450~351' },
        { key: 'D', content: '350~251' }
      ],
      answer: 'A',
      analysis: '根据岩体基本质量分级标准表，I级岩体的定性特征为坚硬岩、岩体完整，BQ值>550。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '岩体分级', 'BQ值'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_016',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '1999年5月，国家标准《工程岩体试验方法标准》（GB/T 50266-99）由国家质量技术监督局、中华人民共和国建设部为国家标准联合发布实施，该标准总结了我国自20世纪（）年代起40多年岩石试验经验。',
      options: [
        { key: 'A', content: '40' },
        { key: 'B', content: '50' },
        { key: 'C', content: '60' },
        { key: 'D', content: '70' }
      ],
      answer: 'B',
      analysis: '1999年5月，国家标准《工程岩体试验方法标准》（GB/T 50266-99）由国家质量技术监督局、中华人民共和国建设部为国家标准联合发布实施，该标准总结了我国自20世纪50年代起40多年岩石试验经验，统一了我国岩石试验方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '规程规范', '历史'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_017',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '水利水电工程岩石试验包括岩石物理力学性质试验、岩体强度和变形试验、岩体应力测试、工程岩体观测以及（）等内容。',
      options: [
        { key: 'A', content: '混凝土试验' },
        { key: 'B', content: '岩石声波测试' },
        { key: 'C', content: '土工试验' },
        { key: 'D', content: '钢筋试验' }
      ],
      answer: 'B',
      analysis: '水利水电工程岩石试验包括岩石物理力学性质试验、岩体强度和变形试验、岩体应力测试、工程岩体观测以及岩石声波测试等内容。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '岩石试验', '内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_018',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '水对岩体的物理化学作用包括风化、软化、泥化、崩解、膨胀和（）等。',
      options: [
        { key: 'A', content: '硬化' },
        { key: 'B', content: '溶蚀' },
        { key: 'C', content: '固结' },
        { key: 'D', content: '压实' }
      ],
      answer: 'B',
      analysis: '水对岩体的物理化学作用包括风化、软化、泥化、崩解、膨胀和溶蚀等，在水利工程建设中，由于岩体长期处于泡水状态，岩体强度和变形模量降低。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '水的影响', '物理化学作用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_019',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩石的密度、单轴抗压强度、抗拉强度、点荷载强度、波速等物理力学参数采用试验结果的（）作为标准值。',
      options: [
        { key: 'A', content: '最大值' },
        { key: 'B', content: '最小值' },
        { key: 'C', content: '算术平均值' },
        { key: 'D', content: '中位数' }
      ],
      answer: 'C',
      analysis: '岩石的密度、单轴抗压强度、抗拉强度、点荷载强度、波速等物理力学参数采用试验结果的算术平均值作为标准值。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '试验结果', '标准值'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_020',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩体变形模量采用原位变形试验成果的（）作为标准值。',
      options: [
        { key: 'A', content: '最大值' },
        { key: 'B', content: '最小值' },
        { key: 'C', content: '算术平均值' },
        { key: 'D', content: '加权平均值' }
      ],
      answer: 'C',
      analysis: '岩体变形模量采用原位变形试验成果的算术平均值作为标准值。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '变形模量', '标准值'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_021',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩体基本力学性质包括（）。',
      options: [
        { key: 'A', content: '岩体的变形性质' },
        { key: 'B', content: '岩体的强度性质' },
        { key: 'C', content: '岩体的破坏特性' },
        { key: 'D', content: '岩体的颜色特征' }
      ],
      answer: 'A,B,C',
      analysis: '岩体基本力学性质包括：岩体的变形性质——岩体在载荷作用下的应力应变（变形）关系；岩体的强度性质——岩体对应于各种载荷条件下的承载能力；岩体的破坏特性——岩体超过承载能力后发生大变形或破坏的形式。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '岩体', '力学性质'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_022',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '对岩体力学性质的研究可分成（）的力学性质研究。',
      options: [
        { key: 'A', content: '岩块' },
        { key: 'B', content: '结构面' },
        { key: 'C', content: '岩（岩块和结构体）' },
        { key: 'D', content: '岩石颗粒' }
      ],
      answer: 'A,B,C',
      analysis: '对岩体力学性质的研究可分成岩块、结构面的力学性质研究以及岩（岩块和结构体）的力学性质研究。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '岩体', '力学研究'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_023',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩石的坚硬程度分类中，硬质岩包括（）。',
      options: [
        { key: 'A', content: '硬岩' },
        { key: 'B', content: '较硬岩' },
        { key: 'C', content: '较软岩' },
        { key: 'D', content: '软岩' }
      ],
      answer: 'A,B',
      analysis: '根据岩石的坚硬程度分类表，硬质岩包括硬岩（Rc>60MPa）和较硬质岩（Rc为60~30MPa）。软质岩包括较软岩、软岩和极软岩。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '岩石分类', '坚硬程度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_024',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩体基本质量分级采用两步走的方法进行工程岩体分级，主要考虑岩石的（）两个分级因素。',
      options: [
        { key: 'A', content: '坚硬程度' },
        { key: 'B', content: '完整程度' },
        { key: 'C', content: '颜色深浅' },
        { key: 'D', content: '年代远近' }
      ],
      answer: 'A,B',
      analysis: '《工程岩体分级标准》采用分两步走的方法进行工程岩体分级，先对岩体进行基本质量分级，再根据岩体的具体工程条件做出修正，对各类型工程岩体作详细定级。岩体基本质量分级主要考虑岩石的坚硬程度和岩体的完整程度两个分级因素。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '岩体分级', '分级因素'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_025',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '水利水电工程岩石试验工作应在详细了解工程规模、工程地质条件、设计意图、建筑物特点和施工方法的基础上进行，试验内容、试验方法、试验数量等应与工程建设的各个勘察设计阶段的深度相适应，并应符合下列规定（）。',
      options: [
        { key: 'A', content: '规划阶段应充分利用与建筑物地区工程地质条件相类似工程的岩石试验成果' },
        { key: 'B', content: '可行性研究阶段应根据划分的工程地质单元布置室内岩块试验和现场岩体声波测试' },
        { key: 'C', content: '初步设计阶段应根据工程岩体条件及建筑物特点，拟定出关键的岩石力学问题' },
        { key: 'D', content: '技施设计阶段应根据初步设计审查后新发现的工程地质问题和新提出的岩石力学问题进行专门性岩石试验' }
      ],
      answer: 'A,B,C,D',
      analysis: '水利水电工程岩石试验工作应在详细了解工程规模、工程地质条件、设计意图、建筑物特点和施工方法的基础上进行，各阶段都有相应的规定要求。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '岩石试验', '阶段要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_026',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩石试验大纲应包括下列内容（）。',
      options: [
        { key: 'A', content: '工程概况及地质条件' },
        { key: 'B', content: '水工建筑物特点和主要岩石力学问题' },
        { key: 'C', content: '试验目的、试验内容和技术要求' },
        { key: 'D', content: '试验布置、试验方法、试验数量' }
      ],
      answer: 'A,B,C,D',
      analysis: '岩石试验大纲应包括下列内容：(1)工程概况及地质条件；(2)水工建筑物特点和主要岩石力学问题；(3)试验目的、试验内容和技术要求；(4)试验布置、试验方法、试验数量、试验成果整理与分析；(5)仪器设备和人员安排；(6)计划进度；(7)提交的试验成果。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '试验大纲', '内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_027',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩石试验成果报告正文内容应包括（）。',
      options: [
        { key: 'A', content: '工程概况、工程地质条件、主要岩石力学问题' },
        { key: 'B', content: '试验目的、试验内容、试验布置、试验方法' },
        { key: 'C', content: '试验数量、试验成果整理与分析' },
        { key: 'D', content: '提供的试验值及主要结论等' }
      ],
      answer: 'A,B,C,D',
      analysis: '试验工作完成后对试验成果进行整理和综合分析，并编制和提交试验成果报告。报告正文内容应包括工程概况、工程地质条件、主要岩石力学问题、试验目的、试验内容、试验布置、试验方法、试验数量、试验成果整理与分析、提供的试验值及主要结论等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '试验报告', '内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_028',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩石试验成果整理和综合分析时要在充分了解水工建筑物布置方案、工程建筑类型、持力方向、载荷大小以及地基、边坡和地下洞室岩体工程地质条件与设计技术要求基础上，对试验资料进行逐项检查和核对，分析试验成果的（）。',
      options: [
        { key: 'A', content: '代表性' },
        { key: 'B', content: '规律性' },
        { key: 'C', content: '合理性' },
        { key: 'D', content: '经济性' }
      ],
      answer: 'A,B,C',
      analysis: '岩石试验成果整理和综合分析时要对试验资料进行逐项检查和核对，分析试验成果的代表性、规律性和合理性，并按岩体类别、工程地质单元、区段或层位进行归类、数理统计和综合分析，提出试验成果标准值。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '试验成果', '分析'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_029',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩石是地质历史的产物，在漫长的地质历史中，建造之后又经历了多次改造，形成了各种地质构造形迹，如断层、节理、裂隙等。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。由于岩石是地质历史的产物，在漫长的地质历史中，建造之后又经历了多次改造，形成了各种地质构造形迹，如断层、节理、裂隙等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '岩石', '地质构造'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_030',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '从宏观上看，不包含结构面的岩块内部，仍然有微观结构的存在。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。虽然这种划分具有相对性，从宏观上看，不包含结构面的岩块内部，仍然有微观结构的存在。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '岩块', '微观结构'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_031',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩体赋存于地应力和地下水环境中，这也是岩体不同于一般材料的重要特征。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。另外，岩体赋存于地应力和地下水环境中，这也是岩体不同于一般材料的重要特征。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '岩体', '特征'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_032',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '由于结构面的存在，工程岩体的破坏在很多情况下表现为沿软弱结构面的剪切破坏，因此对结构面的剪切强度的测试又是研究工作的重点。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。由于结构面的存在，工程岩体的破坏在很多情况下表现为沿软弱结构面的剪切破坏，因此对结构面的剪切强度的测试又是研究工作的重点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '结构面', '剪切破坏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_033',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '一般采用岩石单轴饱和抗压强度作为岩石的坚硬程度分类的定量指标。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。所以，一般采用岩石单轴饱和抗压强度作为岩石的坚硬程度分类的定量指标。现场鉴别岩石的坚硬程度可根据岩石的锤击难易程度、回弹程度、手触感觉和吸水反映来为岩石的坚硬程度做定性鉴定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '坚硬程度', '定量指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_034',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩体完整性系数Kv值既反映了岩体结构面的发育程度，又反映了结构面的性状，是一项能较全面地从量上反映岩体完整程度的指标。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在岩性相同的条件下，岩体完整性系数Kv值既反映了岩体结构面的发育程度，又反映了结构面的性状，是一项能较全面地从量上反映岩体完整程度的指标。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '完整性系数', '岩体完整程度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_035',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '定性分级与定量分级相互验证，可以获得较准确的岩体基本质量定级。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据岩石坚硬程度、岩体完整程度以及BQ值，按表1-3可分别得到岩体基本质量的定性和定量级别。定性分级与定量分级相互验证，可以获得较准确的岩体基本质量定级。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '岩体分级', '定性定量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_036',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '水对岩浆岩、变质岩的软化影响较小，而对沉积年代较新、成岩程度较差、含黏土成分较多的黏土岩、黏土质粉砂岩，尤其对软岩和具有充填的软弱结构面软化影响较大。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。水对岩浆岩、变质岩的软化影响较小，而对沉积年代较新、成岩程度较差、含黏土成分较多的黏土岩、黏土质粉砂岩，尤其对软岩和具有充填的软弱结构面软化影响较大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '水的影响', '软化'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_037',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩石中蒙脱石成分较多时，遇水膨胀并产生膨胀力，引起变形增加，这些都会使岩体的力学性质产生很大变化。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩石中蒙脱石成分较多时，遇水膨胀并产生膨胀力，引起变形增加，这些都会使岩体的力学性质产生很大变化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '蒙脱石', '膨胀'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_038',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩块试验的试件可在钻孔、平洞、竖井、坑槽中或岩石露头处采取，同组试件的岩性应基本相同。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩块试验的试件可在钻孔、平洞、竖井、坑槽中或岩石露头处采取，同组试件的岩性应基本相同。取样位置和数量应根据地质条件、工程特点和试验要求由试验人员和地质人员共同研究确定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '岩块试验', '取样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_039',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '岩体现场试验应当布置在建筑物所在位置或附近的具有代表性的岩体中，宜在试验洞中进行，并进行试点和试验洞段的地质描述。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩体现场试验应当布置在建筑物所在位置或附近的具有代表性的岩体中，宜在试验洞中进行，并进行试点和试验洞段的地质描述。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '现场试验', '布置'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_040',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石概述',
      content: '在开展岩石试验工作之前，应收集和分析工程地质资料，结合设计方案和勘察工作编制岩石试验大纲，在执行过程中可根据地质条件和设计情况的变化适当进行调整修改。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在开展岩石试验工作之前，应收集和分析工程地质资料，结合设计方案和勘察工作编制岩石试验大纲，在执行过程中可根据地质条件和设计情况的变化适当进行调整修改。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '试验大纲', '编制'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
