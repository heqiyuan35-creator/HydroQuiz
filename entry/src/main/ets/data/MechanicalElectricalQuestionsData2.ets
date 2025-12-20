/**
 * 机械电气题目数据 - 第二部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：机械电气（第3版）第四节 常用传感器与检测仪器
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取机械电气题目（第二部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getMechanicalElectricalQuestions2(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'mech_e_041',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器按被测物理量来分类，不包括（）。',
      options: [
        { key: 'A', content: '位移传感器' },
        { key: 'B', content: '速度传感器' },
        { key: 'C', content: '物性型传感器' },
        { key: 'D', content: '温度传感器' }
      ],
      answer: 'C',
      analysis: '传感器按被测物理量来分类，可分为位移传感器、速度传感器、加速度传感器、力传感器、温度传感器等。物性型传感器是按信号变换特征来分类的。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_042',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器按传感器工作的物理原理来分类，可分为（）。',
      options: [
        { key: 'A', content: '机械式、电气式、辐射式、流体式等' },
        { key: 'B', content: '位移传感器、速度传感器、温度传感器' },
        { key: 'C', content: '物性型和结构型' },
        { key: 'D', content: '能量转换型和能量控制型' }
      ],
      answer: 'A',
      analysis: '传感器按传感器工作的物理原理来分类，可分为机械式、电气式、辐射式、流体式等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_043',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '物性型传感器是利用敏感器件材料本身物理性质的变化来实现信号的检测。下列属于物性型传感器的是（）。',
      options: [
        { key: 'A', content: '水银温度计' },
        { key: 'B', content: '石英晶体压电效应传感器' },
        { key: 'C', content: '变阻器式传感器' },
        { key: 'D', content: '电容式传感器' }
      ],
      answer: 'A',
      analysis: '物性型传感器是利用敏感器件材料本身物理性质的变化来实现信号的检测。例如，用水银温度计测温，是利用了水银热胀冷缩的性质；用光电传感器测速，是利用了光电器件本身的光电效应。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '物性型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_044',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '结构型传感器是通过传感器本身结构参数的变化来实现信号的转换。下列属于结构型传感器的是（）。',
      options: [
        { key: 'A', content: '石英晶体压电效应传感器' },
        { key: 'B', content: '水银温度计' },
        { key: 'C', content: '光电传感器' },
        { key: 'D', content: '热电偶' }
      ],
      answer: 'A',
      analysis: '结构型传感器是通过传感器本身结构参数的变化来实现信号的转换。例如石英晶体的压电效应等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '结构型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_045',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '能量转换型传感器（或称无源传感器）的特点是（）。',
      options: [
        { key: 'A', content: '直接由被测对象输入能量使其工作' },
        { key: 'B', content: '从外部供给辅助能量使传感器工作' },
        { key: 'C', content: '由被测量来控制外部供给能量的变化' },
        { key: 'D', content: '输出量为数字式' }
      ],
      answer: 'A',
      analysis: '能量转换型传感器（或称无源传感器），是直接由被测对象输入能量使其工作的。例如，热电偶将被测温度直接转换为电量输出。由于这类传感器在转换过程中需要吸收被测物体的能量，容易造成测量误差。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '能量转换型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_046',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '能量控制传感器（也称有源传感器）的特点是（）。',
      options: [
        { key: 'A', content: '从外部供给辅助能量使传感器工作，并且由被测量来控制外部供给能量的变化' },
        { key: 'B', content: '直接由被测对象输入能量使其工作' },
        { key: 'C', content: '不需要外部能量供给' },
        { key: 'D', content: '输出量为模拟式' }
      ],
      answer: 'A',
      analysis: '能量控制传感器，也称有源传感器，是从外部供给辅助能量使传感器工作的，并且由被测量来控制外部供给能量的变化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '能量控制型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_047',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器能测量的最大输入量与最小输入量之间的范围称为传感器的（）。',
      options: [
        { key: 'A', content: '量程' },
        { key: 'B', content: '精确度' },
        { key: 'C', content: '灵敏度' },
        { key: 'D', content: '线性度' }
      ],
      answer: 'A',
      analysis: '量程是指传感器能测量的最大输入量与最小输入量之间的范围称为传感器的量程。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '性能指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_048',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '精确度是指测量某物理量的测定值与真值相符合的程度。精确度也称为（）。',
      options: [
        { key: 'A', content: '精度' },
        { key: 'B', content: '灵敏度' },
        { key: 'C', content: '线性度' },
        { key: 'D', content: '稳定性' }
      ],
      answer: 'A',
      analysis: '精确度是指测量某物理量的测定值与真值相符合的程度，也称为精度。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '性能指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_049',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '灵敏度是指传感器在稳态下输出量变化与输入量变化的比值，其计算公式为（）。',
      options: [
        { key: 'A', content: 'K=Δy/Δx' },
        { key: 'B', content: 'K=Δx/Δy' },
        { key: 'C', content: 'K=y/x' },
        { key: 'D', content: 'K=x/y' }
      ],
      answer: 'A',
      analysis: '灵敏度是指传感器在稳态下输出量变化与输入量变化的比值，K=输出量的变化/输入量的变化=Δy/Δx。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '灵敏度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_050',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '线性度（非线性误差）表示传感器的输出与输入之间的关系曲线与选定的工作曲线的偏离程度。传感器的线性度用（）来表示。',
      options: [
        { key: 'A', content: '输出平均值与拟合直线的最大偏差与满量程输出之比' },
        { key: 'B', content: '输出最大值与输入最大值之比' },
        { key: 'C', content: '输出变化量与输入变化量之比' },
        { key: 'D', content: '测定值与真值之差' }
      ],
      answer: 'A',
      analysis: '传感器的线性度（非线性误差）用特性曲线和其选定的工作曲线（也叫拟合曲线）之间的最大偏差与传感器满量程输出之比来表示，即δL=±ΔLmax/yFS×100%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '线性度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_051',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '迟滞表示传感器输入量由小到大与由大到小所得输出不一致的程度。迟滞用（）来表示。',
      options: [
        { key: 'A', content: '量下最大的迟滞偏差Δm与满量程输出yFS的百分比' },
        { key: 'B', content: '输出最大值与输入最大值之比' },
        { key: 'C', content: '输出变化量与输入变化量之比' },
        { key: 'D', content: '测定值与真值之差' }
      ],
      answer: 'A',
      analysis: '迟滞在数值上用同一输入量下最大的迟滞偏差Δm与满量程输出yFS的百分比表示，即γH=±ΔHmax/yFS×100%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '迟滞'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_052',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '重复性表示传感器在输入量按同一方向作全量程连续多次变动时所得特性曲线不一致的程度。根据误差理论，重复性误差属于（）。',
      options: [
        { key: 'A', content: '随机误差' },
        { key: 'B', content: '系统误差' },
        { key: 'C', content: '粗大误差' },
        { key: 'D', content: '仪器误差' }
      ],
      answer: 'A',
      analysis: '根据误差理论，重复性误差属于随机误差，因此应根据标准差来计算重复性误差，即δz=±(2~3)σ/yFS×100%，式中σ为标准偏差。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '重复性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_053',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '零点漂移简称零漂，表示在零输入的状态下输出值的漂移。时间零漂一般指在规定时间内，在（）条件下零输出的变化。',
      options: [
        { key: 'A', content: '室温不变' },
        { key: 'B', content: '温度变化' },
        { key: 'C', content: '湿度变化' },
        { key: 'D', content: '压力变化' }
      ],
      answer: 'A',
      analysis: '时间零漂一般指在规定时间内，在室温不变的条件下零输出的变化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '零点漂移'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_054',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '温度零漂一般用零点温漂和灵敏度温漂来表示这种变化程度，即温度每变化（）℃，零点输出（或灵敏度）的变化值。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '5' },
        { key: 'C', content: '10' },
        { key: 'D', content: '20' }
      ],
      answer: 'A',
      analysis: '绝大部分传感器在温度变化时特性会有所变化。一般用零点温漂和灵敏度温漂来表示这种变化程度，即温度每变化1℃，零点输出（或灵敏度）的变化值。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '温度零漂'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_055',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '动态特性是指传感器对随时间变化的输入量的响应特性。传感器使用一段时间后，其性能保持不变的能力称为（）。',
      options: [
        { key: 'A', content: '稳定性' },
        { key: 'B', content: '动态特性' },
        { key: 'C', content: '线性度' },
        { key: 'D', content: '灵敏度' }
      ],
      answer: 'A',
      analysis: '稳定性是指传感器使用一段时间后，其性能保持不变的能力称为稳定性。影响传感器长期稳定性的因素除传感器本身结构外，主要是传感器的使用环境。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '稳定性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_056',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '精确度是表示传感器的输出与被测量的对应程度的，它是关系到整个测量系统测量精度的一个重要环节。在实际中也并非要求传感器的精确度越高越好，还需要考虑到（）。',
      options: [
        { key: 'A', content: '测量目的和经济性' },
        { key: 'B', content: '传感器的体积' },
        { key: 'C', content: '传感器的重量' },
        { key: 'D', content: '传感器的颜色' }
      ],
      answer: 'A',
      analysis: '精确度是表示传感器的输出与被测量的对应程度的。在实际中也并非要求传感器的精确度越高越好，还需要考虑到测量目的，同时还需要考虑到经济性。因为传感器的精度越高，其价格就越昂贵，所以应从实际出发来选择传感器。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '精确度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_057',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '在传感器的线性范围内，希望传感器的灵敏度越高越好。因为只有灵敏度高时，与被测量变化对应的输出信号的值才比较大，有利于（）。',
      options: [
        { key: 'A', content: '信号处理' },
        { key: 'B', content: '降低成本' },
        { key: 'C', content: '减小体积' },
        { key: 'D', content: '延长寿命' }
      ],
      answer: 'A',
      analysis: '通常，在传感器的线性范围内，希望传感器的灵敏度越高越好。因为只有灵敏度高时，与被测量变化对应的输出信号的值才比较大，有利于信号处理。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '灵敏度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_058',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器的灵敏度是有方向性的。当被测量是单向量，而且对其方向性要求较高时，则应选择其他方向灵敏度小的传感器；如果被测量是多维向量，则要求传感器的（）越小越好。',
      options: [
        { key: 'A', content: '交叉灵敏度' },
        { key: 'B', content: '线性度' },
        { key: 'C', content: '稳定性' },
        { key: 'D', content: '精确度' }
      ],
      answer: 'A',
      analysis: '传感器的灵敏度是有方向性的。当被测量是单向量，而且对其方向性要求较高时，则应选择其他方向灵敏度小的传感器；如果被测量是多维向量，则要求传感器的交叉灵敏度越小越好。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '灵敏度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_059',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器的频率响应特性决定了被测量的频率范围，必须在允许频率范围内保持不失真的测量条件。实际上传感器的响应总有一定延迟，希望延迟时间越（）越好。',
      options: [
        { key: 'A', content: '短' },
        { key: 'B', content: '长' },
        { key: 'C', content: '稳定' },
        { key: 'D', content: '变化' }
      ],
      answer: 'A',
      analysis: '传感器的频率响应特性决定了被测量的频率范围，必须在允许频率范围内保持不失真的测量条件。实际上传感器的响应总有一定延迟，希望延迟时间越短越好。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '频率响应'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_060',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '机械式传感器应用很广。在测试技术中，常常以弹性体作为传感器的敏感元件，故又称之为（）。',
      options: [
        { key: 'A', content: '弹性敏感元件' },
        { key: 'B', content: '电阻敏感元件' },
        { key: 'C', content: '电容敏感元件' },
        { key: 'D', content: '电感敏感元件' }
      ],
      answer: 'A',
      analysis: '机械式传感器应用很广。在测试技术中，常常以弹性体作为传感器的敏感元件，故又称之为弹性敏感元件。它的输入量可以是力、压力、温度等物理量，而输出则为弹性元件本身的弹性变形。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '机械式'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'mech_e_061',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器按被测物理量来分类，可分为（）。',
      options: [
        { key: 'A', content: '位移传感器' },
        { key: 'B', content: '速度传感器' },
        { key: 'C', content: '加速度传感器' },
        { key: 'D', content: '温度传感器' }
      ],
      answer: 'A,B,C,D',
      analysis: '传感器按被测物理量来分类，可分为位移传感器、速度传感器、加速度传感器、力传感器、温度传感器等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_062',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器按传感器工作的物理原理来分类，可分为（）。',
      options: [
        { key: 'A', content: '机械式' },
        { key: 'B', content: '电气式' },
        { key: 'C', content: '辐射式' },
        { key: 'D', content: '流体式' }
      ],
      answer: 'A,B,C,D',
      analysis: '传感器按传感器工作的物理原理来分类，可分为机械式、电气式、辐射式、流体式等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_063',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器按信号变换特征来分类，可分为（）。',
      options: [
        { key: 'A', content: '物性型' },
        { key: 'B', content: '结构型' },
        { key: 'C', content: '能量转换型' },
        { key: 'D', content: '能量控制型' }
      ],
      answer: 'A,B',
      analysis: '传感器按信号变换特征来分类，可分为物性型和结构型。按传感器与被测量之间的关系来分类，可分为能量转换型和能量控制型。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_064',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器的主要性能指标包括（）。',
      options: [
        { key: 'A', content: '量程' },
        { key: 'B', content: '精确度（精度）' },
        { key: 'C', content: '灵敏度' },
        { key: 'D', content: '线性度（非线性误差）' }
      ],
      answer: 'A,B,C,D',
      analysis: '传感器性能指标较多，主要包括：量程、精确度（精度）、灵敏度、线性度（非线性误差）、迟滞、重复性、零点漂移、动态特性、稳定性等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '性能指标'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_065',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '选用传感器时应充分考虑的因素包括（）。',
      options: [
        { key: 'A', content: '结构简单、体积小' },
        { key: 'B', content: '质量轻、价格便宜' },
        { key: 'C', content: '易于维修、易于更换' },
        { key: 'D', content: '精度越高越好' }
      ],
      answer: 'A,B,C',
      analysis: '除以上选用传感器时应充分考虑的一些因素外，还应尽可能兼顾结构简单、体积小、质量轻、价格便宜、易于维修、易于更换等条件。精度并非越高越好，需要考虑测量目的和经济性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '选用原则'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_066',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '机械式传感器做成的机械式指示仪表具有的优点包括（）。',
      options: [
        { key: 'A', content: '结构简单' },
        { key: 'B', content: '可靠、使用方便' },
        { key: 'C', content: '价格低廉、读数直观' },
        { key: 'D', content: '频率高、惯性小' }
      ],
      answer: 'A,B,C',
      analysis: '机械式传感器做成的机械式指示仪表具有结构简单、可靠、使用方便、价格低廉、读数直观等优点。但弹性变形不宜大，以减小线性误差。此外，由于放大和指示环节多为机械传动，不仅受间隙影响，而且惯性大，固有频率低，只宜用于检测缓变或成静态被测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '机械式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_067',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '机械式传感器的典型应用有（）。',
      options: [
        { key: 'A', content: '用于测力或称重的环形测力计、弹簧秤等' },
        { key: 'B', content: '用于测量流体压力的波纹膜片、波纹管等' },
        { key: 'C', content: '用于温度测量的双金属片等' },
        { key: 'D', content: '用于测量电压的电压表' }
      ],
      answer: 'A,B,C',
      analysis: '机械式传感器的典型应用有：用于测力或称重的环形测力计、弹簧秤等；用于测量流体压力的波纹膜片、波纹管等；用于温度测量的双金属片等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '机械式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_068',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '电阻式传感器按工作原理可分为（）。',
      options: [
        { key: 'A', content: '变阻器式（电位器式）' },
        { key: 'B', content: '电阻应变式' },
        { key: 'C', content: '电容式' },
        { key: 'D', content: '电感式' }
      ],
      answer: 'A,B',
      analysis: '电阻式传感器按工作原理可分为变阻器式（电位器式）和电阻应变式两种。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'mech_e_069',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器按被测物理量来分类，可分为位移传感器、速度传感器、加速度传感器、力传感器、温度传感器等。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。传感器按被测物理量来分类，可分为位移传感器、速度传感器、加速度传感器、力传感器、温度传感器等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_070',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '物性型传感器是通过传感器本身结构参数的变化来实现信号的转换。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。物性型传感器是利用敏感器件材料本身物理性质的变化来实现信号的检测。结构型传感器才是通过传感器本身结构参数的变化来实现信号的转换。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '物性型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_071',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '能量转换型传感器（或称无源传感器），是直接由被测对象输入能量使其工作的。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。能量转换型传感器（或称无源传感器），是直接由被测对象输入能量使其工作的。例如，热电偶将被测温度直接转换为电量输出。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '能量转换型'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_072',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '量程是指传感器能测量的最大输入量与最小输入量之间的范围。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。量程是指传感器能测量的最大输入量与最小输入量之间的范围称为传感器的量程。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '量程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_073',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '灵敏度是指传感器在稳态下输入量变化与输出量变化的比值。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。灵敏度是指传感器在稳态下输出量变化与输入量变化的比值，K=Δy/Δx，而不是输入量变化与输出量变化的比值。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '灵敏度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_074',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器的灵敏度越高越好，不需要考虑其他因素。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。传感器的灵敏度高时，与被测量无关的外界噪声也容易混入，会被放大系统放大，影响测量精度。因此，要求传感器本身应具有较高的信噪比，尽量减少从外界引入的干扰信号。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '灵敏度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_075',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器的线性范围越宽，则其量程越大，并且能保证一定的测量精度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。传感器的线性范围越宽，则其量程越大，并且能保证一定的测量精度。在选择传感器时，当传感器的种类确定以后首先要看其量程是否满足要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '线性范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_076',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '稳定性是指传感器使用一段时间后，其性能保持不变的能力。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。稳定性是指传感器使用一段时间后，其性能保持不变的能力称为稳定性。影响传感器长期稳定性的因素除传感器本身结构外，主要是传感器的使用环境。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '稳定性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_077',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '传感器的稳定性有定量指标，在超过使用期后，在使用前应重新进行标定，以确定传感器的性能是否发生变化。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。传感器的稳定性有定量指标，在超过使用期后，在使用前应重新进行标定，以确定传感器的性能是否发生变化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '稳定性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_078',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '机械式传感器应用很广，在测试技术中，常常以弹性体作为传感器的敏感元件，故又称之为弹性敏感元件。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。机械式传感器应用很广。在测试技术中，常常以弹性体作为传感器的敏感元件，故又称之为弹性敏感元件。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '机械式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_079',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '变阻器式传感器也称为电位器式传感器，其工作原理是将物体的位移转换为电阻的变化。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。变阻器式传感器也称为电位器式传感器，其工作原理是将物体的位移转换为电阻的变化，即R=ρl/A。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '变阻器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_080',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '变阻器式传感器可分为直线位移型、角位移型与非线性型等。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。变阻器式传感器可分为直线位移型、角位移型与非线性型等。直线位移型R=k₁x，S=dR/dx=k₁=常数；角位移型传感器S=dR/dα=kα=常数。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '变阻器式'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}