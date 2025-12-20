/**
 * 岩土工程题目数据（第四部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（岩石、土工、土工合成材料）第3版 第三节 岩石颗粒密度试验
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目（第四部分）
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions4(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_121',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石颗粒密度是岩石固相物质的质量与体积的比值，采用（）测定。',
      options: [
        { key: 'A', content: '比重瓶法或水中称量法' },
        { key: 'B', content: '环刀法或蜡封法' },
        { key: 'C', content: '灌砂法或灌水法' },
        { key: 'D', content: '浮力法或排水法' }
      ],
      answer: 'A',
      analysis: '岩石颗粒密度是岩石固相物质的质量与体积的比值，采用比重瓶法或水中称量法测定，分别按式(2-5)或式(2-6)计算。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '颗粒密度', '测定方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_122',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石颗粒密度试验方法可分为两种：即比重瓶法和水中称量法。比重瓶法适用于（）。',
      options: [
        { key: 'A', content: '遇水崩解的岩石' },
        { key: 'B', content: '各类岩石' },
        { key: 'C', content: '溶解和干缩湿胀的岩石' },
        { key: 'D', content: '密度小于1g/cm³的岩石' }
      ],
      answer: 'B',
      analysis: '比重瓶法适用于各类岩石，水中称量法适用于除遇水崩解、溶解和干缩湿胀以及密度小于1g/cm³的其他各类岩石。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '比重瓶法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_123',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '水中称量法适用于除遇水崩解、溶解和干缩湿胀以及密度小于（）的其他各类岩石。',
      options: [
        { key: 'A', content: '0.5g/cm³' },
        { key: 'B', content: '1g/cm³' },
        { key: 'C', content: '1.5g/cm³' },
        { key: 'D', content: '2g/cm³' }
      ],
      answer: 'B',
      analysis: '水中称量法适用于除遇水崩解、溶解和干缩湿胀以及密度小于1g/cm³的其他各类岩石。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '水中称量法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_124',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '比重瓶法测定岩石的颗粒密度，又分为土工试验方法、岩石试验方法和建筑材料试验方法三种。建筑材料试验方法又称（）。',
      options: [
        { key: 'A', content: '水中称量法' },
        { key: 'B', content: '李氏比重瓶法' },
        { key: 'C', content: '环刀法' },
        { key: 'D', content: '灌砂法' }
      ],
      answer: 'B',
      analysis: '比重瓶法测定岩石的颗粒密度，又分为土工试验方法、岩石试验方法和建筑材料试验方法三种。建筑材料试验方法又称李氏比重瓶法，这种方法用煤油作为测定液，观察试件放入液体后体积的变化，以此来计算岩石颗粒密度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '李氏比重瓶法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_125',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '土工试验方法和岩石试验方法主要区别在于，前者是在空气中称量，后者是在（）中称量。',
      options: [
        { key: 'A', content: '煤油' },
        { key: 'B', content: '酒精' },
        { key: 'C', content: '水' },
        { key: 'D', content: '真空' }
      ],
      answer: 'C',
      analysis: '土工试验方法和岩石试验方法主要区别在于，前者是在空气中称量，后者是在水中称量，两者的测试成果差别不大，但比建筑材料试验方法所得到的结果略偏大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '试验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_126',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的颗粒密度表，花岗岩的颗粒密度范围一般为（）g/cm³。',
      options: [
        { key: 'A', content: '2.40~2.80' },
        { key: 'B', content: '2.50~2.84' },
        { key: 'C', content: '2.60~3.10' },
        { key: 'D', content: '2.70~2.90' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的颗粒密度表，花岗岩的颗粒密度范围一般为2.50~2.84g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '花岗岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_127',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的颗粒密度表，闪长岩的颗粒密度范围一般为（）g/cm³。',
      options: [
        { key: 'A', content: '2.50~2.84' },
        { key: 'B', content: '2.60~3.10' },
        { key: 'C', content: '2.0~3.40' },
        { key: 'D', content: '2.40~2.70' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的颗粒密度表，闪长岩的颗粒密度范围一般为2.60~3.10g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '闪长岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_128',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的颗粒密度表，橄榄岩的颗粒密度范围一般为（）g/cm³。',
      options: [
        { key: 'A', content: '2.50~2.84' },
        { key: 'B', content: '2.60~2.80' },
        { key: 'C', content: '2.0~3.40' },
        { key: 'D', content: '2.60~3.10' }
      ],
      answer: 'C',
      analysis: '根据部分岩石的颗粒密度表，橄榄岩的颗粒密度范围一般为2.0~3.40g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '橄榄岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_129',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的颗粒密度表，玄武岩的颗粒密度范围一般为（）g/cm³。',
      options: [
        { key: 'A', content: '2.40~2.80' },
        { key: 'B', content: '2.50~3.30' },
        { key: 'C', content: '2.60~2.90' },
        { key: 'D', content: '2.70~2.90' }
      ],
      answer: 'B',
      analysis: '根据部分岩石的颗粒密度表，玄武岩的颗粒密度范围一般为2.50~3.30g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '玄武岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_130',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的颗粒密度表，大理岩的颗粒密度范围一般为（）g/cm³。',
      options: [
        { key: 'A', content: '2.40~2.80' },
        { key: 'B', content: '2.53~2.84' },
        { key: 'C', content: '2.70~2.90' },
        { key: 'D', content: '2.80~2.90' }
      ],
      answer: 'C',
      analysis: '根据部分岩石的颗粒密度表，大理岩的颗粒密度范围一般为2.70~2.90g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '大理岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_131',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的颗粒密度表，板岩的颗粒密度范围一般为（）g/cm³。',
      options: [
        { key: 'A', content: '2.40~2.80' },
        { key: 'B', content: '2.60~2.80' },
        { key: 'C', content: '2.70~2.90' },
        { key: 'D', content: '2.80~2.90' }
      ],
      answer: 'C',
      analysis: '根据部分岩石的颗粒密度表，板岩的颗粒密度范围一般为2.70~2.90g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '板岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_132',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的颗粒密度表，石灰岩的颗粒密度范围一般为（）g/cm³。',
      options: [
        { key: 'A', content: '2.40~2.80' },
        { key: 'B', content: '2.57~2.77' },
        { key: 'C', content: '2.70~2.90' },
        { key: 'D', content: '2.20~2.30' }
      ],
      answer: 'A',
      analysis: '根据部分岩石的颗粒密度表，石灰岩的颗粒密度范围一般为2.40~2.80g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '石灰岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_133',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据部分岩石的颗粒密度表，片麻岩的颗粒密度范围一般为（）g/cm³。',
      options: [
        { key: 'A', content: '2.40~2.80' },
        { key: 'B', content: '2.60~2.80' },
        { key: 'C', content: '2.63~3.01' },
        { key: 'D', content: '2.70~2.90' }
      ],
      answer: 'C',
      analysis: '根据部分岩石的颗粒密度表，片麻岩的颗粒密度范围一般为2.63~3.01g/cm³。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '片麻岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_134',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石颗粒密度试验方法详见《水利水电工程岩石试验规程》（SL 264—2001）第（）页。',
      options: [
        { key: 'A', content: '8~10' },
        { key: 'B', content: '10~12' },
        { key: 'C', content: '12~14' },
        { key: 'D', content: '14~16' }
      ],
      answer: 'B',
      analysis: '岩石颗粒密度试验方法详见《水利水电工程岩石试验规程》（SL 264—2001）第10~12页。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '颗粒密度', '规程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_135',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石颗粒密度试验主要仪器和设备包括粉碎机、瓷研钵或玛瑙研钵、磁铁块、筛（孔径0.25mm）、天平（感量0.001g）、烘箱、干燥器、真空抽气设备或煮沸设备、短颈比重瓶（容积100mL）、温度计（量程0~50℃）和（）。',
      options: [
        { key: 'A', content: '压力机' },
        { key: 'B', content: '水中称量装置' },
        { key: 'C', content: '游标卡尺' },
        { key: 'D', content: '振动台' }
      ],
      answer: 'B',
      analysis: '岩石颗粒密度试验主要仪器和设备包括粉碎机、瓷研钵或玛瑙研钵、磁铁块、筛（孔径0.25mm）、天平（感量0.001g）、烘箱、干燥器、真空抽气设备或煮沸设备、短颈比重瓶（容积100mL）、温度计（量程0~50℃）、水中称量装置等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '试验设备'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_136',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '水中称量法测定岩石颗粒密度方法操作比较简单，且可以采用不规则试件，与比重瓶法测定的颗粒密度值相比（）。',
      options: [
        { key: 'A', content: '偏大很多' },
        { key: 'B', content: '偏小很多' },
        { key: 'C', content: '略偏小' },
        { key: 'D', content: '完全相同' }
      ],
      answer: 'C',
      analysis: '经过多年的试验研究，水中称量法测定岩石的颗粒密度方法操作比较简单，且可以采用不规则试件，与比重瓶法测定的颗粒密度值相比略偏小。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '水中称量法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_137',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '采用真空饱和吸水性试验时，从有关资料分析，抽气3h和4h均未达到完全吸水稳定，但抽气3h与抽气4h两者之间的吸水率差值不大，所以规定抽气时间不得少于（）h。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '3' },
        { key: 'C', content: '4' },
        { key: 'D', content: '5' }
      ],
      answer: 'C',
      analysis: '采用真空饱和吸水性试验时，从有关资料分析，抽气3h和4h均未达到完全吸水稳定，但抽气3h与抽气4h两者之间的吸水率差值不大，所以规定抽气时间不得少于4h。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '抽气时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_138',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '采用煮沸饱和吸水性试验时，煮沸6h并未达到完全吸水稳定，但煮沸9h相对吸水量较小，所以规定煮沸时间不得少于（）h。',
      options: [
        { key: 'A', content: '4' },
        { key: 'B', content: '5' },
        { key: 'C', content: '6' },
        { key: 'D', content: '9' }
      ],
      answer: 'C',
      analysis: '采用煮沸饱和吸水性试验时，煮沸6h并未达到完全吸水稳定，但煮沸9h相对吸水量较小，所以规定煮沸时间不得少于6h。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '煮沸时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_139',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据岩石吸水率与饱和吸水率比较表，成都院科研所对砂岩进行30组试验，吸水率与饱和吸水率的比值平均值为（）。',
      options: [
        { key: 'A', content: '0.86' },
        { key: 'B', content: '0.88' },
        { key: 'C', content: '0.92' },
        { key: 'D', content: '0.97' }
      ],
      answer: 'D',
      analysis: '根据岩石吸水率与饱和吸水率比较表，成都院科研所对砂岩进行30组试验，吸水率与饱和吸水率的比值平均值为0.97，变化范围为0.8~1.0。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '吸水率', '砂岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_140',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据岩石吸水率与饱和吸水率比较表，东北院科研所对花岗岩进行42组试验，吸水率与饱和吸水率的比值平均值为（）。',
      options: [
        { key: 'A', content: '0.86' },
        { key: 'B', content: '0.88' },
        { key: 'C', content: '0.92' },
        { key: 'D', content: '0.97' }
      ],
      answer: 'A',
      analysis: '根据岩石吸水率与饱和吸水率比较表，东北院科研所对花岗岩进行42组试验，吸水率与饱和吸水率的比值平均值为0.86，变化范围为0.64~0.92。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '吸水率', '花岗岩'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_141',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '比重瓶法测定岩石的颗粒密度，又分为（）。',
      options: [
        { key: 'A', content: '土工试验方法' },
        { key: 'B', content: '岩石试验方法' },
        { key: 'C', content: '建筑材料试验方法' },
        { key: 'D', content: '水中称量法' }
      ],
      answer: 'A,B,C',
      analysis: '比重瓶法测定岩石的颗粒密度，又分为土工试验方法、岩石试验方法和建筑材料试验方法三种。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '颗粒密度', '比重瓶法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_142',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石颗粒密度试验主要仪器和设备包括（）。',
      options: [
        { key: 'A', content: '粉碎机、瓷研钵或玛瑙研钵' },
        { key: 'B', content: '磁铁块、筛（孔径0.25mm）' },
        { key: 'C', content: '天平（感量0.001g）、烘箱、干燥器' },
        { key: 'D', content: '短颈比重瓶（容积100mL）、温度计（量程0~50℃）' }
      ],
      answer: 'A,B,C,D',
      analysis: '岩石颗粒密度试验主要仪器和设备包括粉碎机、瓷研钵或玛瑙研钵、磁铁块、筛（孔径0.25mm）、天平（感量0.001g）、烘箱、干燥器、真空抽气设备或煮沸设备、短颈比重瓶（容积100mL）、温度计（量程0~50℃）、水中称量装置等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '试验设备'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_143',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '比重瓶法试验记录还应记录（）。',
      options: [
        { key: 'A', content: '比重瓶编号、试液温度' },
        { key: 'B', content: '试液密度、干岩粉质量' },
        { key: 'C', content: '瓶和试液总质量、瓶和试液及岩粉总质量' },
        { key: 'D', content: '试件在水中称量和水的密度' }
      ],
      answer: 'A,B,C',
      analysis: '比重瓶法试验记录还应记录比重瓶编号、试液温度、试液密度、干岩粉质量、瓶和试液总质量、瓶和试液及岩粉总质量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '试验记录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_144',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '水中称量法试验记录还应记录（）。',
      options: [
        { key: 'A', content: '试件干质量' },
        { key: 'B', content: '浸水后质量' },
        { key: 'C', content: '强制饱和后质量' },
        { key: 'D', content: '试件在水中称量和水的密度' }
      ],
      answer: 'A,B,C,D',
      analysis: '水中称量法试验记录还应记录试件干质量、浸水后质量、强制饱和后质量、试件在水中称量和水的密度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '试验记录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_145',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '关于代表性试件的选择，试件的代表性是反映测试成果正确与否的关键，特别是对于（）的岩石尤为重要。',
      options: [
        { key: 'A', content: '不均一的层状' },
        { key: 'B', content: '晶粒或粗粒结构' },
        { key: 'C', content: '均质细粒' },
        { key: 'D', content: '致密坚硬' }
      ],
      answer: 'A,B',
      analysis: '关于代表性试件的选择：试件的代表性是反映测试成果正确与否的关键，特别是对于不均一的层状、晶粒或粗粒结构的岩石尤为重要。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '试件选择'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_146',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '粉碎试件的方法：对于非磁性岩石试件，采用高强度耐磨优质钢磨盘粉碎，并用吸铁石吸出铁屑；对于磁性岩石试件应根据岩石的坚硬程度分别采用（）粉碎。',
      options: [
        { key: 'A', content: '瓷研钵' },
        { key: 'B', content: '玛瑙研钵' },
        { key: 'C', content: '钢磨盘' },
        { key: 'D', content: '球磨机' }
      ],
      answer: 'A,B',
      analysis: '粉碎试件的方法：对于非磁性岩石试件，采用高强度耐磨优质钢磨盘粉碎，并用吸铁石吸出铁屑；对于磁性岩石试件应根据岩石的坚硬程度分别采用瓷研钵或玛瑙研钵粉碎。采用这些规定，其目的在于防止铁屑对测试成果的影响。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '粉碎方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_147',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据不同粉碎方法的试验成果比较表，以下岩石中进行了瓷球粉碎和磨盘粉碎对比试验的有（）。',
      options: [
        { key: 'A', content: '褐霞灰�ite' },
        { key: 'B', content: '石英砂岩' },
        { key: 'C', content: '大理岩' },
        { key: 'D', content: '片麻岩' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据不同粉碎方法的试验成果比较表，褐霞灰岩、黄龙灰岩、石英砂岩、大理岩、变粒岩、片麻岩、粉砂质泥、红色砂岩等岩石都进行了瓷球粉碎和磨盘粉碎对比试验。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '颗粒密度', '粉碎方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_148',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据岩石吸水率与饱和吸水率比较表，黄委水科所采用真空饱和方法对以下岩石进行了试验（）。',
      options: [
        { key: 'A', content: '石灰岩' },
        { key: 'B', content: '片麻岩' },
        { key: 'C', content: '石英斑岩' },
        { key: 'D', content: '花岗岩' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据岩石吸水率与饱和吸水率比较表，黄委水科所采用真空饱和方法对石灰岩、片麻岩、石英斑岩、花岗岩、粉砂岩（I）、粉砂岩（II）等岩石进行了试验。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '吸水率', '真空饱和'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_149',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石颗粒密度是岩石固相物质的质量与体积的比值。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩石颗粒密度是岩石固相物质的质量与体积的比值，采用比重瓶法或水中称量法测定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '颗粒密度', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_150',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '土工试验方法和岩石试验方法的测试成果差别不大，但比建筑材料试验方法所得到的结果略偏大。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。土工试验方法和岩石试验方法主要区别在于，前者是在空气中称量，后者是在水中称量，两者的测试成果差别不大，但比建筑材料试验方法所得到的结果略偏大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '试验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_151',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '可以用块体密度试验的试件，即选用较大的试件制成岩粉，由此测定的岩石颗粒密度才更具有代表性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。可以用块体密度试验的试件，即选用较大的试件制成岩粉，由此测定的岩石颗粒密度才更具有代表性，根据实测岩石颗粒密度和块体密度所计算的空隙率才能比较真实地代表岩石的空隙情况。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '代表性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_152',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '对于非磁性岩石试件，采用高强度耐磨优质钢磨盘粉碎，并用吸铁石吸出铁屑。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。粉碎试件的方法：对于非磁性岩石试件，采用高强度耐磨优质钢磨盘粉碎，并用吸铁石吸出铁屑；对于磁性岩石试件应根据岩石的坚硬程度分别采用瓷研钵或玛瑙研钵粉碎。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '颗粒密度', '粉碎方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_153',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '湖北省地质局进行了不同粉碎方法的比较试验结果也证实了这一点。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。采用这些规定，其目的在于防止铁屑对测试成果的影响。湖北省地质局进行了不同粉碎方法的比较试验结果也证实了这一点。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '颗粒密度', '粉碎方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_154',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '试件的形态对岩石吸水率试验成果有一定的影响，水利部水利水电科学研究院对不同试件形态石灰岩吸水率的研究结果表明：不规则试件的吸水率是规则试件的2倍多。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。试件的形态对岩石吸水率试验成果有一定的影响，水利部水利水电科学研究院对不同试件形态石灰岩吸水率的研究结果表明：不规则试件的吸水率是规则试件的2倍多。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '试件形态'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_155',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '在大气压下吸水稳定标准，目前有时间控制和称量控制两种标准。经比较，这两种标准都能满足吸水性试验要求，但前者操作较为简单。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在大气压下吸水稳定标准，目前有时间控制和称量控制两种标准。经比较，这两种标准都能满足吸水性试验要求，但前者操作较为简单。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '稳定标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_156',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据不同试件形态的石灰岩吸水率测定成果比较表，5cm×5cm×5cm规则试件浸水饱和至恒重的平均吸水率为0.13%。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据不同试件形态的石灰岩吸水率测定成果比较表，5cm×5cm×5cm规则试件浸水饱和至恒重的平均吸水率为0.13%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '石灰岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_157',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据不同试件形态的石灰岩吸水率测定成果比较表，φ5cm×5cm圆柱体试件浸水饱和至恒重的平均吸水率也为0.13%。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据不同试件形态的石灰岩吸水率测定成果比较表，φ5cm×5cm圆柱体试件浸水饱和至恒重的平均吸水率也为0.13%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '石灰岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_158',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据岩石不同煮沸时间吸水情况比较表，大部分岩石煮沸6h时吸水百分比可达到90%以上。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据岩石不同煮沸时间吸水情况比较表，大部分岩石煮沸6h时吸水百分比可达到90%以上，如白云岩、灰岩、砾岩、花岗岩等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '煮沸时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_159',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据岩石不同抽气时间吸水情况比较表，砂岩抽气3h时吸水百分比大部分可达到90%以上。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据岩石不同抽气时间吸水情况比较表，砂岩抽气3h时吸水百分比大部分可达到90%以上。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '抽气时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_160',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '试验记录应包括工程名称、岩石名称、试件编号、试件描述、试验方法、试验人员、试验日期等。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。试验记录应包括工程名称、岩石名称、试件编号、试件描述、试验方法、试验人员、试验日期等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '颗粒密度', '试验记录'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
