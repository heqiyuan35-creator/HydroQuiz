/**
 * 岩土工程题目数据（第三部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（岩石、土工、土工合成材料）第3版 第二章 岩石吸水性试验
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目（第三部分）
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions3(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_081',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的吸水率表，闪长岩的吸水率范围一般为（）。',
      options: [
        { key: 'A', content: '0.1~4.0%' },
        { key: 'B', content: '0.3~5.0%' },
        { key: 'C', content: '0.5~4.0%' },
        { key: 'D', content: '0.8~5.0%' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的吸水率表，闪长岩的吸水率范围一般为0.3~5.0%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '闪长岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_082',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的吸水率表，辉长岩的吸水率范围一般为（）。',
      options: [
        { key: 'A', content: '0.1~4.0%' },
        { key: 'B', content: '0.3~5.0%' },
        { key: 'C', content: '0.5~4.0%' },
        { key: 'D', content: '0.8~5.0%' }
      ],
      answer: 'C',
      analysis: '根据部分岩石的吸水率表，辉长岩的吸水率范围一般为0.5~4.0%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '辉长岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_083',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的吸水率表，辉绿岩的吸水率范围一般为（）。',
      options: [
        { key: 'A', content: '0.4~1.7%' },
        { key: 'B', content: '0.8~5.0%' },
        { key: 'C', content: '0.3~4.5%' },
        { key: 'D', content: '0.5~7.5%' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的吸水率表，辉绿岩的吸水率范围一般为0.8~5.0%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '辉绿岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_084',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的吸水率表，玄武岩的吸水率范围一般为（）。',
      options: [
        { key: 'A', content: '0.1~4.0%' },
        { key: 'B', content: '0.3~2.8%' },
        { key: 'C', content: '0.5~1.7%' },
        { key: 'D', content: '0.2~5.0%' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的吸水率表，玄武岩的吸水率范围一般为0.3~2.8%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '玄武岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_085',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的吸水率表，大理岩的吸水率范围一般为（）。',
      options: [
        { key: 'A', content: '0.1~1.0%' },
        { key: 'B', content: '0.5~3.0%' },
        { key: 'C', content: '0.1~0.3%' },
        { key: 'D', content: '0.2~2.5%' }
      ],
      answer: 'A',
      analysis: '根据部分岩石的吸水率表，大理岩的吸水率范围一般为0.1~1.0%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '大理岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_086',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的吸水率表，板岩的吸水率范围一般为（）。',
      options: [
        { key: 'A', content: '0.1~1.5%' },
        { key: 'B', content: '0.1~0.3%' },
        { key: 'C', content: '0.2~2.5%' },
        { key: 'D', content: '0.5~3.0%' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的吸水率表，板岩的吸水率范围一般为0.1~0.3%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '板岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_087',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的空隙率表，花岗岩的空隙率范围一般为（）。',
      options: [
        { key: 'A', content: '0.18~5.0%' },
        { key: 'B', content: '0.5~4.0%' },
        { key: 'C', content: '0.29~4.0%' },
        { key: 'D', content: '1.1~4.5%' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的空隙率表，花岗岩的空隙率范围一般为0.5~4.0%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '空隙率', '花岗岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_088',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的空隙率表，砂岩的空隙率范围一般为（）。',
      options: [
        { key: 'A', content: '0.8~10.0%' },
        { key: 'B', content: '1.6~28.0%' },
        { key: 'C', content: '3.0~7.0%' },
        { key: 'D', content: '0.4~10.0%' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的空隙率表，砂岩的空隙率范围一般为1.6~28.0%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '空隙率', '砂岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_089',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的空隙率表，石灰岩的空隙率范围一般为（）。',
      options: [
        { key: 'A', content: '0.3~25.0%' },
        { key: 'B', content: '0.5~27.0%' },
        { key: 'C', content: '1.0~10.0%' },
        { key: 'D', content: '0.4~3.6%' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的空隙率表，石灰岩的空隙率范围一般为0.5~27.0%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '空隙率', '石灰岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_090',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石自然吸水率的计算公式为ωa=（ma-md）/md×100%，其中md表示（）。',
      options: [
        { key: 'A', content: '试件浸水48h后的质量' },
        { key: 'B', content: '试件烘干后的质量' },
        { key: 'C', content: '试件强制饱和后的质量' },
        { key: 'D', content: '试件天然状态的质量' }
      ],
      answer: 'B',
      analysis: '在岩石自然吸水率计算公式ωa=(ma-md)/md×100%中，md表示试件烘干后的质量，单位为g。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '自然吸水率', '计算公式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_091',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石饱和吸水率的计算公式为ωs=（ms-md）/md×100%，其中ms表示（）。',
      options: [
        { key: 'A', content: '试件浸水48h后的质量' },
        { key: 'B', content: '试件烘干后的质量' },
        { key: 'C', content: '试件强制饱和后的质量' },
        { key: 'D', content: '试件天然状态的质量' }
      ],
      answer: 'C',
      analysis: '在岩石饱和吸水率计算公式ωs=(ms-md)/md×100%中，ms表示试件强制饱和后的质量，单位为g。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '饱和吸水率', '计算公式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_092',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石饱水系数的计算公式为kw=ωa/ωs×100%，其中ωa表示（）。',
      options: [
        { key: 'A', content: '岩石饱和吸水率' },
        { key: 'B', content: '岩石自然吸水率' },
        { key: 'C', content: '岩石含水率' },
        { key: 'D', content: '岩石空隙率' }
      ],
      answer: 'B',
      analysis: '在岩石饱水系数计算公式kw=ωa/ωs×100%中，ωa表示岩石自然吸水率（%）。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '饱水系数', '计算公式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_093',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据岩石不同浸水时间吸水率比较表，中粒岩浸水24h时吸水百分比一般可达到（）。',
      options: [
        { key: 'A', content: '75.3%' },
        { key: 'B', content: '83.2%' },
        { key: 'C', content: '89.7%' },
        { key: 'D', content: '94.5%' }
      ],
      answer: 'B',
      analysis: '根据岩石不同浸水时间吸水率比较表，中粒岩浸水24h时吸水百分比一般可达到83.2%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '吸水率', '浸水时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_094',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据岩石不同浸水时间吸水率比较表，砂岩浸水48h时吸水百分比一般可达到（）。',
      options: [
        { key: 'A', content: '85.7%' },
        { key: 'B', content: '89.7%' },
        { key: 'C', content: '91.2%' },
        { key: 'D', content: '94.5%' }
      ],
      answer: 'B',
      analysis: '根据岩石不同浸水时间吸水率比较表，砂岩浸水48h时吸水百分比一般可达到89.7%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '吸水率', '砂岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_095',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验记录应包括工程名称、岩石名称、试件编号、试件描述、试验方法、干试件质量、浸水后试件质量、强制饱和后试件质量、试验人员和（）等。',
      options: [
        { key: 'A', content: '试验温度' },
        { key: 'B', content: '试验日期' },
        { key: 'C', content: '试验地点' },
        { key: 'D', content: '试验设备' }
      ],
      answer: 'B',
      analysis: '试验记录应包括工程名称、岩石名称、试件编号、试件描述、试验方法、干试件质量、浸水后试件质量、强制饱和后试件质量、试验人员、试验日期等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '试验记录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_096',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验中，规则试件的尺寸为（）mm。',
      options: [
        { key: 'A', content: '40~50' },
        { key: 'B', content: '48~54' },
        { key: 'C', content: '50~60' },
        { key: 'D', content: '55~65' }
      ],
      answer: 'B',
      analysis: '试件可采用规则试件或不规则试件，规则试件可采用圆柱体或方柱体，其尺寸为48~54mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '试件尺寸'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_097',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验中，不规则试件采用40~50mm的浑圆形或圆柱体岩块，试件质量宜为（）g。',
      options: [
        { key: 'A', content: '100~150' },
        { key: 'B', content: '150~200' },
        { key: 'C', content: '200~250' },
        { key: 'D', content: '250~300' }
      ],
      answer: 'B',
      analysis: '不规则试件采用40~50mm的浑圆形或圆柱体岩块，试件质量宜为150~200g。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '试件质量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_098',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的空隙率表，大理岩的空隙率范围一般为（）。',
      options: [
        { key: 'A', content: '0.1~6.0%' },
        { key: 'B', content: '0.1~0.45%' },
        { key: 'C', content: '0.7~3.0%' },
        { key: 'D', content: '0.1~8.7%' }
      ],
      answer: 'A',
      analysis: '根据部分岩石的空隙率表，大理岩的空隙率范围一般为0.1~6.0%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '空隙率', '大理岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_099',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的空隙率表，板岩的空隙率范围一般为（）。',
      options: [
        { key: 'A', content: '0.1~6.0%' },
        { key: 'B', content: '0.1~0.45%' },
        { key: 'C', content: '0.7~3.0%' },
        { key: 'D', content: '0.1~2.5%' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的空隙率表，板岩的空隙率范围一般为0.1~0.45%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '空隙率', '板岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_100',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的吸水率表，凝灰岩的吸水率范围一般为（）。',
      options: [
        { key: 'A', content: '0.2~5.0%' },
        { key: 'B', content: '0.5~7.5%' },
        { key: 'C', content: '0.1~0.85%' },
        { key: 'D', content: '0.5~1.8%' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的吸水率表，凝灰岩的吸水率范围一般为0.5~7.5%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '凝灰岩'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_101',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验主要仪器和设备包括（）。',
      options: [
        { key: 'A', content: '烘箱、干燥器' },
        { key: 'B', content: '天平（感量0.01g）' },
        { key: 'C', content: '真空抽气设备和煮沸设备' },
        { key: 'D', content: '压力机' }
      ],
      answer: 'A,B,C',
      analysis: '岩石吸水性试验方法详见《水利水电工程岩石试验规程》（SL 264—2001）第8~10页，主要仪器和设备包括烘箱、干燥器、天平（感量0.01g）、真空抽气设备和煮沸设备等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '试验设备'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_102',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石自然吸水率与饱和吸水率之间存在一定差别，其差值的大小取决于（）。',
      options: [
        { key: 'A', content: '岩性' },
        { key: 'B', content: '吸水方式' },
        { key: 'C', content: '试验温度' },
        { key: 'D', content: '试件形状' }
      ],
      answer: 'A,B',
      analysis: '岩石的自然吸水率与饱和吸水率之间存在着一定的差别，其差值的大小取决于岩性和吸水方式，因此在岩石试验中，应该将两者加以区别。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '影响因素'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_103',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石饱和吸水率试验适用于（）的岩石。',
      options: [
        { key: 'A', content: '遇水不崩解' },
        { key: 'B', content: '不溶解' },
        { key: 'C', content: '不干缩湿胀' },
        { key: 'D', content: '遇水膨胀' }
      ],
      answer: 'A,B,C',
      analysis: '岩石饱和吸水率试验目前采用真空饱和或煮沸饱和方法进行，适用于遇水不崩解、不溶解和不干缩湿胀的岩石。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '饱和吸水率', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_104',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的吸水率表，以下岩石中吸水率范围在0.5%以下的有（）。',
      options: [
        { key: 'A', content: '花岗岩' },
        { key: 'B', content: '板岩' },
        { key: 'C', content: '石英片岩及角闪片岩' },
        { key: 'D', content: '凝灰岩' }
      ],
      answer: 'A,B,C',
      analysis: '根据部分岩石的吸水率表，花岗岩吸水率为0.1~4.0%，板岩为0.1~0.3%，石英片岩及角闪片岩为0.1~0.3%，这些岩石的吸水率下限都在0.5%以下。凝灰岩吸水率为0.5~7.5%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '吸水率', '岩石类型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_105',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验程序中，采用自由吸水法测定岩石自然吸水率时，水面升高的顺序为（）。',
      options: [
        { key: 'A', content: '首先淹没试件高度的1/4' },
        { key: 'B', content: '2h后升高水面至试件的1/2处' },
        { key: 'C', content: '4h后升高水面至试件的3/4处' },
        { key: 'D', content: '6h后水面全部浸没试件' }
      ],
      answer: 'A,B,C,D',
      analysis: '采用自由吸水法测定岩石自然吸水率时，首先淹没试件高度的1/4，然后每隔2h分别升高水面至试件的1/2和3/4处，6h后水面全部浸没试件。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '试验程序'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_106',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的空隙率表，以下岩石中空隙率可能超过10%的有（）。',
      options: [
        { key: 'A', content: '砂岩' },
        { key: 'B', content: '石灰岩' },
        { key: 'C', content: '白云岩' },
        { key: 'D', content: '花岗岩' }
      ],
      answer: 'A,B,C',
      analysis: '根据部分岩石的空隙率表，砂岩空隙率为1.6~28.0%，石灰岩为0.5~27.0%，白云岩为0.3~25.0%，这些岩石的空隙率上限都超过10%。花岗岩空隙率为0.5~4.0%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '空隙率', '岩石类型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_107',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验中，计算岩石吸水性指标需要测定的质量包括（）。',
      options: [
        { key: 'A', content: '试件烘干后的质量md' },
        { key: 'B', content: '试件浸水48h后的质量ma' },
        { key: 'C', content: '试件强制饱和后的质量ms' },
        { key: 'D', content: '试件天然状态的质量' }
      ],
      answer: 'A,B,C',
      analysis: '根据岩石吸水性计算公式，需要测定试件烘干后的质量md、试件浸水48h后的质量ma、试件强制饱和后的质量ms。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '测定参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_108',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据岩石不同浸水时间吸水率比较表，以下关于浸水时间与吸水百分比关系的说法正确的有（）。',
      options: [
        { key: 'A', content: '浸水24h时，岩石试块平均吸水量一般可达到绝对吸水量的85%' },
        { key: 'B', content: '浸水48h时，岩石试块平均吸水量一般可达到绝对吸水量的94%' },
        { key: 'C', content: '继续浸水的吸水量很小' },
        { key: 'D', content: '浸水时间越长，吸水量增加越快' }
      ],
      answer: 'A,B,C',
      analysis: '从大量的试验资料分析，当浸水时间为24h，岩石试块平均吸水量一般可达到绝对吸水量的85%；当浸水时间为48h，岩石试块平均吸水量一般可达到绝对吸水量的94%，继续浸水的吸水量很小。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '浸水时间'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_109',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石自然吸水率的大小取决于岩石中孔隙的大小及其连通性，岩石的自然吸水率越大，表明岩石中孔隙越大，连通性越好，岩石力学性质越好。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。岩石自然吸水率的大小取决于岩石中孔隙的大小及其连通性，岩石的自然吸水率越大，表明岩石中孔隙越大，连通性越好，岩石力学性质越差（不是越好）。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '自然吸水率', '力学性质'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_110',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '饱和吸水率反映岩石内部的张开型孔隙和裂隙的发育程度，对岩石的抗冻性和抗风化能力有较大影响。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。饱和吸水率反映岩石内部的张开型孔隙和裂隙的发育程度，对岩石的抗冻性和抗风化能力有较大影响。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '饱和吸水率', '影响'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_111',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性对岩石的风化程度比较敏感，在国外常作为风化指标，广泛地与其他物理力学特征值建立相关关系。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩石吸水性对岩石的风化程度比较敏感，在国外常作为风化指标，广泛地与其他物理力学特征值建立相关关系，并能有效地反映岩石微裂隙的发育程度。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '风化指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_112',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '通过岩石的吸水性试验，可以计算岩石的空隙率。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。通过岩石的吸水性试验，可以计算岩石的空隙率，部分岩石的空隙率见表2-5。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '空隙率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_113',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验程序对试验成果的影响十分显著，采用自由吸水法测定岩石自然吸水率时，首先应将试件全部浸入水中。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。采用自由吸水法测定岩石自然吸水率时，首先淹没试件高度的1/4，然后每隔2h分别升高水面至试件的1/2和3/4处，6h后水面全部浸没试件，其目的是让空气能逐渐被排出。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '试验程序'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_114',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '规程规定吸水性试验浸水时间为试件全部被水淹没后48h。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。由于继续增加吸水时间的意义不大，所以规程规定吸水性试验浸水时间为试件全部被水淹没后48h。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '浸水时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_115',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石饱水系数是指岩石饱和吸水率与自然吸水率的比值，以百分数表示。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。岩石饱水系数是指岩石自然吸水率与饱和吸水率的比值（不是饱和吸水率与自然吸水率的比值），以百分数表示。计算公式为kw=ωa/ωs×100%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '饱水系数', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_116',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验每组试件块数不少于5块。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。岩石吸水性试验每组试件块数不少于3块（不是5块）。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '试件数量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_117',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '测定岩石饱和吸水率时，首先应按自由吸水法排出试件空气，再使容器内的水面高出试件，然后用煮沸法或真空抽气法进行饱和试验。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。测定岩石饱和吸水率时，首先应按自由吸水法排出试件空气，再使容器内的水面高出试件，然后用煮沸法或真空抽气法进行饱和试验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '饱和吸水率', '试验步骤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_118',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '对于亲水性较强、吸水时间较长的黏土质岩石，可以作为特殊问题处理。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。对于亲水性较强、吸水时间较长的黏土质岩石，可以作为特殊问题处理。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '黏土质岩石'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_119',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的吸水率表，花岗片麻岩的吸水率范围一般为0.1~0.85%，属于吸水率较低的岩石。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据部分岩石的吸水率表，花岗片麻岩的吸水率范围一般为0.1~0.85%，属于吸水率较低的岩石。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '花岗片麻岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_120',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验中，6h后水面全部浸没试件，其目的是让空气能逐渐被排出。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩石吸水性试验中，6h后水面全部浸没试件，其目的是让空气能逐渐被排出。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '试验目的'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
