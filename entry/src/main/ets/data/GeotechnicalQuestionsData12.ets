/**
 * 岩土工程题目数据（第十二部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（地基与基础）第3版 桩身完整性判定与单桩承载力试验
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目（第十二部分）
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions12(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_441',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '根据桩身完整性判定表，Ⅰ类桩的特征是混凝土芯样连续、完整、表面光滑、胶结好、骨料分布均匀、呈长柱状、断口吻合，混凝土芯样侧面仅见（）。',
      options: [
        { key: 'A', content: '蜂窝麻面' },
        { key: 'B', content: '少量气孔' },
        { key: 'C', content: '沟槽' },
        { key: 'D', content: '夹泥' }
      ],
      answer: 'B',
      analysis: '根据表4-11桩身完整性判定，Ⅰ类桩的特征是混凝土芯样连续、完整、表面光滑、胶结好、骨料分布均匀、呈长柱状、断口吻合，混凝土芯样侧面仅见少量气孔。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '桩身完整性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_442',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '根据桩身完整性判定表，Ⅱ类桩的特征是混凝土芯样连续、完整、胶结较好、骨料分布基本均匀、呈柱状、断口基本吻合，混凝土芯样侧面局部见（）。',
      options: [
        { key: 'A', content: '少量气孔' },
        { key: 'B', content: '蜂窝麻面、沟槽' },
        { key: 'C', content: '松散、夹泥' },
        { key: 'D', content: '破碎' }
      ],
      answer: 'B',
      analysis: '根据表4-11桩身完整性判定，Ⅱ类桩的特征是混凝土芯样连续、完整、胶结较好、骨料分布基本均匀、呈柱状、断口基本吻合，混凝土芯样侧面局部见蜂窝麻面、沟槽。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '桩身完整性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_443',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '根据桩身完整性判定表，Ⅲ类桩大部分混凝土芯样胶结较好，无松散、夹泥或分层现象，但有下列情况之一：局部混凝土芯样破碎且破碎长度不大于（）cm。',
      options: [
        { key: 'A', content: '5' },
        { key: 'B', content: '8' },
        { key: 'C', content: '10' },
        { key: 'D', content: '15' }
      ],
      answer: 'C',
      analysis: '根据表4-11桩身完整性判定，Ⅲ类桩大部分混凝土芯样胶结较好，无松散、夹泥或分层现象，但有下列情况之一：局部混凝土芯样破碎且破碎长度不大于10cm；混凝土芯样骨料分布不均匀；混凝土芯样多呈短柱状或块状；混凝土芯样侧面蜂窝麻面、沟槽连续。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '桩身完整性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_444',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '根据桩身完整性判定表，Ⅳ类桩有下列情况之一：桩身混凝土钻进很困难；混凝土芯样任一段松散、夹泥或分层；局部混凝土芯样破碎且破碎长度大于（）cm。',
      options: [
        { key: 'A', content: '5' },
        { key: 'B', content: '8' },
        { key: 'C', content: '10' },
        { key: 'D', content: '15' }
      ],
      answer: 'C',
      analysis: '根据表4-11桩身完整性判定，Ⅳ类桩有下列情况之一：桩身混凝土钻进很困难；混凝土芯样任一段松散、夹泥或分层；局部混凝土芯样破碎且破碎长度大于10cm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '桩身完整性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_445',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '芯样试件在受压前宜在（20±5）℃的清水中浸泡（）h，从水中取出后应立即进行抗压强度试验。',
      options: [
        { key: 'A', content: '20~30' },
        { key: 'B', content: '30~40' },
        { key: 'C', content: '40~48' },
        { key: 'D', content: '48~72' }
      ],
      answer: 'C',
      analysis: '芯样试件在受压前宜在（20±5）℃的清水中浸泡40~48h，从水中取出后应立即进行抗压强度试验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样试验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_446',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '混凝土芯样试件的抗压强度试验应按《普通混凝土力学性能试验方法》（GB 50081）的有关规定执行。混凝土强度等级低于C30时，加荷速度取每秒钟（）MPa。',
      options: [
        { key: 'A', content: '0.1~0.3' },
        { key: 'B', content: '0.3~0.5' },
        { key: 'C', content: '0.5~0.8' },
        { key: 'D', content: '0.8~1.0' }
      ],
      answer: 'B',
      analysis: '混凝土强度等级低于C30时，取每秒钟0.3~0.5MPa；混凝土强度等级高于或等于C30时，取每秒钟0.5~0.8MPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样试验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_447',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '混凝土强度等级高于或等于C30时，加荷速度取每秒钟（）MPa。',
      options: [
        { key: 'A', content: '0.3~0.5' },
        { key: 'B', content: '0.5~0.8' },
        { key: 'C', content: '0.8~1.0' },
        { key: 'D', content: '1.0~1.2' }
      ],
      answer: 'B',
      analysis: '混凝土强度等级高于或等于C30时，取每秒钟0.5~0.8MPa。当试件接近破坏而开始迅速变形时，停止调整试验机油门，直至试件破坏。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样试验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_448',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '芯样试件平均直径小于（）倍试件内混凝土粗骨料最大粒径，且强度值异常时，该试件的强度值无效。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '2' },
        { key: 'C', content: '3' },
        { key: 'D', content: '4' }
      ],
      answer: 'B',
      analysis: '抗压强度试验后，若发现芯样试件平均直径小于2倍试件内混凝土粗骨料最大粒径，且强度值异常时，该试件的强度值无效，不参与统计平均。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样试验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_449',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '据国内一些单位试验，泡水后的芯样强度比干燥状态芯样强度下降（），平均下降14%。',
      options: [
        { key: 'A', content: '3%~10%' },
        { key: 'B', content: '7%~22%' },
        { key: 'C', content: '15%~30%' },
        { key: 'D', content: '25%~40%' }
      ],
      answer: 'B',
      analysis: '混凝土芯样试件的含水率对抗压强度有一定影响，含水越多则强度越低。据国内一些单位试验，泡水后的芯样强度比干燥状态芯样强度下降7%~22%，平均下降14%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '钻芯法', '芯样强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_450',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '沿试件高度任一直径与平均直径相差达（）mm以上时，不得用做抗压强度试验。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '2' },
        { key: 'C', content: '3' },
        { key: 'D', content: '5' }
      ],
      answer: 'B',
      analysis: '试件制作完成后尺寸偏差超过下列数值时，不得用做抗压强度试验：(1)芯样试件高度小于0.95d或大于1.05d；(2)沿试件高度任一直径与平均直径相差达2mm以上。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '试件合格标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_451',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验的目的是确定单桩竖向抗压（）和竖向抗压承载力特征值。',
      options: [
        { key: 'A', content: '极限承载力' },
        { key: 'B', content: '设计承载力' },
        { key: 'C', content: '标准承载力' },
        { key: 'D', content: '允许承载力' }
      ],
      answer: 'A',
      analysis: '单桩竖向抗压静载试验的目的是确定单桩竖向抗压极限承载力和竖向抗压承载力特征值。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '静载试验', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_452',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验加载方式宜采用（）。',
      options: [
        { key: 'A', content: '快速维持荷载法' },
        { key: 'B', content: '慢速维持荷载法' },
        { key: 'C', content: '等速加载法' },
        { key: 'D', content: '循环加载法' }
      ],
      answer: 'B',
      analysis: '单桩竖向抗压静载试验加载方式宜采用慢速维持荷载法。当有成熟的地区经验时，可采用快速维持荷载法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '加载方式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_453',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验加载分级不应少于（）级。',
      options: [
        { key: 'A', content: '6' },
        { key: 'B', content: '8' },
        { key: 'C', content: '10' },
        { key: 'D', content: '12' }
      ],
      answer: 'B',
      analysis: '单桩竖向抗压静载试验加载分级不应少于8级，每级加载量宜为预估极限承载力的1/10~1/8。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '加载分级'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_454',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验每级加载量宜为预估极限承载力的（）。',
      options: [
        { key: 'A', content: '1/12~1/10' },
        { key: 'B', content: '1/10~1/8' },
        { key: 'C', content: '1/8~1/6' },
        { key: 'D', content: '1/6~1/5' }
      ],
      answer: 'B',
      analysis: '每级加载量宜为预估极限承载力的1/10~1/8。第一级加载量可取分级荷载的2倍。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '加载分级'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_455',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '慢速维持荷载法每级荷载施加后，第一小时内应在第（）min各测读一次桩顶沉降量。',
      options: [
        { key: 'A', content: '5、10、15、30、45、60' },
        { key: 'B', content: '5、15、30、45、60' },
        { key: 'C', content: '10、20、30、45、60' },
        { key: 'D', content: '15、30、45、60' }
      ],
      answer: 'A',
      analysis: '慢速维持荷载法每级荷载施加后，第一小时内应在第5、10、15、30、45、60min各测读一次桩顶沉降量，以后每隔30min测读一次。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '静载试验', '沉降观测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_456',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '慢速维持荷载法稳定标准为每一小时内的桩顶沉降量不超过（）mm，并连续出现两次。',
      options: [
        { key: 'A', content: '0.05' },
        { key: 'B', content: '0.1' },
        { key: 'C', content: '0.15' },
        { key: 'D', content: '0.2' }
      ],
      answer: 'B',
      analysis: '慢速维持荷载法稳定标准为每一小时内的桩顶沉降量不超过0.1mm，并连续出现两次（从分级荷载施加后第30min开始，按1.5h连续三次每30min的沉降观测值计算）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '稳定标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_457',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '快速维持荷载法每级荷载维持时间不应少于（）h。',
      options: [
        { key: 'A', content: '0.5' },
        { key: 'B', content: '1' },
        { key: 'C', content: '1.5' },
        { key: 'D', content: '2' }
      ],
      answer: 'B',
      analysis: '快速维持荷载法每级荷载维持时间不应少于1h，每级荷载施加后，在第5、15、30、45、60min各测读一次桩顶沉降量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '快速法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_458',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验卸载时，每级卸载量取加载时分级荷载的（）倍。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '2' },
        { key: 'C', content: '3' },
        { key: 'D', content: '4' }
      ],
      answer: 'B',
      analysis: '卸载时，每级卸载量取加载时分级荷载的2倍，逐级等量卸载。每级荷载维持1h，按第15、30、60min测读桩顶沉降量后，即可卸下一级荷载。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '卸载'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_459',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验卸载至零后，应测读桩顶残余沉降量，维持时间不应少于（）h。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '3' },
        { key: 'C', content: '4' },
        { key: 'D', content: '6' }
      ],
      answer: 'B',
      analysis: '卸载至零后，应测读桩顶残余沉降量，维持时间不应少于3h，测读时间为第15、30min，以后每隔30min测读一次。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '残余沉降'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_460',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '当桩顶沉降量大于前一级荷载作用下沉降量的（）倍时，可终止加载。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '3' },
        { key: 'C', content: '5' },
        { key: 'D', content: '10' }
      ],
      answer: 'C',
      analysis: '当出现下列情况之一时，可终止加载：(1)某级荷载作用下，桩顶沉降量大于前一级荷载作用下沉降量的5倍；(2)某级荷载作用下，桩顶沉降量大于前一级荷载作用下沉降量的2倍，且经24h尚未达到相对稳定标准。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '终止条件'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_461',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '根据桩身完整性判定表，Ⅲ类桩大部分混凝土芯样胶结较好，无松散、夹泥或分层现象，但有下列情况之一即判定为Ⅲ类桩（）。',
      options: [
        { key: 'A', content: '局部混凝土芯样破碎且破碎长度不大于10cm' },
        { key: 'B', content: '混凝土芯样骨料分布不均匀' },
        { key: 'C', content: '混凝土芯样多呈短柱状或块状' },
        { key: 'D', content: '混凝土芯样侧面蜂窝麻面、沟槽连续' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据表4-11桩身完整性判定，Ⅲ类桩大部分混凝土芯样胶结较好，无松散、夹泥或分层现象，但有下列情况之一：局部混凝土芯样破碎且破碎长度不大于10cm；混凝土芯样骨料分布不均匀；混凝土芯样多呈短柱状或块状；混凝土芯样侧面蜂窝麻面、沟槽连续。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '桩身完整性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_462',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '根据桩身完整性判定表，Ⅳ类桩有下列情况之一即判定为Ⅳ类桩（）。',
      options: [
        { key: 'A', content: '桩身混凝土钻进很困难' },
        { key: 'B', content: '混凝土芯样任一段松散、夹泥或分层' },
        { key: 'C', content: '局部混凝土芯样破碎且破碎长度大于10cm' },
        { key: 'D', content: '混凝土芯样侧面局部见蜂窝麻面' }
      ],
      answer: 'A,B,C',
      analysis: '根据表4-11桩身完整性判定，Ⅳ类桩有下列情况之一：桩身混凝土钻进很困难；混凝土芯样任一段松散、夹泥或分层；局部混凝土芯样破碎且破碎长度大于10cm。选项D是Ⅱ类桩的特征。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '桩身完整性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_463',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '芯样试件不能作为抗压试件的情况包括（）。',
      options: [
        { key: 'A', content: '芯样试件表面有裂缝或有其他较大缺陷' },
        { key: 'B', content: '芯样试件内含有钢筋' },
        { key: 'C', content: '芯样试件平均直径小于2倍表观混凝土粗骨料最大粒径' },
        { key: 'D', content: '芯样试件高度小于0.95d或大于1.05d' }
      ],
      answer: 'A,B,C,D',
      analysis: '芯样试件表面有裂缝或有其他较大缺陷，芯样试件内含有钢筋，芯样试件平均直径小于2倍表观混凝土粗骨料最大粒径均不能作为抗压试件。试件制作完成后尺寸偏差超过规定数值时，也不得用做抗压强度试验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '试件要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_464',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验可终止加载的情况包括（）。',
      options: [
        { key: 'A', content: '某级荷载作用下，桩顶沉降量大于前一级荷载作用下沉降量的5倍' },
        { key: 'B', content: '某级荷载作用下，桩顶沉降量大于前一级荷载作用下沉降量的2倍，且经24h尚未达到相对稳定标准' },
        { key: 'C', content: '已达到设计要求的最大加载量' },
        { key: 'D', content: '荷载-沉降曲线呈缓变型且桩顶总沉降量超过60~80mm' }
      ],
      answer: 'A,B,C,D',
      analysis: '当出现下列情况之一时，可终止加载：(1)某级荷载作用下，桩顶沉降量大于前一级荷载作用下沉降量的5倍；(2)某级荷载作用下，桩顶沉降量大于前一级荷载作用下沉降量的2倍，且经24h尚未达到相对稳定标准；(3)已达到设计要求的最大加载量；(4)荷载-沉降曲线呈缓变型且桩顶总沉降量超过60~80mm。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '静载试验', '终止条件'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_465',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验的反力装置可采用（）。',
      options: [
        { key: 'A', content: '锚桩横梁反力装置' },
        { key: 'B', content: '压重平台反力装置' },
        { key: 'C', content: '锚桩压重联合反力装置' },
        { key: 'D', content: '地锚反力装置' }
      ],
      answer: 'A,B,C,D',
      analysis: '单桩竖向抗压静载试验的反力装置可采用锚桩横梁反力装置、压重平台反力装置、锚桩压重联合反力装置、地锚反力装置等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '反力装置'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_466',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验的加载方式包括（）。',
      options: [
        { key: 'A', content: '慢速维持荷载法' },
        { key: 'B', content: '快速维持荷载法' },
        { key: 'C', content: '等速加载法' },
        { key: 'D', content: '循环加载法' }
      ],
      answer: 'A,B',
      analysis: '单桩竖向抗压静载试验加载方式宜采用慢速维持荷载法。当有成熟的地区经验时，可采用快速维持荷载法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '加载方式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_467',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验检测数量的确定应符合下列规定（）。',
      options: [
        { key: 'A', content: '设计等级为甲级的桩基工程，检测数量不应少于总桩数的1%，且不少于3根' },
        { key: 'B', content: '设计等级为乙级的桩基工程，检测数量不应少于总桩数的1%，且不少于3根' },
        { key: 'C', content: '设计等级为丙级的桩基工程，检测数量不应少于总桩数的2%' },
        { key: 'D', content: '对于端承型大直径灌注桩，检测数量不应少于总桩数的10%' }
      ],
      answer: 'A,B',
      analysis: '设计等级为甲级、乙级的桩基工程，检测数量不应少于总桩数的1%，且不少于3根。设计等级为丙级的桩基工程，检测数量不应少于总桩数的0.5%，且不少于2根。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '静载试验', '检测数量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_468',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压极限承载力可按下列方法综合确定（）。',
      options: [
        { key: 'A', content: '根据沉降随荷载变化的特征确定' },
        { key: 'B', content: '根据沉降随时间变化的特征确定' },
        { key: 'C', content: '结合桩的类型、桩端持力层土性综合判定' },
        { key: 'D', content: '仅根据最大加载量确定' }
      ],
      answer: 'A,B,C',
      analysis: '单桩竖向抗压极限承载力可按下列方法综合确定：(1)根据沉降随荷载变化的特征确定；(2)根据沉降随时间变化的特征确定；(3)结合桩的类型、桩端持力层土性综合判定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '极限承载力'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_469',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: 'Ⅰ类桩的特征是混凝土芯样连续、完整、表面光滑、胶结好、骨料分布均匀、呈长柱状、断口吻合，混凝土芯样侧面仅见少量气孔。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据表4-11桩身完整性判定，Ⅰ类桩的特征是混凝土芯样连续、完整、表面光滑、胶结好、骨料分布均匀、呈长柱状、断口吻合，混凝土芯样侧面仅见少量气孔。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '钻芯法', '桩身完整性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_470',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: 'Ⅱ类桩的特征是混凝土芯样侧面局部见松散、夹泥。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。Ⅱ类桩的特征是混凝土芯样连续、完整、胶结较好、骨料分布基本均匀、呈柱状、断口基本吻合，混凝土芯样侧面局部见蜂窝麻面、沟槽，而不是松散、夹泥。松散、夹泥是Ⅳ类桩的特征。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '桩身完整性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_471',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '芯样试件在受压前宜在（20±5）℃的清水中浸泡20~30h。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。芯样试件在受压前宜在（20±5）℃的清水中浸泡40~48h，从水中取出后应立即进行抗压强度试验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样试验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_472',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '混凝土强度等级低于C30时，加荷速度取每秒钟0.5~0.8MPa。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。混凝土强度等级低于C30时，取每秒钟0.3~0.5MPa；混凝土强度等级高于或等于C30时，取每秒钟0.5~0.8MPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样试验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_473',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '泡水后的芯样强度比干燥状态芯样强度下降7%~22%，平均下降14%。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。混凝土芯样试件的含水率对抗压强度有一定影响，含水越多则强度越低。据国内一些单位试验，泡水后的芯样强度比干燥状态芯样强度下降7%~22%，平均下降14%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '芯样强度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_474',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验加载方式宜采用快速维持荷载法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。单桩竖向抗压静载试验加载方式宜采用慢速维持荷载法。当有成熟的地区经验时，可采用快速维持荷载法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '静载试验', '加载方式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_475',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验加载分级不应少于10级。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。单桩竖向抗压静载试验加载分级不应少于8级，每级加载量宜为预估极限承载力的1/10~1/8。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '静载试验', '加载分级'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_476',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '慢速维持荷载法稳定标准为每一小时内的桩顶沉降量不超过0.1mm，并连续出现两次。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。慢速维持荷载法稳定标准为每一小时内的桩顶沉降量不超过0.1mm，并连续出现两次（从分级荷载施加后第30min开始，按1.5h连续三次每30min的沉降观测值计算）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '稳定标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_477',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '快速维持荷载法每级荷载维持时间不应少于2h。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。快速维持荷载法每级荷载维持时间不应少于1h，每级荷载施加后，在第5、15、30、45、60min各测读一次桩顶沉降量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '快速法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_478',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '单桩竖向抗压静载试验卸载时，每级卸载量取加载时分级荷载的2倍。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。卸载时，每级卸载量取加载时分级荷载的2倍，逐级等量卸载。每级荷载维持1h，按第15、30、60min测读桩顶沉降量后，即可卸下一级荷载。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '卸载'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_479',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '卸载至零后，应测读桩顶残余沉降量，维持时间不应少于2h。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。卸载至零后，应测读桩顶残余沉降量，维持时间不应少于3h，测读时间为第15、30min，以后每隔30min测读一次。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '残余沉降'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_480',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '当桩顶沉降量大于前一级荷载作用下沉降量的3倍时，可终止加载。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。当某级荷载作用下，桩顶沉降量大于前一级荷载作用下沉降量的5倍时，可终止加载。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '静载试验', '终止条件'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
