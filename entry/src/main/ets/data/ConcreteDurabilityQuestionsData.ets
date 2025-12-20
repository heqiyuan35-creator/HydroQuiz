/**
 * 混凝土工程题目数据 - 第三章 混凝土耐久性
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：混凝土工程（第3版）第三章 混凝土性能 - 第六节/第七节
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取混凝土工程耐久性题目
 * 单选题18题(51%)、多选题7题(20%)、判断题10题(29%)
 */
export function getConcreteDurabilityQuestions(timestamp: number): Question[] {
  return [
    // ========== 单选题 18题 ==========
    {
      id: 'concrete_192',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水利行业标准《水工建筑物抗冻设计规范》(SL 211—2006)规定，对严寒、寒冷、温和地区水工混凝土建筑物都有抗冻要求，最高为F300，最低为（）。',
      options: [
        { key: 'A', content: 'F25' },
        { key: 'B', content: 'F50' },
        { key: 'C', content: 'F100' },
        { key: 'D', content: 'F150' }
      ],
      answer: 'B',
      analysis: '水利行业标准《水工建筑物抗冻设计规范》(SL 211—2006)规定，对严寒、寒冷、温和地区水工混凝土建筑物都有抗冻要求，最高为F300，最低为F50。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '耐久性', '抗冻性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_193',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土在低温下冻结时，毛细孔内的水结冰膨胀，膨胀体积达（）%，对毛细孔壁产生巨大的挤压作用。',
      options: [
        { key: 'A', content: '5' },
        { key: 'B', content: '7' },
        { key: 'C', content: '9' },
        { key: 'D', content: '11' }
      ],
      answer: 'C',
      analysis: '混凝土在低温下冻结时，毛细孔内的水结冰膨胀，膨胀体积达9%，对毛细孔壁产生巨大的挤压作用，毛细孔张开，产生塑性变形，孔径变大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗冻性', '冻融破坏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_194',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '基于抗冻原理，有抗冻要求的混凝土必须掺用引气剂，使混凝土含气量达到（）%，保证混凝土有一定抗冻等级。',
      options: [
        { key: 'A', content: '1%~3%' },
        { key: 'B', content: '3%~6%' },
        { key: 'C', content: '5%~8%' },
        { key: 'D', content: '8%~10%' }
      ],
      answer: 'B',
      analysis: '基于以上原理，有抗冻要求的混凝土必须掺用引气剂，使混凝土含气量达到3%~6%，保证混凝土有一定抗冻等级。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗冻性', '引气剂'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_195',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '引气剂引入的气泡直径为（）μm的球形气泡，减少了毛细孔的数量，阻隔了毛细孔相互之间的连通。',
      options: [
        { key: 'A', content: '10~100' },
        { key: 'B', content: '25~500' },
        { key: 'C', content: '50~800' },
        { key: 'D', content: '100~1000' }
      ],
      answer: 'B',
      analysis: '混凝土内部由引气剂引入的大量直径为25~500μm的球形气泡，减少了毛细孔的数量，阻隔了毛细孔相互之间的连通，在冻融作用时起到容纳部分水的蓄水作用，减少了毛细孔内的水分。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗冻性', '引气剂', '气泡'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_196',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土抗渗性用抗渗等级W表示，抗渗等级W4~W15。根据水工混凝土建筑物水头大小、水力坡降及建筑物重要性来确定抗渗等级。混凝土中孔隙占混凝土体积的（）%左右。',
      options: [
        { key: 'A', content: '0.5' },
        { key: 'B', content: '1' },
        { key: 'C', content: '2' },
        { key: 'D', content: '3' }
      ],
      answer: 'B',
      analysis: '由于混凝土不够密实和混凝土拌和物泌水等，混凝土中孔隙占混凝土体积的1%左右，且相互连通，形成空间孔隙网络。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗渗性', '孔隙'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_197',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '当混凝土中CaO损失（）%时，混凝土内部碱性丧失，水泥水化产物分解，混凝土强度几乎降为0，混凝土结构完全破坏。',
      options: [
        { key: 'A', content: '20' },
        { key: 'B', content: '25' },
        { key: 'C', content: '30' },
        { key: 'D', content: '33' }
      ],
      answer: 'D',
      analysis: '渗透水流出混凝土，期间把混凝土内的CaO溶于水后带出，导致水泥石的结构孔隙逐渐增多、增大，使混凝土结构疏松、强度降低、渗漏量加大。当混凝土中CaO损失33%时，混凝土内部碱性丧失，水泥水化产物分解，混凝土强度几乎降为0，混凝土结构完全破坏。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '抗渗性', 'CaO损失'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_198',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '对大中型大坝工程上游防渗外部混凝土水灰比不宜大于（）。',
      options: [
        { key: 'A', content: '0.45' },
        { key: 'B', content: '0.50' },
        { key: 'C', content: '0.55' },
        { key: 'D', content: '0.60' }
      ],
      answer: 'C',
      analysis: '混凝土抗渗性随混凝土水灰比的增大而降低，对大中型大坝工程上游防渗外部混凝土水灰比不宜大于0.55。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗渗性', '水灰比'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_199',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '掺用优质粉煤灰，例如Ⅰ级灰，其需水量比≤（）%，掺Ⅰ级灰可以降低用水量。',
      options: [
        { key: 'A', content: '90' },
        { key: 'B', content: '95' },
        { key: 'C', content: '100' },
        { key: 'D', content: '105' }
      ],
      answer: 'B',
      analysis: '掺用优质粉煤灰，例如Ⅰ级灰，其需水量比≤95%，掺Ⅰ级灰可以降低用水量，相当是固体减水剂，其减水率可达8%左右。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗渗性', '粉煤灰'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_200',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '我国的河流属多泥沙河流，混凝土坝高度已达到300m级，高坝大库已很多，由于水头高，高速水流流速已达（）m/s以上。',
      options: [
        { key: 'A', content: '20' },
        { key: 'B', content: '30' },
        { key: 'C', content: '40' },
        { key: 'D', content: '50' }
      ],
      answer: 'C',
      analysis: '我国的河流属多泥沙河流，混凝土坝高度已达到300m级，高坝大库已很多，由于水头高，高速水流流速已达40m/s以上，高速水流挟带大量泥沙（汛期）和直径达1m以上的石块对泄流建筑物表面造成严重的冲刷磨损破坏。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗冲磨性', '流速'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_201',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '掺用微珠含量高的优质粉煤灰，粉煤灰混凝土抗压强度也可达70~90MPa，其抗冲磨强度也高。铸石骨料混凝土，其C50抗冲磨强度比C50普通混凝土提高（）倍。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '3' },
        { key: 'C', content: '4' },
        { key: 'D', content: '5' }
      ],
      answer: 'B',
      analysis: '铸石骨料混凝土：铸石是一种很好的抗磨材料，但其性脆，将其粉碎后作为骨料拌制成铸石骨料混凝土，其C50抗冲磨强度比C50普通混凝土提高3倍。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗冲磨性', '铸石骨料'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_202',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '发生空蚀的条件之一是高速水流，一般流速>（）m/s。',
      options: [
        { key: 'A', content: '15' },
        { key: 'B', content: '20' },
        { key: 'C', content: '25' },
        { key: 'D', content: '30' }
      ],
      answer: 'C',
      analysis: '发生空蚀的条件：(1)高速水流，一般流速>25m/s；(2)过流表面不平整，或过流表面体型不合理，水流条件不好；(3)设置通气设施；(4)改进泄流运行方式；(5)采用高抗空蚀材料护面，如高强混凝土抗空蚀性较好。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗空蚀性', '流速'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_203',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '盐类结晶侵蚀以Na₂SO₄最为严重，其转化温度为（）℃。',
      options: [
        { key: 'A', content: '25.5' },
        { key: 'B', content: '30.3' },
        { key: 'C', content: '32.3' },
        { key: 'D', content: '35.5' }
      ],
      answer: 'C',
      analysis: '盐类结晶侵蚀以Na₂SO₄最为严重，其转化温度为32.3℃，在32.3℃以上析出无水硫酸钠，在32.3℃以下析出带10个结晶水的硫酸钠（芒硝）。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '化学侵蚀', '盐类结晶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_204',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '硫酸盐侵蚀中，由于硫铝酸三钙晶体体积增大（C₃A转变成钙矾石体积增大（）倍）产生巨大膨胀力，导致混凝土开裂破坏。',
      options: [
        { key: 'A', content: '4' },
        { key: 'B', content: '6' },
        { key: 'C', content: '8' },
        { key: 'D', content: '10' }
      ],
      answer: 'C',
      analysis: '水泥中C₃A水化产物铝酸四钙与硫酸钙反应生成硫铝酸三钙（称钙矾石）。由于硫铝酸三钙晶体体积增大（C₃A转变成钙矾石体积增大8倍）产生巨大膨胀力，导致混凝土开裂破坏。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '化学侵蚀', '硫酸盐'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_205',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '提高混凝土抗碳化性的措施中，尽量降低混凝土水胶比，提高混凝土密实性，减少空隙率，使CO₂很难侵入到混凝土中去。干燥收缩是物理收缩，而碳化收缩是（）收缩。',
      options: [
        { key: 'A', content: '物理' },
        { key: 'B', content: '化学' },
        { key: 'C', content: '热' },
        { key: 'D', content: '自生' }
      ],
      answer: 'B',
      analysis: '一般不进行专门的碳化收缩试验，而混凝土干燥收缩试验结果实际上已包含了碳化收缩的影响。然而，干燥收缩与碳化收缩在本质上是完全不同的，干燥收缩是物理收缩，而碳化收缩是化学收缩。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗碳化性', '收缩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_206',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '钢筋混凝土结构的耐久性就是钢筋混凝土结构及其部件在可能引起材料性能劣化的各种作用下能够长期维持其应有性能的能力。引起钢筋混凝土结构内部钢筋锈蚀的主要原因是，空气中的（）侵入混凝土内部。',
      options: [
        { key: 'A', content: 'O₂' },
        { key: 'B', content: 'CO₂' },
        { key: 'C', content: 'N₂' },
        { key: 'D', content: 'H₂O' }
      ],
      answer: 'B',
      analysis: '研究表明，引起钢筋混凝土结构内部钢筋锈蚀的主要原因是，空气中的CO₂侵入混凝土内部，导致保护层混凝土碳化和氯离子侵入混凝土内部到达钢筋表面并聚集。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '钢筋锈蚀', '碳化'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_207',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '正常的钢筋混凝土内，因周围环境的高碱性，钢筋表面存在一层致密的氧化膜，称为钝化膜，阻隔原电池的连通，钢筋也不锈蚀。该钝化膜厚约（）nm。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '5' },
        { key: 'C', content: '10' },
        { key: 'D', content: '20' }
      ],
      answer: 'A',
      analysis: '在钢筋混凝土内部的钢筋，因其周围环境的高碱性，表面存在一层厚约1nm的致密氧化膜，这层氧化膜保护了内部的钢本体，不至于向内部氧化，称为钝化膜。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '钢筋锈蚀', '钝化膜'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_208',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '在阴极区，钢表面上的电解质溶液中具有足够数量的氧化剂（通常是氧气），可进行如下的得到来自阳极区的电子的还原反应：O₂+2H₂O+4e→（）',
      options: [
        { key: 'A', content: '2OH⁻' },
        { key: 'B', content: '4OH⁻' },
        { key: 'C', content: '2H₂' },
        { key: 'D', content: 'H₂O₂' }
      ],
      answer: 'B',
      analysis: '在阴极区，钢表面上的电解质溶液中具有足够数量的氧化剂（通常是氧气），可进行如下的得到来自阳极区的电子的还原反应：O₂+2H₂O+4e→4OH⁻',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '钢筋锈蚀', '电化学'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_209',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '在阳极区，钢表面处于活化状态，能进行失去电子的氧化反应：Fe-2e→（）',
      options: [
        { key: 'A', content: 'Fe⁺' },
        { key: 'B', content: 'Fe²⁺' },
        { key: 'C', content: 'Fe³⁺' },
        { key: 'D', content: 'FeO' }
      ],
      answer: 'B',
      analysis: '在阳极区，钢表面处于活化状态，能进行失去电子的氧化反应：Fe-2e→Fe²⁺',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '钢筋锈蚀', '电化学'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 7题 ==========
    {
      id: 'concrete_210',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土耐久性主要包括（）',
      options: [
        { key: 'A', content: '抗冻性、抗渗性' },
        { key: 'B', content: '抗冲磨性、抗空蚀性' },
        { key: 'C', content: '抗化学反应侵蚀性' },
        { key: 'D', content: '抗碳化性' }
      ],
      answer: 'A,B,C,D',
      analysis: '混凝土耐久性主要包括抗冻性、抗渗性、抗冲磨性、抗空蚀性、抗化学反应侵蚀性、抗碳化性等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '耐久性', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_211',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '提高混凝土抗冻性的措施包括（）',
      options: [
        { key: 'A', content: '掺加引气剂' },
        { key: 'B', content: '严格限制水灰比' },
        { key: 'C', content: '选用优质骨料' },
        { key: 'D', content: '增加水泥用量' }
      ],
      answer: 'A,B,C',
      analysis: '提高混凝土抗冻性的措施：1.掺加引气剂；2.严格限制水灰比；3.选用优质骨料（含泥量大的骨料会降低混凝土抗冻性，吸水率大的骨料同样会降低混凝土抗冻性）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗冻性', '措施'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_212',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '提高混凝土抗渗性措施包括（）',
      options: [
        { key: 'A', content: '尽量降低混凝土水灰比' },
        { key: 'B', content: '掺用外加剂（减水剂、引气剂）' },
        { key: 'C', content: '掺用优质掺合料' },
        { key: 'D', content: '保证混凝土施工质量' }
      ],
      answer: 'A,B,C,D',
      analysis: '提高混凝土抗渗性措施：1.尽量降低混凝土水灰比；2.掺用外加剂；3.掺用优质掺合料；4.保证混凝土施工质量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗渗性', '措施'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_213',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土的冲磨破坏可分为两种（）',
      options: [
        { key: 'A', content: '悬移质（泥沙）高速水流造成的冲刷磨损破坏' },
        { key: 'B', content: '推移质（块石、卵石）高速水流造成的冲击磨损破坏' },
        { key: 'C', content: '化学侵蚀破坏' },
        { key: 'D', content: '冻融破坏' }
      ],
      answer: 'A,B',
      analysis: '混凝土的冲磨破坏可分为两种：一种是悬移质（泥沙）高速水流造成的冲刷磨损破坏；另一种是推移质（块石、卵石）高速水流造成的冲击磨损破坏。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗冲磨性', '破坏类型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_214',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '提高混凝土抗空蚀性措施包括（）',
      options: [
        { key: 'A', content: '修改过流面体型、改善水流条件，保证水流不出现脱离表面的真空区' },
        { key: 'B', content: '控制和处理过流表面不平整度，并符合有关标准要求' },
        { key: 'C', content: '设置通气设施' },
        { key: 'D', content: '采用高抗空蚀材料护面，如高强混凝土抗空蚀性较好' }
      ],
      answer: 'A,B,C,D',
      analysis: '提高混凝土抗空蚀性措施：(1)修改过流面体型、改善水流条件，保证水流不出现脱离表面的真空区；(2)控制和处理过流表面不平整度，并符合有关标准要求；(3)设置通气设施；(4)改进泄流运行方式；(5)采用高抗空蚀材料护面，如高强混凝土抗空蚀性较好。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗空蚀性', '措施'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_215',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '化学反应侵蚀按其破坏性质可分为四大类（）',
      options: [
        { key: 'A', content: '溶出性侵蚀' },
        { key: 'B', content: '分解性侵蚀' },
        { key: 'C', content: '盐类侵蚀' },
        { key: 'D', content: '有机质侵蚀' }
      ],
      answer: 'A,B,C,D',
      analysis: '化学反应侵蚀按其破坏性质可分为四大类：溶出性侵蚀（渗漏、扩散）、分解性侵蚀（酸性侵蚀、碳酸与氢硫酸侵蚀、镁盐与铵盐侵蚀）、盐类侵蚀（硫酸盐侵蚀、盐类结晶侵蚀、苛性碱侵蚀）、有机质侵蚀（油类侵蚀、生物侵蚀）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '化学侵蚀', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_216',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '钢筋不锈蚀的情况包括（）',
      options: [
        { key: 'A', content: '在干燥环境下存放的钢筋，即钢筋表面周围虽然有丰富的氧气，却没有作为电解质的水分' },
        { key: 'B', content: '钢筋表面涂有油膜时，钢筋表面既无氧气也无水分' },
        { key: 'C', content: '在饱和的钢筋混凝土内的钢筋表面，没有氧气继续向内部补充，氧气不足' },
        { key: 'D', content: '正常的钢筋混凝土内，因周围环境的高碱性，钢筋表面存在一层致密的氧化膜，称为钝化膜' }
      ],
      answer: 'A,B,C,D',
      analysis: '钢筋不锈蚀的情况：(1)在干燥环境下存放的钢筋，即钢筋表面周围虽然有丰富的氧气，却没有作为电解质的水分，因此钢筋不锈蚀；(2)钢筋表面涂有油膜时，钢筋表面既无氧气也无水分，钢筋也不锈蚀；(3)在饱和的钢筋混凝土内的钢筋表面，没有氧气继续向内部补充，氧气不足，无法实现持续的原电池回路的有效通路，钢筋不锈蚀；(4)正常的钢筋混凝土内，因周围环境的高碱性，钢筋表面存在一层致密的氧化膜，称为钝化膜，阻隔原电池的连通，钢筋也不锈蚀。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '钢筋锈蚀', '条件'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 10题 ==========
    {
      id: 'concrete_217',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土的耐久性指在环境的作用下，随着时间的推移，混凝土维持其应用性能的能力。还有另一种说法是，混凝土对风化作用、化学侵蚀、磨耗或任何其他破坏过程的抵抗能力，从而保持其原来的形状、质量和实用性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。混凝土的耐久性指在环境的作用下，随着时间的推移，混凝土维持其应用性能的能力。还有另一种说法是，混凝土对风化作用、化学侵蚀、磨耗或任何其他破坏过程的抵抗能力，从而保持其原来的形状、质量和实用性。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '耐久性', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_218',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '引气剂是具有憎水作用的表面活性物质，它可以明显降低拌和水的表面张力，使混凝土内部产生大量微小、稳定、分布均匀和互不连通的气泡。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。引气剂是具有憎水作用的表面活性物质，它可以明显降低拌和水的表面张力，使混凝土内部产生大量微小、稳定、分布均匀和互不连通的气泡。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗冻性', '引气剂'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_219',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '在混凝土含气量相同条件下，混凝土抗冻等级随水灰比增大而降低，因此混凝土水灰比需根据混凝土抗冻要求严格控制。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在混凝土含气量相同条件下，混凝土抗冻等级随水灰比增大而降低，因此混凝土水灰比需根据混凝土抗冻要求严格控制。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗冻性', '水灰比'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_220',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土抗渗性也是混凝土一项很重要的性能，混凝土设计要求中一般都有抗渗要求。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。混凝土抗渗性也是混凝土一项很重要的性能，混凝土设计要求中一般都有抗渗要求。混凝土抗渗性用抗渗等级W表示，抗渗等级W4~W15。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '抗渗性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_221',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '掺减水剂可明显降低混凝土用水量，改善混凝土拌和物和易性，提高其密实性，减少其内部的孔隙数量和减小孔隙的直径，尤其是减小混凝土泌水形成的毛细孔数量和密集于骨料周边的气孔，从而提高混凝土抗渗性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。掺减水剂可明显降低混凝土用水量，改善混凝土拌和物和易性，提高其密实性，减少其内部的孔隙数量和减小孔隙的直径，尤其是减小混凝土泌水形成的毛细孔数量和密集于骨料周边的气孔，从而提高混凝土抗渗性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗渗性', '减水剂'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_222',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '高速水流挟带砂石，在混凝土表面滑动、滚动和跳动，对混凝土表面产生冲击、淘刷、摩擦切削、冲撞撞击作用，导致混凝土破坏，这就是混凝土的冲磨破坏机制。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。高速水流挟带砂石，在混凝土表面滑动、滚动和跳动，对混凝土表面产生冲击、淘刷、摩擦切削、冲撞撞击作用，导致混凝土破坏，这就是混凝土的冲磨破坏机制。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '抗冲磨性', '机制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_223',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '选用硬质耐磨骨料混凝土，如花岗岩、石英岩、铁矿石等骨料作为抗冲磨混凝土骨料，特别是铁矿石骨料混凝土抗冲磨性最好。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。选用硬质耐磨骨料混凝土，如花岗岩、石英岩、铁矿石等骨料作为抗冲磨混凝土骨料，特别是铁矿石骨料混凝土抗冲磨性最好。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗冲磨性', '骨料'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_224',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水中溶有空气，当高速水流经不平整表面或表面曲面低于水流射流形成的自然曲面时，水流脱离混凝土表面，局部水流形态恶化，形成真空区。在真空作用下，水迅速蒸发，形成水蒸气，水中的空气在低压作用下从水中向外逃逸，气泡在逃逸过程中迅速长大，达到水流表面时在真空区爆炸破裂。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。这就是混凝土空蚀破坏机制。混凝土表面经受不住这样大的爆炸力而破坏。破坏的细屑立即被水流带走，局部形成更加不平整的表面，空蚀作用加剧，短时间可形成大面积的空蚀坑。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '抗空蚀性', '机制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_225',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '化学反应侵蚀物质都是以水为媒介而传入混凝土内部，并通过液相与水泥水化产物产生化学反应的。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。化学反应侵蚀物质都是以水为媒介而传入混凝土内部，并通过液相与水泥水化产物产生化学反应的。化学反应侵蚀速度取决于侵蚀物质的性质、浓度及有害物质的迁移速度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '化学侵蚀', '机制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_226',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '钢表面锈蚀的过程是电化学过程。铁在热力学上是不稳定的，有力图恢复为原来能量较低、更为稳定的氧化物的倾向。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。钢表面锈蚀的过程是电化学过程。铁在热力学上是不稳定的，有力图恢复为原来能量较低、更为稳定的氧化物的倾向。铁在环境作用下，进行这种自发的释放能量的氧化过程就是铁的腐蚀。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '钢筋锈蚀', '电化学'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
