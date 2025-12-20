/**
 * 机械电气题目数据 - 第三部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：机械电气（第3版）第四节 常用传感器与检测仪器 - 电阻应变式、压阻式、电容式、电感式传感器
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取机械电气题目（第三部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getMechanicalElectricalQuestions3(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'mech_e_081',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '电阻应变式传感器有金属电阻应变片和半导体应变片两种，常用来测定结构的（）。',
      options: [
        { key: 'A', content: '应变或应力' },
        { key: 'B', content: '温度' },
        { key: 'C', content: '湿度' },
        { key: 'D', content: '流量' }
      ],
      answer: 'A',
      analysis: '电阻应变式传感器有金属电阻应变片和半导体应变片两种，常用来测定结构的应变或应力。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '电阻应变式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_082',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '金属电阻应变片的工作原理是：应变片发生变形时，（）发生变化。',
      options: [
        { key: 'A', content: '阻值' },
        { key: 'B', content: '电容' },
        { key: 'C', content: '电感' },
        { key: 'D', content: '频率' }
      ],
      answer: 'A',
      analysis: '金属电阻应变片的工作原理是：应变片发生变形时，阻值发生变化，即R=ρl/A。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '金属电阻应变片'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_083',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '金属电阻应变片的灵敏系数Sg一般为（）。',
      options: [
        { key: 'A', content: '1.7~3.6' },
        { key: 'B', content: '50~70' },
        { key: 'C', content: '0.1~0.5' },
        { key: 'D', content: '10~20' }
      ],
      answer: 'A',
      analysis: '金属电阻应变片的灵敏系数Sg=(dR/R)/(dl/l)=1+2ν=常数，Sg一般为1.7~3.6。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '金属电阻应变片'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_084',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '金属电阻应变片的优点是（）。',
      options: [
        { key: 'A', content: '结构简单、性能稳定、价格低' },
        { key: 'B', content: '灵敏度高' },
        { key: 'C', content: '精度高' },
        { key: 'D', content: '温度稳定性好' }
      ],
      answer: 'A',
      analysis: '金属电阻应变片的优点是结构简单、性能稳定、价格低。缺点是精度不高，灵敏度低。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '金属电阻应变片'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_085',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '半导体应变片的工作原理是半导体材料的（）。',
      options: [
        { key: 'A', content: '压阻效应' },
        { key: 'B', content: '压电效应' },
        { key: 'C', content: '热电效应' },
        { key: 'D', content: '光电效应' }
      ],
      answer: 'A',
      analysis: '半导体应变片的工作原理是半导体材料的压阻效应。压阻效应：单晶片材料在沿某一轴向受到外力作用时，其电阻率ρ发生变化的现象。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '半导体应变片'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_086',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '半导体应变片比金属丝的灵敏度要高（）倍。',
      options: [
        { key: 'A', content: '50~70' },
        { key: 'B', content: '10~20' },
        { key: 'C', content: '5~10' },
        { key: 'D', content: '100~150' }
      ],
      answer: 'A',
      analysis: '半导体应变片比金属丝的灵敏度要高50~70倍。对于半导体硅，πL=(40~80)×10⁻¹¹m²/N，E=1.67×10¹¹N/m²，则K₀=πLE=66.8~133.6。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '半导体应变片'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_087',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '半导体应变片的优点是（）。',
      options: [
        { key: 'A', content: '灵敏度高' },
        { key: 'B', content: '温度稳定性好' },
        { key: 'C', content: '线性误差小' },
        { key: 'D', content: '价格低' }
      ],
      answer: 'A',
      analysis: '半导体应变片的优点是灵敏度高。缺点是温度稳定性能差，灵敏度分散度大，在较大应变作用下，非线性误差大等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '半导体应变片'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_088',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压阻式传感器有两种类型：半导体应变式传感器和（）。',
      options: [
        { key: 'A', content: '固态压阻式传感器' },
        { key: 'B', content: '电容式传感器' },
        { key: 'C', content: '电感式传感器' },
        { key: 'D', content: '热电偶传感器' }
      ],
      answer: 'A',
      analysis: '压阻式传感器有两种类型：半导体应变式传感器、固态压阻式传感器。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_089',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压阻式传感器的优点不包括（）。',
      options: [
        { key: 'A', content: '温度误差小' },
        { key: 'B', content: '灵敏度非常高，有时传感器的输出不需放大可直接用于测量' },
        { key: 'C', content: '分辨率高，例如测量压力时可测出10~20Pa的微压' },
        { key: 'D', content: '测量元件的有效面积可做得很小，故频率响应高' }
      ],
      answer: 'A',
      analysis: '压阻式传感器的优点是：(1)灵敏度非常高，有时传感器的输出不需放大可直接用于测量；(2)分辨率高；(3)测量元件的有效面积可做得很小，故频率响应高；(4)可测量低频加速度和直线加速度。缺点是温度误差大，故需温度补偿或在恒温条件下使用。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '压阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_090',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '电容式传感器是将被测量（如尺寸、压力等）的变化转换成（）变化量的装置。',
      options: [
        { key: 'A', content: '电容' },
        { key: 'B', content: '电阻' },
        { key: 'C', content: '电感' },
        { key: 'D', content: '电压' }
      ],
      answer: 'A',
      analysis: '电容式传感器是将被测量（如尺寸、压力等）的变化转换成电容变化量的装置。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_091',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '平板电容器的电容量计算公式为C=ε₀εS/δ，式中ε₀为真空的介电常数，ε₀=（）F/m。',
      options: [
        { key: 'A', content: '8.854×10⁻¹²' },
        { key: 'B', content: '8.854×10⁻⁶' },
        { key: 'C', content: '1.0' },
        { key: 'D', content: '3.14×10⁻¹²' }
      ],
      answer: 'A',
      analysis: '平板电容器的电容量计算公式为C=ε₀εS/δ，式中ε₀为真空的介电常数，ε₀=8.854×10⁻¹²F/m。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_092',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '根据电容器参数变化的特性，电容式传感器可分为极距变化型、面积变化型和（）三种。',
      options: [
        { key: 'A', content: '介质变化型' },
        { key: 'B', content: '电压变化型' },
        { key: 'C', content: '电流变化型' },
        { key: 'D', content: '频率变化型' }
      ],
      answer: 'A',
      analysis: '根据电容器参数变化的特性，电容式传感器可分为极距变化型、面积变化型和介质变化型三种，其中极距变化型和面积变化型应用较广。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_093',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '极距变化型电容式传感器的优点是（）。',
      options: [
        { key: 'A', content: '可进行非接触测量' },
        { key: 'B', content: '灵敏度为线性' },
        { key: 'C', content: '测量范围大' },
        { key: 'D', content: '配合使用的电子线路简单' }
      ],
      answer: 'A',
      analysis: '极距变化型的优点是可进行非接触测量。它的缺点是：(1)灵敏度与δ成反比，极距越小，灵敏度越高；(2)存在非线性误差，测量范围小；(3)配合使用的电子线路复杂。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_094',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '面积变化型电容式传感器的优点是（）。',
      options: [
        { key: 'A', content: '灵敏度为线性，测量范围大' },
        { key: 'B', content: '可进行非接触测量' },
        { key: 'C', content: '灵敏度高' },
        { key: 'D', content: '配合使用的电子线路简单' }
      ],
      answer: 'A',
      analysis: '面积变化型的优点是灵敏度为线性，测量范围大。可用于测量大的角位移或线位移，差动式比单边结构的灵敏度高1倍。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_095',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '介质变化型电容式传感器是指利用介质介电常数变化将被测量转化为电容量的传感器。常用来测量材料的（）。',
      options: [
        { key: 'A', content: '厚度、液位等' },
        { key: 'B', content: '温度' },
        { key: 'C', content: '速度' },
        { key: 'D', content: '加速度' }
      ],
      answer: 'A',
      analysis: '介质变化型是指利用介质介电常数变化将被测量转化为电容量的传感器。常用来测量材料的厚度、液位等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_096',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '电感式传感器可分为自感型和（）两大类。',
      options: [
        { key: 'A', content: '互感型' },
        { key: 'B', content: '电容型' },
        { key: 'C', content: '电阻型' },
        { key: 'D', content: '压电型' }
      ],
      answer: 'A',
      analysis: '电感式传感器有以下分类：电感式传感器分为自感型和互感型两大类。自感型又分为可变磁阻式和涡流式。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '电感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_097',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '自感型电感传感器又分为可变磁阻式和（）。',
      options: [
        { key: 'A', content: '涡流式' },
        { key: 'B', content: '互感式' },
        { key: 'C', content: '电容式' },
        { key: 'D', content: '压电式' }
      ],
      answer: 'A',
      analysis: '自感型电感传感器又分为可变磁阻式和涡流式。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '电感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_098',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '可变磁阻式电感传感器由线圈、铁芯及衔铁组成。线圈电感（自感）可用下式计算：L=（）。',
      options: [
        { key: 'A', content: 'W²/Rm' },
        { key: 'B', content: 'Rm/W²' },
        { key: 'C', content: 'W×Rm' },
        { key: 'D', content: 'W/Rm' }
      ],
      answer: 'A',
      analysis: '可变磁阻式电感传感器由线圈、铁芯及衔铁组成。线圈电感（自感）可用下式计算：L=W²/Rm，其中W为线圈匝数，Rm为磁路总磁阻。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '电感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_099',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '非线性型传感器又称函数电位器。它是输出电阻（或电压）与电刷位移（包括线位移或角位移）之间具有（）关系的一种电位器。',
      options: [
        { key: 'A', content: '非线性函数' },
        { key: 'B', content: '线性' },
        { key: 'C', content: '正比' },
        { key: 'D', content: '反比' }
      ],
      answer: 'A',
      analysis: '非线性型传感器又称函数电位器。它是输出电阻（或电压）与电刷位移（包括线位移或角位移）之间具有非线性函数关系的一种电位器，即Rx=f(x)。它可以是指数函数、三角函数、对数函数等各种特定函数，也可以是其他任意函数。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '函数电位器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_100',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压阻式传感器最大的缺点是（），故需温度补偿或在恒温条件下使用。',
      options: [
        { key: 'A', content: '温度误差大' },
        { key: 'B', content: '灵敏度低' },
        { key: 'C', content: '分辨率低' },
        { key: 'D', content: '频率响应低' }
      ],
      answer: 'A',
      analysis: '压阻式传感器最大的缺点是温度误差大，故需温度补偿或在恒温条件下使用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'mech_e_101',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '电阻应变式传感器包括（）。',
      options: [
        { key: 'A', content: '金属电阻应变片' },
        { key: 'B', content: '半导体应变片' },
        { key: 'C', content: '电容式传感器' },
        { key: 'D', content: '电感式传感器' }
      ],
      answer: 'A,B',
      analysis: '电阻应变式传感器有金属电阻应变片和半导体应变片两种，常用来测定结构的应变或应力。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '电阻应变式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_102',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压阻式传感器的优点包括（）。',
      options: [
        { key: 'A', content: '灵敏度非常高，有时传感器的输出不需放大可直接用于测量' },
        { key: 'B', content: '分辨率高，例如测量压力时可测出10~20Pa的微压' },
        { key: 'C', content: '测量元件的有效面积可做得很小，故频率响应高' },
        { key: 'D', content: '可测量低频加速度和直线加速度' }
      ],
      answer: 'A,B,C,D',
      analysis: '压阻式传感器的优点是：(1)灵敏度非常高，有时传感器的输出不需放大可直接用于测量；(2)分辨率高，例如测量压力时可测出10~20Pa的微压；(3)测量元件的有效面积可做得很小，故频率响应高；(4)可测量低频加速度和直线加速度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_103',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '根据电容器参数变化的特性，电容式传感器可分为（）。',
      options: [
        { key: 'A', content: '极距变化型' },
        { key: 'B', content: '面积变化型' },
        { key: 'C', content: '介质变化型' },
        { key: 'D', content: '电压变化型' }
      ],
      answer: 'A,B,C',
      analysis: '根据电容器参数变化的特性，电容式传感器可分为极距变化型、面积变化型和介质变化型三种，其中极距变化型和面积变化型应用较广。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_104',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '极距变化型电容式传感器的缺点包括（）。',
      options: [
        { key: 'A', content: '灵敏度与δ成反比，极距越小，灵敏度越高' },
        { key: 'B', content: '存在非线性误差，测量范围小' },
        { key: 'C', content: '配合使用的电子线路复杂' },
        { key: 'D', content: '不能进行非接触测量' }
      ],
      answer: 'A,B,C',
      analysis: '极距变化型的缺点是：(1)灵敏度与δ成反比，极距越小，灵敏度越高；(2)存在非线性误差，测量范围小；(3)配合使用的电子线路复杂。其优点是可进行非接触测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_105',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '电感式传感器的分类包括（）。',
      options: [
        { key: 'A', content: '自感型' },
        { key: 'B', content: '互感型' },
        { key: 'C', content: '可变磁阻式' },
        { key: 'D', content: '涡流式' }
      ],
      answer: 'A,B,C,D',
      analysis: '电感式传感器分为自感型和互感型两大类。自感型又分为可变磁阻式和涡流式。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_106',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '半导体应变片的缺点包括（）。',
      options: [
        { key: 'A', content: '温度稳定性能差' },
        { key: 'B', content: '灵敏度分散度大' },
        { key: 'C', content: '在较大应变作用下，非线性误差大' },
        { key: 'D', content: '灵敏度低' }
      ],
      answer: 'A,B,C',
      analysis: '半导体应变片的优点是灵敏度高。缺点是温度稳定性能差，灵敏度分散度大，在较大应变作用下，非线性误差大等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '半导体应变片'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_107',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '平板电容器的电容量C=ε₀εS/δ，式中各参数的含义包括（）。',
      options: [
        { key: 'A', content: 'ε₀为真空的介电常数' },
        { key: 'B', content: 'ε为极板间介质的相对介电系数' },
        { key: 'C', content: 'S为极板的遮盖面积' },
        { key: 'D', content: 'δ为两平行极板间的距离' }
      ],
      answer: 'A,B,C,D',
      analysis: '平板电容器的电容量C=ε₀εS/δ，式中ε₀为真空的介电常数，ε₀=8.854×10⁻¹²F/m；ε为极板间介质的相对介电系数，在空气中ε=1；S为极板的遮盖面积，m²；δ为两平行极板间的距离，m。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_108',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '变阻器式传感器可分为（）。',
      options: [
        { key: 'A', content: '直线位移型' },
        { key: 'B', content: '角位移型' },
        { key: 'C', content: '非线性型' },
        { key: 'D', content: '电容型' }
      ],
      answer: 'A,B,C',
      analysis: '变阻器式传感器可分为直线位移型、角位移型与非线性型等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '变阻器式'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'mech_e_109',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '电阻应变式传感器有金属电阻应变片和半导体应变片两种，常用来测定结构的应变或应力。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。电阻应变式传感器有金属电阻应变片和半导体应变片两种，常用来测定结构的应变或应力。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '电阻应变式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_110',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '金属电阻应变片的优点是灵敏度高、精度高。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。金属电阻应变片的优点是结构简单、性能稳定、价格低。缺点是精度不高，灵敏度低。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '金属电阻应变片'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_111',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '半导体应变片比金属丝的灵敏度要高50~70倍。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。半导体应变片比金属丝的灵敏度要高50~70倍。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '半导体应变片'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_112',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '半导体应变片的工作原理是半导体材料的压电效应。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。半导体应变片的工作原理是半导体材料的压阻效应，而不是压电效应。压阻效应是指单晶片材料在沿某一轴向受到外力作用时，其电阻率ρ发生变化的现象。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '半导体应变片'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_113',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压阻式传感器最大的缺点是温度误差大，故需温度补偿或在恒温条件下使用。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。压阻式传感器最大的缺点是温度误差大，故需温度补偿或在恒温条件下使用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_114',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '电容式传感器是将被测量（如尺寸、压力等）的变化转换成电容变化量的装置。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。电容式传感器是将被测量（如尺寸、压力等）的变化转换成电容变化量的装置。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_115',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '根据电容器参数变化的特性，电容式传感器可分为极距变化型、面积变化型和介质变化型三种。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据电容器参数变化的特性，电容式传感器可分为极距变化型、面积变化型和介质变化型三种，其中极距变化型和面积变化型应用较广。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_116',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '面积变化型电容式传感器的优点是灵敏度为线性，测量范围大。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。面积变化型的优点是灵敏度为线性，测量范围大。可用于测量大的角位移或线位移，差动式比单边结构的灵敏度高1倍。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_117',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '电感式传感器分为自感型和互感型两大类。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。电感式传感器分为自感型和互感型两大类。自感型又分为可变磁阻式和涡流式。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '电感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_118',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '可变磁阻式电感传感器由线圈、铁芯及衔铁组成。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。可变磁阻式电感传感器由线圈、铁芯及衔铁组成。线圈电感（自感）可用下式计算：L=W²/Rm。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '电感式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_119',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '金属电阻应变片的灵敏系数Sg一般为50~70。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。金属电阻应变片的灵敏系数Sg一般为1.7~3.6。半导体应变片比金属丝的灵敏度要高50~70倍。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '金属电阻应变片'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_120',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '介质变化型电容式传感器常用来测量材料的厚度、液位等。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。介质变化型是指利用介质介电常数变化将被测量转化为电容量的传感器。常用来测量材料的厚度、液位等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电容式'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}