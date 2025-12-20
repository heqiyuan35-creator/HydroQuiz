/**
 * 量测题目数据 - 第一部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：量测（第3版）第一章 概述
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取量测题目（第一部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getSurveyMeasurementQuestions(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'survey_001',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '距离测量常用的仪器包括钢尺、电磁波测距仪和（）。',
      options: [
        { key: 'A', content: '水准仪' },
        { key: 'B', content: '双频激光干涉仪' },
        { key: 'C', content: '经纬仪' },
        { key: 'D', content: '全站仪' }
      ],
      answer: 'B',
      analysis: '距离测量常用的仪器包括钢尺、电磁波测距仪、双频激光干涉仪。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '距离测量', '仪器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_002',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '高程测量常用的仪器不包括（）。',
      options: [
        { key: 'A', content: '水准仪' },
        { key: 'B', content: '电子水准仪' },
        { key: 'C', content: '经纬仪' },
        { key: 'D', content: '钢尺' }
      ],
      answer: 'D',
      analysis: '高程测量常用的仪器包括水准仪、电子水准仪（几何水准测量）、经纬仪（三角高程测量）、液体静力水准仪、GPS接收机（GPS高程测量）。钢尺属于距离测量仪器。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '高程测量', '仪器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_003',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '坐标测量常用的仪器包括全站仪、GPS接收机、激光跟踪仪和（）。',
      options: [
        { key: 'A', content: '水准仪' },
        { key: 'B', content: '激光扫描仪' },
        { key: 'C', content: '钢尺' },
        { key: 'D', content: '电磁波测距仪' }
      ],
      answer: 'B',
      analysis: '坐标测量常用的仪器包括全站仪、GPS接收机、激光跟踪仪、激光扫描仪。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '坐标测量', '仪器'],
      createTime: timestamp,
      updateTime: timestamp
    },

    {
      id: 'survey_004',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '测量是测定目标物的形状、大小、空间位置、性质和相互关系的（）。',
      options: [
        { key: 'A', content: '工程技术' },
        { key: 'B', content: '科学技术' },
        { key: 'C', content: '管理方法' },
        { key: 'D', content: '检测手段' }
      ],
      answer: 'B',
      analysis: '测量是测定目标物的形状、大小、空间位置、性质和相互关系的科学技术。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '概念', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_005',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '检测测量所能获得的工程质量特性数据类型繁多，其中水工建筑物特征点、线、面的空间位置数据包括（）。',
      options: [
        { key: 'A', content: '平面坐标和高程' },
        { key: 'B', content: '长度和宽度' },
        { key: 'C', content: '角度和面积' },
        { key: 'D', content: '体积和重量' }
      ],
      answer: 'A',
      analysis: '检测测量所能获得的工程质量特性数据类型繁多，包括水工建筑物特征点、线、面的空间位置数据（平面坐标和高程）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '检测测量', '数据类型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_006',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '水利工程变形数据包括水平位移、垂直位移、倾斜、挠度及（）等。',
      options: [
        { key: 'A', content: '温度变形' },
        { key: 'B', content: '裂缝监测' },
        { key: 'C', content: '应力变化' },
        { key: 'D', content: '渗流量' }
      ],
      answer: 'B',
      analysis: '水利工程变形数据包括水平位移、垂直位移、倾斜、挠度及裂缝监测等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '数据类型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_007',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '政府质量监督单位、建设单位或监理单位必要时也须委托具有相应资质的工程质量检测单位进行质量检测，可委托检测单位进行重要部位的竣工测量，测绘主体建筑物基础开挖建基面的（）竣工地形图。',
      options: [
        { key: 'A', content: '1:500~1:1000' },
        { key: 'B', content: '1:200~1:500' },
        { key: 'C', content: '1:1000~1:2000' },
        { key: 'D', content: '1:100~1:200' }
      ],
      answer: 'B',
      analysis: '可委托检测单位进行重要部位的竣工测量，测绘主体建筑物基础开挖建基面的1:200~1:500竣工地形图（或高程平面图）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '竣工测量', '比例尺'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_008',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '《水利水电工程施工测量规范》的标准号是（）。',
      options: [
        { key: 'A', content: 'SL 47—94' },
        { key: 'B', content: 'SL 52—2015' },
        { key: 'C', content: 'SL 197—2013' },
        { key: 'D', content: 'SL 27—2014' }
      ],
      answer: 'B',
      analysis: '《水利水电工程施工测量规范》SL 52—2015是水利水电工程施工测量的主要规范。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '规范', '标准号'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_009',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '《水利水电基本建设工程单元工程质量等级评定标准》第一部分：土建工程的标准号是（）。',
      options: [
        { key: 'A', content: 'SL 176—2007' },
        { key: 'B', content: 'SL 631—2012' },
        { key: 'C', content: 'SL 635—2012' },
        { key: 'D', content: 'SL 223—2008' }
      ],
      answer: 'A',
      analysis: '《水利水电基本建设工程单元工程质量等级评定标准 第一部分：土建工程》（SL 176—2007）。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', '规范', '标准号'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_010',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '为使水利水电基本建设工程质量评定工作标准化、规范化、表格化，便于在施工现场进行单元工程质量等级评定，1995年5月水利部建管司颁发了一套与《水利水电基本建设工程单元工程质量等级评定标准》相配套使用的系列化表格，共有（）类213张表。',
      options: [
        { key: 'A', content: '5' },
        { key: 'B', content: '6' },
        { key: 'C', content: '7' },
        { key: 'D', content: '8' }
      ],
      answer: 'C',
      analysis: '1995年5月水利部建管司颁发了一套与《水利水电基本建设工程单元工程质量等级评定标准》相配套使用的系列化表格，共有7类213张表。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '质量评定', '表格'],
      createTime: timestamp,
      updateTime: timestamp
    },

    {
      id: 'survey_011',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '按照《水利工程质量检测管理规定》的规定，检测测量主要的检测项目及参数为：高程、平面位置、建筑物纵横轴线、建筑物断面几何尺寸、隐伏建筑物几何形态、结构件几何尺寸，包括（）等。',
      options: [
        { key: 'A', content: '弧度、长度、宽度、深度、高度、坡度、角度、面积、体积' },
        { key: 'B', content: '温度、湿度、压力、流量' },
        { key: 'C', content: '强度、硬度、密度' },
        { key: 'D', content: '应力、应变、位移' }
      ],
      answer: 'A',
      analysis: '检测测量主要的检测项目及参数为：高程、平面位置、建筑物纵横轴线、建筑物断面几何尺寸、隐伏建筑物几何形态、结构件几何尺寸，包括弧度、长度、宽度、深度、高度、坡度、角度、面积、体积。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '检测项目', '参数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_012',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '常用的测量方法有角度测量、距离测量、高程测量、坐标测量以及由这些方法组合而成的边角测量、导线测量、前方交会、侧方交会、后方交会和（）测量。',
      options: [
        { key: 'A', content: '水准' },
        { key: 'B', content: 'GPS' },
        { key: 'C', content: '三角' },
        { key: 'D', content: '全站仪' }
      ],
      answer: 'B',
      analysis: '常用的测量方法有角度测量、距离测量、高程测量、坐标测量以及由这些方法组合而成的边角测量、导线测量、前方交会、侧方交会、后方交会和GPS测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_013',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '地形测图的方法有平板仪测图、经纬仪测图、全站仪测图、航测成图和（）等。',
      options: [
        { key: 'A', content: '水准仪测图' },
        { key: 'B', content: '数字化测图' },
        { key: 'C', content: '钢尺测图' },
        { key: 'D', content: '罗盘仪测图' }
      ],
      answer: 'B',
      analysis: '地形测图的方法有平板仪测图、经纬仪测图、全站仪测图、航测成图、数字化测图等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '地形测图', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_014',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '角度测量常用的仪器包括（）。',
      options: [
        { key: 'A', content: '光学经纬仪、电子经纬仪、全自动陀螺经纬仪' },
        { key: 'B', content: '水准仪、电子水准仪' },
        { key: 'C', content: '钢尺、电磁波测距仪' },
        { key: 'D', content: 'GPS接收机、全站仪' }
      ],
      answer: 'A',
      analysis: '角度测量常用的仪器包括光学经纬仪、电子经纬仪、全自动陀螺经纬仪。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '角度测量', '仪器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_015',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '运行阶段测量工作主要任务是：水工建筑物及基础、地基、边坡、危岩等的外部变形监测、水库淤积测量、库岸稳定监测、下游河道演变测量，必要时进行（）监测。',
      options: [
        { key: 'A', content: '水库区地壳形变' },
        { key: 'B', content: '水位变化' },
        { key: 'C', content: '流量变化' },
        { key: 'D', content: '温度变化' }
      ],
      answer: 'A',
      analysis: '运行阶段测量工作主要任务是：水工建筑物及基础、地基、边坡、危岩等的外部变形监测、水库淤积测量、库岸稳定监测、下游河道演变测量，必要时进行水库区地壳形变监测。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '运行阶段', '监测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_016',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '外部变形监测的主要任务是监视建筑物及基础、地基、边坡、危岩、库区地壳等的稳定性，及时发现问题，以便采取措施，保证建筑物和运行的安全。外部变形监测项目主要有水平位移、垂直位移、倾斜、挠度及（）等。',
      options: [
        { key: 'A', content: '裂缝监测' },
        { key: 'B', content: '温度监测' },
        { key: 'C', content: '渗流监测' },
        { key: 'D', content: '应力监测' }
      ],
      answer: 'A',
      analysis: '外部变形监测项目主要有水平位移、垂直位移、倾斜、挠度及裂缝监测等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '项目'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_017',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '外部变形监测的方法和技术包括：常规的地面测量方法，用测量角度、边长和高差来测定变形的方法，如几何水准测量；专用的测量手段和仪器，如钻孔倾斜仪、多点位移计、测缝计、静力水准仪、正垂线、倒垂线、引张线、准直测量、倾斜测量等；摄影测量方法和（）。',
      options: [
        { key: 'A', content: 'GPS定位技术' },
        { key: 'B', content: '雷达测量技术' },
        { key: 'C', content: '声波测量技术' },
        { key: 'D', content: '红外测量技术' }
      ],
      answer: 'A',
      analysis: '外部变形监测的方法和技术包括：常规的地面测量方法；专用的测量手段和仪器；摄影测量方法；GPS定位技术。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_018',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '水库区地壳形变监测的方法有：GPS全球定位系统观测、精密水准测量、精密重力测量、精密测距、短基线、（）等。',
      options: [
        { key: 'A', content: '短水准和边角网' },
        { key: 'B', content: '全站仪测量' },
        { key: 'C', content: '航空摄影测量' },
        { key: 'D', content: '遥感测量' }
      ],
      answer: 'A',
      analysis: '水库区地壳形变监测的方法有：GPS全球定位系统观测、精密水准测量、精密重力测量、精密测距、短基线、短水准和边角网等。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', '地壳形变', '监测方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_019',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '"隔河岩水电站库区变形监测网"采用GPS技术，代替常规的用T3经纬仪测角、用（）测距的方法。',
      options: [
        { key: 'A', content: '钢尺' },
        { key: 'B', content: '光电测距仪' },
        { key: 'C', content: '全站仪' },
        { key: 'D', content: '激光测距仪' }
      ],
      answer: 'B',
      analysis: '"隔河岩水电站库区变形监测网"采用GPS技术，代替常规的用T3经纬仪测角、用光电测距仪测距的方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS', '监测网'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_020',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '检测测量所获得工程几何特性的质量参数值，要与规范、设计、招标文件等所规定的参数值相比较，求出差值。若差值在规定的允许范围内，则该项质量特性符合要求，允许范围值又称工程几何特性参数的（）。',
      options: [
        { key: 'A', content: '质量检测标准' },
        { key: 'B', content: '设计标准' },
        { key: 'C', content: '施工标准' },
        { key: 'D', content: '验收标准' }
      ],
      answer: 'A',
      analysis: '检测测量所获得工程几何特性的质量参数值，要与规范、设计、招标文件等所规定的参数值相比较，求出差值。若差值在规定的允许范围内，则该项质量特性符合要求，允许范围值又称工程几何特性参数的质量检测标准。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '质量检测', '标准'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'survey_021',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '水利水电工程施工规范包括（）。',
      options: [
        { key: 'A', content: '《水工混凝土施工规范》（DL/T 5144—2015）' },
        { key: 'B', content: '《水轮发电机组安装技术规范》（GB/T 8564—2003）' },
        { key: 'C', content: '《水闸施工规范》（SL 27—2014）' },
        { key: 'D', content: '《水利水电工程施工测量规范》（SL 52—2015）' }
      ],
      answer: 'A,B,C,D',
      analysis: '水利水电工程施工规范包括《水工混凝土施工规范》（DL/T 5144—2015）、《水轮发电机组安装技术规范》（GB/T 8564—2003）、《水闸施工规范》（SL 27—2014）、《水利水电工程施工测量规范》（SL 52—2015）等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '规范', '施工规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_022',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '水利水电工程质量评定与验收规程包括（）。',
      options: [
        { key: 'A', content: '《水利水电单元工程施工质量验收评定标准—水工金属结构工程》（SL 635—2012）' },
        { key: 'B', content: '《水轮发电机组安装工程》（DL/T 5113.3—2012）' },
        { key: 'C', content: '《水利水电单元工程施工质量验收评定标准—土石方工程》（SL 631—2012）' },
        { key: 'D', content: '《发电电气设备安装工程》（DL/T 5113.5—2012）' }
      ],
      answer: 'A,B,C,D',
      analysis: '水利水电工程质量评定与验收规程包括《水利水电单元工程施工质量验收评定标准—水工金属结构工程》（SL 635—2012）、《水轮发电机组安装工程》（DL/T 5113.3—2012）、《水利水电单元工程施工质量验收评定标准—土石方工程》（SL 631—2012）、《发电电气设备安装工程》（DL/T 5113.5—2012）等。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', '规范', '验收规程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_023',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '检测测量是水利水电工程质量检测的主要方法和重要手段，工程施工自始至终都离不开测量，凡是有施工测量的地方都伴随着检测测量。这些检测测量在施工测量规范中都有明确规定，例如（）。',
      options: [
        { key: 'A', content: '测量放样前首先要对控制网点进行检测' },
        { key: 'B', content: '对轮廓放样点进行检核以自检为主' },
        { key: 'C', content: '每次测量放样作业结束后，及时对放样点进行检测' },
        { key: 'D', content: '模板检查验收时，若发现检查结果超限或存在明显系统误差应及时对可疑部分进行复测、确认' }
      ],
      answer: 'A,B,C,D',
      analysis: '这些检测测量在施工测量规范中都有明确规定，例如：测量放样前首先要对控制网点进行检测；对轮廓放样点进行检核以自检为主，每次测量放样作业结束后，及时对放样点进行检测；模板检查验收时，若发现检查结果超限或存在明显系统误差应及时对可疑部分进行复测、确认等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '检测测量', '规定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_024',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '监理单位也须进行检测测量，在施工单位自检的基础上对水利水电工程重要的点、线、面和关键部位进行抽检。例如（）。',
      options: [
        { key: 'A', content: '控制网点、金属结构与机电设备安装专用网或安装轴线点与高程基准点' },
        { key: 'B', content: '主要水工建筑物的轴线和重要轮廓点' },
        { key: 'C', content: '地下工程、建筑物过流部位或隐蔽工程' },
        { key: 'D', content: '进行抽检的重点' }
      ],
      answer: 'A,B,C,D',
      analysis: '监理单位也须进行检测测量，在施工单位自检的基础上对水利水电工程重要的点、线、面和关键部位进行抽检。例如：控制网点、金属结构与机电设备安装专用网或安装轴线点与高程基准点，主要水工建筑物的轴线和重要轮廓点，地下工程、建筑物过流部位或隐蔽工程等，都是进行抽检的重点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '监理', '抽检'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_025',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '测量在发展过程中所形成的测量理论、测量技术和测量方法，可直接用于质量检测测量，并成为工程质量检测的理论技术基础之一。测量拥有先进的测量技术，例如（）。',
      options: [
        { key: 'A', content: 'GPS技术、RS技术、GIS技术' },
        { key: 'B', content: '数字化测绘技术' },
        { key: 'C', content: '三角测量、三边测量、边角测量' },
        { key: 'D', content: '导线测量、前方交会、侧方交会、后方交会和GPS测量' }
      ],
      answer: 'A,B,C,D',
      analysis: '测量拥有先进的测量技术，例如GPS技术、RS技术、GIS技术、数字化测绘技术；还有众多的可供选择的各式各样的测量方法，例如控制测量的方法有三角测量、三边测量、边角测量、导线测量、前方交会、侧方交会、后方交会和GPS测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量技术', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_026',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '竣工测量应随着施工的进展，按竣工测量的要求，逐渐积累采集竣工资料。待单项工程完工后，进行一次全面的竣工测量。竣工测量内容包括（）。',
      options: [
        { key: 'A', content: '测绘主体建筑物关键部位与设计图同位置的开挖竣工纵、横断面图' },
        { key: 'B', content: '测绘地下工程开挖、衬砌或喷锚竣工断面图' },
        { key: 'C', content: '测量建筑物过流部位或隐蔽工程的形体' },
        { key: 'D', content: '测量建筑物各种主要孔、洞的形体等' }
      ],
      answer: 'A,B,C,D',
      analysis: '竣工测量内容包括：测绘主体建筑物关键部位与设计图同位置的开挖竣工纵、横断面图；测绘地下工程开挖、衬砌或喷锚竣工断面图；测量建筑物过流部位或隐蔽工程的形体；测量建筑物各种主要孔、洞的形体等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '竣工测量', '内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_027',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '测量是一门古老的学科，发展至今，形成了系统的科学理论，例如（）。',
      options: [
        { key: 'A', content: '地图投影理论、控制网布设理论' },
        { key: 'B', content: '控制网优化设计理论、误差理论' },
        { key: 'C', content: '测量平差原理、可靠性理论' },
        { key: 'D', content: '相关分析理论' }
      ],
      answer: 'A,B,C,D',
      analysis: '测量是一门古老的学科，发展至今，形成了系统的科学理论，例如地图投影理论、控制网布设理论、控制网优化设计理论、误差理论、测量平差原理、可靠性理论、相关分析理论等。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', '理论', '学科'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_028',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '变形分析是变形监测的重要内容，主要包括（）。',
      options: [
        { key: 'A', content: '数据处理' },
        { key: 'B', content: '几何分析' },
        { key: 'C', content: '物理解释' },
        { key: 'D', content: '统计分析和确定函数法' }
      ],
      answer: 'A,B,C,D',
      analysis: '变形分析是变形监测的重要内容，主要包括数据处理、几何分析、物理解释等。采用向量空间的理论和最小二乘参数估计原理来进行数据处理。通过几何分析可以反映变形体的几何状态变化和变形的时间特性。物理解释对变形和变形原因之间的关系进行研究，通常采用的方法有两种：统计分析和确定函数法。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', '变形分析', '内容'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'survey_029',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '测量是测定目标物的形状、大小、空间位置、性质和相互关系的科学技术。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。测量是测定目标物的形状、大小、空间位置、性质和相互关系的科学技术。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '概念', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_030',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '检测测量是水利水电工程质量检测的主要方法和重要手段。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检测测量是水利水电工程质量检测的主要方法和重要手段，工程施工自始至终都离不开测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '检测测量', '重要性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_031',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '水利工程变形数据只包括水平位移和垂直位移。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。水利工程变形数据包括水平位移、垂直位移、倾斜、挠度及裂缝监测等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '变形数据', '类型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_032',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '角度测量常用的仪器包括光学经纬仪、电子经纬仪、全自动陀螺经纬仪。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。角度测量常用的仪器包括光学经纬仪、电子经纬仪、全自动陀螺经纬仪。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '角度测量', '仪器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_033',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '距离测量常用的仪器只有钢尺和电磁波测距仪。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。距离测量常用的仪器包括钢尺、电磁波测距仪、双频激光干涉仪。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '距离测量', '仪器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_034',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '外部变形监测的方法只有常规的地面测量方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。外部变形监测的方法和技术包括：常规的地面测量方法；专用的测量手段和仪器；摄影测量方法；GPS定位技术。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形监测', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_035',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '地形测图的方法有平板仪测图、经纬仪测图、全站仪测图、航测成图和数字化测图等。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。地形测图的方法有平板仪测图、经纬仪测图、全站仪测图、航测成图、数字化测图等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '地形测图', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_036',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '《水利水电工程施工测量规范》的标准号是SL 47—94。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。《水利水电工程施工测量规范》的标准号是SL 52—2015。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '规范', '标准号'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_037',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '监理单位不需要进行检测测量，只需要施工单位自检即可。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。监理单位也须进行检测测量，在施工单位自检的基础上对水利水电工程重要的点、线、面和关键部位进行抽检。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '监理', '检测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_038',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '变形分析是变形监测的重要内容，主要包括数据处理、几何分析、物理解释等。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。变形分析是变形监测的重要内容，主要包括数据处理、几何分析、物理解释等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '变形分析', '内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_039',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '坐标测量常用的仪器包括全站仪、GPS接收机、激光跟踪仪、激光扫描仪。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。坐标测量常用的仪器包括全站仪、GPS接收机、激光跟踪仪、激光扫描仪。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '坐标测量', '仪器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_040',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 概述',
      content: '竣工测量只需要在工程全部完工后进行一次即可。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。竣工测量应随着施工的进展，按竣工测量的要求，逐渐积累采集竣工资料。待单项工程完工后，进行一次全面的竣工测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '竣工测量', '要求'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
