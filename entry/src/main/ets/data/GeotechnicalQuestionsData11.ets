/**
 * 岩土工程题目数据（第十一部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（地基与基础）第3版 钻芯法检测技术与要求
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目（第十一部分）
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions11(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_401',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯法检测时混凝土龄期不得少于（）d，如果协商一致，混凝土强度达到C20时，是可以提早进行钻芯检验的，无需等到28d龄期。',
      options: [
        { key: 'A', content: '7' },
        { key: 'B', content: '14' },
        { key: 'C', content: '21' },
        { key: 'D', content: '28' }
      ],
      answer: 'D',
      analysis: '钻芯法检测时混凝土龄期不得少于28d，如果协商一致，混凝土强度达到C20时，是可以提早进行钻芯检验的，无需等到28d龄期，但芯样试件的试验时间最好等到混凝土龄期大于或等于28d，以免因芯样抗压强度不满足设计要求而产生矛盾。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '检测时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_402',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '基桩钻芯检验抽取数量不应少于总桩数的（），且不得少于5根；当总桩数不大于50根时，钻芯检验桩数不得少于3根。',
      options: [
        { key: 'A', content: '3%' },
        { key: 'B', content: '5%' },
        { key: 'C', content: '8%' },
        { key: 'D', content: '10%' }
      ],
      answer: 'B',
      analysis: '抽取的数量应符合下列规定（验证检测和扩大检测不在此范围）：(1)基桩钻芯检验抽取数量不应少于总桩数的5%，且不得少于5根；当总桩数不大于50根时，钻芯检验桩数不得少于3根。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '抽样数量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_403',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '对于端承型大直径灌注桩，当受设备或现场条件限制无法检测单桩竖向抗压承载力时，可采用钻芯法测定桩底沉渣厚度并钻取桩端持力层岩土芯样检验桩端持力层。抽检数量不应少于总桩数的（），且不应少于10根。',
      options: [
        { key: 'A', content: '5%' },
        { key: 'B', content: '8%' },
        { key: 'C', content: '10%' },
        { key: 'D', content: '15%' }
      ],
      answer: 'C',
      analysis: '对于端承型大直径灌注桩，当受设备或现场条件限制无法检测单桩竖向抗压承载力时，可采用钻芯法测定桩底沉渣厚度并钻取桩端持力层岩土芯样检验桩端持力层。抽检数量不应少于总桩数的10%，且不应少于10根。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '抽样数量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_404',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '基桩钻孔数量应根据桩径D大小确定，当D<1.2m时，每桩钻（）孔。',
      options: [
        { key: 'A', content: '一' },
        { key: 'B', content: '二' },
        { key: 'C', content: '三' },
        { key: 'D', content: '四' }
      ],
      answer: 'A',
      analysis: '基桩钻孔数量应根据桩径D大小确定：(1)D<1.2m，每桩钻一孔；(2)1.2m≤D≤1.6m，每桩宜钻二孔；(3)D>1.6m，每桩宜钻三孔。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '钻芯法', '钻孔数量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_405',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '基桩钻孔数量应根据桩径D大小确定，当1.2m≤D≤1.6m时，每桩宜钻（）孔。',
      options: [
        { key: 'A', content: '一' },
        { key: 'B', content: '二' },
        { key: 'C', content: '三' },
        { key: 'D', content: '四' }
      ],
      answer: 'B',
      analysis: '基桩钻孔数量应根据桩径D大小确定：(1)D<1.2m，每桩钻一孔；(2)1.2m≤D≤1.6m，每桩宜钻二孔；(3)D>1.6m，每桩宜钻三孔。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '钻芯法', '钻孔数量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_406',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '当基桩钻芯孔为一个时，宜在距桩中心（）mm位置开孔，这主要是考虑导管附近的混凝土质量相对较差，不具有代表性。',
      options: [
        { key: 'A', content: '50~100' },
        { key: 'B', content: '100~150' },
        { key: 'C', content: '150~200' },
        { key: 'D', content: '200~250' }
      ],
      answer: 'B',
      analysis: '当基桩钻芯孔为一个时，宜在距桩中心100~150mm位置开孔，这主要是考虑导管附近的混凝土质量相对较差，不具有代表性；同时也方便第二个孔的位置布置；当钻芯孔为两个或两个以上时，宜在距桩中心(0.15~0.25)D内均匀对称布置。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻孔位置'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_407',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '《建筑地基基础设计规范》（GB 50007—2011）规定：嵌岩灌注桩要求按端承桩设计，桩端以下（）倍桩径范围内无软弱夹层、断裂破碎带和洞隙分布，在桩底应力扩散范围内无岩体临空面。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '2' },
        { key: 'C', content: '3' },
        { key: 'D', content: '5' }
      ],
      answer: 'C',
      analysis: '《建筑地基基础设计规范》（GB 50007—2011）规定：嵌岩灌注桩要求按端承桩设计，桩端以下3倍桩径范围内无软弱夹层、断裂破碎带和洞隙分布，在桩底应力扩散范围内无岩体临空面。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '嵌岩桩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_408',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '每桩至少应有一孔钻至设计要求的深度，如设计未有明确要求时，宜钻入持力层（）倍桩径且不应少于3m。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '2' },
        { key: 'C', content: '3' },
        { key: 'D', content: '5' }
      ],
      answer: 'C',
      analysis: '每桩至少应有一孔钻至设计要求的深度，如设计未有明确要求时，宜钻入持力层3倍桩径且不应少于3m。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻孔深度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_409',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '芯样采取率是衡量钻探设备性能和钻机操作人员技术水平以及芯样质量的综合指标。混凝土结构完整连续，采取率达到（）以上。',
      options: [
        { key: 'A', content: '80%' },
        { key: 'B', content: '85%' },
        { key: 'C', content: '90%' },
        { key: 'D', content: '95%' }
      ],
      answer: 'D',
      analysis: '芯样采取率是衡量钻探设备性能和钻机操作人员技术水平以及芯样质量的综合指标，一般应符合以下规定：(1)混凝土结构完整连续，采取率达到95%以上；(2)混凝土胶结尚好，采取率达到80%以上；(3)胶结差或没有胶结的，必须捞取样品（包括桩底沉渣）；(4)持力层岩芯采取率不少于80%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样采取率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_410',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '混凝土胶结尚好时，芯样采取率应达到（）以上。',
      options: [
        { key: 'A', content: '70%' },
        { key: 'B', content: '75%' },
        { key: 'C', content: '80%' },
        { key: 'D', content: '85%' }
      ],
      answer: 'C',
      analysis: '混凝土胶结尚好，采取率达到80%以上。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '钻芯法', '芯样采取率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_411',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '持力层岩芯采取率不少于（）。',
      options: [
        { key: 'A', content: '70%' },
        { key: 'B', content: '75%' },
        { key: 'C', content: '80%' },
        { key: 'D', content: '85%' }
      ],
      answer: 'C',
      analysis: '持力层岩芯采取率不少于80%。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '钻芯法', '芯样采取率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_412',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '芯样质量指标——在某一基桩中，用钻芯法连续采取的芯样中，大于10cm的混凝土芯样段长度之和与基桩中钻探混凝土总进尺的比值，以百分数表示。芯样质量指标参照《岩土工程勘察规范》（GB 50021—2001）（2009年版）第（）条岩石质量指标RQD计算。',
      options: [
        { key: 'A', content: '9.2.3' },
        { key: 'B', content: '9.2.4' },
        { key: 'C', content: '9.2.5' },
        { key: 'D', content: '9.2.6' }
      ],
      answer: 'B',
      analysis: '芯样质量指标——在某一基桩中，用钻芯法连续采取的芯样中，大于10cm的混凝土芯样段长度之和与基桩中钻探混凝土总进尺的比值，以百分数表示。芯样质量指标参照《岩土工程勘察规范》（GB 50021—2001）（2009年版）第9.2.4条岩石质量指标RQD计算。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '钻芯法', '芯样质量指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_413',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '规范表7.6.3桩身完整性判定特征提及单孔Ⅲ类桩局部混凝土芯样破碎段长度不大于（）cm，大于10cm为Ⅳ类桩特征。',
      options: [
        { key: 'A', content: '5' },
        { key: 'B', content: '8' },
        { key: 'C', content: '10' },
        { key: 'D', content: '15' }
      ],
      answer: 'C',
      analysis: '在《规范》（JGJ 106—2014）中未提及这两个指标，但规范表7.6.3桩身完整性判定特征提及单孔Ⅲ类桩局部混凝土芯样破碎段长度不大于10cm，大于10cm为Ⅳ类桩特征。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '桩身完整性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_414',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯工作完毕，应按规定办理签证认可手续，如果钻芯法检测结果满足设计要求，应对钻芯后留下的孔洞回灌封闭，以保证基桩的工作性能；可采用（）MPa压力，从钻芯孔底往上用水泥浆回灌封闭。',
      options: [
        { key: 'A', content: '0.3~0.5' },
        { key: 'B', content: '0.5~1.0' },
        { key: 'C', content: '1.0~1.5' },
        { key: 'D', content: '1.5~2.0' }
      ],
      answer: 'B',
      analysis: '钻芯工作完毕，应按规定办理签证认可手续，如果钻芯法检测结果满足设计要求，应对钻芯后留下的孔洞回灌封闭，以保证基桩的工作性能；可采用0.5~1.0MPa压力，从钻芯孔底往上用水泥浆回灌封闭，水泥浆的水灰比可为0.5~0.7。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻孔处理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_415',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻孔回灌封闭时，水泥浆的水灰比可为（）。',
      options: [
        { key: 'A', content: '0.3~0.5' },
        { key: 'B', content: '0.5~0.7' },
        { key: 'C', content: '0.7~0.9' },
        { key: 'D', content: '0.9~1.1' }
      ],
      answer: 'B',
      analysis: '可采用0.5~1.0MPa压力，从钻芯孔底往上用水泥浆回灌封闭，水泥浆的水灰比可为0.5~0.7。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻孔处理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_416',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻孔电视是工业电视的一种，它通过井下摄像探头摄取钻孔周围图像，图像信号经过视频电缆传输至地面监视器显示并记录钻孔图像。通过钻孔电视可直接观测钻孔中混凝土和地质体的各种特征，如混凝土蜂窝、沟槽、松散、断桩等以及地层岩性、岩石结构、断层、裂隙、夹层、岩溶等，还可用于（）。',
      options: [
        { key: 'A', content: '混凝土浇筑质量检测' },
        { key: 'B', content: '地下管道破损探测、地下仪器埋设监测等' },
        { key: 'C', content: '桩基承载力检测' },
        { key: 'D', content: '土层分布检测' }
      ],
      answer: 'B',
      analysis: '通过钻孔电视可直接观测钻孔中混凝土和地质体的各种特征，如混凝土蜂窝、沟槽、松散、断桩等以及地层岩性、岩石结构、断层、裂隙、夹层、岩溶等，还可用于混凝土浇筑质量、地下管道破损探测、地下仪器埋设监测等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻孔电视'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_417',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '当出现钻芯孔与桩体偏离时，应立即停机记录，分析原因。当有争议时，可进行钻孔测斜，以判断是受检桩倾斜超过规范要求还是钻芯孔倾斜超过规定要求。测斜仪有两类，一类不需要配置测斜管，只能测出是否倾斜，无法确定倾斜方位，测量精度较低。另一类需要配置测斜管，测量精度较高，不仅能测出是否倾斜，而且能确定（）。',
      options: [
        { key: 'A', content: '倾斜角度' },
        { key: 'B', content: '倾斜方位' },
        { key: 'C', content: '倾斜角度和倾斜方位' },
        { key: 'D', content: '倾斜深度' }
      ],
      answer: 'B',
      analysis: '测斜仪有两类，一类不需要配置测斜管，只能测出是否倾斜，无法确定倾斜方位，测量精度较低。另一类需要配置测斜管，测量精度较高，不仅能测出是否倾斜，而且能确定倾斜方位。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻孔测斜'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_418',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '对于强风化岩层或土层，宜采用合金钻取芯样，并进行动力触探或标准贯入试验等，试验宜在距桩底（）cm内进行，并准确记录试验结果。',
      options: [
        { key: 'A', content: '30' },
        { key: 'B', content: '50' },
        { key: 'C', content: '80' },
        { key: 'D', content: '100' }
      ],
      answer: 'B',
      analysis: '对于强风化岩层或土层，宜采用合金钻取芯样，并进行动力触探或标准贯入试验等，试验宜在距桩底50cm内进行，并准确记录试验结果；根据试验结果及钻取芯样综合鉴别岩性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '持力层钻芯'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_419',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '芯样的标识方法是比较好的唯一性标识方法，如第2个回次共有5块芯样，在第3块芯样上标记2/3/5，那么2/3/5可以非常清楚地表示出这是第（）回次的芯样。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '2' },
        { key: 'C', content: '3' },
        { key: 'D', content: '5' }
      ],
      answer: 'B',
      analysis: '芯样的标识方法是比较好的唯一性标识方法，如第2个回次共有5块芯样，在第3块芯样上标记2/3/5，那么2/3/5可以非常清楚地表示出这是第2回次的芯样，第2回次共有5块芯样，本块芯样为第3块。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '钻芯法', '芯样标识'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_420',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '为准确确定桩的中心点，桩头宜开挖裸露；来不及开挖或不便开挖的桩，应由（）测出桩位中心。',
      options: [
        { key: 'A', content: '施工单位' },
        { key: 'B', content: '监理单位' },
        { key: 'C', content: '经纬仪' },
        { key: 'D', content: '设计单位' }
      ],
      answer: 'C',
      analysis: '为准确确定桩的中心点，桩头宜开挖裸露；来不及开挖或不便开挖的桩，应由经纬仪测出桩位中心。灌注桩在浇筑混凝土时存在浇捣不均，不同深度或同一深度的不同位置混凝土浇捣质量可能不同，钻芯孔位合理布置，才能客观反应桩身混凝土的实际情况。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '桩位确定'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_421',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '混凝土芯样截取原则主要考虑两个方面（）。',
      options: [
        { key: 'A', content: '一是能科学、准确、客观地评价混凝土实际质量，特别是混凝土强度' },
        { key: 'B', content: '二是操作性较强，避免人为因素影响，故意选择好的或差的混凝土芯样进行抗压强度试验' },
        { key: 'C', content: '三是芯样数量要足够多' },
        { key: 'D', content: '四是芯样直径要足够大' }
      ],
      answer: 'A,B',
      analysis: '混凝土芯样截取原则主要考虑两个方面，一是能科学、准确、客观地评价混凝土实际质量，特别是混凝土强度；二是操作性较强，避免人为因素影响，故意选择好的或差的混凝土芯样进行抗压强度试验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样截取'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_422',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '芯样采取率是衡量钻探设备性能和钻机操作人员技术水平以及芯样质量的综合指标，一般应符合以下规定（）。',
      options: [
        { key: 'A', content: '混凝土结构完整连续，采取率达到95%以上' },
        { key: 'B', content: '混凝土胶结尚好，采取率达到80%以上' },
        { key: 'C', content: '胶结差或没有胶结的，必须捞取样品（包括桩底沉渣）' },
        { key: 'D', content: '持力层岩芯采取率不少于80%' }
      ],
      answer: 'A,B,C,D',
      analysis: '芯样采取率是衡量钻探设备性能和钻机操作人员技术水平以及芯样质量的综合指标，一般应符合以下规定：(1)混凝土结构完整连续，采取率达到95%以上；(2)混凝土胶结尚好，采取率达到80%以上；(3)胶结差或没有胶结的，必须捞取样品（包括桩底沉渣）；(4)持力层岩芯采取率不少于80%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样采取率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_423',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '对桩身混凝土芯样的描述包括（）。',
      options: [
        { key: 'A', content: '混凝土钻进深度、芯样连续性、完整性、胶结情况' },
        { key: 'B', content: '表面光滑情况、断口吻合程度、混凝土芯是否为柱状、骨料大小分布情况' },
        { key: 'C', content: '气孔、蜂窝麻面、沟槽、破碎、夹泥、松散的情况' },
        { key: 'D', content: '取样编号和取样位置' }
      ],
      answer: 'A,B,C,D',
      analysis: '对桩身混凝土芯样的描述包括混凝土钻进深度、芯样连续性、完整性、胶结情况、表面光滑情况、断口吻合程度、混凝土芯是否为柱状、骨料大小分布情况，以及气孔、蜂窝麻面、沟槽、破碎、夹泥、松散的情况，以及取样编号和取样位置。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样描述'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_424',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '对持力层的描述包括（）。',
      options: [
        { key: 'A', content: '持力层钻进深度、岩土名称、芯样颜色、结构（强风化或土层时的动力触探或标贯结果）' },
        { key: 'B', content: '构造、裂隙发育程度、坚硬及风化程度' },
        { key: 'C', content: '取样编号和取样位置' },
        { key: 'D', content: '分层岩层应分层描述' }
      ],
      answer: 'A,B,C,D',
      analysis: '对持力层的描述包括持力层钻进深度、岩土名称、芯样颜色、结构（强风化或土层时的动力触探或标贯结果）、构造、裂隙发育程度、坚硬及风化程度，以及取样编号和取样位置，分层岩层应分层描述。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '持力层描述'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_425',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯法检测现场操作记录表应包括（）。',
      options: [
        { key: 'A', content: '桩号、孔号、工程名称' },
        { key: 'B', content: '钻进时间、芯样编号、芯样长度' },
        { key: 'C', content: '残留芯样、芯样初步描述及异常情况记录' },
        { key: 'D', content: '检测日期、机长、记录、页次' }
      ],
      answer: 'A,B,C,D',
      analysis: '应按表4-9的格式及时记录钻进情况和钻进异常情况，对芯样质量做初步描述，包括记录孔号、回次数、起至深度、块数、总块数等。钻芯法检测现场操作记录表应包括桩号、孔号、工程名称、钻进时间、芯样编号、芯样长度、残留芯样、芯样初步描述及异常情况记录、检测日期、机长、记录、页次等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '现场记录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_426',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '芯样拍照要求包括（）。',
      options: [
        { key: 'A', content: '应对芯样和标有工程名称、桩号、钻芯孔号、芯样试件采取位置、桩长、孔深、检测单位名称的标示牌的全貌进行拍照' },
        { key: 'B', content: '应先拍彩色照片，后截取芯样试件' },
        { key: 'C', content: '拍照前应将被包封浸泡在水中的岩样打开并摆在相应位置' },
        { key: 'D', content: '取样完毕剩余的芯样宜移交委托单位妥善保存' }
      ],
      answer: 'A,B,C,D',
      analysis: '应对芯样和标有工程名称、桩号、钻芯孔号、芯样试件采取位置、桩长、孔深、检测单位名称的标示牌的全貌进行拍照（见图4-35）。应先拍彩色照片，后截取芯样试件，拍照前应将被包封浸泡在水中的岩样打开并摆在相应位置。取样完毕剩余的芯样宜移交委托单位妥善保存。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样拍照'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_427',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯法检测芯样编录表应包括的项目有（）。',
      options: [
        { key: 'A', content: '工程名称、日期、桩号/钻芯孔号、桩径、混凝土设计强度等级' },
        { key: 'B', content: '分段（层）深度、芯样描述' },
        { key: 'C', content: '取样编号、取样深度、备注' },
        { key: 'D', content: '检测单位、记录员、检测人员' }
      ],
      answer: 'A,B,C,D',
      analysis: '应按表4-10的格式对芯样混凝土、桩底沉渣以及桩端持力层做详细编录。钻芯法检测芯样编录表应包括工程名称、日期、桩号/钻芯孔号、桩径、混凝土设计强度等级、分段（层）深度、芯样描述、取样编号、取样深度、备注、检测单位、记录员、检测人员等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样编录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_428',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '如果钻芯法检测结果不满足设计要求，则应封存钻芯孔，留待处理。钻芯孔可作为桩身桩底高压灌浆加固补强孔。为了加强基桩质量的追溯性，要求在试验完毕后，由检测单位将芯样移交委托单位封样保存。保存时间由（）根据工程实际需定或至少保留到基础工程验收。',
      options: [
        { key: 'A', content: '建设单位' },
        { key: 'B', content: '监理单位' },
        { key: 'C', content: '施工单位' },
        { key: 'D', content: '检测单位' }
      ],
      answer: 'A,B',
      analysis: '如果钻芯法检测结果不满足设计要求，则应封存钻芯孔，留待处理。钻芯孔可作为桩身桩底高压灌浆加固补强孔。为了加强基桩质量的追溯性，要求在试验完毕后，由检测单位将芯样移交委托单位封样保存。保存时间由建设单位和监理单位根据工程实际需定或至少保留到基础工程验收。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样保存'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_429',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '一般来说，基桩钻芯法检测不应简单地采用随机抽样的方法进行，而应结合设计要求、施工现场成桩（墙）记录以及其他检测方法的检测结果，经过综合分析后对质量确有怀疑或质量较差的、有代表性的桩进行抽检，以提高检测结果的可靠性，减少工程隐患。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。一般来说，基桩钻芯法检测不应简单地采用随机抽样的方法进行，而应结合设计要求、施工现场成桩（墙）记录以及其他检测方法的检测结果，经过综合分析后对质量确有怀疑或质量较差的、有代表性的桩进行抽检，以提高检测结果的可靠性，减少工程隐患。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '抽样方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_430',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '若验收检测工期紧无法满足休止时间规定，应在检测报告中注明。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。钻芯法检测时混凝土龄期不得少于28d，如果协商一致，混凝土强度达到C20时，是可以提早进行钻芯检验的，无需等到28d龄期，但芯样试件的试验时间最好等到混凝土龄期大于或等于28d，以免因芯样抗压强度不满足设计要求而产生矛盾。若验收检测工期紧无法满足休止时间规定，应在检测报告中注明。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '检测时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_431',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '桩端持力层岩土性状的准确判断直接关系到受检桩的使用安全。虽然施工前已进行岩土工程勘察，但有时钻孔数量有限，对较复杂的地质条件，很难全面弄清岩石、土层的分布情况。因此，应对桩底持力层进行足够深度的钻探。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。桩端持力层岩土性状的准确判断直接关系到受检桩的使用安全。《建筑地基基础设计规范》（GB 50007—2011）规定：嵌岩灌注桩要求按端承桩设计，桩端以下3倍桩径范围内无软弱夹层、断裂破碎带和洞隙分布，在桩底应力扩散范围内无岩体临空面。虽然施工前已进行岩土工程勘察，但有时钻孔数量有限，对较复杂的地质条件，很难全面弄清岩石、土层的分布情况。因此，应对桩底持力层进行足够深度的钻探。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '持力层'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_432',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '当钻取的混凝土芯样均匀性较好时，芯样截取比较好办，当混凝土芯样均匀性较差或存在缺陷时，应根据实际情况，增加取样数量。所有取样位置应标注在芯样照片上。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。当钻取的混凝土芯样均匀性较好时，芯样截取比较好办，当混凝土芯样均匀性较差或存在缺陷时，应根据实际情况，增加取样数量。所有取样位置应标注在芯样照片上。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样截取'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_433',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '芯样质量指标和芯样采取率均很难用于评价基桩混凝土施工质量，总的来说，芯样质量指标和芯样采取率高，表示混凝土质量相对较好，芯样质量指标和芯样采取率低，表示混凝土质量相对较差，但是很难量化到与桩身完整性类别挂钩。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。芯样质量指标和芯样采取率均很难用于评价基桩混凝土施工质量，总的来说，芯样质量指标和芯样采取率高，表示混凝土质量相对较好，芯样质量指标和芯样采取率低，表示混凝土质量相对较差，但是很难量化到与桩身完整性类别挂钩。例如，桩长20m，芯样采取率为98%，意味着破碎和松散的芯样长度累计可能达0.4m，如果它们集中在同一个部位，那么该部位的混凝土质量很可能很差；如果它们分散在几个部位，那么桩身混凝土质量可能比较好。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '钻芯法', '质量评价'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_434',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻取的芯样应由上而下按回次顺序放进芯样箱中，每个回次的芯样应排成一排，为了避免丢失或人为调换，芯样侧面上应清晰标明回次数、块号、本回次总块数，采用写成带分数的形式是比较好的唯一性标识方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。钻取的芯样应由上而下按回次顺序放进芯样箱中，每个回次的芯样应排成一排，为了避免丢失或人为调换，芯样侧面上应清晰标明回次数、块号、本回次总块数，采用写成带分数的形式是比较好的唯一性标识方法，如第2个回次共有5块芯样，在第3块芯样上标记2/3/5。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样标识'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_435',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '有时由于现场管理不到位，现场人员未分工或分工不合理，往往未填写或未及时填写钻芯现场记录表，或填写不规范，或未使用芯样箱，芯样未编号或未及时编号，或编号不符合要求，芯样随意摆放，本应能拼接上的，结果人为地造成拼接不上，碎块未摆上去，甚至发生芯样丢失现象。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。有时由于现场管理不到位，现场人员未分工或分工不合理，往往未填写或未及时填写钻芯现场记录表，或填写不规范，或未使用芯样箱，芯样未编号或未及时编号，或编号不符合要求，芯样随意摆放，本应能拼接上的，结果人为地造成拼接不上，碎块未摆上去，甚至发生芯样丢失现象；有的将两个回次编成一个回次，一般来说，应该一个回次摆成一排。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '现场管理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_436',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '应采用适宜的方法对桩底持力层岩土性状进行鉴别。对中、微风化岩的桩底层，应采用单动双管钻具钻取芯样，如果是软质岩，拟截取的岩石芯样应及时包裹浸泡在水中，避免芯样受损。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。应采用适宜的方法对桩底持力层岩土性状进行鉴别。对中、微风化岩的桩底层，应采用单动双管钻具钻取芯样，如果是软质岩，拟截取的岩石芯样应及时包裹浸泡在水中，避免芯样受损；根据钻取芯样和岩石单轴抗压强度试验结果综合判断岩性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '持力层鉴别'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_437',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '条件许可时，可采用钻孔电视辅助判断混凝土质量。钻孔电视是工业电视的一种，它通过井下摄像探头摄取钻孔周围图像，图像信号经过视频电缆传输至地面监视器显示并记录钻孔图像。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。条件许可时，可采用钻孔电视辅助判断混凝土质量。钻孔电视是工业电视的一种，它通过井下摄像探头摄取钻孔周围图像，图像信号经过视频电缆传输至地面监视器显示并记录钻孔图像。新式的数字化钻孔电视更为先进、轻捷，并下图像信号传输至地面工业控制计算机，进行图像A/D转换、存储、回放、编辑等，并可通过普通VCD播放机回放观看图像。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻孔电视'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_438',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '基桩和地下连续墙钻芯法检测可采用随机抽样的方法，也可根据其他已完成的检测结果有针对性地确定桩位。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。基桩和地下连续墙钻芯法检测可采用随机抽样的方法，也可根据其他已完成的检测结果有针对性地确定桩位。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '钻芯法', '抽样方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_439',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '早期钻芯法采用单管钻具，实践证明，无法保证混凝土芯样的质量。钻杆的粗细也是影响钻孔垂直度的因素之一，选用较粗且平直的钻杆，由于其刚度大，与孔壁的间隙就小，是动就小，钻孔的垂直度就易保证。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。早期钻芯法采用单管钻具，实践证明，无法保证混凝土芯样的质量。钻杆的粗细也是影响钻孔垂直度的因素之一，选用较粗且平直的钻杆，由于其刚度大，与孔壁的间隙就小，是动就小，钻孔的垂直度就易保证。钻杆应顺直，直径宜为51mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻具要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_440',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '灌注桩在浇筑混凝土时存在浇捣不均，不同深度或同一深度的不同位置混凝土浇捣质量可能不同，钻芯孔位合理布置，才能客观反应桩身混凝土的实际情况。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。灌注桩在浇筑混凝土时存在浇捣不均，不同深度或同一深度的不同位置混凝土浇捣质量可能不同，钻芯孔位合理布置，才能客观反应桩身混凝土的实际情况。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻孔位置'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
