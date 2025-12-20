/**
 * 机械电气题目数据 - 第五部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：机械电气（第3版）- 动圈式传感器、磁阻式传感器、压电式传感器、电荷放大器
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取机械电气题目（第五部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getMechanicalElectricalQuestions5(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'mech_e_161',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '动圈式传感器中，当θ=90°时，感应电动势e=（）。',
      options: [
        { key: 'A', content: 'NBlv' },
        { key: 'B', content: '0' },
        { key: 'C', content: 'NBlv/2' },
        { key: 'D', content: '2NBlv' }
      ],
      answer: 'A',
      analysis: '动圈式传感器中，θ为线圈运动方向与磁场方向的夹角。当θ=90°时，e=NBlv，此时感应电动势最大。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_162',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '当传感器结构一定，即W、B和l均为常数时，感应电动势与线圈运动速度v成（）。',
      options: [
        { key: 'A', content: '正比' },
        { key: 'B', content: '反比' },
        { key: 'C', content: '平方关系' },
        { key: 'D', content: '无关' }
      ],
      answer: 'A',
      analysis: '当传感器结构一定，即W、B和l均为常数时，感应电动势与线圈运动速度v成正比。根据该原理可设计出各种线速度传感器。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_163',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '线圈做旋转运动时，其上产生的感应电动势为e=kNBAω，式中ω表示（）。',
      options: [
        { key: 'A', content: '线圈与磁场相对角速度，rad/s' },
        { key: 'B', content: '线圈匝数' },
        { key: 'C', content: '磁感应强度' },
        { key: 'D', content: '线圈面积' }
      ],
      answer: 'A',
      analysis: '线圈做旋转运动时，其上产生的感应电动势为e=kNBAω，式中k为与结构有关的系数，k<1；ω为线圈与磁场相对角速度，rad/s；A为单匝线圈的截面面积，m²。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_164',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '当N、B、A和k（传感器结构已定）均为常数时，感应电动势与角速度成正比。这种传感器用于（）。',
      options: [
        { key: 'A', content: '转速测量' },
        { key: 'B', content: '温度测量' },
        { key: 'C', content: '湿度测量' },
        { key: 'D', content: '压力测量' }
      ],
      answer: 'A',
      analysis: '当N、B、A和k（传感器结构已定）均为常数时，感应电动势与角速度成正比。这种传感器用于转速测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_165',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器只适用于（）测量。',
      options: [
        { key: 'A', content: '动态' },
        { key: 'B', content: '静态' },
        { key: 'C', content: '准静态' },
        { key: 'D', content: '任意' }
      ],
      answer: 'A',
      analysis: '由上述工作原理可知，磁电感应式传感器只适用于动态测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_166',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '动圈磁电式传感器接等效电路中，线圈电阻Z₀一般为（）。',
      options: [
        { key: 'A', content: '0.1~3kΩ' },
        { key: 'B', content: '10~30kΩ' },
        { key: 'C', content: '0.01~0.1kΩ' },
        { key: 'D', content: '100~300kΩ' }
      ],
      answer: 'A',
      analysis: '动圈磁电式传感器接等效电路中，Z₀为线圈电阻，一般Z₀=0.1~3kΩ。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_167',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '电缆导线的分布电阻Cc一般为（）。',
      options: [
        { key: 'A', content: '70pF/m' },
        { key: 'B', content: '7pF/m' },
        { key: 'C', content: '700pF/m' },
        { key: 'D', content: '0.7pF/m' }
      ],
      answer: 'A',
      analysis: '电缆导线的分布电阻Cc一般Cc=70pF/m。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_168',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '在不使用特别加长电缆时，Cc可忽略，因此当RL≫R₀时，则放大器输入电压uL≈（）。',
      options: [
        { key: 'A', content: 'e₀' },
        { key: 'B', content: '0' },
        { key: 'C', content: 'e₀/2' },
        { key: 'D', content: '2e₀' }
      ],
      answer: 'A',
      analysis: '在不使用特别加长电缆时，Cc可忽略，因此当RL≫R₀时，则放大器输入电压uL≈e₀。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_169',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁阻式又称变磁通式或变气隙式，常用来测量旋转物体的（）。',
      options: [
        { key: 'A', content: '角速度' },
        { key: 'B', content: '温度' },
        { key: 'C', content: '湿度' },
        { key: 'D', content: '压力' }
      ],
      answer: 'A',
      analysis: '磁阻式又称变磁通式或变气隙式，常用来测量旋转物体的角速度。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_170',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '开路变磁通式传感器中，线圈和磁铁静止不动，齿轮（导磁材料制成）每转过一个齿，传感器磁路磁阻变化（）次。',
      options: [
        { key: 'A', content: '一' },
        { key: 'B', content: '二' },
        { key: 'C', content: '三' },
        { key: 'D', content: '四' }
      ],
      answer: 'A',
      analysis: '开路变磁通式传感器中，线圈和磁铁静止不动，齿轮（导磁材料制成）每转过一个齿，传感器磁路磁阻变化一次。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_171',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '线圈产生的感应电动势的变化频率等于测量齿轮上齿数和转速的（）。',
      options: [
        { key: 'A', content: '乘积' },
        { key: 'B', content: '商' },
        { key: 'C', content: '和' },
        { key: 'D', content: '差' }
      ],
      answer: 'A',
      analysis: '线圈产生的感应电动势的变化频率等于测量齿轮上齿数和转速的乘积。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_172',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '变磁通式传感器对环境条件要求不高，能在-150~+90℃的温度下工作，不影响测量精度，其工作频率下限较高，约为（）Hz。',
      options: [
        { key: 'A', content: '50' },
        { key: 'B', content: '10' },
        { key: 'C', content: '100' },
        { key: 'D', content: '500' }
      ],
      answer: 'A',
      analysis: '变磁通式传感器对环境条件要求不高，能在-150~+90℃的温度下工作，不影响测量精度，也能在油、水雾、灰尘等条件下工作。但它的工作频率下限较高，约为50Hz，上限可达100Hz。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_173',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '变磁通式传感器的工作频率上限可达（）Hz。',
      options: [
        { key: 'A', content: '100' },
        { key: 'B', content: '50' },
        { key: 'C', content: '200' },
        { key: 'D', content: '500' }
      ],
      answer: 'A',
      analysis: '变磁通式传感器的工作频率下限较高，约为50Hz，上限可达100Hz。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_174',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压电式传感器的工作原理是以某些物质的（）为基础。',
      options: [
        { key: 'A', content: '压电效应' },
        { key: 'B', content: '压阻效应' },
        { key: 'C', content: '热电效应' },
        { key: 'D', content: '光电效应' }
      ],
      answer: 'A',
      analysis: '压电式传感器的工作原理是以某些物质的压电效应为基础。它具有自发电和可逆两种重要特性。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_175',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压电式传感器是一种可逆型换能器，既可将机械能转换为电能，又可将电能转换为（）。',
      options: [
        { key: 'A', content: '机械能' },
        { key: 'B', content: '热能' },
        { key: 'C', content: '光能' },
        { key: 'D', content: '化学能' }
      ],
      answer: 'A',
      analysis: '压电式传感器是一种可逆型换能器，既可将机械能转换为电能，又可将电能转换为机械能。这种性质使它被广泛用于力、压力、加速度测量，也被用于超声波发射与接收装置。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_176',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压电式传感器具有体积小、质量轻、精确度及灵敏度高等优点，这种传感器被广泛用于（）测量。',
      options: [
        { key: 'A', content: '力、压力、加速度' },
        { key: 'B', content: '温度、湿度' },
        { key: 'C', content: '流量、液位' },
        { key: 'D', content: '浓度、密度' }
      ],
      answer: 'A',
      analysis: '这种性质使它被广泛用于力、压力、加速度测量，也被用于超声波发射与接收装置。这种传感器具有体积小、质量轻、精确度及灵敏度高等优点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_177',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '某些物质（物体），如石英、钛酸钡等，当受到外力作用时，不仅几何尺寸会发生变化，内部也会被极化，表面上也会产生电荷；当外力去掉时，又重新回到原来的状态。这种现象称为（）。',
      options: [
        { key: 'A', content: '压电效应' },
        { key: 'B', content: '压阻效应' },
        { key: 'C', content: '热电效应' },
        { key: 'D', content: '霍尔效应' }
      ],
      answer: 'A',
      analysis: '某些物质（物体），如石英、钛酸钡等，当受到外力作用时，不仅几何尺寸会发生变化，内部也会被极化，表面上也会产生电荷；当外力去掉时，又重新回到原来的状态。这种现象称为压电效应。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_178',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '如果将这些物质（物体）置于电场中，其几何尺寸也会发生变化，这种由外电场作用导致物质（物体）产生机械变形的现象，称为（）。',
      options: [
        { key: 'A', content: '逆压电效应或电致伸缩效应' },
        { key: 'B', content: '正压电效应' },
        { key: 'C', content: '热电效应' },
        { key: 'D', content: '光电效应' }
      ],
      answer: 'A',
      analysis: '如果将这些物质（物体）置于电场中，其几何尺寸也会发生变化，这种由外电场作用导致物质（物体）产生机械变形的现象，称为逆压电效应，或称为电致伸缩效应。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_179',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '具有压电效应的物质（物体）称为（）。',
      options: [
        { key: 'A', content: '压电材料（或称为压电元件）' },
        { key: 'B', content: '导电材料' },
        { key: 'C', content: '绝缘材料' },
        { key: 'D', content: '磁性材料' }
      ],
      answer: 'A',
      analysis: '具有压电效应的物质（物体）称为压电材料（或称为压电元件）。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_180',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '天然石英晶体的结构形状为一个六角形晶柱，两端为一对称棱锥。在晶体学中，可以把它用三根互相垂直的轴表示，其中纵轴z称为（）。',
      options: [
        { key: 'A', content: '光轴' },
        { key: 'B', content: '电轴' },
        { key: 'C', content: '机械轴' },
        { key: 'D', content: '磁轴' }
      ],
      answer: 'A',
      analysis: '天然石英晶体的结构形状为一个六角形晶柱，两端为一对称棱锥。在晶体学中，可以把它用三根互相垂直的轴表示，其中纵轴z称为光轴；通过六棱线而垂直于光轴的x轴称为电轴；与x-x轴和z-z轴垂直的y-y轴（垂直于六棱柱体的棱面），称为机械轴。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'mech_e_181',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压电式传感器具有的重要特性包括（）。',
      options: [
        { key: 'A', content: '自发电' },
        { key: 'B', content: '可逆' },
        { key: 'C', content: '体积小' },
        { key: 'D', content: '质量轻' }
      ],
      answer: 'A,B,C,D',
      analysis: '压电式传感器具有自发电和可逆两种重要特性。这种传感器具有体积小、质量轻、精确度及灵敏度高等优点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_182',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压电式传感器被广泛用于（）测量。',
      options: [
        { key: 'A', content: '力' },
        { key: 'B', content: '压力' },
        { key: 'C', content: '加速度' },
        { key: 'D', content: '超声波发射与接收' }
      ],
      answer: 'A,B,C,D',
      analysis: '压电式传感器被广泛用于力、压力、加速度测量，也被用于超声波发射与接收装置。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_183',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '常用的压电材料可分为（）。',
      options: [
        { key: 'A', content: '压电晶体' },
        { key: 'B', content: '压电陶瓷' },
        { key: 'C', content: '有机压电薄膜' },
        { key: 'D', content: '压电金属' }
      ],
      answer: 'A,B,C',
      analysis: '常用的压电材料可分为三类：压电晶体、压电陶瓷和有机压电薄膜。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_184',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '石英晶体的三根互相垂直的轴包括（）。',
      options: [
        { key: 'A', content: '光轴（z轴）' },
        { key: 'B', content: '电轴（x轴）' },
        { key: 'C', content: '机械轴（y轴）' },
        { key: 'D', content: '磁轴' }
      ],
      answer: 'A,B,C',
      analysis: '石英晶体可以用三根互相垂直的轴表示：纵轴z称为光轴；通过六棱线而垂直于光轴的x轴称为电轴；与x-x轴和z-z轴垂直的y-y轴称为机械轴。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_185',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '石英晶体的压电效应类型包括（）。',
      options: [
        { key: 'A', content: '纵向压电效应' },
        { key: 'B', content: '横向压电效应' },
        { key: 'C', content: '切向效应' },
        { key: 'D', content: '热电效应' }
      ],
      answer: 'A,B,C',
      analysis: '若对其施力，则有几种不同的效应：沿电轴（x轴）方向的作用力产生的压电效应称为纵向压电效应；沿机械轴（y轴）方向的作用力产生的压电效应称为横向压电效应；沿相对两棱加力时，则产生切向效应。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_186',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁阻式传感器的应用包括（）。',
      options: [
        { key: 'A', content: '测频数' },
        { key: 'B', content: '测转速' },
        { key: 'C', content: '偏心测量' },
        { key: 'D', content: '振动测量' }
      ],
      answer: 'A,B,C,D',
      analysis: '磁阻式传感器工作原理及应用包括：测频数、测转速、偏心测量、振动测量等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_187',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '变磁通式传感器能在以下哪些条件下工作？（）',
      options: [
        { key: 'A', content: '油' },
        { key: 'B', content: '水雾' },
        { key: 'C', content: '灰尘' },
        { key: 'D', content: '-150~+90℃温度' }
      ],
      answer: 'A,B,C,D',
      analysis: '变磁通式传感器对环境条件要求不高，能在-150~+90℃的温度下工作，不影响测量精度，也能在油、水雾、灰尘等条件下工作。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_188',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '动圈式传感器中，感应电动势e=WBlvsinθ，式中包含的参数有（）。',
      options: [
        { key: 'A', content: 'W为线圈匝数' },
        { key: 'B', content: 'B为磁场的磁感应强度' },
        { key: 'C', content: 'l为单匝线圈有效长度' },
        { key: 'D', content: 'v为线圈与磁场的相对运动速度' }
      ],
      answer: 'A,B,C,D',
      analysis: '动圈式传感器中，感应电动势e=WBlvsinθ，式中W为线圈匝数；B为磁场的磁感应强度，T；l为单匝线圈有效长度，m；v为线圈与磁场的相对运动速度，m/s；θ为线圈运动方向与磁场方向的夹角。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'mech_e_189',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '当θ=90°时，动圈式传感器的感应电动势e=NBlv。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '当θ=90°时，sin90°=1，所以e=NBlv，此时感应电动势最大。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_190',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '当传感器结构一定时，感应电动势与线圈运动速度v成反比。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '当传感器结构一定，即W、B和l均为常数时，感应电动势与线圈运动速度v成正比，而非反比。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_191',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁电感应式传感器既适用于动态测量，也适用于静态测量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '由工作原理可知，磁电感应式传感器只适用于动态测量，不适用于静态测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁电感应式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_192',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '动圈磁电式传感器接等效电路中，线圈电阻Z₀一般为0.1~3kΩ。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '动圈磁电式传感器接等效电路中，Z₀为线圈电阻，一般Z₀=0.1~3kΩ。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '动圈式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_193',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '磁阻式传感器又称变磁通式或变气隙式，常用来测量旋转物体的角速度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '磁阻式又称变磁通式或变气隙式，常用来测量旋转物体的角速度。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_194',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '变磁通式传感器的工作频率下限较高，约为50Hz，上限可达100Hz。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '变磁通式传感器的工作频率下限较高，约为50Hz，上限可达100Hz。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '磁阻式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_195',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压电式传感器的工作原理是以某些物质的压阻效应为基础。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '压电式传感器的工作原理是以某些物质的压电效应为基础，而非压阻效应。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_196',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压电式传感器是一种可逆型换能器，既可将机械能转换为电能，又可将电能转换为机械能。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '压电式传感器是一种可逆型换能器，既可将机械能转换为电能，又可将电能转换为机械能。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_197',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '由外电场作用导致物质（物体）产生机械变形的现象，称为正压电效应。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '由外电场作用导致物质（物体）产生机械变形的现象，称为逆压电效应，或称为电致伸缩效应，而非正压电效应。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_198',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '常用的压电材料可分为三类：压电晶体、压电陶瓷和有机压电薄膜。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '常用的压电材料可分为三类：压电晶体、压电陶瓷和有机压电薄膜。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_199',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '石英晶体中，通过六棱线而垂直于光轴的x轴称为机械轴。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '通过六棱线而垂直于光轴的x轴称为电轴，而非机械轴。与x-x轴和z-z轴垂直的y-y轴（垂直于六棱柱体的棱面）才称为机械轴。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_200',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压电式传感器主要是利用纵向压电效应。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '压电式传感器主要是利用纵向压电效应。沿电轴（x轴）方向的作用力（一般利用压力）产生的压电效应称为纵向压电效应。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
