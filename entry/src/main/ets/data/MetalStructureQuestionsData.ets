/**
 * 金属结构题目数据 - 第一部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：金属结构（第3版）第一章 水工金属结构质量检验内容、术语、定义和标准
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取金属结构题目（第一部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getMetalStructureQuestions1(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'metal_001',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '水工金属结构主要是用于泄水、引水、发电和通航等建筑物的各类钢闸门、压力钢管等及其相应的启闭设备。它主要包括钢闸门、拦污栅、启闭机、压力钢管、清污机以及（）。',
      options: [
        { key: 'A', content: '过坝通航金属结构' },
        { key: 'B', content: '混凝土结构' },
        { key: 'C', content: '土石坝' },
        { key: 'D', content: '溢洪道' }
      ],
      answer: 'A',
      analysis: '水工金属结构主要是用于泄水、引水、发电和通航等建筑物的各类钢闸门、压力钢管等及其相应的启闭设备。它主要包括钢闸门、拦污栅、启闭机、压力钢管、清污机以及过坝通航金属结构等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '基本概念'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_002',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '水工钢结构的钢闸门品种繁多，大致可分为平面滑动闸门、平面定轮闸门、平面链轮闸门、弧形闸门、人字闸门及（）等。',
      options: [
        { key: 'A', content: '拦污栅' },
        { key: 'B', content: '压力钢管' },
        { key: 'C', content: '启闭机' },
        { key: 'D', content: '清污机' }
      ],
      answer: 'A',
      analysis: '水工钢结构的钢闸门品种繁多，大致可分为平面滑动闸门、平面定轮闸门、平面链轮闸门、弧形闸门、人字闸门及拦污栅等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '钢闸门', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_003',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '平面滑动闸门是以滑道为支承的封闭坝体水道孔口的（）。',
      options: [
        { key: 'A', content: '平面型闸门' },
        { key: 'B', content: '弧形闸门' },
        { key: 'C', content: '人字闸门' },
        { key: 'D', content: '链轮闸门' }
      ],
      answer: 'A',
      analysis: '平面滑动闸门：以滑道为支承的封闭坝体水道孔口的平面型闸门。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '钢闸门', '平面滑动闸门'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_004',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '弧形闸门是以支铰为支承的封闭坝体水道孔口的（）。',
      options: [
        { key: 'A', content: '转动弧形闸门' },
        { key: 'B', content: '平面型闸门' },
        { key: 'C', content: '人字形闸门' },
        { key: 'D', content: '链轮闸门' }
      ],
      answer: 'A',
      analysis: '弧形闸门：以支铰为支承的封闭坝体水道孔口的转动弧形闸门。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '钢闸门', '弧形闸门'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_005',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '人字闸门是以顶底枢为支承的门体，旋转后构成人字形门体封闭水道孔口的（）。',
      options: [
        { key: 'A', content: '平面型闸门' },
        { key: 'B', content: '弧形闸门' },
        { key: 'C', content: '链轮闸门' },
        { key: 'D', content: '定轮闸门' }
      ],
      answer: 'A',
      analysis: '人字闸门：以顶底枢为支承的门体，旋转后构成人字形门体封闭水道孔口的平面型闸门。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '钢闸门', '人字闸门'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_006',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '拦污栅的作用是防止坝前水域漂浮物从发电孔口流向水轮机的（）。',
      options: [
        { key: 'A', content: '平面栅体结构' },
        { key: 'B', content: '弧形结构' },
        { key: 'C', content: '人字形结构' },
        { key: 'D', content: '圆形结构' }
      ],
      answer: 'A',
      analysis: '拦污栅：防止坝前水域漂浮物从发电孔口流向水轮机的平面栅体结构。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '拦污栅'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_007',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '浮式闸门是在门体内充泄水流，利用（）原理封闭孔口的闸门。',
      options: [
        { key: 'A', content: '浮力' },
        { key: 'B', content: '重力' },
        { key: 'C', content: '液压' },
        { key: 'D', content: '气压' }
      ],
      answer: 'A',
      analysis: '浮式闸门：在门体内充泄水流，利用浮力原理封闭孔口的闸门。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '钢闸门', '浮式闸门'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_008',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '螺杆式启闭机是利用（）原理操作闸门的启闭设备。',
      options: [
        { key: 'A', content: '螺旋副' },
        { key: 'B', content: '液压' },
        { key: 'C', content: '卷扬' },
        { key: 'D', content: '门架' }
      ],
      answer: 'A',
      analysis: '螺杆式启闭机：利用螺旋副原理操作闸门的启闭设备。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '启闭机', '螺杆式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_009',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '液压式启闭机是利用液压原理控制活塞杆升降操作闸门的（）。',
      options: [
        { key: 'A', content: '启闭设备' },
        { key: 'B', content: '清污设备' },
        { key: 'C', content: '拦污设备' },
        { key: 'D', content: '过坝设备' }
      ],
      answer: 'A',
      analysis: '液压式启闭机：利用液压原理控制活塞杆升降操作闸门的启闭设备。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '启闭机', '液压式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_010',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '清污启闭机是利用门架上的爬升及运行机构，在坝顶轨道上行走，清除拦污栅栅体上杂物的（）。',
      options: [
        { key: 'A', content: '启闭设备' },
        { key: 'B', content: '闸门设备' },
        { key: 'C', content: '压力钢管' },
        { key: 'D', content: '过坝设备' }
      ],
      answer: 'A',
      analysis: '清污启闭机：利用门架上的爬升及运行机构，在坝顶轨道上行走，清除拦污栅栅体上杂物的启闭设备。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '启闭机', '清污启闭机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_011',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '压力钢管是坝前水流引向厂房发电机组的（）。',
      options: [
        { key: 'A', content: '高压管道' },
        { key: 'B', content: '低压管道' },
        { key: 'C', content: '排水管道' },
        { key: 'D', content: '通风管道' }
      ],
      answer: 'A',
      analysis: '压力钢管：坝前水流引向厂房发电机组的高压管道。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '压力钢管'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_012',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '质量管理是确定的质量方针目标和职责，并在质量体系中通过质量策划、质量控制、质量保证和质量改进，使其实施的全部管理职能的（）。',
      options: [
        { key: 'A', content: '所有活动' },
        { key: 'B', content: '部分活动' },
        { key: 'C', content: '检验活动' },
        { key: 'D', content: '生产活动' }
      ],
      answer: 'A',
      analysis: '质量管理：确定的质量方针目标和职责，并在质量体系中通过质量策划、质量控制、质量保证和质量改进，使其实施的全部管理职能的所有活动。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '术语定义', '质量管理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_013',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '测量检验是将被测的长度与作为标准长度单位量相比较的过程。规定合理的测量器具（测量仪器和量具）和测量方法以及正确地处理（）的数据。',
      options: [
        { key: 'A', content: '测量过程' },
        { key: 'B', content: '生产过程' },
        { key: 'C', content: '设计过程' },
        { key: 'D', content: '安装过程' }
      ],
      answer: 'A',
      analysis: '测量检验：将被测的长度与作为标准长度单位量相比较的过程。规定合理的测量器具（测量仪器和量具）和测量方法以及正确地处理测量过程的数据。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '术语定义', '测量检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_014',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '形位公差是单一实际要素的形状所允许的变动全量和并联实际要素的位置对基准所允许的（）。',
      options: [
        { key: 'A', content: '变动全量' },
        { key: 'B', content: '最大值' },
        { key: 'C', content: '最小值' },
        { key: 'D', content: '平均值' }
      ],
      answer: 'A',
      analysis: '形位公差：单一实际要素的形状所允许的变动全量和并联实际要素的位置对基准所允许的变动全量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '术语定义', '形位公差'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_015',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '门式启闭机是利用门架的起升和运行机构，在坝顶轨道上行走，操作不同闸门的（）。',
      options: [
        { key: 'A', content: '启闭设备' },
        { key: 'B', content: '清污设备' },
        { key: 'C', content: '拦污设备' },
        { key: 'D', content: '过坝设备' }
      ],
      answer: 'A',
      analysis: '门式启闭机：利用门架的起升和运行机构，在坝顶轨道上行走，操作不同闸门的启闭设备。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '启闭机', '门式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_016',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '桥式启闭机是利用桥架的起升和运行机构，在高架轨道上行走，操作不同闸门的（）。',
      options: [
        { key: 'A', content: '启闭设备' },
        { key: 'B', content: '清污设备' },
        { key: 'C', content: '拦污设备' },
        { key: 'D', content: '过坝设备' }
      ],
      answer: 'A',
      analysis: '桥式启闭机：利用桥架的起升和运行机构，在高架轨道上行走，操作不同闸门的启闭设备。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '启闭机', '桥式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_017',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '固定卷扬式启闭机是利用卷筒和钢丝绳操作闸门的（）。',
      options: [
        { key: 'A', content: '启闭设备' },
        { key: 'B', content: '清污设备' },
        { key: 'C', content: '拦污设备' },
        { key: 'D', content: '过坝设备' }
      ],
      answer: 'A',
      analysis: '固定卷扬式启闭机：利用卷筒和钢丝绳操作闸门的启闭设备。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '启闭机', '固定卷扬式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_018',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '垂直升船机是利用高架上的卷扬提升设备，启闭承船厢完成船舶过坝的（）。',
      options: [
        { key: 'A', content: '启闭设备' },
        { key: 'B', content: '清污设备' },
        { key: 'C', content: '拦污设备' },
        { key: 'D', content: '闸门设备' }
      ],
      answer: 'A',
      analysis: '垂直升船机：利用高架上的卷扬提升设备，启闭承船厢完成船舶过坝的启闭设备。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '启闭机', '垂直升船机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_019',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '斜面升船机是利用卷扬提升设备，拖动承船厢在斜面轨道上行走，完成船舶过坝的（）。',
      options: [
        { key: 'A', content: '启闭设备' },
        { key: 'B', content: '清污设备' },
        { key: 'C', content: '拦污设备' },
        { key: 'D', content: '闸门设备' }
      ],
      answer: 'A',
      analysis: '斜面升船机：利用卷扬提升设备，拖动承船厢在斜面轨道上行走，完成船舶过坝的启闭设备。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '启闭机', '斜面升船机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_020',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '制造、安装质量检验所使用的测量仪器与工具必须经法定计量部门检定合格，且在（）内。',
      options: [
        { key: 'A', content: '有效使用期' },
        { key: 'B', content: '保修期' },
        { key: 'C', content: '生产日期' },
        { key: 'D', content: '设计寿命' }
      ],
      answer: 'A',
      analysis: '制造、安装质量检验所使用的测量仪器与工具必须经法定计量部门检定合格，且在有效使用期内。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '检验仪器', '要求'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'metal_021',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '钢闸门在制造、安装及运行中的质量检验内容主要包括（）。',
      options: [
        { key: 'A', content: '闸门和埋件主要构件材料质量检验' },
        { key: 'B', content: '闸门主要零部件材料（铸钢件和锻钢件）质量检验' },
        { key: 'C', content: '闸门和埋件主体焊接结构件焊接质量检验' },
        { key: 'D', content: '闸门和埋件组装质量检验、防腐蚀质量检验、安装质量检验' }
      ],
      answer: 'A,B,C,D',
      analysis: '钢闸门在制造、安装及运行中的质量检验内容主要包括：闸门和埋件主要构件材料质量检验；闸门主要零部件材料（铸钢件和锻钢件）质量检验；闸门和埋件主体焊接结构件焊接质量检验；闸门和埋件组装质量检验；闸门和埋件防腐蚀质量检验；闸门和埋件安装质量检验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '钢闸门', '检验内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_022',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '启闭机质量检验内容包括（）。',
      options: [
        { key: 'A', content: '螺杆式启闭机' },
        { key: 'B', content: '固定卷扬式启闭机' },
        { key: 'C', content: '移动式启闭机' },
        { key: 'D', content: '液压式启闭机' }
      ],
      answer: 'A,B,C,D',
      analysis: '启闭机质量检验内容包括：螺杆式启闭机、固定卷扬式启闭机、移动式启闭机、液压式启闭机。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '启闭机', '检验内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_023',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '清污装置质量检验内容包括（）。',
      options: [
        { key: 'A', content: '拦污栅' },
        { key: 'B', content: '耙斗式清污机' },
        { key: 'C', content: '回转式清污机' },
        { key: 'D', content: '压力钢管' }
      ],
      answer: 'A,B,C',
      analysis: '清污装置质量检验内容包括：拦污栅、耙斗式清污机、回转式清污机。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '清污装置', '检验内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_024',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '压力钢管制作质量检验内容主要包括（）。',
      options: [
        { key: 'A', content: '钢管材料、焊接工艺评定及焊接工艺' },
        { key: 'B', content: '钢管瓦片几何尺寸、钢管管节几何尺寸' },
        { key: 'C', content: '纵缝焊缝检验及消应处理、岔管水压试验' },
        { key: 'D', content: '伸缩节组装、水压及气密性试验、压力钢管防腐蚀检验' }
      ],
      answer: 'A,B,C,D',
      analysis: '压力钢管制作质量检验内容主要包括：钢管材料、焊接工艺评定及焊接工艺、钢管瓦片几何尺寸、钢管管节几何尺寸、纵缝焊缝检验及消应处理、岔管水压试验、伸缩节组装、水压及气密性试验、压力钢管防腐蚀检验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '压力钢管', '检验内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_025',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '压力钢管安装质量检验内容主要包括（）。',
      options: [
        { key: 'A', content: '钢管安装始装节里程及垂直度' },
        { key: 'B', content: '钢管安装的里程及高程' },
        { key: 'C', content: '钢管安装焊缝检验及消应处理' },
        { key: 'D', content: '压力钢管水压试验' }
      ],
      answer: 'A,B,C,D',
      analysis: '压力钢管安装质量检验内容主要包括：钢管安装始装节里程及垂直度、钢管安装的里程及高程、钢管安装焊缝检验及消应处理、压力钢管水压试验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '压力钢管', '安装检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_026',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '对检验仪器与工具的主要要求有（）。',
      options: [
        { key: 'A', content: '制造、安装质量检验所使用的测量仪器与工具的精度必须达到相应检验规定的要求' },
        { key: 'B', content: '制造、安装质量检验所使用的测量仪器与工具必须经法定计量部门检定合格' },
        { key: 'C', content: '且在有效使用期内' },
        { key: 'D', content: '可以使用未经检定的仪器' }
      ],
      answer: 'A,B,C',
      analysis: '对检验仪器与工具的主要要求有：制造、安装质量检验所使用的测量仪器与工具的精度必须达到相应检验规定的要求；制造、安装质量检验所使用的测量仪器与工具必须经法定计量部门检定合格，且在有效使用期内。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '检验仪器', '要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_027',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '水工金属结构质量检验主要标准及规范有（）。',
      options: [
        { key: 'A', content: '《水利水电基本建设工程单元工程质量等级评定标准 金属结构及启闭机械安装工程》（DL/T 5113）' },
        { key: 'B', content: '《水利水电工程单元工程施工质量验收评定标准 水工金属结构安装工程》（SL 635）' },
        { key: 'C', content: '《水电工程钢闸门制造安装及验收规范》（NB/T 35045）' },
        { key: 'D', content: '《水电水利工程压力钢管制造安装及验收规范》（DL/T 5017）' }
      ],
      answer: 'A,B,C,D',
      analysis: '水工金属结构质量检验主要标准及规范包括多项国家和行业标准，如DL/T 5113、SL 635、NB/T 35045、DL/T 5017等。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '标准规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_028',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '承压设备无损检测的方法包括（）。',
      options: [
        { key: 'A', content: '射线检测、超声检测' },
        { key: 'B', content: '磁粉检测、渗透检测' },
        { key: 'C', content: '涡流检测、目视检测' },
        { key: 'D', content: '泄漏检测、声发射检测' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据《承压设备无损检测》（NB/T 47013）系列标准，承压设备无损检测的方法包括：射线检测、超声检测、磁粉检测、渗透检测、涡流检测、目视检测、泄漏检测、声发射检测、衍射时差法超声检测等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'metal_029',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '水工金属结构主要是用于泄水、引水、发电和通航等建筑物的各类钢闸门、压力钢管等及其相应的启闭设备。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。水工金属结构主要是用于泄水、引水、发电和通航等建筑物的各类钢闸门、压力钢管等及其相应的启闭设备。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '基本概念'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_030',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '平面定轮闸门是以定轮为支承的封闭坝体水道孔口的平面型闸门。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。平面定轮闸门：以定轮为支承的封闭坝体水道孔口的平面型闸门。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '钢闸门', '平面定轮闸门'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_031',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '平面链轮闸门是以履带为支承的封闭坝体水道孔口的平面型闸门。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。平面链轮闸门：以履带为支承的封闭坝体水道孔口的平面型闸门。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '钢闸门', '平面链轮闸门'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_032',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '弧形闸门是以滑道为支承的封闭坝体水道孔口的转动弧形闸门。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。弧形闸门是以支铰为支承的封闭坝体水道孔口的转动弧形闸门，而不是以滑道为支承。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '钢闸门', '弧形闸门'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_033',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '水工金属结构用于泄洪、引水、发电和通航等建筑物的压力钢管、各类钢闸门和相应的启闭设备等。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。水工金属结构：用于泄洪、引水、发电和通航等建筑物的压力钢管、各类钢闸门和相应的启闭设备等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '术语定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_034',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '制造、安装质量检验所使用的测量仪器与工具的精度不需要达到相应检验规定的要求。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。制造、安装质量检验所使用的测量仪器与工具的精度必须达到相应检验规定的要求。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '检验仪器', '要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_035',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '液压式启闭机是利用卷筒和钢丝绳操作闸门的启闭设备。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。液压式启闭机是利用液压原理控制活塞杆升降操作闸门的启闭设备。利用卷筒和钢丝绳操作闸门的是固定卷扬式启闭机。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '启闭机', '液压式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_036',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '压力钢管是坝前水流引向厂房发电机组的高压管道。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。压力钢管：坝前水流引向厂房发电机组的高压管道。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '压力钢管'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_037',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '《水工金属结构防腐蚀规范》的标准号是SL 105。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。《水工金属结构防腐蚀规范》（SL 105）是水工金属结构质量检验的主要标准之一。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '标准规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_038',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '《水利水电工程钢闸门设计规范》的标准号是SL 74。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。《水利水电工程钢闸门设计规范》（SL 74）是水工金属结构质量检验的主要标准之一。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '标准规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_039',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '《水利水电工程启闭机设计规范》的标准号是SL 41。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。《水利水电工程启闭机设计规范》（SL 41）是水工金属结构质量检验的主要标准之一。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '标准规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_040',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 水工金属结构质量检验',
      content: '《水工金属结构焊接通用技术条件》的标准号是SL 36。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。《水工金属结构焊接通用技术条件》（SL 36）是水工金属结构质量检验的主要标准之一。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '标准规范'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
