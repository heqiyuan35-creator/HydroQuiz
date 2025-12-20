/**
 * 量测题目数据 - 第三部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：量测（第3版）第三章 施工放样
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取量测题目（第三部分）
 * 单选题15题、多选题6题、判断题9题，共30题
 */
export function getSurveyMeasurementQuestions3(timestamp: number): Question[] {
  return [
    // ========== 单选题 15题 ==========
    {
      id: 'survey_081',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '施工放样是将设计图纸上的建筑物位置在实地标定出来的测量工作，也称为（）。',
      options: [
        { key: 'A', content: '测设' },
        { key: 'B', content: '测图' },
        { key: 'C', content: '测量' },
        { key: 'D', content: '测绘' }
      ],
      answer: 'A',
      analysis: '施工放样是将设计图纸上的建筑物位置在实地标定出来的测量工作，也称为测设。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '概念'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_082',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '施工放样的基本工作包括放样数据准备、（）和放样点位标定。',
      options: [
        { key: 'A', content: '放样方法选择' },
        { key: 'B', content: '放样精度分析' },
        { key: 'C', content: '放样仪器检校' },
        { key: 'D', content: '以上都是' }
      ],
      answer: 'D',
      analysis: '施工放样的基本工作包括放样数据准备、放样方法选择、放样精度分析、放样仪器检校和放样点位标定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', '基本工作'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_083',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '平面位置放样的基本方法包括极坐标法、直角坐标法、角度交会法和（）。',
      options: [
        { key: 'A', content: '距离交会法' },
        { key: 'B', content: '水准测量法' },
        { key: 'C', content: '三角高程法' },
        { key: 'D', content: 'GPS定位法' }
      ],
      answer: 'A',
      analysis: '平面位置放样的基本方法包括极坐标法、直角坐标法、角度交会法和距离交会法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', '平面放样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_084',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '高程放样的基本方法包括水准测量法和（）。',
      options: [
        { key: 'A', content: '极坐标法' },
        { key: 'B', content: '三角高程法' },
        { key: 'C', content: '角度交会法' },
        { key: 'D', content: '距离交会法' }
      ],
      answer: 'B',
      analysis: '高程放样的基本方法包括水准测量法和三角高程法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '高程放样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_085',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '极坐标法放样是根据一个已知点和一个已知方向，通过测设（）来确定放样点位置的方法。',
      options: [
        { key: 'A', content: '角度和距离' },
        { key: 'B', content: '两个角度' },
        { key: 'C', content: '两个距离' },
        { key: 'D', content: '坐标差' }
      ],
      answer: 'A',
      analysis: '极坐标法放样是根据一个已知点和一个已知方向，通过测设角度和距离来确定放样点位置的方法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '极坐标法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_086',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '全站仪放样是目前最常用的放样方法，其优点是（）。',
      options: [
        { key: 'A', content: '精度高、速度快、操作简便' },
        { key: 'B', content: '不需要通视' },
        { key: 'C', content: '不受天气影响' },
        { key: 'D', content: '可以全天候作业' }
      ],
      answer: 'A',
      analysis: '全站仪放样是目前最常用的放样方法，其优点是精度高、速度快、操作简便。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '全站仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_087',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: 'GPS-RTK放样的优点是（）。',
      options: [
        { key: 'A', content: '不需要通视、作业效率高' },
        { key: 'B', content: '精度最高' },
        { key: 'C', content: '设备简单' },
        { key: 'D', content: '成本最低' }
      ],
      answer: 'A',
      analysis: 'GPS-RTK放样的优点是不需要通视、作业效率高，适用于大范围的施工放样。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', 'GPS-RTK'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_088',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '建筑物轴线放样是施工放样的重要内容，轴线放样的精度直接影响（）。',
      options: [
        { key: 'A', content: '建筑物的位置精度' },
        { key: 'B', content: '建筑物的高程精度' },
        { key: 'C', content: '建筑物的变形监测' },
        { key: 'D', content: '建筑物的竣工测量' }
      ],
      answer: 'A',
      analysis: '建筑物轴线放样是施工放样的重要内容，轴线放样的精度直接影响建筑物的位置精度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', '轴线放样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_089',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '坡面放样是将设计坡面在实地标定出来的测量工作，常用的方法是（）。',
      options: [
        { key: 'A', content: '坡度板法' },
        { key: 'B', content: '极坐标法' },
        { key: 'C', content: '角度交会法' },
        { key: 'D', content: '距离交会法' }
      ],
      answer: 'A',
      analysis: '坡面放样是将设计坡面在实地标定出来的测量工作，常用的方法是坡度板法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', '坡面放样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_090',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '曲线放样是将设计曲线在实地标定出来的测量工作，常用的方法包括偏角法、切线支距法和（）。',
      options: [
        { key: 'A', content: '坐标法' },
        { key: 'B', content: '水准法' },
        { key: 'C', content: '三角法' },
        { key: 'D', content: '导线法' }
      ],
      answer: 'A',
      analysis: '曲线放样是将设计曲线在实地标定出来的测量工作，常用的方法包括偏角法、切线支距法和坐标法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', '曲线放样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_091',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '放样精度分析的目的是（）。',
      options: [
        { key: 'A', content: '确定放样方法和仪器' },
        { key: 'B', content: '确定放样点位' },
        { key: 'C', content: '确定放样数据' },
        { key: 'D', content: '确定放样时间' }
      ],
      answer: 'A',
      analysis: '放样精度分析的目的是确定放样方法和仪器，以满足设计精度要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', '精度分析'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_092',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '放样点位标定后，应进行（）以确保放样精度。',
      options: [
        { key: 'A', content: '检核测量' },
        { key: 'B', content: '变形监测' },
        { key: 'C', content: '竣工测量' },
        { key: 'D', content: '控制测量' }
      ],
      answer: 'A',
      analysis: '放样点位标定后，应进行检核测量以确保放样精度。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '检核测量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_093',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '模板放样是混凝土施工中的重要工作，模板放样的精度直接影响（）。',
      options: [
        { key: 'A', content: '混凝土结构的几何尺寸' },
        { key: 'B', content: '混凝土的强度' },
        { key: 'C', content: '混凝土的耐久性' },
        { key: 'D', content: '混凝土的配合比' }
      ],
      answer: 'A',
      analysis: '模板放样是混凝土施工中的重要工作，模板放样的精度直接影响混凝土结构的几何尺寸。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '模板放样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_094',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '隧洞贯通测量是隧洞施工中的重要工作，贯通误差包括横向贯通误差、纵向贯通误差和（）。',
      options: [
        { key: 'A', content: '高程贯通误差' },
        { key: 'B', content: '角度贯通误差' },
        { key: 'C', content: '距离贯通误差' },
        { key: 'D', content: '方位贯通误差' }
      ],
      answer: 'A',
      analysis: '隧洞贯通测量是隧洞施工中的重要工作，贯通误差包括横向贯通误差、纵向贯通误差和高程贯通误差。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', '施工放样', '隧洞贯通'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_095',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '施工放样的精度要求应根据（）确定。',
      options: [
        { key: 'A', content: '设计文件和施工规范' },
        { key: 'B', content: '测量仪器精度' },
        { key: 'C', content: '施工进度' },
        { key: 'D', content: '施工成本' }
      ],
      answer: 'A',
      analysis: '施工放样的精度要求应根据设计文件和施工规范确定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '精度要求'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 6题 ==========
    {
      id: 'survey_096',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '施工放样的基本工作包括（）。',
      options: [
        { key: 'A', content: '放样数据准备' },
        { key: 'B', content: '放样方法选择' },
        { key: 'C', content: '放样精度分析' },
        { key: 'D', content: '放样点位标定' }
      ],
      answer: 'A,B,C,D',
      analysis: '施工放样的基本工作包括放样数据准备、放样方法选择、放样精度分析和放样点位标定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '基本工作'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_097',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '平面位置放样的基本方法包括（）。',
      options: [
        { key: 'A', content: '极坐标法' },
        { key: 'B', content: '直角坐标法' },
        { key: 'C', content: '角度交会法' },
        { key: 'D', content: '距离交会法' }
      ],
      answer: 'A,B,C,D',
      analysis: '平面位置放样的基本方法包括极坐标法、直角坐标法、角度交会法和距离交会法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', '平面放样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_098',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '高程放样的基本方法包括（）。',
      options: [
        { key: 'A', content: '水准测量法' },
        { key: 'B', content: '三角高程法' },
        { key: 'C', content: '极坐标法' },
        { key: 'D', content: '角度交会法' }
      ],
      answer: 'A,B',
      analysis: '高程放样的基本方法包括水准测量法和三角高程法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '高程放样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_099',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '曲线放样的常用方法包括（）。',
      options: [
        { key: 'A', content: '偏角法' },
        { key: 'B', content: '切线支距法' },
        { key: 'C', content: '坐标法' },
        { key: 'D', content: '水准法' }
      ],
      answer: 'A,B,C',
      analysis: '曲线放样的常用方法包括偏角法、切线支距法和坐标法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', '曲线放样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_100',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '隧洞贯通误差包括（）。',
      options: [
        { key: 'A', content: '横向贯通误差' },
        { key: 'B', content: '纵向贯通误差' },
        { key: 'C', content: '高程贯通误差' },
        { key: 'D', content: '角度贯通误差' }
      ],
      answer: 'A,B,C',
      analysis: '隧洞贯通误差包括横向贯通误差、纵向贯通误差和高程贯通误差。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', '施工放样', '隧洞贯通'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_101',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '全站仪放样的优点包括（）。',
      options: [
        { key: 'A', content: '精度高' },
        { key: 'B', content: '速度快' },
        { key: 'C', content: '操作简便' },
        { key: 'D', content: '不需要通视' }
      ],
      answer: 'A,B,C',
      analysis: '全站仪放样的优点包括精度高、速度快、操作简便。但全站仪放样需要通视。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', '全站仪'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 9题 ==========
    {
      id: 'survey_102',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '施工放样是将设计图纸上的建筑物位置在实地标定出来的测量工作。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。施工放样是将设计图纸上的建筑物位置在实地标定出来的测量工作，也称为测设。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '概念'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_103',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '极坐标法放样是通过测设两个角度来确定放样点位置的方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。极坐标法放样是通过测设角度和距离来确定放样点位置的方法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '极坐标法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_104',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '全站仪放样是目前最常用的放样方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。全站仪放样是目前最常用的放样方法，其优点是精度高、速度快、操作简便。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '全站仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_105',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: 'GPS-RTK放样需要测站之间相互通视。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。GPS-RTK放样的优点之一就是不需要测站之间相互通视。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', 'GPS-RTK'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_106',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '放样点位标定后，不需要进行检核测量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。放样点位标定后，应进行检核测量以确保放样精度。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '检核测量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_107',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '高程放样的基本方法包括水准测量法和三角高程法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。高程放样的基本方法包括水准测量法和三角高程法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '高程放样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_108',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '模板放样的精度直接影响混凝土结构的几何尺寸。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。模板放样是混凝土施工中的重要工作，模板放样的精度直接影响混凝土结构的几何尺寸。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '施工放样', '模板放样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_109',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '施工放样的精度要求应根据测量仪器精度确定。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。施工放样的精度要求应根据设计文件和施工规范确定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', '精度要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_110',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 施工放样',
      content: '隧洞贯通误差包括横向贯通误差、纵向贯通误差和高程贯通误差。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。隧洞贯通误差包括横向贯通误差、纵向贯通误差和高程贯通误差。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '施工放样', '隧洞贯通'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
