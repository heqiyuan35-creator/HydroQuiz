/**
 * 岩土工程题目数据（第九部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（地基与基础）第3版 地基处理方法与基桩检测
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目（第九部分）
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions9(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_321',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '高压喷射注浆法又称旋喷法，根据使用机具设备不同，分为单管法、二重管法和三重管法。单管法成桩直径一般为（）m。',
      options: [
        { key: 'A', content: '0.1~0.3' },
        { key: 'B', content: '0.3~0.8' },
        { key: 'C', content: '0.8~1.2' },
        { key: 'D', content: '1.0~1.5' }
      ],
      answer: 'B',
      analysis: '单管法是用一根单管喷射高压水泥浆液作为喷射流，由于高压浆液射流在土中衰减快，破碎土的有效射程短，成桩直径一般为0.3~0.8m。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '高压喷射注浆法', '成桩直径'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_322',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '高压喷射注浆法中，二重管法成桩直径在（）m左右。',
      options: [
        { key: 'A', content: '0.5' },
        { key: 'B', content: '1' },
        { key: 'C', content: '1.5' },
        { key: 'D', content: '2' }
      ],
      answer: 'B',
      analysis: '二重管法是用同轴双通道二重注浆管同时喷射高压浆液和压缩空气，形成复合喷射流，成桩直径在1m左右。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '高压喷射注浆法', '成桩直径'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_323',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '高压喷射注浆法利用小直径钻孔旋喷成比孔径大（）倍的大直径固结体。',
      options: [
        { key: 'A', content: '3~5' },
        { key: 'B', content: '5~8' },
        { key: 'C', content: '8~10' },
        { key: 'D', content: '10~15' }
      ],
      answer: 'C',
      analysis: '高压喷射注浆法利用小直径钻孔旋喷成比孔径大8~10倍的大直径固结体；可通过调节喷嘴的旋喷速度、提升速度、喷射压力及旋转角度形成各种形状桩体。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '高压喷射注浆法', '固结体'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_324',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '水泥土搅拌法的加固机理中，水泥加固土由于水泥用量少（8%~18%），水泥水化反应完全是在（）产生的。',
      options: [
        { key: 'A', content: '土颗粒表面' },
        { key: 'B', content: '土粒周围' },
        { key: 'C', content: '土体内部' },
        { key: 'D', content: '土体表面' }
      ],
      answer: 'B',
      analysis: '水泥加固土由于水泥用量少（8%~18%），水泥水化反应完全是在土粒周围产生的，水泥与软黏土拌和后，水泥中的矿物和土中水发生强烈的水解和水化反应，生成水化物。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '水泥土搅拌法', '加固机理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_325',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '水泥土搅拌法适用范围中，当地基土的天然含水率小于30%（黄土含水率小于25%），大于70%或地下水的pH值小于（）时不宜采用此法。',
      options: [
        { key: 'A', content: '3' },
        { key: 'B', content: '4' },
        { key: 'C', content: '5' },
        { key: 'D', content: '6' }
      ],
      answer: 'B',
      analysis: '水泥土搅拌法适用于处理正常固结的淤泥与淤泥质土、粉土、饱和黄土、素填土、黏性土以及无流动地下水的松散砂土等地基。当地基土的天然含水率小于30%（黄土含水率小于25%），大于70%或地下水的pH值小于4时不宜采用此法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '水泥土搅拌法', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_326',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '复合地基承载力公式中，单桩承载力发挥系数λ可取（）。',
      options: [
        { key: 'A', content: '0.5' },
        { key: 'B', content: '0.8' },
        { key: 'C', content: '1.0' },
        { key: 'D', content: '1.2' }
      ],
      answer: 'C',
      analysis: '根据复合地基承载力特征值公式fspk=λm(Ra/Ap)+β(1-m)fsk，其中λ为单桩承载力发挥系数，可取1.0。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '复合地基', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_327',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '复合地基承载力公式中，桩间土承载力发挥系数β，对淤泥、淤泥质土和流塑状软土等处理土层，可取（）。',
      options: [
        { key: 'A', content: '0.1~0.4' },
        { key: 'B', content: '0.4~0.8' },
        { key: 'C', content: '0.8~1.0' },
        { key: 'D', content: '1.0~1.2' }
      ],
      answer: 'A',
      analysis: '桩间土承载力发挥系数β，对淤泥、淤泥质土和流塑状软土等处理土层，可取0.1~0.4，对其他土层可取0.4~0.8。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '复合地基', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_328',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '振冲法适用于处理砂土、粉土、粉质黏土、素填土和杂填土等地基。对于处理不排水抗剪强度不小于（）kPa的饱和黏性土和饱和黄土地基，应在施工前通过现场试验确定其适用性。',
      options: [
        { key: 'A', content: '10' },
        { key: 'B', content: '15' },
        { key: 'C', content: '20' },
        { key: 'D', content: '25' }
      ],
      answer: 'C',
      analysis: '振冲法适用于处理砂土、粉土、粉质黏土、素填土和杂填土等地基。对于处理不排水抗剪强度不小于20kPa的饱和黏性土和饱和黄土地基，应在施工前通过现场试验确定其适用性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '振冲法', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_329',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '振冲法加固地基后，地基承载力可提高（）倍。',
      options: [
        { key: 'A', content: '0.5~1.0' },
        { key: 'B', content: '1.0~1.2' },
        { key: 'C', content: '1.3~1.5' },
        { key: 'D', content: '1.5~2.0' }
      ],
      answer: 'C',
      analysis: '振冲法加固速度快，节约投资，碎石桩具有良好的透水性，加速地基固结，地基承载力可提高1.3~1.35倍。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '振冲法', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_330',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '不加填料振冲加密适用于处理黏粒含量不大于（）的中砂、粗砂地基。',
      options: [
        { key: 'A', content: '5%' },
        { key: 'B', content: '10%' },
        { key: 'C', content: '15%' },
        { key: 'D', content: '20%' }
      ],
      answer: 'B',
      analysis: '不加填料振冲加密适用于处理黏粒含量不大于10%的中砂、粗砂地基。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '振冲法', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_331',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '土和灰土挤密桩适于加固地下水位以上的粉土、黏性土、湿陷性黄土、素填土、杂填土等地基，可处理地基的厚度为（）m。',
      options: [
        { key: 'A', content: '1~5' },
        { key: 'B', content: '3~15' },
        { key: 'C', content: '10~20' },
        { key: 'D', content: '15~25' }
      ],
      answer: 'B',
      analysis: '土和灰土（或二灰土）挤密桩适于加固地下水位以上的粉土、黏性土、湿陷性黄土、素填土、杂填土等地基，可处理地基的厚度为3~15m。当地基土的含水率大于24%、饱和度大于65%时，应通过试验确定其适用性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '挤密桩', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_332',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '土和灰土挤密桩的桩孔直径根据工程量、挤密效果、施工设备、成孔方法等情况而定，一般选用（）cm。',
      options: [
        { key: 'A', content: '20~40' },
        { key: 'B', content: '30~60' },
        { key: 'C', content: '50~80' },
        { key: 'D', content: '60~100' }
      ],
      answer: 'B',
      analysis: '桩孔直径：根据工程量、挤密效果、施工设备、成孔方法等情况而定，一般选用30~60cm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '挤密桩', '桩孔直径'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_333',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '桩长根据土质情况、桩处理地基深度、工程要求和成孔设备等因素确定，一般为（）m。',
      options: [
        { key: 'A', content: '3~10' },
        { key: 'B', content: '5~15' },
        { key: 'C', content: '10~20' },
        { key: 'D', content: '15~25' }
      ],
      answer: 'B',
      analysis: '桩长：根据土质情况、桩处理地基深度、工程要求和成孔设备等因素确定，一般为5~15m。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '挤密桩', '桩长'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_334',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '与换土垫层相比，土和灰土挤密桩不需大量开挖回填土方工程量；处理深度较大，可达（）m。',
      options: [
        { key: 'A', content: '5~10' },
        { key: 'B', content: '8~12' },
        { key: 'C', content: '12~15' },
        { key: 'D', content: '15~20' }
      ],
      answer: 'C',
      analysis: '与换土垫层相比，不需大量开挖回填土方工程量；处理深度较大，可达12~15m；成桩材料可就地取材，降低工程造价，二灰桩可利用工业废料粉煤灰，变废为宝。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '挤密桩', '处理深度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_335',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '水泥粉煤灰碎石桩简称CFG桩，通过高速水泥掺量及配比，可使桩体强度等级在（）变化。',
      options: [
        { key: 'A', content: 'C3~C10' },
        { key: 'B', content: 'C5~C20' },
        { key: 'C', content: 'C10~C30' },
        { key: 'D', content: 'C15~C40' }
      ],
      answer: 'B',
      analysis: '水泥粉煤灰碎石桩简称CFG桩，是在碎石桩基础上加进一些石屑、粉煤�ite和少量水泥，加水拌和制成的一种具有一定黏结强度的桩。通过高速水泥掺量及配比，可使桩体强度等级在C5~C20变化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', 'CFG桩', '强度等级'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_336',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '加筋土挡墙的混凝土土体积相当于重力式挡墙的（），且墙越高经济效益越佳。',
      options: [
        { key: 'A', content: '10%~30%' },
        { key: 'B', content: '20%~60%' },
        { key: 'C', content: '50%~80%' },
        { key: 'D', content: '70%~90%' }
      ],
      answer: 'B',
      analysis: '工程造价较低。加筋土挡墙面板薄，基础尺寸小。当挡墙的高度超过5m时，与重力式墙相比可降低造价20%~60%，且墙越高经济效益越佳。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '加筋土', '经济效益'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_337',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '复合地基载荷试验中，加载等级可分为（）级。',
      options: [
        { key: 'A', content: '5~8' },
        { key: 'B', content: '8~12' },
        { key: 'C', content: '10~15' },
        { key: 'D', content: '12~16' }
      ],
      answer: 'B',
      analysis: '加载等级可分为8~12级。最大加载压力不应小于设计要求压力值的2倍。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '复合地基载荷试验', '加载等级'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_338',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '复合地基载荷试验中，试验点的数量不应少于（）点，当满足其极差不超过平均值的30%时，可取其平均值为复合地基承载力特征值。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '3' },
        { key: 'C', content: '4' },
        { key: 'D', content: '5' }
      ],
      answer: 'B',
      analysis: '试验点的数量不应少于3点，当满足其极差不超过平均值的30%时，可取其平均值为复合地基承载力特征值。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '复合地基载荷试验', '试验点数量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_339',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '承受竖向荷载的桩是通过桩侧摩阻力和桩端阻力将上部荷载传递到深部土（岩）层的，因而桩的竖向承载力和桩所穿过的整个土层的状况，与桩底持力层的性质、桩的外形和尺寸密切相关。在实际工作中，以承受竖向荷载为主的桩基础居多。影响桩基承载力的因素很多，主要有以下（）方面。',
      options: [
        { key: 'A', content: '3' },
        { key: 'B', content: '4' },
        { key: 'C', content: '5' },
        { key: 'D', content: '6' }
      ],
      answer: 'C',
      analysis: '影响桩基承载力的因素很多，主要有以下几方面：(1)桩身所穿越土层的强度、变形性质和应力历史；(2)桩端持力土层的强度和变形性质；(3)桩身与桩底的几何特征；(4)桩体材料强度；(5)群桩的几何参数。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '基桩检测', '承载力因素'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_340',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '桩端持力土层对竖向承载力的影响程度，随桩的长径比（L/D）的增大而减小，随桩与土的模量比（Ep/Es）的增大而提高，随持力土层与桩侧土层的模量比（Esb/Es）的增大而增大。',
      options: [
        { key: 'A', content: '增大、减小、增大' },
        { key: 'B', content: '减小、增大、增大' },
        { key: 'C', content: '减小、减小、增大' },
        { key: 'D', content: '增大、增大、减小' }
      ],
      answer: 'B',
      analysis: '桩端持力土层对竖向承载力的影响程度，随桩的长径比（L/D）的增大而减小，随桩与土的模量比（Ep/Es）的增大而提高，随持力土层与桩侧土层的模量比（Esb/Es）的增大而增大。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '基桩检测', '承载力影响'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_341',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '高压喷射注浆法具有以下特点（）。',
      options: [
        { key: 'A', content: '提高地基土的抗剪强度，改善土的变形性质' },
        { key: 'B', content: '利用小直径钻孔旋喷成比孔径大8~10倍的大直径固结体' },
        { key: 'C', content: '可用于已有建筑物地基加固而不扰动附近土体，施工噪音低，振动小' },
        { key: 'D', content: '设备轻便，机械化程度高，能在狭窄场地施工' }
      ],
      answer: 'A,B,C,D',
      analysis: '高压喷射注浆具有以下特点：(1)提高地基土的抗剪强度，改善土的变形性质；(2)利用小直径钻孔旋喷成比孔径大8~10倍的大直径固结体；(3)可用于已有建筑物地基加固而不扰动附近土体，施工噪音低，振动小；(4)用于各种软弱土层，可控制加固范围；(5)设备轻便，机械化程度高，能在狭窄场地施工；(6)施工简便，操作容易，速度快，效率高，用途广，成本低。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '高压喷射注浆法', '特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_342',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '根据注浆形式分为（）。',
      options: [
        { key: 'A', content: '旋转喷射注浆（旋喷法）' },
        { key: 'B', content: '定向喷射注浆（定喷法）' },
        { key: 'C', content: '在某一角度范围内摆动喷射注浆（摆喷法）' },
        { key: 'D', content: '连续喷射注浆（连喷法）' }
      ],
      answer: 'A,B,C',
      analysis: '根据注浆形式分为：①旋转喷射注浆（旋喷法）；②定向喷射注浆（定喷法）；③在某一角度范围内摆动喷射注浆（摆喷法）。根据加固体形状可分为立柱、壁状和块状等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '高压喷射注浆法', '注浆形式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_343',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '水泥土搅拌法的特点是（）。',
      options: [
        { key: 'A', content: '在地基加固过程中无振动、无噪声、无污染' },
        { key: 'B', content: '对被加固土体无侧向挤压，对邻近建筑物影响很小' },
        { key: 'C', content: '有效提高地基强度' },
        { key: 'D', content: '施工工期短，造价低廉' }
      ],
      answer: 'A,B,C,D',
      analysis: '水泥土搅拌法的特点是：①在地基加固过程中无振动、无噪声、无污染；②对被加固土体无侧向挤压，对邻近建筑物影响很小；③有效提高地基强度；④施工工期短，造价低廉。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '水泥土搅拌法', '特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_344',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '振冲法加固地基的特点包括（）。',
      options: [
        { key: 'A', content: '技术可靠，机具设备简单，操作技术易于掌握，施工简便' },
        { key: 'B', content: '可节省二材，因地制宜，就地取材，可采用碎石、卵石、砂、矿渣等作填料' },
        { key: 'C', content: '加固速度快，节约投资，碎石桩具有良好的透水性，加速地基固结' },
        { key: 'D', content: '振冲过程中的预振效应，可增加砂土地基抗液化能力' }
      ],
      answer: 'A,B,C,D',
      analysis: '振冲法加固地基的特点：(1)技术可靠，机具设备简单，操作技术易于掌握，施工简便；(2)可节省二材，因地制宜，就地取材，可采用碎石、卵石、砂、矿渣等作填料；(3)加固速度快，节约投资，碎石桩具有良好的透水性，加速地基固结，地基承载力可提高1.3~1.35倍；(4)振冲过程中的预振效应，可增加砂土地基抗液化能力。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '振冲法', '特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_345',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '土和灰土挤密桩的主要特点包括（）。',
      options: [
        { key: 'A', content: '土和灰土挤密桩成桩时为横向挤密，同样达到所要求的干密度指标，消除地基土的湿陷性，提高承载力，降低压缩性' },
        { key: 'B', content: '与换土垫层相比，不需大量开挖回填土方工程量；处理深度较大，可达12~15m' },
        { key: 'C', content: '机具简单，施工方便，工效高' },
        { key: 'D', content: '成桩材料可就地取材，降低工程造价，二灰桩可利用工业废料粉煤灰，变废为宝' }
      ],
      answer: 'A,B,C,D',
      analysis: '土和灰土挤密桩的主要特点：(1)土和灰土挤密桩成桩时为横向挤密，同样达到所要求的干密度指标，消除地基土的湿陷性，提高承载力，降低压缩性；(2)与换土垫层相比，不需大量开挖回填土方工程量；处理深度较大，可达12~15m；成桩材料可就地取材，降低工程造价，二灰桩可利用工业废料粉煤灰，变废为宝；(3)机具简单，施工方便，工效高。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '挤密桩', '特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_346',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '加筋土挡墙的特点包括（）。',
      options: [
        { key: 'A', content: '它可做成很高的垂直填土挡墙，大大节省了占地面积，减小了土方量' },
        { key: 'B', content: '由于构件较轻，施工简便，除需配备压实机械外，不需配备其他机械，施工易于掌握' },
        { key: 'C', content: '面板型可根据需要进行选择，拼装完成后造型美观，适合于城市道路的支挡工程' },
        { key: 'D', content: '加筋土挡墙这一复合结构的整体性较好，所以在地震波的作用下，较其他类型的挡土结构稳定性强，具有良好的抗震性能' }
      ],
      answer: 'A,B,C,D',
      analysis: '加筋土挡墙的特点：(1)它可做成很高的垂直填土挡墙，大大节省了占地面积，减小了土方量，由于构件较轻，施工简便，除需配备压实机械外，不需配备其他机械，施工易于掌握，施工迅速，质量易于控制，施工时无噪声；(2)面板型可根据需要进行选择，拼装完成后造型美观，适合于城市道路的支挡工程；(3)工程造价较低；(4)加筋土挡墙这一复合结构的整体性较好，所以在地震波的作用下，较其他类型的挡土结构稳定性强，具有良好的抗震性能。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '加筋土', '特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_347',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '其他地基处理方法中，注浆法适用于处理（）等地基。',
      options: [
        { key: 'A', content: '砂土' },
        { key: 'B', content: '粉土' },
        { key: 'C', content: '黏性土' },
        { key: 'D', content: '人工填土' }
      ],
      answer: 'A,B,C,D',
      analysis: '注浆法适用于处理砂土、粉土、黏性土和人工填土等地基。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '注浆法', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_348',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '影响桩基承载力的因素很多，主要有以下几方面（）。',
      options: [
        { key: 'A', content: '桩身所穿越土层的强度、变形性质和应力历史' },
        { key: 'B', content: '桩端持力土层的强度和变形性质' },
        { key: 'C', content: '桩身与桩底的几何特征' },
        { key: 'D', content: '桩体材料强度和群桩的几何参数' }
      ],
      answer: 'A,B,C,D',
      analysis: '影响桩基承载力的因素很多，主要有以下几方面：(1)桩身所穿越土层的强度、变形性质和应力历史；(2)桩端持力土层的强度和变形性质；(3)桩身与桩底的几何特征；(4)桩体材料强度；(5)群桩的几何参数。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '基桩检测', '承载力因素'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_349',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '高压喷射注浆法可用于既有建筑和新建建筑的地基处理、深基坑侧壁挡土或挡水、基坑底部防止管涌与隆起、坝的防渗加固等。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。高压喷射注浆法可用于既有建筑和新建建筑的地基处理、深基坑侧壁挡土或挡水、基坑底部防止管涌与隆起、坝的防渗加固等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '高压喷射注浆法', '应用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_350',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '高压喷射注浆适用于淤泥、淤泥质土、流塑、软塑或可塑黏性土、粉土、砂土、黄土、素填土和碎石土等地基。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。高压喷射注浆适用于淤泥、淤泥质土、流塑、软塑或可塑黏性土、粉土、砂土、黄土、素填土和碎石土等地基。当土中含有较多的大粒径块石、大量植物根茎或有较高的有机质时，以及地下水流速过大和已涌水的工程，应根据现场试验确定其适用性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '高压喷射注浆法', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_351',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '石灰加固土除利用生石灰的吸水、膨胀和发热性能外，还利用石灰与软黏土发生离子交换和化学反应达到加固地基的目的。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。石灰加固土除利用生石灰的吸水、膨胀和发热性能外，还利用石灰与软黏土发生离子交换和化学反应达到加固地基的目的。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '水泥土搅拌法', '加固机理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_352',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '振冲置换法是在地基中借振冲器成孔，将碎料置换，形成一群以碎石、砂砾等散粒材料组成的桩体，与原地基土一起构成复合地基，使其排水性能得到很大改善，加速土层固结，使承载力提高，沉降显著减少，它又名振冲置换碎石桩法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。振冲置换法是在地基中借振冲器成孔，将碎料置换，形成一群以碎石、砂砾等散粒材料组成的桩体，与原地基土一起构成复合地基，使其排水性能得到很大改善，加速土层固结，使承载力提高，沉降显著减少，它又名振冲置换碎石桩法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '振冲法', '置换法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_353',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '振冲密实法主要是利用振动和高压水流使砂层液化，砂颗粒相互挤密，重新排列，孔隙减少，从而提高砂层本身的承载力和抗液化能力，它又名振冲挤密砂桩法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。振冲密实法主要是利用振动和高压水流使砂层液化，砂颗粒相互挤密，重新排列，孔隙减少，从而提高砂层本身的承载力和抗液化能力，它又名振冲挤密砂桩法。振冲密实砂桩法根据砂土质的不同，又分加填料和不加填料两种。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '振冲法', '密实法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_354',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '由于砂桩在松散砂土中和软弱黏性土中的作用原理不同，因此砂桩间距计算方法也有不同。在砂土地基中，基本假定是挤密后土体中土颗粒增加而体积不变，控制加固后的孔隙比，从而根据设计要求的孔隙比计算桩距s。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。由于砂桩在松散砂土中和软弱黏性土中的作用原理不同，因此砂桩间距计算方法也有不同。在砂土地基中，基本假定是挤密后土体中土颗粒增加而体积不变，控制加固后的孔隙比，从而根据设计要求的孔隙比计算桩距s。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '砂桩', '设计要点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_355',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: 'CFG桩在受力特性方面介于碎石桩和钢筋混凝土桩之间。与碎石桩相比，CFG桩桩身具有一定的刚度，不属于散体材料桩，其桩体承载力取决于桩侧摩阻力与桩端端承载力之和或桩体材料强度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。CFG桩在受力特性方面介于碎石桩和钢筋混凝土桩之间。与碎石桩相比，CFG桩桩身具有一定的刚度，不属于散体材料桩，其桩体承载力取决于桩侧摩阻力与桩端端承载力之和或桩体材料强度。当桩间土不能提供较大侧限力时，CFG桩复合地基承载力高于碎石桩复合地基。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', 'CFG桩', '受力特性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_356',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '与钢筋混凝土相比，桩体强度和刚度比一般混凝土小得多，这样有利于充分发挥桩体材料的潜力，降低地基处理费用。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。与钢筋混凝土相比，桩体强度和刚度比一般混凝土小得多，这样有利于充分发挥桩体材料的潜力，降低地基处理费用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', 'CFG桩', '特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_357',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '加筋土类似于钢筋混凝土中钢筋的作用，在抗拉强度较低的土中，加入抗拉强度较高的土工合成材料以提高土的抗剪强度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。加筋土类似于钢筋混凝土中钢筋的作用，在抗拉强度较低的土中，加入抗拉强度较高的土工合成材料以提高土的抗剪强度。加筋土挡墙的特点如下：(1)充分利用材料性能，以及土与拉筋的共同作用，因而使挡墙结构轻型化，其混凝土体积相当于重力式挡墙的3%~5%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '加筋土', '原理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_358',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '复合地基载荷试验用于测定承压板下应力主要影响范围内复合土层的承载力和变形参数，复合地基载荷试验承压板应具有足够刚度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。复合地基载荷试验用于测定承压板下应力主要影响范围内复合土层的承载力和变形参数，复合地基载荷试验承压板应具有足够刚度。本试验适用于单桩复合地基载荷试验和多桩复合地基载荷试验。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '复合地基载荷试验', '目的'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_359',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第三章 地基处理及质量检验',
      content: '柱锤冲扩桩法适用于处理杂填土、粉土、黏性土、素填土和黄土等地基。对地下水位以下饱和松软土层，应通过现场试验确定其适用性。地基处理深度不宜超过6m，复合地基承载力特征值不宜超过160kPa。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。柱锤冲扩桩法适用于处理杂填土、粉土、黏性土、素填土和黄土等地基。对地下水位以下饱和松软土层，应通过现场试验确定其适用性。地基处理深度不宜超过6m，复合地基承载力特征值不宜超过160kPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '柱锤冲扩桩法', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_360',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '桩基可由单根桩构成，如一柱一桩；多数情况下是由多根桩组成的群桩，荷载通过承台传递给各桩桩顶。当承台与地面接触时，承台、桩、土将相互影响，共同作用，使群桩的承载性状发生较大变化并趋于复杂。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。桩基可由单根桩构成，如一柱一桩；多数情况下是由多根桩组成的群桩，荷载通过承台传递给各桩桩顶。当承台与地面接触时，承台、桩、土将相互影响，共同作用，使群桩的承载性状发生较大变化并趋于复杂。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '基桩检测', '群桩'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
