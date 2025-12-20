/**
 * 混凝土工程题目数据 - 第二章 水泥（第二部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：混凝土工程（第3版）第二章 混凝土原材料 - 水泥品种及技术指标
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取混凝土工程第二章水泥题目（第二部分）
 * 单选题10题(50%)、多选题4题(20%)、判断题6题(30%)
 */
export function getConcreteCementQuestions2(timestamp: number): Question[] {
  return [
    // ========== 单选题 10题 ==========
    {
      id: 'concrete_046',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '硅酸盐水泥P·I型的熟料+石膏组分含量为（）',
      options: [
        { key: 'A', content: '100%' },
        { key: 'B', content: '≥95%' },
        { key: 'C', content: '≥80且<95%' },
        { key: 'D', content: '≥50且<80%' }
      ],
      answer: 'A',
      analysis: '根据表2-7通用硅酸盐水泥的组分，硅酸盐水泥P·I型的熟料+石膏组分含量为100%，不掺加任何混合材料。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '硅酸盐水泥', '组分'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_047',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '普通硅酸盐水泥（P·O）的熟料+石膏组分含量要求为（）',
      options: [
        { key: 'A', content: '100%' },
        { key: 'B', content: '≥95%' },
        { key: 'C', content: '≥80且<95%' },
        { key: 'D', content: '≥50且<80%' }
      ],
      answer: 'C',
      analysis: '根据表2-7，普通硅酸盐水泥（P·O）的熟料+石膏组分含量要求为≥80且<95%，火山灰质混合材料含量>5且≤20%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '普通硅酸盐水泥', '组分'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_048',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '中热硅酸盐水泥的代号为（）',
      options: [
        { key: 'A', content: 'P·LH' },
        { key: 'B', content: 'P·MH' },
        { key: 'C', content: 'P·MSR' },
        { key: 'D', content: 'P·HSR' }
      ],
      answer: 'B',
      analysis: '中热硅酸盐水泥：以适当成分（C₃S含量≤55%，C₃A含量≤6%与f-CaO≤1.0%）的硅酸盐水泥熟料加入适量石膏，磨细制成的具有中等水化热的水硬性胶凝材料，称为中热硅酸盐水泥（简称中热水泥），代号P·MH。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水泥', '中热水泥', '代号'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_049',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '低热硅酸盐水泥的矿物成分指标要求C₃A含量应（）',
      options: [
        { key: 'A', content: '≤3%' },
        { key: 'B', content: '≤6%' },
        { key: 'C', content: '≤8%' },
        { key: 'D', content: '≤10%' }
      ],
      answer: 'B',
      analysis: '低热硅酸盐水泥：以适当成分（C₃A≤6%，C₂S≥40%，f-CaO≤1.0%）的硅酸盐水泥熟料及适量石膏，磨细制成的具有低水化热的水硬性胶凝材料，称为低热硅酸盐水泥（简称低热水泥），代号P·LH。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '低热水泥', '矿物成分'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_050',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '中抗硫酸盐硅酸盐水泥的矿物组成要求C₃S含量应（）',
      options: [
        { key: 'A', content: '≤50%' },
        { key: 'B', content: '≤55%' },
        { key: 'C', content: '≤60%' },
        { key: 'D', content: '≤65%' }
      ],
      answer: 'B',
      analysis: '中抗硫酸盐硅酸盐水泥：以特定矿物组成（C₃S含量≤55%，C₃A含量≤5.0%）的硅酸盐水泥熟料，加入适量石膏，磨细制成的具有抵抗中等浓度硫酸根离子侵蚀的水硬性胶凝材料，简称中抗硫酸盐水泥，代号P·MSR。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '抗硫酸盐水泥', '矿物组成'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_051',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '硅酸盐水泥的细度要求比表面积应（）',
      options: [
        { key: 'A', content: '≥250m²/kg' },
        { key: 'B', content: '≥280m²/kg' },
        { key: 'C', content: '≥300m²/kg' },
        { key: 'D', content: '≥350m²/kg' }
      ],
      answer: 'C',
      analysis: '根据表2-8常用水泥的主要技术性能指标，硅酸盐水泥的细度要求比表面积≥300m²/kg。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '硅酸盐水泥', '细度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_052',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '硅酸盐水泥的凝结时间要求初凝时间应（）',
      options: [
        { key: 'A', content: '≥30min' },
        { key: 'B', content: '≥45min' },
        { key: 'C', content: '≥60min' },
        { key: 'D', content: '≥90min' }
      ],
      answer: 'B',
      analysis: '根据表2-8，硅酸盐水泥的凝结时间要求初凝≥45min，终凝≤390min。普通硅酸盐水泥初凝≥45min，终凝≤600min。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水泥', '凝结时间', '初凝'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_053',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '硅酸盐水泥的三氧化硫含量要求应（）',
      options: [
        { key: 'A', content: '≤2.5%' },
        { key: 'B', content: '≤3.0%' },
        { key: 'C', content: '≤3.5%' },
        { key: 'D', content: '≤4.0%' }
      ],
      answer: 'C',
      analysis: '根据表2-8，硅酸盐水泥的三氧化硫含量要求≤3.5%。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水泥', '三氧化硫', '技术指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_054',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水工混凝土常用水泥中，凝结时间最快的是（）',
      options: [
        { key: 'A', content: '硅酸盐水泥' },
        { key: 'B', content: '普通水泥' },
        { key: 'C', content: '矿渣水泥' },
        { key: 'D', content: '低热水泥' }
      ],
      answer: 'A',
      analysis: '根据表2-10水工混凝土常用水泥主要性能及适用范围，硅酸盐水泥凝结时间为"快"，普通水泥为"较快"，矿渣水泥、火山灰水泥、粉煤灰水泥为"较慢"，中热水泥为"快"，低热水泥为"较慢"。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '凝结时间', '水工混凝土'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_055',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水工混凝土常用水泥中，水化热最低的是（）',
      options: [
        { key: 'A', content: '硅酸盐水泥' },
        { key: 'B', content: '普通水泥' },
        { key: 'C', content: '中热水泥' },
        { key: 'D', content: '低热水泥' }
      ],
      answer: 'D',
      analysis: '根据表2-10，硅酸盐水泥水化热为"高"，普通水泥为"低"，矿渣水泥为"低"，中热水泥为"中"，低热水泥为"低"。低热水泥专门设计用于大体积混凝土，具有最低的水化热。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水泥', '水化热', '低热水泥'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 4题 ==========
    {
      id: 'concrete_056',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '通用硅酸盐水泥按混合材料的品种和掺量分为（）',
      options: [
        { key: 'A', content: '硅酸盐水泥、普通硅酸盐水泥' },
        { key: 'B', content: '矿渣硅酸盐水泥、火山灰质硅酸盐水泥' },
        { key: 'C', content: '粉煤灰硅酸盐水泥、复合硅酸盐水泥' },
        { key: 'D', content: '中热硅酸盐水泥、低热硅酸盐水泥' }
      ],
      answer: 'A,B,C',
      analysis: '通用硅酸盐水泥的定义是：以硅酸盐水泥熟料和适量的石膏及规定的混合材料制成的水硬性胶凝材料。通用硅酸盐水泥按混合材料的品种和掺量分为硅酸盐水泥、普通硅酸盐水泥、矿渣硅酸盐水泥、火山灰质硅酸盐水泥、粉煤灰硅酸盐水泥和复合硅酸盐水泥。中热和低热硅酸盐水泥属于特种水泥。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '通用硅酸盐水泥', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_057',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水泥品质检验标准包括（）',
      options: [
        { key: 'A', content: '《水泥胶砂强度检验方法（ISO法）》（GB/T 17671—1999）' },
        { key: 'B', content: '《水泥压蒸安定性试验方法》（GB/T 750—92）' },
        { key: 'C', content: '《水泥标准稠度用水量、凝结时间、安定性检验方法》（GB/T 1346—2011）' },
        { key: 'D', content: '《水泥细度检验方法 筛析法》（GB/T 1345—2005）' }
      ],
      answer: 'A,B,C,D',
      analysis: '水泥品质检验标准包括：《水泥胶砂强度检验方法（ISO法）》（GB/T 17671—1999）、《水泥压蒸安定性试验方法》（GB/T 750—92）、《水泥标准稠度用水量、凝结时间、安定性检验方法》（GB/T 1346—2011）、《水泥胶砂流动度测定方法》（GB/T 2419—2005）、《水泥细度检验方法 筛析法》（GB/T 1345—2005）等。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '水泥', '检验标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_058',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '中热硅酸盐水泥矿物成分指标要求包括（）',
      options: [
        { key: 'A', content: 'C₃A≤6.0%' },
        { key: 'B', content: 'C₃S≤55.0%' },
        { key: 'C', content: 'f-CaO≤1.0%' },
        { key: 'D', content: 'C₂S≥40%' }
      ],
      answer: 'A,B,C',
      analysis: '中热硅酸盐水泥矿物成分指标为：C₃A≤6.0%，C₃S≤55.0%，f-CaO≤1.0%。而C₂S≥40%是低热硅酸盐水泥的要求。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '水泥', '中热水泥', '矿物成分'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_059',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '硅酸盐水泥适用于（）',
      options: [
        { key: 'A', content: '预应力钢筋混凝土的地上、地下和水中结构' },
        { key: 'B', content: '包括受反复冻融作用的结构' },
        { key: 'C', content: '有抗冲耐磨要求的混凝土工程' },
        { key: 'D', content: '环境水有硫酸盐侵蚀的外部混凝土' }
      ],
      answer: 'A,B,C',
      analysis: '根据表2-10，硅酸盐水泥适用于预应力钢筋混凝土的地上、地下和水中结构，其中包括受反复冻融作用的结构及有抗冲耐磨要求的混凝土工程。但不宜应用于环境水有硫酸盐侵蚀和软水侵蚀的外部混凝土。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '硅酸盐水泥', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 6题 ==========
    {
      id: 'concrete_060',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '硅酸盐水泥比表面积要求≥300m²/kg，普通硅酸盐水泥比表面积也要求≥300m²/kg。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。根据表2-8，硅酸盐水泥细度要求比表面积≥300m²/kg，而普通硅酸盐水泥细度要求也是比表面积≥300m²/kg。但矿渣硅酸盐水泥、火山灰质硅酸盐水泥、粉煤灰硅酸盐水泥的细度要求是80μm方孔筛筛余≤10%，45μm方孔筛筛余≤30%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '细度', '比表面积'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_061',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '低热硅酸盐水泥的矿物成分指标要求C₂S≥40%，这是为了降低水化热。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。低热硅酸盐水泥矿物成分指标为：C₂S≥40%，C₃A≤6%，f-CaO≤1.0%。C₂S水化热低，后期强度高，提高C₂S含量可以有效降低水泥的水化热，适用于大体积混凝土工程。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '低热水泥', 'C₂S'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_062',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '抗硫酸盐水泥烧失量要求≥3.0%，不溶物≤1.5%。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。抗硫酸盐水泥烧失量要求≤3.0%（不是≥3.0%），不溶物≤1.5%，水泥比表面积≤280m²/kg，（K₂O+Na₂O）总量<0.6%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '抗硫酸盐水泥', '技术指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_063',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '低热微膨胀水泥的f-CaO≤3.0%，MgO≥6%，水泥比表面积≤300m²/kg。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。低热微膨胀水泥的技术要求：f-CaO≤3.0%，MgO≥6%，水泥比表面积≤300m²/kg，SO₃含量为4%~7%。水泥净浆试体在水中养护至各龄期的线膨胀率应符合以下要求：1d不得小于0.05%，7d不得小于0.10%，28d不得大于0.6%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '水泥', '低热微膨胀水泥', '技术指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_064',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '采用中热水泥其C₄AF、C₂S含量高，可提高混凝土抗冲磨强度及抗拉强度，对抗冲磨混凝土的抗裂及抗冲磨都有利。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。表2-6说明采用中热水泥其C₄AF、C₂S含量高，可提高混凝土抗冲磨强度及抗拉强度，对抗冲磨混凝土的抗裂及抗冲磨都有利。从劈拉强度来看，胶材量相等，中热水泥劈拉强度达4.2MPa，而普硅水泥只有3.4MPa。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '水泥', '中热水泥', '抗冲磨'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_065',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '中热及低热水泥中热水泥及低热水泥为≤0.6%，低热矿渣水泥为≤1.0%。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。碱含量（K₂O+Na₂O）中热水泥及低热水泥为≤0.6%，低热矿渣水泥为≤1.0%。控制碱含量是为了防止碱骨料反应，避免混凝土产生膨胀开裂。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '碱含量', '中热水泥', '低热水泥'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
