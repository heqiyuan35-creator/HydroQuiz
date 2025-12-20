/**
 * 机械电气题目数据 - 第六部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：机械电气（第3版）- 电荷放大器、热电式传感器、热电阻传感器、光电传感器
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取机械电气题目（第六部分）
 * 单选题23题、多选题9题、判断题14题，共46题
 */
export function getMechanicalElectricalQuestions6(timestamp: number): Question[] {
  return [
    // ========== 单选题 23题 ==========
    {
      id: 'mech_e_201',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '如果放大器开环增益足够大，则kCf≫C+Ci，故上式可简化为u₀≈（）。',
      options: [
        { key: 'A', content: '-q/Cf' },
        { key: 'B', content: 'q/Cf' },
        { key: 'C', content: '-q×Cf' },
        { key: 'D', content: 'q×Cf' }
      ],
      answer: 'A',
      analysis: '如果放大器开环增益足够大，则kCf≫C+Ci，故上式可简化为u₀≈-q/Cf。在一定情况下，电荷放大器的输出电压与传感器的电荷量成正比，并且与电缆分布电容无关。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '电荷放大器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_202',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '采用电荷放大器时，即使联接电缆长度在百米以上，其灵敏度也无明显变化，这是电荷放大器的（）。',
      options: [
        { key: 'A', content: '突出优点' },
        { key: 'B', content: '主要缺点' },
        { key: 'C', content: '一般特性' },
        { key: 'D', content: '使用限制' }
      ],
      answer: 'A',
      analysis: '采用电荷放大器时，即使联接电缆长度在百米以上，其灵敏度也无明显变化，这是电荷放大器的突出优点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '电荷放大器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_203',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压电式传感器适宜作（）测量。',
      options: [
        { key: 'A', content: '动态' },
        { key: 'B', content: '静态' },
        { key: 'C', content: '准静态' },
        { key: 'D', content: '任意' }
      ],
      answer: 'A',
      analysis: '由于不可避免地存在电荷泄漏，利用压电式传感器测量静态或准静态量值时，必须采取一定措施。而在作动态测量时，电荷可以不断补充，从而供给测量电路一定的电流，故压电式传感器适宜作动态测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_204',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电式传感器是利用转换元件电磁参量随温度变化的特性，对温度和与温度有关的参量进行检测的装置。其中将温度变化转换为电阻变化的称为（）。',
      options: [
        { key: 'A', content: '热电阻传感器' },
        { key: 'B', content: '热电偶传感器' },
        { key: 'C', content: '压电传感器' },
        { key: 'D', content: '光电传感器' }
      ],
      answer: 'A',
      analysis: '热电式传感器是利用转换元件电磁参量随温度变化的特性，对温度和与温度有关的参量进行检测的装置。其中将温度变化转换为电阻变化的称为热电阻传感器，将温度变化转换为热电势变化的称为热电偶传感器。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '热电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_205',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '将温度变化转换为热电势变化的称为（）。',
      options: [
        { key: 'A', content: '热电偶传感器' },
        { key: 'B', content: '热电阻传感器' },
        { key: 'C', content: '压阻传感器' },
        { key: 'D', content: '电容传感器' }
      ],
      answer: 'A',
      analysis: '将温度变化转换为热电势变化的称为热电偶传感器。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '热电偶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_206',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电偶传感器在温度测量中应用极为广泛，因为它结构简单、制造方便、测温范围宽、热惯性小、准确度高、输出信号便于（）。',
      options: [
        { key: 'A', content: '远传' },
        { key: 'B', content: '放大' },
        { key: 'C', content: '存储' },
        { key: 'D', content: '显示' }
      ],
      answer: 'A',
      analysis: '热电偶传感器在温度测量中应用极为广泛，因为它结构简单、制造方便、测温范围宽、热惯性小、准确度高、输出信号便于远传。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电偶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_207',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '将两种不同性质的导体A、B组成闭合回路，当节点(1)、(2)处于不同的温度(T≠T₀)时，两者之间将产生一热电势，在回路中形成一定大小的电流，这种现象称为（）。',
      options: [
        { key: 'A', content: '热电效应' },
        { key: 'B', content: '压电效应' },
        { key: 'C', content: '光电效应' },
        { key: 'D', content: '霍尔效应' }
      ],
      answer: 'A',
      analysis: '将两种不同性质的导体A、B组成闭合回路，当节点(1)、(2)处于不同的温度(T≠T₀)时，两者之间将产生一热电势，在回路中形成一定大小的电流，这种现象称为热电效应。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电偶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_208',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电偶的热电势由接触电势（珀尔帖电势）和（）两部分组成。',
      options: [
        { key: 'A', content: '温差电势（汤姆逊电势）' },
        { key: 'B', content: '压电电势' },
        { key: 'C', content: '感应电势' },
        { key: 'D', content: '霍尔电势' }
      ],
      answer: 'A',
      analysis: '热电偶的热电势由接触电势（珀尔帖电势）和温差电势（汤姆逊电势）两部分组成。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '热电偶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_209',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '波尔兹曼常数k=（）J/K。',
      options: [
        { key: 'A', content: '1.38×10⁻²³' },
        { key: 'B', content: '1.38×10⁻¹⁹' },
        { key: 'C', content: '1.6×10⁻¹⁹' },
        { key: 'D', content: '6.02×10²³' }
      ],
      answer: 'A',
      analysis: '波尔兹曼常数k=1.38×10⁻²³J/K。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '热电偶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_210',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '电子电荷e=（）C。',
      options: [
        { key: 'A', content: '1.6×10⁻¹⁹' },
        { key: 'B', content: '1.38×10⁻²³' },
        { key: 'C', content: '6.02×10²³' },
        { key: 'D', content: '9.1×10⁻³¹' }
      ],
      answer: 'A',
      analysis: '电子电荷e=1.6×10⁻¹⁹C。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '基本常数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_211',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电偶的热电特性仅决定于选用的热电极材料的特性，而与热极的（）无关。',
      options: [
        { key: 'A', content: '直径、长度' },
        { key: 'B', content: '材质' },
        { key: 'C', content: '纯度' },
        { key: 'D', content: '结构' }
      ],
      answer: 'A',
      analysis: '最后还应强调一点，热电偶的热电特性仅决定于选用的热电极材料的特性，而与热极的直径、长度无关。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电偶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_212',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电阻传感器可分为金属热电阻式和半导体热电阻式两大类，前者简称热电阻，后者简称（）。',
      options: [
        { key: 'A', content: '热敏电阻' },
        { key: 'B', content: '压敏电阻' },
        { key: 'C', content: '光敏电阻' },
        { key: 'D', content: '湿敏电阻' }
      ],
      answer: 'A',
      analysis: '热电阻传感器可分为金属热电阻式和半导体热电阻式两大类，前者简称热电阻，后者简称热敏电阻。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '热电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_213',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电阻材料必须具有高温度系数、高电阻率的特点，这样在同样条件下可加快反应速度，提高灵敏度，减小（）。',
      options: [
        { key: 'A', content: '体积和质量' },
        { key: 'B', content: '精度' },
        { key: 'C', content: '测量范围' },
        { key: 'D', content: '使用寿命' }
      ],
      answer: 'A',
      analysis: '热电阻材料必须具有高温度系数、高电阻率。这样在同样条件下可加快反应速度，提高灵敏度，减小体积和质量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_214',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '适宜制作热电阻的材料有铂、铜、钢、锰、碳、镍、铁等。其中（）容易提纯，在高温和氧化性介质中化学、物理性能稳定，制成的铂电阻输出—输入特性接近线性，测量精度高。',
      options: [
        { key: 'A', content: '铂' },
        { key: 'B', content: '铜' },
        { key: 'C', content: '镍' },
        { key: 'D', content: '铁' }
      ],
      answer: 'A',
      analysis: '铂容易提纯，在高温和氧化性介质中化学、物理性能稳定，制成的铂电阻输出—输入特性接近线性，测量精度高。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电阻', '铂电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_215',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '铂电阻制成的温度计，除作温度标准外，还广泛应用于高精度的工业测量。由于铂为贵金属，一般在测量精度要求不高和测温范围较小时，均采用（）。',
      options: [
        { key: 'A', content: '铜电阻' },
        { key: 'B', content: '镍电阻' },
        { key: 'C', content: '铁电阻' },
        { key: 'D', content: '碳电阻' }
      ],
      answer: 'A',
      analysis: '铂电阻制成的温度计，除作温度标准外，还广泛应用于高精度的工业测量。由于铂为贵金属，一般在测量精度要求不高和测温范围较小时，均采用铜电阻。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电阻', '铜电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_216',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '铜在-50~150℃范围内电阻化学、物理性能稳定，输出—输入特性接近线性，价格（）。',
      options: [
        { key: 'A', content: '低廉' },
        { key: 'B', content: '昂贵' },
        { key: 'C', content: '适中' },
        { key: 'D', content: '不稳定' }
      ],
      answer: 'A',
      analysis: '铜在-50~150℃范围内电阻化学、物理性能稳定，输出—输入特性接近线性，价格低廉。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '热电阻', '铜电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_217',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '铜电阻电阻率小，当温度高于100℃时易被氧化，因此适用于在温度较低的环境和没有侵蚀性的介质中工作。铜电阻的电阻温度系数α取值范围为（）×10⁻³/℃。',
      options: [
        { key: 'A', content: '(4.25~4.28)' },
        { key: 'B', content: '(3.25~3.28)' },
        { key: 'C', content: '(5.25~5.28)' },
        { key: 'D', content: '(2.25~2.28)' }
      ],
      answer: 'A',
      analysis: '铜电阻阻值与温度变化之间的关系可近似表示为Rt=R₀(1+αt)，式中α为电阻温度系数，取值范围为(4.25~4.28)×10⁻³/℃（铂的电阻温度系数在0~100℃的平均值为3.9×10⁻³/℃）。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '热电阻', '铜电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_218',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '铟电阻适宜在-269~-258℃范围内使用，测温精度高，灵敏度是铂电阻的10倍，但是（）。',
      options: [
        { key: 'A', content: '复现性差' },
        { key: 'B', content: '价格昂贵' },
        { key: 'C', content: '体积大' },
        { key: 'D', content: '响应慢' }
      ],
      answer: 'A',
      analysis: '铟电阻适宜在-269~-258℃范围内使用，测温精度高，灵敏度是铂电阻的10倍，但是复现性差。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_219',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '锰电阻适宜在-271~-210℃范围内使用，灵敏度高，但是（）。',
      options: [
        { key: 'A', content: '质脆易损坏' },
        { key: 'B', content: '价格昂贵' },
        { key: 'C', content: '复现性差' },
        { key: 'D', content: '热稳定性差' }
      ],
      answer: 'A',
      analysis: '锰电阻适宜在-271~-210℃范围内使用，灵敏度高，但是质脆易损坏。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_220',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '碳电阻适宜在-273~-268.5℃范围内使用，热容量小，灵敏度高，价格低廉，操作简便，但是（）。',
      options: [
        { key: 'A', content: '热稳定性较差' },
        { key: 'B', content: '复现性差' },
        { key: 'C', content: '质脆易损坏' },
        { key: 'D', content: '精度低' }
      ],
      answer: 'A',
      analysis: '碳电阻适宜在-273~-268.5℃范围内使用，热容量小，灵敏度高，价格低廉，操作简便，但是热稳定性较差。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_221',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '光电传感器的工作原理是（）。',
      options: [
        { key: 'A', content: '光电效应' },
        { key: 'B', content: '压电效应' },
        { key: 'C', content: '热电效应' },
        { key: 'D', content: '霍尔效应' }
      ],
      answer: 'A',
      analysis: '光电传感器的工作原理是光电效应。光电效应按其作用原理又分为外光电效应、内光电效应和光生伏特效应。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_222',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '在光的作用下，物体内的电子逸出物体表面，向外发射的现象叫（）。',
      options: [
        { key: 'A', content: '外光电效应' },
        { key: 'B', content: '内光电效应' },
        { key: 'C', content: '光生伏特效应' },
        { key: 'D', content: '热电效应' }
      ],
      answer: 'A',
      analysis: '在光的作用下，物体内的电子逸出物体表面，向外发射的现象叫外光电效应。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_223',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '只有当光子能量大于逸出功时，即hv>A时，才有电子发射出来，即有光电效应；当光子的能量等于逸出功时，即hv=A时，逸出的电子初速度为0，此时光子的频率v₀为该物质产生外光电效应的最低频率，称为（）。',
      options: [
        { key: 'A', content: '红限频率' },
        { key: 'B', content: '截止频率' },
        { key: 'C', content: '临界频率' },
        { key: 'D', content: '共振频率' }
      ],
      answer: 'A',
      analysis: '只有当光子能量大于逸出功时，即hv>A时，才有电子发射出来，即有光电效应；当光子的能量等于逸出功时，即hv=A时，逸出的电子初速度为0，此时光子的频率v₀为该物质产生外光电效应的最低频率，称为红限频率。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 9题 ==========
    {
      id: 'mech_e_224',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '光电效应按其作用原理又分为（）。',
      options: [
        { key: 'A', content: '外光电效应' },
        { key: 'B', content: '内光电效应' },
        { key: 'C', content: '光生伏特效应' },
        { key: 'D', content: '热电效应' }
      ],
      answer: 'A,B,C',
      analysis: '光电效应按其作用原理又分为外光电效应、内光电效应和光生伏特效应。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_225',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '利用外光电效应制成的光电器件有（）。',
      options: [
        { key: 'A', content: '真空光电管' },
        { key: 'B', content: '充气光电管' },
        { key: 'C', content: '光电倍增管' },
        { key: 'D', content: '光敏电阻' }
      ],
      answer: 'A,B,C',
      analysis: '利用外光电效应制成的光电器件有真空光电管、充气光电管和光电倍增管。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_226',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '利用光生伏特效应制成的光电器件有（）。',
      options: [
        { key: 'A', content: '光敏二极管' },
        { key: 'B', content: '光敏三极管' },
        { key: 'C', content: '光电池' },
        { key: 'D', content: '光电倍增管' }
      ],
      answer: 'A,B,C',
      analysis: '利用光生伏特效应制成的光电器件有光敏二极管、光敏三极管和光电池等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_227',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电偶传感器在温度测量中应用极为广泛，其优点包括（）。',
      options: [
        { key: 'A', content: '结构简单、制造方便' },
        { key: 'B', content: '测温范围宽' },
        { key: 'C', content: '热惯性小、准确度高' },
        { key: 'D', content: '输出信号便于远传' }
      ],
      answer: 'A,B,C,D',
      analysis: '热电偶传感器在温度测量中应用极为广泛，因为它结构简单、制造方便、测温范围宽、热惯性小、准确度高、输出信号便于远传。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电偶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_228',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '为了保证在工程技术中应用可靠，并有足够的精确度，对热电偶电极材料有以下要求（）。',
      options: [
        { key: 'A', content: '在测温范围内，热电性质稳定，不随时间变化' },
        { key: 'B', content: '在测温范围内，电极材料要有足够的物理化学稳定性，不易氧化或腐蚀' },
        { key: 'C', content: '电阻温度系数要小，导电率要高' },
        { key: 'D', content: '它们组成的热电偶，在测温中产生的电势要大，并希望这个热电势与温度呈单值的线性或接近线性关系' }
      ],
      answer: 'A,B,C,D',
      analysis: '为了保证在工程技术中应用可靠，并有足够的精确度，对热电偶电极材料有以下要求：(1)在测温范围内，热电性质稳定，不随时间变化；(2)在测温范围内，电极材料要有足够的物理化学稳定性，不易氧化或腐蚀；(3)电阻温度系数要小，导电率要高；(4)它们组成的热电偶，在测温中产生的电势要大，并希望这个热电势与温度呈单值的线性或接近线性关系；(5)材料复制性好，可制成标准分度，机械强度高，制造工艺简单，价格便宜。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '热电偶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_229',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电阻材料必须具有以下特点（）。',
      options: [
        { key: 'A', content: '高温度系数、高电阻率' },
        { key: 'B', content: '化学、物理性能稳定' },
        { key: 'C', content: '良好的输出特性，即必须有线性的或者接近线性的输出' },
        { key: 'D', content: '良好的工艺性，便于批量生产，降低成本' }
      ],
      answer: 'A,B,C,D',
      analysis: '热电阻材料必须具有以下特点：(1)高温度系数、高电阻率；(2)化学、物理性能稳定，以保证在使用温度范围内热电阻的测量准确性；(3)良好的输出特性，即必须有线性的或者接近线性的输出；(4)良好的工艺性，便于批量生产，降低成本。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_230',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '适宜制作热电阻的材料有（）。',
      options: [
        { key: 'A', content: '铂、铜' },
        { key: 'B', content: '钢、锰' },
        { key: 'C', content: '碳、镍' },
        { key: 'D', content: '铁' }
      ],
      answer: 'A,B,C,D',
      analysis: '适宜制作热电阻的材料有铂、铜、钢、锰、碳、镍、铁等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '热电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_231',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '光电管种类很多，它是个装有光阴极和阳极的真空玻璃管。光电管的阴极受到适当的照射后便发射光电子，这些光电子在电场作用下被具有一定电位的阳极吸引，在光电管内形成空间电子流。光电管包括（）。',
      options: [
        { key: 'A', content: '真空光电管' },
        { key: 'B', content: '充气光电管' },
        { key: 'C', content: '光电倍增管' },
        { key: 'D', content: '光敏电阻' }
      ],
      answer: 'A,B',
      analysis: '光电管种类很多，包括真空光电管和充气光电管。如果在玻璃管内充入惰性气体（如氩、氖等），即构成充气光电管。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_232',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '在光的作用下，电子吸收光子能量从键合状态过渡到自由状态，引起物体电阻率的变化，这种现象称为内光电效应。内光电效应的特点包括（）。',
      options: [
        { key: 'A', content: '没有电子自物体向外发射' },
        { key: 'B', content: '仅改变物体内部的电阻或电导' },
        { key: 'C', content: '有时也称为光电导效应' },
        { key: 'D', content: '也要受到红限频率限制' }
      ],
      answer: 'A,B,C,D',
      analysis: '在光的作用下，电子吸收光子能量从键合状态过渡到自由状态，引起物体电阻率的变化，这种现象称为内光电效应。由于这里没有电子自物体向外发射，仅改变物体内部的电阻或电导，有时也称为光电导效应。与外光电效应一样，要产生光电导效应，也要受到红限频率限制。',
      difficulty: DifficultyLevel.HARD,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 14题 ==========
    {
      id: 'mech_e_233',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '采用电荷放大器时，即使联接电缆长度在百米以上，其灵敏度也无明显变化。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '采用电荷放大器时，即使联接电缆长度在百米以上，其灵敏度也无明显变化，这是电荷放大器的突出优点。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '电荷放大器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_234',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '压电式传感器适宜作静态测量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '由于不可避免地存在电荷泄漏，利用压电式传感器测量静态或准静态量值时，必须采取一定措施。而在作动态测量时，电荷可以不断补充，故压电式传感器适宜作动态测量，而非静态测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '压电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_235',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '将温度变化转换为电阻变化的称为热电偶传感器。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '将温度变化转换为电阻变化的称为热电阻传感器，而非热电偶传感器。将温度变化转换为热电势变化的才称为热电偶传感器。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '热电式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_236',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电偶传感器在温度测量中应用极为广泛，因为它结构简单、制造方便、测温范围宽、热惯性小、准确度高、输出信号便于远传。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '热电偶传感器在温度测量中应用极为广泛，因为它结构简单、制造方便、测温范围宽、热惯性小、准确度高、输出信号便于远传。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '热电偶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_237',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电偶的热电势由接触电势（珀尔帖电势）和温差电势（汤姆逊电势）两部分组成。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '热电偶的热电势由接触电势（珀尔帖电势）和温差电势（汤姆逊电势）两部分组成。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电偶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_238',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电偶的热电特性与热极的直径、长度有关。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '热电偶的热电特性仅决定于选用的热电极材料的特性，而与热极的直径、长度无关。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电偶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_239',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '热电阻传感器可分为金属热电阻式和半导体热电阻式两大类，前者简称热电阻，后者简称热敏电阻。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '热电阻传感器可分为金属热电阻式和半导体热电阻式两大类，前者简称热电阻，后者简称热敏电阻。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '热电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_240',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '铂容易提纯，在高温和氧化性介质中化学、物理性能稳定，制成的铂电阻输出—输入特性接近线性，测量精度高。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '铂容易提纯，在高温和氧化性介质中化学、物理性能稳定，制成的铂电阻输出—输入特性接近线性，测量精度高。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '热电阻', '铂电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_241',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '铜电阻电阻率大，当温度高于100℃时不易被氧化。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '铜电阻电阻率小，当温度高于100℃时易被氧化，因此适用于在温度较低的环境和没有侵蚀性的介质中工作。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '热电阻', '铜电阻'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_242',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '光电传感器的工作原理是光电效应。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '光电传感器的工作原理是光电效应。光电效应按其作用原理又分为外光电效应、内光电效应和光生伏特效应。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_243',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '在光的作用下，物体内的电子逸出物体表面，向外发射的现象叫内光电效应。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '在光的作用下，物体内的电子逸出物体表面，向外发射的现象叫外光电效应，而非内光电效应。内光电效应是指电子吸收光子能量从键合状态过渡到自由状态，引起物体电阻率的变化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_244',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '利用内光电效应可制成半导体光敏电阻。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '利用内光电效应可制成半导体光敏电阻。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_245',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '在光的作用下，能够使物体内部产生一定方向的电动势的现象叫光生伏特效应。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '在光的作用下，能够使物体内部产生一定方向的电动势的现象叫光生伏特效应。利用光生伏特效应制成的光电器件有光敏二极管、光敏三极管和光电池等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_e_246',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第四节 常用传感器与检测仪器',
      content: '如果在玻璃管内充入惰性气体（如氩、氖等），即构成充气光电管。由于光电子流对惰性气体进行轰击，使其电离产生更多的自由电子，从而提高光电变换的灵敏度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '如果在玻璃管内充入惰性气体（如氩、氖等），即构成充气光电管。由于光电子流对惰性气体进行轰击，使其电离产生更多的自由电子，从而提高光电变换的灵敏度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '传感器', '光电传感器'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
