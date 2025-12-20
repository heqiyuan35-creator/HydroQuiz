/**
 * 混凝土工程题目数据 - 第二章 粗骨料与碱-骨料反应
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：混凝土工程（第3版）第二章 混凝土原材料 - 粗骨料与碱骨料反应
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取混凝土工程粗骨料与碱-骨料反应题目
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getConcreteAggregateQuestions(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'concrete_112',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '低于C30混凝土应大于（）倍设计强度，高于C30混凝土应大于2.0倍设计强度。',
      options: [
        { key: 'A', content: '1.2' },
        { key: 'B', content: '1.5' },
        { key: 'C', content: '1.8' },
        { key: 'D', content: '2.0' }
      ],
      answer: 'B',
      analysis: '粗骨料在混凝土中起着骨架作用，骨料的强度和压碎指标直接影响混凝土的强度和变形性能。低于C30混凝土应大于1.5倍设计强度，高于C30混凝土应大于2.0倍设计强度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '粗骨料', '强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_113',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '用来加工碎石的岩石混抗压强度，或者火成岩强度不宜低于（）MPa。',
      options: [
        { key: 'A', content: '60' },
        { key: 'B', content: '80' },
        { key: 'C', content: '100' },
        { key: 'D', content: '120' }
      ],
      answer: 'B',
      analysis: '用来加工碎石的岩石混抗压强度，或者火成岩强度不宜低于80MPa，变质岩不宜低于60MPa，水成岩不宜低于30MPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '粗骨料', '岩石强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_114',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '碎石或卵石的压碎指标，是指粒径为（）mm的颗粒，在标准荷载作用下压碎颗粒含量的百分率。',
      options: [
        { key: 'A', content: '5~10' },
        { key: 'B', content: '10~20' },
        { key: 'C', content: '20~40' },
        { key: 'D', content: '40~80' }
      ],
      answer: 'B',
      analysis: '碎石或卵石的压碎指标，是指粒径为10~20mm的颗粒，在标准荷载作用下压碎颗粒含量的百分率。该部分细粒属于软弱颗粒，如风化的卵石、砂岩及泥岩等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '粗骨料', '压碎指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_115',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: 'C30~C60及有抗冻、抗渗或其他要求的混凝土应小于（）%。',
      options: [
        { key: 'A', content: '10' },
        { key: 'B', content: '15' },
        { key: 'C', content: '20' },
        { key: 'D', content: '25' }
      ],
      answer: 'B',
      analysis: '软弱颗粒含量过高会降低混凝土强度，特别对于C40以上混凝土影响更大。C30~C60及有抗冻、抗渗或其他要求的混凝土应小于15%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '粗骨料', '软弱颗粒'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_116',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '碱-骨料反应（AAR）类型可分为碱硅酸盐反应（ASR）和碱碳酸盐反应（ACR），AAR是造成混凝土结构破坏失效的重要原因之一。受碱-骨料反应影响的混凝土需要（）年或一二十年的时间才会出现开裂破坏。',
      options: [
        { key: 'A', content: '1~3' },
        { key: 'B', content: '3~5' },
        { key: 'C', content: '数' },
        { key: 'D', content: '十几' }
      ],
      answer: 'C',
      analysis: '受碱-骨料反应影响的混凝土需要数年或一二十年的时间才会出现开裂破坏。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '碱骨料反应', 'AAR'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_117',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '应采用低碱水泥。水泥含碱量应≤1.0%，f-CaO含量≤1.0%，MgO含量≤（）%。',
      options: [
        { key: 'A', content: '3.0' },
        { key: 'B', content: '4.0' },
        { key: 'C', content: '5.0' },
        { key: 'D', content: '6.0' }
      ],
      answer: 'C',
      analysis: '应采用低碱水泥。水泥含碱量应≤1.0%，f-CaO含量≤1.0%，MgO含量≤5.0%（最好控制在2.5%以下），SO₃含量≤3.5%，水泥品种为硅酸盐水泥，宜采用回旋窑生产的水泥。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '低碱水泥'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_118',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: 'ASTMC618限定的用于抑制ASR的粉煤灰含碱量必须小于（）%。',
      options: [
        { key: 'A', content: '1.0' },
        { key: 'B', content: '1.5' },
        { key: 'C', content: '2.0' },
        { key: 'D', content: '2.5' }
      ],
      answer: 'B',
      analysis: '掺用低碱粉煤灰。ASTMC618限定的用于抑制ASR的粉煤灰含碱量必须小于1.5%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '粉煤灰'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_119',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '掺用酸性�ite渣较优，矿渣掺量以（）%为宜。其作用近似于粉煤灰。',
      options: [
        { key: 'A', content: '20%~30%' },
        { key: 'B', content: '30%~40%' },
        { key: 'C', content: '40%~50%' },
        { key: 'D', content: '50%~60%' }
      ],
      answer: 'C',
      analysis: '掺用酸性矿渣较优，矿渣掺量以40%~50%为宜。其作用近似于粉煤灰，但研究资料较少。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '矿渣'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_120',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '通过试验研究证明，掺用25%~35%的Ⅰ、Ⅱ级粉煤灰，有显著抑制碱活性骨料膨胀破坏的作用。粉煤灰抑制ASR的机制：粉煤灰对碱-硅反应的作用是（）作用。',
      options: [
        { key: 'A', content: '物理' },
        { key: 'B', content: '化学' },
        { key: 'C', content: '化学和表面物理化学' },
        { key: 'D', content: '机械' }
      ],
      answer: 'C',
      analysis: '粉煤灰抑制ASR的机制：粉煤灰对碱-硅反应的作用是化学和表面物理化学作用。在适当的条件下，化学作用可以使碱-硅反应得到有效抑制，而表面物理化学作用只能使碱-硅反应得到延缓。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '碱骨料反应', '粉煤灰', '机制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_121',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: 'JISA 6204-87规定，无论混凝土是否含有活性骨料，化学外加剂带入混凝土的碱不得超过（）kg/m³。',
      options: [
        { key: 'A', content: '0.1' },
        { key: 'B', content: '0.2' },
        { key: 'C', content: '0.3' },
        { key: 'D', content: '0.5' }
      ],
      answer: 'C',
      analysis: 'JISA 6204-87规定，无论混凝土是否含有活性骨料，化学外加剂带入混凝土的碱不得超过0.3kg/m³。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '碱骨料反应', '外加剂', '碱含量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_122',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '国内外研究证明，有活性骨料的混凝土，混凝土中的总碱量不得超过（）kg/m³。',
      options: [
        { key: 'A', content: '2.0' },
        { key: 'B', content: '2.5' },
        { key: 'C', content: '3.0' },
        { key: 'D', content: '3.5' }
      ],
      answer: 'C',
      analysis: '国内外研究证明，有活性骨料的混凝土，混凝土中的总碱量不得超过3.0kg/m³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '总碱量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_123',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '对硅质骨料碱活性检测方法主要参数的研究结果表明，反应温度对砂浆膨胀率有较大影响，以（）℃为试验温度，可以使测试结果更迅速，同时又与国际标准一致。',
      options: [
        { key: 'A', content: '60' },
        { key: 'B', content: '70' },
        { key: 'C', content: '80' },
        { key: 'D', content: '90' }
      ],
      answer: 'C',
      analysis: '对硅质骨料碱活性检测方法主要参数的研究结果表明，反应温度对砂浆膨胀率有较大影响，以80℃为试验温度，可以使测试结果更迅速，同时又与国际（如美国的ASTMC-1260）现有标准一致。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '试验温度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_124',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '浸泡碱溶液的浓度和种类与砂浆膨胀率存在相关性，规程用（）mol/L NaOH是适宜的。',
      options: [
        { key: 'A', content: '0.5' },
        { key: 'B', content: '1' },
        { key: 'C', content: '1.5' },
        { key: 'D', content: '2' }
      ],
      answer: 'B',
      analysis: '浸泡碱溶液的浓度和种类与砂浆膨胀率存在相关性，规程用1mol/L NaOH是适宜的。在试验龄期内，低碱水泥在碱溶液中不膨胀，而高碱水泥有较明显膨胀。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '碱溶液浓度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_125',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '砂浆试件尺寸应采用（）cm为准。',
      options: [
        { key: 'A', content: '2cm×2cm×8cm' },
        { key: 'B', content: '4cm×4cm×16cm' },
        { key: 'C', content: '10cm×10cm×40cm' },
        { key: 'D', content: '15cm×15cm×50cm' }
      ],
      answer: 'B',
      analysis: '试件尺寸对试样膨胀的基本规律影响很少，但对试样膨胀值有影响，如2cm×2cm×8cm试样膨胀率比4cm×4cm×16cm试样高，但后者膨胀率试验数据准确性更高，故砂浆试件尺寸应采用4cm×4cm×16cm为准。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '试件尺寸'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_126',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '骨料碱活性砂浆长度法检验结果评定：对于砂、石料，当砂浆半年膨胀率超过（）%，或3个月膨胀率超过0.05%时，即评为具有危害性的活性骨料。',
      options: [
        { key: 'A', content: '0.05' },
        { key: 'B', content: '0.1' },
        { key: 'C', content: '0.15' },
        { key: 'D', content: '0.2' }
      ],
      answer: 'B',
      analysis: '结果评定应符合下述要求：对于砂、石料，当砂浆半年膨胀率超过0.1%，或3个月膨胀率超过0.05%时（只有缺少半年膨胀率资料时才有效），即评为具有危害性的活性骨料。反之如低于上述数值，则评为非活性骨料。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '碱骨料反应', '砂浆长度法', '评定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_127',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '碳酸盐骨料的碱活性检验结果评定，试件经84d浸泡后膨胀率在（）%以上时，该岩石评为具有潜在碱活性危害，不宜作混凝土骨料。',
      options: [
        { key: 'A', content: '0.05' },
        { key: 'B', content: '0.1' },
        { key: 'C', content: '0.15' },
        { key: 'D', content: '0.2' }
      ],
      answer: 'B',
      analysis: '结果评定，试件经84d浸泡后膨胀率在0.1%以上时，该岩石评为具有潜在碱活性危害，不宜作混凝土骨料，必要时应以混凝土试验结果做出最后评定。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '碱骨料反应', '碳酸盐骨料', '评定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_128',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '骨料碱活性砂浆棒快速法检验结果评定，砂浆试件14d的膨胀率小于（）%，则骨料为非活性骨料。',
      options: [
        { key: 'A', content: '0.05' },
        { key: 'B', content: '0.1' },
        { key: 'C', content: '0.15' },
        { key: 'D', content: '0.2' }
      ],
      answer: 'B',
      analysis: '结果评定，砂浆试件14d的膨胀率小于0.1%，则骨料为非活性骨料；砂浆试件14d的膨胀率大于0.2%时，则骨料为具有潜在危害性反应的活性骨料。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '砂浆棒快速法', '评定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_129',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '骨料碱活性混凝土棱柱体试验方法主要条件规定：硅酸盐水泥；水泥含碱量为（）%（以Na₂O+0.658K₂O计）。',
      options: [
        { key: 'A', content: '0.6±0.1' },
        { key: 'B', content: '0.8±0.1' },
        { key: 'C', content: '0.9±0.1' },
        { key: 'D', content: '1.0±0.1' }
      ],
      answer: 'C',
      analysis: '主要条件规定：硅酸盐水泥；水泥含碱量为（0.9±0.1）%（以Na₂O+0.658K₂O计）；通过外加10%NaOH溶液使试验水泥含碱量达到1.25%；水泥用量为（420±10）kg/m³；水灰比为0.42~0.45；石与砂的质量比为6:4。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '碱骨料反应', '混凝土棱柱体', '试验条件'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_130',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '骨料碱活性混凝土棱柱体试验结果判定，当试件一年的膨胀率不小于（）%时，则判定为具有潜在危害性反应的活性骨料。',
      options: [
        { key: 'A', content: '0.02' },
        { key: 'B', content: '0.04' },
        { key: 'C', content: '0.06' },
        { key: 'D', content: '0.08' }
      ],
      answer: 'B',
      analysis: '试验结果判定，当平均膨胀率小于0.02%时，同一组试件中单个试件的膨胀率的差值（最高值与最低值之差）不应超过0.008%；当平均膨胀率大于0.02%时，同一组试件中单个试件的膨胀率的差值不应超过平均值的40%；当试件一年的膨胀率不小于0.04%时，则判定为具有潜在危害性反应的活性骨料；膨胀率小于0.04%时，判定为非活性骨料。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '碱骨料反应', '混凝土棱柱体', '判定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_131',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '抑制骨料碱活性效能试验标准试件用高碱硅酸盐水泥，碱含量为（）%（以Na₂O计）或通过外加10%NaOH溶液使水泥含碱量达到1.0%。',
      options: [
        { key: 'A', content: '0.8' },
        { key: 'B', content: '1.0' },
        { key: 'C', content: '1.2' },
        { key: 'D', content: '1.5' }
      ],
      answer: 'B',
      analysis: '主要规定：标准试件用高碱硅酸盐水泥，碱含量为1.0%（以Na₂O计）或通过外加10%NaOH溶液使水泥含碱量达到1.0%；判别外加剂的抑制作用，对比试件所用水泥相同，如判别掺合料效能时用25%或30%掺合料代替标准试件所用水泥。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '碱骨料反应', '抑制效能试验'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'concrete_132',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '混凝土工程发生碱-骨料反应破坏必须具有三个条件（）',
      options: [
        { key: 'A', content: '配制混凝土时由水泥、骨料、外加剂和拌和用水带进混凝土中一定数量的碱，或者混凝土处于碱浸入的环境中' },
        { key: 'B', content: '一定数量的碱活性骨料存在' },
        { key: 'C', content: '潮湿环境，可以供应反应物吸水膨胀时所需的水分' },
        { key: 'D', content: '高温环境' }
      ],
      answer: 'A,B,C',
      analysis: '混凝土工程发生碱-骨料反应破坏必须具有三个条件：一是配制混凝土时由水泥、骨料、外加剂和拌和用水带进混凝土中一定数量的碱，或者混凝土处于碱浸入的环境中；二是一定数量的碱活性骨料存在；三是潮湿环境，可以供应反应物吸水膨胀时所需的水分。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '条件'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_133',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '碱-骨料反应破坏最重要的现场特征包括（）',
      options: [
        { key: 'A', content: '混凝土表面开裂，裂纹呈网状（龟背纹）' },
        { key: 'B', content: '起因是混凝土表面下的反应骨料颗粒周围的凝胶或骨料内部产物的吸水膨胀' },
        { key: 'C', content: '当其他骨料颗粒发生反应时，产生更多的裂纹，最终这些裂纹相互连接，形成网状' },
        { key: 'D', content: '碱-骨料反应破坏是由膨胀引起的，可使结构工程发生整体变形、移位、弯曲、扭翘等现象' }
      ],
      answer: 'A,B,C,D',
      analysis: '碱-骨料反应破坏最重要的现场特征之一是混凝土表面开裂，裂纹呈网状（龟背纹），起因是混凝土表面下的反应骨料颗粒周围的凝胶或骨料内部产物的吸水膨胀。当其他骨料颗粒发生反应时，产生更多的裂纹，最终这些裂纹相互连接，形成网状。碱-骨料反应破坏是由膨胀引起的，可使结构工程发生整体变形、移位、弯曲、扭翘等现象。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '现场特征'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_134',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '碱-硅酸反应生成的碱-硅酸凝胶的特征包括（）',
      options: [
        { key: 'A', content: '新鲜的凝胶呈透明或呈浅黄色，外观类似于树脂' },
        { key: 'B', content: '脱水后，凝胶变成白色，凝胶流经裂缝，孔隙的过程中吸收钙、铝、硫等化合物也可变为茶褐色以至黑色' },
        { key: 'C', content: '流出的凝胶多有较湿润的光泽，长时间干燥后会变为无定形粉状物' },
        { key: 'D', content: '借助放大镜，可与颗粒状的结晶盐析物区别开来' }
      ],
      answer: 'A,B,C,D',
      analysis: '碱-硅酸反应生成的碱-硅酸凝胶有时会从裂缝中流到混凝土的表面，新鲜的凝胶呈透明或呈浅黄色，外观类似于树脂。脱水后，凝胶变成白色，凝胶流经裂缝，孔隙的过程中吸收钙、铝、硫等化合物也可变为茶褐色以至黑色，流出的凝胶多有较湿润的光泽，长时间干燥后会变为无定形粉状物，借助放大镜，可与颗粒状的结晶盐析物区别开来。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '碱骨料反应', '凝胶特征'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_135',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '骨料碱活性检验方法根据美国ASTMG-1260-94规定，结合我国碱活性试验研究结果，水利水电行业制定了《水工混凝土试验规程》（SL 352—2006），骨料碱活性检验方法包括（）',
      options: [
        { key: 'A', content: '骨料碱活性岩相检验方法' },
        { key: 'B', content: '骨料碱活性化学检验法' },
        { key: 'C', content: '骨料碱活性砂浆长度法检验、碳酸盐骨料的碱活性检验' },
        { key: 'D', content: '骨料碱活性砂浆棒快速法检验、骨料碱活性混凝土棱柱体试验方法' }
      ],
      answer: 'A,B,C,D',
      analysis: '骨料碱活性检验方法包括：1)骨料碱活性岩相检验方法；2)骨料碱活性化学检验法；3)骨料碱活性砂浆长度法检验；4)碳酸盐骨料的碱活性检验；5)骨料碱活性砂浆棒快速法检验；6)骨料碱活性混凝土棱柱体试验方法；7)抑制骨料碱活性效能试验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '检验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_136',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '骨料碱活性岩相检验方法用于通过肉眼和显微镜观察，鉴定各种砂、石料的种类和矿物成分，从而检验各种骨料中是否含有活性矿物，例如（）',
      options: [
        { key: 'A', content: '酸性-中性火山玻璃、隐晶-微晶石英、鳞石英' },
        { key: 'B', content: '方石英、应变石英、玉髓、蛋白质' },
        { key: 'C', content: '细粒泥质灰质白云岩或白云质灰�ite、硅质灰岩或硅质白云岩' },
        { key: 'D', content: '喷出岩及火山碎屑岩屑等' }
      ],
      answer: 'A,B,C,D',
      analysis: '骨料碱活性岩相检验方法用于通过肉眼和显微镜观察，鉴定各种砂、石料的种类和矿物成分，从而检验各种骨料中是否含有活性矿物，例如，酸性-中性火山玻璃、隐晶-微晶石英、鳞石英、方石英、应变石英、玉髓、蛋白质、细粒泥质灰质白云岩或白云质灰岩、硅质灰岩或硅质白云岩、喷出岩及火山碎屑岩屑等。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '碱骨料反应', '岩相检验', '活性矿物'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_137',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '粗骨料品质检验的试验方法包括（）',
      options: [
        { key: 'A', content: '石料颗粒级配试验' },
        { key: 'B', content: '石料表观密度及吸水率试验' },
        { key: 'C', content: '石料堆积密度及空隙率试验' },
        { key: 'D', content: '石料含泥量试验、石料泥块含量试验' }
      ],
      answer: 'A,B,C,D',
      analysis: '粗骨料品质检验的试验方法包括：(一)石料颗粒级配试验；(二)石料表观密度及吸水率试验；(三)石料堆积密度及空隙率试验；(四)石料含泥量试验；(五)石料泥块含量试验等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '粗骨料', '试验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_138',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '抑制碱活性骨料的技术措施包括（）',
      options: [
        { key: 'A', content: '应采用低碱水泥' },
        { key: 'B', content: '掺用低碱粉煤灰' },
        { key: 'C', content: '掺用酸性矿渣' },
        { key: 'D', content: '掺用低碱外加剂' }
      ],
      answer: 'A,B,C,D',
      analysis: '抑制碱活性骨料破坏的技术措施，经国内外各方试验研究结果证明，有碱活性骨料存在时，应采取以下措施：(1)应采用低碱水泥；(2)掺用低碱粉煤灰；(3)掺用酸性矿渣较优；(4)掺用低碱外加剂。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '抑制措施'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_139',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '有的试验研究证明，采用硫铝酸盐水泥在试验期内能有效地抑制（）',
      options: [
        { key: 'A', content: '高活性石英玻璃的碱-硅酸盐反应' },
        { key: 'B', content: '高活性白云质灰岩的碱-碳酸盐反应膨胀' },
        { key: 'C', content: '碱-白云石反应的膨胀' },
        { key: 'D', content: '碱-硅酸反应' }
      ],
      answer: 'A,B',
      analysis: '有的试验研究证明，采用硫铝酸盐水泥在试验期内能有效地抑制高活性石英玻璃的碱-硅酸盐反应及高活性白云质灰岩的碱-碳酸盐反应膨胀。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '碱骨料反应', '硫铝酸盐水泥'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'concrete_140',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '碱-骨料反应（AAR）是造成混凝土结构破坏失效的重要原因之一，受碱-骨料反应影响的混凝土需要数年或一二十年的时间才会出现开裂破坏。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。碱-骨料反应（AAR）类型可分为碱硅酸盐反应（ASR）和碱碳酸盐反应（ACR），AAR是造成混凝土结构破坏失效的重要原因之一。受碱-骨料反应影响的混凝土需要数年或一二十年的时间才会出现开裂破坏。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '碱骨料反应', 'AAR'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_141',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '低碱水泥的含碱量应≤1.0%，f-CaO含量≤1.0%，MgO含量≤5.0%（最好控制在2.5%以下），SO₃含量≤3.5%。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。应采用低碱水泥。水泥含碱量应≤1.0%，f-CaO含量≤1.0%，MgO含量≤5.0%（最好控制在2.5%以下），SO₃含量≤3.5%，水泥品种为硅酸盐水泥，宜采用回旋窑生产的水泥。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '低碱水泥'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_142',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '粉煤灰对碱-硅反应的作用是纯物理作用，只能使碱-硅反应得到延缓，不能有效抑制。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。粉煤灰抑制ASR的机制：粉煤灰对碱-硅反应的作用是化学和表面物理化学作用。在适当的条件下，化学作用可以使碱-硅反应得到有效抑制，而表面物理化学作用只能使碱-硅反应得到延缓。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '粉煤灰', '机制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_143',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '通过试验研究证明，掺用25%~35%的Ⅰ、Ⅱ级粉煤灰，有显著抑制碱活性骨料膨胀破坏的作用。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。通过试验研究证明，掺用25%~35%的Ⅰ、Ⅱ级粉煤灰，有显著抑制碱活性骨料膨胀破坏的作用。ASTMC618限定的用于抑制ASR的粉煤灰含碱量必须小于1.5%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '粉煤灰'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_144',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '国内外研究证明，有活性骨料的混凝土，混凝土中的总碱量不得超过5.0kg/m³。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。国内外研究证明，有活性骨料的混凝土，混凝土中的总碱量不得超过3.0kg/m³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '总碱量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_145',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '粗骨料在混凝土中起着骨架作用，骨料的强度和压碎指标直接影响混凝土的强度和变形性能。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。粗骨料在混凝土中起着骨架作用，骨料的强度和压碎指标直接影响混凝土的强度和变形性能。低于C30混凝土应大于1.5倍设计强度，高于C30混凝土应大于2.0倍设计强度。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '粗骨料', '强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_146',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '碎石或卵石的压碎指标，是指粒径为20~40mm的颗粒，在标准荷载作用下压碎颗粒含量的百分率。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。碎石或卵石的压碎指标，是指粒径为10~20mm的颗粒，在标准荷载作用下压碎颗粒含量的百分率。该部分细粒属于软弱颗粒，如风化的卵石、砂岩及泥岩等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '粗骨料', '压碎指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_147',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '用来加工碎石的岩石混抗压强度，火成岩强度不宜低于80MPa，变质岩不宜低于60MPa，水成岩不宜低于30MPa。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。用来加工碎石的岩石混抗压强度，或者火成岩强度不宜低于80MPa，变质岩不宜低于60MPa，水成岩不宜低于30MPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '粗骨料', '岩石强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_148',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '对硅质骨料碱活性检测方法主要参数的研究结果表明，以80℃为试验温度，可以使测试结果更迅速，同时又与国际标准一致。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。对硅质骨料碱活性检测方法主要参数的研究结果表明，反应温度对砂浆膨胀率有较大影响，以80℃为试验温度，可以使测试结果更迅速，同时又与国际（如美国的ASTMC-1260）现有标准一致。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '试验温度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_149',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '骨料碱活性砂浆棒快速法检验结果评定，砂浆试件14d的膨胀率大于0.2%时，则骨料为具有潜在危害性反应的活性骨料。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。结果评定，砂浆试件14d的膨胀率小于0.1%，则骨料为非活性骨料；砂浆试件14d的膨胀率大于0.2%时，则骨料为具有潜在危害性反应的活性骨料。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '砂浆棒快速法', '评定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_150',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '砂浆试件尺寸应采用2cm×2cm×8cm为准，因为该尺寸试样膨胀率比4cm×4cm×16cm试样高。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。试件尺寸对试样膨胀的基本规律影响很少，但对试样膨胀值有影响，如2cm×2cm×8cm试样膨胀率比4cm×4cm×16cm试样高，但后者膨胀率试验数据准确性更高，故砂浆试件尺寸应采用4cm×4cm×16cm为准。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '碱骨料反应', '试件尺寸'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_151',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: 'JISA 6204-87规定，无论混凝土是否含有活性骨料，化学外加剂带入混凝土的碱不得超过0.3kg/m³。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。JISA 6204-87规定，无论混凝土是否含有活性骨料，化学外加剂带入混凝土的碱不得超过0.3kg/m³。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '碱骨料反应', '外加剂', '碱含量'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
