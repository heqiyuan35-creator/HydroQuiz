/**
 * 岩土工程题目数据（第七部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（地基与基础）第3版 标准贯入试验与动力触探试验
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目（第七部分）
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions7(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_241',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验（Standard Penetration Test，简称SPT）是一种在现场用（）kg的穿心锤进行的原位试验。',
      options: [
        { key: 'A', content: '50.0' },
        { key: 'B', content: '63.5' },
        { key: 'C', content: '75.0' },
        { key: 'D', content: '80.0' }
      ],
      answer: 'B',
      analysis: '标准贯入试验是一种在现场用63.5kg的穿心锤，以76cm的落距自由落下，将一定规格的带有小型取土筒的标准贯入器打入土中，记录打入30cm的锤击数（即标准贯入击数N），并以此评价土的工程性质的原位试验。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '标准贯入试验', '设备参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_242',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验的落锤落距为（）cm。',
      options: [
        { key: 'A', content: '50' },
        { key: 'B', content: '63.5' },
        { key: 'C', content: '76' },
        { key: 'D', content: '100' }
      ],
      answer: 'C',
      analysis: '标准贯入试验以76cm的落距自由落下，将标准贯入器打入土中。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '标准贯入试验', '设备参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_243',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验记录打入（）cm的锤击数作为标准贯入击数N。',
      options: [
        { key: 'A', content: '10' },
        { key: 'B', content: '20' },
        { key: 'C', content: '30' },
        { key: 'D', content: '50' }
      ],
      answer: 'C',
      analysis: '标准贯入试验记录打入30cm的锤击数（即标准贯入击数N），并以此评价土的工程性质。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '标准贯入试验', '试验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_244',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验实际上仍属于动力触探，所不同的是，其贯入器不是圆锥探头，而是标准规格的圆筒形探头（由两个半圆筒合成的取土器，见图2-28）。',
      options: [
        { key: 'A', content: '圆锥形探头' },
        { key: 'B', content: '圆筒形探头' },
        { key: 'C', content: '方形探头' },
        { key: 'D', content: '三角形探头' }
      ],
      answer: 'B',
      analysis: '标准贯入试验实际上仍属于动力触探，所不同的是，其贯入器不是圆锥探头，而是标准规格的圆筒形探头（由两个半圆筒合成的取土器）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '设备构造'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_245',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验操作简单，地层适应性广，对不易钻探取样的砂土和砂质粉土尤为适用，当土中含有较大碎石时使用受限制。标准贯入试验的缺点是（）。',
      options: [
        { key: 'A', content: '操作复杂' },
        { key: 'B', content: '适用范围窄' },
        { key: 'C', content: '离散性比较大' },
        { key: 'D', content: '成本高' }
      ],
      answer: 'C',
      analysis: '标准贯入试验的缺点是离散性比较大，故只能粗略地评定土的工程性质。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_246',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验设备主要由贯入器、触探杆（钻杆）和穿心锤三部分组成。贯入器的外径为（）mm。',
      options: [
        { key: 'A', content: '35' },
        { key: 'B', content: '42' },
        { key: 'C', content: '51' },
        { key: 'D', content: '76' }
      ],
      answer: 'C',
      analysis: '根据表2-23标准贯入试验设备，贯入器对开管的外径为51mm，内径为35mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '设备参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_247',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验设备中，贯入器对开管的内径为（）mm。',
      options: [
        { key: 'A', content: '35' },
        { key: 'B', content: '42' },
        { key: 'C', content: '51' },
        { key: 'D', content: '76' }
      ],
      answer: 'A',
      analysis: '根据表2-23标准贯入试验设备，贯入器对开管的外径为51mm，内径为35mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '设备参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_248',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验设备中，贯入器对开管的长度应大于（）mm。',
      options: [
        { key: 'A', content: '300' },
        { key: 'B', content: '400' },
        { key: 'C', content: '500' },
        { key: 'D', content: '600' }
      ],
      answer: 'C',
      analysis: '根据表2-23标准贯入试验设备，贯入器对开管的长度应大于500mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '设备参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_249',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验设备中，管靴刃口角度为（）°。',
      options: [
        { key: 'A', content: '10~15' },
        { key: 'B', content: '18~20' },
        { key: 'C', content: '25~30' },
        { key: 'D', content: '35~40' }
      ],
      answer: 'B',
      analysis: '根据表2-23标准贯入试验设备，管靴刃口角度为18~20°。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '设备参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_250',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验设备中，触探杆直径为（）mm。',
      options: [
        { key: 'A', content: '35' },
        { key: 'B', content: '42' },
        { key: 'C', content: '51' },
        { key: 'D', content: '76' }
      ],
      answer: 'B',
      analysis: '根据表2-23标准贯入试验设备，触探杆直径为42mm，相对弯曲小于1/1000。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '设备参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_251',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据我国《建筑地基基础设计规范》（GB 50007—2011），可采用重型圆锥动力触探的锤击数N63.5评定碎石土的密实度。当N63.5≤5时，碎石土的密实度为（）。',
      options: [
        { key: 'A', content: '松散' },
        { key: 'B', content: '稍密' },
        { key: 'C', content: '中密' },
        { key: 'D', content: '密实' }
      ],
      answer: 'A',
      analysis: '根据表2-15碎石土的密实度，当锤击数N63.5≤5时，密实度为松散。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '碎石土密实度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_252',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据碎石土密实度表，当5<N63.5≤10时，碎石土的密实度为（）。',
      options: [
        { key: 'A', content: '松散' },
        { key: 'B', content: '稍密' },
        { key: 'C', content: '中密' },
        { key: 'D', content: '密实' }
      ],
      answer: 'B',
      analysis: '根据表2-15碎石土的密实度，当5<N63.5≤10时，密实度为稍密。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '碎石土密实度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_253',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据碎石土密实度表，当10<N63.5≤20时，碎石土的密实度为（）。',
      options: [
        { key: 'A', content: '松散' },
        { key: 'B', content: '稍密' },
        { key: 'C', content: '中密' },
        { key: 'D', content: '密实' }
      ],
      answer: 'C',
      analysis: '根据表2-15碎石土的密实度，当10<N63.5≤20时，密实度为中密。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '碎石土密实度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_254',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据碎石土密实度表，当N63.5>20时，碎石土的密实度为（）。',
      options: [
        { key: 'A', content: '松散' },
        { key: 'B', content: '稍密' },
        { key: 'C', content: '中密' },
        { key: 'D', content: '密实' }
      ],
      answer: 'D',
      analysis: '根据表2-15碎石土的密实度，当N63.5>20时，密实度为密实。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '碎石土密实度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_255',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据N10与黏性土承载力标准值fk的关系表，当N10=15时，黏性土的承载力标准值fk约为（）kPa。',
      options: [
        { key: 'A', content: '85' },
        { key: 'B', content: '105' },
        { key: 'C', content: '145' },
        { key: 'D', content: '190' }
      ],
      answer: 'B',
      analysis: '根据表2-16 N10与黏性土承载力标准值fk的关系，当N10=15时，fk=105kPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_256',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据N10与素填土承载力标准值fk的关系表，当N10=20时，素填土的承载力标准值fk约为（）kPa。',
      options: [
        { key: 'A', content: '85' },
        { key: 'B', content: '115' },
        { key: 'C', content: '135' },
        { key: 'D', content: '160' }
      ],
      answer: 'B',
      analysis: '根据表2-17 N10与素填土承载力标准值fk的关系，当N10=20时，fk=115kPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_257',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据砾、粗、中砂的N63.5与容许承载力fk关系表，当N63.5=5时，砂土的容许承载力fk约为（）kPa。',
      options: [
        { key: 'A', content: '120' },
        { key: 'B', content: '150' },
        { key: 'C', content: '200' },
        { key: 'D', content: '240' }
      ],
      answer: 'C',
      analysis: '根据表2-19砾、粗、中砂的N63.5与容许承载力fk关系，当N63.5=5时，fk=200kPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_258',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据碎石土的N63.5与容许承载力fk关系表，当N63.5=6时，碎石土的容许承载力fk约为（）kPa。',
      options: [
        { key: 'A', content: '200' },
        { key: 'B', content: '240' },
        { key: 'C', content: '320' },
        { key: 'D', content: '400' }
      ],
      answer: 'B',
      analysis: '根据表2-20碎石土的N63.5与容许承载力fk关系，当N63.5=6时，fk=240kPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_259',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '圆锥动力触探试验资料的整理包括绘制试验击数随深度的变化曲线，结合钻探资料进行土层划分和计算单孔与场地各土层的平均贯入击数。对轻型动力触探按每贯入（）cm的击数绘制N10-h曲线。',
      options: [
        { key: 'A', content: '10' },
        { key: 'B', content: '20' },
        { key: 'C', content: '30' },
        { key: 'D', content: '50' }
      ],
      answer: 'C',
      analysis: '对轻型动力触探按每贯入30cm的击数绘制N10-h曲线；重型动力触探每贯入10cm的击数绘制N63.5-h或N\'63.5-h曲线。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '资料整理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_260',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '重型动力触探按每贯入（）cm的击数绘制N63.5-h曲线。',
      options: [
        { key: 'A', content: '10' },
        { key: 'B', content: '20' },
        { key: 'C', content: '30' },
        { key: 'D', content: '50' }
      ],
      answer: 'A',
      analysis: '重型动力触探每贯入10cm的击数绘制N63.5-h或N\'63.5-h曲线。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '资料整理'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_261',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验设备主要由（）组成。',
      options: [
        { key: 'A', content: '贯入器' },
        { key: 'B', content: '触探杆（钻杆）' },
        { key: 'C', content: '穿心锤' },
        { key: 'D', content: '锤垫' }
      ],
      answer: 'A,B,C',
      analysis: '标准贯入试验设备主要由贯入器、触探杆（钻杆）和穿心锤三部分组成。如图2-28所示。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '标准贯入试验', '设备组成'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_262',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准规格的贯入器由（）两部分组成探头。',
      options: [
        { key: 'A', content: '对开管' },
        { key: 'B', content: '管靴' },
        { key: 'C', content: '锤垫' },
        { key: 'D', content: '触探杆' }
      ],
      answer: 'A,B',
      analysis: '标准规格的贯入器由对开管和管靴两部分组成探头，对开管是由两个半圆筒合成的圆筒型取土器；管靴是一个底端带刃口的圆筒体。二者通过螺纹连接，管靴起到固定对开管的作用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '设备构造'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_263',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '利用圆锥动力触探试验成果，不仅可以用于定性评定场地地基土的均匀性，确定软弱土层和坚硬土层的分布，还可以（）。',
      options: [
        { key: 'A', content: '定量地评定地基土的状态或密实度' },
        { key: 'B', content: '估算地基土的力学性质' },
        { key: 'C', content: '直接测定地基土的物理力学性质' },
        { key: 'D', content: '评价地基土的承载力' }
      ],
      answer: 'A,B',
      analysis: '利用圆锥动力触探试验成果，不仅可以用于定性评定场地地基土的均匀性，确定软弱土层和坚硬土层的分布，还可以定量地评定地基土的状态或密实度，估算地基土的力学性质。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '工程应用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_264',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '圆锥动力触探试验成果的工程应用，包括（）。',
      options: [
        { key: 'A', content: '评定天然地基的承载力' },
        { key: 'B', content: '评定单桩承载力' },
        { key: 'C', content: '检验地基土加固效果' },
        { key: 'D', content: '直接测定地基土的物理力学性质' }
      ],
      answer: 'A,B,C',
      analysis: '圆锥动力触探试验成果的工程应用，包括评定天然地基的承载力、评定单桩承载力和检验地基土加固效果。关于圆锥动力触探在地基土加固效果检验中的应用，由于其与标准贯入试验的应用相似，将在标准贯入试验一章中详细论述。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '工程应用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_265',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '利用标准贯入试验指标N，结合地区经验，可用于（）。',
      options: [
        { key: 'A', content: '评价地基土的物理状态' },
        { key: 'B', content: '评价地基土的力学性能参数' },
        { key: 'C', content: '计算天然地基的承载力' },
        { key: 'D', content: '计算单桩的极限承载力及对场地成桩的可能性作出评价' }
      ],
      answer: 'A,B,C,D',
      analysis: '利用标准贯入试验指标N，结合地区经验，可用于评价地基土的物理状态，评价地基土的力学性能参数，计算天然地基的承载力，计算单桩的极限承载力及对场地成桩的可能性作出评价，评价场地砂土和粉土的液化可能性及等级。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '工程应用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_266',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据北京市地区经验，N10与地基土的承载力标准值fk、变形模量E0的关系表适用于（）等土类。',
      options: [
        { key: 'A', content: '填土（亚黏土）' },
        { key: 'B', content: '变质炉灰' },
        { key: 'C', content: '一般第四纪黏性土' },
        { key: 'D', content: '新近沉积黏性土' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据表2-18北京市地区经验，N10与地基土的承载力标准值fk、变形模量E0的关系适用于填土（亚黏土）、变质炉灰、一般第四纪黏性土、新近沉积黏性土、粉细砂轻亚黏土等土类。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_267',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '划分土层界线时，土层界限的划分要考虑动贯入阻力在土层变化附近的"超前"和"滞后"反应。当探头从软层进入硬层或从硬层进入软层，均有"超前"反应。所谓"超前"，即（）。',
      options: [
        { key: 'A', content: '探头尚未实际进入下面土层之前' },
        { key: 'B', content: '动贯入阻力就已"感知"土层的变化' },
        { key: 'C', content: '提前变大或变小' },
        { key: 'D', content: '反应的范围为探头直径的2~3倍' }
      ],
      answer: 'A,B,C,D',
      analysis: '当探头从软层进入硬层或从硬层进入软层，均有"超前"反应。所谓"超前"，即探头尚未实际进入下面土层之前，动贯入阻力就已"感知"土层的变化，提前变大或变小。反应的范围为探头直径的2~3倍。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '动力触探', '土层划分'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_268',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '穿心锤除了重量相同外，锤型不完全统一。有（）等类型。',
      options: [
        { key: 'A', content: '直筒型' },
        { key: 'B', content: '上小下大的锤型' },
        { key: 'C', content: '套筒型' },
        { key: 'D', content: '圆锥型' }
      ],
      answer: 'A,B,C',
      analysis: '穿心锤除了重量相同外，锤型不完全统一。有直筒型或上小下大的锤型，甚至套筒型，因此穿心锤的重心不一样，其与钻杆的摩擦也不一。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '设备类型'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_269',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验是一种在现场用63.5kg的穿心锤，以76cm的落距自由落下，将标准贯入器打入土中，记录打入30cm的锤击数的原位试验。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。标准贯入试验是一种在现场用63.5kg的穿心锤，以76cm的落距自由落下，将一定规格的带有小型取土筒的标准贯入器打入土中，记录打入30cm的锤击数（即标准贯入击数N），并以此评价土的工程性质的原位试验。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '标准贯入试验', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_270',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '与圆锥动力触探试验相似，标准贯入试验并不能直接测定地基土的物理力学性质，而是通过与其他原位测试手段或室内试验成果进行对比，建立关系式，积累地区经验，才能用于评定地基土的物理力学性质。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。与圆锥动力触探试验相似，标准贯入试验并不能直接测定地基土的物理力学性质，而是通过与其他原位测试手段或室内试验成果进行对比，建立关系式，积累地区经验，才能用于评定地基土的物理力学性质。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_271',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '国际土力学与基础工程协会（ICSMFE）于1957年成立专门委员会开展研究工作，以解决标准贯入试验的标准化问题，于1988年向第一届国际触探试验会议提出标准贯入试验国际标准建议稿，并于1989年获得通过，开始执行。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。国际土力学与基础工程协会（ICSMFE）于1957年成立专门委员会开展研究工作，以解决标准贯入试验的标准化问题，于1988年向第一届国际触探试验会议提出标准贯入试验国际标准建议稿，并于1989年获得通过，开始执行。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '发展历史'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_272',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '国际上多用直径为40~50mm的无缝钢管，我国则常用直径为42mm的工程地质钻杆做触探杆，在与穿心锤连接处设置一锤垫。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。国际上多用直径为40~50mm的无缝钢管，我国则常用直径为42mm的工程地质钻杆做触探杆，在与穿心锤连接处设置一锤垫。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '设备规格'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_273',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '对于一定相对密度的砂土，上覆压力对圆锥动力触探试验结果存在一个"临界深度"，即锤击数在此深度范围内随着贯入深度的增加而增大，超过此深度后，锤击数趋于稳定值，增加率减小。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。但对于一定相对密度的砂土，上覆压力对圆锥动力触探试验结果存在一个"临界深度"，即锤击数在此深度范围内随着贯入深度的增加而增大，超过此深度后，锤击数趋于稳定值，增加率减小，并且临界深度随着相对密度和探头直径的增加而增大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '上覆压力影响'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_274',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '对于一定粒度组成的砂土，动力触探击数N与相对密度Dr，和有效上覆压力σ\'v间存在一定的相关关系。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。对于一定粒度组成的砂土，动力触探击数N与相对密度Dr，和有效上覆压力σ\'v间存在一定的相关关系，即N/Dr²=a+bσ\'v，式中a、b为经验系数，随砂土的粒度组成变化。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '动力触探', '相关关系'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_275',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '利用动力触探的试验成果评价地基的承载力和变形模量，主要是依靠当地的经验积累，以及在经验基础上建立的统计关系式（或者以表格的形式给出）。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。利用动力触探的试验成果评价地基的承载力和变形模量，主要是依靠当地的经验积累，以及在经验基础上建立的统计关系式（或者以表格的形式给出）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '工程应用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_276',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '我国原《建筑地基基础设计规范》（GBJ 7—89）曾以附表的形式给出采用动力触探锤击数估算地基土承载力基本值的有关成果，但在修订的《建筑地基基础设计规范》（GBJ 50007—2002）及（GB 50007—2011）中，删去了这些表格。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。我国原《建筑地基基础设计规范》（GBJ 7—89）曾以附表的形式给出采用动力触探锤击数估算地基土承载力基本值的有关成果，但在修订的《建筑地基基础设计规范》（GBJ 50007—2002）及（GB 50007—2011）中，删去了这些表格。其主要原因在于部分地区的经验难以适应我国各个地区，或者无法用一个经验关系式来概括不同地区的经验和成果。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_277',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '可利用轻型动力触探指标N10估计黏性土和素填土的承载力标准值。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。可利用轻型动力触探指标N10估计黏性土和素填土的承载力标准值，见表2-16和表2-17。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '动力触探', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_278',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据表2-18的注释，处于饱和状态或地下水有可能上升到持力层以内时，粉细砂及轻亚黏土应按表列数值减小20%。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据表2-18的注释，处于饱和状态或地下水有可能上升到持力层以内时，粉细砂及轻亚黏土应按表列数值减小20%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '承载力修正'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_279',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据表2-18的注释，fk系数按基础宽小于3m，基础埋深小于0.5m的条件确定的。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据表2-18的注释，fk系数按基础宽小于3m，基础埋深小于0.5m的条件确定的。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_280',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '某小区7层住宅楼拟建场地，原有暗河东西向穿过，河底最深约3m，最宽约12m。设计采用换土垫层后再采用静压预制桩作基础。施工单位将原暗河部位杂填土及淤泥挖除后以3:7灰土分层碾压，回填至基底标高。每层以压路机来回碾压数遍。设计要求回填土承载力标准值为120kPa。轻便动力触探试验检测结果表明，压实灰土的承载力满足设计要求，大于120kPa。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。这是一个工程实例，轻型动力触探检测结果表明，压实灰土的承载力满足设计要求，大于120kPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '动力触探', '工程实例'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
