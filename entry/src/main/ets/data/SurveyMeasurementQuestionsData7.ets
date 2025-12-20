/**
 * 量测题目数据 - 第七部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：量测（第3版）第二章 控制测量 - 测量仪器、仪器检验、控制测量网观测与计算
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取量测题目（第七部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getSurveyMeasurementQuestions7(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'survey_221',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '在我国的工程测量规范中，按角度的精度将光学经纬仪划分为DJ₁、DJ₂、DJ₆几种型号，其中DJ₂表示（）。',
      options: [
        { key: 'A', content: '一测回方向观测中误差为±2″的经纬仪' },
        { key: 'B', content: '一测回方向观测中误差为±1″的经纬仪' },
        { key: 'C', content: '一测回方向观测中误差为±6″的经纬仪' },
        { key: 'D', content: '测距精度为2mm的经纬仪' }
      ],
      answer: 'A',
      analysis: '在我国的工程测量规范中，按角度的精度将光学经纬仪划分为DJ₁、DJ₂、DJ₆几种型号，Wild T₂、T₃是光学经纬仪的典型代表。DJ后面的数字表示一测回方向观测中误差的秒数。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '经纬仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_222',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '光学经纬仪主要由（）组成。',
      options: [
        { key: 'A', content: '望远镜、水平度盘和竖直度盘、水准器、测微器以及基座' },
        { key: 'B', content: '望远镜、测距仪、水准器' },
        { key: 'C', content: '望远镜、GPS接收机、基座' },
        { key: 'D', content: '测距仪、水平度盘、显示器' }
      ],
      answer: 'A',
      analysis: '光学经纬仪主要由望远镜、水平度盘和竖直度盘、水准器、测微器以及基座组成。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '测量仪器', '经纬仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_223',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '电磁波测距仪（EDM）是利用电磁波作为载波和调制波进行距离测量的仪器。其测距原理以公式表示为D=（）。',
      options: [
        { key: 'A', content: 'vt/2' },
        { key: 'B', content: 'vt' },
        { key: 'C', content: '2vt' },
        { key: 'D', content: 'v/2t' }
      ],
      answer: 'A',
      analysis: '电磁波测距仪的测距原理以公式表示为D=vt/2，式中D为距离(m)，v为电磁波在大气中的传播速度(m/s)，t为电磁波在测距仪与目标之间传播一次的往返时间(s)。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '测距仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_224',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '测距仪标称精度以固定误差和比例误差b表示，通常表示为a+bD（D为测距边长，km）。根据《水利水电工程施工测量规范》（SL 52—2015），将测距仪划分为（）级。',
      options: [
        { key: 'A', content: 'Ⅰ、Ⅱ、Ⅲ、Ⅳ' },
        { key: 'B', content: '甲、乙、丙' },
        { key: 'C', content: 'A、B、C、D' },
        { key: 'D', content: '一、二、三' }
      ],
      answer: 'A',
      analysis: '在《中、短程光电测距规范》（GB/T 16818—2008）和《水利水电工程施工测量规范》（SL 52—2015）中，根据测距精度，将测距仪划分为Ⅰ、Ⅱ、Ⅲ、Ⅳ级。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '测距仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_225',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '测距仪精度分级中，Ⅰ级测距仪的测距标称偏差m应满足（）。',
      options: [
        { key: 'A', content: 'm≤2mm' },
        { key: 'B', content: '2<m≤5mm' },
        { key: 'C', content: '5<m≤10mm' },
        { key: 'D', content: 'm>10mm' }
      ],
      answer: 'A',
      analysis: '根据测距仪精度分级表，Ⅰ级测距仪的测距标称偏差m≤2mm，Ⅱ级为2<m≤5mm，Ⅲ级为5<m≤10mm，Ⅳ级为m>10mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '测距仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_226',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '电子全站仪集成了经纬仪和测距仪的功能，通过照装棱镜，能同时进行（）的观测。',
      options: [
        { key: 'A', content: '水平角、垂直角和距离' },
        { key: 'B', content: '水平角和距离' },
        { key: 'C', content: '垂直角和距离' },
        { key: 'D', content: '水平角和垂直角' }
      ],
      answer: 'A',
      analysis: '电子全站仪集成了经纬仪和测距仪的功能，通过照装棱镜，能同时进行水平角、垂直角和距离的观测。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '测量仪器', '全站仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_227',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '电子全站仪型号较多，其测角精度从0.5″到6″甚至更大，测距部分的标称精度同电磁波测距仪一样，以固定误差和比例误差b表示，通常表示为（）。',
      options: [
        { key: 'A', content: 'a+bD（D为测距边长，km）' },
        { key: 'B', content: 'a×bD' },
        { key: 'C', content: 'a-bD' },
        { key: 'D', content: 'a/bD' }
      ],
      answer: 'A',
      analysis: '电子全站仪测距部分的标称精度同电磁波测距仪一样，以固定误差和比例误差b表示，通常表示为a+bD（D为测距边长，km）。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '测量仪器', '全站仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_228',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '测量机器人（Georobot，或称测地机器人）是能自动寻找测量目标并进行观测、记录的电子全站仪的俗称。它是在电子全站仪的基础上增加了两个步进马达和自动跟踪寻找目标的传感装置（）。',
      options: [
        { key: 'A', content: 'CCD阵列传感器' },
        { key: 'B', content: 'GPS接收器' },
        { key: 'C', content: '激光扫描仪' },
        { key: 'D', content: '红外传感器' }
      ],
      answer: 'A',
      analysis: '测量机器人是在电子全站仪的基础上增加了两个步进马达和自动跟踪寻找目标的传感装置（CCD阵列传感器），而且配备了智能化的多功能软件包。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '测量机器人'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_229',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水准测量基本原理是：借助水准仪上的水准器将视准轴置平以建立水平视线，根据水平视线在竖立的水准尺上的读数，测定（）。',
      options: [
        { key: 'A', content: '不同点间的高差' },
        { key: 'B', content: '水平距离' },
        { key: 'C', content: '方位角' },
        { key: 'D', content: '坐标' }
      ],
      answer: 'A',
      analysis: '水准测量基本原理是：借助水准仪上的水准器将视准轴置平以建立水平视线，根据水平视线在竖立的水准尺上的读数，测定不同点间的高差。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '测量仪器', '水准仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_230',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水准仪按每千米往返测高差中数的偶然中误差的大小划分为S₀₅、S₁、S₃、S₁₀四个系列，其中S₀₅系列水准仪每千米往返测高差中数的偶然中误差为（）。',
      options: [
        { key: 'A', content: '≤0.5mm' },
        { key: 'B', content: '≤1mm' },
        { key: 'C', content: '≤3mm' },
        { key: 'D', content: '≤10mm' }
      ],
      answer: 'A',
      analysis: '水准仪按每千米往返测高差中数的偶然中误差的大小划分为S₀₅、S₁、S₃、S₁₀四个系列。S₀₅系列≤0.5mm，S₁系列≤1mm，S₃系列≤3mm，S₁₀系列≤10mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '水准仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_231',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'S₀₅系列水准仪主要用途是（）。',
      options: [
        { key: 'A', content: '一、二等水准测量' },
        { key: 'B', content: '二、三等水准测量' },
        { key: 'C', content: '三、四等水准测量' },
        { key: 'D', content: '一般的水准测量' }
      ],
      answer: 'A',
      analysis: '根据水准仪的等级划分表，S₀₅系列主要用途是一、二等水准测量，S₁系列用于二、三等水准测量，S₃系列用于三、四等水准测量，S₁₀系列用于一般的水准测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '水准仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_232',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '电子水准仪（或俗称数字水准仪）与光学水准仪的结构有许多相同之处，区别在于：仪器内安装了（）。',
      options: [
        { key: 'A', content: 'CCD阵列传感器，增加了显示器和操作面板、数据记录存储器' },
        { key: 'B', content: 'GPS接收器' },
        { key: 'C', content: '激光发射器' },
        { key: 'D', content: '红外传感器' }
      ],
      answer: 'A',
      analysis: '电子水准仪与光学水准仪的结构有许多相同之处，区别在于：仪器内安装了CCD阵列传感器，增加了显示器和操作面板、数据记录存储器。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '电子水准仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_233',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '与电子水准仪配套使用的水准尺为（）。',
      options: [
        { key: 'A', content: '带有条码影像的标尺' },
        { key: 'B', content: '普通木质水准尺' },
        { key: 'C', content: '钢卷尺' },
        { key: 'D', content: '塔尺' }
      ],
      answer: 'A',
      analysis: '与电子水准仪配套使用的水准尺为带有条码影像的标尺。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '测量仪器', '电子水准仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_234',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '仪器的选用，主要是根据控制观测所要达到的精度以及仪器的标称精度来决定的。在《水利水电工程测量规范（规划设计阶段）》（SL 197—2013）中，四等电磁波三角高程测量的测角仪器应选用（）。',
      options: [
        { key: 'A', content: 'DJ₂型' },
        { key: 'B', content: 'DJ₁型' },
        { key: 'C', content: 'DJ₆型' },
        { key: 'D', content: 'DJ₀₇型' }
      ],
      answer: 'A',
      analysis: '根据《水利水电工程测量规范（规划设计阶段）》（SL 197—2013）中不同等级控制测量的仪器选用表，四等电磁波三角高程测量的测角仪器应选用DJ₂型。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '仪器选用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_235',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '根据《全球定位系统（GPS）测量规范》（GB/T 18314—2009）中，对GPS观测所使用的仪器规定，B级GPS网应使用（）GPS接收机。',
      options: [
        { key: 'A', content: '双频/全波长' },
        { key: 'B', content: '单频/双频' },
        { key: 'C', content: '单频' },
        { key: 'D', content: '任意类型' }
      ],
      answer: 'A',
      analysis: '根据GPS仪器的选用表，B级和C级GPS网应使用双频/全波长GPS接收机，D、E级可使用单频/双频GPS接收机。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', 'GPS测量', '仪器选用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_236',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '根据规范的要求，仪器使用前必须经过检验，并经国家技术监督局授权的仪器鉴定单位检定合格。有些检验项目除送仪器鉴定单位检定外，在作业过程中需按规定检验，如水准仪（）的检校。',
      options: [
        { key: 'A', content: 'i角' },
        { key: 'B', content: '测距精度' },
        { key: 'C', content: '测角精度' },
        { key: 'D', content: '放大倍率' }
      ],
      answer: 'A',
      analysis: '根据规范的要求，仪器使用前必须经过检验，并经国家技术监督局授权的仪器鉴定单位检定合格。有些检验项目除送仪器鉴定单位检定外，在作业过程中需按规定检验，如水准仪i角的检校。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '仪器检验', '水准仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_237',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '经纬仪的检验按《光学经纬仪》（JJG 414—2011）的规定进行，其中不包括（）。',
      options: [
        { key: 'A', content: '测距精度的检验' },
        { key: 'B', content: '照准部水准管轴与竖轴垂直的检验' },
        { key: 'C', content: '十字丝竖丝与横轴垂直的检验' },
        { key: 'D', content: '视准轴与横轴垂直的检验' }
      ],
      answer: 'A',
      analysis: '经纬仪的检验按《光学经纬仪》（JJG 414—2011）的规定进行，包括：照准部水准管轴与竖轴垂直的检验、十字丝竖丝与横轴垂直的检验、视准轴与横轴垂直的检验、横轴与竖轴垂直的检验、竖盘指标差的检验、光学对中器的检验。测距精度是测距仪的检验项目。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '仪器检验', '经纬仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_238',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '全站仪的检验按照《全站型电子速测仪检定规程》（JJG 100—2003）的规定进行。全站仪的检验包括测距误差检验和（）。',
      options: [
        { key: 'A', content: '测角误差检验' },
        { key: 'B', content: '水准测量检验' },
        { key: 'C', content: 'GPS定位检验' },
        { key: 'D', content: '气象参数检验' }
      ],
      answer: 'A',
      analysis: '全站仪的检验按照《全站型电子速测仪检定规程》（JJG 100—2003）的规定进行。全站仪的检验包括测距误差检验和测角误差检验。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '仪器检验', '全站仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_239',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '全站仪的测距误差检验中，测程的检定应在大气能见度好且无明显大气抖动的（）进行。',
      options: [
        { key: 'A', content: '阴天' },
        { key: 'B', content: '晴天中午' },
        { key: 'C', content: '雨天' },
        { key: 'D', content: '夜间' }
      ],
      answer: 'A',
      analysis: '全站仪的测距误差检验中，测程的检定应在大气能见度好且无明显大气抖动的阴天进行。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '仪器检验', '全站仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_240',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '控制测量根据工程的需要、测量设备的选用等不同，可以采取各种不同的测量方式。平面控制网可以采用测角网、测边网、边角网、光电测距导线网和（）等。',
      options: [
        { key: 'A', content: 'GPS网' },
        { key: 'B', content: '水准网' },
        { key: 'C', content: '高程网' },
        { key: 'D', content: '重力网' }
      ],
      answer: 'A',
      analysis: '控制测量根据工程的需要、测量设备的选用等不同，可以采取各种不同的测量方式。平面控制网可以采用测角网、测边网、边角网、光电测距导线网和GPS网等，高程控制网可以采用水准测量、光电测距三角高程测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', '平面控制网'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'survey_241',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '测量机器人的系统组成包括（）。',
      options: [
        { key: 'A', content: '坐标参考系统、操作系统、激励器' },
        { key: 'B', content: '计算机和控制器' },
        { key: 'C', content: '闭路控制传感器' },
        { key: 'D', content: '目标捕获、集成传感器' }
      ],
      answer: 'A,B,C,D',
      analysis: '测量机器人的系统组成包括坐标参考系统、操作系统、激励器、计算机和控制器、闭路控制传感器、目标捕获、集成传感器等几大部分。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '测量机器人'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_242',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水准尺有木质水准尺和钢瓦水准尺之分，还有（）之分。',
      options: [
        { key: 'A', content: '0.5cm刻度分划水准尺' },
        { key: 'B', content: '1cm刻度分划水准尺' },
        { key: 'C', content: '2cm刻度分划水准尺' },
        { key: 'D', content: '5cm刻度分划水准尺' }
      ],
      answer: 'A,B',
      analysis: '水准尺有木质水准尺和钢瓦水准尺之分，还有0.5cm刻度分划水准尺和1cm刻度分划水准尺之分。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '测量仪器', '水准尺'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_243',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水准仪的主要检验项目有（）。',
      options: [
        { key: 'A', content: '水准仪的检视、水准仪上概略水准器的检校' },
        { key: 'B', content: 'i角的检校、光学测微器检验及分划值测定' },
        { key: 'C', content: '气泡式水准仪交叉误差的检验' },
        { key: 'D', content: '调焦透镜运行误差的检验' }
      ],
      answer: 'A,B,C,D',
      analysis: '水准仪的主要检验项目有：水准仪的检视、水准仪上概略水准器的检校、i角的检校、光学测微器检验及分划值测定、气泡式水准仪交叉误差的检验、调焦透镜运行误差的检验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '仪器检验', '水准仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_244',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '水准尺的主要检验项目有（）。',
      options: [
        { key: 'A', content: '水准尺的检视、圆水准气泡的检校' },
        { key: 'B', content: '标尺分划面弯曲差的测定' },
        { key: 'C', content: '一对标尺名义米长的测定、一对水准尺零点差及基辅分划读数差差常数的测定' },
        { key: 'D', content: '标尺分米分划误差的测定' }
      ],
      answer: 'A,B,C,D',
      analysis: '水准尺的主要检验项目有：水准尺的检视、圆水准气泡的检校、标尺分划面弯曲差的测定、一对标尺名义米长的测定、一对水准尺零点差及基辅分划读数差差常数的测定、标尺分米分划误差的测定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '仪器检验', '水准尺'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_245',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS接收机的全面检验包括（）。',
      options: [
        { key: 'A', content: '一般检视' },
        { key: 'B', content: '通电检验' },
        { key: 'C', content: '试验检验' },
        { key: 'D', content: '精度检验' }
      ],
      answer: 'A,B,C',
      analysis: 'GPS接收机的全面检验包括一般检视、通电检验、试验检验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '仪器检验', 'GPS接收机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_246',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS接收机一般检视应符合以下规定（）。',
      options: [
        { key: 'A', content: 'GPS接收机及天线的外观良好，型号正确' },
        { key: 'B', content: '各部件及其附件应匹配、齐全和完好' },
        { key: 'C', content: '需紧固的部件不得松动和脱落' },
        { key: 'D', content: '设备使用手册和后处理软件齐全' }
      ],
      answer: 'A,B,C,D',
      analysis: 'GPS接收机一般检视应符合以下规定：GPS接收机及天线的外观良好，型号正确；各部件及其附件应匹配、齐全和完好；需紧固的部件不得松动和脱落；设备使用手册和后处理软件齐全。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '仪器检验', 'GPS接收机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_247',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS接收机通电检验应符合以下规定（）。',
      options: [
        { key: 'A', content: '有关信号灯工作正常' },
        { key: 'B', content: '按键和显示系统工作正常' },
        { key: 'C', content: '利用自测试命令进行测试' },
        { key: 'D', content: '检验接收机锁定卫星时间的快慢，接收机信号强弱及信号失锁情况' }
      ],
      answer: 'A,B,C,D',
      analysis: 'GPS接收机通电检验应符合以下规定：有关信号灯工作正常；按键和显示系统工作正常；利用自测试命令进行测试；检验接收机锁定卫星时间的快慢，接收机信号强弱及信号失锁情况。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '仪器检验', 'GPS接收机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_248',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS接收机试验检验应在不同长度的标准基线上进行测试，包括（）。',
      options: [
        { key: 'A', content: '接收机内部噪声水平测试' },
        { key: 'B', content: '接收机天线相位中心稳定性测试' },
        { key: 'C', content: '接收机野外作业性能及不同测程精度指标测试' },
        { key: 'D', content: '接收机频标稳定性检验和数据质量评价' }
      ],
      answer: 'A,B,C,D',
      analysis: 'GPS接收机试验检验应在不同长度的标准基线上进行测试，包括：接收机内部噪声水平测试；接收机天线相位中心稳定性测试；接收机野外作业性能及不同测程精度指标测试；接收机频标稳定性检验和数据质量评价；接收机高低温性能的测试；接收机综合性能评价。',
      difficulty: DifficultyLevel.HARD,
      tags: ['量测', '仪器检验', 'GPS接收机'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'survey_249',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '在我国的工程测量规范中，DJ₆表示一测回方向观测中误差为±6″的经纬仪。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在我国的工程测量规范中，按角度的精度将光学经纬仪划分为DJ₁、DJ₂、DJ₆几种型号，DJ后面的数字表示一测回方向观测中误差的秒数。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '测量仪器', '经纬仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_250',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '电子经纬仪的检定与光学经纬仪的检定基本相同，只不过电子经纬仪使用电子测角系统代替了光学经纬仪的读数系统。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。电子经纬仪的检定与光学经纬仪的检定基本相同，原因是：电子经纬仪的轴系、望远镜及制动、微动结构与光学经纬仪基本相同，只不过电子经纬仪使用电子测角系统代替了光学经纬仪的读数系统，并能显示测量结果。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '仪器检验', '经纬仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_251',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '测距仪标称精度以固定误差和比例误差b表示，通常表示为a×bD。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。测距仪标称精度以固定误差和比例误差b表示，通常表示为a+bD（D为测距边长，km），而不是a×bD。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '测量仪器', '测距仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_252',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'Ⅱ级测距仪的测距标称偏差m应满足2<m≤5mm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据测距仪精度分级表，Ⅱ级测距仪的测距标称偏差m应满足2<m≤5mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '测距仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_253',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '电子水准仪的出现，不仅取代了人工目视读数，还实现了数据的自动记录、检查、传输等，有利于数据处理的自动化，提高水准测量效率。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。电子水准仪的出现，不仅取代了人工目视读数，还实现了数据的自动记录、检查、传输等，有利于数据处理的自动化，提高水准测量效率。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '测量仪器', '电子水准仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_254',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'S₃系列水准仪主要用于一、二等水准测量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。S₃系列水准仪主要用于三、四等水准测量，而不是一、二等水准测量。一、二等水准测量应使用S₀₅系列水准仪。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '测量仪器', '水准仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_255',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '根据《国家一、二等水准测量规范》和《国家三、四等水准测量规范》的规定，作业前必须对水准仪和水准尺进行检验，特别是新水准仪和水准尺，应进行全面的检校。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据《国家一、二等水准测量规范》（GB/T 12897—2006）和《国家三、四等水准测量规范》（GB/T 12898—2009）的规定，作业前必须对水准仪和水准尺进行检验，特别是新水准仪和水准尺，应进行全面的检校。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '仪器检验', '水准仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_256',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS接收机测试检验的方法和技术要求，应满足《全球定位系统（GPS）测量型接收机检定规程》（CH 8016—1995）的有关规定。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。GPS接收机测试检验的方法和技术要求，应满足《全球定位系统（GPS）测量型接收机检定规程》（CH 8016—1995）的有关规定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '仪器检验', 'GPS接收机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_257',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '新购置的GPS接收机应按规定全面检验后使用，然后每年进行定期检验。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。新购置的GPS接收机应按规定全面检验后使用，然后每年进行定期检验。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '仪器检验', 'GPS接收机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_258',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '全站仪的测角部分与电子经纬仪的完全一样，可参照上述经纬仪的检验。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。全站仪的测角部分与电子经纬仪的完全一样，可参照上述经纬仪的检验。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '仪器检验', '全站仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_259',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: '全站仪的其他项目检查包括：测量数据记录功能的检查、数据通信功能的检查、内置软件运行正确性的检查。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。全站仪的其他项目检查包括：测量数据记录功能的检查、数据通信功能的检查、内置软件运行正确性的检查。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '仪器检验', '全站仪'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'survey_260',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 控制测量',
      content: 'GPS由于具备了常规测量方法不具备的优点，因而GPS网是目前最普遍和实用的一种平面控制网形式。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。GPS由于具备了常规测量方法不具备的优点，因而GPS网是目前最普遍和实用的一种平面控制网形式。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '控制测量', 'GPS网'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
