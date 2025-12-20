/**
 * 岩土工程题目数据（第十部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（地基与基础）第3版 钻芯法检测与混凝土强度评定
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目（第十部分）
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions10(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_361',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '我国把混凝土按立方体抗压强度来分级，称之为强度等级，混凝土的标准试件为边长为（）mm的立方体。',
      options: [
        { key: 'A', content: '100' },
        { key: 'B', content: '150' },
        { key: 'C', content: '200' },
        { key: 'D', content: '250' }
      ],
      answer: 'B',
      analysis: '我国把混凝土按立方体抗压强度来分级，称之为强度等级，混凝土的标准试件为边长为150mm的立方体。立方体抗压强度标准值是指按标准方法制作和养护的边长为150mm的立方体试件，在28d龄期，用标准试验方法测得的抗压强度总体分布中的一个值。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '混凝土强度', '标准试件'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_362',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '在混凝土强度测定值的总体中，低于该强度的概率不大于（）（即0.05分位数）。',
      options: [
        { key: 'A', content: '3%' },
        { key: 'B', content: '5%' },
        { key: 'C', content: '10%' },
        { key: 'D', content: '15%' }
      ],
      answer: 'B',
      analysis: '在混凝土强度测定值的总体中，低于该强度的概率不大于5%（即0.05分位数）。混凝土强度等级是混凝土物理力学性能的基本度量尺度，是用来评价混凝土质量的一个主要的技术指标，是反映混凝土工程质量的一个最基本参数。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '分位数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_363',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '最常用的混凝土强度评定标准是《混凝土强度检验评定标准》（GB/T 50107—2010），混凝土强度合格评定方法有（）种。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '3' },
        { key: 'C', content: '4' },
        { key: 'D', content: '5' }
      ],
      answer: 'B',
      analysis: '最常用的混凝土强度评定标准是《混凝土强度检验评定标准》（GB/T 50107—2010），混凝土强度合格评定方法有三种，第一种是方差已知的统计方法，第二种是方差未知的统计方法，第三种是非统计评定方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '评定方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_364',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '方差已知的统计方法中，一个验收批由连续的3组试件组成，其强度应同时满足mfcu≥fcu,k+0.7σ0和fcu,min≥fcu,k-0.7σ0的要求。当混凝土强度等级不高于C20时，强度的最小值尚应满足（）。',
      options: [
        { key: 'A', content: 'fcu,min≥0.80fcu,k' },
        { key: 'B', content: 'fcu,min≥0.85fcu,k' },
        { key: 'C', content: 'fcu,min≥0.90fcu,k' },
        { key: 'D', content: 'fcu,min≥0.95fcu,k' }
      ],
      answer: 'B',
      analysis: '当混凝土强度等级不高于C20时，强度的最小值尚应满足fcu,min≥0.85fcu,k的要求。当混凝土强度等级高于C20时，强度的最小值尚应满足fcu,min≥0.90fcu,k的要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '统计方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_365',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '方差未知的统计方法中，应由不少于（）组的试件组成一个验收批。',
      options: [
        { key: 'A', content: '5' },
        { key: 'B', content: '8' },
        { key: 'C', content: '10' },
        { key: 'D', content: '15' }
      ],
      answer: 'C',
      analysis: '方差未知的统计方法是现场浇灌混凝土强度的主要评定方法。应由不少于10组的试件组成一个验收批，其强度应同时满足mfcu-λ1Sfcu≥0.9fcu,k和fcu,min≥λ2fcu,k的要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '统计方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_366',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '根据混凝土强度的合格判定系数表，当试件组数为10~14时，λ1的值为（）。',
      options: [
        { key: 'A', content: '1.60' },
        { key: 'B', content: '1.65' },
        { key: 'C', content: '1.70' },
        { key: 'D', content: '1.75' }
      ],
      answer: 'C',
      analysis: '根据表4-8混凝土强度的合格判定系数，当试件组数为10~14时，λ1=1.70，λ2=0.90；当试件组数为15~24时，λ1=1.65，λ2=0.85；当试件组数≥25时，λ1=1.60，λ2=0.85。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '合格判定系数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_367',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '不具备统计方法评定条件，试件组数小于10组，用非统计方法。按非统计方法评定混凝土强度时，其强度应同时满足mfcu≥（）fcu,k的要求。',
      options: [
        { key: 'A', content: '1.10' },
        { key: 'B', content: '1.15' },
        { key: 'C', content: '1.20' },
        { key: 'D', content: '1.25' }
      ],
      answer: 'B',
      analysis: '不具备统计方法评定条件，试件组数小于10组，用非统计方法。按非统计方法评定混凝土强度时，其强度应同时满足mfcu≥1.15fcu,k和fcu,min≥0.95fcu,k的要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '非统计方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_368',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '当一个验收批的混凝土试件仅有一组时，则该组试件的强度不得低于标准值的（）。',
      options: [
        { key: 'A', content: '105%' },
        { key: 'B', content: '110%' },
        { key: 'C', content: '115%' },
        { key: 'D', content: '120%' }
      ],
      answer: 'C',
      analysis: '当一个验收批的混凝土试件仅有一组时，则该组试件的强度不得低于标准值的115%。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '验收批'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_369',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '用于检查结构构件混凝土强度的试件，应在混凝土的浇筑地点随机抽取。每拌制100盘且不超过100m³的同配合比的混凝土，取样不得少于（）次。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '2' },
        { key: 'C', content: '3' },
        { key: 'D', content: '5' }
      ],
      answer: 'A',
      analysis: '用于检查结构构件混凝土强度的试件，应在混凝土的浇筑地点随机抽取。取样与试件留置应符合下列规定：(1)每拌制100盘且不超过100m³的同配合比的混凝土，取样不得少于1次。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '取样规定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_370',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '当一次连续浇筑超过1000m³时，同一配合比的混凝土每（）m³取样不得少于1次。',
      options: [
        { key: 'A', content: '100' },
        { key: 'B', content: '150' },
        { key: 'C', content: '200' },
        { key: 'D', content: '250' }
      ],
      answer: 'C',
      analysis: '当一次连续浇筑超过1000m³时，同一配合比的混凝土每200m³取样不得少于1次。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '取样规定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_371',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯法检测混凝土灌注桩时，如果要求对全桩长进行检测，一般要求受检桩桩径不宜小于（）mm，长径比不宜大于30。',
      options: [
        { key: 'A', content: '600' },
        { key: 'B', content: '800' },
        { key: 'C', content: '1000' },
        { key: 'D', content: '1200' }
      ],
      answer: 'B',
      analysis: '钻芯法检测混凝土灌注桩时，当受检桩长径比较大时，成孔的垂直度和钻芯孔容易偏离桩身，如果要求对全桩长进行检测，一般要求受检桩桩径不宜小于800mm，长径比不宜大于30。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '检测要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_372',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯法检测的主要目的有四个，其中不包括（）。',
      options: [
        { key: 'A', content: '检测桩身混凝土质量情况' },
        { key: 'B', content: '桩底沉渣是否符合设计或规范的要求' },
        { key: 'C', content: '桩底持力层的岩土性状（强度）和厚度是否符合设计或规范要求' },
        { key: 'D', content: '检测桩的承载力' }
      ],
      answer: 'D',
      analysis: '钻芯法检测的主要目的有四个：(1)检测桩身混凝土质量情况；(2)桩底沉渣是否符合设计或规范的要求；(3)桩底持力层的岩土性状（强度）和厚度是否符合设计或规范要求；(4)测定桩长是否与施工记录桩长一致。钻芯法不能直接检测桩的承载力。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '检测目的'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_373',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '根据机械破岩方式，钻进方法可分为回转钻进、冲击钻进、螺旋钻进、振动钻进等。在各种钻进工作中，使用最多的是（）。',
      options: [
        { key: 'A', content: '冲击钻进' },
        { key: 'B', content: '回转钻进' },
        { key: 'C', content: '螺旋钻进' },
        { key: 'D', content: '振动钻进' }
      ],
      answer: 'B',
      analysis: '根据机械破岩方式，钻进方法可分为回转钻进、冲击钻进、螺旋钻进、振动钻进等。在各种钻进工作中，使用最多的是回转钻进。根据所用钻头不同，回转钻进又可分为金刚石钻进、硬质合金钻进、牙轮钻进和钢粒钻进等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻进方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_374',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '灌注桩和地下连续墙的混凝土质量检测宜采用液压操纵的钻机，并配有相应的钻塔和牢固的底座，机械技术性能良好。钻机的额定最高转速应不低于（）rad/min。',
      options: [
        { key: 'A', content: '500' },
        { key: 'B', content: '650' },
        { key: 'C', content: '790' },
        { key: 'D', content: '1000' }
      ],
      answer: 'C',
      analysis: '灌注桩和地下连续墙的混凝土质量检测宜采用液压操纵的钻机，并配有相应的钻塔和牢固的底座，机械技术性能良好。应采用带有产品合格证的钻芯设备，钻机的额定最高转速应不低于790rad/min，额定最高转速最好能不低于1000rad/min，转速调节范围应不少于4挡，额定配用压力应不低于1.5MPa，配用压力越大钻机可钻孔越深。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '钻芯法', '设备要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_375',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯法应采用单动双管钻具，并配备相应的孔口管、扩孔器、卡簧、扶正稳定器（又称导向器）及可捞取松软沉渣样的钻具。钻杆应顺直，直径宜为（）mm。',
      options: [
        { key: 'A', content: '42' },
        { key: 'B', content: '51' },
        { key: 'C', content: '60' },
        { key: 'D', content: '75' }
      ],
      answer: 'B',
      analysis: '钻芯法应采用单动双管钻具，并配备相应的孔口管、扩孔器、卡簧、扶正稳定器（又称导向器）及可捞取松软沉渣样的钻具。尤其是当桩较长时，应使用扶正稳定器确保钻芯孔的垂直度。选用较粗且平直的钻杆，由于其刚度大，与孔壁的间隙就小，是动就小，钻孔的垂直度就易保证。钻杆应顺直，直径宜为51mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻具要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_376',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯孔垂直度偏差应控制在（）的范围内。',
      options: [
        { key: 'A', content: '0.3%' },
        { key: 'B', content: '0.5%' },
        { key: 'C', content: '0.8%' },
        { key: 'D', content: '1.0%' }
      ],
      answer: 'B',
      analysis: '设备安装后，应进行试运转，在确认正常后方能开钻，确保钻机在钻芯过程中不发生倾斜、移位。一般说来，钻芯孔垂直度偏差应控制在0.5%的范围内。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '垂直度要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_377',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '桩顶面与钻机塔座距离大于2m时，宜安装孔口管。开孔宜采用合金钻头，开孔深为（）m后安装孔口管，孔口管下入时应严格测量垂直度，然后固定。',
      options: [
        { key: 'A', content: '0.1~0.3' },
        { key: 'B', content: '0.3~0.5' },
        { key: 'C', content: '0.5~0.8' },
        { key: 'D', content: '0.8~1.0' }
      ],
      answer: 'B',
      analysis: '桩顶面与钻机塔座距离大于2m时，宜安装孔口管。开孔宜采用合金钻头，开孔深为0.3~0.5m后安装孔口管，孔口管下入时应严格测量垂直度，然后固定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '孔口管安装'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_378',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '为了保证钻芯质量，应采用符合现行国家专业标准《人造金刚石薄壁钻头》（ZB 400—85）要求的钻头进行钻芯取样。钻头外径不宜小于（）mm。',
      options: [
        { key: 'A', content: '80' },
        { key: 'B', content: '100' },
        { key: 'C', content: '120' },
        { key: 'D', content: '150' }
      ],
      answer: 'B',
      analysis: '应根据混凝土设计强度等级选用合适粒度、浓度、胎体硬度的金刚石钻头，且外径不宜小于100mm。为了保证钻芯质量，应采用符合现行国家专业标准《人造金刚石薄壁钻头》（ZB 400—85）要求的钻头进行钻芯取样。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻头要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_379',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '若钻取的3个芯样的强度统计值只符合式R≥fcu,k的规定但不符合式Rmin≥0.85fcu,k的规定，或只符合式Rmin≥0.85fcu,k的规定但不符合式R≥fcu,k的规定，则需在该制品上再钻取（）个芯样进行试验。',
      options: [
        { key: 'A', content: '3' },
        { key: 'B', content: '6' },
        { key: 'C', content: '9' },
        { key: 'D', content: '12' }
      ],
      answer: 'B',
      analysis: '若钻取的3个芯样的强度统计值只符合式(4-109)的规定但不符合式(4-110)的规定，或只符合式(4-110)的规定但不符合式(4-109)的规定，则需在该制品上再钻取6个芯样进行试验。若新钻取的6个芯样的强度指标与原3个芯样的强度指标的统计值（共9个芯样）同时符合式(4-111)和式(4-112)的规定，则判定该制品的混凝土强度合格。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '钻芯法', '强度评定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_380',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻取的12个芯样试件混凝土抗压强度推算值的平均值R\'应满足R\'≥（）fcu,k的要求。',
      options: [
        { key: 'A', content: '0.75' },
        { key: 'B', content: '0.80' },
        { key: 'C', content: '0.85' },
        { key: 'D', content: '0.90' }
      ],
      answer: 'C',
      analysis: '钻取的12个芯样试件混凝土抗压强度推算值的平均值R\'应满足R\'≥0.85fcu,k，最小值R\'min应满足R\'min≥0.75fcu,k的要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '强度评定'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_381',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯法检测的主要目的包括（）。',
      options: [
        { key: 'A', content: '检测桩身混凝土质量情况，如桩身混凝土胶结状况，有无气孔、蜂窝麻面、松散或断桩等' },
        { key: 'B', content: '桩底沉渣是否符合设计或规范的要求' },
        { key: 'C', content: '桩底持力层的岩土性状（强度）和厚度是否符合设计或规范要求' },
        { key: 'D', content: '测定桩长是否与施工记录桩长一致' }
      ],
      answer: 'A,B,C,D',
      analysis: '钻芯法检测的主要目的有四个：(1)检测桩身混凝土质量情况，如桩身混凝土胶结状况，有无气孔、蜂窝麻面、松散或断桩等，桩身混凝土强度是否符合设计要求，判定桩身完整性类别；(2)桩底沉渣是否符合设计或规范的要求；(3)桩底持力层的岩土性状（强度）和厚度是否符合设计或规范要求；(4)测定桩长是否与施工记录桩长一致。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '检测目的'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_382',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '关于钻芯法检测水泥土搅拌桩，《建筑地基基础施工质量验收规范》（GB 50202—2018）要求对（）的桩体强度或完整性进行检验。',
      options: [
        { key: 'A', content: '高压喷射注浆地基' },
        { key: 'B', content: '水泥土搅拌桩' },
        { key: 'C', content: '水泥粉煤灰碎石桩（CFG桩）' },
        { key: 'D', content: '钢筋混凝土灌注桩' }
      ],
      answer: 'A,B,C',
      analysis: '关于钻芯法检测水泥土搅拌桩，《建筑地基基础施工质量验收规范》（GB 50202—2018）要求对高压喷射注浆地基的桩体强度或完整性进行检验，对水泥土搅拌桩、水泥粉煤灰碎石桩（CFG桩）的桩身强度进行检查。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '检测范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_383',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '混凝土强度合格评定方法有（）。',
      options: [
        { key: 'A', content: '方差已知的统计方法' },
        { key: 'B', content: '方差未知的统计方法' },
        { key: 'C', content: '非统计评定方法' },
        { key: 'D', content: '回弹法' }
      ],
      answer: 'A,B,C',
      analysis: '最常用的混凝土强度评定标准是《混凝土强度检验评定标准》（GB/T 50107—2010），混凝土强度合格评定方法有三种，第一种是方差已知的统计方法，第二种是方差未知的统计方法，第三种是非统计评定方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '评定方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_384',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '用于检查结构构件混凝土强度的试件取样与试件留置应符合下列规定（）。',
      options: [
        { key: 'A', content: '每拌制100盘且不超过100m³的同配合比的混凝土，取样不得少于1次' },
        { key: 'B', content: '每工作班拌制的同一配合比的混凝土不足100盘时取样不得少于1次' },
        { key: 'C', content: '当一次连续浇筑超过1000m³时，同一配合比的混凝土每200m³取样不得少于1次' },
        { key: 'D', content: '每一楼层、同一配合比的混凝土取样不得少于1次' }
      ],
      answer: 'A,B,C,D',
      analysis: '用于检查结构构件混凝土强度的试件，应在混凝土的浇筑地点随机抽取。取样与试件留置应符合下列规定：(1)每拌制100盘且不超过100m³的同配合比的混凝土，取样不得少于1次；(2)每工作班拌制的同一配合比的混凝土不足100盘时取样不得少于1次；(3)当一次连续浇筑超过1000m³时，同一配合比的混凝土每200m³取样不得少于1次；(4)每一楼层、同一配合比的混凝土取样不得少于1次。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '取样规定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_385',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯设备的安装要求包括（）。',
      options: [
        { key: 'A', content: '钻机设备应精心安装，必须周正、稳固、底座水平' },
        { key: 'B', content: '钻机立轴中心、天轮中心（天车前沿切点）与孔口中心必须在同一铅垂线上' },
        { key: 'C', content: '钻机设备最好架设在枕木上，地面土质较好、条件允许，也可使用木枋垫底' },
        { key: 'D', content: '设备安装后，应进行试运转，在确认正常后方能开钻' }
      ],
      answer: 'A,B,C,D',
      analysis: '钻芯设备安装的好坏直接影响钻芯法检测成果，应高度重视。钻机设备应精心安装，必须周正、稳固、底座水平。钻机立轴中心、天轮中心（天车前沿切点）与孔口中心必须在同一铅垂线上。钻机设备最好架设在枕木上，地面土质较好、条件允许，也可使用木枋垫底。设备安装后，应进行试运转，在确认正常后方能开钻，确保钻机在钻芯过程中不发生倾斜、移位。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '设备安装'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_386',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻头的选择应注意（）。',
      options: [
        { key: 'A', content: '应根据混凝土设计强度等级选用合适粒度、浓度、胎体硬度的金刚石钻头' },
        { key: 'B', content: '钻头外径不宜小于100mm' },
        { key: 'C', content: '如钻头胎体有肉眼可见的裂纹裂缝、缺边、少角、倾斜及喇叭口变形等，不仅降低钻头寿命，而且影响钻芯质量' },
        { key: 'D', content: '使用硬质合金钻头，钻进正常的混凝土，很难保证混凝土芯样质量' }
      ],
      answer: 'A,B,C,D',
      analysis: '钻头的选择：应根据混凝土设计强度等级选用合适粒度、浓度、胎体硬度的金刚石钻头，且外径不宜小于100mm。为了保证钻芯质量，应采用符合现行国家专业标准《人造金刚石薄壁钻头》（ZB 400—85）要求的钻头进行钻芯取样。如钻头胎体有肉眼可见的裂纹裂缝、缺边、少角、倾斜及喇叭口变形等，不仅降低钻头寿命，而且影响钻芯质量。使用硬质合金钻头，钻进正常的混凝土，很难保证混凝土芯样质量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻头选择'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_387',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '一个验收批由若干组混凝土试件构成，每组由3个试件组成，每组3个试件的混凝土强度代表值的取舍原则如下（）。',
      options: [
        { key: 'A', content: '当一组试件中强度的最大值和最小值与中间值之差，均未超过中间值的15%时，取3个试件强度的算术平均值作为每组试件的强度代表值' },
        { key: 'B', content: '当一组试件中强度的最大值或最小值与中间值之差，超过中间值的15%时，取中间值作为该组试件的强度代表值' },
        { key: 'C', content: '当一组试件中强度的最大值和最小值与中间值之差，均超过中间值的15%时，该组试件的强度不能作为评定的依据' },
        { key: 'D', content: '当一组试件中强度的最大值和最小值与中间值之差，均超过中间值的10%时，该组试件的强度不能作为评定的依据' }
      ],
      answer: 'A,B,C',
      analysis: '一个验收批由若干组混凝土试件构成，每组由3个试件组成，每组3个试件的混凝土强度代表值的取舍原则如下：(1)当一组试件中强度的最大值和最小值与中间值之差，均未超过中间值的15%时，取3个试件强度的算术平均值作为每组试件的强度代表值；(2)当一组试件中强度的最大值或最小值与中间值之差，超过中间值的15%时，取中间值作为该组试件的强度代表值；(3)当一组试件中强度的最大值和最小值与中间值之差，均超过中间值的15%时，该组试件的强度不能作为评定的依据。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '混凝土强度', '代表值取舍'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_388',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯法借鉴了地质勘探技术，地质勘探的对象包括强度低的淤泥、淤泥质土，一般土，以及强度高的岩石。钻芯法的特点包括（）。',
      options: [
        { key: 'A', content: '不管对象的强度高低，均可钻取芯样' },
        { key: 'B', content: '钻取芯样的目的主要是划分地层及各地层岩土的物理力学性能' },
        { key: 'C', content: '是检测钻（冲）孔、人工挖孔等现浇混凝土灌注桩成桩质量的一种有效手段' },
        { key: 'D', content: '特别适用于大直径混凝土灌注桩的成桩质量检测' }
      ],
      answer: 'A,B,C,D',
      analysis: '钻芯法借鉴了地质勘探技术，地质勘探的对象包括强度低的淤泥、淤泥质土，一般土，以及强度高的岩石，从勘探角度来说，不管对象的强度高低，均可钻取芯样，但是钻取芯样的目的主要是划分地层及各地层岩土的物理力学性能。大量工程实践表明，钻芯法是检测钻（冲）孔、人工挖孔等现浇混凝土灌注桩成桩质量的一种有效手段，不受场地条件的限制，特别适用于大直径混凝土灌注桩的成桩质量检测。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '特点'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_389',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '无论是混凝土结构，还是混凝土灌注桩，对于正常施工情况，都应该按规定制作混凝土立方体试块进行强度检验和评定，不能用芯样强度试验代替立方体试件强度试验，因此立方体试件强度试验是评定混凝土强度的重要资料。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。无论是混凝土结构，还是混凝土灌注桩，对于正常施工情况，都应该按规定制作混凝土立方体试块进行强度检验和评定，不能用芯样强度试验代替立方体试件强度试验，因此立方体试件强度试验是评定混凝土强度的重要资料。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '试验方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_390',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '混凝土强度等级是混凝土物理力学性能的基本度量尺度，是用来评价混凝土质量的一个主要的技术指标，是反映混凝土工程质量的一个最基本参数。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。混凝土强度等级是混凝土物理力学性能的基本度量尺度，是用来评价混凝土质量的一个主要的技术指标，是反映混凝土工程质量的一个最基本参数。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '混凝土强度', '强度等级'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_391',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '标准规定，凡有条件的混凝土生产单位均应采用统计方法进行混凝土强度的检验评定。预拌混凝土厂、预制混凝土构件和采用现场集中搅拌的施工单位，应按统计法评定混凝土强度，并应定期对混凝土强度进行统计分析，控制混凝土质量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。标准规定，凡有条件的混凝土生产单位均应采用统计方法进行混凝土强度的检验评定。预拌混凝土厂、预制混凝土构件和采用现场集中搅拌的施工单位，应按统计法评定混凝土强度，并应定期对混凝土强度进行统计分析，控制混凝土质量；对零星生产的预制构件的混凝土或现场搅拌的批量不大的混凝土，可按非统计方法评定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '评定方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_392',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '一个验收批的混凝土应由强度等级相同、生产工艺条件和配合比基本相同的混凝土组成。一般来说，一个验收批的批量不宜过大，因为批量过大，一旦检验不合格，需做处理的混凝土量太大，造成不必要的经济损失。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。一个验收批的混凝土应由强度等级相同、生产工艺条件和配合比基本相同的混凝土组成。一般来说，一个验收批的批量不宜过大，因为批量过大，一旦检验不合格，需做处理的混凝土量太大，造成不必要的经济损失；但批量过小，也会使检验工作量太大；批量应根据具体生产条件来确定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '混凝土强度', '验收批'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_393',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '钻芯法对所有混凝土灌注桩均可检测，但实际上，当受检桩长径比较大时，成孔的垂直度和钻芯孔容易偏离桩身，钻芯孔容易偏离桩身。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。理论上讲，钻芯法对所有混凝土灌注桩均可检测，但实际上，当受检桩长径比较大时，成孔的垂直度和钻芯孔容易偏离桩身，钻芯孔容易偏离桩身，如果要求对全桩长进行检测，一般要求受检桩桩径不宜小于800mm，长径比不宜大于30。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '适用范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_394',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '如仅仅是为了抽检桩上部的混凝土强度，可以不受桩径和长径比的限制，有些工程由于验收的需要，对中小直径的沉管灌注桩的上部混凝土也进行钻芯法检测。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。如仅仅是为了抽检桩上部的混凝土强度，可以不受桩径和长径比的限制，有些工程由于验收的需要，对中小直径的沉管灌注桩的上部混凝土也进行钻芯法检测。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '检测范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_395',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '在实际建筑工程中，我们有时也采用钻芯法检测深层搅拌桩等低强度的桩身质量，但在检测结果的分析评价上有许多困难，复合地基中的桩体远没有混凝土灌注桩均匀，这些增强体的质量不仅与施工工艺密切相关，而且与土层性质密切相关。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在实际建筑工程中，我们有时也采用钻芯法检测深层搅拌桩等低强度的桩身质量，但在检测结果的分析评价上有许多困难，复合地基中的桩体远没有混凝土灌注桩均匀，这些增强体的质量不仅与施工工艺密切相关，而且与土层性质密切相关，如深层搅拌桩在砂层中的桩身强度可高达近10MPa，而在淤泥中可能不到1MPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '深层搅拌桩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_396',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '金刚石钻进能通过坚硬岩石，但钻头与切削具是分开的，破碎孔底环状面积大，芯样直径小，芯样易破碎，磨损大，采取率低，不适用于基桩钻芯法检测。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。钢粒钻进能通过坚硬岩石，但钻头与切削具是分开的，破碎孔底环状面积大，芯样直径小，芯样易破碎，磨损大，采取率低，不适用于基桩钻芯法检测。硬质合金钻进虽然切削具破坏岩石比较平稳，破碎孔底环状面积相对较小，孔壁与钻具间隙小，芯样直径大，采取率较好，但是硬质合金钻只适用于小于7级的岩石（按综合指标划分岩石可钻性分级共有12个级别），不适用于基桩钻芯法检测。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '钻芯法', '钻进方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_397',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '回转钻进是给切削具以轴向压力，并在回转力的作用下，转动钻头，连续破碎岩石的方法。回转钻进采用回转钻机带动钻杆转动，钻杆的下面装有钻头，钻杆转动时带动钻头一起转动。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。回转钻进是给切削具以轴向压力，并在回转力的作用下，转动钻头，连续破碎岩石的方法。回转钻进采用回转钻机带动钻杆转动，钻杆的下面装有钻头，钻杆转动时带动钻头一起转动。但要有效破碎岩石，还必须给钻头施加一定的压力，从而使钻头能够在转动的同时切入破碎岩石。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '回转钻进'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_398',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '加大钻机的底座重量有利于钻机的稳定性，能提高混凝土芯样的质量和采取率。实践证明，如果钻机使用时间太长，性能不好，可能高速上不去，或即使勉强上去了，钻杆摆动很厉害，有的钻机甚至在中速运转时钻杆摆动也非常大。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。加大钻机的底座重量有利于钻机的稳定性，能提高混凝土芯样的质量和采取率。如果钻机使用时间太长，性能不好，可能高速上不去，或即使勉强上去了，钻杆摆动很厉害，有的钻机甚至在中速运转时钻杆摆动也非常大。目前市场上有比较轻便的中速钻机，最高转速只能达到500多rad/min，钻机进尺慢，比正常钻机的速度慢2~3倍，10多米的桩4~5d才抽完2个孔。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻机性能'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_399',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '合金钻头价格较低，对钻取松散部位的混凝土和桩底沉渣，采用干钻时，应采用合金钻头。开孔时也可采用合金钻头。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。使用硬质合金钻头，钻进正常的混凝土，很难保证混凝土芯样质量。合金钻头价格较低，对钻取松散部位的混凝土和桩底沉渣，采用干钻时，应采用合金钻头。开孔时也可采用合金钻头。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '钻头选择'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_400',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第四章 基桩检测',
      content: '为了避免粗骨料对试件强度的影响，要求试件尺寸明显大于骨料最大粒径，如果试件尺寸接近粗骨料粒径，试件强度可能反映的是粗骨料的强度而不是混凝土的强度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。为了避免粗骨料对试件强度的影响，要求试件尺寸明显大于骨料最大粒径，如果试件尺寸接近粗骨料粒径，试件强度可能反映的是粗骨料的强度而不是混凝土的强度。《混凝土结构工程施工质量验收规范》（GB 50204—2015）规定结构构件的混凝土强度必须符合设计要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '钻芯法', '试件尺寸'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
