/**
 * 混凝土工程题目数据 - 第二章 水泥
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：混凝土工程（第3版）第二章 混凝土原材料 - 第一节 水泥
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取混凝土工程第二章水泥题目
 * 单选题10题(50%)、多选题4题(20%)、判断题6题(30%)
 */
export function getConcreteCementQuestions(timestamp: number): Question[] {
  return [
    // ========== 单选题 10题 ==========
    {
      id: 'concrete_026',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '硅酸盐水泥熟料中，C₃S的含量一般为（）',
      options: [
        { key: 'A', content: '20%~30%' },
        { key: 'B', content: '40%~55%' },
        { key: 'C', content: '60%~70%' },
        { key: 'D', content: '10%~19%' }
      ],
      answer: 'B',
      analysis: 'C₃S含量40%~55%，它是水泥中产生早期强度的矿物，C₃S含量越高，水泥28d以前的强度也越高。水化速度比C₂S快，28d可以水化70%左右，但比C₃A慢。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '矿物组成', 'C₃S'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_027',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '硅酸盐水泥熟料中，C₂S的含量一般为（），它是四种矿物成分中水化作用速度最慢的一种。',
      options: [
        { key: 'A', content: '40%~55%' },
        { key: 'B', content: '20%~30%' },
        { key: 'C', content: '2.5%~15%' },
        { key: 'D', content: '10%~19%' }
      ],
      answer: 'B',
      analysis: 'C₂S含量20%~30%，它是四种矿物成分中水化作用速度最慢的一种，28d水化只有11%左右，是水泥中产生后期强度的矿物。它对水泥强度发展的影响是：早期强度低，后期强度增长量显著提高，一年后强度还继续增长。它的抗蚀性好，水化热最小。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '矿物组成', 'C₂S'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_028',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '硅酸盐水泥熟料中，C₃A的含量一般为2.5%~15%，它的水化最快，发热量最高。强度发展虽很快但不高，体积收缩大，抗硫酸盐侵蚀性能差，因此有抗蚀性要求时，C₃A+C₄AF含量不超过（）',
      options: [
        { key: 'A', content: '15%' },
        { key: 'B', content: '18%' },
        { key: 'C', content: '22%' },
        { key: 'D', content: '25%' }
      ],
      answer: 'C',
      analysis: 'C₃A含量2.5%~15%，它的水化最快，发热量最高。强度发展虽很快但不高，体积收缩大，抗硫酸盐侵蚀性能差，因此有抗蚀性要求时，C₃A+C₄AF含量不超过22%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '水泥', '矿物组成', 'C₃A'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_029',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水泥中MgO含量多时会使水泥安定性不良，发生（）破坏。',
      options: [
        { key: 'A', content: '收缩性' },
        { key: 'B', content: '膨胀性' },
        { key: 'C', content: '脆性' },
        { key: 'D', content: '腐蚀性' }
      ],
      answer: 'B',
      analysis: 'MgO含量多时会使水泥安定性不良，发生膨胀性破坏。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水泥', '少量成分', 'MgO'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_030',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: 'SO₃主要是煤中的硫及由掺入的石膏带来的。掺量合适时能调节水泥凝结时间，提高水泥性能，但过量时不仅会使水泥快硬，也会使水泥性能变差。因此，规定SO₃含量不得超过（）',
      options: [
        { key: 'A', content: '2.5%' },
        { key: 'B', content: '3.0%' },
        { key: 'C', content: '3.5%' },
        { key: 'D', content: '4.0%' }
      ],
      answer: 'C',
      analysis: 'SO₃主要是煤中的硫及由掺入的石膏带来的。掺量合适时能调节水泥凝结时间，提高水泥性能，但过量时不仅会使水泥快硬，也会使水泥性能变差。因此，规定SO₃含量不得超过3.5%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '少量成分', 'SO₃'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_031',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '游离CaO为有害成分，含量超过（）时，可能使水泥安定性不良。',
      options: [
        { key: 'A', content: '1%' },
        { key: 'B', content: '2%' },
        { key: 'C', content: '3%' },
        { key: 'D', content: '4%' }
      ],
      answer: 'B',
      analysis: '游离CaO为有害成分，含量超过2%时，可能使水泥安定性不良。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '少量成分', 'CaO'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_032',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '硅酸盐水泥的水化过程可分为四个阶段，正确的顺序是（）',
      options: [
        { key: 'A', content: '初始反应期、诱导期、凝结期、硬化期' },
        { key: 'B', content: '诱导期、初始反应期、凝结期、硬化期' },
        { key: 'C', content: '凝结期、诱导期、初始反应期、硬化期' },
        { key: 'D', content: '初始反应期、凝结期、诱导期、硬化期' }
      ],
      answer: 'A',
      analysis: '硅酸盐水泥的水化过程可分为四个阶段：初始反应期、诱导期、凝结期和硬化期。当硅酸盐水泥与水混合时，立即产生一个快速反应，生成过饱和的石灰溶液，然后反应急剧减慢，这是由于在水泥颗粒周围生成了硫铝酸钙微晶膜或胶状膜，接着就是慢反应阶段，称为诱导期。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '水化过程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_033',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水泥石的强度随龄期而发展，一般在（）内较快，以后变慢，因此应加强早期养护。',
      options: [
        { key: 'A', content: '7d' },
        { key: 'B', content: '14d' },
        { key: 'C', content: '28d' },
        { key: 'D', content: '90d' }
      ],
      answer: 'C',
      analysis: '水泥石的强度随龄期而发展，一般在28d内较快，以后变慢，因此应加强早期养护。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水泥', '强度发展'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_034',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '不同熟料矿物的水化热和放热速度大致遵循下列顺序（）',
      options: [
        { key: 'A', content: 'C₃S > C₃A > C₄AF > C₂S' },
        { key: 'B', content: 'C₃A > C₃S > C₄AF > C₂S' },
        { key: 'C', content: 'C₃A > C₃S > C₂S > C₄AF' },
        { key: 'D', content: 'C₃S > C₄AF > C₃A > C₂S' }
      ],
      answer: 'B',
      analysis: '不同熟料矿物的水化热和放热速度大致遵循下列顺序：C₃A > C₃S > C₄AF > C₂S。硅酸盐水泥四种主要组成矿物的相对含量不同，其放热量和放热速度也不相同。C₃A与C₃S含量较多的水泥其放热量大，放热速度也快，对大体积混凝土防止开裂是不利的。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '水泥', '水化热'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_035',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '四种矿物的收缩率中，（）的收缩率最大，它比其他三种熟料矿物的收缩率高3~5倍。',
      options: [
        { key: 'A', content: 'C₃S' },
        { key: 'B', content: 'C₂S' },
        { key: 'C', content: 'C₃A' },
        { key: 'D', content: 'C₄AF' }
      ],
      answer: 'C',
      analysis: '四种矿物对收缩的影响见表2-4，表中C₃A的收缩率最大，它比其他三种熟料矿物的收缩率高3~5倍。C₃S、C₂S和C₄AF三种矿物的收缩率相差不大，因此水工建筑物混凝土应尽量降低C₃A含量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '收缩', 'C₃A'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 4题 ==========
    {
      id: 'concrete_036',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '在高温下煅烧成的水泥熟料含有四种主要矿物，包括（）',
      options: [
        { key: 'A', content: '硅酸三钙（C₃S）' },
        { key: 'B', content: '硅酸二钙（C₂S）' },
        { key: 'C', content: '铝酸三钙（C₃A）' },
        { key: 'D', content: '铁铝酸四钙（C₄AF）' }
      ],
      answer: 'A,B,C,D',
      analysis: '在高温下煅烧成的水泥熟料含有四种主要矿物，即硅酸三钙（3CaO·SiO₂），简称C₃S；硅酸二钙（2CaO·SiO₂），简称C₂S；铝酸三钙（3CaO·Al₂O₃），简称C₃A；铁铝酸四钙（4CaO·Al₂O₃·Fe₂O₃），简称C₄AF。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水泥', '矿物组成'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_037',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水泥中除几种主要成分外，还有以下几种少量成分（）',
      options: [
        { key: 'A', content: 'MgO' },
        { key: 'B', content: 'SO₃' },
        { key: 'C', content: '游离CaO' },
        { key: 'D', content: '碱分（K₂O、Na₂O）' }
      ],
      answer: 'A,B,C,D',
      analysis: '除上述几种主要成分外，水泥中尚有以下几种少量成分：(1)MgO——含量多时会使水泥安定性不良，发生膨胀性破坏；(2)SO₃——主要是煤中的硫及由掺入的石膏带来的；(3)游离CaO——为有害成分，含量超过2%时，可能使水泥安定性不良；(4)碱分（K₂O、Na₂O）——含量多时会与活性骨料作用引起碱骨料反应，使体积膨胀，导致混凝土产生裂缝。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '少量成分'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_038',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水泥凝结硬化过程可以归纳为以下特点（）',
      options: [
        { key: 'A', content: '水泥的水化反应是由颗粒表面逐渐深入到内层复杂的物理化学过程' },
        { key: 'B', content: '硬化的水泥石是由晶体、胶体、未完全水化的水泥颗粒、游离水分及气孔等组成的不均质结构' },
        { key: 'C', content: '水泥石的强度随龄期而发展，一般在28d内较快，以后变慢' },
        { key: 'D', content: '温度越高，凝结硬化速度越快' }
      ],
      answer: 'A,B,C,D',
      analysis: '水泥凝结硬化过程可以归纳为以下四个特点：(1)水泥的水化反应是由颗粒表面逐渐深入到内层复杂的物理化学过程，这种作用起初进行较快，以后逐渐变慢；(2)硬化的水泥石是由晶体、胶体、未完全水化的水泥颗粒、游离水分及气孔等组成的不均质结构；(3)水泥石的强度随龄期而发展，一般在28d内较快，以后变慢，因此应加强早期养护；(4)温度越高，凝结硬化速度越快。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '凝结硬化'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_039',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '在大体积混凝土中常用的水泥有（）',
      options: [
        { key: 'A', content: '硅酸盐水泥' },
        { key: 'B', content: '中热硅酸盐水泥' },
        { key: 'C', content: '低热硅酸盐水泥' },
        { key: 'D', content: '粉煤灰硅酸盐水泥' }
      ],
      answer: 'A,B,C,D',
      analysis: '水泥是水利水电工程混凝土结构的主要建筑材料。在大体积混凝土中常用的水泥有硅酸盐水泥、中热硅酸盐水泥、低热硅酸盐水泥、普通硅酸盐水泥（简称普硅水泥）、低热矿渣硅酸盐水泥、矿渣硅酸盐水泥、粉煤灰硅酸盐水泥、复合硅酸盐水泥等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水泥', '种类'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 6题 ==========
    {
      id: 'concrete_040',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '硅酸盐水泥熟料的主要化学成分有氧化钙（CaO）、氧化硅（SiO₂）、氧化铝（Al₂O₃）、氧化铁（Fe₂O₃）、氧化镁（MgO）等。它们在熟料中的含量范围大致如下：CaO为60%~67%，SiO₂为19%~25%。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。硅酸盐水泥熟料的主要化学成分有氧化钙（CaO）、氧化硅（SiO₂）、氧化铝（Al₂O₃）、氧化铁（Fe₂O₃）、氧化镁（MgO）等。它们在熟料中的含量范围大致如下：CaO为60%~67%，SiO₂为19%~25%，Al₂O₃为3%~7%，Fe₂O₃为2%~6%，MgO为1%~4%，SO₃为1%~3%，K₂O+Na₂O为0.5%~1.5%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '化学成分'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_041',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: 'C₃S具有较高的强度，特别是较高的早期强度。C₂S的早期强度较低，但后期强度较高。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。就水化物而言，C₃S具有较高的强度，特别是较高的早期强度。C₂S的早期强度较低，但后期强度较高。C₃A和C₄AF的强度均在早期发挥，后期强度几乎没有发展，但C₄AF的强度大于C₃A的强度。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水泥', '强度', 'C₃S', 'C₂S'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_042',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水泥加水拌和后，最初形成具有塑性的浆体，然后逐渐变稠并失去可塑性，这一过程称为凝结。此后，强度逐渐增加而变成坚固的石状物体——水泥石，这一过程称为硬化。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。水泥加水拌和后，最初形成具有塑性的浆体，然后逐渐变稠并失去可塑性，这一过程称为凝结。此后，强度逐渐增加而变成坚固的石状物体——水泥石，这一过程称为硬化。水泥凝结与硬化过程是一系列复杂化学反应及物理化学反应过程。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水泥', '凝结', '硬化'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_043',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '水泥胶砂抗压强度与抗折强度比值称为水泥的脆性系数（Δk），水泥的脆性系数大，表明水泥本身的抗裂性及抗磨性差。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。水泥胶砂抗压强度与抗折强度比值称为水泥的脆性系数（Δk），水泥的脆性系数大，表明水泥本身的抗裂性及抗磨性差。水泥熟料矿物成分的C₃A含量大，不仅水化热及收缩性大，且脆性系数也大，对抗裂极为不利。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '脆性系数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_044',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '为了提高水泥的抗脆性能力，应尽量提高水泥熟料中C₂S与C₄AF含量，使其脆性系数降低。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。因此，为了提高水泥的抗脆性能力，应尽量提高水泥熟料中C₂S与C₄AF含量，使其脆性系数降低。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '抗脆性', 'C₂S', 'C₄AF'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_045',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土原材料',
      content: '碱分（K₂O、Na₂O）含量多时会与活性骨料作用引起碱骨料反应，使体积膨胀，导致混凝土产生裂缝。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。碱分（K₂O、Na₂O）含量多时会与活性骨料作用引起碱骨料反应，使体积膨胀，导致混凝土产生裂缝。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水泥', '碱骨料反应'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
