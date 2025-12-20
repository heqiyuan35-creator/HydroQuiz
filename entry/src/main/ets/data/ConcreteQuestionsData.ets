/**
 * 混凝土工程题目数据
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：混凝土工程（第3版）第一章 绪论
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取混凝土工程扩展题目
 * 单选题10题(50%)、多选题4题(20%)、判断题6题(30%)
 */
export function getConcreteExtendedQuestions(timestamp: number): Question[] {
  return [
    // ========== 单选题 10题 ==========
    {
      id: 'concrete_006',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '水工混凝土工程质量检测的依据中，《水工混凝土试验规程》的标准号是（）',
      options: [
        { key: 'A', content: 'SL 352-2006' },
        { key: 'B', content: 'SL 677-2014' },
        { key: 'C', content: 'DL/T 5144-2015' },
        { key: 'D', content: 'GB/T 8075-2017' }
      ],
      answer: 'A',
      analysis: '《水工混凝土试验规程》（SL 352-2006）在该标准中对混凝土的各项性能参数的试验条件、步骤和结果处理做了具体的规定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '质量检测', '标准规程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_007',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '水利工程一般工程量非常大，混凝土的浇筑量常以万m³计。混凝土施工的原材料量大、品种多，主要的原材料包括水泥、砂、石、掺合料、外加剂、钢筋等，如某混凝土大坝工程钢筋的生产厂家就有近（）家。',
      options: [
        { key: 'A', content: '5' },
        { key: 'B', content: '10' },
        { key: 'C', content: '15' },
        { key: 'D', content: '20' }
      ],
      answer: 'B',
      analysis: '水利工程材料来源广泛性的特点决定了原材料供应商众多。如某混凝土大坝工程钢筋的生产厂家就有近10家，水泥、砂、石的供应商也有好几家。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '材料来源', '施工特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_008',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '混凝土拌和物性能检测项目中，工作度的检测指标不包括（）',
      options: [
        { key: 'A', content: '坍落度' },
        { key: 'B', content: '维勃稠度' },
        { key: 'C', content: '抗压强度' },
        { key: 'D', content: 'VC值' }
      ],
      answer: 'C',
      analysis: '混凝土拌和物性能检测项目中，工作度的检测指标包括：坍落度、维勃稠度、坍扩度、VC值等。抗压强度属于混凝土物理力学性能检测项目。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '拌和物', '工作度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_009',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '水工混凝土工程设计方面的特点中，一个水利枢纽工程所处的地理、地质和水文情况以及季节变化情况都不尽相同，建筑物的功能、规模、布局和形式也不可能一样，因此水利枢纽工程具有（）',
      options: [
        { key: 'A', content: '复杂性' },
        { key: 'B', content: '唯一性' },
        { key: 'C', content: '多样性' },
        { key: 'D', content: '标准性' }
      ],
      answer: 'B',
      analysis: '各水利枢纽工程所处的地理、地质和水文情况以及季节变化情况都不尽相同，建筑物的功能、规模、布局和形式也不可能一样，因此水利枢纽工程具有唯一性，只能逐个进行设计。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '设计特点', '唯一性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_010',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '水工混凝土工程设计涉及的技术专业多，设计工作量大。设计需要水文、地质、水工结构、水力学、岩土、施工、金属结构、机电、道路交通、施工机械、安全监测、环保等专业技术人员共同参与，这体现了设计的（）特点。',
      options: [
        { key: 'A', content: '唯一性' },
        { key: 'B', content: '复杂性' },
        { key: 'C', content: '涉及的技术专业多' },
        { key: 'D', content: '周期长' }
      ],
      answer: 'C',
      analysis: '设计涉及的技术专业多，设计工作量大。设计需要水文、地质、水工结构、水力学、岩土、施工、金属结构、机电、道路交通、施工机械、安全监测、环保等专业技术人员共同参与，需要协调的问题多。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '设计特点', '专业多'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_011',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '混凝土物理力学性能检测项目中，不包括以下哪项？',
      options: [
        { key: 'A', content: '抗压强度' },
        { key: 'B', content: '弹性模量' },
        { key: 'C', content: '含气量' },
        { key: 'D', content: '导热系数' }
      ],
      answer: 'C',
      analysis: '混凝土物理力学性能检测项目包括：抗压强度、劈裂抗拉强度以及轴拉强度、抗弯强度、抗剪强度、弹性模量、极限拉伸、干缩变形、徐变变形、自生体积变形、绝热温升、导热系数、比热等。含气量属于混凝土拌和物性能检测项目。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '物理力学性能', '检测项目'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_012',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '水工混凝土工程施工方面的特点中，水利工程多处在偏远山区的河道上，远离经济发达的城市，交通不便，物资供应和运输困难，施工受自然条件和季节变化影响大，这体现了施工的（）特点。',
      options: [
        { key: 'A', content: '工艺复杂性' },
        { key: 'B', content: '偏远性' },
        { key: 'C', content: '系统庞杂性' },
        { key: 'D', content: '时效性强' }
      ],
      answer: 'B',
      analysis: '水利工程多处在偏远山区的河道上，远离经济发达的城市，交通不便，物资供应和运输困难，施工受自然条件和季节变化影响大。这是施工偏远性的特点。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '施工特点', '偏远性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_013',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '混凝土耐久性能检测项目不包括（）',
      options: [
        { key: 'A', content: '抗冻性' },
        { key: 'B', content: '抗渗性' },
        { key: 'C', content: '抗碳化性' },
        { key: 'D', content: '坍落度' }
      ],
      answer: 'D',
      analysis: '混凝土耐久性能检测项目包括：抗冻性、抗渗性、抗冲磨性及抗气蚀性、抗侵蚀性、碱骨料反应、抗碳化性等。坍落度属于混凝土拌和物性能检测项目。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '耐久性能', '检测项目'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_014',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '根据水利部对工程质量控制管理的要求，监理单位和施工单位都应按施工自检量的一定比例取样，委托社会检测机构进行检测，政府质量监督部门也应对工程抽取一定量的试样进行（）。',
      options: [
        { key: 'A', content: '自检检测' },
        { key: 'B', content: '平行检测' },
        { key: 'C', content: '监督检测' },
        { key: 'D', content: '验收检测' }
      ],
      answer: 'C',
      analysis: '根据水利部对工程质量控制管理的要求，监理单位和施工单位都应按施工自检量的一定比例取样，委托社会检测机构进行检测，政府质量监督部门也应对工程抽取一定量的试样进行监督检测。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '质量控制', '监督检测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_015',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '通常模拟式显示装置的分辨力为标尺分度值的（），即用肉眼可以分辨到一个分度值的该比例。',
      options: [
        { key: 'A', content: '1/5' },
        { key: 'B', content: '1/2' },
        { key: 'C', content: '1/10' },
        { key: 'D', content: '1/4' }
      ],
      answer: 'B',
      analysis: '通常模拟式显示装置的分辨力为标尺分度值的1/2，即用肉眼可以分辨到一个分度值的1/2。对于数字式显示装置的分辨力为末位数字的一个数码。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '检测仪器', '分辨力'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 4题 ==========
    {
      id: 'concrete_016',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '水工混凝土工程质量检测的依据包括（）',
      options: [
        { key: 'A', content: '法律、法规、规章的规定' },
        { key: 'B', content: '国家标准、水利水电行业标准' },
        { key: 'C', content: '工程承包合同认定的其他标准和文件' },
        { key: 'D', content: '批准的设计文件、金属结构、机电设备安装等技术说明书' }
      ],
      answer: 'A,B,C,D',
      analysis: '水利工程质量检测的依据包括：(1)法律、法规、规章的规定；(2)国家标准、水利水电行业标准；(3)工程承包合同认定的其他标准和文件；(4)批准的设计文件、金属结构、机电设备安装等技术说明书；(5)其他特定要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '质量检测', '依据'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_017',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '水工混凝土工程设计方面的特点包括（）',
      options: [
        { key: 'A', content: '勘测设计周期长' },
        { key: 'B', content: '设计涉及的技术专业多，设计工作量大' },
        { key: 'C', content: '设计的唯一性' },
        { key: 'D', content: '施工过程中的设计修改多' }
      ],
      answer: 'A,B,C,D',
      analysis: '水工混凝土工程设计方面的特点包括：(一)勘测设计周期长；(二)设计涉及的技术专业多，设计工作量大；(三)设计的唯一性；(四)建筑物结构形式的多样性；(五)建筑物混凝土有分区要求；(六)施工过程中的设计修改多。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '设计特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_018',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '水工混凝土工程施工方面的特点包括（）',
      options: [
        { key: 'A', content: '偏远性' },
        { key: 'B', content: '工艺复杂性' },
        { key: 'C', content: '施工系统庞杂性' },
        { key: 'D', content: '材料来源的广泛性' }
      ],
      answer: 'A,B,C,D',
      analysis: '水工混凝土工程施工方面的特点包括：(一)偏远性；(二)工艺复杂性；(三)施工系统庞杂性；(四)材料来源的广泛性；(五)施工的时效性强；(六)施工单位自检工作量大；(七)委托检测工作量大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '施工特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_019',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '水工混凝土工程质量检测应包括以下哪些内容（）',
      options: [
        { key: 'A', content: '原材料质量检测' },
        { key: 'B', content: '混凝土拌和物性能检测' },
        { key: 'C', content: '混凝土物理力学性能检测' },
        { key: 'D', content: '混凝土耐久性能检测' }
      ],
      answer: 'A,B,C,D',
      analysis: '水工混凝土工程质量检测应包括以下内容：一、原材料质量检测；二、混凝土拌和物性能检测；三、混凝土物理力学性能检测；四、混凝土耐久性能检测；五、现场混凝土质量检测；六、砂浆性能检测。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '质量检测', '内容'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 6题 ==========
    {
      id: 'concrete_020',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '用于大坝、水闸、泵站、堤防、桥梁、涵洞等水工建筑物的混凝土称水工混凝土。水工混凝土的合理设计及其施工质量的严格控制是水工建筑物工程质量的重要保证。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。用于大坝、水闸、泵站、堤防、桥梁、涵洞等水工建筑物的混凝土称水工混凝土。水工混凝土的合理设计及其施工质量的严格控制是水工建筑物工程质量的重要保证，以致关系到整个水工建筑物的安全运行。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '水工混凝土', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_021',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '混凝土的质量受诸多因素的影响，原材料与混凝土拌和物质量的波动、浇筑及养护工艺的变异等均将对混凝土质量产生很大影响。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。混凝土的质量受诸多因素的影响，原材料与混凝土拌和物质量的波动、浇筑及养护工艺的变异等均将对混凝土质量产生很大影响。例如，直接影响混凝土强度的有水泥强度的波动，掺合料品质、外加剂质量、砂石骨料的含泥量和泥团含量以及坚固性等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '质量影响因素'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_022',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '混凝土施工计划性强、浇筑强度大、进度快，质量检验必须跟踪进行，否则就会发生质量失控、无法反映和无法证明施工质量的情况。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。施工的时效性强。混凝土施工计划性强、浇筑强度大、进度快，质量检验必须跟踪进行，否则就会发生质量失控、无法反映和无法证明施工质量的情况。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '施工特点', '时效性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_023',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '施工单位质量检验的工作必须跟踪各种原材料进场，按规定抽检频数进行抽检，并在规定的相当短的时间内完成，以判断所进场的材料品质是否合格可用。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。施工单位自检工作量大。施工单位质量检验的工作必须跟踪各种原材料进场，按规定抽检频数进行抽检，并在规定的相当短的时间内完成，以判断所进场的材料品质是否合格可用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '施工单位', '自检'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_024',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '现场混凝土质量检测的作用是，查明缺陷存在的位置、状态，对已经建成的建筑物的质量评价提供技术数据依据，为分析评估缺陷对建筑物安全威胁提供技术数据依据，为病害造成的破坏提供修补加固的技术数据依据。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。现场混凝土质量检测的作用是，查明缺陷存在的位置、状态，对已经建成的建筑物的质量评价提供技术数据依据，为分析评估缺陷对建筑物安全威胁提供技术数据依据，为病害造成的破坏提供修补加固的技术数据依据。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '现场检测', '作用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_025',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 绪论',
      content: '混凝土大坝本身就有重力坝、拱坝、支墩坝等，还有引水发电设施、泄洪设施、灌溉供水设施及桥梁、闸门启闭机房等建筑物。建筑结构复杂，坝体内部布置有许多孔洞（如廊道、冲砂孔等），计算边界条件非常复杂，只能简化计算，或采用有限单元法进行计算。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。建筑物结构形式的多样性。混凝土大坝本身就有重力坝、拱坝、支墩坝等，还有引水发电设施、泄洪设施、灌溉供水设施及桥梁、闸门启闭机房等建筑物。建筑结构复杂，坝体内部布置有许多孔洞（如廊道、冲砂孔等），计算边界条件非常复杂，只能简化计算，或采用有限单元法进行计算，在数值计算时往往需要采用模型试验进行验证。',
      difficulty: DifficultyLevel.HARD,
      tags: ['混凝土', '建筑结构', '多样性'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
