/**
 * 岩土工程题目数据（第八部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（地基与基础）第3版 标准贯入试验成果应用
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目（第八部分）
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions8(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_281',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据砂土的密实度表，当标准贯入试验锤击数N≤10时，砂土的密实度为（）。',
      options: [
        { key: 'A', content: '松散' },
        { key: 'B', content: '稍密' },
        { key: 'C', content: '中密' },
        { key: 'D', content: '密实' }
      ],
      answer: 'A',
      analysis: '根据表2-26砂土的密实度，当标准贯入试验锤击数N≤10时，砂土的密实度为松散；当10<N≤15时为稍密；当15<N≤30时为中密；当N>30时为密实。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '标准贯入试验', '砂土密实度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_282',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据砂土的密实度表，当标准贯入试验锤击数10<N≤15时，砂土的密实度为（）。',
      options: [
        { key: 'A', content: '松散' },
        { key: 'B', content: '稍密' },
        { key: 'C', content: '中密' },
        { key: 'D', content: '密实' }
      ],
      answer: 'B',
      analysis: '根据表2-26砂土的密实度，当10<N≤15时，砂土的密实度为稍密。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '标准贯入试验', '砂土密实度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_283',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据砂土的密实度表，当标准贯入试验锤击数N>30时，砂土的密实度为（）。',
      options: [
        { key: 'A', content: '松散' },
        { key: 'B', content: '稍密' },
        { key: 'C', content: '中密' },
        { key: 'D', content: '密实' }
      ],
      answer: 'D',
      analysis: '根据表2-26砂土的密实度，当N>30时，砂土的密实度为密实。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '标准贯入试验', '砂土密实度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_284',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据Terzaghi和Peck（1948）提出的黏性土N与稠度状态关系表，当N<2时，黏性土的稠度状态为（）。',
      options: [
        { key: 'A', content: '极软' },
        { key: 'B', content: '软' },
        { key: 'C', content: '中等' },
        { key: 'D', content: '硬' }
      ],
      answer: 'A',
      analysis: '根据表2-27黏性土N与稠度状态关系，当N<2时，稠度状态为极软，qu<25kPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '黏性土稠度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_285',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据黏性土N与稠度状态关系表，当N=15~30时，黏性土的稠度状态为（）。',
      options: [
        { key: 'A', content: '中等' },
        { key: 'B', content: '硬' },
        { key: 'C', content: '很硬' },
        { key: 'D', content: '坚硬' }
      ],
      answer: 'C',
      analysis: '根据表2-27黏性土N与稠度状态关系，当N=15~30时，稠度状态为很硬，qu=200~400kPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '黏性土稠度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_286',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据N与液性指数IL的经验关系表，当N<2时，黏性土的液性指数IL（）。',
      options: [
        { key: 'A', content: '>1' },
        { key: 'B', content: '0.75~0.5' },
        { key: 'C', content: '0.5~0.25' },
        { key: 'D', content: '<0' }
      ],
      answer: 'A',
      analysis: '根据表2-28 N与液性指数IL的经验关系，当N<2时，IL>1，稠度状态为流动。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '液性指数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_287',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据N与液性指数IL的经验关系表，当N>35时，黏性土的稠度状态为（）。',
      options: [
        { key: 'A', content: '软可塑' },
        { key: 'B', content: '硬可塑' },
        { key: 'C', content: '硬塑' },
        { key: 'D', content: '坚硬' }
      ],
      answer: 'D',
      analysis: '根据表2-28 N与液性指数IL的经验关系，当N>35时，IL<0，稠度状态为坚硬。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '液性指数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_288',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: 'Peck的经验关系式φ=0.3N+27用于评定砂土的（）。',
      options: [
        { key: 'A', content: '压缩模量' },
        { key: 'B', content: '内摩擦角' },
        { key: 'C', content: '黏聚力' },
        { key: 'D', content: '变形模量' }
      ],
      answer: 'B',
      analysis: 'Peck的经验关系式为φ=0.3N+27，用于评定砂土的内摩擦角φ。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '强度指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_289',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据Meyerhof的经验关系式，当4≤N≤10时，砂土内摩擦角φ=（）。',
      options: [
        { key: 'A', content: '(5/6)N+26(2/3)' },
        { key: 'B', content: '(1/4)N+32(1/4)' },
        { key: 'C', content: '0.3N+27' },
        { key: 'D', content: '0.5N+25' }
      ],
      answer: 'A',
      analysis: '根据Meyerhof的经验关系式，当4≤N≤10时，φ=(5/6)N+26(2/3)；当N>10时，φ=(1/4)N+32(1/4)。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '标准贯入试验', '强度指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_290',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据Terzaghi和Peck的经验关系式，黏性土的不排水抗剪强度cu=（）N。',
      options: [
        { key: 'A', content: '(3.0~4.5)' },
        { key: 'B', content: '(5~6)' },
        { key: 'C', content: '(6.0~6.5)' },
        { key: 'D', content: '(8.0~10.0)' }
      ],
      answer: 'C',
      analysis: '根据标准贯入试验锤击数N评定黏性土的不排水抗剪强度cu，Terzaghi和Peck的经验关系式为cu=(6.0~6.5)N。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '强度指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_291',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '新加坡张明芳给出的花岗岩残积土的不排水抗剪强度cu与标准贯入试验锤击数N的经验关系式为cu=（）N。',
      options: [
        { key: 'A', content: '(3~4)' },
        { key: 'B', content: '(5~6)' },
        { key: 'C', content: '(6.0~6.5)' },
        { key: 'D', content: '(8~10)' }
      ],
      answer: 'B',
      analysis: '新加坡张明芳给出的标准贯入试验锤击数N与花岗岩残积土的不排水抗剪强度cu之间的经验关系式为cu=(5~6)N。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '强度指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_292',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '希腊的Schultze和Menzenbach提出的基于标准贯入试验锤击数估计压缩模量的经验关系，当N≥15时，Es=（）。',
      options: [
        { key: 'A', content: 'β(N+6)' },
        { key: 'B', content: '4.0+β(N-6)' },
        { key: 'C', content: 'α+βN' },
        { key: 'D', content: '1.04N+4.89' }
      ],
      answer: 'B',
      analysis: '希腊的Schultze和Menzenbach提出的基于标准贯入试验锤击数估计压缩模量的经验关系为：当N≥15时，Es=4.0+β(N-6)；当N<15时，Es=β(N+6)。其中Es为压缩模量（MPa），β为经验系数。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '标准贯入试验', '变形参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_293',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据不同土类的经验系数β值表，含砂粉土的β值为（）。',
      options: [
        { key: 'A', content: '0.3' },
        { key: 'B', content: '0.45' },
        { key: 'C', content: '0.7' },
        { key: 'D', content: '1.0' }
      ],
      answer: 'B',
      analysis: '根据表2-29不同土类的经验系数β值，含砂粉土的β值为0.3，细砂为0.35，中砂为0.45，粗砂为0.7，含硬砂土为1.0，含砾砂土为1.2。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '变形参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_294',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据不同土类的α和β值表，砂土地下水位以上时α值为（）。',
      options: [
        { key: 'A', content: '3.9' },
        { key: 'B', content: '4.3' },
        { key: 'C', content: '5.2' },
        { key: 'D', content: '7.1' }
      ],
      answer: 'A',
      analysis: '根据表2-30不同土类的α和β值，砂土的α值为3.9，β值为0.45。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '变形参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_295',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据不同土类的α和β值表，细砂地下水位以上时α值为（），地下水位以下时α值为（）。',
      options: [
        { key: 'A', content: '3.8和2.4' },
        { key: 'B', content: '5.2和7.1' },
        { key: 'C', content: '4.3和3.9' },
        { key: 'D', content: '7.1和5.2' }
      ],
      answer: 'B',
      analysis: '根据表2-30不同土类的α和β值，细砂地下水位以上时α值为5.2，地下水位以下时α值为7.1。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '变形参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_296',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '冶金部武汉勘察公司建立的N与E0、Es的经验关系式Es=1.04N+4.89适用于（）。',
      options: [
        { key: 'A', content: '粉土' },
        { key: 'B', content: '中南、华东地区黏性土' },
        { key: 'C', content: '武汉地区黏性土、粉土' },
        { key: 'D', content: '唐山粉细砂' }
      ],
      answer: 'B',
      analysis: '根据表2-31 N与E0、Es的经验关系，冶金部武汉勘察公司的关系式Es=1.04N+4.89适用于中南、华东地区黏性土。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '变形参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_297',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '我国《建筑抗震设计规范》（GB 50011—2010）中规定，当饱和砂土、粉土的初步判别认为需进一步进行液化判别时，应采用标准贯入试验判别法判别地面下（）m范围内土的液化。',
      options: [
        { key: 'A', content: '10' },
        { key: 'B', content: '15' },
        { key: 'C', content: '20' },
        { key: 'D', content: '25' }
      ],
      answer: 'C',
      analysis: '我国《建筑抗震设计规范》（GB 50011—2010）中规定，当饱和砂土、粉土的初步判别认为需进一步进行液化判别时，应采用标准贯入试验判别法判别地面下20m范围内土的液化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '液化判别'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_298',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据液化判别标准贯入锤击数基准值N0表，当设计基本地震加速度为0.15g时，液化判别标准贯入锤击数基准值N0为（）。',
      options: [
        { key: 'A', content: '7' },
        { key: 'B', content: '10' },
        { key: 'C', content: '12' },
        { key: 'D', content: '16' }
      ],
      answer: 'B',
      analysis: '根据表2-32液化判别标准贯入锤击数基准值N0，当设计基本地震加速度为0.10g时N0=7，0.15g时N0=10，0.20g时N0=12，0.30g时N0=16，0.40g时N0=19。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '液化判别'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_299',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据N值与砂土承载力标准值fk的关系表，当N=15时，中、粗砂的承载力标准值fk约为（）kPa。',
      options: [
        { key: 'A', content: '180' },
        { key: 'B', content: '250' },
        { key: 'C', content: '340' },
        { key: 'D', content: '500' }
      ],
      answer: 'B',
      analysis: '根据表2-33 N值与砂土承载力标准值fk的关系，当N=15时，中、粗砂的fk=250kPa，粉、细砂的fk=180kPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_300',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: 'Terzaghi建议的计算地基承载力（安全系数取3）的经验关系式，对于条形基础fk=（）N。',
      options: [
        { key: 'A', content: '10' },
        { key: 'B', content: '12' },
        { key: 'C', content: '15' },
        { key: 'D', content: '18' }
      ],
      answer: 'B',
      analysis: 'Terzaghi建议的计算地基承载力（安全系数取3）的经验关系式为：对于条形基础fk=12N；对于独立方形基础fk=15N。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_301',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验成果整理时，试验资料应当齐全，包括（）等内容。',
      options: [
        { key: 'A', content: '钻孔孔径、钻进方式、护孔方式' },
        { key: 'B', content: '落锤方式、地下水位及孔内水位（或泥浆高程）' },
        { key: 'C', content: '初始贯入度、预打击数、试验标准贯入击数' },
        { key: 'D', content: '记录深度、贯入器所取扰动土样的鉴别描述' }
      ],
      answer: 'A,B,C,D',
      analysis: '标准贯入试验成果整理时，试验资料应当齐全，包括钻孔孔径、钻进方式、护孔方式、落锤方式、地下水位及孔内水位（或泥浆高程）、初始贯入度、预打击数、试验标准贯入击数，以及记录深度、贯入器所取扰动土样的鉴别描述。若做过锤击能量标定试验，应有F(i)-i曲线。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '成果整理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_302',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '利用标准贯入试验成果评定土的物理状态，可以（）。',
      options: [
        { key: 'A', content: '评定砂土的相对密度Dr和密实状态' },
        { key: 'B', content: '评定黏性土的稠度状态' },
        { key: 'C', content: '评定土的强度指标' },
        { key: 'D', content: '评定土的变形参数' }
      ],
      answer: 'A,B',
      analysis: '利用标准贯入试验成果评定土的物理状态，主要包括：评定砂土的相对密度Dr和密实状态；评定黏性土的稠度状态。评定土的强度指标和变形参数属于评定土的力学性质。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '物理状态'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_303',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '采用标准贯入试验成果评定土的强度指标，可以评定（）。',
      options: [
        { key: 'A', content: '砂土的内摩擦角φ' },
        { key: 'B', content: '黏性土的不排水抗剪强度cu' },
        { key: 'C', content: '砂土的相对密度Dr' },
        { key: 'D', content: '黏性土的液性指数IL' }
      ],
      answer: 'A,B',
      analysis: '采用标准贯入试验成果评定土的强度指标，可以评定砂土的内摩擦角φ和黏性土的不排水抗剪强度cu。砂土的相对密度Dr和黏性土的液性指数IL属于物理状态指标。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '强度指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_304',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '国内一些勘察设计单位根据标准贯入试验成果建立的评定土的变形参数的经验关系式，适用土类包括（）。',
      options: [
        { key: 'A', content: '中南、华东地区黏性土' },
        { key: 'B', content: '黏性土、粉土' },
        { key: 'C', content: '武汉地区黏性土、粉土' },
        { key: 'D', content: '唐山粉细砂' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据表2-31，国内一些勘察设计单位根据标准贯入试验成果建立的评定土的变形参数的经验关系式，适用土类包括：冶金部武汉勘察公司的中南、华东地区黏性土；湖北省水利电力勘察设计院的黏性土、粉土；武汉城市规划设计院的武汉地区黏性土、粉土；西南综合勘察院的唐山粉细砂。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '变形参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_305',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验成果的工程应用包括（）。',
      options: [
        { key: 'A', content: '地基土的液化判别' },
        { key: 'B', content: '评定地基土的承载力' },
        { key: 'C', content: '确定单桩承载力' },
        { key: 'D', content: '地基处理效果检测' }
      ],
      answer: 'A,B,C,D',
      analysis: '标准贯入试验成果的工程应用包括：地基土的液化判别、评定地基土的承载力、确定单桩承载力、地基处理效果检测等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '标准贯入试验', '工程应用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_306',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '北京市勘察设计研究院提出的利用标准贯入击数估算单桩承载力的经验公式Qu=pbAp+(ΣpkLc+ΣpsLs)U+C1-C2x中，C1为经验参数，其取值与（）有关。',
      options: [
        { key: 'A', content: '桩型' },
        { key: 'B', content: '土层条件' },
        { key: 'C', content: '桩周有无新近堆积土' },
        { key: 'D', content: '桩的截面面积' }
      ],
      answer: 'A,B,C',
      analysis: '根据表2-37经验参数C1，预制桩桩周有新近堆积土时C1=340kN，桩周无新近堆积土时C1=150kN；钻孔灌注桩桩周无新近堆积土时C1=180kN。可见C1的取值与桩型、土层条件、桩周有无新近堆积土有关。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '标准贯入试验', '单桩承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_307',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验是常用的地基处理效果检测试验手段之一，可用于检测（）等地基处理方法的效果。',
      options: [
        { key: 'A', content: '强夯法' },
        { key: 'B', content: '堆载预压法' },
        { key: 'C', content: '水泥土搅拌法处理软土地基' },
        { key: 'D', content: '振冲法' }
      ],
      answer: 'A,B,C,D',
      analysis: '标准贯入试验是常用的地基处理效果检测试验手段之一。无论是强夯法、堆载预压法，还是水泥土搅拌法处理软土地基，都可以采用标准贯入试验手段，通过对比地基处理前后地基土的试验指标，对地基处理效果（质量）及其影响范围作出评定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '地基处理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_308',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据N与pk、ps和pb的关系表，当N=12时，预制桩的（）。',
      options: [
        { key: 'A', content: 'pk=78kPa' },
        { key: 'B', content: 'ps=1760kPa' },
        { key: 'C', content: 'pb=53kPa' },
        { key: 'D', content: 'pb=450kPa' }
      ],
      answer: 'A,B',
      analysis: '根据表2-36 N与pk、ps和pb的关系，当N=12时，预制桩的pk=78kPa，ps=1760kPa；钻孔灌注桩的pk=40kPa，pb=450kPa。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '标准贯入试验', '单桩承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_309',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '工程勘察中，标准贯入试验的试验深度最大已超过100m，试验成果（N值）仍能较好地反映土层的物理力学性质的变化。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。工程勘察中，标准贯入试验的试验深度最大已超过100m，试验成果（N值）仍能较好地反映土层的物理力学性质的变化。可见只要操作得当，并没发现锤击能量随着杆长增加而被吸收的情形。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '试验深度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_310',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '有些研究者认为，应考虑试验深度处上的围压对试验成果的影响，认为随着土层中上覆压力增大，标准贯入试验锤击数相应地增大，应采用上覆压力修正。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。有些研究者认为，应考虑试验深度处上的围压对试验成果的影响，认为随着土层中上覆压力增大，标准贯入试验锤击数相应地增大，应采用N1=cNN进行修正，其中N1为修正为上覆压力σ\'v0=100kPa的标准贯入试验击数，cN为上覆压力修正系数。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '上覆压力修正'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_311',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '目前，国内外用于砂土液化评价的现场试验手段主要有标准贯入试验和静力触探试验。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。目前，国内外用于砂土液化评价的现场试验手段主要有标准贯入试验和静力触探试验。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '标准贯入试验', '液化判别'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_312',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '由于标准贯入试验离散性较大，因此在应用中，不应根据单孔的N值对土的工程性质进行评价。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。标准贯入试验在国内外工程设计中已得到了十分广泛的应用，但由于标准贯入试验离散性较大，因此在应用中，不应根据单孔的N值对土的工程性质进行评价。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '应用注意'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_313',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '在应用标准贯入锤击数N的经验关系式评定土的有关工程性能时，要注意作为计算依据的N值是否做过有关修正。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。同样地，在应用标准贯入锤击数N的经验关系式评定土的有关工程性能时，要注意作为计算依据的N值是否做过有关修正。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '应用注意'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_314',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '标准贯入试验锤击数与土性指标之间的统计关系式同样具有地区特征，不应照抄照搬，使用以下的经验关系式时应与当地的地区经验相结合。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。但是，标准贯入试验锤击数与土性指标（下文的砂土和黏性土强度与变形指标）之间的统计关系式同样具有地区特征，不应照抄照搬。使用以下的经验关系式时应与当地的地区经验相结合。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '地区经验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_315',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '国家岩土工程勘察和地基基础设计规范没有关于利用标准贯入试验结果确定单桩的承载力的规定，但已积累了大量的工程经验后，可以用标准贯入击数来估计单桩承载力。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。国家岩土工程勘察和地基基础设计规范没有关于利用标准贯入试验结果确定单桩的承载力的规定，但已积累了大量的工程经验后，可以用标准贯入击数来估计单桩承载力。例如，北京市勘察设计研究院提出利用如下的经验公式估算单桩承载力。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '单桩承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_316',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '济南某机场扩建工程拟采用强夯加固浅层软土地基，通过包括SPT在内的原位测试手段检验强夯处理效果。从标贯试验测试结果进行分析，在1.0~6.0m深度范围内，强夯处理后，各试验小区内标贯击数均有明显提高。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。这是一个工程实例。济南某机场扩建工程拟采用强夯加固浅层软土地基，通过包括SPT在内的原位测试手段检验强夯处理效果。从标贯试验测试结果进行分析，在1.0~6.0m深度范围内，强夯处理后，各试验小区内标贯击数均有明显提高，强夯加固效果明显，在1.0~3.5m范围内效果尤其显著，但在6.0m以下，地基土的改善效果不明显。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '工程实例'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_317',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据经验参数C1表，预制桩桩周有新近堆积土时C1=340kN，桩周无新近堆积土时C1=150kN。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据表2-37经验参数C1，预制桩桩周有新近堆积土时C1=340kN，桩周无新近堆积土时C1=150kN；钻孔灌注桩桩周无新近堆积土时C1=180kN。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '单桩承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_318',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '在《建筑地基基础设计规范》（GB 50007—2011）中，删去了利用动力触探锤击数估算地基土承载力基本值的经验表格，这并不是否认这些经验的使用价值，而是这些经验在全国范围内不具有普遍意义。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在《建筑地基基础设计规范》（GB 50007—2011）中，删去了这些表格。其主要原因在于部分地区的经验难以适应我国各个地区，或者无法用一个经验关系式来概括不同地区的经验和成果。这并不是否认这些经验的使用价值，而是这些经验在全国范围内不具有普遍意义。读者在参考这些表格时应结合当地实践经验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_319',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '将式(2-53)和式(2-54)用于粉砂时应减5°，用于粗、砾砂应加5°。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。Meyerhof的经验关系式(2-53)和式(2-54)用于粉砂时应减5°，用于粗、砾砂应加5°。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '标准贯入试验', '强度指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_320',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基原位测试',
      content: '根据液化判别公式，液化判别标准贯入锤击数临界值Ncr的计算需要考虑液化判别标准贯入锤击数基准值N0、饱和土标准贯入点深度ds、地下水位dw、黏粒含量百分数ρc和调整系数β等因素。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在地面下20m深度范围内，液化判别标准贯入锤击数临界值可按下式计算：Ncr=N0β[ln(0.6ds+1.5)-0.1dw]√(3/ρc)。式中Ncr为液化判别标准贯入锤击数临界值；N0为液化判别标准贯入锤击数基准值；ds为饱和土标准贯入点深度(m)；dw为地下水位(m)；ρc为黏粒含量百分数，当小于3或为砂土时，应采用3；β为调整系数。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '标准贯入试验', '液化判别'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
