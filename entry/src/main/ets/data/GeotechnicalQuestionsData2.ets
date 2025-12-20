/**
 * 岩土工程题目数据（第二部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（岩石、土工、土工合成材料）第3版 第二章 岩石物理性质试验
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目（第二部分）
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions2(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_041',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石物理性质是指岩石固有的物质组成和结构特征所决定的基本物理属性，不包括（）。',
      options: [
        { key: 'A', content: '含水率' },
        { key: 'B', content: '吸水率' },
        { key: 'C', content: '抗压强度' },
        { key: 'D', content: '块体密度' }
      ],
      answer: 'C',
      analysis: '岩石物理性质包括含水率、吸水率、颗粒密度、块体密度、膨胀性、耐崩解性和抗冻性等。抗压强度属于力学性质。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '物理性质', '基本概念'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_042',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石含水率试验中，岩石试件在（）温度下烘干至恒量时所失去水的质量与试件干质量的比值。',
      options: [
        { key: 'A', content: '60~70℃' },
        { key: 'B', content: '80~90℃' },
        { key: 'C', content: '105~110℃' },
        { key: 'D', content: '120~130℃' }
      ],
      answer: 'C',
      analysis: '岩石含水率是岩石试件在105~110℃温度下烘干至恒量时所失去水的质量与试件干质量的比值，以百分数表示。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '含水率', '试验温度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_043',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石含水率试验方法详见《水利水电工程岩石试验规程》（SL 264—2001）第（）页。',
      options: [
        { key: 'A', content: '5~6' },
        { key: 'B', content: '7~8' },
        { key: 'C', content: '9~10' },
        { key: 'D', content: '11~12' }
      ],
      answer: 'B',
      analysis: '岩石含水率试验方法详见《水利水电工程岩石试验规程》（SL 264—2001）第7~8页。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '含水率', '规程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_044',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石含水率试验中，主要试验仪器和设备包括烘箱、干燥器、天平（感量0.01g）和（）。',
      options: [
        { key: 'A', content: '量筒' },
        { key: 'B', content: '有密封盖的试件盒' },
        { key: 'C', content: '游标卡尺' },
        { key: 'D', content: '压力机' }
      ],
      answer: 'B',
      analysis: '岩石含水率试验主要试验仪器和设备包括烘箱、干燥器、天平（感量0.01g）、有密封盖的试件盒等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '含水率', '试验设备'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_045',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '含水率试验主要是针对黏土质、粉砂质和风化的软弱岩石在天然状态下的含水多少而制定的，对于坚硬或较坚硬的岩石，测定天然含水率的工程意义（）。',
      options: [
        { key: 'A', content: '很大' },
        { key: 'B', content: '较大' },
        { key: 'C', content: '一般' },
        { key: 'D', content: '不大' }
      ],
      answer: 'D',
      analysis: '含水率试验主要是针对黏土质、粉砂质和风化的软弱岩石在天然状态下的含水多少而制定的，对于坚硬或较坚硬的岩石，测定天然含水率的工程意义不大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '含水率', '工程意义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_046',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '对于不含结晶水矿物岩石试件在105~110℃恒温下烘（）h；对于含结晶水矿物的岩石试件，国际材料试验研究协会规定干燥温度不应超过40℃。',
      options: [
        { key: 'A', content: '12' },
        { key: 'B', content: '24' },
        { key: 'C', content: '36' },
        { key: 'D', content: '48' }
      ],
      answer: 'B',
      analysis: '对于不含结晶水矿物岩石试件在105~110℃恒温下烘24h；对于含结晶水矿物的岩石试件，国际材料试验研究协会规定干燥温度不应超过40℃。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '烘干时间', '试验规定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_047',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '我国规定含结晶水矿物岩石的烘烤温度是应在（）℃恒温下烘24h。',
      options: [
        { key: 'A', content: '30±5' },
        { key: 'B', content: '40±5' },
        { key: 'C', content: '50±5' },
        { key: 'D', content: '60±5' }
      ],
      answer: 'B',
      analysis: '为了统一这类岩石的烘烤温度，我国规定是应在40±5℃恒温下烘24h。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '烘烤温度', '结晶水矿物'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_048',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石试件烘干标准规定烘烤的试件在两次相邻称量之差不超过后一次称量的（）即为完全烘干。',
      options: [
        { key: 'A', content: '0.01%' },
        { key: 'B', content: '0.05%' },
        { key: 'C', content: '0.1%' },
        { key: 'D', content: '0.5%' }
      ],
      answer: 'C',
      analysis: '次称量的0.1%即为完全烘干。对于不同岩性的岩石试件，每次称量的烘干温度也不同。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '烘干标准', '称量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_049',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石自然吸水率是岩石在常温、常压条件下最大自由吸入水的质量与试件固有质量的比值，以（）表示。',
      options: [
        { key: 'A', content: '小数' },
        { key: 'B', content: '百分数' },
        { key: 'C', content: '千分数' },
        { key: 'D', content: '分数' }
      ],
      answer: 'B',
      analysis: '岩石自然吸水率是岩石在常温、常压条件下最大自由吸入水的质量与试件固有质量的比值，以百分数表示。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '自然吸水率', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_050',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石自然吸水率的大小取决于岩石中孔隙的大小及其连通性，岩石的自然吸水率越大，表明岩石中孔隙越大，连通性越好，岩石力学性质（）。',
      options: [
        { key: 'A', content: '越好' },
        { key: 'B', content: '越差' },
        { key: 'C', content: '不变' },
        { key: 'D', content: '无关' }
      ],
      answer: 'B',
      analysis: '岩石自然吸水率的大小取决于岩石中孔隙的大小及其连通性，岩石的自然吸水率越大，表明岩石中孔隙越大，连通性越好，岩石力学性质越差。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '自然吸水率', '力学性质'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_051',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石饱和吸水率是试件在强制饱和状态下的最大吸水量与试件固有质量的比值，一般采用（）或真空抽气法测定。',
      options: [
        { key: 'A', content: '浸泡法' },
        { key: 'B', content: '煮沸法' },
        { key: 'C', content: '滴定法' },
        { key: 'D', content: '称重法' }
      ],
      answer: 'B',
      analysis: '岩石饱和吸水率是试件在强制饱和状态下的最大吸水量与试件固有质量的比值，以百分数表示。一般采用煮沸法或真空抽气法测定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '饱和吸水率', '测定方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_052',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '饱和吸水率反映岩石内部的张开型孔隙和裂隙的发育程度，对岩石的（）能力有较大影响。',
      options: [
        { key: 'A', content: '抗压和抗拉' },
        { key: 'B', content: '抗冻性和抗风化' },
        { key: 'C', content: '抗剪和抗弯' },
        { key: 'D', content: '抗渗和抗侵蚀' }
      ],
      answer: 'B',
      analysis: '饱和吸水率反映岩石内部的张开型孔隙和裂隙的发育程度，对岩石的抗冻性和抗风化能力有较大影响。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '饱和吸水率', '影响'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_053',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石饱水系数是指岩石自然吸水率与饱和吸水率的比值，以（）表示。',
      options: [
        { key: 'A', content: '小数' },
        { key: 'B', content: '百分数' },
        { key: 'C', content: '千分数' },
        { key: 'D', content: '整数' }
      ],
      answer: 'B',
      analysis: '岩石饱水系数是指岩石自然吸水率与饱和吸水率的比值，以百分数表示。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '饱水系数', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_054',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性对岩石的风化程度比较敏感，在国外常作为（）指标，广泛地与其他物理力学特征值建立相关关系。',
      options: [
        { key: 'A', content: '强度' },
        { key: 'B', content: '变形' },
        { key: 'C', content: '风化' },
        { key: 'D', content: '密度' }
      ],
      answer: 'C',
      analysis: '岩石吸水性对岩石的风化程度比较敏感，在国外常作为风化指标，广泛地与其他物理力学特征值建立相关关系，并能有效地反映岩石微裂隙的发育程度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '风化指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_055',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '花岗岩的吸水率范围一般为（）。',
      options: [
        { key: 'A', content: '0.1~4.0%' },
        { key: 'B', content: '0.3~5.0%' },
        { key: 'C', content: '0.5~7.5%' },
        { key: 'D', content: '1.0~10.0%' }
      ],
      answer: 'A',
      analysis: '根据部分岩石的吸水率表，花岗岩的吸水率范围一般为0.1~4.0%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '吸水率', '花岗岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_056',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验方法详见《水利水电工程岩石试验规程》（SL 264—2001）第（）页。',
      options: [
        { key: 'A', content: '6~8' },
        { key: 'B', content: '8~10' },
        { key: 'C', content: '10~12' },
        { key: 'D', content: '12~14' }
      ],
      answer: 'B',
      analysis: '岩石吸水性试验方法详见《水利水电工程岩石试验规程》（SL 264—2001）第8~10页。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '吸水性', '规程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_057',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验每组试件块数不少于（）块。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '3' },
        { key: 'C', content: '5' },
        { key: 'D', content: '6' }
      ],
      answer: 'B',
      analysis: '岩石吸水性试验每组试件块数不少于3块。自然吸水率采用在大气压力和室温条件下自然吸水法测定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '试件数量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_058',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '自然吸水率采用在大气压力和室温条件下自然吸水法测定，试件全部浸入在水中自由吸水（）h。',
      options: [
        { key: 'A', content: '24' },
        { key: 'B', content: '36' },
        { key: 'C', content: '48' },
        { key: 'D', content: '72' }
      ],
      answer: 'C',
      analysis: '自然吸水率采用在大气压力和室温条件下自然吸水法测定，试件全部浸入在水中自由吸水48h。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '自然吸水率', '浸水时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_059',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石饱和吸水率采用煮沸法或真空抽气法测定，煮沸法煮沸时间不少于（）h。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '4' },
        { key: 'C', content: '6' },
        { key: 'D', content: '8' }
      ],
      answer: 'C',
      analysis: '岩石饱和吸水率采用煮沸法或真空抽气法测定，煮沸法煮沸时间不少于6h。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '饱和吸水率', '煮沸时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_060',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '真空抽气法真空压力宜为100kPa，抽气时间不少于（）h。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '4' },
        { key: 'C', content: '6' },
        { key: 'D', content: '8' }
      ],
      answer: 'B',
      analysis: '真空抽气法真空压力宜为100kPa，抽气时间不少于4h。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '真空抽气法', '抽气时间'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_061',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石物理性质试验包括（）。',
      options: [
        { key: 'A', content: '含水率试验' },
        { key: 'B', content: '吸水性试验' },
        { key: 'C', content: '颗粒密度试验' },
        { key: 'D', content: '块体密度试验' }
      ],
      answer: 'A,B,C,D',
      analysis: '相应的岩石物理性质试验包括含水率试验、吸水性试验、颗粒密度试验、块体密度试验、膨胀性试验、耐崩解性试验、冻融试验等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '物理性质', '试验类型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_062',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石含水率试验记录应包括（）。',
      options: [
        { key: 'A', content: '工程名称、岩石名称、试件编号' },
        { key: 'B', content: '试件描述、试验方法' },
        { key: 'C', content: '干试件质量、试件烘干前后的质量' },
        { key: 'D', content: '试验人员、试验日期' }
      ],
      answer: 'A,B,C,D',
      analysis: '试验记录应包括工程名称、岩石名称、试件编号、试件描述、试验方法、干试件质量、试件烘干前后的质量、试验人员、试验日期等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '含水率', '试验记录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_063',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '影响岩石试件天然含水率的因素很多，能否反映岩石在天然状态下的实际情况，取决于（）。',
      options: [
        { key: 'A', content: '岩石试件取样' },
        { key: 'B', content: '运输、储存' },
        { key: 'C', content: '试件制备过程中保存试件的方法' },
        { key: 'D', content: '试验温度' }
      ],
      answer: 'A,B,C',
      analysis: '影响岩石试件天然含水率的因素很多，能否反映岩石在天然状态下的实际情况，取决于岩石试件取样、运输、储存和试件制备过程中保存试件的方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '含水率', '影响因素'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_064',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性采用（）等指标表示。',
      options: [
        { key: 'A', content: '自然吸水率' },
        { key: 'B', content: '饱和吸水率' },
        { key: 'C', content: '饱水系数' },
        { key: 'D', content: '孔隙率' }
      ],
      answer: 'A,B,C',
      analysis: '岩石吸水性采用自然吸水率、饱和吸水率和饱水系数等指标表示。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_065',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石饱和吸水率试验目前采用（）方法进行，适用于遇水不崩解、不溶解和不干缩湿胀的岩石。',
      options: [
        { key: 'A', content: '自然浸泡法' },
        { key: 'B', content: '真空饱和法' },
        { key: 'C', content: '煮沸饱和法' },
        { key: 'D', content: '加压饱和法' }
      ],
      answer: 'B,C',
      analysis: '岩石饱和吸水率试验目前采用真空饱和和或煮沸饱和方法进行，适用于遇水不崩解、不溶解和不干缩湿胀的岩石。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '饱和吸水率', '试验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_066',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验中，试件可采用（）。',
      options: [
        { key: 'A', content: '规则试件' },
        { key: 'B', content: '不规则试件' },
        { key: 'C', content: '圆柱体或方柱体' },
        { key: 'D', content: '浑圆形或圆柱体岩块' }
      ],
      answer: 'A,B,C,D',
      analysis: '试件可采用规则试件或不规则试件，规则试件可采用圆柱体或方柱体，其尺寸为48~54mm，不规则试件采用40~50mm的浑圆形或圆柱体岩块，试件质量宜为150~200g。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '试件形状'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_067',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验程序对试验成果的影响十分显著，采用自由吸水法测定岩石自然吸水率时，首先淹没试件高度的（），然后每隔2h分别升高水面至试件的1/2和3/4处。',
      options: [
        { key: 'A', content: '1/4' },
        { key: 'B', content: '1/3' },
        { key: 'C', content: '1/2' },
        { key: 'D', content: '2/3' }
      ],
      answer: 'A',
      analysis: '岩石吸水性试验程序对试验成果的影响十分显著，采用自由吸水法测定岩石自然吸水率时，首先淹没试件高度的1/4，然后每隔2h分别升高水面至试件的1/2和3/4处，6h后水面全部浸没试件。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '吸水性', '试验程序'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_068',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石的自然吸水率与饱和吸水率之间存在着一定的差别，其差值的大小取决于（）。',
      options: [
        { key: 'A', content: '岩性' },
        { key: 'B', content: '吸水方式' },
        { key: 'C', content: '孔隙结构' },
        { key: 'D', content: '试验温度' }
      ],
      answer: 'A,B',
      analysis: '岩石的自然吸水率与饱和吸水率之间存在着一定的差别，其差值的大小取决于岩性和吸水方式，因此在岩石试验中，应该将两者加以区别。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水率', '差别'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_069',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '对于膨胀岩要做膨胀性试验，对于在干湿交替状态下的黏土岩类和风化岩石要做耐崩解性试验。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。对于膨胀岩要做膨胀性试验，对于在干湿交替状态下的黏土岩类和风化岩石要做耐崩解性试验，对于经常处于冻结和融解条件下的工程岩体，要进行冻融试验。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '物理性质', '试验类型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_070',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石的天然含水率反映了岩石在天然状态下的实际情况。含水量是指含水数量多少，是有单位的量，而含水率是一个比值，是无单位的量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩石的天然含水率反映了岩石在天然状态下的实际情况。含水量是指含水数量多少，是有单位的量，而含水率是一个比值，是无单位的量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '含水率', '含水量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_071',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '一般采用蜡封法或高分子树脂涂料法对岩石试件进行封闭，尽量减少其含水量的损失，保持其天然含水状态。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。一般采用蜡封法或高分子树脂涂料法对岩石试件进行封闭，尽量减少其含水量的损失，保持其天然含水状态。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '含水率', '保存方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_072',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '烘干标准对岩石试件天然含水率测定的影响比较明显。关于试件的烘干标准，目前国内外有关规程有两种规定：一种是时间控制，规定在指定的温度下烘若干小时；另一种是称量控制，规定在指定温度下烘至恒量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。烘干标准对岩石试件天然含水率测定的影响比较明显。关于试件的烘干标准，目前国内外有关规程有两种规定：一种是时间控制，规定在指定的温度下烘若干小时；另一种是称量控制，规定在指定温度下烘至恒量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '烘干标准', '规定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_073',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '通过岩石的吸水性试验，可以计算岩石的空隙率，部分岩石的空隙率见表2-5。',
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
      id: 'geotechnical_074',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石吸水性试验的吸水时间对其成果的影响不能忽视，从大量的试验资料分析，采用自由吸水进行吸水性试验时，当浸水时间为24h，岩石试块平均吸水量一般可达到绝对吸水量的85%。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩石吸水性试验的吸水时间对其成果的影响不能忽视，从大量的试验资料分析，采用自由吸水进行吸水性试验时，当浸水时间为24h，岩石试块平均吸水量一般可达到绝对吸水量的85%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '吸水时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_075',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '当浸水时间为48h，岩石试块平均吸水量一般可达到绝对吸水量的94%，继续浸水的吸水量很小。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。当浸水时间为48h，岩石试块平均吸水量一般可达到绝对吸水量的94%，继续浸水的吸水量很小。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '浸水时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_076',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '原水利部东北科研院对花岗岩的试验结果表明，浸水24h，吸水量平均为0.44g，24~48h增加了0.08g，48~72h只增加了0.02g，计算48h和72h的吸水率时，两者之差不大于0.01%。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。原水利部东北科研院对花岗岩的试验结果表明，浸水24h，吸水量平均为0.44g，24~48h增加了0.08g，48~72h只增加了0.02g，计算48h和72h的吸水率时，两者之差不大于0.01%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '吸水性', '花岗岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_077',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '由此看来，继续增加吸水时间的意义又不大，所以规程规定吸水性试验浸水时间为试件全部被水淹没后48h。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。由此看来，继续增加吸水时间的意义又不大，所以规程规定吸水性试验浸水时间为试件全部被水淹没后48h。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '吸水性', '浸水时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_078',
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
      id: 'geotechnical_079',
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
      id: 'geotechnical_080',
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
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '吸水性', '试验目的'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
