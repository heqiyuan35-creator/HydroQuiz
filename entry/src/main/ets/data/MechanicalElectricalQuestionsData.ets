/**
 * 机械电气题目数据 - 第一部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：机械电气（第3版）第一章 绪论 - 水力机械基本概念、分类、术语、质量检测
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取机械电气题目（第一部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getMechanicalElectricalQuestions1(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'mech_e_001',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '水力机械是指以液体如油、水等为工作介质与能量载体的机械设备。根据液体与机械的相互作用方式，可分成（）。',
      options: [
        { key: 'A', content: '容积式水力机械和叶片式水力机械' },
        { key: 'B', content: '反击式水力机械和冲击式水力机械' },
        { key: 'C', content: '径流式水力机械和轴流式水力机械' },
        { key: 'D', content: '高压水力机械和低压水力机械' }
      ],
      answer: 'A',
      analysis: '水力机械是指以液体如油、水等为工作介质与能量载体的机械设备。根据液体与机械的相互作用方式，可分成容积式水力机械和叶片式水力机械。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_002',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '容积式水力机械的特点不包括（）。',
      options: [
        { key: 'A', content: '能量转换是连续绕流叶片的介质与叶轮之间进行的' },
        { key: 'B', content: '工作介质处于工作腔，工作腔可以是一个或几个' },
        { key: 'C', content: '工作腔的容积是变化的' },
        { key: 'D', content: '机械和流体之间的作用主要是静压力' }
      ],
      answer: 'A',
      analysis: '容积式水力机械的特点是：(1)工作介质处于工作腔，工作腔可以是一个或几个；(2)工作腔的容积是变化的；(3)机械和流体之间的作用主要是静压力。选项A是叶片式水力机械的特点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '容积式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_003',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '叶片式水力机械的特点是能量转换是连续绕流叶片的介质与（）之间进行的。',
      options: [
        { key: 'A', content: '叶轮' },
        { key: 'B', content: '工作腔' },
        { key: 'C', content: '静压力' },
        { key: 'D', content: '容积' }
      ],
      answer: 'A',
      analysis: '叶片式水力机械的特点是：(1)能量转换是连续绕流叶片的介质与叶轮之间进行的；(2)叶片使介质的速度（大小和方向）都发生变化，产生这种变化叶片要克服流体的惯性力，从而引起对叶片的反作用力。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '水力机械', '叶片式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_004',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '叶片式水力机械根据液体在叶轮内压力和速度的变化情况可分为（）两类。',
      options: [
        { key: 'A', content: '反击式和冲击式' },
        { key: 'B', content: '径流式和轴流式' },
        { key: 'C', content: '混流式和斜流式' },
        { key: 'D', content: '高压式和低压式' }
      ],
      answer: 'A',
      analysis: '叶片式水力机械根据液体在叶轮内压力和速度的变化情况可分为反击式和冲击式两类。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_005',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '其中叶轮内流体的压力和速度都发生变化的，既交换动能又交换势能，则称为（）水力机械。',
      options: [
        { key: 'A', content: '反击式' },
        { key: 'B', content: '冲击式' },
        { key: 'C', content: '容积式' },
        { key: 'D', content: '混流式' }
      ],
      answer: 'A',
      analysis: '其中叶轮内流体的压力和速度都发生变化的，既交换动能又交换势能，则称为反击式水力机械，例如混流式水轮机。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '反击式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_006',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '叶轮内流体只是速度发生变化的，只交换动能，则称为（）水力机械。',
      options: [
        { key: 'A', content: '冲击式' },
        { key: 'B', content: '反击式' },
        { key: 'C', content: '容积式' },
        { key: 'D', content: '轴流式' }
      ],
      answer: 'A',
      analysis: '叶轮内流体只是速度发生变化的，只交换动能，则称为冲击式水力机械，例如冲击式水轮机。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '冲击式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_007',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '反击式叶片式水力机械中，径流式的实例包括（）。',
      options: [
        { key: 'A', content: '高水头径流式水轮机、离心泵' },
        { key: 'B', content: '轴流式水轮机、轴流泵' },
        { key: 'C', content: '切击式水轮机' },
        { key: 'D', content: '斜击式水轮机' }
      ],
      answer: 'A',
      analysis: '反击式叶片式水力机械中，径流式的实例包括高水头径流式水轮机、离心泵。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '径流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_008',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '冲击式叶片式水力机械包括切击式、斜击式和（）。',
      options: [
        { key: 'A', content: '双击式' },
        { key: 'B', content: '径流式' },
        { key: 'C', content: '混流式' },
        { key: 'D', content: '轴流式' }
      ],
      answer: 'A',
      analysis: '冲击式叶片式水力机械包括切击式、斜击式和双击式，分别对应切击式水轮机、斜击式水轮机和双击式水轮机。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '冲击式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_009',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '振动是指机械系统相对于平衡位置随时间的（）。',
      options: [
        { key: 'A', content: '往复变化' },
        { key: 'B', content: '单向变化' },
        { key: 'C', content: '恒定不变' },
        { key: 'D', content: '随机变化' }
      ],
      answer: 'A',
      analysis: '振动是指机械系统相对于平衡位置随时间的往复变化。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '术语', '振动'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_010',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '绝对振动是指振动的参考坐标为（）。',
      options: [
        { key: 'A', content: '惯性坐标或大地（基础）' },
        { key: 'B', content: '非惯性坐标或另一振动体' },
        { key: 'C', content: '叶轮中心' },
        { key: 'D', content: '转子轴心' }
      ],
      answer: 'A',
      analysis: '绝对振动是指振动的参考坐标为惯性坐标或大地（基础）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '术语', '振动'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_011',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '相对振动是指振动的参考坐标为（）。',
      options: [
        { key: 'A', content: '非惯性坐标或另一振动体' },
        { key: 'B', content: '惯性坐标或大地（基础）' },
        { key: 'C', content: '叶轮中心' },
        { key: 'D', content: '转子轴心' }
      ],
      answer: 'A',
      analysis: '相对振动是指振动的参考坐标为非惯性坐标或另一振动体。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '术语', '振动'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_012',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '表计压力是指测量仪器反映的压力，为同一地点的流体绝对压力与环境压力之差，p=pabs-pamb，或称（）。',
      options: [
        { key: 'A', content: '工程压力' },
        { key: 'B', content: '静压力' },
        { key: 'C', content: '动压力' },
        { key: 'D', content: '总压力' }
      ],
      answer: 'A',
      analysis: '表计压力是指测量仪器反映的压力，为同一地点的流体绝对压力与环境压力之差，p=pabs-pamb，或称工程压力。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '术语', '压力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_013',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '温度表示摄氏温度数值时，v=Θ-273.15，其中Θ的单位是（）。',
      options: [
        { key: 'A', content: 'K' },
        { key: 'B', content: '℃' },
        { key: 'C', content: '°F' },
        { key: 'D', content: 'Pa' }
      ],
      answer: 'A',
      analysis: '温度表示摄氏温度数值时，v=Θ-273.15，其中Θ的单位是K（开尔文），v的单位是℃。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '术语', '温度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_014',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '质量流量是指单位时间内流过系统中任一断面的水的（）。',
      options: [
        { key: 'A', content: '质量' },
        { key: 'B', content: '体积' },
        { key: 'C', content: '速度' },
        { key: 'D', content: '压力' }
      ],
      answer: 'A',
      analysis: '质量流量是指单位时间内流过系统中任一断面的水的质量，符号为ρQ，单位为kg/s。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '术语', '流量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_015',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '体积流量是指单位时间内流过系统中任一断面的水的体积，符号为Q，单位为（）。',
      options: [
        { key: 'A', content: 'm³/s' },
        { key: 'B', content: 'kg/s' },
        { key: 'C', content: 'm/s' },
        { key: 'D', content: 'J/kg' }
      ],
      answer: 'A',
      analysis: '体积流量是指单位时间内流过系统中任一断面的水的体积，符号为Q，单位为m³/s。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '术语', '流量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_016',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '比能是指任一断面每单位质量的水具有的能量，符号为e，单位为（）。',
      options: [
        { key: 'A', content: 'J/kg' },
        { key: 'B', content: 'm³/s' },
        { key: 'C', content: 'kg/s' },
        { key: 'D', content: 'm/s' }
      ],
      answer: 'A',
      analysis: '比能是指任一断面每单位质量的水具有的能量，符号为e，单位为J/kg。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '术语', '比能'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_017',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '水力机械质量检测可分成两个阶段，第一阶段为（），第二阶段为投运后的质量检测。',
      options: [
        { key: 'A', content: '投运前的质量检测' },
        { key: 'B', content: '设计阶段的质量检测' },
        { key: 'C', content: '制造阶段的质量检测' },
        { key: 'D', content: '安装阶段的质量检测' }
      ],
      answer: 'A',
      analysis: '水力机械质量检测可分成两个阶段，第一阶段为投运前的质量检测，第二阶段为投运后的质量检测。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '质量检测', '阶段'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_018',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '水力效率是指水轮机转轮输出功率与输入水流功率之比，符号为（）。',
      options: [
        { key: 'A', content: 'ηh' },
        { key: 'B', content: 'ηm' },
        { key: 'C', content: 'η' },
        { key: 'D', content: 'ηref' }
      ],
      answer: 'A',
      analysis: '水力效率是指水轮机转轮输出功率与输入水流功率之比，符号为ηh。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '术语', '效率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_019',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '机械效率是指水轮机传递给发电机的轴功率与转轮输出轴功率之比，符号为（）。',
      options: [
        { key: 'A', content: 'ηm' },
        { key: 'B', content: 'ηh' },
        { key: 'C', content: 'η' },
        { key: 'D', content: 'ηref' }
      ],
      answer: 'A',
      analysis: '机械效率是指水轮机传递给发电机的轴功率与转轮输出轴功率之比，符号为ηm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '术语', '效率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_020',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '效率η是水力效率与机械效率的（）。',
      options: [
        { key: 'A', content: '乘积' },
        { key: 'B', content: '和' },
        { key: 'C', content: '差' },
        { key: 'D', content: '比值' }
      ],
      answer: 'A',
      analysis: '效率η是水力效率与机械效率的乘积，即η=ηh×ηm。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '术语', '效率'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'mech_e_021',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '容积式水力机械的特点是（）。',
      options: [
        { key: 'A', content: '工作介质处于工作腔，工作腔可以是一个或几个' },
        { key: 'B', content: '工作腔的容积是变化的' },
        { key: 'C', content: '机械和流体之间的作用主要是静压力' },
        { key: 'D', content: '能量转换是连续绕流叶片的介质与叶轮之间进行的' }
      ],
      answer: 'A,B,C',
      analysis: '容积式水力机械的特点是：(1)工作介质处于工作腔，工作腔可以是一个或几个；(2)工作腔的容积是变化的；(3)机械和流体之间的作用主要是静压力。选项D是叶片式水力机械的特点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '容积式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_022',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '叶片式水力机械的特点是（）。',
      options: [
        { key: 'A', content: '能量转换是连续绕流叶片的介质与叶轮之间进行的' },
        { key: 'B', content: '叶片使介质的速度（大小和方向）都发生变化' },
        { key: 'C', content: '产生这种变化叶片要克服流体的惯性力，从而引起对叶片的反作用力' },
        { key: 'D', content: '工作腔的容积是变化的' }
      ],
      answer: 'A,B,C',
      analysis: '叶片式水力机械的特点是：(1)能量转换是连续绕流叶片的介质与叶轮之间进行的；(2)叶片使介质的速度（大小和方向）都发生变化，产生这种变化叶片要克服流体的惯性力，从而引起对叶片的反作用力。选项D是容积式水力机械的特点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '叶片式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_023',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '反击式叶片式水力机械包括（）。',
      options: [
        { key: 'A', content: '径流式' },
        { key: 'B', content: '混（斜）流式' },
        { key: 'C', content: '轴流式' },
        { key: 'D', content: '切击式' }
      ],
      answer: 'A,B,C',
      analysis: '反击式叶片式水力机械包括径流式、混（斜）流式和轴流式。切击式属于冲击式水力机械。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '反击式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_024',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '冲击式叶片式水力机械包括（）。',
      options: [
        { key: 'A', content: '切击式' },
        { key: 'B', content: '斜击式' },
        { key: 'C', content: '双击式' },
        { key: 'D', content: '混流式' }
      ],
      answer: 'A,B,C',
      analysis: '冲击式叶片式水力机械包括切击式、斜击式和双击式。混流式属于反击式水力机械。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '冲击式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_025',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '投运前的质量检测主要包括以下内容（）。',
      options: [
        { key: 'A', content: '结构部件材料性能检测，包括材料力学性能、探伤和残余应力检测等' },
        { key: 'B', content: '结构部件尺寸检测，包括几何尺寸、几何形状与型线、形位公差与粗糙度检测' },
        { key: 'C', content: '机组安装过程关键检测，包括机组轴线、导轴承轴瓦间隙与发电机定转子圆度检测等' },
        { key: 'D', content: '反映机组能量特性的效率试验' }
      ],
      answer: 'A,B,C',
      analysis: '投运前的质量检测主要包括：(1)结构部件材料性能检测；(2)结构部件尺寸检测；(3)机组安装过程关键检测。选项D属于投运后的质量检测内容。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '质量检测', '投运前'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_026',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '投运后的质量检测主要包括以下内容（）。',
      options: [
        { key: 'A', content: '反映机组能量特性的效率试验' },
        { key: 'B', content: '反映调速系统和调速器性能，以及因调速器和机组性能引起的机组过渡过程试验' },
        { key: 'C', content: '反映机组安全运行的稳定性试验' },
        { key: 'D', content: '机组主要力特性试验、机组过流部件空蚀与磨损试验、机组启动试验' }
      ],
      answer: 'A,B,C,D',
      analysis: '投运后的质量检测主要包括：(1)反映机组能量特性的效率试验；(2)反映调速系统和调速器性能，以及因调速器和机组性能引起的机组过渡过程试验；(3)反映机组安全运行的稳定性试验；(4)机组主要力特性试验；(5)机组过流部件空蚀与磨损试验；(6)机组启动试验。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '质量检测', '投运后'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_027',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '水力机械质量检测的目的与意义包括（）。',
      options: [
        { key: 'A', content: '可以校核水力机组的加工制造质量，了解水力机组运行时电气、机械、水力等方面的工作特性' },
        { key: 'B', content: '从而合理地整定各种工作参数，为安全、经济运行提供最可靠的技术资料' },
        { key: 'C', content: '有效地指导水电站和水泵站的生产' },
        { key: 'D', content: '检验水机理论、计算方法和鉴定制造质量与安装质量的最好手段及可靠依据' }
      ],
      answer: 'A,B,C,D',
      analysis: '水力机械质量检测的目的与意义包括：校核加工制造质量、了解工作特性、整定工作参数、提供技术资料、指导生产、检验理论和鉴定质量等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '质量检测', '目的意义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_028',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '水力机组基本概念与术语中，脉动包括（）。',
      options: [
        { key: 'A', content: '压力脉动' },
        { key: 'B', content: '应力脉动' },
        { key: 'C', content: '转速脉动' },
        { key: 'D', content: '功率脉动' }
      ],
      answer: 'A,B,C,D',
      analysis: '水力机组基本概念与术语中，脉动包括压力脉动、应力脉动、转速脉动和功率脉动，分别是在选定时间间隔Δt内相对于平均值的往复变化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '术语', '脉动'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'mech_e_029',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '水力机械是指以液体如油、水等为工作介质与能量载体的机械设备。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。水力机械是指以液体如油、水等为工作介质与能量载体的机械设备。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '水力机械', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_030',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '根据液体与机械的相互作用方式，水力机械可分成反击式水力机械和冲击式水力机械。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。根据液体与机械的相互作用方式，水力机械可分成容积式水力机械和叶片式水力机械。反击式和冲击式是叶片式水力机械的分类。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_031',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '容积式水力机械的特点是机械和流体之间的作用主要是静压力。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。容积式水力机械的特点之一是机械和流体之间的作用主要是静压力。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '水力机械', '容积式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_032',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '叶片式水力机械根据液体在叶轮内压力和速度的变化情况可分为反击式和冲击式两类。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。叶片式水力机械根据液体在叶轮内压力和速度的变化情况可分为反击式和冲击式两类。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_033',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '反击式水力机械是指叶轮内流体只是速度发生变化的，只交换动能。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。反击式水力机械是指叶轮内流体的压力和速度都发生变化的，既交换动能又交换势能。只是速度发生变化、只交换动能的是冲击式水力机械。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '水力机械', '反击式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_034',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '混流式水轮机属于反击式水力机械。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。混流式水轮机属于反击式水力机械，其叶轮内流体的压力和速度都发生变化。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '水力机械', '混流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_035',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '冲击式水轮机属于冲击式水力机械。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。冲击式水轮机属于冲击式水力机械，其叶轮内流体只是速度发生变化，只交换动能。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '水力机械', '冲击式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_036',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '振动是指机械系统相对于平衡位置随时间的往复变化。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。振动是指机械系统相对于平衡位置随时间的往复变化。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '术语', '振动'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_037',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '水力机械质量检测可分成三个阶段：设计阶段、制造阶段和运行阶段。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。水力机械质量检测可分成两个阶段，第一阶段为投运前的质量检测，第二阶段为投运后的质量检测。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '质量检测', '阶段'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_038',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '效率η是水力效率与机械效率的乘积。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。效率η是水力效率与机械效率的乘积，即η=ηh×ηm。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '术语', '效率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_039',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '相对效率是指任意工况点的效率与基准值（效率）之比。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。相对效率是指任意工况点的效率与基准值（效率）之比，符号为ηref。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '术语', '效率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_040',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 绪论',
      content: '水力功率是指用于生产电能的水流功率（水轮机）或给水的水力功率（水泵），符号为Ph，单位为W。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。水力功率是指用于生产电能的水流功率（水轮机）或给水的水力功率（水泵），符号为Ph，单位为W。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '术语', '功率'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
