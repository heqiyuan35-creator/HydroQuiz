/**
 * 量测题目数据 - 第五部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：量测（第3版）第二章 控制测量、第三章 GPS测量与导线测量
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取量测题目（第五部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getSurveyMeasurementQuestions5(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'survey_141',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS定位测量中所采用的协议地球坐标系，称为（）。',
      options: [
        { key: 'A', content: 'WGS-84世界大地坐标系' },
        { key: 'B', content: '北京54坐标系' },
        { key: 'C', content: '西安80坐标系' },
        { key: 'D', content: 'CGCS2000坐标系' }
      ],
      answer: 'A',
      analysis: 'GPS定位测量中所采用的协议地球坐标系，称为WGS-84世界大地坐标系。WGS-84世界大地坐标系采用的地球椭球，称为WGS-84椭球。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '坐标系'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_142',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'WGS-84椭球的长半径a约为（）。',
      options: [
        { key: 'A', content: '6378137m' },
        { key: 'B', content: '6356752m' },
        { key: 'C', content: '6371000m' },
        { key: 'D', content: '6400000m' }
      ],
      answer: 'A',
      analysis: 'WGS-84椭球的长半径a=6378137m，扁率α=1:298.257223563。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', 'GPS测量', 'WGS-84'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_143',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '绝对静态定位测量是使用一台接收机，在保持GPS接收机天线静止的状态下，确定测站的（）。',
      options: [
        { key: 'A', content: '三维地心坐标' },
        { key: 'B', content: '平面坐标' },
        { key: 'C', content: '高程' },
        { key: 'D', content: '方位角' }
      ],
      answer: 'A',
      analysis: '绝对静态定位测量是使用一台接收机，在保持GPS接收机天线静止的状态下，确定测站的三维地心坐标。其优点是速度快、灵活方便，一般应用于低精度的导航。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '静态定位'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_144',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '绝对静态定位测量的定位精度约为（）左右。',
      options: [
        { key: 'A', content: '20m' },
        { key: 'B', content: '1m' },
        { key: 'C', content: '0.1m' },
        { key: 'D', content: '0.01m' }
      ],
      answer: 'A',
      analysis: '绝对静态定位测量由于受到卫星轨道误差、接收机时钟不同步误差，以及信号传播误差等多种干扰因素的影响，其绝对定位精度为20m左右，远不能满足控制测量的精度要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '定位精度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_145',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '相对静态定位测量是使用（）台或以上的GPS接收机，在保持GPS接收机天线静止的状态下进行观测。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '1' },
        { key: 'C', content: '3' },
        { key: 'D', content: '4' }
      ],
      answer: 'A',
      analysis: '相对静态定位测量是使用2台或以上的GPS接收机，在保持GPS接收机天线静止的状态下，同步观测4颗以上的GPS卫星，确定基线两端的相对位置。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', 'GPS测量', '相对静态定位'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_146',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '相对静态定位测量在采用广播星历时，定位精度可以达到（）。',
      options: [
        { key: 'A', content: '10⁻⁶～10⁻⁷' },
        { key: 'B', content: '10⁻³～10⁻⁴' },
        { key: 'C', content: '10⁻¹～10⁻²' },
        { key: 'D', content: '10⁻⁸～10⁻⁹' }
      ],
      answer: 'A',
      analysis: '相对静态定位测量可以达到很高的精度，在采用广播星历时，定位精度可以达到10⁻⁶～10⁻⁷，如果采用精密星历，那么定位精度可以达到10⁻⁸～10⁻⁹。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', 'GPS测量', '定位精度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_147',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '实时动态定位技术（RTK技术），是以载波相位观测量为根据的实时差分GPS定位技术，是GPS发展的（）。',
      options: [
        { key: 'A', content: '一个里程碑' },
        { key: 'B', content: '初级阶段' },
        { key: 'C', content: '过渡技术' },
        { key: 'D', content: '辅助手段' }
      ],
      answer: 'A',
      analysis: '实时动态定位技术（RTK技术），是以载波相位观测量为根据的实时差分GPS定位技术，是GPS发展的一个里程碑，现在广泛应用在工程测量中。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', 'GPS测量', 'RTK'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_148',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'RTK技术的基本原理方法是：在基准站上安置（）台GPS接收机，对所有可见的GPS卫星进行连续观测。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '2' },
        { key: 'C', content: '3' },
        { key: 'D', content: '4' }
      ],
      answer: 'A',
      analysis: 'RTK技术的基本原理方法是：在基准站上安置1台GPS接收机，对所有可见的GPS卫星进行连续观测，并将其数据通过无线电设备实时地发送给用户观测站（流动站）。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', 'GPS测量', 'RTK'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_149',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS卫星的误差主要是卫星星历误差，主要指卫星星历给出的卫星空间位置与卫星实际位置的偏差，也称为（）。',
      options: [
        { key: 'A', content: '卫星轨道误差' },
        { key: 'B', content: '信号传播误差' },
        { key: 'C', content: '接收机误差' },
        { key: 'D', content: '多路径误差' }
      ],
      answer: 'A',
      analysis: 'GPS卫星的误差主要是卫星星历误差，主要指卫星星历给出的卫星空间位置与卫星实际位置的偏差，也称为卫星轨道误差。可以通过精密星历来减弱该项误差对定位精度的影响。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '误差'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_150',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS卫星信号传播误差是指信号穿过地球上空电离层和对流层所产生的误差，可以通过以下措施减弱其影响：如利用（）GPS接收机观测可有效削弱电离层的传播误差。',
      options: [
        { key: 'A', content: '双频' },
        { key: 'B', content: '单频' },
        { key: 'C', content: '多通道' },
        { key: 'D', content: '高精度' }
      ],
      answer: 'A',
      analysis: '可以通过以下措施来消除或减弱其对定位精度的影响：如利用双频GPS接收机观测可有效削弱电离层的传播误差；点位选择时避开较强的反射面，观测时选择性能好的GPS天线，可以减弱多路径干扰。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '误差'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_151',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '导线测量就是用测距仪测量各条导线的边长，用经纬仪在各导线点上测量相邻导线边的（）。',
      options: [
        { key: 'A', content: '水平夹角' },
        { key: 'B', content: '垂直角' },
        { key: 'C', content: '方位角' },
        { key: 'D', content: '倾斜角' }
      ],
      answer: 'A',
      analysis: '导线测量就是用测距仪测量各条导线的边长，用经纬仪在各导线点上测量相邻导线边的水平夹角，并至少在导线的一端测定出一条边长的方位角。然后根据起算点的坐标和已知方位，逐点推算出导线各点的坐标。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '导线测量', '基本概念'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_152',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '闭合导线是导线起闭于同一点，形成闭合多边形。此种导线存在着几何条件，具有（）。',
      options: [
        { key: 'A', content: '检核条件' },
        { key: 'B', content: '高精度' },
        { key: 'C', content: '简单性' },
        { key: 'D', content: '灵活性' }
      ],
      answer: 'A',
      analysis: '闭合导线是导线起闭于同一点，形成闭合多边形。此种导线存在着几何条件，具有检核条件。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '导线测量', '闭合导线'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_153',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '附合导线是布设于两已知点之间的导线称为附合导线。此种导线从一已知点和已知的方位开始，经过导线的连接，附合于另一已知点和（）。',
      options: [
        { key: 'A', content: '方位' },
        { key: 'B', content: '高程' },
        { key: 'C', content: '距离' },
        { key: 'D', content: '角度' }
      ],
      answer: 'A',
      analysis: '附合导线是布设于两已知点之间的导线称为附合导线。此种导线从一已知点和已知的方位开始，经过导线的连接，附合于另一已知点和方位。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '导线测量', '附合导线'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_154',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '支导线是从一已知点和已知的方位开始，但没有附合到另一已知点，也没有回到原起点。支导线缺乏检核条件，故其边数一般不超过（）条。',
      options: [
        { key: 'A', content: '3' },
        { key: 'B', content: '5' },
        { key: 'C', content: '7' },
        { key: 'D', content: '10' }
      ],
      answer: 'A',
      analysis: '支导线是从一已知点和已知的方位开始，但没有附合到另一已知点，也没有回到原起点。支导线缺乏检核条件，故其边数一般不超过3条，并且只在控制精度要求不高的条件下使用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '导线测量', '支导线'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_155',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '导线网是将单导线连接起来，构成有结点的图形，一般由数个闭合的环线组成。导线网的检核条件较多，能有效地避免测量错误，提高（）的精度。',
      options: [
        { key: 'A', content: '控制网' },
        { key: 'B', content: '高程' },
        { key: 'C', content: '角度' },
        { key: 'D', content: '距离' }
      ],
      answer: 'A',
      analysis: '导线网是将单导线连接起来，构成有结点的图形，一般由数个闭合的环线组成。导线网的检核条件较多，能有效地避免测量错误，提高控制网的精度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '导线测量', '导线网'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_156',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '根据《水利水电工程施工测量规范》（SL 52—2015）有关导线网的布设应符合如下规定：采用导线网作为平面控制网的首级网时，导线宜布置成（）结点网。',
      options: [
        { key: 'A', content: '环形' },
        { key: 'B', content: '放射形' },
        { key: 'C', content: '树形' },
        { key: 'D', content: '链形' }
      ],
      answer: 'A',
      analysis: '根据《水利水电工程施工测量规范》（SL 52—2015）有关导线网的布设应符合如下规定：采用导线网作为平面控制网的首级网时，导线宜布置成环形结点网。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '导线测量', '规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_157',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '导线网结点间长度不应大于表2-3中规定导线总长的（）倍。',
      options: [
        { key: 'A', content: '0.7' },
        { key: 'B', content: '0.5' },
        { key: 'C', content: '1.0' },
        { key: 'D', content: '1.5' }
      ],
      answer: 'A',
      analysis: '根据《水利水电工程施工测量规范》（SL 52—2015）规定，导线网结点间长度不应大于表2-3中规定导线总长的0.7倍。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', '导线测量', '规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_158',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '根据《全球定位系统（GPS）测量规范》（GB/T 18314—2009）的规定，按照GPS网的不同用途，将GPS网划分为（）个等级。',
      options: [
        { key: 'A', content: '5' },
        { key: 'B', content: '3' },
        { key: 'C', content: '4' },
        { key: 'D', content: '6' }
      ],
      answer: 'A',
      analysis: '根据《全球定位系统（GPS）测量规范》（GB/T 18314—2009）的规定，按照GPS网的不同用途，将GPS网划分为A、B、C、D、E 5个等级，其相应的精度要求见表2-2。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '等级'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_159',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '在水利水电工程中，GPS网的布设一般只选择B、C、D、E级网，A级主要用于（）。',
      options: [
        { key: 'A', content: '全球地壳形变、精密定轨和地球动力学研究' },
        { key: 'B', content: '工程施工控制' },
        { key: 'C', content: '地形测量' },
        { key: 'D', content: '放样测量' }
      ],
      answer: 'A',
      analysis: '在水利水电工程中，GPS网的布设一般只选择B、C、D、E级网，A级主要用于全球地壳形变、精密定轨和地球动力学研究。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '等级'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_160',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '对于精度较高的GPS网，点之间的距离相对精度至少要达到1/30万，网中各点的点位中误差一般小于（）mm。',
      options: [
        { key: 'A', content: '±5' },
        { key: 'B', content: '±10' },
        { key: 'C', content: '±1' },
        { key: 'D', content: '±20' }
      ],
      answer: 'A',
      analysis: '对于精度较高的GPS网，点之间的距离相对精度至少要达到1/30万，网中各点的点位中误差一般小于±5mm，有些监测网的点位中误差甚至要求达到±1mm的精度。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', 'GPS测量', '精度'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'survey_161',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS测量误差大体可以分为三类，包括（）。',
      options: [
        { key: 'A', content: 'GPS卫星的误差' },
        { key: 'B', content: 'GPS卫星信号传播误差' },
        { key: 'C', content: 'GPS接收机的误差' },
        { key: 'D', content: '操作人员误差' }
      ],
      answer: 'A,B,C',
      analysis: 'GPS测量误差大体可以分为三类：GPS卫星的误差、GPS卫星信号传播误差和GPS接收机的误差。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '误差'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_162',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS接收机的误差主要有（）。',
      options: [
        { key: 'A', content: 'GPS观测误差' },
        { key: 'B', content: '接收机钟差' },
        { key: 'C', content: '天线相位中心偏移误差' },
        { key: 'D', content: '卫星轨道误差' }
      ],
      answer: 'A,B,C',
      analysis: 'GPS接收机的误差主要有GPS观测误差、接收机钟差和天线相位中心偏移误差。卫星轨道误差属于GPS卫星的误差。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '误差'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_163',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '导线的类型根据布设形式，可以分为（）。',
      options: [
        { key: 'A', content: '闭合导线' },
        { key: 'B', content: '附合导线' },
        { key: 'C', content: '支导线' },
        { key: 'D', content: '导线网' }
      ],
      answer: 'A,B,C',
      analysis: '导线的类型根据布设形式，可以分为单一导线和导线网，单一导线可以分为闭合导线、附合导线和支导线三种。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '导线测量', '类型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_164',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '导线测量的外业工作一般包括（）。',
      options: [
        { key: 'A', content: '选点、埋石' },
        { key: 'B', content: '导线水平观测' },
        { key: 'C', content: '天顶距观测' },
        { key: 'D', content: '导线边长观测' }
      ],
      answer: 'A,B,C,D',
      analysis: '导线测量的外业工作一般包括：选点、埋石，导线水平观测，天顶距观测，导线边长观测，仪器高和觇标高量测，气象数据测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '导线测量', '外业'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_165',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制测量作业程序包括（）。',
      options: [
        { key: 'A', content: '收集有关资料进行分析' },
        { key: 'B', content: '技术设计' },
        { key: 'C', content: '组织与实施' },
        { key: 'D', content: '数据预处理及平差计算' }
      ],
      answer: 'A,B,C,D',
      analysis: '控制测量作业程序包括：收集有关资料进行分析、技术设计、组织与实施、数据预处理及平差计算、质量控制、资料整理以及归档。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '作业程序'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_166',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '质量控制可分为以下几个步骤（）。',
      options: [
        { key: 'A', content: '事先指导' },
        { key: 'B', content: '中间检查' },
        { key: 'C', content: '检查验收' },
        { key: 'D', content: '资料归档' }
      ],
      answer: 'A,B,C',
      analysis: '质量控制可分为以下几个步骤：（1）事先指导。加强作业人员的质量意识，审查技术设计方案及技术交底等。（2）中间检查。此阶段的检查工作是在实施外业的过程中进行。（3）检查验收。由作业单位的技术管理部门组织进行。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '控制测量', '质量控制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_167',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '提高GPS网精度的措施包括（）。',
      options: [
        { key: 'A', content: '进行GPS网的优化设计，增加必要的多余观测' },
        { key: 'B', content: '采用高精度的GPS接收机和性能好的GPS天线观测' },
        { key: 'C', content: '改进测量对中标志，减少对中和目标偏心误差的影响' },
        { key: 'D', content: '选择有利的观测时间' }
      ],
      answer: 'A,B,C,D',
      analysis: '提高GPS网精度的措施包括：进行GPS网的优化设计，增加必要的多余观测；采用高精度的GPS接收机和性能好的GPS天线观测；改进测量对中标志，减少对中和目标偏心误差的影响；选择有利的观测时间。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '精度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_168',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS网的可靠性是用于衡量控制网辨别粗差、抵抗粗差影响能力的指标，一般分为（）。',
      options: [
        { key: 'A', content: '内可靠性指标' },
        { key: 'B', content: '外可靠性指标' },
        { key: 'C', content: '精度指标' },
        { key: 'D', content: '效率指标' }
      ],
      answer: 'A,B',
      analysis: 'GPS网的可靠性是用于衡量控制网辨别粗差、抵抗粗差影响能力的指标，一般分为内可靠性指标和外可靠性指标。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '可靠性'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'survey_169',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS定位测量中所采用的协议地球坐标系，称为WGS-84世界大地坐标系。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。GPS定位测量中所采用的协议地球坐标系，称为WGS-84世界大地坐标系。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', 'GPS测量', '坐标系'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_170',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '绝对静态定位测量的定位精度可以达到毫米级。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。绝对静态定位测量的定位精度约为20m左右，远不能满足控制测量的精度要求。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', 'GPS测量', '定位精度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_171',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '相对静态定位测量是使用2台或以上的GPS接收机进行同步观测。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。相对静态定位测量是使用2台或以上的GPS接收机，在保持GPS接收机天线静止的状态下，同步观测4颗以上的GPS卫星。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', 'GPS测量', '相对静态定位'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_172',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '目前，精度要求较高的工程控制网采用的是相对静态定位测量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。目前，精度要求较高的工程控制网采用的是相对静态定位测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', 'GPS测量', '控制网'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_173',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'RTK技术是以载波相位观测量为根据的实时差分GPS定位技术。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。实时动态定位技术（RTK技术），是以载波相位观测量为根据的实时差分GPS定位技术，是GPS发展的一个里程碑。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', 'GPS测量', 'RTK'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_174',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '利用单频GPS接收机观测可有效削弱电离层的传播误差。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。利用双频GPS接收机观测可有效削弱电离层的传播误差，而不是单频。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '误差'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_175',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '闭合导线是导线起闭于同一点，形成闭合多边形，具有检核条件。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。闭合导线是导线起闭于同一点，形成闭合多边形。此种导线存在着几何条件，具有检核条件。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '导线测量', '闭合导线'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_176',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '支导线缺乏检核条件，故其边数一般不超过5条。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。支导线缺乏检核条件，故其边数一般不超过3条，并且只在控制精度要求不高的条件下使用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '导线测量', '支导线'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_177',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第三章 导线测量',
      content: '在实际工程测量中，根据测区不同的情况和精度要求，一般首选导线网。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在实际工程测量中，根据测区不同的情况和精度要求，一般首选导线网，其次是附合导线、闭合导线。对精度要求较高的首级平面控制网应布设成导线网。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '导线测量', '导线网'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_178',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '数据预处理及平差计算一般采用数据处理软件，所使用的软件必须是随机的软件或经过国家权威部门正式鉴定的合格软件。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。目前，数据预处理及平差计算一般采用数据处理软件，所使用的软件必须是随机的软件或经过国家权威部门正式鉴定的合格软件。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '数据处理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_179',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '三、四等水准测量数据预处理，应进行水准标尺长度误差的改正和正常水准面不平行的改正。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。三、四等水准测量数据预处理，应进行水准标尺长度误差的改正和正常水准面不平行的改正。一、二等水准测量数据预处理除上述的两项改正外，必要时，还进行重力异常改正和日月引力改正。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', '控制测量', '数据预处理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_180',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS网中的多余观测分量越多，则网的可靠性越高。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。一般来说，GPS网中的多余观测分量越多，则网的可靠性越高。同样，GPS网的等级越高，网的可靠性要求也越高。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '可靠性'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
