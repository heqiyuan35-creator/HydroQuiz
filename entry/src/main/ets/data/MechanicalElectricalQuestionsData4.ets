/**
 * 机械电气题目数据 - 第四部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：机械电气（第3版）- 可变磁阻式、涡电流式、互感式、差动变压器式、磁电感应式传感器
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取机械电气题目（第四部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getMechanicalElectricalQuestions4(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'mech_e_121',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '可变磁阻式电感传感器适用于较小位移的测量，一般为（）。',
      options: [
        { key: 'A', content: '0.001~1mm' },
        { key: 'B', content: '1~10mm' },
        { key: 'C', content: '10~100mm' },
        { key: 'D', content: '100~300mm' }
      ],
      answer: 'A',
      analysis: '可变磁阻式电感传感器适用于较小位移的测量，一般为0.001~1mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_122',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '几种常用可变磁阻式传感器的典型结构有可变导磁面积型、差动型、单螺管线圈型和（）。',
      options: [
        { key: 'A', content: '双螺管线圈差动型' },
        { key: 'B', content: '电容型' },
        { key: 'C', content: '压电型' },
        { key: 'D', content: '热电型' }
      ],
      answer: 'A',
      analysis: '几种常用可变磁阻式传感器的典型结构有可变导磁面积型、差动型、单螺管线圈型、双螺管线圈差动型。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_123',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '双螺管线圈差动型较之单螺管线圈型有较高灵敏度及线性，被用于电感测微计上，其测量范围为（）μm。',
      options: [
        { key: 'A', content: '0~300' },
        { key: 'B', content: '0~100' },
        { key: 'C', content: '0~500' },
        { key: 'D', content: '0~1000' }
      ],
      answer: 'A',
      analysis: '双螺管线圈差动型较之单螺管线圈型有较高灵敏度及线性，被用于电感测微计上，其测量范围为0~300μm，最小分辨力为0.5μm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_124',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '双螺管线圈差动型电感传感器的最小分辨力为（）μm。',
      options: [
        { key: 'A', content: '0.5' },
        { key: 'B', content: '1.0' },
        { key: 'C', content: '0.1' },
        { key: 'D', content: '5.0' }
      ],
      answer: 'A',
      analysis: '双螺管线圈差动型电感传感器被用于电感测微计上，其测量范围为0~300μm，最小分辨力为0.5μm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_125',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器的工作原理是金属体在交变磁场中的（）。',
      options: [
        { key: 'A', content: '涡电流效应' },
        { key: 'B', content: '压阻效应' },
        { key: 'C', content: '压电效应' },
        { key: 'D', content: '热电效应' }
      ],
      answer: 'A',
      analysis: '涡电流式电感传感器的工作原理是金属体在交变磁场中的涡电流效应。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_124',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器的工作原理是金属体在交变磁场中的（）。',
      options: [
        { key: 'A', content: '涡电流效应' },
        { key: 'B', content: '压阻效应' },
        { key: 'C', content: '压电效应' },
        { key: 'D', content: '热电效应' }
      ],
      answer: 'A',
      analysis: '涡电流式电感传感器的工作原理是金属体在交变磁场中的涡电流效应。涡流磁场的作用使原线圈的等效阻抗Z发生变化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_125',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器的分辨率高，可达（）。',
      options: [
        { key: 'A', content: '1μm' },
        { key: 'B', content: '10μm' },
        { key: 'C', content: '0.1mm' },
        { key: 'D', content: '1mm' }
      ],
      answer: 'A',
      analysis: '涡电流式电感传感器的优点是可用于动态非接触测量，结构简单，使用方便，不受油液等介质影响，分辨率高，可达1μm。它可用于位移、振幅测量等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_126',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式传感器可用于以下哪种测量？',
      options: [
        { key: 'A', content: '振幅测量、位移测量、厚度测量、转速测量' },
        { key: 'B', content: '仅温度测量' },
        { key: 'C', content: '仅湿度测量' },
        { key: 'D', content: '仅流量测量' }
      ],
      answer: 'A',
      analysis: '涡电流式传感器的工程应用包括：振幅测量、位移测量、厚度测量、转速测量、零件计数、无损探伤等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_127',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '互感式传感器的工作原理是电磁感应中的（）。',
      options: [
        { key: 'A', content: '互感现象' },
        { key: 'B', content: '自感现象' },
        { key: 'C', content: '涡流现象' },
        { key: 'D', content: '压阻现象' }
      ],
      answer: 'A',
      analysis: '互感式传感器——差动变压器式电传感器。互感式传感器的工作原理是电磁感应中的互感现象，将被测位移转化成线圈互感的变化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '互感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_126',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器的优点是可用于动态非接触测量，结构简单，使用方便，不受油液等介质影响，分辨率高，可达（）μm。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '0.1' },
        { key: 'C', content: '10' },
        { key: 'D', content: '0.01' }
      ],
      answer: 'A',
      analysis: '涡电流式电感传感器的优点是可用于动态非接触测量，结构简单，使用方便，不受油液等介质影响，分辨率高，可达1μm。它可用于位移、振幅测量等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_127',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式传感器的工程应用不包括（）。',
      options: [
        { key: 'A', content: '温度测量' },
        { key: 'B', content: '振幅测量' },
        { key: 'C', content: '位移测量' },
        { key: 'D', content: '厚度测量' }
      ],
      answer: 'A',
      analysis: '涡电流式传感器的工程应用包括：振幅测量、位移测量、厚度测量、转速测量、零件计数、无损探伤等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_128',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '互感式传感器的工作原理是电磁感应中的（）。',
      options: [
        { key: 'A', content: '互感现象' },
        { key: 'B', content: '自感现象' },
        { key: 'C', content: '涡流效应' },
        { key: 'D', content: '压阻效应' }
      ],
      answer: 'A',
      analysis: '互感式传感器的工作原理是电磁感应中的互感现象，将被测位移转化成线圈互感的变化。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '互感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_129',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '互感式传感器又称为（）。',
      options: [
        { key: 'A', content: '差动变压器式电传感器' },
        { key: 'B', content: '涡电流式传感器' },
        { key: 'C', content: '可变磁阻式传感器' },
        { key: 'D', content: '压阻式传感器' }
      ],
      answer: 'A',
      analysis: '互感式传感器——差动变压器式电传感器。互感式传感器的工作原理是电磁感应中的互感现象。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '互感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_130',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '互感式传感器中，式中M为比例系数，称为（），单位为H。',
      options: [
        { key: 'A', content: '互感' },
        { key: 'B', content: '自感' },
        { key: 'C', content: '电容' },
        { key: 'D', content: '电阻' }
      ],
      answer: 'A',
      analysis: '互感式传感器中，e₁₂=-M(di₁/dt)，式中M为比例系数，称为互感，H，其大小与两线圈相对位置及周围介质的导磁能力等因素有关，它表明了两线圈之间的耦合程度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '互感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_128',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '互感式传感器中，比例系数M称为（），单位为H。',
      options: [
        { key: 'A', content: '互感' },
        { key: 'B', content: '自感' },
        { key: 'C', content: '电容' },
        { key: 'D', content: '电阻' }
      ],
      answer: 'A',
      analysis: '互感式传感器中，e₁₂=-M(di₁/dt)，式中M为比例系数，称为互感，H，其大小与两线圈相对位置及周围介质的导磁能力等因素有关，它表明了两线圈之间的耦合程度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '互感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_129',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式传感器中，当铁芯在中心位置时，e₁与e₂的关系是（）。',
      options: [
        { key: 'A', content: 'e₁=e₂，e₀=0' },
        { key: 'B', content: 'e₁>e₂' },
        { key: 'C', content: 'e₁<e₂' },
        { key: 'D', content: 'e₁+e₂=0' }
      ],
      answer: 'A',
      analysis: '当铁芯在中心位置时，e₁=e₂，e₀=0；当铁芯向上运动时，e₁>e₂；当铁芯向下运动时，e₁<e₂。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_130',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式电传感器输出的电压是（）。',
      options: [
        { key: 'A', content: '交流量' },
        { key: 'B', content: '直流量' },
        { key: 'C', content: '脉冲量' },
        { key: 'D', content: '数字量' }
      ],
      answer: 'A',
      analysis: '差动变压器式电传感器输出的电压是交流量，如用交流电压表指示，则输出值只能反应铁芯位移的大小，而不能反应移动的极性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_131',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式电传感器的优点是精度高，可达（）。',
      options: [
        { key: 'A', content: '0.1μm' },
        { key: 'B', content: '1μm' },
        { key: 'C', content: '10μm' },
        { key: 'D', content: '0.1mm' }
      ],
      answer: 'A',
      analysis: '差动变压器式电传感器的优点是精度高（0.1μm）、线性范围大、稳定度好和使用方便。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_131',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '当铁芯在中心位置时，差动变压器式传感器的两个次级线圈输出电压e₁和e₂的关系是（）。',
      options: [
        { key: 'A', content: 'e₁=e₂，e₀=0' },
        { key: 'B', content: 'e₁>e₂' },
        { key: 'C', content: 'e₁<e₂' },
        { key: 'D', content: 'e₀=e₁+e₂' }
      ],
      answer: 'A',
      analysis: '当铁芯在中心位置时，e₁=e₂，e₀=0；当铁芯向上运动时，e₁>e₂；当铁芯向下运动时，e₁<e₂。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_132',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式电传感器输出的电压是（）。',
      options: [
        { key: 'A', content: '交流量' },
        { key: 'B', content: '直流量' },
        { key: 'C', content: '脉冲量' },
        { key: 'D', content: '数字量' }
      ],
      answer: 'A',
      analysis: '差动变压器式电传感器输出的电压是交流量，如用交流电压表指示，则输出值只能反应铁芯位移的大小，而不能反应移动的极性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_133',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式传感器的后接电路应采用既能反应铁芯位移极性，又能补偿零点残余电压的（）。',
      options: [
        { key: 'A', content: '差动直流输出电路' },
        { key: 'B', content: '单端输出电路' },
        { key: 'C', content: '交流放大电路' },
        { key: 'D', content: '积分电路' }
      ],
      answer: 'A',
      analysis: '差动变压器式传感器的后接电路应采用既能反应铁芯位移极性，又能补偿零点残余电压的差动直流输出电路。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_134',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式电传感器的优点是精度高（）μm，线性范围大、稳定度好和使用方便。',
      options: [
        { key: 'A', content: '0.1' },
        { key: 'B', content: '1' },
        { key: 'C', content: '0.5' },
        { key: 'D', content: '0.01' }
      ],
      answer: 'A',
      analysis: '差动变压器式电传感器的优点是精度高（0.1μm），线性范围大、稳定度好和使用方便。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_135',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器简称感应式传感器，也称电动式传感器或磁电式传感器。它把被测物理量的变化转变为（）。',
      options: [
        { key: 'A', content: '感应电动势' },
        { key: 'B', content: '电容变化' },
        { key: 'C', content: '电阻变化' },
        { key: 'D', content: '电感变化' }
      ],
      answer: 'A',
      analysis: '磁电感应式传感器简称感应式传感器，也称电动式传感器或磁电式传感器。它把被测物理量的变化转变为感应电动势，是一种机-电能量变换型传感器。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_132',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器简称感应式传感器，也称（）。',
      options: [
        { key: 'A', content: '电动式传感器或磁电式传感器' },
        { key: 'B', content: '压电式传感器' },
        { key: 'C', content: '热电式传感器' },
        { key: 'D', content: '光电式传感器' }
      ],
      answer: 'A',
      analysis: '磁电感应式传感器简称感应式传感器，也称电动式传感器或磁电式传感器。它把被测物理量的变化转变为感应电动势，是一种机-电能量变换型传感器。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_133',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器不需要外部供电电源，电路简单，性能稳定，输出阻抗小，又具有一定的频率响应范围（一般为10~1000Hz），适用于（）。',
      options: [
        { key: 'A', content: '振动、转速、扭矩等测量' },
        { key: 'B', content: '仅温度测量' },
        { key: 'C', content: '仅湿度测量' },
        { key: 'D', content: '仅压力测量' }
      ],
      answer: 'A',
      analysis: '磁电感应式传感器不需要外部供电电源，电路简单，性能稳定，输出阻抗小，又具有一定的频率响应范围（一般为10~1000Hz），适用于振动、转速、扭矩等测量。但这种传感器的尺寸和质量都较大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_134',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器按工作原理不同，可分为恒定磁通式和（）。',
      options: [
        { key: 'A', content: '变磁通式' },
        { key: 'B', content: '电容式' },
        { key: 'C', content: '电阻式' },
        { key: 'D', content: '压电式' }
      ],
      answer: 'A',
      analysis: '按工作原理不同，磁电感应式传感器可分为恒定磁通式，即动圈式传感器（见图1-20）和磁阻式传感器。也可称为变磁通式。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_135',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '动圈式传感器中，线圈做直线运动，它所产生的感应电动势为e=WBlvsinθ，式中B表示（）。',
      options: [
        { key: 'A', content: '磁场的磁感应强度，T' },
        { key: 'B', content: '线圈匝数' },
        { key: 'C', content: '线圈有效长度' },
        { key: 'D', content: '运动速度' }
      ],
      answer: 'A',
      analysis: '动圈式传感器中，线圈做直线运动，它所产生的感应电动势为e=WBlvsinθ，式中B为磁场的磁感应强度，T；l为单匝线圈有效长度，m；v为线圈与磁场的相对运动速度，m/s。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_136',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器是一种（）传感器，不需要外部供电电源。',
      options: [
        { key: 'A', content: '机-电能量变换型' },
        { key: 'B', content: '电阻变换型' },
        { key: 'C', content: '电容变换型' },
        { key: 'D', content: '电感变换型' }
      ],
      answer: 'A',
      analysis: '磁电感应式传感器是一种机-电能量变换型传感器，不需要外部供电电源，电路简单，性能稳定，输出阻抗小，又具有一定的频率响应范围（一般为10~1000Hz），适用于振动、转速、扭矩等测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_137',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器的频率响应范围一般为（）Hz。',
      options: [
        { key: 'A', content: '10~1000' },
        { key: 'B', content: '1~100' },
        { key: 'C', content: '100~10000' },
        { key: 'D', content: '0.1~10' }
      ],
      answer: 'A',
      analysis: '磁电感应式传感器具有一定的频率响应范围（一般为10~1000Hz），适用于振动、转速、扭矩等测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_138',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '按工作原理不同，磁电感应式传感器可分为恒定磁通式和（）。',
      options: [
        { key: 'A', content: '变磁阻式' },
        { key: 'B', content: '电容式' },
        { key: 'C', content: '压电式' },
        { key: 'D', content: '热电式' }
      ],
      answer: 'A',
      analysis: '按工作原理不同，磁电感应式传感器可分为恒定磁通式（即动圈式传感器）和变磁阻式（即磁阻式传感器）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_139',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '动圈式传感器中，线圈做直线运动，它所产生的感应电动势为e=WBlvsinθ，式中B表示（）。',
      options: [
        { key: 'A', content: '磁场的磁感应强度，T' },
        { key: 'B', content: '线圈匝数' },
        { key: 'C', content: '线圈有效长度，m' },
        { key: 'D', content: '线圈与磁场的相对运动速度，m/s' }
      ],
      answer: 'A',
      analysis: '动圈式传感器中，线圈做直线运动，它所产生的感应电动势为e=WBlvsinθ，式中B为磁场的磁感应强度，T；l为单匝线圈有效长度，m；v为线圈与磁场的相对运动速度，m/s。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_140',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器的缺点是这种传感器的（）都较大。',
      options: [
        { key: 'A', content: '尺寸和质量' },
        { key: 'B', content: '精度和灵敏度' },
        { key: 'C', content: '频率响应' },
        { key: 'D', content: '输出阻抗' }
      ],
      answer: 'A',
      analysis: '磁电感应式传感器的缺点是这种传感器的尺寸和质量都较大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_136',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '可变磁阻式电感传感器的典型结构有可变导磁面积型、差动型、单螺管线圈型和（）。',
      options: [
        { key: 'A', content: '双螺管线圈差动型' },
        { key: 'B', content: '电容型' },
        { key: 'C', content: '压电型' },
        { key: 'D', content: '热电型' }
      ],
      answer: 'A',
      analysis: '几种常用可变磁阻式传感器的典型结构有可变导磁面积型、差动型、单螺管线圈型、双螺管线圈差动型。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_137',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '双螺管线圈差动型电感传感器的最小分辨力为（）。',
      options: [
        { key: 'A', content: '0.5μm' },
        { key: 'B', content: '5μm' },
        { key: 'C', content: '50μm' },
        { key: 'D', content: '0.5mm' }
      ],
      answer: 'A',
      analysis: '双螺管线圈差动型较之单螺管线圈型有较高灵敏度及线性，被用于电感测微计上，其测量范围为0~300μm，最小分辨力为0.5μm。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_138',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式传感器的后接电路应采用既能反应铁芯位移极性，又能补偿零点残余电压的（）。',
      options: [
        { key: 'A', content: '差动直流输出电路' },
        { key: 'B', content: '单端输出电路' },
        { key: 'C', content: '交流放大电路' },
        { key: 'D', content: '脉冲输出电路' }
      ],
      answer: 'A',
      analysis: '交流电压输出存在一定的零点残余电压，使活动衔铁位于中间位置时，输出也不为零。因此，差动变压器式传感器的后接电路应采用既能反应铁芯位移极性，又能补偿零点残余电压的差动直流输出电路。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_139',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器中，等效阻抗Z的变化与金属板的电阻率ρ、磁导率μ及线圈激磁圆频率ω等有关。改变δ可作为（）测量。',
      options: [
        { key: 'A', content: '位移、振动' },
        { key: 'B', content: '温度' },
        { key: 'C', content: '湿度' },
        { key: 'D', content: '流量' }
      ],
      answer: 'A',
      analysis: '涡电流式电感传感器中，等效阻抗Z的变化与δ金属板的电阻率ρ、磁导率μ及线圈激磁圆频率ω等有关。改变其中某一因素，即可达到不同的变换目的。例如变化δ，可作为位移、振动测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_140',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器的频率响应范围一般为（）。',
      options: [
        { key: 'A', content: '10~1000Hz' },
        { key: 'B', content: '1~10Hz' },
        { key: 'C', content: '1000~10000Hz' },
        { key: 'D', content: '0.1~1Hz' }
      ],
      answer: 'A',
      analysis: '磁电感应式传感器不需要外部供电电源，电路简单，性能稳定，输出阻抗小，又具有一定的频率响应范围（一般为10~1000Hz），适用于振动、转速、扭矩等测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'mech_e_141',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '几种常用可变磁阻式传感器的典型结构包括（）。',
      options: [
        { key: 'A', content: '可变导磁面积型' },
        { key: 'B', content: '差动型' },
        { key: 'C', content: '单螺管线圈型' },
        { key: 'D', content: '双螺管线圈差动型' }
      ],
      answer: 'A,B,C,D',
      analysis: '几种常用可变磁阻式传感器的典型结构有可变导磁面积型、差动型、单螺管线圈型、双螺管线圈差动型。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_142',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器的优点包括（）。',
      options: [
        { key: 'A', content: '可用于动态非接触测量' },
        { key: 'B', content: '结构简单，使用方便' },
        { key: 'C', content: '不受油液等介质影响' },
        { key: 'D', content: '分辨率高，可达1μm' }
      ],
      answer: 'A,B,C,D',
      analysis: '涡电流式电感传感器的优点是可用于动态非接触测量，结构简单，使用方便，不受油液等介质影响，分辨率高，可达1μm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_143',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式传感器的工程应用包括（）。',
      options: [
        { key: 'A', content: '振幅测量' },
        { key: 'B', content: '位移测量' },
        { key: 'C', content: '厚度测量' },
        { key: 'D', content: '转速测量' }
      ],
      answer: 'A,B,C,D',
      analysis: '涡电流式传感器的工程应用包括：振幅测量、位移测量、厚度测量、转速测量、零件计数、无损探伤等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_144',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式电传感器的优点包括（）。',
      options: [
        { key: 'A', content: '精度高（0.1μm）' },
        { key: 'B', content: '线性范围大' },
        { key: 'C', content: '稳定度好' },
        { key: 'D', content: '使用方便' }
      ],
      answer: 'A,B,C,D',
      analysis: '差动变压器式电传感器的优点是精度高（0.1μm），线性范围大、稳定度好和使用方便。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'mech_e_141',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '可变磁阻式电感传感器的典型结构包括（）。',
      options: [
        { key: 'A', content: '可变导磁面积型' },
        { key: 'B', content: '差动型' },
        { key: 'C', content: '单螺管线圈型' },
        { key: 'D', content: '双螺管线圈差动型' }
      ],
      answer: 'A,B,C,D',
      analysis: '几种常用可变磁阻式传感器的典型结构有可变导磁面积型、差动型、单螺管线圈型、双螺管线圈差动型。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_142',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器的优点包括（）。',
      options: [
        { key: 'A', content: '可用于动态非接触测量' },
        { key: 'B', content: '结构简单，使用方便' },
        { key: 'C', content: '不受油液等介质影响' },
        { key: 'D', content: '分辨率高，可达1μm' }
      ],
      answer: 'A,B,C,D',
      analysis: '涡电流式电感传感器的优点是可用于动态非接触测量，结构简单，使用方便，不受油液等介质影响，分辨率高，可达1μm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_143',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式传感器的工程应用包括（）。',
      options: [
        { key: 'A', content: '振幅测量' },
        { key: 'B', content: '位移测量' },
        { key: 'C', content: '厚度测量' },
        { key: 'D', content: '转速测量' }
      ],
      answer: 'A,B,C,D',
      analysis: '涡电流式传感器的工程应用包括：振幅测量、位移测量、厚度测量、转速测量、零件计数、无损探伤等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_144',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式电传感器的优点包括（）。',
      options: [
        { key: 'A', content: '精度高（0.1μm）' },
        { key: 'B', content: '线性范围大' },
        { key: 'C', content: '稳定度好' },
        { key: 'D', content: '使用方便' }
      ],
      answer: 'A,B,C,D',
      analysis: '差动变压器式电传感器的优点是精度高（0.1μm）、线性范围大、稳定度好和使用方便。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_145',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器的特点包括（）。',
      options: [
        { key: 'A', content: '不需要外部供电电源' },
        { key: 'B', content: '电路简单' },
        { key: 'C', content: '性能稳定' },
        { key: 'D', content: '输出阻抗小' }
      ],
      answer: 'A,B,C,D',
      analysis: '磁电感应式传感器是一种机-电能量变换型传感器，不需要外部供电电源，电路简单，性能稳定，输出阻抗小。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_146',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器适用于测量（）。',
      options: [
        { key: 'A', content: '振动' },
        { key: 'B', content: '转速' },
        { key: 'C', content: '扭矩' },
        { key: 'D', content: '温度' }
      ],
      answer: 'A,B,C',
      analysis: '磁电感应式传感器具有一定的频率响应范围（一般为10~1000Hz），适用于振动、转速、扭矩等测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_147',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '按工作原理不同，磁电感应式传感器可分为（）。',
      options: [
        { key: 'A', content: '恒定磁通式（动圈式传感器）' },
        { key: 'B', content: '变磁阻式（磁阻式传感器）' },
        { key: 'C', content: '电容式' },
        { key: 'D', content: '压电式' }
      ],
      answer: 'A,B',
      analysis: '按工作原理不同，磁电感应式传感器可分为恒定磁通式（即动圈式传感器）和变磁阻式（即磁阻式传感器）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_148',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '影响磁通变化率的因素包括（）。',
      options: [
        { key: 'A', content: '磁场强度' },
        { key: 'B', content: '磁路磁阻' },
        { key: 'C', content: '线圈的运动速度' },
        { key: 'D', content: '线圈匝数' }
      ],
      answer: 'A,B,C',
      analysis: '磁通变化率与磁场强度、磁路磁阻、线圈的运动速度有关，故若改变其中一个因素，都会改变线圈的感应电动势。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_145',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器的特点包括（）。',
      options: [
        { key: 'A', content: '不需要外部供电电源' },
        { key: 'B', content: '电路简单，性能稳定' },
        { key: 'C', content: '输出阻抗小' },
        { key: 'D', content: '尺寸和质量都较大' }
      ],
      answer: 'A,B,C,D',
      analysis: '磁电感应式传感器不需要外部供电电源，电路简单，性能稳定，输出阻抗小，又具有一定的频率响应范围。但这种传感器的尺寸和质量都较大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_146',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器适用于测量（）。',
      options: [
        { key: 'A', content: '振动' },
        { key: 'B', content: '转速' },
        { key: 'C', content: '扭矩' },
        { key: 'D', content: '温度' }
      ],
      answer: 'A,B,C',
      analysis: '磁电感应式传感器适用于振动、转速、扭矩等测量，不适用于温度测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_147',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '动圈式传感器感应电动势公式e=WBlvsinθ中，各参数包括（）。',
      options: [
        { key: 'A', content: 'B为磁场的磁感应强度' },
        { key: 'B', content: 'l为单匝线圈有效长度' },
        { key: 'C', content: 'v为线圈与磁场的相对运动速度' },
        { key: 'D', content: 'W为线圈匝数' }
      ],
      answer: 'A,B,C,D',
      analysis: '动圈式传感器感应电动势公式e=WBlvsinθ中，B为磁场的磁感应强度，T；l为单匝线圈有效长度，m；v为线圈与磁场的相对运动速度，m/s；W为线圈匝数。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_148',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器中，等效阻抗Z的变化与以下哪些因素有关？',
      options: [
        { key: 'A', content: '金属板的电阻率ρ' },
        { key: 'B', content: '磁导率μ' },
        { key: 'C', content: '线圈激磁圆频率ω' },
        { key: 'D', content: '线圈与金属板的距离δ' }
      ],
      answer: 'A,B,C,D',
      analysis: '涡电流式电感传感器中，等效阻抗Z的变化与δ金属板的电阻率ρ、磁导率μ及线圈激磁圆频率ω等有关。改变其中某一因素，即可达到不同的变换目的。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'mech_e_149',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '可变磁阻式电感传感器适用于较小位移的测量，一般为0.001~1mm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。可变磁阻式电感传感器适用于较小位移的测量，一般为0.001~1mm。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_150',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '双螺管线圈差动型较之单螺管线圈型有较高灵敏度及线性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。双螺管线圈差动型较之单螺管线圈型有较高灵敏度及线性，被用于电感测微计上。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_151',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器的工作原理是金属体在交变磁场中的涡电流效应。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。涡电流式电感传感器的工作原理是金属体在交变磁场中的涡电流效应。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_152',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器不能用于非接触测量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。涡电流式电感传感器的优点是可用于动态非接触测量，结构简单，使用方便。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_153',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '互感式传感器的工作原理是电磁感应中的互感现象。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。互感式传感器的工作原理是电磁感应中的互感现象，将被测位移转化成线圈互感的变化。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '互感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_154',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式电传感器输出的电压是直流量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。差动变压器式电传感器输出的电压是交流量，如用交流电压表指示，则输出值只能反应铁芯位移的大小，而不能反应移动的极性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'mech_e_149',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '可变磁阻式电感传感器的自感L与空气隙δ成正比。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。自感L与空气隙δ成反比，而与空气隙导磁截面面积s₀成正比。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_150',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '可变磁阻式电感传感器适用于较小位移的测量，一般为0.001~1mm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。这种传感器适用于较小位移的测量，一般为0.001~1mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '可变磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_151',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器的工作原理是金属体在交变磁场中的涡电流效应。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。涡电流式电感传感器的工作原理是金属体在交变磁场中的涡电流效应。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_152',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式电感传感器的分辨率高，可达1μm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。涡电流式电感传感器的优点是分辨率高，可达1μm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_153',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '互感式传感器的工作原理是电磁感应中的自感现象。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。互感式传感器的工作原理是电磁感应中的互感现象，而不是自感现象。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '互感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_154',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式传感器中，当铁芯在中心位置时，e₁=e₂，e₀=0。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。当铁芯在中心位置时，e₁=e₂，e₀=0。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_155',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '当铁芯在中心位置时，差动变压器式传感器的两个次级线圈输出电压e₁=e₂，e₀=0。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。当铁芯在中心位置时，e₁=e₂，e₀=0；当铁芯向上运动时，e₁>e₂；当铁芯向下运动时，e₁<e₂。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_156',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '差动变压器式电传感器的精度可达0.1μm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。差动变压器式电传感器的优点是精度高（0.1μm），线性范围大、稳定度好和使用方便。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '差动变压器式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_157',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器需要外部供电电源才能工作。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。磁电感应式传感器是一种机-电能量变换型传感器，不需要外部供电电源，电路简单，性能稳定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_158',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器的频率响应范围一般为10~1000Hz。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。磁电感应式传感器具有一定的频率响应范围（一般为10~1000Hz），适用于振动、转速、扭矩等测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_159',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器的优点是尺寸和质量都很小。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。磁电感应式传感器的缺点是这种传感器的尺寸和质量都较大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_160',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '涡电流式传感器可用于零件计数和无损探伤。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。涡电流式传感器的工程应用包括：振幅测量、位移测量、厚度测量、转速测量、零件计数、无损探伤等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '涡电流式'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
