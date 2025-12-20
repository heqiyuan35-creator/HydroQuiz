/**
 * 岩土工程题目数据（第六部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（岩石、土工、土工合成材料）第3版 第五节 岩石膨胀性试验
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目（第六部分）
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions6(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_201',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石膨胀性是指含亲水易膨胀的矿物（蒙托石类）的岩石在水的作用下，吸收无定量的水分子，产生（）的性质。',
      options: [
        { key: 'A', content: '收缩变形' },
        { key: 'B', content: '体积膨胀' },
        { key: 'C', content: '强度增加' },
        { key: 'D', content: '密度增大' }
      ],
      answer: 'B',
      analysis: '岩石膨胀性是指含亲水易膨胀的矿物（蒙托石类）的岩石在水的作用下，吸收无定量的水分子，产生体积膨胀的性质。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '膨胀性', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_202',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '发生膨胀的岩石，绝大多数属于（）的岩石。',
      options: [
        { key: 'A', content: '岩浆岩类' },
        { key: 'B', content: '变质岩类' },
        { key: 'C', content: '黏土质类' },
        { key: 'D', content: '石灰�ite类' }
      ],
      answer: 'C',
      analysis: '发生膨胀的岩石，绝大多数属于黏土质类的岩石，这类岩石中含有蒙托石类的矿物，只要改变其含水状态，就会使其晶格膨胀松动和崩解，造成地表和地下建筑物的破坏。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '膨胀性', '岩石类型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_203',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '表征岩石膨胀特性的指标有岩石自由膨胀率、侧向约束膨胀率和（）。',
      options: [
        { key: 'A', content: '抗压强度' },
        { key: 'B', content: '体积不变条件下膨胀压力' },
        { key: 'C', content: '弹性模量' },
        { key: 'D', content: '抗拉强度' }
      ],
      answer: 'B',
      analysis: '表征岩石膨胀特性的指标有岩石自由膨胀率、侧向约束膨胀率和体积不变条件下膨胀压力。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_204',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石自由膨胀率是岩石试件吸水后产生的径向和轴向变形分别与原试件直径和高度之比，以（）表示。',
      options: [
        { key: 'A', content: '小数' },
        { key: 'B', content: '百分数' },
        { key: 'C', content: '千分数' },
        { key: 'D', content: '整数' }
      ],
      answer: 'B',
      analysis: '岩石自由膨胀率是岩石试件吸水后产生的径向和轴向变形分别与原试件直径和高度之比，以百分数表示。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '自由膨胀率', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_205',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石侧向约束膨胀率是岩石试件在有侧向约束而不产生侧向变形的条件下，轴向受有限压力（5kPa）时，吸水后产生的轴向变形与试件原高度之比，以（）表示。',
      options: [
        { key: 'A', content: '小数' },
        { key: 'B', content: '百分数' },
        { key: 'C', content: '千分数' },
        { key: 'D', content: '整数' }
      ],
      answer: 'B',
      analysis: '岩石侧向约束膨胀率是岩石试件在有侧向约束而不产生侧向变形的条件下，轴向受有限压力（5kPa）时，吸水后产生的轴向变形与试件原高度之比，以百分数表示。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '侧向约束膨胀率', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_206',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石膨胀压力是岩石试件吸水后保持原体积不变所产生的（）。',
      options: [
        { key: 'A', content: '剪切力' },
        { key: 'B', content: '拉力' },
        { key: 'C', content: '压力' },
        { key: 'D', content: '扭矩' }
      ],
      answer: 'C',
      analysis: '岩石膨胀压力是岩石试件吸水后保持原体积不变所产生的压力。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '膨胀压力', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_207',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石膨胀性试验方法详见《水利水电工程岩石试验规程》（SL 264—2001）第（）页。',
      options: [
        { key: 'A', content: '12~16' },
        { key: 'B', content: '16~20' },
        { key: 'C', content: '20~24' },
        { key: 'D', content: '24~28' }
      ],
      answer: 'B',
      analysis: '岩石膨胀性试验方法详见《水利水电工程岩石试验规程》（SL 264—2001）第16~20页。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '膨胀性', '规程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_208',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石自由膨胀率试验是测定岩石不受约束的情况下，浸水后的轴向和径向膨胀变形。自由膨胀率是指岩石试件的轴向和径向膨胀变形与其原试件高度和直径之比，用百分数表示。此试验方法适用于（）的岩石。',
      options: [
        { key: 'A', content: '遇水易崩解' },
        { key: 'B', content: '遇水不易崩解' },
        { key: 'C', content: '所有类型' },
        { key: 'D', content: '坚硬' }
      ],
      answer: 'B',
      analysis: '此试验方法适用于遇水不易崩解的岩石。岩石自由膨胀率试验装置见图2-1。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '自由膨胀率', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_209',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石侧向约束膨胀率试验是测定岩石试件有侧向约束而不产生侧向变形的条件下，轴向固定载荷（5kPa）时，浸水后产生的轴向膨胀变形。侧向约束膨胀率是指岩石试件在此条件下产生的膨胀变形与其原高度之比，用百分数表示。此试验方法适用于（）。',
      options: [
        { key: 'A', content: '坚硬岩石' },
        { key: 'B', content: '软质岩石' },
        { key: 'C', content: '各类岩石' },
        { key: 'D', content: '遇水崩解的岩石' }
      ],
      answer: 'C',
      analysis: '此试验方法适用于各类岩石。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '侧向约束膨胀率', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_210',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '在进行岩石侧向约束膨胀率试验和岩石体积不变条件下膨胀压力试验时，岩石试件尽量使用规则试件，试件直径为（）mm。',
      options: [
        { key: 'A', content: '40±0.1' },
        { key: 'B', content: '50±0.1' },
        { key: 'C', content: '60±0.1' },
        { key: 'D', content: '70±0.1' }
      ],
      answer: 'B',
      analysis: '在进行岩石侧向约束膨胀率试验和岩石体积不变条件下膨胀压力试验时，岩石试件尽量使用规则试件，试件直径为50±0.1mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '试件尺寸'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_211',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '进行膨胀试验时，稳定标准规定为：自由膨胀率试验在开始1h内，每隔10min读变形测表一次，以后每隔1h测读一次，直到相邻三次读数差不大于（）mm，即可认定为稳定。',
      options: [
        { key: 'A', content: '0.0001' },
        { key: 'B', content: '0.001' },
        { key: 'C', content: '0.01' },
        { key: 'D', content: '0.1' }
      ],
      answer: 'B',
      analysis: '进行膨胀试验时，稳定标准规定为：自由膨胀率试验在开始1h内，每隔10min读变形测表一次，以后每隔1h测读一次，直到相邻三次读数差不大于0.001mm，即可认定为稳定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '稳定标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_212',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '侧向约束膨胀率试验和岩石体积不变条件下膨胀压力试验，在开始时每隔10min读变形测表一次，连续三次读数差不大于0.001mm时，改为每隔1h测读一次，连续三次读数差不大于（）mm时，即可认定为稳定。',
      options: [
        { key: 'A', content: '0.0001' },
        { key: 'B', content: '0.001' },
        { key: 'C', content: '0.01' },
        { key: 'D', content: '0.1' }
      ],
      answer: 'B',
      analysis: '侧向约束膨胀率试验和岩石体积不变条件下膨胀压力试验，在开始时每隔10min读变形测表一次，连续三次读数差不大于0.001mm时，改为每隔1h测读一次，连续三次读数差不大于0.001mm时，即可认定为稳定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '稳定标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_213',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '规程还明确规定自由膨胀率试验、侧向约束膨胀率试验和岩石体积不变条件下膨胀压力试验的浸水时间都不得少于（）h。',
      options: [
        { key: 'A', content: '24' },
        { key: 'B', content: '36' },
        { key: 'C', content: '48' },
        { key: 'D', content: '72' }
      ],
      answer: 'C',
      analysis: '规程还明确规定自由膨胀率试验、侧向约束膨胀率试验和岩石体积不变条件下膨胀压力试验的浸水时间都不得少于48h。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '浸水时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_214',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '测定岩石膨胀力的试验方法有平衡—加压法、膨胀—加压恢复法和加压—膨胀法三种试验方法。（）是先测膨胀压力，即通过加压装置，使岩石试件的体积在整个试验过程中保持不变，所测的压力为膨胀压力。',
      options: [
        { key: 'A', content: '平衡—加压法' },
        { key: 'B', content: '膨胀—加压恢复法' },
        { key: 'C', content: '加压—膨胀法' },
        { key: 'D', content: '自由膨胀法' }
      ],
      answer: 'A',
      analysis: '平衡—加压法是先测膨胀压力，即通过加压装置，使岩石试件的体积在整个试验过程中保持不变，所测的压力为膨胀压力。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀压力', '平衡—加压法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_215',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '（）是先让试件浸水后在受压下膨胀，测定侧向约束下的膨胀率，然后逐次加压，每增加一级压力，都让膨胀达到稳定，以测定不同压力的膨胀率，最后加压使试件恢复到浸水前的厚度，此时的压力为膨胀压力。',
      options: [
        { key: 'A', content: '平衡—加压法' },
        { key: 'B', content: '膨胀—加压恢复法' },
        { key: 'C', content: '加压—膨胀法' },
        { key: 'D', content: '自由膨胀法' }
      ],
      answer: 'B',
      analysis: '膨胀—加压恢复法是先让试件浸水后在受压下膨胀，测定侧向约束下的膨胀率，然后逐次加压，每增加一级压力，都让膨胀达到稳定，以测定不同压力的膨胀率，最后加压使试件恢复到浸水前的厚度，此时的压力为膨胀压力。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀压力', '膨胀—加压恢复法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_216',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '（）是在试件浸水前预加较大的压力，受压稳定后再浸水膨胀，待膨胀变形稳定后，逐次减压，测定不同压力下的膨胀率，当膨胀率为零时的压力为膨胀压力。',
      options: [
        { key: 'A', content: '平衡—加压法' },
        { key: 'B', content: '膨胀—加压恢复法' },
        { key: 'C', content: '加压—膨胀法' },
        { key: 'D', content: '自由膨胀法' }
      ],
      answer: 'C',
      analysis: '加压—膨胀法是在试件浸水前预加较大的压力，受压稳定后再浸水膨胀，待膨胀变形稳定后，逐次减压，测定不同压力下的膨胀率，当膨胀率为零时的压力为膨胀压力。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀压力', '加压—膨胀法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_217',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '膨胀—加压恢复法所测定的膨胀压力比平衡—加压法大（）%，有的大1~4倍。',
      options: [
        { key: 'A', content: '10~20' },
        { key: 'B', content: '20~40' },
        { key: 'C', content: '40~60' },
        { key: 'D', content: '60~80' }
      ],
      answer: 'B',
      analysis: '以上三种方法测定的结果相差较大，膨胀—加压恢复法所测定的膨胀压力比平衡—加压法大20%~40%，有的大1~4倍。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '膨胀压力', '方法比较'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_218',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石块体天然密度表，花岗岩的天然密度范围一般为（）g/cm³。',
      options: [
        { key: 'A', content: '2.30~2.80' },
        { key: 'B', content: '2.52~2.96' },
        { key: 'C', content: '2.55~2.98' },
        { key: 'D', content: '2.70~2.74' }
      ],
      answer: 'A',
      analysis: '根据部分岩石块体天然密度表，花岗岩的天然密度范围一般为2.30~2.80g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '天然密度', '花岗岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_219',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石块体天然密度表，玄武岩的天然密度范围一般为（）g/cm³。',
      options: [
        { key: 'A', content: '2.30~2.70' },
        { key: 'B', content: '2.40~2.86' },
        { key: 'C', content: '2.50~3.10' },
        { key: 'D', content: '2.29~2.50' }
      ],
      answer: 'C',
      analysis: '根据部分岩石块体天然密度表，玄武岩的天然密度范围一般为2.50~3.10g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '天然密度', '玄武岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_220',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石块体天然密度表，大理岩的天然密度范围一般为（）g/cm³。',
      options: [
        { key: 'A', content: '2.30~2.70' },
        { key: 'B', content: '2.60~2.70' },
        { key: 'C', content: '2.81~2.90' },
        { key: 'D', content: '2.31~2.75' }
      ],
      answer: 'B',
      analysis: '根据部分岩石块体天然密度表，大理岩的天然密度范围一般为2.60~2.70g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '天然密度', '大理岩'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_221',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '表征岩石膨胀特性的指标有（）。',
      options: [
        { key: 'A', content: '岩石自由膨胀率' },
        { key: 'B', content: '侧向约束膨胀率' },
        { key: 'C', content: '体积不变条件下膨胀压力' },
        { key: 'D', content: '抗压强度' }
      ],
      answer: 'A,B,C',
      analysis: '表征岩石膨胀特性的指标有岩石自由膨胀率、侧向约束膨胀率和体积不变条件下膨胀压力。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '膨胀性', '指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_222',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '测定岩石膨胀力的试验方法有（）。',
      options: [
        { key: 'A', content: '平衡—加压法' },
        { key: 'B', content: '膨胀—加压恢复法' },
        { key: 'C', content: '加压—膨胀法' },
        { key: 'D', content: '自由膨胀法' }
      ],
      answer: 'A,B,C',
      analysis: '测定岩石膨胀力的试验方法有平衡—加压法、膨胀—加压恢复法和加压—膨胀法三种试验方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀压力', '试验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_223',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石膨胀性试验主要仪器和设备包括（）。',
      options: [
        { key: 'A', content: '钻石机、切石机、磨石机和车床' },
        { key: 'B', content: '测量平台、角尺、千分卡尺、放大镜' },
        { key: 'C', content: '天平（称量大于500g，感量为0.01g）' },
        { key: 'D', content: '自由膨胀试验仪、侧向约束膨胀率试验仪、膨胀压力试验仪' }
      ],
      answer: 'A,B,C,D',
      analysis: '岩石膨胀性试验主要仪器和设备包括钻石机、切石机、磨石机和车床、测量平台、角尺、千分卡尺、放大镜、天平（称量大于500g，感量为0.01g）、自由膨胀试验仪、侧向约束膨胀率试验仪、膨胀压力试验仪、千分表、压力传感器、温度计等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '试验设备'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_224',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石膨胀性试验记录应包括（）。',
      options: [
        { key: 'A', content: '工程名称、岩石名称、试件编号、试件描述' },
        { key: 'B', content: '试验方法、试件尺寸、试液温度' },
        { key: 'C', content: '径向变形、轴向变形、轴向载荷' },
        { key: 'D', content: '试验人员、试验日期' }
      ],
      answer: 'A,B,C,D',
      analysis: '试验记录应包括工程名称、岩石名称、试件编号、试件描述、试验方法、试件尺寸、试液温度、径向变形、轴向变形、轴向载荷、试验人员、试验日期等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '试验记录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_225',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '含有蒙托石类矿物的岩石，只要改变其含水状态，就会（）。',
      options: [
        { key: 'A', content: '使其晶格膨胀松动' },
        { key: 'B', content: '崩解' },
        { key: 'C', content: '造成地表和地下建筑物的破坏' },
        { key: 'D', content: '强度增加' }
      ],
      answer: 'A,B,C',
      analysis: '这类岩石中含有蒙托石类的矿物，只要改变其含水状态，就会使其晶格膨胀松动和崩解，造成地表和地下建筑物的破坏，特别是对隧道、地下洞室、边坡挡墙和水池底板的毁坏尤为明显。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '蒙托石'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_226',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '为了便于分析，试验结束后，应描述试件表面的（）现象。',
      options: [
        { key: 'A', content: '泥化' },
        { key: 'B', content: '软化' },
        { key: 'C', content: '颜色变化' },
        { key: 'D', content: '裂缝' }
      ],
      answer: 'A,B',
      analysis: '为了便于分析，试验结束后，应描述试件表面的泥化和软化现象。另外，可根据需要对试件进行矿物镜鉴、X光衍射分析和差热分析。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '试验分析'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_227',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据用规则试件和不规则试件测岩石块体密度的比较表，以下岩石进行了对比试验的有（）。',
      options: [
        { key: 'A', content: '花岗岩' },
        { key: 'B', content: '混合岩' },
        { key: 'C', content: '玄武岩' },
        { key: 'D', content: '大理岩' }
      ],
      answer: 'A,B',
      analysis: '根据用规则试件和不规则试件测岩石块体密度的比较表，花岗岩和混合岩进行了规则试件和不规则试件的对比试验。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '块体密度', '试件比较'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_228',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '水中称量法的优点有（）。',
      options: [
        { key: 'A', content: '对岩石试件的精度没有要求' },
        { key: 'B', content: '可连续测定岩石含水率、自然吸水率和饱和吸水率等指标' },
        { key: 'C', content: '水中称量法操作较为简便' },
        { key: 'D', content: '对试件的形状是否规则没有限制' }
      ],
      answer: 'A,B,C,D',
      analysis: '水中称量法的优点有：一是对岩石试件的精度没有要求；二是可连续测定岩石含水率、自然吸水率和饱和吸水率等指标，且水中称量法操作较为简便，并对试件的形状是否规则没有限制。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '水中称量法', '优点'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_229',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石膨胀性是指含亲水易膨胀的矿物（蒙托石类）的岩石在水的作用下，吸收无定量的水分子，产生体积膨胀的性质。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩石膨胀性是指含亲水易膨胀的矿物（蒙托石类）的岩石在水的作用下，吸收无定量的水分子，产生体积膨胀的性质。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '膨胀性', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_230',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '第一种试验方法由于是等体积过程作功，岩石试件在整个试验过程中体积和结构不发生变化，因此所测的膨胀压力能比较真实地反映岩石自然状态的膨胀特性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。第一种试验方法由于是等体积过程作功，岩石试件在整个试验过程中体积和结构不发生变化，因此所测的膨胀压力能比较真实地反映岩石自然状态的膨胀特性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀压力', '平衡—加压法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_231',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '第二种和第三种试验方法无论是先膨胀后加压或先加压后膨胀，都会引起岩石试件的体积和结构发生变化，因此所测定的膨胀压力为特定情况下的膨胀特性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。第二种和第三种试验方法无论是先膨胀后加压或先加压后膨胀，都会引起岩石试件的体积和结构发生变化，因此所测定的膨胀压力为特定情况下的膨胀特性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀压力', '试验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_232',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '由此可见，第一种试验方法与工程岩体实际情况大致相符，所以规定第一种试验方法为膨胀压力测试方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。由此可见，第一种试验方法与工程岩体实际情况大致相符，所以规定第一种试验方法为膨胀压力测试方法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '膨胀压力', '测试方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_233',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石试件的含水率对测试成果的影响尤为明显，因为具有膨胀特性的岩石，一般都含有蒙托石类亲水矿物，其活动能力很强，分子结构极不稳定，遇水后很快可吸收大量的水分子，产生体积膨胀。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩石试件的含水率对测试成果的影响尤为明显，因为具有膨胀特性的岩石，一般都含有蒙托石类亲水矿物，其活动能力很强，分子结构极不稳定，遇水后很快可吸收大量的水分子，产生体积膨胀，造成岩石的晶格错动和移位，使其崩解破坏。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '含水率影响'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_234',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '在对天然含水率的岩石试件进行膨胀特性试验时，试验前试件的含水率应尽量接近天然含水状态，一般不能超过1%，因此规定在加工岩石试件时实行干法加工。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。所以在对天然含水率的岩石试件进行膨胀特性试验时，试验前试件的含水率应尽量接近天然含水状态，一般不能超过1%，因此规定在加工岩石试件时实行干法加工。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '含水率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_235',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '为了尽量减少岩石试件在加工时含水率的增加而导致试件过早产生膨胀，进行岩石自由膨胀率试验时，应对岩石试件的加工精度有所放宽。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。为了尽量减少岩石试件在加工时含水率的增加而导致试件过早产生膨胀，进行岩石自由膨胀率试验时，应对岩石试件的加工精度有所放宽，只要求两端面的不平行度允许偏差为±0.05mm，垂直度允许偏差为±0.25°，对岩石试件直径和高度未作明确要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '试件加工'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_236',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据岩石吸水率的统计资料，岩石吸水48h后能达到94%，黏土岩类的岩石由于亲水性强，吸水稳定时间会长一些，吸水48h后仍然会继续膨胀变形。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据岩石吸水率的统计资料，岩石吸水48h后能达到94%，黏土岩类的岩石由于亲水性强，吸水稳定时间会长一些，吸水48h后仍然会继续膨胀变形。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '吸水时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_237',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '从有关实测资料分析，膨胀率试验时间一般在48h以内，膨胀压力试验则往往超过48h。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。从有关实测资料分析，膨胀率试验时间一般在48h以内，膨胀压力试验则往往超过48h。规程对观测标准和时间均作了详细的规定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '膨胀性', '试验时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_238',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '用量积法测定岩石的块体密度，方法简易，计算成果准确，不受试验环境的影响，且可以作为饱和抗压强度试验的试件。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。用量积法测定岩石的块体密度，方法简易，计算成果准确，不受试验环境的影响，且可以作为饱和抗压强度试验的试件。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '块体密度', '量积法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_239',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '原水利部东北勘测设计院科研院对不规则和规则试件进行了比较试验，研究结果表明，规则试件所测定的块体密度比不规则试件高0.02g/cm³左右。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。原水利部东北勘测设计院科研院对不规则和规则试件进行了比较试验，研究结果表明，规则试件所测定的块体密度比不规则试件高0.02g/cm³左右。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '块体密度', '试件比较'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_240',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据用规则试件和不规则试件测岩石块体密度的比较表，花岗岩规则试件的平均块体密度为2.63g/cm³，不规则试件的平均块体密度为2.62g/cm³。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据用规则试件和不规则试件测岩石块体密度的比较表，花岗岩规则试件的平均块体密度为2.63g/cm³，不规则试件的平均块体密度为2.62g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '块体密度', '花岗岩'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
