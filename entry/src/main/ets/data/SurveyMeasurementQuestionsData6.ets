/**
 * 量测题目数据 - 第六部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：量测（第3版）第二章 控制测量 - 高程控制测量、GPS高程测量、控制测量设备
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取量测题目（第六部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getSurveyMeasurementQuestions6(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'survey_181',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '高程控制测量的方法，主要有水准测量、光电测距三角高程测量和（）三种。',
      options: [
        { key: 'A', content: 'GPS高程测量' },
        { key: 'B', content: '气压高程测量' },
        { key: 'C', content: '重力高程测量' },
        { key: 'D', content: '激光高程测量' }
      ],
      answer: 'A',
      analysis: '高程控制测量的方法，主要有水准测量、光电测距三角高程测量和GPS高程测量三种。在布设水利水电工程施工的高程控制网时，首选的方法是水准测量，它可以满足各种等级高程控制测量的精度要求。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '高程控制测量', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_182',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '在布设水利水电工程施工的高程控制网时，首选的方法是（）。',
      options: [
        { key: 'A', content: '水准测量' },
        { key: 'B', content: '光电测距三角高程测量' },
        { key: 'C', content: 'GPS高程测量' },
        { key: 'D', content: '气压高程测量' }
      ],
      answer: 'A',
      analysis: '在布设水利水电工程施工的高程控制网时，首选的方法是水准测量，它可以满足各种等级高程控制测量的精度要求。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '高程控制测量', '水准测量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_183',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水准测量是利用水准仪提供的水平视线，分别在地面上两点垂直竖立的水准标尺上读数，推算两点间的高差，进而求出待定点的高程，这种方法称为（）。',
      options: [
        { key: 'A', content: '几何水准测量' },
        { key: 'B', content: '三角高程测量' },
        { key: 'C', content: 'GPS高程测量' },
        { key: 'D', content: '气压高程测量' }
      ],
      answer: 'A',
      analysis: '水准测量是利用水准仪提供的水平视线，分别在地面上两点垂直竖立的水准标尺上读数，推算两点间的高差，进而求出待定点的高程，这种方法称为几何水准测量，简称水准测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '水准测量', '基本概念'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_184',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水准路线的布设形式，可以分为单一水准路线和（）。',
      options: [
        { key: 'A', content: '水准网' },
        { key: 'B', content: '闭合水准路线' },
        { key: 'C', content: '附合水准路线' },
        { key: 'D', content: '支水准路线' }
      ],
      answer: 'A',
      analysis: '水准路线的布设形式，可以分为单一水准路线和水准网。单一水准路线包括附合水准路线、闭合水准路线、支水准路线。水准网由若干条单一水准路线相互连接，形成网状的水准路线。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '水准测量', '路线布设'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_185',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '一、二等水准测量采用（）观测。',
      options: [
        { key: 'A', content: '光学测微法' },
        { key: 'B', content: '中丝读数法' },
        { key: 'C', content: '视距法' },
        { key: 'D', content: '三丝法' }
      ],
      answer: 'A',
      analysis: '根据水准测量作业方法表，一、二等水准测量采用光学测微法观测，往返观测。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '水准测量', '观测方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_186',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '三等水准测量可采用中丝读数法或光学测微法，路线测量方法为（）。',
      options: [
        { key: 'A', content: '往返观测或单程双转点' },
        { key: 'B', content: '单程观测' },
        { key: 'C', content: '往返观测' },
        { key: 'D', content: '单程双转点' }
      ],
      answer: 'A',
      analysis: '三等水准测量可采用中丝读数法或光学测微法，路线测量方法为往返观测或单程双转点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '水准测量', '观测方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_187',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '四、五等水准测量采用中丝读数法，路线测量方法为（）。',
      options: [
        { key: 'A', content: '附合或闭合路线单程观测、水准支线往返观测或单程双转点' },
        { key: 'B', content: '往返观测' },
        { key: 'C', content: '单程观测' },
        { key: 'D', content: '光学测微法' }
      ],
      answer: 'A',
      analysis: '四、五等水准测量采用中丝读数法，路线测量方法为附合或闭合路线单程观测、水准支线往返观测或单程双转点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '水准测量', '观测方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_188',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '光电测距三角高程测量已经广泛应用，目前在山区和丘陵地区可以代替三、四、五等（）。',
      options: [
        { key: 'A', content: '水准测量' },
        { key: 'B', content: 'GPS测量' },
        { key: 'C', content: '导线测量' },
        { key: 'D', content: '三角测量' }
      ],
      answer: 'A',
      analysis: '光电测距三角高程测量已经广泛应用，目前在山区和丘陵地区可以代替三、四、五等水准测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '三角高程测量', '应用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_189',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '光电测距三角高程测量的基本原理是：根据由测站向目标点所测定的垂直角（或天顶距）和它们间的距离，计算测站和目标点间的（）。',
      options: [
        { key: 'A', content: '高差' },
        { key: 'B', content: '水平距离' },
        { key: 'C', content: '方位角' },
        { key: 'D', content: '坐标' }
      ],
      answer: 'A',
      analysis: '光电测距三角高程测量的基本原理是：根据由测站向目标点所测定的垂直角（或天顶距）和它们间的距离，计算测站和目标点间的高差。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '三角高程测量', '原理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_190',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '三角高程测量公式中，(1-K)S₀²/(2R)称为两差改正，包括球差改正和（）。',
      options: [
        { key: 'A', content: '气差改正' },
        { key: 'B', content: '温度改正' },
        { key: 'C', content: '湿度改正' },
        { key: 'D', content: '气压改正' }
      ],
      answer: 'A',
      analysis: '(1-K)S₀²/(2R)称为两差改正，包括球差改正和气差改正。球差改正就是对地球弯曲对高差的影响所进行的改正，气差改正是对大气折光对高差的影响所进行的改正。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '三角高程测量', '改正'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_191',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '为了提高光电测距三角高程测量的精度，防止观测错误的产生，通常采用往、返测，甚至采用同时对向观测的作业方式，以抵消（）等因素变化的影响。',
      options: [
        { key: 'A', content: '大气折光系数' },
        { key: 'B', content: '温度' },
        { key: 'C', content: '气压' },
        { key: 'D', content: '湿度' }
      ],
      answer: 'A',
      analysis: '为了提高光电测距三角高程测量的精度，防止观测错误的产生，通常采用往、返测，甚至采用同时对向观测的作业方式，以抵消大气折光系数等因素变化的影响。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '三角高程测量', '精度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_192',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '根据《水利水电工程施工测量规范》（SL 52—2015）的规定，代替三、四、五等水准测量的光电测距三角高程测量，可以采用单向、对向和（）设站法进行。',
      options: [
        { key: 'A', content: '隔点' },
        { key: 'B', content: '连续' },
        { key: 'C', content: '跳跃' },
        { key: 'D', content: '交叉' }
      ],
      answer: 'A',
      analysis: '根据《水利水电工程施工测量规范》（SL 52—2015）的规定，代替三、四、五等水准测量的光电测距三角高程测量，可以采用单向、对向和隔点设站法进行。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '三角高程测量', '规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_193',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '进行光电测距三角高程测量时，采用隔点设站观测时，前、后视线长度应尽量相等，最大视距差不宜大于（）m。',
      options: [
        { key: 'A', content: '40' },
        { key: 'B', content: '20' },
        { key: 'C', content: '60' },
        { key: 'D', content: '80' }
      ],
      answer: 'A',
      analysis: '采用隔点设站观测时，前、后视线长度应尽量相等，最大视距差不宜大于40m，视线通过的地形剖面应相似。隔点设站法的测站数应为偶数。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', '三角高程测量', '规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_194',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '当视线长度大于500m时，应采用（）。',
      options: [
        { key: 'A', content: '特制觇牌' },
        { key: 'B', content: '普通觇牌' },
        { key: 'C', content: '反光镜' },
        { key: 'D', content: '棱镜' }
      ],
      answer: 'A',
      analysis: '当视线长度大于500m时，应采用特制觇牌。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '三角高程测量', '设备'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_195',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '一般在水利水电工程中，高程采用的是正常高H，是测点沿铅垂线至（）的距离。',
      options: [
        { key: 'A', content: '似大地水准面' },
        { key: 'B', content: '大地水准面' },
        { key: 'C', content: '参考椭球面' },
        { key: 'D', content: '地球表面' }
      ],
      answer: 'A',
      analysis: '一般在水利水电工程中，高程采用的是正常高H，是测点沿铅垂线至似大地水准面的距离。而GPS高程测量获得的是WGS-84世界大地坐标系上的成果，即GPS高程测量的高程是相对于WGS-84世界大地坐标系的大地高H₈₄。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS高程测量', '高程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_196',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '正常高H与大地高H₈₄存在差异ξ（ξ称为高程异常），由图2-3可知，ξ=（）。',
      options: [
        { key: 'A', content: 'H₈₄-H' },
        { key: 'B', content: 'H-H₈₄' },
        { key: 'C', content: 'H₈₄+H' },
        { key: 'D', content: 'H₈₄×H' }
      ],
      answer: 'A',
      analysis: '正常高H与大地高H₈₄存在差异ξ（ξ称为高程异常），ξ=H₈₄-H。采用GPS定位要获得高精度的正常高H，需要知道高精度的H₈₄和高程异常ξ，但在一般地区高程异常ξ很难求得。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS高程测量', '高程异常'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_197',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS水准高程是利用GPS和水准高程测量的成果确定似大地水准面的方法，是目前确定GPS高程的主要方法。其计算方法主要有绘等值线图法、（）和曲面拟合法等。',
      options: [
        { key: 'A', content: '解析内插法' },
        { key: 'B', content: '重力法' },
        { key: 'C', content: '天文法' },
        { key: 'D', content: '卫星法' }
      ],
      answer: 'A',
      analysis: 'GPS水准高程是利用GPS和水准高程测量的成果确定似大地水准面的方法，是目前确定GPS高程的主要方法。其计算方法主要有绘等值线图法、解析内插法和曲面拟合法等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS高程测量', '计算方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_198',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '我国的似大地水准面主要是采用天文重力方法测定的，其精度为（）左右。',
      options: [
        { key: 'A', content: '1m' },
        { key: 'B', content: '0.1m' },
        { key: 'C', content: '0.01m' },
        { key: 'D', content: '10m' }
      ],
      answer: 'A',
      analysis: '我国的似大地水准面主要是采用天文重力方法测定的，其精度为1m左右。利用地球重力场模型场，通过地面重力数据、卫星测高场数据等，由地球扰动位的球谐函数求出高程异常。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', 'GPS高程测量', '精度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_199',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '目前，在我国的沿海平原地区计算的高程异常ξ可以达到厘米级精度，山区为（）精度。',
      options: [
        { key: 'A', content: '0.2m' },
        { key: 'B', content: '0.1m' },
        { key: 'C', content: '0.5m' },
        { key: 'D', content: '1.0m' }
      ],
      answer: 'A',
      analysis: '目前，在我国的沿海平原地区计算的高程异常ξ可以达到厘米级精度，山区为0.2m精度，沿海以外的其他地区高程异常精度为1.0m左右。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', 'GPS高程测量', '精度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_200',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '光学经纬仪是一种最普通的测角仪器，其可用于各种等级的（）。',
      options: [
        { key: 'A', content: '测角网、边角网、导线网' },
        { key: 'B', content: '水准测量' },
        { key: 'C', content: 'GPS测量' },
        { key: 'D', content: '高程测量' }
      ],
      answer: 'A',
      analysis: '光学经纬仪是一种最普通的测角仪器，其可用于各种等级的测角网、边角网、导线网。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '测量仪器', '经纬仪'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'survey_201',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水准测量的主要工作包括（）。',
      options: [
        { key: 'A', content: '技术方案设计' },
        { key: 'B', content: '水准路线的选定、选点、埋标' },
        { key: 'C', content: '仪器检校、外业观测' },
        { key: 'D', content: '数据检查及预处理、平差计算、检查验收及资料整理' }
      ],
      answer: 'A,B,C,D',
      analysis: '水准测量的主要工作包括：技术方案设计、水准路线的选定、选点、埋标、仪器检校、外业观测、数据检查及预处理、平差计算、检查验收及资料整理等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '水准测量', '工作内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_202',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '单一水准路线包括（）。',
      options: [
        { key: 'A', content: '附合水准路线' },
        { key: 'B', content: '闭合水准路线' },
        { key: 'C', content: '支水准路线' },
        { key: 'D', content: '水准网' }
      ],
      answer: 'A,B,C',
      analysis: '单一水准路线包括附合水准路线、闭合水准路线、支水准路线。水准网由若干条单一水准路线相互连接，形成网状的水准路线。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '水准测量', '路线类型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_203',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '进行光电测距三角高程测量时，还应注意以下几点（）。',
      options: [
        { key: 'A', content: '高程路线应起迄于高一级的高程点或组成闭合环' },
        { key: 'B', content: '采用隔点设站观测时，前、后视线长度应尽量相等' },
        { key: 'C', content: '当视线长度大于500m时，应采用特制觇牌' },
        { key: 'D', content: '隔点设站法的测站数应为偶数' }
      ],
      answer: 'A,B,C,D',
      analysis: '进行光电测距三角高程测量时，还应注意以下几点：高程路线应起迄于高一级的高程点或组成闭合环；采用隔点设站观测时，前、后视线长度应尽量相等，最大视距差不宜大于40m；当视线长度大于500m时，应采用特制觇牌；隔点设站法的测站数应为偶数。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '三角高程测量', '注意事项'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_204',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS水准高程的计算方法主要有（）。',
      options: [
        { key: 'A', content: '绘等值线图法' },
        { key: 'B', content: '解析内插法' },
        { key: 'C', content: '曲面拟合法' },
        { key: 'D', content: '重力法' }
      ],
      answer: 'A,B,C',
      analysis: 'GPS水准高程是利用GPS和水准高程测量的成果确定似大地水准面的方法，是目前确定GPS高程的主要方法。其计算方法主要有绘等值线图法、解析内插法和曲面拟合法等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS高程测量', '计算方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_205',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '影响GPS高程精度（绝对精度）的主要因素包括（）。',
      options: [
        { key: 'A', content: 'GPS大地高的测量精度' },
        { key: 'B', content: '几何水准点的精度' },
        { key: 'C', content: '水准点分布和密度情况' },
        { key: 'D', content: 'GPS高程的拟合方法' }
      ],
      answer: 'A,B,C,D',
      analysis: '影响GPS高程精度（绝对精度）的主要因素包括：GPS大地高的测量精度、几何水准点的精度、水准点分布和密度情况、GPS高程的拟合方法。因此，可以针对上述因素，采取措施提高GPS高程精度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS高程测量', '精度因素'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_206',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '提高GPS大地高的测量精度，采取的措施包括（）。',
      options: [
        { key: 'A', content: '改善GPS星历的精度' },
        { key: 'B', content: '提高GPS基线解算的起算点坐标的精度' },
        { key: 'C', content: '减弱电离层、对流层、多路径误差的影响' },
        { key: 'D', content: '增加观测时间' }
      ],
      answer: 'A,B,C',
      analysis: '提高GPS大地高的测量精度，采取的措施包括改善GPS星历的精度、提高GPS基线解算的起算点坐标的精度、减弱电离层、对流层、多路径误差的影响等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS高程测量', '精度提高'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_207',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '三角测量的优点是（）。',
      options: [
        { key: 'A', content: '控制面积大' },
        { key: 'B', content: '测角精度高' },
        { key: 'C', content: '检核角度观测质量的几何条件多' },
        { key: 'D', content: '相邻三角点间相对点位误差较小' }
      ],
      answer: 'A,B,C,D',
      analysis: '三角测量的优点是：控制面积大，测角精度高，检核角度观测质量的几何条件多，相邻三角点间相对点位误差较小。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '三角测量', '优点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_208',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '三角测量的缺点是（）。',
      options: [
        { key: 'A', content: '除起始边和起始方位角外，其余各边的边长和方位角都是用水平角推算出来的' },
        { key: 'B', content: '由于误差的传播，各边的边长和方位角的精度不均匀' },
        { key: 'C', content: '即离起始边和起始方位角越远，则精度越低' },
        { key: 'D', content: '控制面积小' }
      ],
      answer: 'A,B,C',
      analysis: '三角测量的缺点是：除起始边和起始方位角外，其余各边的边长和方位角都是用水平角推算出来的，由于误差的传播，各边的边长和方位角的精度不均匀，即离起始边和起始方位角越远，则精度越低。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '三角测量', '缺点'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'survey_209',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '在布设水利水电工程施工的高程控制网时，首选的方法是GPS高程测量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。在布设水利水电工程施工的高程控制网时，首选的方法是水准测量，它可以满足各种等级高程控制测量的精度要求。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '高程控制测量', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_210',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水准网由若干条单一水准路线相互连接，形成网状的水准路线。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。水准网由若干条单一水准路线相互连接，形成网状的水准路线。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '水准测量', '水准网'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_211',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '一、二等水准测量采用中丝读数法观测。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。一、二等水准测量采用光学测微法观测，往返观测。三等水准测量可采用中丝读数法或光学测微法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '水准测量', '观测方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_212',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '光电测距三角高程测量目前在山区和丘陵地区可以代替三、四、五等水准测量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。光电测距三角高程测量已经广泛应用，目前在山区和丘陵地区可以代替三、四、五等水准测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '三角高程测量', '应用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_213',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '球差改正就是对大气折光对高差的影响所进行的改正。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。球差改正就是对地球弯曲对高差的影响所进行的改正，气差改正是对大气折光对高差的影响所进行的改正。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '三角高程测量', '改正'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_214',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '采用隔点设站观测时，隔点设站法的测站数应为偶数。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。采用隔点设站观测时，前、后视线长度应尽量相等，最大视距差不宜大于40m，视线通过的地形剖面应相似。隔点设站法的测站数应为偶数。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '三角高程测量', '规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_215',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '正常高H是测点沿铅垂线至大地水准面的距离。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。正常高H是测点沿铅垂线至似大地水准面的距离，而不是大地水准面。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS高程测量', '高程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_216',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '高程异常ξ=H₈₄-H，即大地高与正常高的差值。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。正常高H与大地高H₈₄存在差异ξ（ξ称为高程异常），ξ=H₈₄-H，图2-3为大地高与正常高的关系。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS高程测量', '高程异常'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_217',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '我国的似大地水准面主要是采用天文重力方法测定的，其精度为0.1m左右。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。我国的似大地水准面主要是采用天文重力方法测定的，其精度为1m左右，而不是0.1m。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', 'GPS高程测量', '精度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_218',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '在观测和计算时采取相应措施，GPS高程精度可以达到厘米级精度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。因此，在观测和计算时采取上述措施，GPS高程精度可以达到厘米级精度。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', 'GPS高程测量', '精度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_219',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '随着测距仪的广泛应用，三角网逐渐发展成为测边网和边角网，弥补了传统测角网由于边长推算造成误差传播的缺点。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。随着测距仪的广泛应用，三角网逐渐发展成为测边网和边角网，弥补了传统测角网由于边长推算造成误差传播的缺点。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '三角测量', '发展'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_220',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '目前，随着GPS技术的迅速发展和GPS数据处理精度的不断提高，三角网正逐渐被GPS控制网替代。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。目前，随着GPS技术的迅速发展和GPS数据处理精度的不断提高，三角网正逐渐被GPS控制网替代。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '三角测量', 'GPS'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
