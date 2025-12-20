/**
 * 混凝土工程题目数据 - 第二章 外加剂性能指标与细骨料
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：混凝土工程（第3版）第二章 混凝土原材料 - 外加剂与细骨料
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取混凝土工程外加剂性能指标与细骨料题目
 * 单选题12题(52%)、多选题5题(22%)、判断题6题(26%)
 */
export function getConcreteAdmixtureQuestions2(timestamp: number): Question[] {
  return [
    // ========== 单选题 12题 ==========
    {
      id: 'concrete_089',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '引气剂的减水率要求为（）',
      options: [
        { key: 'A', content: '≥4%' },
        { key: 'B', content: '≥6%' },
        { key: 'C', content: '≥8%' },
        { key: 'D', content: '≥10%' }
      ],
      answer: 'B',
      analysis: '根据表2-31掺外加剂混凝土的性能要求，引气剂的减水率要求为≥6%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '引气剂', '减水率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_090',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '引气剂的含气量要求为（）',
      options: [
        { key: 'A', content: '3.0%~4.5%' },
        { key: 'B', content: '4.5%~5.5%' },
        { key: 'C', content: '5.5%~6.5%' },
        { key: 'D', content: '6.5%~7.5%' }
      ],
      answer: 'B',
      analysis: '根据表2-31，引气剂的含气量要求为4.5%~5.5%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '引气剂', '含气量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_091',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '高效减水剂的减水率要求为（）',
      options: [
        { key: 'A', content: '≥8%' },
        { key: 'B', content: '≥10%' },
        { key: 'C', content: '≥12%' },
        { key: 'D', content: '≥15%' }
      ],
      answer: 'D',
      analysis: '根据表2-31，高效减水剂的减水率要求为≥15%。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '外加剂', '高效减水剂', '减水率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_092',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '普通减水剂的泌水率比要求为（）',
      options: [
        { key: 'A', content: '≤70%' },
        { key: 'B', content: '≤85%' },
        { key: 'C', content: '≤95%' },
        { key: 'D', content: '≤100%' }
      ],
      answer: 'C',
      analysis: '根据表2-31，普通减水剂的泌水率比要求为≤95%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '普通减水剂', '泌水率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_093',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '外加剂匀质性指标中，细度要求0.315筛筛余应小于（）',
      options: [
        { key: 'A', content: '5%' },
        { key: 'B', content: '10%' },
        { key: 'C', content: '15%' },
        { key: 'D', content: '20%' }
      ],
      answer: 'C',
      analysis: '根据表2-32外加剂匀质性指标，细度要求0.315筛筛余应小于15%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '匀质性', '细度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_094',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '外加剂匀质性指标中，水泥净浆流动度应不小于生产厂规定值的（）',
      options: [
        { key: 'A', content: '90%' },
        { key: 'B', content: '95%' },
        { key: 'C', content: '98%' },
        { key: 'D', content: '100%' }
      ],
      answer: 'B',
      analysis: '根据表2-32，水泥净浆流动度应不小于生产厂规定值的95%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '匀质性', '流动度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_095',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '砂的细度模数（FM）是衡量砂子粗细程度的一项重要参数，中砂FM为（）',
      options: [
        { key: 'A', content: '1.5~0.7' },
        { key: 'B', content: '2.2~1.6' },
        { key: 'C', content: '3.0~2.3' },
        { key: 'D', content: '3.7~3.1' }
      ],
      answer: 'C',
      analysis: '砂的细度模数（FM）：粗砂FM为3.7~3.1，中砂FM为3.0~2.3，细砂FM为2.2~1.6，特细砂FM为1.5~0.7。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '细骨料', '砂', '细度模数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_096',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '人工砂的细度模数宜在（），天然砂的细度模数宜在2.2~3.0。',
      options: [
        { key: 'A', content: '1.8~2.4' },
        { key: 'B', content: '2.0~2.6' },
        { key: 'C', content: '2.4~2.8' },
        { key: 'D', content: '2.6~3.2' }
      ],
      answer: 'C',
      analysis: '砂料应质地坚硬、清洁、级配良好：人工砂的细度模数宜在2.4~2.8，天然砂的细度模数宜在2.2~3.0。使用山砂、粗砂、特细砂应经过试验论证。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '细骨料', '人工砂', '细度模数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_097',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '细骨料的含水率应保持稳定，砂的含水率不宜超过（），必要时应采取加速脱水措施。',
      options: [
        { key: 'A', content: '4%' },
        { key: 'B', content: '6%' },
        { key: 'C', content: '8%' },
        { key: 'D', content: '10%' }
      ],
      answer: 'B',
      analysis: '细骨料的含水率应保持稳定，砂的含水率不宜超过6%，必要时应采取加速脱水措施。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '细骨料', '砂', '含水率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_098',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '细骨料品质要求中，天然砂表观密度为（）',
      options: [
        { key: 'A', content: '2300kg/m³' },
        { key: 'B', content: '2400kg/m³' },
        { key: 'C', content: '2500kg/m³' },
        { key: 'D', content: '2600kg/m³' }
      ],
      answer: 'C',
      analysis: '根据表2-33细骨料的品质要求，天然砂和人工砂的表观密度均为2500kg/m³。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '细骨料', '天然砂', '表观密度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_099',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '设计龄期强度等级≥30MPa和有抗冻要求的混凝土，砂的含泥量应（）',
      options: [
        { key: 'A', content: '≤2%' },
        { key: 'B', content: '≤3%' },
        { key: 'C', content: '≤4%' },
        { key: 'D', content: '≤5%' }
      ],
      answer: 'B',
      analysis: '根据表2-33，设计龄期强度等级≥30MPa和有抗冻要求的混凝土，砂的含泥量应≤3%；设计龄期强度等级<30MPa的混凝土，含泥量应≤5%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '细骨料', '砂', '含泥量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_100',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '砂的饱和面干吸水率是评价砂的颗粒致密度和砂的含孔状态的参数。因此规定砂料吸水率应（）',
      options: [
        { key: 'A', content: '<1.5%' },
        { key: 'B', content: '<2.0%' },
        { key: 'C', content: '<2.5%' },
        { key: 'D', content: '<3.0%' }
      ],
      answer: 'C',
      analysis: '砂的吸水率大，骨料的密度小，强度一般较低，会影响骨料界面和水泥石的黏结强度，并降低混凝土的抗冻性、化学稳定性和抗磨性等，因此规定砂料吸水率应<2.5%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '细骨料', '砂', '吸水率'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 5题 ==========
    {
      id: 'concrete_101',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '外加剂检验标准包括（）',
      options: [
        { key: 'A', content: '《混凝土外加剂定义、分类、命名与术语》（GB/T 8075—2017）' },
        { key: 'B', content: '《混凝土外加剂应用技术规范》（GB 50119—2013）' },
        { key: 'C', content: '《水工混凝土外加剂技术规程》（DL/T 5100—2014）' },
        { key: 'D', content: '《混凝土外加剂匀质性试验方法》（GB/T 8077—2012）' }
      ],
      answer: 'A,B,C,D',
      analysis: '外加剂检验标准包括：(1)《混凝土外加剂定义、分类、命名与术语》（GB/T 8075—2017）；(2)《混凝土外加剂应用技术规范》（GB 50119—2013）；(3)《水工混凝土外加剂技术规程》（DL/T 5100—2014）；(4)《混凝土外加剂匀质性试验方法》（GB/T 8077—2012）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '检验标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_102',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水工混凝土常用的外加剂有（）',
      options: [
        { key: 'A', content: '高效减水剂、引气剂、普通减水剂' },
        { key: 'B', content: '早强减水剂、缓凝减水剂' },
        { key: 'C', content: '引气减水剂、缓凝高效减水剂' },
        { key: 'D', content: '缓凝剂和高温缓凝剂' }
      ],
      answer: 'A,B,C,D',
      analysis: '水工混凝土常用的外加剂有高效减水剂、引气剂、普通减水剂、早强减水剂、缓凝减水剂、引气减水剂、缓凝高效减水剂、缓凝剂和高温缓凝剂等。这些外加剂的品质指标见表2-31和表2-32。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '外加剂', '水工混凝土'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_103',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '砂品质检验标准包括（）',
      options: [
        { key: 'A', content: '《水工混凝土试验规程》（SL 352—2006）' },
        { key: 'B', content: '《水工混凝土砂石骨料试验规程》（DL/T 5151—2014）' },
        { key: 'C', content: '《建设用砂》（GB/T 14684—2011）' },
        { key: 'D', content: '《水工混凝土施工规范》（SL 677—2014）' }
      ],
      answer: 'A,B,C,D',
      analysis: '砂品质检验标准包括：(1)《水工混凝土试验规程》（SL 352—2006）；(2)《水工混凝土砂石骨料试验规程》（DL/T 5151—2014）；(3)《建设用砂》（GB/T 14684—2011）；(4)《水工混凝土施工规范》（SL 677—2014）；(5)《水工混凝土施工规范》（DL/T 5144—2015）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '细骨料', '砂', '检验标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_104',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '砂料品质检验的试验方法包括（）',
      options: [
        { key: 'A', content: '砂料颗粒级配试验、砂料表观密度及吸水率试验' },
        { key: 'B', content: '砂料堆积密度及空隙率试验' },
        { key: 'C', content: '砂料黏土、淤泥及细屑含量试验、砂料泥块含量试验' },
        { key: 'D', content: '人工砂石粉含量试验、砂料有机质含量试验' }
      ],
      answer: 'A,B,C,D',
      analysis: '砂料品质检验的试验方法包括：砂料颗粒级配试验、砂料表观密度及吸水率试验、砂料堆积密度及空隙率试验、砂料黏土淤泥及细屑含量试验、砂料泥块含量试验、人工砂石粉含量试验、砂料有机质含量试验、砂料云母含量试验、砂料轻物质含量试验等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '细骨料', '砂', '试验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_105',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '膨胀剂有硫铝酸盐系，如（）等；石灰系的膨胀剂是由生石灰（CaO）和硬脂酸以一定比例磨细而成。',
      options: [
        { key: 'A', content: 'CSA' },
        { key: 'B', content: 'UEA（包括低碱型UEA-A）' },
        { key: 'C', content: 'CEA' },
        { key: 'D', content: 'AEA' }
      ],
      answer: 'A,B,C,D',
      analysis: '膨胀剂有硫铝酸盐系，如CSA、UEA（包括低碱型UEA-A）、CEA、AEA等；石灰系的膨胀剂是由生石灰（CaO）和硬脂酸以一定比例磨细而成；轻烧氧化镁膨胀剂是MgCO₃矿石在较低温度（一般在1000℃左右）煅烧而获得。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '外加剂', '膨胀剂'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 6题 ==========
    {
      id: 'concrete_106',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '混凝土掺引气型外加剂，能降低空气与水的界面张力。其机制为引气剂是由一端带有极性的官能团分子，另一端为具有非极性的分子。具有极性的一端引向水分子的偶极，非极性的一端指向空气，因而大量的空气泡在混凝土搅拌过程时引入混凝土中。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。混凝土掺引气型外加剂，能降低空气与水的界面张力。其机制为引气剂是由一端带有极性的官能团分子，另一端为具有非极性的分子。这些细小的气泡能够均匀、稳定存在于混凝土中，增加了气泡的稳定性。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '外加剂', '引气剂', '机制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_107',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '混凝土中许多微小气泡具有释放存在于孔隙中的自由水结冰产生的膨胀压力和凝胶孔中过冷水流向毛细孔产生的渗透压力，所以引气混凝土具有较高的抗冻性。配制抗冻性高的混凝土，必须掺加引气剂。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。混凝土中许多微小气泡具有释放存在于孔隙中的自由水结冰产生的膨胀压力和凝胶孔中过冷水流向毛细孔产生的渗透压力，所以引气混凝土具有较高的抗冻性。换句话说，配制抗冻性高的混凝土，必须掺加引气剂。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '引气剂', '抗冻性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_108',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '在水工混凝土中，由于浇筑水的蒸发和温度变化，形成不均匀的温度场，产生温度应力而引起混凝土收缩，导致其体积不稳定。在混凝土中掺入膨胀剂可以补偿收缩变形。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在水工混凝土中，由于浇筑水的蒸发和温度变化，形成不均匀的温度场，产生温度应力而引起混凝土收缩，导致其体积不稳定。在混凝土中掺入膨胀剂可以补偿收缩变形。这是因为掺膨胀剂混凝土体积膨胀，在约束情况下能产生一定的预压应力，可抵消温度下降引起的拉应力，提高混凝土的抗裂性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '外加剂', '膨胀剂', '收缩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_109',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '采用粗砂拌制的混凝土和易性较差，拌和物易分离，混凝土泌水性较大。砂子FM在2.4~2.8时，拌制的混凝土和易性良好，混凝土均匀性较好，强度也较高。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。采用粗砂拌制的混凝土和易性较差，拌和物易分离，混凝土泌水性较大。砂子FM在2.4~2.8时，拌制的混凝土和易性良好，混凝土均匀性较好，强度也较高。采用细砂或特细砂配制的混凝土虽然和易性好，但其比表面积大，使用水量及水泥用量增加，混凝土易开裂，因此宜采取低砂率、低陷度及双掺技术措施。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '细骨料', '砂', '细度模数', '和易性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_110',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '砂的坚固性是检验砂在气候、环境变化或其他物理因素作用下抵抗破裂的能力。引起砂料发生大的或永久性体积变化的物理原因，主要是冻结和融化、热变及干湿交替变化、化学结晶膨胀作用变化等。砂的坚固性差，会直接影响混凝土的耐久性与强度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。砂的坚固性是检验砂在气候、环境变化或其他物理因素作用下抵抗破裂的能力。引起砂料发生大的或永久性体积变化的物理原因，主要是冻结和融化、热变及干湿交替变化、化学结晶膨胀作用变化等。砂的坚固性差，会直接影响混凝土的耐久性与强度，特别是质量要求高的混凝土。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '细骨料', '砂', '坚固性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_111',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '砂的表观密度取决于组成的矿物密度和孔隙的多少，多数天然砂的表观密度为2600~2700kg/m³。密度大则说明颗粒坚硬致密，可配制高品质混凝土。表观密度是采用绝对体积法计算每立方米混凝土材料用量的基本数据。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。砂的表观密度取决于组成的矿物密度和孔隙的多少，多数天然砂的表观密度为2600~2700kg/m³。密度大则说明颗粒坚硬致密，可配制高品质混凝土。表观密度是采用绝对体积法计算每立方米混凝土材料用量的基本数据。松散堆积密度及振实密度：砂的松散堆积密度及振实密度越大，所需采用胶凝材料填充的空隙就越少，砂的堆积密度一般为1300~1500kg/m³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '细骨料', '砂', '表观密度'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
