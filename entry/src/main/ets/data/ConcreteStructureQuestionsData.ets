/**
 * 混凝土工程题目数据 - 第三章 混凝土性能（结构、拌和水、石料试验）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：混凝土工程（第3版）第三章 混凝土性能
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取混凝土工程结构与拌和水题目
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getConcreteStructureQuestions(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'concrete_152',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土中的水泥石由水化硅酸钙、硫铝酸钙、氢氧化钙和未水化的水泥颗粒组成。其中水化硅酸钙采用（）表示。',
      options: [
        { key: 'A', content: 'CH' },
        { key: 'B', content: 'C-S-H' },
        { key: 'C', content: 'AFt' },
        { key: 'D', content: 'AFm' }
      ],
      answer: 'B',
      analysis: '混凝土中的水泥石由水化硅酸钙、硫铝酸钙、氢氧化钙和未水化的水泥颗粒组成。其中水化硅酸钙是CS、C₂S、C₃S与水反应生成的，为凝胶态，采用C-S-H表示，符号C表示CaO，S表示SiO₂，H表示H₂O。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥石', 'C-S-H'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_153',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: 'C-S-H具有四种形貌，其中纤维状粒子（Ⅰ型），由水泥向外辐射出去的细长条形，长0.5~2μm，宽小于（）μm。',
      options: [
        { key: 'A', content: '0.08' },
        { key: 'B', content: '0.12' },
        { key: 'C', content: '0.15' },
        { key: 'D', content: '0.20' }
      ],
      answer: 'B',
      analysis: 'C-S-H具有四种形貌：①纤维状粒子（Ⅰ型），由水泥向外辐射出去的细长条形，长0.5~2μm，宽小于0.12μm；②网络形粒子（Ⅱ型），由一些小的粒子咬合而成；③等大粒子（Ⅲ型），通常不大于0.3μm；④内部产物（Ⅳ型），存在于原水泥粒子周界的内部。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', 'C-S-H', '形貌'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_154',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: 'CH的形貌：初期呈薄的六面板形，宽约几十微米，然后随着水泥水化进程增厚，失去六角形轮廓。钙矾石的形貌：长（）μm，细棒状。',
      options: [
        { key: 'A', content: '2~3' },
        { key: 'B', content: '4~5' },
        { key: 'C', content: '6~8' },
        { key: 'D', content: '10~15' }
      ],
      answer: 'B',
      analysis: 'CH的形貌：初期呈薄的六面板形，宽约几十微米，然后随着水泥水化进程增厚，失去六角形轮廓，并侵入含有C-S-H凝胶以及其他组分的区域。钙矾石的形貌：长4~5μm，细棒状。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', 'CH', '钙矾石'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_155',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '凝胶孔存在于C-S-H凝胶内，是C-S-H凝胶中的层间孔，其孔径为0.5~2.5nm，在固体C-S-H中孔隙率约为（）%。',
      options: [
        { key: 'A', content: '18' },
        { key: 'B', content: '28' },
        { key: 'C', content: '38' },
        { key: 'D', content: '48' }
      ],
      answer: 'B',
      analysis: '凝胶孔存在于C-S-H凝胶内，是C-S-H凝胶中的层间孔，其孔径为0.5~2.5nm，在固体C-S-H中孔隙率约为28%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '凝胶孔', '孔隙率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_156',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土内含气量是影响强度的重要因素，一般每增加1%的含气量，抗压强度降低（）%。',
      options: [
        { key: 'A', content: '1%~2%' },
        { key: 'B', content: '3%~5%' },
        { key: 'C', content: '5%~8%' },
        { key: 'D', content: '8%~10%' }
      ],
      answer: 'B',
      analysis: '混凝土内含气量是影响强度的重要因素，一般每增加1%的含气量，抗压强度降低3%~5%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '含气量', '强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_157',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水泥砂浆与骨料结合的强度是混凝土本体水泥砂浆强度的（）。',
      options: [
        { key: 'A', content: '1/5~1/4' },
        { key: 'B', content: '1/3~1/2' },
        { key: 'C', content: '2/3~3/4' },
        { key: 'D', content: '4/5~1' }
      ],
      answer: 'B',
      analysis: '由于析水作用，骨料周边存在一薄层（几微米）水膜，水泥水化过程中，CH最先溶入水膜中并持续长大，形成疏松的网状结构。该结构强度低，且骨料附近薄层水泥砂浆的水灰比也比混凝土本体的大，故水泥砂浆与骨料结合的强度是混凝土本体水泥砂浆强度的1/3~1/2。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '界面', '结合强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_158',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水工混凝土拌和、养护用水的pH值，钢筋混凝土应（）。',
      options: [
        { key: 'A', content: '≥3.5' },
        { key: 'B', content: '≥4.0' },
        { key: 'C', content: '≥4.5' },
        { key: 'D', content: '≥5.0' }
      ],
      answer: 'C',
      analysis: '根据表2-36水工混凝土拌和、养护用水品质指标，钢筋混凝土和素混凝土的pH值均应≥4.5。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '拌和水', 'pH值'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_159',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水工混凝土拌和、养护用水中，钢筋混凝土的不溶物含量应（）mg/L。',
      options: [
        { key: 'A', content: '≤1000' },
        { key: 'B', content: '≤2000' },
        { key: 'C', content: '≤3000' },
        { key: 'D', content: '≤5000' }
      ],
      answer: 'B',
      analysis: '根据表2-36水工混凝土拌和、养护用水品质指标，钢筋混凝土的不溶物含量应≤2000mg/L，素混凝土应≤5000mg/L。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '拌和水', '不溶物'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_160',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水工混凝土拌和、养护用水中，钢筋混凝土的氯化物（以Cl⁻计）含量应（）mg/L。',
      options: [
        { key: 'A', content: '≤1000' },
        { key: 'B', content: '≤1200' },
        { key: 'C', content: '≤2500' },
        { key: 'D', content: '≤3500' }
      ],
      answer: 'B',
      analysis: '根据表2-36水工混凝土拌和、养护用水品质指标，钢筋混凝土的氯化物（以Cl⁻计）含量应≤1200mg/L，素混凝土应≤3500mg/L。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '拌和水', '氯化物'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_161',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水工混凝土拌和、养护用水中，硫酸盐（以SO₄²⁻计）含量，钢筋混凝土和素混凝土均应（）mg/L。',
      options: [
        { key: 'A', content: '≤1500' },
        { key: 'B', content: '≤2000' },
        { key: 'C', content: '≤2700' },
        { key: 'D', content: '≤3500' }
      ],
      answer: 'C',
      analysis: '根据表2-36水工混凝土拌和、养护用水品质指标，钢筋混凝土和素混凝土的硫酸盐（以SO₄²⁻计）含量均应≤2700mg/L。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '拌和水', '硫酸盐'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_162',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水工混凝土拌和、养护用水中，碱含量（mg/L），钢筋混凝土和素混凝土均应（）。',
      options: [
        { key: 'A', content: '≤1000' },
        { key: 'B', content: '≤1500' },
        { key: 'C', content: '≤2000' },
        { key: 'D', content: '≤2500' }
      ],
      answer: 'B',
      analysis: '根据表2-36水工混凝土拌和、养护用水品质指标，钢筋混凝土和素混凝土的碱含量均应≤1500mg/L。注：碱含量按Na₂O+0.658K₂O计算值来表示。采用非碱活性骨料时，可不检验碱含量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '拌和水', '碱含量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_163',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '拌和水中含有一定浓度的氢离子与水泥的水化物进行化学反应，生成可溶性的氯化钙、氯化铝、氯化铁等，可使混凝土强度下降（）%。',
      options: [
        { key: 'A', content: '5%~10%' },
        { key: 'B', content: '10%~80%' },
        { key: 'C', content: '20%~50%' },
        { key: 'D', content: '30%~60%' }
      ],
      answer: 'B',
      analysis: '若拌和水是不含或极少含有钙离子的软水，会破坏水泥混凝土中水化物生存的条件，影响混凝土强度的增长。拌和水中含有一定浓度的氢离子与水泥的水化物进行化学反应，生成可溶性的氯化钙、氯化铝、氯化铁等，可使混凝土强度下降10%~80%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '拌和水', '强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_164',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土拌和、养护用水与标准饮用水试验所得的水泥初凝时间差及终凝时间差均不得大于（）min。',
      options: [
        { key: 'A', content: '15' },
        { key: 'B', content: '30' },
        { key: 'C', content: '45' },
        { key: 'D', content: '60' }
      ],
      answer: 'B',
      analysis: '水的品质检验项目和指标应符合以下要求：(1)混凝土拌和、养护用水与标准饮用水试验所得的水泥初凝时间差及终凝时间差均不得大于30min，且初凝时间和终凝时间应符合GB 175—2007的规定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '拌和水', '凝结时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_165',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '用拌和、养护用水配制的水泥胶砂3d和28d龄期抗压强度不得低于用标准饮用水配制的水泥胶砂3d和28d龄期抗压强度的（）%。',
      options: [
        { key: 'A', content: '80' },
        { key: 'B', content: '85' },
        { key: 'C', content: '90' },
        { key: 'D', content: '95' }
      ],
      answer: 'C',
      analysis: '水的品质检验项目和指标应符合以下要求：(2)用拌和、养护用水配制的水泥胶砂3d和28d龄期抗压强度不得低于用标准饮用水配制的水泥胶砂3d和28d龄期抗压强度的90%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '拌和水', '强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_166',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水的氢离子含量测定有硝酸高汞法和摩尔法两种。硝酸高汞法适用于氢离子含量小于（）mg/L的水样。',
      options: [
        { key: 'A', content: '30' },
        { key: 'B', content: '50' },
        { key: 'C', content: '100' },
        { key: 'D', content: '200' }
      ],
      answer: 'B',
      analysis: '水的氢离子含量测定有硝酸高汞法和摩尔法两种。硝酸高汞法适用于氢离子含量小于50mg/L的水样，摩尔法适用于氢离子含量10~500mg/L的水样。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '水质分析', '氢离子'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_167',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水的硫酸根离子含量测定有EDTA容量法和称量法两种。EDTA容量法适用于硫酸根离子浓度为（）mg/L的水样。',
      options: [
        { key: 'A', content: '5~100' },
        { key: 'B', content: '10~200' },
        { key: 'C', content: '50~500' },
        { key: 'D', content: '100~1000' }
      ],
      answer: 'B',
      analysis: '水的硫酸根离子含量测定有EDTA容量法和称量法两种。EDTA容量法适用于硫酸根离子浓度为10~200mg/L的水样，而称量法适用于硫酸根离子浓度较高的水样。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '水质分析', '硫酸根'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_168',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '石料含泥量试验用于测定石料中粒径小于（）mm的黏土、淤泥及细屑的总含量，评定石料品质。',
      options: [
        { key: 'A', content: '0.05' },
        { key: 'B', content: '0.08' },
        { key: 'C', content: '0.10' },
        { key: 'D', content: '0.15' }
      ],
      answer: 'B',
      analysis: '石料含泥量试验用于测定石料中粒径小于0.08mm的黏土、淤泥及细屑的总含量，评定石料品质。石料含泥量试验方法见《水工混凝土试验规程》(SL 352—2006)2.23"石料含泥量试验"。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '石料', '含泥量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_169',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '石料堆积密度及空隙率试验适用于粒径（）mm以下的石料。',
      options: [
        { key: 'A', content: '80' },
        { key: 'B', content: '100' },
        { key: 'C', content: '120' },
        { key: 'D', content: '150' }
      ],
      answer: 'D',
      analysis: '石料堆积密度及空隙率试验用于测定石料堆积密度、紧密密度及空隙率，评定石料品质、选择石料级配，适用于粒径150mm以下的石料。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '石料', '堆积密度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_170',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '坍落度适用于流动性较大的常用的塑性混凝土（坍落度3~22cm），不适用于坍落度很小或无坍落度的干硬性混凝土（碾压混凝土），也不适用于特大坍落度（大于（）cm）自流平自密实混凝土。',
      options: [
        { key: 'A', content: '18' },
        { key: 'B', content: '20' },
        { key: 'C', content: '22' },
        { key: 'D', content: '25' }
      ],
      answer: 'C',
      analysis: '坍落度适用于流动性较大的常用的塑性混凝土（坍落度3~22cm），不适用于坍落度很小或无坍落度的干硬性混凝土（碾压混凝土），也不适用于特大坍落度（大于22cm）自流平自密实混凝土。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '坍落度', '工作性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_171',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '气孔一般呈球形，采用引气剂引入的孔径为（）μm。',
      options: [
        { key: 'A', content: '20~100' },
        { key: 'B', content: '50~200' },
        { key: 'C', content: '100~300' },
        { key: 'D', content: '200~500' }
      ],
      answer: 'B',
      analysis: '气孔一般呈球形，采用引气剂引入的孔径为50~200μm，拌和时裹入的孔径可达3mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '气孔', '引气剂'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'concrete_172',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土由固相、气相和液相三相组成，其中（）',
      options: [
        { key: 'A', content: '固相有水泥石、砂石骨料' },
        { key: 'B', content: '气相为混凝土孔隙中存在的空气' },
        { key: 'C', content: '液相则是孔隙中的溶液' },
        { key: 'D', content: '固相只有水泥石' }
      ],
      answer: 'A,B,C',
      analysis: '混凝土由固相、气相和液相三相组成，其中固相有水泥石、砂石骨料，气相为混凝土孔隙中存在的空气，液相则是孔隙中的溶液。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '结构', '三相'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_173',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土的气相存在于由不同孔径连接组成的空间网络形的孔隙中。这些孔一般分为（）',
      options: [
        { key: 'A', content: '凝胶孔' },
        { key: 'B', content: '毛细孔' },
        { key: 'C', content: '气孔' },
        { key: 'D', content: '裂缝' }
      ],
      answer: 'A,B,C',
      analysis: '混凝土的气相存在于由不同孔径连接组成的空间网络形的孔隙中。这些孔一般分为凝胶孔、毛细孔和气孔。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '气相', '孔隙'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_174',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土中的液相是存在于由不同孔径连接组成的空间网络形的孔隙中的水或水溶液。这些溶液一般分为（）',
      options: [
        { key: 'A', content: '化学结合水' },
        { key: 'B', content: '层间水、吸附水' },
        { key: 'C', content: '毛细孔水' },
        { key: 'D', content: '自由水' }
      ],
      answer: 'A,B,C,D',
      analysis: '混凝土中的液相是存在于由不同孔径连接组成的空间网络形的孔隙中的水或水溶液。这些溶液一般分为化学结合水、层间水、吸附水和毛细孔水。毛细孔水存在于孔径大于50nm的毛细孔中，由于孔径比较大，这部分水受到外部力的作用小，可以自由流动，是自由水。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '液相', '水'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_175',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土拌和水品质检验标准有（）',
      options: [
        { key: 'A', content: '《水工混凝土施工规范》（SL 677—2014）' },
        { key: 'B', content: '《水工混凝土水质分析试验规程》（DL/T 5152—2017）' },
        { key: 'C', content: '《水工混凝土施工规范》（DL/T 5144—2015）' },
        { key: 'D', content: '《水工混凝土试验规程》（SL 352—2006）' }
      ],
      answer: 'A,B,C,D',
      analysis: '混凝土拌和水品质检验标准有：(1)《水工混凝土施工规范》（SL 677—2014）；(2)《水工混凝土水质分析试验规程》（DL/T 5152—2017）；(3)《水工混凝土施工规范》（DL/T 5144—2015）；(4)《水工混凝土试验规程》（SL 352—2006）；(5)《水质悬浮物的测定称重法》（GB 11901—89）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '拌和水', '检验标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_176',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水质分析试验方法包括（）',
      options: [
        { key: 'A', content: '水样的采集与保存' },
        { key: 'B', content: 'pH值测定方法' },
        { key: 'C', content: '水的溶解性固形物测定' },
        { key: 'D', content: '水的氢离子含量测定、水的硫酸根离子含量测定' }
      ],
      answer: 'A,B,C,D',
      analysis: '水质分析试验方法包括：(一)水样的采集与保存；(二)pH值测定方法；(三)水的溶解性固形物测定；(四)水的氢离子含量测定；(五)水的硫酸根离子含量测定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水质分析', '试验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_177',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '石料品质检验的试验方法包括（）',
      options: [
        { key: 'A', content: '石料颗粒级配试验、石料表观密度及吸水率试验' },
        { key: 'B', content: '石料堆积密度及空隙率试验、石料振实密度及空隙率试验' },
        { key: 'C', content: '石料含泥量试验、石料泥块含量试验、石料有机质含量试验' },
        { key: 'D', content: '石料针片状颗粒含量试验、石料超逊径颗粒含量试验、石料软弱颗粒含量试验' }
      ],
      answer: 'A,B,C,D',
      analysis: '石料品质检验的试验方法包括：石料颗粒级配试验、石料表观密度及吸水率试验、石料堆积密度及空隙率试验、石料振实密度及空隙率试验、石料含泥量试验、石料泥块含量试验、石料有机质含量试验、石料针片状颗粒含量试验、石料超逊径颗粒含量试验、石料软弱颗粒含量试验、石料压碎指标试验、石料坚固性试验等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '石料', '试验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_178',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '拌和水中含有CO₂对混凝土耐久性的影响包括（）',
      options: [
        { key: 'A', content: '水中含有一定数量的二氧化碳，可使水呈现pH值较低的酸性水' },
        { key: 'B', content: '水中的一部分二氧化碳与混凝土中氢氧化钙反应生成不溶性�ite酸钙，存在于混凝土孔隙中而增加密实性' },
        { key: 'C', content: '另一部分二氧化碳水溶液进一步与碳酸钙反应生成易溶性的碳酸氢钙，使混凝土受到侵蚀' },
        { key: 'D', content: '二氧化碳的碳化作用使混凝土中性化，碱度降低而引起钢筋锈蚀与混凝土开裂剥蚀' }
      ],
      answer: 'A,B,C,D',
      analysis: '由于水中含有一定数量的二氧化碳，可使水呈现pH值较低的酸性水。水中的一部分二氧化碳与混凝土中氢氧化钙反应生成不溶性碳酸钙，存在于混凝土孔隙中而增加密实性；另一部分二氧化碳水溶液进一步与碳酸钙反应生成易溶性的碳酸氢钙，使混凝土受到侵蚀。同时，二氧化碳的碳化作用使混凝土中性化，碱度降低而引起钢筋锈蚀与混凝土开裂剥蚀，钢筋与混凝土握裹力降低，造成建筑物强度和耐久性下降，甚至毁坏。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '拌和水', '二氧化碳', '耐久性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_179',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土拌和物的性能主要有（）',
      options: [
        { key: 'A', content: '工作性' },
        { key: 'B', content: '凝结时间' },
        { key: 'C', content: '含气量' },
        { key: 'D', content: '强度' }
      ],
      answer: 'A,B,C',
      analysis: '混凝土拌和物的性能主要有工作性、凝结时间与含气量三项，而工作性包括流动性、可塑性、稳定性、易密性四种特性。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '拌和物', '性能'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'concrete_180',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土性能包括混凝土拌和物性能与硬化混凝土性能两大部分，而硬化混凝土性能包括力学性能、变形性能、热学性能与耐久性能。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。混凝土性能包括混凝土拌和物性能与硬化混凝土性能两大部分，而硬化混凝土性能包括力学性能、变形性能、热学性能与耐久性能。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '性能', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_181',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '硫铝酸钙是C₃A在有硫酸盐条件下与水反应生成的，称为钙矾石，其化学式为C₆AS₃H₃₂，然后转化为单硫型水化硫铝酸钙，化学式为C₄ASH₁₂。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。硫铝酸钙是C₃A在有硫酸盐条件下与水反应生成的，称为钙矾石，其化学式为C₆AS₃H₃₂，然后转化为单硫型水化硫铝酸钙，化学式为C₄ASH₁₂，符号S表示SO₄²⁻，A表示Al₂O₃。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥石', '钙矾石'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_182',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '毛细孔是在水泥石中未被水化产物占据的不规则形状的空间，孔径为10~50nm，早期可达3~5μm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。毛细孔是在水泥石中未被水化产物占据的不规则形状的空间，孔径为10~50nm，早期可达3~5μm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '毛细孔', '孔径'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_183',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '混凝土内水的存在和丧失是影响混凝土体积稳定性的关键因素。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。混凝土内水的存在和丧失是影响混凝土体积稳定性的关键因素。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水', '体积稳定性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_184',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '由于离析，骨料下面往往形成水腔，混凝土硬化过程中，水因毛细作用析出，原来的水腔保留下来形成较大的空腔，该空腔成为具有一定长度和宽度、厚度的四周封闭的宏观孔隙，附着于骨料边界，是裂缝发展的根源之一。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。由于离析，骨料下面往往形成水腔，混凝土硬化过程中，水因毛细作用析出，原来的水腔保留下来形成较大的空腔，该空腔成为具有一定长度和宽度、厚度的四周封闭的宏观孔隙，附着于骨料边界，是裂缝发展的根源之一。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '界面', '空腔'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_185',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '按照水工混凝土对水质的要求，凡符合国家标准的饮用水均可用于拌和、养护混凝土。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。按照水工混凝土对水质的要求，凡符合国家标准的饮用水均可用于拌和、养护混凝土。未经处理的工业污水和生活污水不得用于拌和、养护混凝土。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '拌和水', '水质要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_186',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '地表水、地下水和其他类型水在首次用于拌和、养护混凝土时，须按现行的有关标准，经检验合格后方可使用。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。地表水、地下水和其他类型水在首次用于拌和、养护混凝土时，须按现行的有关标准，经检验合格后方可使用。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '拌和水', '检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_187',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '当拌和水含有羟基羧酸等有机物时，它与水泥中硅酸三钙水化产生的钙离子结合，生成螯形化合物吸附于硅酸三钙表面上，阻碍其水化反应，尤其对低碱低铝酸三钙的中热硅酸盐水泥的缓凝作用更为明显。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。当拌和水含有羟基羧酸等有机物时，它与水泥中硅酸三钙水化产生的钙离子结合，生成螯形化合物吸附于硅酸三钙表面上，阻碍其水化反应，尤其对低碱低铝酸三钙的中热硅酸盐水泥的缓凝作用更为明显。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '拌和水', '有机物', '缓凝'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_188',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '水中的氯离子会引起钢筋锈蚀，这是一种电化学过程。氯离子会引起钢筋表面局部活化而成为阳极，钢筋表面的钝化膜为阴极，这样在混凝土内部形成电场而产生微电池效应。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。水中的氯离子会引起钢筋锈蚀，这是一种电化学过程。氯离子会引起钢筋表面局部活化而成为阳极，钢筋表面的钝化膜为阴极，这样在混凝土内部形成电场而产生微电池效应。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '拌和水', '氯离子', '钢筋锈蚀'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_189',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '如果拌和水含有硫酸盐，它与混凝土中氢氧化钙、铝酸三钙反应生成钙矾石，导致体积膨胀造成内应力，影响混凝土的强度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。如果拌和水含有硫酸盐，它与混凝土中氢氧化钙、铝酸三钙反应生成钙矾石，导致体积膨胀造成内应力，影响混凝土的强度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '拌和水', '硫酸盐', '钙矾石'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_190',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '石料振实密度及空隙率试验用于测定石料的振实密度及空隙率，供选择碾压混凝土石料级配，以及配合比设计中计算砂浆盈余系数用。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。石料振实密度及空隙率试验用于测定石料的振实密度及空隙率，供选择碾压混凝土石料级配，以及配合比设计中计算砂浆盈余系数用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '石料', '振实密度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_191',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土性能',
      content: '石料坚固性试验用于检验石料对硫酸钠饱和溶液结晶膨胀破坏作用的抵抗能力，间接判断石料的坚固性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。石料坚固性试验用于检验石料对硫酸钠饱和溶液结晶膨胀破坏作用的抵抗能力，间接判断石料的坚固性。石料坚固性试验方法见《水工混凝土试验规程》(SL 352—2006)2.31"石料坚固性试验"。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '石料', '坚固性'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
