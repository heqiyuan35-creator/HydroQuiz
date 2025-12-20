/**
 * 量测题目数据 - 第四部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：量测（第3版）第四章 变形监测
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取量测题目（第四部分）
 * 单选题15题、多选题6题、判断题9题，共30题
 */
export function getSurveyMeasurementQuestions4(timestamp: number): Question[] {
  return [
    // ========== 单选题 15题 ==========
    {
      id: 'survey_111',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测是对建筑物及其地基在各种荷载作用下的变形进行观测和分析的工作，其目的是（）。',
      options: [
        { key: 'A', content: '保证建筑物的安全运行' },
        { key: 'B', content: '提高施工效率' },
        { key: 'C', content: '降低施工成本' },
        { key: 'D', content: '加快施工进度' }
      ],
      answer: 'A',
      analysis: '变形监测是对建筑物及其地基在各种荷载作用下的变形进行观测和分析的工作，其目的是保证建筑物的安全运行。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '目的'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_112',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '水平位移监测是监测建筑物在水平方向上的位移变化，常用的方法包括视准线法、引张线法和（）。',
      options: [
        { key: 'A', content: 'GPS法' },
        { key: 'B', content: '水准测量法' },
        { key: 'C', content: '三角高程法' },
        { key: 'D', content: '倾斜测量法' }
      ],
      answer: 'A',
      analysis: '水平位移监测是监测建筑物在水平方向上的位移变化，常用的方法包括视准线法、引张线法和GPS法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '水平位移'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_113',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '垂直位移监测是监测建筑物在垂直方向上的位移变化，最常用的方法是（）。',
      options: [
        { key: 'A', content: '精密水准测量' },
        { key: 'B', content: '视准线法' },
        { key: 'C', content: '引张线法' },
        { key: 'D', content: 'GPS法' }
      ],
      answer: 'A',
      analysis: '垂直位移监测是监测建筑物在垂直方向上的位移变化，最常用的方法是精密水准测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '垂直位移'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_114',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '倾斜监测是监测建筑物倾斜变化的工作，常用的方法包括垂线法、倾斜仪法和（）。',
      options: [
        { key: 'A', content: '测量法' },
        { key: 'B', content: '水准法' },
        { key: 'C', content: 'GPS法' },
        { key: 'D', content: '引张线法' }
      ],
      answer: 'A',
      analysis: '倾斜监测是监测建筑物倾斜变化的工作，常用的方法包括垂线法、倾斜仪法和测量法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '倾斜监测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_115',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '挠度监测是监测建筑物弯曲变形的工作，常用的方法是（）。',
      options: [
        { key: 'A', content: '精密水准测量' },
        { key: 'B', content: '视准线法' },
        { key: 'C', content: '引张线法' },
        { key: 'D', content: 'GPS法' }
      ],
      answer: 'A',
      analysis: '挠度监测是监测建筑物弯曲变形的工作，常用的方法是精密水准测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '挠度监测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_116',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '裂缝监测是监测建筑物裂缝变化的工作，常用的方法包括测缝计法、标尺法和（）。',
      options: [
        { key: 'A', content: '摄影测量法' },
        { key: 'B', content: '水准测量法' },
        { key: 'C', content: 'GPS法' },
        { key: 'D', content: '引张线法' }
      ],
      answer: 'A',
      analysis: '裂缝监测是监测建筑物裂缝变化的工作，常用的方法包括测缝计法、标尺法和摄影测量法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '裂缝监测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_117',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测的周期应根据（）确定。',
      options: [
        { key: 'A', content: '变形速率和工程重要性' },
        { key: 'B', content: '测量仪器精度' },
        { key: 'C', content: '施工进度' },
        { key: 'D', content: '施工成本' }
      ],
      answer: 'A',
      analysis: '变形监测的周期应根据变形速率和工程重要性确定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '监测周期'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_118',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测基准点应布设在（）。',
      options: [
        { key: 'A', content: '稳定区域' },
        { key: 'B', content: '变形区域' },
        { key: 'C', content: '施工区域' },
        { key: 'D', content: '任意位置' }
      ],
      answer: 'A',
      analysis: '变形监测基准点应布设在稳定区域，以保证监测数据的可靠性。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '基准点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_119',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测点应布设在（）。',
      options: [
        { key: 'A', content: '能反映变形特征的位置' },
        { key: 'B', content: '稳定区域' },
        { key: 'C', content: '任意位置' },
        { key: 'D', content: '施工方便的位置' }
      ],
      answer: 'A',
      analysis: '变形监测点应布设在能反映变形特征的位置，以获取有代表性的变形数据。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '监测点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_120',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测数据处理的目的是（）。',
      options: [
        { key: 'A', content: '分析变形规律和预测变形趋势' },
        { key: 'B', content: '提高测量精度' },
        { key: 'C', content: '减少测量工作量' },
        { key: 'D', content: '降低测量成本' }
      ],
      answer: 'A',
      analysis: '变形监测数据处理的目的是分析变形规律和预测变形趋势。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '数据处理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_121',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '视准线法是水平位移监测的常用方法，其原理是利用经纬仪或全站仪建立一条（）。',
      options: [
        { key: 'A', content: '视准线' },
        { key: 'B', content: '水准线' },
        { key: 'C', content: '引张线' },
        { key: 'D', content: '垂线' }
      ],
      answer: 'A',
      analysis: '视准线法是水平位移监测的常用方法，其原理是利用经纬仪或全站仪建立一条视准线，测量监测点相对于视准线的偏移量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '视准线法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_122',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '引张线法是水平位移监测的常用方法，其原理是利用（）建立一条基准线。',
      options: [
        { key: 'A', content: '钢丝' },
        { key: 'B', content: '光线' },
        { key: 'C', content: '激光' },
        { key: 'D', content: '水准尺' }
      ],
      answer: 'A',
      analysis: '引张线法是水平位移监测的常用方法，其原理是利用钢丝建立一条基准线，测量监测点相对于基准线的偏移量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '引张线法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_123',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '垂线法是倾斜监测的常用方法，分为正垂线和（）。',
      options: [
        { key: 'A', content: '倒垂线' },
        { key: 'B', content: '斜垂线' },
        { key: 'C', content: '水平线' },
        { key: 'D', content: '引张线' }
      ],
      answer: 'A',
      analysis: '垂线法是倾斜监测的常用方法，分为正垂线和倒垂线。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '垂线法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_124',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测报告应包括监测方案、监测数据、数据分析和（）。',
      options: [
        { key: 'A', content: '结论与建议' },
        { key: 'B', content: '施工进度' },
        { key: 'C', content: '施工成本' },
        { key: 'D', content: '人员安排' }
      ],
      answer: 'A',
      analysis: '变形监测报告应包括监测方案、监测数据、数据分析和结论与建议。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '监测报告'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_125',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '当变形监测数据出现异常时，应（）。',
      options: [
        { key: 'A', content: '及时复测并报告' },
        { key: 'B', content: '忽略异常数据' },
        { key: 'C', content: '修改数据' },
        { key: 'D', content: '停止监测' }
      ],
      answer: 'A',
      analysis: '当变形监测数据出现异常时，应及时复测并报告，以确保数据的可靠性和及时发现问题。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '异常处理'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 6题 ==========
    {
      id: 'survey_126',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测的内容包括（）。',
      options: [
        { key: 'A', content: '水平位移监测' },
        { key: 'B', content: '垂直位移监测' },
        { key: 'C', content: '倾斜监测' },
        { key: 'D', content: '裂缝监测' }
      ],
      answer: 'A,B,C,D',
      analysis: '变形监测的内容包括水平位移监测、垂直位移监测、倾斜监测、裂缝监测等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_127',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '水平位移监测的常用方法包括（）。',
      options: [
        { key: 'A', content: '视准线法' },
        { key: 'B', content: '引张线法' },
        { key: 'C', content: 'GPS法' },
        { key: 'D', content: '水准测量法' }
      ],
      answer: 'A,B,C',
      analysis: '水平位移监测的常用方法包括视准线法、引张线法和GPS法。水准测量法是垂直位移监测的方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '水平位移'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_128',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '倾斜监测的常用方法包括（）。',
      options: [
        { key: 'A', content: '垂线法' },
        { key: 'B', content: '倾斜仪法' },
        { key: 'C', content: '测量法' },
        { key: 'D', content: '水准测量法' }
      ],
      answer: 'A,B,C',
      analysis: '倾斜监测的常用方法包括垂线法、倾斜仪法和测量法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '倾斜监测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_129',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '裂缝监测的常用方法包括（）。',
      options: [
        { key: 'A', content: '测缝计法' },
        { key: 'B', content: '标尺法' },
        { key: 'C', content: '摄影测量法' },
        { key: 'D', content: 'GPS法' }
      ],
      answer: 'A,B,C',
      analysis: '裂缝监测的常用方法包括测缝计法、标尺法和摄影测量法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '裂缝监测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_130',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测报告应包括（）。',
      options: [
        { key: 'A', content: '监测方案' },
        { key: 'B', content: '监测数据' },
        { key: 'C', content: '数据分析' },
        { key: 'D', content: '结论与建议' }
      ],
      answer: 'A,B,C,D',
      analysis: '变形监测报告应包括监测方案、监测数据、数据分析和结论与建议。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '监测报告'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_131',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测基准点的要求包括（）。',
      options: [
        { key: 'A', content: '布设在稳定区域' },
        { key: 'B', content: '便于保存' },
        { key: 'C', content: '便于观测' },
        { key: 'D', content: '数量足够' }
      ],
      answer: 'A,B,C,D',
      analysis: '变形监测基准点的要求包括布设在稳定区域、便于保存、便于观测、数量足够。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '基准点'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 9题 ==========
    {
      id: 'survey_132',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测的目的是保证建筑物的安全运行。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。变形监测是对建筑物及其地基在各种荷载作用下的变形进行观测和分析的工作，其目的是保证建筑物的安全运行。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '目的'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_133',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '垂直位移监测最常用的方法是GPS法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。垂直位移监测最常用的方法是精密水准测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '垂直位移'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_134',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测基准点应布设在稳定区域。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。变形监测基准点应布设在稳定区域，以保证监测数据的可靠性。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '基准点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_135',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测点应布设在能反映变形特征的位置。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。变形监测点应布设在能反映变形特征的位置，以获取有代表性的变形数据。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '监测点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_136',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测的周期应根据测量仪器精度确定。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。变形监测的周期应根据变形速率和工程重要性确定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '监测周期'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_137',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '当变形监测数据出现异常时，应忽略异常数据。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。当变形监测数据出现异常时，应及时复测并报告，以确保数据的可靠性和及时发现问题。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '异常处理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_138',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '视准线法是水平位移监测的常用方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。视准线法是水平位移监测的常用方法，其原理是利用经纬仪或全站仪建立一条视准线。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '视准线法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_139',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '垂线法分为正垂线和倒垂线。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。垂线法是倾斜监测的常用方法，分为正垂线和倒垂线。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '垂线法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_140',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第四章 变形监测',
      content: '变形监测数据处理的目的是分析变形规律和预测变形趋势。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。变形监测数据处理的目的是分析变形规律和预测变形趋势。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形监测', '数据处理'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
