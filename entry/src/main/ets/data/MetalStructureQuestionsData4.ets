/**
 * 金属结构题目数据 - 第四部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：金属结构（第3版）第二章 焊接质量检验 - 射线胶片、感光原理、黑度计、增感屏
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取金属结构题目（第四部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getMetalStructureQuestions4(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'metal_121',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线胶片的结构在0.25~0.3mm的厚度中含有（）层材料。',
      options: [
        { key: 'A', content: '五' },
        { key: 'B', content: '六' },
        { key: 'C', content: '七' },
        { key: 'D', content: '八' }
      ],
      answer: 'C',
      analysis: '射线胶片的结构在0.25~0.3mm的厚度中含有七层材料，包括片基、结合层（薪合层或底膜）、感光乳剂层和保护层。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '胶片结构'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_122',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '片基是感光乳剂层的支持体，在胶片中起骨架作用，厚度（）mm，大多采用醋酸纤维或聚酯材料（涤纶）制作。',
      options: [
        { key: 'A', content: '0.175~0.20' },
        { key: 'B', content: '0.25~0.30' },
        { key: 'C', content: '0.10~0.15' },
        { key: 'D', content: '0.30~0.35' }
      ],
      answer: 'A',
      analysis: '片基是感光乳剂层的支持体，在胶片中起骨架作用，厚度0.175~0.20mm，大多采用醋酸纤维或聚酯材料（涤纶）制作。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '片基'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_123',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '为改善照明下的观察效果，通常射线胶片片基采用（）。',
      options: [
        { key: 'A', content: '淡蓝色' },
        { key: 'B', content: '透明色' },
        { key: 'C', content: '淡黄色' },
        { key: 'D', content: '乳白色' }
      ],
      answer: 'A',
      analysis: '聚酯片基较薄，韧性好，强度高，更适用于自动冲洗。为改善照明下的观察效果，通常射线胶片片基采用淡蓝色。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '片基'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_124',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '结合层的作用是使感光乳剂层和片基牢固地黏结在一起，防止感光乳剂层在冲洗时从片基上脱下来，结合层由（）组成。',
      options: [
        { key: 'A', content: '明胶、水、表面活性剂（润湿剂）、树脂（防静电剂）' },
        { key: 'B', content: '卤化银、明胶' },
        { key: 'C', content: '醋酸纤维、聚酯' },
        { key: 'D', content: '防腐剂、防静电剂' }
      ],
      answer: 'A',
      analysis: '结合层（又称薪合层或底膜）的作用是使感光乳剂层和片基牢固地黏结在一起，防止感光乳剂层在冲洗时从片基上脱下来，结合层由明胶、水、表面活性剂（润湿剂）、树脂（防静电剂）组成。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '射线检验', '结合层'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_125',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '感光乳剂层每层厚度（）μm，通常由溴化银微粒在明胶中的混合体构成。',
      options: [
        { key: 'A', content: '10~20' },
        { key: 'B', content: '1~5' },
        { key: 'C', content: '20~30' },
        { key: 'D', content: '5~10' }
      ],
      answer: 'A',
      analysis: '感光乳剂层（又称感光药膜）每层厚度10~20μm，通常由溴化银微粒在明胶中的混合体构成。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '感光乳剂层'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_126',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '乳剂中加入少量碘化银，可改善感光性能，碘化银含量按物质的量计，一般不大于（）。',
      options: [
        { key: 'A', content: '5%' },
        { key: 'B', content: '10%' },
        { key: 'C', content: '3%' },
        { key: 'D', content: '8%' }
      ],
      answer: 'A',
      analysis: '乳剂中加入少量碘化银，可改善感光性能，碘化银含量按物质的量计，一般不大于5%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '感光乳剂'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_127',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '工业射线胶片的卤化银颗粒尺寸在（）μm，可根据使用性能的要求，通过生产工艺条件控制不同类别胶片的粒度。',
      options: [
        { key: 'A', content: '0.5~10' },
        { key: 'B', content: '1~5' },
        { key: 'C', content: '10~20' },
        { key: 'D', content: '0.1~0.5' }
      ],
      answer: 'A',
      analysis: '工业射线胶片的卤化银颗粒尺寸在0.5~10μm，可根据使用性能的要求，通过生产工艺条件控制不同类别胶片的粒度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '卤化银粒度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_128',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线胶片中的银含量大致为（）g/m²。',
      options: [
        { key: 'A', content: '10~20' },
        { key: 'B', content: '5~10' },
        { key: 'C', content: '20~30' },
        { key: 'D', content: '1~5' }
      ],
      answer: 'A',
      analysis: '感光乳剂中卤化银的含量及卤化银颗粒团的大小、形状，决定了胶片的感光速度。射线胶片中的银含量大致为10~20g/m²。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '银含量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_129',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '保护层是一层厚度为（）μm，涂在感光乳剂层上的透明胶质，用来防止感光乳剂层受到污损和摩擦。',
      options: [
        { key: 'A', content: '1~2' },
        { key: 'B', content: '5~10' },
        { key: 'C', content: '10~20' },
        { key: 'D', content: '0.5~1' }
      ],
      answer: 'A',
      analysis: '保护层（又称保护膜）是一层厚度为1~2μm，涂在感光乳剂层上的透明胶质，用来防止感光乳剂层受到污损和摩擦。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '保护层'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_130',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '潜影的形成有四个阶段，第一阶段是光子(hv)将Br⁻离子中的电子逐出，该电子在AgBr晶体上移动，陷入（）。',
      options: [
        { key: 'A', content: '捕集中心（俘获）' },
        { key: 'B', content: '感光中心' },
        { key: 'C', content: '潜影中心' },
        { key: 'D', content: '显影中心' }
      ],
      answer: 'A',
      analysis: '潜影的形成有四个阶段：(1)光子(hv)将Br⁻离子中的电子逐出，该电子在AgBr晶体上移动，陷入捕集中心（俘获）。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '射线检验', '潜影形成'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_131',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '潜影形成后，如相隔很长时间才显影，得到的影像比及时冲洗得到的影像淡，此现象称为（）。',
      options: [
        { key: 'A', content: '潜影衰退' },
        { key: 'B', content: '影像褪色' },
        { key: 'C', content: '感光衰减' },
        { key: 'D', content: '显影不足' }
      ],
      answer: 'A',
      analysis: '潜影形成后，如相隔很长时间才显影，得到的影像比及时冲洗得到的影像淡，此现象称为潜影衰退。潜影衰退实际上是构成潜影中心的银又被空气氧化而变成Ag⁺离子的逆变过程。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '潜影衰退'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_132',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '胶片所处的环境温度越高，湿度越大，则氧化作用越加剧，潜影的衰退越（）。',
      options: [
        { key: 'A', content: '厉害' },
        { key: 'B', content: '缓慢' },
        { key: 'C', content: '不变' },
        { key: 'D', content: '停止' }
      ],
      answer: 'A',
      analysis: '胶片所处的环境温度越高，湿度越大，则氧化作用越加剧，潜影的衰退越厉害。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '潜影衰退'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_133',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '黑度D定义为照射光强与穿过底片的透射光强之比的常用对数值，即D=lg(L₀/L)，式中L₀/L称为（）。',
      options: [
        { key: 'A', content: '阻光率' },
        { key: 'B', content: '透光率' },
        { key: 'C', content: '感光度' },
        { key: 'D', content: '灰雾度' }
      ],
      answer: 'A',
      analysis: '黑度D定义为照射光强与穿过底片的透射光强之比的常用对数值，即D=lg(L₀/L)，式中L₀为照射光强，L为透射光强，L₀/L为阻光率。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '黑度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_134',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线胶片的感光特性主要有感光度(S)、灰雾度(D₀)、梯度(G)、宽容度(L)、最大密度(Dmax)，这些特性可在（）上定量表示。',
      options: [
        { key: 'A', content: '胶片特性曲线' },
        { key: 'B', content: '黑度曲线' },
        { key: 'C', content: '感光曲线' },
        { key: 'D', content: '密度曲线' }
      ],
      answer: 'A',
      analysis: '射线胶片的感光特性主要有感光度(S)、灰雾度(D₀)、梯度(G)、宽容度(L)、最大密度(Dmax)，这些特性可在胶片特性曲线上定量表示。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '胶片特性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_135',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '目前数字显示黑度计产品的测量精度可达到在全量程范围内的误差均小于（）。',
      options: [
        { key: 'A', content: '0.02' },
        { key: 'B', content: '0.05' },
        { key: 'C', content: '0.1' },
        { key: 'D', content: '0.01' }
      ],
      answer: 'A',
      analysis: '目前数字显示黑度计产品的测量精度可达到在全量程范围内的误差均小于0.02。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '黑度计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_136',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '目前常用的增感屏有金属增感屏、荧光增感屏和金属荧光增感屏三种，其中以使用（）所得底片像质最佳。',
      options: [
        { key: 'A', content: '金属增感屏' },
        { key: 'B', content: '荧光增感屏' },
        { key: 'C', content: '金属荧光增感屏' },
        { key: 'D', content: '铅箔增感屏' }
      ],
      answer: 'A',
      analysis: '目前常用的增感屏有金属增感屏、荧光增感屏和金属荧光增感屏三种。其中以使用金属增感屏所得底片像质最佳，金属荧光增感屏次之，荧光增感屏最差，但增感系数以荧光增感屏最高，金属增感屏最低。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '增感屏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_137',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '增感系数最高的增感屏是（）。',
      options: [
        { key: 'A', content: '荧光增感屏' },
        { key: 'B', content: '金属增感屏' },
        { key: 'C', content: '金属荧光增感屏' },
        { key: 'D', content: '铅箔增感屏' }
      ],
      answer: 'A',
      analysis: '增感系数以荧光增感屏最高，金属增感屏最低。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '增感屏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_138',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '胶片宜保存在低温低湿环境中，温度通常以（）℃为最好。',
      options: [
        { key: 'A', content: '10~15' },
        { key: 'B', content: '15~20' },
        { key: 'C', content: '5~10' },
        { key: 'D', content: '20~25' }
      ],
      answer: 'A',
      analysis: '胶片宜保存在低温低湿环境中，温度通常以10~15℃为最好；湿度应保持在55%~65%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '胶片保存'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_139',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '胶片保存时湿度应保持在（）。',
      options: [
        { key: 'A', content: '55%~65%' },
        { key: 'B', content: '45%~55%' },
        { key: 'C', content: '65%~75%' },
        { key: 'D', content: '35%~45%' }
      ],
      answer: 'A',
      analysis: '胶片宜保存在低温低湿环境中，温度通常以10~15℃为最好；湿度应保持在55%~65%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '胶片保存'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_140',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线胶片使用和保存注意事项中，胶片不可接近氨、硫化氢、煤气、乙炔和酸等有害气体，否则会产生（）。',
      options: [
        { key: 'A', content: '灰雾' },
        { key: 'B', content: '裂纹' },
        { key: 'C', content: '变色' },
        { key: 'D', content: '脱层' }
      ],
      answer: 'A',
      analysis: '胶片不可接近氨、硫化氢、煤气、乙炔和酸等有害气体，否则会产生灰雾。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '胶片保存'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'metal_141',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线胶片的结构包括（）。',
      options: [
        { key: 'A', content: '片基' },
        { key: 'B', content: '结合层（薪合层或底膜）' },
        { key: 'C', content: '感光乳剂层' },
        { key: 'D', content: '保护层' }
      ],
      answer: 'A,B,C,D',
      analysis: '射线胶片的结构在0.25~0.3mm的厚度中含有七层材料，包括片基、结合层（薪合层或底膜）、感光乳剂层和保护层。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '胶片结构'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_142',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '保护层的主要成分是（）。',
      options: [
        { key: 'A', content: '明胶' },
        { key: 'B', content: '坚膜剂（甲醛及盐酸羟的衍生物）' },
        { key: 'C', content: '防腐剂（苯酚）' },
        { key: 'D', content: '防静电剂' }
      ],
      answer: 'A,B,C,D',
      analysis: '保护层的主要成分是明胶、坚膜剂（甲醛及盐酸羟的衍生物）、防腐剂（苯酚）和防静电剂。为防止胶片粘连，有时在感光乳剂层上还涂布毛面剂。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '射线检验', '保护层'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_143',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '潜影的形成有四个阶段，包括（）。',
      options: [
        { key: 'A', content: '光子将Br⁻离子中的电子逐出，陷入捕集中心（俘获）' },
        { key: 'B', content: '带负电的捕集中心吸引Ag⁺离子，形成不稳定的感光中心（离子移动）' },
        { key: 'C', content: '该感光中心捕捉第二个电子（俘获）' },
        { key: 'D', content: '第二个Ag⁺离子到达，产生稳定的双原子银，形成潜影中心（离子移动）' }
      ],
      answer: 'A,B,C,D',
      analysis: '潜影的形成有四个阶段：(1)光子将Br⁻离子中的电子逐出，陷入捕集中心（俘获）；(2)带负电的捕集中心吸引Ag⁺离子，形成不稳定的感光中心（离子移动）；(3)该感光中心捕捉第二个电子（俘获）；(4)第二个Ag⁺离子到达，产生稳定的双原子银，形成潜影中心（离子移动）。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '射线检验', '潜影形成'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_144',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线胶片的感光特性主要有（）。',
      options: [
        { key: 'A', content: '感光度(S)' },
        { key: 'B', content: '灰雾度(D₀)' },
        { key: 'C', content: '梯度(G)、宽容度(L)' },
        { key: 'D', content: '最大密度(Dmax)' }
      ],
      answer: 'A,B,C,D',
      analysis: '射线胶片的感光特性主要有感光度(S)、灰雾度(D₀)、梯度(G)、宽容度(L)、最大密度(Dmax)，这些特性可在胶片特性曲线上定量表示。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '胶片特性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_145',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '目前常用的增感屏有（）。',
      options: [
        { key: 'A', content: '金属增感屏' },
        { key: 'B', content: '荧光增感屏' },
        { key: 'C', content: '金属荧光增感屏' },
        { key: 'D', content: '塑料增感屏' }
      ],
      answer: 'A,B,C',
      analysis: '目前常用的增感屏有金属增感屏、荧光增感屏和金属荧光增感屏三种。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '增感屏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_146',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线胶片使用和保存注意事项包括（）。',
      options: [
        { key: 'A', content: '胶片不可接近氨、硫化氢、煤气、乙炔和酸等有害气体' },
        { key: 'B', content: '裁片时不可把胶片上的衬纸取掉裁切' },
        { key: 'C', content: '装片和取片时，胶片与增感屏应避免摩擦' },
        { key: 'D', content: '开封后的胶片和装入暗袋的胶片要尽快使用' }
      ],
      answer: 'A,B,C,D',
      analysis: '射线胶片使用和保存注意事项包括：胶片不可接近有害气体；裁片时不可把胶片上的衬纸取掉裁切；装片和取片时，胶片与增感屏应避免摩擦；开封后的胶片要尽快使用等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '胶片保存'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_147',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '数字显示黑度计为保证精度，需要采用（）。',
      options: [
        { key: 'A', content: '线性好的传感器' },
        { key: 'B', content: '偏置电流非常小的高输入阻抗运放及可编程放大器' },
        { key: 'C', content: '高分辨率的A/D转换器' },
        { key: 'D', content: '消除50Hz交流电源干扰的电路设计' }
      ],
      answer: 'A,B,C,D',
      analysis: '由黑度公式可知，底片的黑度测量范围内光通量变化很大。为保证精度，需要采用线性好的传感器，偏置电流非常小的高输入阻抗运放及可编程放大器，以及高分辨率的A/D转换器。此外，在电路设计时还需考虑解决减少背景光影响，消除50Hz交流电源干扰，抑制直流放大器的零点漂移等问题。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '射线检验', '黑度计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_148',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '胶片的选用，应考虑射线照相技术要求及射线的线质、工件厚度、材料种类等条件，一般来说（）。',
      options: [
        { key: 'A', content: '可按像质要求高低选用，如需要较高的射线照相质量，则需使用梯噪比较大的胶片' },
        { key: 'B', content: '在能满足像质要求的前提下，如需缩短曝光时间，可使用梯噪比较小的胶片' },
        { key: 'C', content: '工件厚度较小、工件材料等效系数较低或射源线质较硬时，可选用梯噪比较大的胶片' },
        { key: 'D', content: '在工作环境温度较高时，宜选用抗潮性能较好的胶片' }
      ],
      answer: 'A,B,C,D',
      analysis: '胶片的选用应考虑多种因素：按像质要求高低选用；在满足像质要求前提下缩短曝光时间；根据工件厚度和材料选择；根据工作环境选择抗潮性能好的胶片等。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '射线检验', '胶片选用'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'metal_149',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线胶片的结构在0.25~0.3mm的厚度中含有五层材料。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。射线胶片的结构在0.25~0.3mm的厚度中含有七层材料，不是五层。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '胶片结构'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_150',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '片基是感光乳剂层的支持体，在胶片中起骨架作用，厚度0.175~0.20mm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。片基是感光乳剂层的支持体，在胶片中起骨架作用，厚度0.175~0.20mm，大多采用醋酸纤维或聚酯材料（涤纶）制作。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '片基'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_151',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '为改善照明下的观察效果，通常射线胶片片基采用透明色。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。为改善照明下的观察效果，通常射线胶片片基采用淡蓝色，而不是透明色。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '片基'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_152',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '感光乳剂层每层厚度10~20μm，通常由溴化银微粒在明胶中的混合体构成。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。感光乳剂层（又称感光药膜）每层厚度10~20μm，通常由溴化银微粒在明胶中的混合体构成。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '感光乳剂层'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_153',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '随着卤化银粒度的增大，胶片的感光度也将提高。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。如果其他条件不变，单纯考虑粒度变化的影响，则感光特性有以下变化：随着粒度的增大，胶片的感光度也将提高。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '卤化银粒度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_154',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '潜影的产生是银离子接受电子还原为银的过程。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。由此可见，潜影的产生是银离子接受电子还原为银的过程。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '潜影形成'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_155',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '潜影衰退实际上是构成潜影中心的银又被空气氧化而变成Ag⁺离子的逆变过程。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。潜影衰退实际上是构成潜影中心的银又被空气氧化而变成Ag⁺离子的逆变过程。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '潜影衰退'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_156',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线照相底片的黑度均用透射式黑度计测量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。射线照相底片的黑度均用透射式黑度计测量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '黑度计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_157',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '数字显示黑度计有便携式和台式两种，前者比后者体积更小、质量更轻。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。数字显示黑度计有便携式和台式两种，前者比后者体积更小、质量更轻。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '黑度计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_158',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '使用金属增感屏所得底片像质最佳，增感系数也最高。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。使用金属增感屏所得底片像质最佳，但增感系数以荧光增感屏最高，金属增感屏最低。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '增感屏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_159',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '胶片宜保存在低温低湿环境中，温度通常以10~15℃为最好，湿度应保持在55%~65%。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。胶片宜保存在低温低湿环境中，温度通常以10~15℃为最好；湿度应保持在55%~65%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '胶片保存'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_160',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '胶片应竖放，避免受压。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。胶片应竖放，避免受压。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '胶片保存'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
