/**
 * 金属结构题目数据 - 第三部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：金属结构（第3版）第二章 焊接质量检验 - 无损检测方法、外观质量要求
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取金属结构题目（第三部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getMetalStructureQuestions3(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'metal_081',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线检验是利用射线可穿透物质和在物质中具有衰减的特性来发现缺陷的检验方法。根据所用射线种类，可分为X射线、γ射线和（）射线检验。',
      options: [
        { key: 'A', content: '高能' },
        { key: 'B', content: '红外' },
        { key: 'C', content: '紫外' },
        { key: 'D', content: '激光' }
      ],
      answer: 'A',
      analysis: '射线检验是利用射线可穿透物质和在物质中具有衰减的特性来发现缺陷的检验方法。根据所用射线种类，可分为X射线、γ射线和高能射线检验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '射线检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_082',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '根据显示缺陷的方法，射线检验又可分为电离法、荧光屏观察法、照相法和（）。',
      options: [
        { key: 'A', content: '工业电视法' },
        { key: 'B', content: '磁粉法' },
        { key: 'C', content: '渗透法' },
        { key: 'D', content: '超声波法' }
      ],
      answer: 'A',
      analysis: '根据显示缺陷的方法，射线检验又可分为电离法、荧光屏观察法、照相法和工业电视法。但目前应用较多、灵敏度高、能识别小缺陷的理想方法是照相法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '射线检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_083',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '目前射线检验应用较多、灵敏度高、能识别小缺陷的理想方法是（）。',
      options: [
        { key: 'A', content: '照相法' },
        { key: 'B', content: '电离法' },
        { key: 'C', content: '荧光屏观察法' },
        { key: 'D', content: '工业电视法' }
      ],
      answer: 'A',
      analysis: '目前射线检验应用较多、灵敏度高、能识别小缺陷的理想方法是照相法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '无损检测', '射线检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_084',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: 'X射线检验可检验焊件厚度为（）mm。',
      options: [
        { key: 'A', content: '0.1~60' },
        { key: 'B', content: '1.0~150' },
        { key: 'C', content: '25~600' },
        { key: 'D', content: '8~10' }
      ],
      answer: 'A',
      analysis: '根据各种无损检验方法的特点及其适用范围表，X射线检验可检验焊件厚度为0.1~60mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', 'X射线'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_085',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: 'γ射线检验可检验焊件厚度为（）mm。',
      options: [
        { key: 'A', content: '1.0~150' },
        { key: 'B', content: '0.1~60' },
        { key: 'C', content: '25~600' },
        { key: 'D', content: '8~10' }
      ],
      answer: 'A',
      analysis: '根据各种无损检验方法的特点及其适用范围表，γ射线检验可检验焊件厚度为1.0~150mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', 'γ射线'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_086',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '高能射线检验可检验焊件厚度为（）mm。',
      options: [
        { key: 'A', content: '25~600' },
        { key: 'B', content: '0.1~60' },
        { key: 'C', content: '1.0~150' },
        { key: 'D', content: '8~10' }
      ],
      answer: 'A',
      analysis: '根据各种无损检验方法的特点及其适用范围表，高能射线检验可检验焊件厚度为25~600mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '高能射线'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_087',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: 'X射线检验能检验尺寸大于焊缝厚度（）的缺陷。',
      options: [
        { key: 'A', content: '1%~2%' },
        { key: 'B', content: '3%' },
        { key: 'C', content: '1%' },
        { key: 'D', content: '5%' }
      ],
      answer: 'A',
      analysis: 'X射线检验能检验尺寸大于焊缝厚度1%~2%的缺陷。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', 'X射线'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_088',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '超声波探伤可检验焊件厚度上几乎不受限制，下限一般为（）mm，最小可达2mm。',
      options: [
        { key: 'A', content: '8~10' },
        { key: 'B', content: '0.1~60' },
        { key: 'C', content: '1.0~150' },
        { key: 'D', content: '25~600' }
      ],
      answer: 'A',
      analysis: '超声波探伤可检验焊件厚度上几乎不受限制，下限一般为8~10mm，最小可达2mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '超声波探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_089',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '超声波探伤能检验出直径大于（）mm以上的气孔、夹渣。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '0.5' },
        { key: 'C', content: '2' },
        { key: 'D', content: '3' }
      ],
      answer: 'A',
      analysis: '超声波探伤能检验出直径大于1mm以上的气孔、夹渣。检验裂纹时灵敏度较高，检验表面及近表面缺陷时灵敏度较低。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '超声波探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_090',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '超声波探伤检验条件要求表面一般需加工至表面粗糙度Ra值为（）mm，以保证同探头有良好的声耦合。',
      options: [
        { key: 'A', content: '6.3~1.6' },
        { key: 'B', content: '1.0~0.5' },
        { key: 'C', content: '10~5' },
        { key: 'D', content: '0.1~0.05' }
      ],
      answer: 'A',
      analysis: '超声波探伤检验条件要求表面一般需加工至表面粗糙度Ra值为6.3~1.6mm，以保证同探头有良好的声耦合。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '无损检测', '超声波探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_091',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '磁粉探伤的灵敏度与（）有关。',
      options: [
        { key: 'A', content: '磁场强度大小和磁粉质量' },
        { key: 'B', content: '射线强度' },
        { key: 'C', content: '超声波频率' },
        { key: 'D', content: '渗透剂浓度' }
      ],
      answer: 'A',
      analysis: '磁粉探伤的灵敏度与磁场强度大小和磁粉质量有关。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '磁粉探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_092',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '磁粉探伤适用于（）材料。',
      options: [
        { key: 'A', content: '铁磁性' },
        { key: 'B', content: '非金属' },
        { key: 'C', content: '有色金属' },
        { key: 'D', content: '塑料' }
      ],
      answer: 'A',
      analysis: '磁粉探伤限于铁磁性材料。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '无损检测', '磁粉探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_093',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '渗透探伤检验缺陷宽度小于（）mm、深度小于0.03mm者检验不出。',
      options: [
        { key: 'A', content: '0.01' },
        { key: 'B', content: '0.1' },
        { key: 'C', content: '1' },
        { key: 'D', content: '0.001' }
      ],
      answer: 'A',
      analysis: '渗透探伤检验缺陷宽度小于0.01mm、深度小于0.03mm者检验不出。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '无损检测', '渗透探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_094',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '渗透探伤适用于（）焊件。',
      options: [
        { key: 'A', content: '各种金属和非金属' },
        { key: 'B', content: '仅金属' },
        { key: 'C', content: '仅铁磁性材料' },
        { key: 'D', content: '仅非金属' }
      ],
      answer: 'A',
      analysis: '渗透探伤适用于各种金属和非金属焊件。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '无损检测', '渗透探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_095',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '衍射时差法超声检测（TOFD）可检验焊件厚度为（）mm。',
      options: [
        { key: 'A', content: '12~400' },
        { key: 'B', content: '0.1~60' },
        { key: 'C', content: '1.0~150' },
        { key: 'D', content: '8~10' }
      ],
      answer: 'A',
      analysis: '衍射时差法超声检测（TOFD）可检验焊件厚度为12~400mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', 'TOFD'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_096',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '闸门及启闭机焊缝外观质量要求中，裂纹的允许缺欠尺寸为（）。',
      options: [
        { key: 'A', content: '不允许' },
        { key: 'B', content: '深度≤0.5' },
        { key: 'C', content: '深度≤1.0' },
        { key: 'D', content: '深度≤0.1δ' }
      ],
      answer: 'A',
      analysis: '根据闸门及启闭机焊缝外观质量要求表，裂纹对于一类、二类、三类焊缝均不允许。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝质量', '外观要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_097',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '闸门及启闭机焊缝外观质量要求中，一类焊缝的咬边深度应不大于（）。',
      options: [
        { key: 'A', content: '0.1δ，且不大于2' },
        { key: 'B', content: '0.15δ，且不大于3.0' },
        { key: 'C', content: '0.2δ，且不大于4.0' },
        { key: 'D', content: '1.0' }
      ],
      answer: 'A',
      analysis: '根据闸门及启闭机焊缝外观质量要求表，一类焊缝的咬边深度应不大于0.1δ，且不大于2mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝质量', '外观要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_098',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '压力钢管焊缝外观质量要求中，一类和二类焊缝的裂纹允许缺欠尺寸为（）。',
      options: [
        { key: 'A', content: '不允许' },
        { key: 'B', content: '深度≤0.5' },
        { key: 'C', content: '深度≤1.0' },
        { key: 'D', content: '深度≤0.1δ' }
      ],
      answer: 'A',
      analysis: '根据压力钢管焊缝外观质量要求表，一类和二类焊缝的裂纹不允许。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝质量', '压力钢管'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_099',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '压力钢管焊缝外观质量要求中，一类和二类焊缝的咬边深度应（）。',
      options: [
        { key: 'A', content: '深度≤0.5' },
        { key: 'B', content: '深度≤1' },
        { key: 'C', content: '不允许' },
        { key: 'D', content: '深度≤0.1δ' }
      ],
      answer: 'A',
      analysis: '根据压力钢管焊缝外观质量要求表，一类和二类焊缝的咬边深度≤0.5mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝质量', '压力钢管'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_100',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线检验适用于一般金属和非金属焊件，不适用于（）或拉制的型材。',
      options: [
        { key: 'A', content: '锻件及轧制' },
        { key: 'B', content: '铸件' },
        { key: 'C', content: '焊接件' },
        { key: 'D', content: '机加工件' }
      ],
      answer: 'A',
      analysis: '射线检验适用于一般金属和非金属焊件，不适用于锻件及轧制或拉制的型材。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '射线检验'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'metal_101',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '根据各种无损检验方法的特点及其适用范围，射线检验可分为（）。',
      options: [
        { key: 'A', content: 'X射线检验' },
        { key: 'B', content: 'γ射线检验' },
        { key: 'C', content: '高能射线检验' },
        { key: 'D', content: '红外射线检验' }
      ],
      answer: 'A,B,C',
      analysis: '射线检验是利用射线可穿透物质和在物质中具有衰减的特性来发现缺陷的检验方法。根据所用射线种类，可分为X射线、γ射线和高能射线检验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '射线检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_102',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '根据显示缺陷的方法，射线检验可分为（）。',
      options: [
        { key: 'A', content: '电离法' },
        { key: 'B', content: '荧光屏观察法' },
        { key: 'C', content: '照相法' },
        { key: 'D', content: '工业电视法' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据显示缺陷的方法，射线检验又可分为电离法、荧光屏观察法、照相法和工业电视法。但目前应用较多、灵敏度高、能识别小缺陷的理想方法是照相法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '射线检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_103',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '超声波探伤的特点包括（）。',
      options: [
        { key: 'A', content: '可检验焊件厚度上几乎不受限制' },
        { key: 'B', content: '能检验出直径大于1mm以上的气孔、夹渣' },
        { key: 'C', content: '检验裂纹时灵敏度较高' },
        { key: 'D', content: '检验表面及近表面缺陷时灵敏度较低' }
      ],
      answer: 'A,B,C,D',
      analysis: '超声波探伤可检验焊件厚度上几乎不受限制，下限一般为8~10mm，最小可达2mm。能检验出直径大于1mm以上的气孔、夹渣。检验裂纹时灵敏度较高，检验表面及近表面缺陷时灵敏度较低。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '超声波探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_104',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '磁粉探伤的特点包括（）。',
      options: [
        { key: 'A', content: '灵敏度与磁场强度大小有关' },
        { key: 'B', content: '灵敏度与磁粉质量有关' },
        { key: 'C', content: '限于铁磁性材料' },
        { key: 'D', content: '适用于各种金属和非金属' }
      ],
      answer: 'A,B,C',
      analysis: '磁粉探伤的灵敏度与磁场强度大小和磁粉质量有关。磁粉探伤限于铁磁性材料，不适用于非铁磁性材料。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '磁粉探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_105',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '渗透探伤的特点包括（）。',
      options: [
        { key: 'A', content: '适用于各种金属和非金属焊件' },
        { key: 'B', content: '缺陷宽度小于0.01mm检验不出' },
        { key: 'C', content: '缺陷深度小于0.03mm检验不出' },
        { key: 'D', content: '仅适用于铁磁性材料' }
      ],
      answer: 'A,B,C',
      analysis: '渗透探伤适用于各种金属和非金属焊件。检验缺陷宽度小于0.01mm、深度小于0.03mm者检验不出。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '渗透探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_106',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '闸门及启闭机焊缝外观质量要求中，对于一类、二类、三类焊缝均不允许的缺欠有（）。',
      options: [
        { key: 'A', content: '裂纹' },
        { key: 'B', content: '未熔合' },
        { key: 'C', content: '未焊透' },
        { key: 'D', content: '咬边' }
      ],
      answer: 'A,B,C',
      analysis: '根据闸门及启闭机焊缝外观质量要求表，裂纹、未熔合、未焊透对于一类、二类、三类焊缝均不允许。咬边有一定的允许范围。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝质量', '外观要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_107',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '压力钢管焊缝外观质量要求中，对于一类和二类焊缝均不允许的缺欠有（）。',
      options: [
        { key: 'A', content: '裂纹' },
        { key: 'B', content: '未熔合' },
        { key: 'C', content: '未焊透' },
        { key: 'D', content: '表面气孔' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据压力钢管焊缝外观质量要求表，一类和二类焊缝的裂纹、未熔合、未焊透、表面气孔均不允许。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝质量', '压力钢管'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_108',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '各种无损检验方法中，主要用于检测焊缝内部缺陷的方法有（）。',
      options: [
        { key: 'A', content: '射线检验（RT）' },
        { key: 'B', content: '超声波探伤（UT）' },
        { key: 'C', content: '衍射时差法超声检测（TOFD）' },
        { key: 'D', content: '磁粉探伤（MT）' }
      ],
      answer: 'A,B,C',
      analysis: '射线检验、超声波探伤、衍射时差法超声检测主要用于检测焊缝内部缺陷。磁粉探伤和渗透探伤主要用于检测焊缝表面缺陷。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'metal_109',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线检验是利用射线可穿透物质和在物质中具有衰减的特性来发现缺陷的检验方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。射线检验是利用射线可穿透物质和在物质中具有衰减的特性来发现缺陷的检验方法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '无损检测', '射线检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_110',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '目前射线检验应用较多、灵敏度高、能识别小缺陷的理想方法是照相法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。目前射线检验应用较多、灵敏度高、能识别小缺陷的理想方法是照相法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '无损检测', '射线检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_111',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: 'X射线检验可检验焊件厚度为1.0~150mm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。X射线检验可检验焊件厚度为0.1~60mm。γ射线检验可检验焊件厚度为1.0~150mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', 'X射线'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_112',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '超声波探伤可检验焊件厚度上几乎不受限制，下限一般为8~10mm，最小可达2mm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。超声波探伤可检验焊件厚度上几乎不受限制，下限一般为8~10mm，最小可达2mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '超声波探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_113',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '磁粉探伤适用于各种金属和非金属材料。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。磁粉探伤限于铁磁性材料。渗透探伤适用于各种金属和非金属焊件。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '无损检测', '磁粉探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_114',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '渗透探伤适用于各种金属和非金属焊件。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。渗透探伤适用于各种金属和非金属焊件。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '无损检测', '渗透探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_115',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '衍射时差法超声检测（TOFD）可检验焊件厚度为12~400mm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。衍射时差法超声检测（TOFD）可检验焊件厚度为12~400mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', 'TOFD'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_116',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '闸门及启闭机焊缝外观质量要求中，裂纹对于一类、二类、三类焊缝均不允许。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据闸门及启闭机焊缝外观质量要求表，裂纹对于一类、二类、三类焊缝均不允许。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝质量', '外观要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_117',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '压力钢管焊缝外观质量要求中，一类和二类焊缝的咬边深度≤0.5mm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据压力钢管焊缝外观质量要求表，一类和二类焊缝的咬边深度≤0.5mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝质量', '压力钢管'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_118',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线检验适用于一般金属和非金属焊件，也适用于锻件及轧制或拉制的型材。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。射线检验适用于一般金属和非金属焊件，不适用于锻件及轧制或拉制的型材。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '射线检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_119',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '超声波探伤检验条件要求表面一般需加工至表面粗糙度Ra值为6.3~1.6mm，以保证同探头有良好的声耦合。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。超声波探伤检验条件要求表面一般需加工至表面粗糙度Ra值为6.3~1.6mm，以保证同探头有良好的声耦合。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '无损检测', '超声波探伤'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_120',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '高能射线检验可检验焊件厚度为25~600mm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据各种无损检验方法的特点及其适用范围表，高能射线检验可检验焊件厚度为25~600mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '高能射线'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}