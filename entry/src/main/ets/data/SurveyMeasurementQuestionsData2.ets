/**
 * 量测题目数据 - 第二部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：量测（第3版）第二章 控制测量
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取量测题目（第二部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getSurveyMeasurementQuestions2(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'survey_041',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水利水电工程建设可分为三个阶段，按工程建设的阶段来划分，控制测量可分为测图控制测量、施工控制测量和（）。',
      options: [
        { key: 'A', content: '安全监测控制测量' },
        { key: 'B', content: '变形监测控制测量' },
        { key: 'C', content: '竣工控制测量' },
        { key: 'D', content: '运营控制测量' }
      ],
      answer: 'A',
      analysis: '水利水电工程建设可分为三个阶段，即勘测设计阶段、施工阶段和运营管理阶段。按工程建设的阶段来划分，控制测量可分为测图控制测量、施工控制测量和安全监测控制测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '阶段划分'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_042',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '勘测设计阶段的工程测量主要是为工程的规划和设计提供各种比例尺的地形图、纵横断面图等资料，为此目的而布设的测量控制网被称为（）。',
      options: [
        { key: 'A', content: '施工控制网' },
        { key: 'B', content: '测图控制网' },
        { key: 'C', content: '监测控制网' },
        { key: 'D', content: '首级控制网' }
      ],
      answer: 'B',
      analysis: '勘测设计阶段的工程测量主要是为工程的规划和设计提供各种比例尺的地形图、纵横断面图等资料，为此目的而布设的测量控制网被称为测图控制网，它是施工阶段控制测量网的参考基准。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '测图控制网'],
      createTime: timestamp,
      updateTime: timestamp
    },

    {
      id: 'survey_043',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '施工控制网是为施工放样服务的，其精度取决于（）。',
      options: [
        { key: 'A', content: '测图精度' },
        { key: 'B', content: '工程规模' },
        { key: 'C', content: '建筑物的结构特点和施工方法' },
        { key: 'D', content: '监测要求' }
      ],
      answer: 'C',
      analysis: '施工控制网是为施工放样服务的，其精度取决于建筑物的结构特点和施工方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '施工控制网'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_044',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '测量的基本任务就是确定地面点的基本位置。由于地球自然表面高低起伏较大，要确定地面点的空间位置，就必须有一个统一的（）。',
      options: [
        { key: 'A', content: '参考基准' },
        { key: 'B', content: '测量坐标系' },
        { key: 'C', content: '高程系统' },
        { key: 'D', content: '投影面' }
      ],
      answer: 'B',
      analysis: '测量的基本任务就是确定地面点的基本位置。由于地球自然表面高低起伏较大，要确定地面点的空间位置，就必须有一个统一的测量坐标系。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '坐标系'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_045',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '测量控制网的布设首先需确定控制测量的基准，即测量坐标系和（）。',
      options: [
        { key: 'A', content: '投影系统' },
        { key: 'B', content: '高程系统' },
        { key: 'C', content: '参考椭球' },
        { key: 'D', content: '大地基准' }
      ],
      answer: 'B',
      analysis: '测量控制网的布设首先需确定控制测量的基准，即测量坐标系和高程系统。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '基准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_046',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '我国目前采用的国家大地坐标系是（）。',
      options: [
        { key: 'A', content: '1954年北京坐标系' },
        { key: 'B', content: '1980西安坐标系' },
        { key: 'C', content: '2000国家大地坐标系' },
        { key: 'D', content: 'WGS-84坐标系' }
      ],
      answer: 'C',
      analysis: '我国目前采用的国家大地坐标系是2000国家大地坐标系（CGCS2000）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '坐标系'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_047',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '我国目前采用的国家高程基准是（）。',
      options: [
        { key: 'A', content: '1956年黄海高程系' },
        { key: 'B', content: '1985国家高程基准' },
        { key: 'C', content: '吴淞高程系' },
        { key: 'D', content: '珠江高程系' }
      ],
      answer: 'B',
      analysis: '我国目前采用的国家高程基准是1985国家高程基准。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '高程基准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_048',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '根据《水利水电工程施工测量规范》（SL 52—2015），平面控制网的等级依次划分为二、三、四、五等测边网、测角网、边角网或（）。',
      options: [
        { key: 'A', content: 'GPS网' },
        { key: 'B', content: '光电测距导线' },
        { key: 'C', content: '水准网' },
        { key: 'D', content: '三角网' }
      ],
      answer: 'B',
      analysis: '根据《水利水电工程施工测量规范》（SL 52—2015），平面控制网的等级依次划分为二、三、四、五等测边网、测角网、边角网或光电测距导线。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '平面控制网'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_049',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '对于大型水利工程，可以布设一等平面控制网，对其技术指标须进行（）的设计。',
      options: [
        { key: 'A', content: '专门' },
        { key: 'B', content: '统一' },
        { key: 'C', content: '简化' },
        { key: 'D', content: '标准' }
      ],
      answer: 'A',
      analysis: '对于大型水利工程，可以布设一等平面控制网，对其技术指标须进行专门的设计。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '一等控制网'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_050',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '如果是GPS控制网，按工程规模依次可以选择国家B、C、D、E级（）。',
      options: [
        { key: 'A', content: 'GPS网' },
        { key: 'B', content: '导线网' },
        { key: 'C', content: '水准网' },
        { key: 'D', content: '三角网' }
      ],
      answer: 'A',
      analysis: '如果是GPS控制网，按工程规模依次可以选择国家B、C、D、E级GPS网。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', 'GPS网'],
      createTime: timestamp,
      updateTime: timestamp
    },

    {
      id: 'survey_051',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '高程控制网的等级依次划分为二、三、四、五等（）。',
      options: [
        { key: 'A', content: '水准网' },
        { key: 'B', content: '导线网' },
        { key: 'C', content: 'GPS网' },
        { key: 'D', content: '三角网' }
      ],
      answer: 'A',
      analysis: '高程控制网的等级依次划分为二、三、四、五等水准网。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '高程控制网'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_052',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制网的布设应遵循"从整体到局部，先控制后碎部"的原则，首级控制网应一次布设，加密控制网可（）。',
      options: [
        { key: 'A', content: '同时布设' },
        { key: 'B', content: '分期布设' },
        { key: 'C', content: '单独布设' },
        { key: 'D', content: '随机布设' }
      ],
      answer: 'B',
      analysis: '控制网的布设应遵循"从整体到局部，先控制后碎部"的原则，首级控制网应一次布设，加密控制网可分期布设。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '布设原则'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_053',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制网的精度应满足工程各阶段的需要，并有适当的（）。',
      options: [
        { key: 'A', content: '精度储备' },
        { key: 'B', content: '点位密度' },
        { key: 'C', content: '网形结构' },
        { key: 'D', content: '观测条件' }
      ],
      answer: 'A',
      analysis: '控制网的精度应满足工程各阶段的需要，并有适当的精度储备。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '精度要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_054',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制点应选在稳固、便于保存和使用的地方，并应有利于（）。',
      options: [
        { key: 'A', content: '施工放样' },
        { key: 'B', content: '加密和扩展' },
        { key: 'C', content: '监测观测' },
        { key: 'D', content: '以上都是' }
      ],
      answer: 'D',
      analysis: '控制点应选在稳固、便于保存和使用的地方，并应有利于施工放样、加密和扩展、监测观测。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '选点原则'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_055',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '三角测量是通过测量三角形的角度来确定点位的方法，其基本图形是（）。',
      options: [
        { key: 'A', content: '三角形' },
        { key: 'B', content: '四边形' },
        { key: 'C', content: '多边形' },
        { key: 'D', content: '以上都是' }
      ],
      answer: 'D',
      analysis: '三角测量是通过测量三角形的角度来确定点位的方法，其基本图形包括三角形、四边形、多边形等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '三角测量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_056',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '导线测量是通过测量导线边的边长和转折角来确定点位的方法，按导线的形式可分为闭合导线、附合导线和（）。',
      options: [
        { key: 'A', content: '支导线' },
        { key: 'B', content: '环形导线' },
        { key: 'C', content: '复合导线' },
        { key: 'D', content: '单一导线' }
      ],
      answer: 'A',
      analysis: '导线测量是通过测量导线边的边长和转折角来确定点位的方法，按导线的形式可分为闭合导线、附合导线和支导线。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '导线测量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_057',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS测量是利用全球定位系统进行测量的方法，其定位精度高、速度快、（）。',
      options: [
        { key: 'A', content: '不受天气影响' },
        { key: 'B', content: '不需要通视' },
        { key: 'C', content: '操作简单' },
        { key: 'D', content: '以上都是' }
      ],
      answer: 'D',
      analysis: 'GPS测量是利用全球定位系统进行测量的方法，其定位精度高、速度快、不受天气影响、不需要通视、操作简单。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', 'GPS测量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_058',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水准测量是利用水准仪和水准尺测定两点间高差的方法，按精度可分为（）等水准测量。',
      options: [
        { key: 'A', content: '一、二、三、四' },
        { key: 'B', content: '二、三、四、五' },
        { key: 'C', content: '一、二、三、四、五' },
        { key: 'D', content: '三、四、五' }
      ],
      answer: 'A',
      analysis: '水准测量是利用水准仪和水准尺测定两点间高差的方法，按精度可分为一、二、三、四等水准测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '水准测量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_059',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '三角高程测量是利用经纬仪或全站仪测定两点间的垂直角和水平距离，通过计算求得两点间（）的方法。',
      options: [
        { key: 'A', content: '水平距离' },
        { key: 'B', content: '高差' },
        { key: 'C', content: '方位角' },
        { key: 'D', content: '坐标' }
      ],
      answer: 'B',
      analysis: '三角高程测量是利用经纬仪或全站仪测定两点间的垂直角和水平距离，通过计算求得两点间高差的方法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '三角高程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_060',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制测量的外业工作主要包括选点、埋石、（）和检查验收。',
      options: [
        { key: 'A', content: '观测' },
        { key: 'B', content: '计算' },
        { key: 'C', content: '平差' },
        { key: 'D', content: '成图' }
      ],
      answer: 'A',
      analysis: '控制测量的外业工作主要包括选点、埋石、观测和检查验收。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '外业工作'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'survey_061',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制测量的基准包括（）。',
      options: [
        { key: 'A', content: '测量坐标系' },
        { key: 'B', content: '高程系统' },
        { key: 'C', content: '投影系统' },
        { key: 'D', content: '时间系统' }
      ],
      answer: 'A,B',
      analysis: '控制测量的基准包括测量坐标系和高程系统。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '基准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_062',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '平面控制测量的方法包括（）。',
      options: [
        { key: 'A', content: '三角测量' },
        { key: 'B', content: '导线测量' },
        { key: 'C', content: 'GPS测量' },
        { key: 'D', content: '水准测量' }
      ],
      answer: 'A,B,C',
      analysis: '平面控制测量的方法包括三角测量、导线测量、GPS测量等。水准测量是高程控制测量的方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '平面控制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_063',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '高程控制测量的方法包括（）。',
      options: [
        { key: 'A', content: '水准测量' },
        { key: 'B', content: '三角高程测量' },
        { key: 'C', content: 'GPS高程测量' },
        { key: 'D', content: '导线测量' }
      ],
      answer: 'A,B,C',
      analysis: '高程控制测量的方法包括水准测量、三角高程测量、GPS高程测量等。导线测量是平面控制测量的方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '高程控制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_064',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制网布设的原则包括（）。',
      options: [
        { key: 'A', content: '从整体到局部' },
        { key: 'B', content: '先控制后碎部' },
        { key: 'C', content: '首级控制网应一次布设' },
        { key: 'D', content: '加密控制网可分期布设' }
      ],
      answer: 'A,B,C,D',
      analysis: '控制网布设的原则包括：从整体到局部、先控制后碎部、首级控制网应一次布设、加密控制网可分期布设。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '布设原则'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_065',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制点选点的要求包括（）。',
      options: [
        { key: 'A', content: '点位稳固' },
        { key: 'B', content: '便于保存' },
        { key: 'C', content: '便于使用' },
        { key: 'D', content: '有利于加密和扩展' }
      ],
      answer: 'A,B,C,D',
      analysis: '控制点选点的要求包括：点位稳固、便于保存、便于使用、有利于加密和扩展。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '选点要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_066',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS测量的优点包括（）。',
      options: [
        { key: 'A', content: '定位精度高' },
        { key: 'B', content: '不需要通视' },
        { key: 'C', content: '不受天气影响' },
        { key: 'D', content: '操作简单' }
      ],
      answer: 'A,B,C,D',
      analysis: 'GPS测量的优点包括：定位精度高、不需要通视、不受天气影响、操作简单。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', 'GPS优点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_067',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '导线的形式包括（）。',
      options: [
        { key: 'A', content: '闭合导线' },
        { key: 'B', content: '附合导线' },
        { key: 'C', content: '支导线' },
        { key: 'D', content: '环形导线' }
      ],
      answer: 'A,B,C',
      analysis: '导线的形式包括闭合导线、附合导线和支导线。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '导线形式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_068',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制测量的外业工作包括（）。',
      options: [
        { key: 'A', content: '选点' },
        { key: 'B', content: '埋石' },
        { key: 'C', content: '观测' },
        { key: 'D', content: '检查验收' }
      ],
      answer: 'A,B,C,D',
      analysis: '控制测量的外业工作包括选点、埋石、观测和检查验收。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '外业工作'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'survey_069',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制测量可分为测图控制测量、施工控制测量和安全监测控制测量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。按工程建设的阶段来划分，控制测量可分为测图控制测量、施工控制测量和安全监测控制测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_070',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '我国目前采用的国家大地坐标系是1980西安坐标系。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。我国目前采用的国家大地坐标系是2000国家大地坐标系（CGCS2000）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '坐标系'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_071',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '我国目前采用的国家高程基准是1985国家高程基准。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。我国目前采用的国家高程基准是1985国家高程基准。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '高程基准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_072',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制网的布设应遵循"从局部到整体"的原则。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。控制网的布设应遵循"从整体到局部，先控制后碎部"的原则。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '布设原则'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_073',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '施工控制网的精度取决于建筑物的结构特点和施工方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。施工控制网是为施工放样服务的，其精度取决于建筑物的结构特点和施工方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '施工控制网'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_074',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS测量需要测站之间相互通视。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。GPS测量的优点之一就是不需要测站之间相互通视。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', 'GPS测量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_075',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水准测量是利用水准仪和水准尺测定两点间高差的方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。水准测量是利用水准仪和水准尺测定两点间高差的方法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '水准测量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_076',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '导线测量按导线的形式可分为闭合导线、附合导线和支导线。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。导线测量按导线的形式可分为闭合导线、附合导线和支导线。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '导线测量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_077',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '首级控制网可以分期布设。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。首级控制网应一次布设，加密控制网可分期布设。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '布设原则'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_078',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制网的精度应满足工程各阶段的需要，并有适当的精度储备。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。控制网的精度应满足工程各阶段的需要，并有适当的精度储备。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '精度要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_079',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '三角高程测量是利用经纬仪或全站仪测定两点间的垂直角和水平距离，通过计算求得两点间高差的方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。三角高程测量是利用经纬仪或全站仪测定两点间的垂直角和水平距离，通过计算求得两点间高差的方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '三角高程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_080',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制测量的外业工作主要包括选点、埋石、观测和检查验收。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。控制测量的外业工作主要包括选点、埋石、观测和检查验收。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '外业工作'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
