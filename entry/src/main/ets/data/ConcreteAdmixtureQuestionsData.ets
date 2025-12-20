/**
 * 混凝土工程题目数据 - 第二章 外加剂与磷�ite粉
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：混凝土工程（第3版）第二章 混凝土原材料 - 第三节 外加剂
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取混凝土工程外加剂与磷渣粉题目
 * 单选题12题(52%)、多选题5题(22%)、判断题6题(26%)
 */
export function getConcreteAdmixtureQuestions(timestamp: number): Question[] {
  return [
    // ========== 单选题 12题 ==========
    {
      id: 'concrete_066',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '混凝土外加剂是在拌制混凝土时掺入少量（一般不超过水泥用量的（）），以改善混凝土性能的物质。',
      options: [
        { key: 'A', content: '3%' },
        { key: 'B', content: '5%' },
        { key: 'C', content: '8%' },
        { key: 'D', content: '10%' }
      ],
      answer: 'B',
      analysis: '混凝土外加剂是在拌制混凝土时掺入少量（一般不超过水泥用量的5%），以改善混凝土性能的物质。因此，它是混凝土的重要组成部分。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '外加剂', '掺量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_067',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '掺木质素磺酸盐（如木钙）0.25%，可减少用水量（）',
      options: [
        { key: 'A', content: '3%~5%' },
        { key: 'B', content: '5%~15%' },
        { key: 'C', content: '6%~11%' },
        { key: 'D', content: '15%~30%' }
      ],
      answer: 'B',
      analysis: '掺木质素磺酸盐（如木钙）0.25%，可减少用水量5%~15%；掺糖蜜类减水剂可减少用水量6%~11%；掺高效减水剂可减少用水量15%~30%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '减水剂', '木钙'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_068',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '对于超高强混凝土，减水率甚至可达（），减水剂的增强效果从5%至30%，甚至更高。',
      options: [
        { key: 'A', content: '20%' },
        { key: 'B', content: '30%' },
        { key: 'C', content: '40%' },
        { key: 'D', content: '50%' }
      ],
      answer: 'C',
      analysis: '对于超高强混凝土，减水率甚至可达40%。减水剂的增强效果从5%至30%，甚至更高。掺高效减水剂，水灰比可降低到0.25左右，配制的混凝土抗压强度可超过100MPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '减水剂', '超高强混凝土'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_069',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '掺入1%和2%的氯化钙对普通水泥及火山灰水泥混凝土强度的增长率，2d分别可达到（）',
      options: [
        { key: 'A', content: '20%、50%' },
        { key: 'B', content: '30%、80%' },
        { key: 'C', content: '40%、100%' },
        { key: 'D', content: '50%、120%' }
      ],
      answer: 'C',
      analysis: '掺入1%和2%的氯化钙对普通水泥及火山灰水泥混凝土强度的增长率，2d分别可达到40%、100%，在低温条件下尤为明显，但氯化钙对钢筋有腐蚀作用，因此对它应限制使用。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '外加剂', '早强剂', '氯化钙'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_070',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '三乙醇胺早强剂掺量为0.03%~0.05%，能提高混凝土（）强度50%左右。',
      options: [
        { key: 'A', content: '1~2d' },
        { key: 'B', content: '2~3d' },
        { key: 'C', content: '3~5d' },
        { key: 'D', content: '7d' }
      ],
      answer: 'B',
      analysis: '三乙醇胺早强剂掺量为0.03%~0.05%，能提高混凝土2~3d强度50%左右。早强剂甲酸钙对混凝土早期强度的影响，取决于水泥中铝酸三钙的含量，铝酸三钙含量低的水泥，甲酸钙对其增强效果较好。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '早强剂', '三乙醇胺'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_071',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '超早强剂的作用是使混凝土凝结后快速增加强度。条件是混凝土拌和后（）内完成浇筑，且需保持混凝土的温度不低于21℃。',
      options: [
        { key: 'A', content: '0.5h' },
        { key: 'B', content: '1h' },
        { key: 'C', content: '1.5h' },
        { key: 'D', content: '2h' }
      ],
      answer: 'B',
      analysis: '超早强剂的作用是使混凝土凝结后快速增加强度。条件是混凝土拌和后1h内完成浇筑，且需保持混凝土的温度不低于21℃。它主要应用于混凝土工程抢修。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '超早强剂'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_072',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '磷渣粉品质要求中，比表面积应（）',
      options: [
        { key: 'A', content: '≥250m²/kg' },
        { key: 'B', content: '≥280m²/kg' },
        { key: 'C', content: '≥300m²/kg' },
        { key: 'D', content: '≥350m²/kg' }
      ],
      answer: 'C',
      analysis: '根据表2-22磷渣粉品质要求，比表面积应≥300m²/kg。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '磷渣粉', '比表面积'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_073',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '磷渣粉品质要求中，活性指数7d应（），28d应（）',
      options: [
        { key: 'A', content: '≥40%，≥60%' },
        { key: 'B', content: '≥50%，≥70%' },
        { key: 'C', content: '≥55%，≥75%' },
        { key: 'D', content: '≥60%，≥80%' }
      ],
      answer: 'B',
      analysis: '根据表2-22磷渣粉品质要求，活性指数7d应≥50%，28d应≥70%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '磷渣粉', '活性指数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_074',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水工混凝土掺用磷渣粉品质要求中，活性指数（28d）应（）',
      options: [
        { key: 'A', content: '≥50%' },
        { key: 'B', content: '≥60%' },
        { key: 'C', content: '≥70%' },
        { key: 'D', content: '≥80%' }
      ],
      answer: 'B',
      analysis: '根据表2-23水工混凝土掺用磷渣粉品质要求，活性指数（28d）应≥60%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '磷渣粉', '水工混凝土', '活性指数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_075',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '常态混凝土掺比不掺磷渣粉的用水量减少（）',
      options: [
        { key: 'A', content: '2~3kg/m³' },
        { key: 'B', content: '5~6kg/m³' },
        { key: 'C', content: '8~10kg/m³' },
        { key: 'D', content: '10~15kg/m³' }
      ],
      answer: 'B',
      analysis: '混凝土拌和物试验结果表明，常态混凝土掺比不掺磷渣粉的用水量减少5~6kg/m³；碾压混凝土掺磷渣粉可使单位用水量减少2kg/m³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '磷渣粉', '用水量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_076',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '对于碾压混凝土而言，在水胶比为0.50时，磷渣粉可以掺入（），其上述性能亦表明是好的。',
      options: [
        { key: 'A', content: '35%' },
        { key: 'B', content: '45%' },
        { key: 'C', content: '55%' },
        { key: 'D', content: '65%' }
      ],
      answer: 'D',
      analysis: '对于碾压混凝土而言，在水胶比为0.50时，磷渣粉可以掺入65%，其上述性能亦表明是好的。这就为碾压混凝土采用大掺量磷渣粉提供了一定的条件。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '磷渣粉', '碾压混凝土', '掺量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_077',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '掺入35%的磷渣粉常态混凝土抗渗等级（），抗冻等级（）。这表明掺磷渣粉混凝土耐久性并不低。',
      options: [
        { key: 'A', content: '>W6，>F100' },
        { key: 'B', content: '>W8，>F150' },
        { key: 'C', content: '>W10，>F200' },
        { key: 'D', content: '>W12，>F250' }
      ],
      answer: 'B',
      analysis: '掺入35%的磷渣粉常态混凝土抗渗等级>W8，抗冻等级>F150。这表明掺磷渣粉混凝土耐久性并不低。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '磷渣粉', '耐久性', '抗渗', '抗冻'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 5题 ==========
    {
      id: 'concrete_078',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '按其化学成分可分为（）',
      options: [
        { key: 'A', content: '有机外加剂' },
        { key: 'B', content: '无机外加剂' },
        { key: 'C', content: '有机无机复合外加剂' },
        { key: 'D', content: '天然外加剂' }
      ],
      answer: 'A,B,C',
      analysis: '按其化学成分可分为有机外加剂、无机外加剂及有机无机复合外加剂。如减水剂就分为木质素磺酸盐类、糖蜜类、萘系（磺化萘甲醛缩合物）、蜜胺类（磺化蜜胺甲醛缩合物）、聚羧酸盐类以及复合减水剂。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '外加剂', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_079',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '按其功能与使用效果分为（）',
      options: [
        { key: 'A', content: '改善混凝土拌和物性能的外加剂：如减水剂、高效减水剂、泵送剂等' },
        { key: 'B', content: '调节混凝土凝结时间的外加剂：如缓凝剂、早强剂和速凝剂等' },
        { key: 'C', content: '改善混凝土耐久性能的外加剂：引气剂、防水剂、引气减水剂等' },
        { key: 'D', content: '改善混凝土其他性能的外加剂：膨胀剂、防冻剂、着色剂，以及水下混凝土不分散剂等' }
      ],
      answer: 'A,B,C,D',
      analysis: '按其功能与使用效果分为：①改善混凝土拌和物性能的外加剂：如减水剂、高效减水剂、泵送剂等；②调节混凝土凝结时间的外加剂：如缓凝剂、早强剂和速凝剂等；③改善混凝土耐久性能的外加剂：引气剂、防水剂、引气减水剂等；④改善混凝土其他性能的外加剂：膨胀剂、防冻剂、着色剂，以及水下混凝土不分散剂等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '分类', '功能'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_080',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水工混凝土常用的外加剂有（）',
      options: [
        { key: 'A', content: '普通减水剂：木质素磺酸钙（木钙）、木质素磺酸钠（木钠）、木质素磺酸镁及丹宁等普通减水剂' },
        { key: 'B', content: '高效减水剂：萘和萘的同系磺化物与甲醛缩合的盐类、脂基磺酸盐、磺化三聚氰胺树脂等高效减水剂' },
        { key: 'C', content: '引气剂：松香热聚物、松香皂、十二烷基磺酸盐、烷基苯磺酸盐、脂肪醇聚氧乙烯磺酸钠等引气剂' },
        { key: 'D', content: '早强剂：硫酸盐、氯盐、亚硝酸盐、三乙醇胺、甲酸盐、乙酸盐、丙酸盐以及有机物与无机盐复合物等早强剂' }
      ],
      answer: 'A,B,C,D',
      analysis: '水工混凝土常用的外加剂有：(1)普通减水剂；(2)高效减水剂；(3)引气剂；(4)早强剂；(5)特殊用途的外加剂：泵送剂、水下混凝土不分散剂、膨胀剂、防水剂、缓凝剂以及高效缓凝剂等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '水工混凝土'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_081',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '磷渣粉品质要求中，以下说法正确的是（）',
      options: [
        { key: 'A', content: '细度（80μm方孔筛筛余）≤5%' },
        { key: 'B', content: '密度≥2.8g/cm³' },
        { key: 'C', content: '流动度比≥95%' },
        { key: 'D', content: '含水量≤2.0%' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据表2-22磷渣粉品质要求：细度（80μm方孔筛筛余）≤5%；密度≥2.8g/cm³；流动度比≥95%；含水量≤2.0%；三氧化硫≤4.0%；五氧化二磷≤3.5%；烧失量≤3.0%；安定性合格。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '磷渣粉', '品质要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_082',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '外加剂的作用包括（）',
      options: [
        { key: 'A', content: '改善混凝土拌和物性能' },
        { key: 'B', content: '提高硬化混凝土性能' },
        { key: 'C', content: '降低能耗和改善劳动条件' },
        { key: 'D', content: '使资源得到充分利用，还有利于保护环境' }
      ],
      answer: 'A,B,C,D',
      analysis: '混凝土中掺加少量的化学外加剂，可大大改善了它的性能和降低费用，使资源得到充分利用，还有利于保护环境。外加剂可以改善混凝土拌和物性能、提高硬化混凝土性能、降低能耗和改善劳动条件。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '外加剂', '作用'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 6题 ==========
    {
      id: 'concrete_083',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '混凝土掺入引气、减水等功能的外加剂，提高了混凝土的流动性能，改善了和易性。由于混凝土和易性改善，其质量得到保证，可降低能耗和改善劳动条件。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。混凝土掺入引气、减水等功能的外加剂，提高了混凝土的流动性能，改善了和易性。由于混凝土和易性改善，其质量得到保证，可降低能耗和改善劳动条件。掺缓凝类外加剂，延缓了混凝土凝结时间。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '外加剂', '和易性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_084',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '在泵送混凝土中加入泵送剂，使混凝土具有良好的可泵性，不产生泌水、离析，增加拌和物的流动性和稳定性。同时，使混凝土在管道内的摩阻力减小，降低输送过程中能量的损耗，增强混凝土的密实性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在泵送混凝土中加入泵送剂，使混凝土具有良好的可泵性，不产生泌水、离析，增加拌和物的流动性和稳定性。同时，使混凝土在管道内的摩阻力减小，降低输送过程中能量的损耗，增强混凝土的密实性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '泵送剂'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_085',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '磷渣的化学成分可知，它的矿物组成主要是硅�ite盐和铝酸盐玻璃体，它们的含量在85%~90%。磷渣所具有的较高活性，主要是硅酸盐和铝酸盐的玻璃体的作用。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。由磷渣的化学成分可知，它的矿物组成主要是硅酸盐和铝酸盐玻璃体，它们的含量在85%~90%，另外含有少量细小晶体，结晶相中有假硅灰石、石英、方解石、氯化钙、硅酸二钙等。磷渣所具有的较高活性，主要是硅酸盐和铝酸盐的玻璃体的作用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '磷渣粉', '矿物组成', '活性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_086',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '从表2-25与表2-26可知，抗压强度随磷渣粉掺量增加而降低。对于常态混凝土随水胶比增大，其抗压强度增长率以及抗压强度比均增大。抗压强度比随龄期增加而增加。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。从表2-25与表2-26可知，抗压强度随磷渣粉掺量增加而降低。对于常态混凝土随水胶比增大，其抗压强度增长率以及抗压强度比均增大。抗压强度比随龄期增加而增加。这些试验结果表明，磷渣粉的后期抗压强度发展较快，磷渣粉的后期抗压强度比大于其掺量。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '磷渣粉', '抗压强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_087',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '对于大体积水工混凝土来说，混凝土温升是重要参数。混凝土温升高，意味着其抗裂性能差。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。对于大体积水工混凝土来说，混凝土温升是重要参数。混凝土温升高，意味着其抗裂性能差。掺磷渣粉混凝土绝热温升值见表2-29。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '大体积混凝土', '温升', '抗裂性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_088',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '掺磷渣粉混凝土的抗压强度、极限拉伸值均较高，抗压弹性模量又相应较低，掺磷渣粉混凝土的抗裂性好。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。特别应指出的是，掺磷渣粉混凝土的极限拉伸值提高，抗压弹性模量又相应较低，掺磷渣粉混凝土的抗裂性好。磷渣粉混凝土的耐久性也较好，绝热温升较低。因此，磷渣粉可以作为水工混凝土的掺合料使用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '磷渣粉', '抗裂性', '弹性模量'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
