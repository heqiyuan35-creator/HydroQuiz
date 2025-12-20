/**
 * 模拟题库数据
 * HydroQuiz - 水利工程检测员刷题宝
 * 用于开发测试，后续替换为真实题库
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { questionService } from '../services/QuestionService';
import { Logger } from '../common/utils/Logger';
import { AppConstants } from '../common/constants/AppConstants';
import { getConcreteExtendedQuestions } from './ConcreteQuestionsData';
import { getConcreteCementQuestions } from './ConcreteCementQuestionsData';
import { getConcreteCementQuestions2 } from './ConcreteCementQuestionsData2';
import { getConcreteAdmixtureQuestions } from './ConcreteAdmixtureQuestionsData';
import { getConcreteAdmixtureQuestions2 } from './ConcreteAdmixtureQuestionsData2';
import { getConcreteAggregateQuestions } from './ConcreteAggregateQuestionsData';
import { getConcreteStructureQuestions } from './ConcreteStructureQuestionsData';
import { getConcreteDurabilityQuestions } from './ConcreteDurabilityQuestionsData';
import { getBasicKnowledgeQuestionsPart2 } from './BasicKnowledgeQuestions_Part2';
import { getGeotechnicalQuestions } from './GeotechnicalQuestionsData';
import { getGeotechnicalQuestions2 } from './GeotechnicalQuestionsData2';
import { getGeotechnicalQuestions3 } from './GeotechnicalQuestionsData3';
import { getGeotechnicalQuestions4 } from './GeotechnicalQuestionsData4';
import { getGeotechnicalQuestions5 } from './GeotechnicalQuestionsData5';
import { getGeotechnicalQuestions6 } from './GeotechnicalQuestionsData6';
import { getGeotechnicalQuestions7 } from './GeotechnicalQuestionsData7';
import { getGeotechnicalQuestions8 } from './GeotechnicalQuestionsData8';
import { getGeotechnicalQuestions9 } from './GeotechnicalQuestionsData9';
import { getGeotechnicalQuestions10 } from './GeotechnicalQuestionsData10';
import { getGeotechnicalQuestions11 } from './GeotechnicalQuestionsData11';
import { getGeotechnicalQuestions12 } from './GeotechnicalQuestionsData12';
import { getSurveyMeasurementQuestions } from './SurveyMeasurementQuestionsData';
import { getSurveyMeasurementQuestions2 } from './SurveyMeasurementQuestionsData2';
import { getSurveyMeasurementQuestions3 } from './SurveyMeasurementQuestionsData3';
import { getSurveyMeasurementQuestions4 } from './SurveyMeasurementQuestionsData4';
import { getSurveyMeasurementQuestions5 } from './SurveyMeasurementQuestionsData5';
import { getSurveyMeasurementQuestions6 } from './SurveyMeasurementQuestionsData6';
import { getSurveyMeasurementQuestions7 } from './SurveyMeasurementQuestionsData7';
import { getMetalStructureQuestions1 } from './MetalStructureQuestionsData';
import { getMetalStructureQuestions2 } from './MetalStructureQuestionsData2';
import { getMetalStructureQuestions3 } from './MetalStructureQuestionsData3';
import { getMetalStructureQuestions4 } from './MetalStructureQuestionsData4';
import { getMetalStructureQuestions5 } from './MetalStructureQuestionsData5';
import { getMechanicalElectricalQuestions1 } from './MechanicalElectricalQuestionsData';
import { getMechanicalElectricalQuestions2 } from './MechanicalElectricalQuestionsData2';
import { getMechanicalElectricalQuestions3 } from './MechanicalElectricalQuestionsData3';
import { getMechanicalElectricalQuestions4 } from './MechanicalElectricalQuestionsData4';
import { getMechanicalElectricalQuestions5 } from './MechanicalElectricalQuestionsData5';
import { getMechanicalElectricalQuestions6 } from './MechanicalElectricalQuestionsData6';

/**
 * 初始化模拟题库
 * @param forceReinit 是否强制重新初始化（会清除旧数据）
 */
export async function initMockQuestions(forceReinit: boolean = false): Promise<void> {
  try {
    // 检查是否已有题目
    const count = await questionService.getQuestionCount();

    if (forceReinit && count > 0) {
      // 强制重新初始化：先清除旧数据
      Logger.info(`[MockData] Force reinit: clearing ${count} existing questions`);
      await questionService.clearAllQuestions();
    } else if (count > 0) {
      Logger.info(`[MockData] Questions already exist: ${count}`);
      return;
    }

    // 添加模拟题目
    const mockQuestions = getMockQuestions();
    const addedCount = await questionService.addQuestions(mockQuestions);
    Logger.info(`[MockData] Added ${addedCount} mock questions`);
  } catch (error) {
    Logger.error('[MockData] Failed to init mock questions', error as Error);
  }
}

/**
 * 获取模拟题目数据
 */
function getMockQuestions(): Question[] {
  const now = Date.now();
  const questions: Question[] = [];

  // 001 基础知识
  questions.push(...getBasicKnowledgeQuestions(now));

  // 001-2 基础知识扩展（资质认定制度）
  questions.push(...getBasicKnowledgeQuestionsPart2(now));

  // 002 混凝土工程
  questions.push(...getConcreteQuestions(now));
  questions.push(...getConcreteExtendedQuestions(now));
  questions.push(...getConcreteCementQuestions(now));
  questions.push(...getConcreteCementQuestions2(now));
  questions.push(...getConcreteAdmixtureQuestions(now));
  questions.push(...getConcreteAdmixtureQuestions2(now));
  questions.push(...getConcreteAggregateQuestions(now));
  questions.push(...getConcreteStructureQuestions(now));
  questions.push(...getConcreteDurabilityQuestions(now));

  // 003 岩土工程（岩石、土工）
  questions.push(...getGeotechnicalRockQuestions(now));
  questions.push(...getGeotechnicalQuestions(now));
  questions.push(...getGeotechnicalQuestions2(now));
  questions.push(...getGeotechnicalQuestions3(now));
  questions.push(...getGeotechnicalQuestions4(now));
  questions.push(...getGeotechnicalQuestions5(now));
  questions.push(...getGeotechnicalQuestions6(now));
  questions.push(...getGeotechnicalQuestions7(now));
  questions.push(...getGeotechnicalQuestions8(now));
  questions.push(...getGeotechnicalQuestions9(now));
  questions.push(...getGeotechnicalQuestions10(now));
  questions.push(...getGeotechnicalQuestions11(now));
  questions.push(...getGeotechnicalQuestions12(now));

  // 004 岩土工程（地基与基础）
  questions.push(...getFoundationQuestions(now));

  // 005 量测
  questions.push(...getMeasurementQuestions(now));
  questions.push(...getSurveyMeasurementQuestions(now));
  questions.push(...getSurveyMeasurementQuestions2(now));
  questions.push(...getSurveyMeasurementQuestions3(now));
  questions.push(...getSurveyMeasurementQuestions4(now));
  questions.push(...getSurveyMeasurementQuestions5(now));
  questions.push(...getSurveyMeasurementQuestions6(now));
  questions.push(...getSurveyMeasurementQuestions7(now));

  // 006 金属结构
  questions.push(...getMetalStructureQuestions1(now));
  questions.push(...getMetalStructureQuestions2(now));
  questions.push(...getMetalStructureQuestions3(now));
  questions.push(...getMetalStructureQuestions4(now));
  questions.push(...getMetalStructureQuestions5(now));

  // 007 机械电气
  questions.push(...getMechanicalElectricalQuestions1(now));
  questions.push(...getMechanicalElectricalQuestions2(now));
  questions.push(...getMechanicalElectricalQuestions3(now));
  questions.push(...getMechanicalElectricalQuestions4(now));
  questions.push(...getMechanicalElectricalQuestions5(now));
  questions.push(...getMechanicalElectricalQuestions6(now));

  return questions;
}


/**
 * 基础知识题目 - 共20题
 * 单选题10题(50%)、多选题4题(20%)、判断题6题(30%)
 * 内容来源：质量检测工作基础知识（第3版）第二章 计量与数据处理
 */
function getBasicKnowledgeQuestions(timestamp: number): Question[] {
  return [
    // ========== 单选题 10题 ==========
    {
      id: 'basic_001',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '量是现象、物体或物质的可定性区别和定量确定的一种属性，它具有两个特性，一是可测，二是（）',
      options: [
        { key: 'A', content: '可比较' },
        { key: 'B', content: '可用数学形式表明其物理含义' },
        { key: 'C', content: '可计算' },
        { key: 'D', content: '可转换' }
      ],
      answer: 'B',
      analysis: '量是现象、物体或物质的可定性区别和定量确定的一种属性。它具有两个特性：一是可测；二是可用数学形式表明其物理含义。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量术语', '量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_002',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '测量是指以确定量值为目的的一组操作，计量是实现单位统一、量值准确可靠的活动。计量与测量的关系是（）',
      options: [
        { key: 'A', content: '计量就是测量' },
        { key: 'B', content: '测量是计量的依托，计量是测量的一种特殊形式' },
        { key: 'C', content: '计量包含测量' },
        { key: 'D', content: '测量和计量没有关系' }
      ],
      answer: 'B',
      analysis: '测量是计量的依托，没有测量就谈不上计量，计量的出现是测量发展的客观需要。计量是使测量结果具有真正价值的基础，计量又促进了测量的发展。也可以说，计量是测量的一种特殊形式，是保证测量统一和量值准确的测量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量术语', '测量与计量'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_003',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '计量器具是指单独地或连同辅助设备一起用以进行测量的器具。计量器具的特点不包括（）',
      options: [
        { key: 'A', content: '可直接进行测量' },
        { key: 'B', content: '可以单独地或连同辅助设备一起使用' },
        { key: 'C', content: '必须经过检定才能使用' },
        { key: 'D', content: '是一种技术工具或装置' }
      ],
      answer: 'C',
      analysis: '计量器具是指单独地或连同辅助设备一起用以进行测量的器具。其特点是：①可直接进行测量；②可以单独地或连同辅助设备一起使用的一种技术工具或装置。并非所有计量器具都必须经过检定才能使用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量器具'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_004',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '计量基准一般分为国家计量基准、副基准和工作基准。其中（）是全国量值溯源的最终端，是统一全国量值的最高依据。',
      options: [
        { key: 'A', content: '工作基准' },
        { key: 'B', content: '副基准' },
        { key: 'C', content: '国家计量基准' },
        { key: 'D', content: '参考标准' }
      ],
      answer: 'C',
      analysis: '国家计量基准是全国量值溯源的最终端，它是统一全国量值的最高依据。建立副基准的目的主要是代替国家计量基准的日常使用，也可用于验证国家计量基准的变化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量基准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_005',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '显示装置的分辨力是指显示装置能有效辨别的最小示值差，是显示装置中对其最小示值差的辨别能力。通常模拟式显示装置的分辨力为标尺分度值的（）',
      options: [
        { key: 'A', content: '1/5' },
        { key: 'B', content: '1/2' },
        { key: 'C', content: '1/10' },
        { key: 'D', content: '1/4' }
      ],
      answer: 'B',
      analysis: '通常模拟式显示装置的分辨力为标尺分度值的1/2，即用肉眼可以分辨到一个分度值的1/2。对于数字式显示装置的分辨力为末位数字的一个数码，对半数字式的显示装置的分辨力为末位数字的一个分度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量性能', '分辨力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_006',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '灵敏度是指测量仪器响应的变化除以对应的激励变化。它反映测量仪器被测量（输入）变化引起仪器示值（输出）变化的程度。灵敏度是测量仪器中一个十分重要的（）',
      options: [
        { key: 'A', content: '计量特性' },
        { key: 'B', content: '技术指标' },
        { key: 'C', content: '性能参数' },
        { key: 'D', content: '质量标准' }
      ],
      answer: 'A',
      analysis: '灵敏度是测量仪器中一个十分重要的计量特性，它是反映测量仪器性能的重要指标，但有时灵敏度并不是越高越好。为了方便读数，使示值处于稳定，还需要特意降低灵敏度值。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '计量性能', '灵敏度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_007',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '鉴别力阈是指使测量仪器产生未察觉的响应变化的最大激励变化，这种激励变化应缓慢而单调地进行。它是指当测量仪器在某一示值给以一定的输入，确定某激励值，这种激励再缓慢从同一方向逐步增加，开始为未察觉响应的变化，当测量仪器的输出开始有可察觉的响应变化时，读取该激励值，此输入的激励变化称为（）',
      options: [
        { key: 'A', content: '灵敏度' },
        { key: 'B', content: '分辨力' },
        { key: 'C', content: '鉴别力阈' },
        { key: 'D', content: '响应时间' }
      ],
      answer: 'C',
      analysis: '鉴别力阈也可简称鉴别力，同样可以在反行程进行。例如，在一台天平的指针产生未察觉位移的最大负荷变化为10mg，则此天平的鉴别力阈为10mg。',
      difficulty: DifficultyLevel.HARD,
      tags: ['基础知识', '计量性能', '鉴别力阈'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_008',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '响应时间是指激励受到规定突变的瞬间，与响应达到并保持其最终稳定值规定极限内的瞬间，这两者之间的时间间隔。响应时间是测量仪器动态响应特性的重要参数之一。响应时间是指输入输出关系的响应特性中，考核随着激励的变化其响应时间反映的能力。当然越短越好，响应时间短则反映指示灵敏快捷，有利于进行快速测量或调节控制。如动圈式温度指示调节仪，其性能上有一条规定，即阻尼时间，要求给仪表突然加上相当于标尺几何中心点的被测量（毫伏值或电阻值）的瞬时起至指针距最后静止位置不大于标尺弧长±10%的范围内为止，这个时间间隔对张丝支承仪表不超过（）',
      options: [
        { key: 'A', content: '5s' },
        { key: 'B', content: '7s' },
        { key: 'C', content: '10s' },
        { key: 'D', content: '15s' }
      ],
      answer: 'B',
      analysis: '这个时间间隔对张丝支承仪表不超过7s，对轴承、轴尖支承仪表不超过10s，这一阻尼时间就是响应时间。正是由于动圈仪表是由张丝或轴承支承，指针在测量过程中要稳定下来需要一定时间，其调节性能不够理想，应用范围受到一定限制。',
      difficulty: DifficultyLevel.HARD,
      tags: ['基础知识', '计量性能', '响应时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_009',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '稳定性是指测量仪器保持其计量特性随时间恒定的能力。通常稳定性是指测量仪器的计量特性随时间不变化的能力。对于测量仪器，尤其是基准、测量标准或某些实物量具，稳定性是重要的计量性能之一，示值的稳定是保证量值准确的基础。测量仪器产生不稳定的因素很多，主要原因是（）',
      options: [
        { key: 'A', content: '环境温度变化' },
        { key: 'B', content: '元器件的老化、零部件的磨损以及使用、储存、维护工作不仔细等' },
        { key: 'C', content: '操作人员技术水平' },
        { key: 'D', content: '电源电压波动' }
      ],
      answer: 'B',
      analysis: '测量仪器产生不稳定的因素很多，主要原因是元器件的老化、零部件的磨损以及使用、储存、维护工作不仔细等。对测量仪器进行的周期检定或校准，就是对其稳定性的一种考核。稳定性也是科学合理地确定检定周期的重要依据之一。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量性能', '稳定性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_010',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '漂移是指测量仪器计量特性的慢变化。这是反映在规定条件下，测量仪器计量特性随时间的慢变化，如在几分钟或多少小时内保持其计量特性恒定能力的一个术语。如有的测量仪器所指的零点漂移，有的线性测量仪器静态特性随时间变化的量程漂移。如原子吸收光谱仪的一种冷原子吸收测汞仪，规定在外接交流稳压器，输出端接10mV记录仪，仪器预热2h后，测定0.5h内零点的最大漂移应小于（）',
      options: [
        { key: 'A', content: '0.05mV' },
        { key: 'B', content: '0.1mV' },
        { key: 'C', content: '0.2mV' },
        { key: 'D', content: '0.5mV' }
      ],
      answer: 'B',
      analysis: '如原子吸收光谱仪的一种冷原子吸收测汞仪，规定在外接交流稳压器，输出端接10mV记录仪，仪器预热2h后，测定0.5h内零点的最大漂移应小于0.1mV。',
      difficulty: DifficultyLevel.HARD,
      tags: ['基础知识', '计量性能', '漂移'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 4题 ==========
    {
      id: 'basic_011',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '计量器具的计量性能是反映计量器具计量特性和功能的各种指标与参数，它们将直接影响计量结果。主要包括（）',
      options: [
        { key: 'A', content: '测量范围、稳定性、超然性' },
        { key: 'B', content: '灵敏度、鉴别力阈、分辨力' },
        { key: 'C', content: '响应、漂移、准确度' },
        { key: 'D', content: '最大允许误差' }
      ],
      answer: 'A,B,C,D',
      analysis: '计量器具的计量性能主要包括：测量范围、稳定性、超然性、灵敏度、鉴别力阈、分辨力、响应、漂移、准确度、最大允许误差等。为了达到计量的预定要求，计量器具必须具有符合规范的计量特性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量性能'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_012',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '计量基准一般分为（）',
      options: [
        { key: 'A', content: '国家计量基准' },
        { key: 'B', content: '副基准' },
        { key: 'C', content: '工作基准' },
        { key: 'D', content: '参考标准' }
      ],
      answer: 'A,B,C',
      analysis: '计量基准一般分为国家计量基准、副基准和工作基准。国家计量基准是用来复现和保存计量单位，具有现代科学技术所能达到的最高准确度，经国家鉴定并批准，作为统一全国计量单位量值的最高依据的计量器具。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '计量基准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_013',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '测量设备涵盖的范围不仅包括所有与测量活动相关的硬件设备，而且与测量硬件相关的各种必要软件资料数据等也属于测量设备的组成部分。测量设备是测量仪器、测量标准、参考物质、辅助设备以及进行测量所必需资源的总称。测量系统可以包含（）',
      options: [
        { key: 'A', content: '实物量具' },
        { key: 'B', content: '化学试剂' },
        { key: 'C', content: '测量仪器' },
        { key: 'D', content: '辅助设备' }
      ],
      answer: 'A,B,C,D',
      analysis: '测量系统就是组装起来进行特定测量的全套测量仪器和其他设备。测量系统可以包含实物量具和化学试剂。固定安装着的测量系统称为测量设备。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '测量系统', '测量设备'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_014',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '要注意灵敏度与鉴别力阈的区别和关系。这是两个概念，灵敏度是被测量（输入量）变化引起了测量仪器示值（输出量）变化的程度，鉴别力阈是引起测量仪器示值（输出量）未察觉变化时被测量（输入量）的最大变化。但二者是相关的，下列说法正确的是（）',
      options: [
        { key: 'A', content: '灵敏度越高，其鉴别力阈越小' },
        { key: 'B', content: '灵敏度越低，其鉴别力阈越大' },
        { key: 'C', content: '鉴别力阈有时人们也习惯称为灵敏阈、灵敏限' },
        { key: 'D', content: '灵敏度和鉴别力阈是同一个概念' }
      ],
      answer: 'A,B,C',
      analysis: '灵敏度越高，其鉴别力阈越小；灵敏度越低，其鉴别力阈越大。鉴别力阈有时人们也习惯称为灵敏阈、灵敏限，是同一个概念。产生鉴别力阈的原因可能与噪声（内部、外部的）、摩擦、阻尼、惯性等有关，也与激励值有关。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量性能', '灵敏度', '鉴别力阈'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 6题 ==========
    {
      id: 'basic_015',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '量的大小和量值的概念是有区别的。任意一个量，相对来说其大小是不变的，是客观存在的，但其量值将随单位的不同而不同；量值只是在一定单位下表示其量大小的一种表达形式。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。如1m=1000mm，单位不同，同一物体可以得到不同的量值，但其量本身的大小并无变化。量的纯数部分，即量值与单位的比值称为量的数值。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量术语', '量与量值'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_016',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '响应特性是指在确定条件下，激励与对应响应之间的关系。这里的激励就是输入量或输入信号，响应就是输出量或输出信号，而响应特性就是输入输出特性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。对一个完整的测量仪器来说，激励就是被测量，而响应就是它对应地给出的示值。显然，只有准确地确定了测量仪器的响应特性，其示值才能准确地反映被测量值。因此，可以说响应特性是测量仪器最基本的特性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量性能', '响应特性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_017',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '灵敏度越高越好，不需要考虑其他因素。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。灵敏度是测量仪器中一个十分重要的计量特性，它是反映测量仪器性能的重要指标，但有时灵敏度并不是越高越好。为了方便读数，使示值处于稳定，还需要特意降低灵敏度值。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '计量性能', '灵敏度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_018',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '超然性是指测量仪器不改变被测量的能力。这是测量仪器在设计和使用中应考虑的一个重要因素。最好是不影响或使其影响减小到最少。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。实际上，在进行测量时，测量仪器几乎不可避免地要影响着被测量，存在着超然性，因为测量仪器与被测量之间必然有能量和物质的消耗，或仪器结构、使用方法对被测量的影响。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量性能', '超然性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_019',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '标称范围是指测量仪器的操纵器件调到特定位置时可得到的示值范围。量程是标称范围两极限之差的模。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。如光学高温计的示值范围为0~1400℃，而其测量范围为700~1400℃，量程则为1400℃-700℃=700℃。有的计量器具的示值范围和测量范围可能相同，如最低值为-20℃、最高值为100℃的水银温度计，其示值范围和测量范围均为-20~100℃，其量程为120℃。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量性能', '标称范围', '量程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_020',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '极限条件是指测量仪器的规定计量特性不受损也不降低，其后仍可在额定操作条件下运行而能承受的极端条件。储存、运输和运行的极限条件可以各不相同，极限条件可包括被测量和影响量的极限值。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。极限条件是指测量仪器的规定计量特性不受损也不降低，其后仍可在额定操作条件下运行而能承受的极端条件。储存、运输和运行的极限条件可以各不相同，极限条件可包括被测量和影响量的极限值。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量性能', '极限条件'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第一章 绪论 - 单选题 10题 ==========
    {
      id: 'basic_021',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '2008年11月水利部36号令颁布了《水利工程质量检测管理规定》。该规定明确水利工程质量检测的对象是"水利工程实体以及用于水利工程的原材料、中间产品、金属结构和机电设备"。第三条规定，从事水利工程质量检测的检测单位"应当按照本规定取得资质，并在资质等级许可的范围内承担质量检测业务"。将水利工程质量检测单位的资质分为（）个类别。',
      options: [
        { key: 'A', content: '3' },
        { key: 'B', content: '4' },
        { key: 'C', content: '5' },
        { key: 'D', content: '6' }
      ],
      answer: 'C',
      analysis: '将水利工程质量检测单位的资质分为岩土工程、混凝土工程、金属结构、机械电气和量测共5个类别，每个类别分别分为甲级、乙级2个等级。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '质量检测管理规定', '资质分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_022',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '水利工程质量检测单位的资质每个类别分为（）个等级。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '3' },
        { key: 'C', content: '4' },
        { key: 'D', content: '5' }
      ],
      answer: 'A',
      analysis: '水利工程质量检测单位的资质每个类别分别分为甲级、乙级2个等级。取得甲级资质的检测单位可以承担各等级水利工程的质量检测业务。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '质量检测管理规定', '资质等级'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_023',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '水利工程的主要建筑物是指"失事以后将造成下游灾害或者严重影响工程功能和效益的建筑物"，不包括以下哪项？',
      options: [
        { key: 'A', content: '大坝、泄洪建筑物' },
        { key: 'B', content: '输水建筑物' },
        { key: 'C', content: '电站厂房和泵站' },
        { key: 'D', content: '临时施工道路' }
      ],
      answer: 'D',
      analysis: '水利工程的主要建筑物是指"失事以后将造成下游灾害或者严重影响工程功能和效益的建筑物，如大坝、泄洪建筑物、输水建筑物、电站厂房和泵站等"。临时施工道路不属于主要建筑物。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '主要建筑物'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_024',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '从事水利工程质量检测的专业技术人员（以下简称检测人员），应当具备相应的质量检测知识和能力，并按照国家职业资格管理的规定取得（）。',
      options: [
        { key: 'A', content: '技术职称' },
        { key: 'B', content: '从业资格' },
        { key: 'C', content: '学历证书' },
        { key: 'D', content: '培训证书' }
      ],
      answer: 'B',
      analysis: '第四条规定"从事水利工程质量检测的专业技术人员（以下简称检测人员），应当具备相应的质量检测知识和能力，并按照国家职业资格管理的规定取得从业资格"。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '检测人员', '从业资格'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_025',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '2018年4月4号，水利部发布了"水利工程质量检测单位资质等级标准的公告（水利部公告[2018]3号）"，明确了水利工程质量检测单位资质等级标准，其中检测能力要求中新增项目和参数于（）年水利工程质量检测单位资质审批时使用。',
      options: [
        { key: 'A', content: '2018' },
        { key: 'B', content: '2019' },
        { key: 'C', content: '2020' },
        { key: 'D', content: '2021' }
      ],
      answer: 'B',
      analysis: '2018年4月4号水利部公告明确了水利工程质量检测单位资质等级标准，其中检测能力要求中新增项目和参数于2019年水利工程质量检测单位资质审批时使用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '资质等级标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_026',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '质量检测时，标准的使用一般遵循以下规则：当检测对象有水利部发布实行的行业标准时，应采用（）。',
      options: [
        { key: 'A', content: '国家标准' },
        { key: 'B', content: '水利部发布的行业标准' },
        { key: 'C', content: '企业标准' },
        { key: 'D', content: '地方标准' }
      ],
      answer: 'B',
      analysis: '质量检测时，标准的使用一般遵循以下规则：当检测对象有水利部发布实行的行业标准时，应采用水利部发布的行业标准。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '标准使用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_027',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '水利工程一般不采用地方标准，只有地方标准的要求高于行业标准时，才采用（）。',
      options: [
        { key: 'A', content: '国家标准' },
        { key: 'B', content: '行业标准' },
        { key: 'C', content: '地方标准' },
        { key: 'D', content: '企业标准' }
      ],
      answer: 'C',
      analysis: '水利工程一般不采用地方标准，只有地方标准的要求高于行业标准时，才采用地方标准。在检测标准选择中，对相关技术指标应以技术兼容为最优原则。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '标准使用', '地方标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_028',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '质量检测委托合同应包括的事项和内容中，不包括以下哪项？',
      options: [
        { key: 'A', content: '检测工程名称' },
        { key: 'B', content: '检测具体项目内容和要求' },
        { key: 'C', content: '检测人员的工资待遇' },
        { key: 'D', content: '检测费用及其支付方式' }
      ],
      answer: 'C',
      analysis: '质量检测委托合同应包括：检测工程名称、检测具体项目内容和要求、检测的依据、检测方法、检测仪器设备、检测抽样方式、完成检测的时间和检测成果的交付要求、检测费用及其支付方式、违约责任、委托方与水利工程质量检测单位代表签章和时间、其他必要的约定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '委托合同'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_029',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '检测的公正性表现为以下方面：检测工作以法律为准绑，以技术标准为依据，检测结果遵循以（）为准的判定原则，客观、公正。',
      options: [
        { key: 'A', content: '经验' },
        { key: 'B', content: '数据' },
        { key: 'C', content: '领导意见' },
        { key: 'D', content: '委托方要求' }
      ],
      answer: 'B',
      analysis: '检测的公正性表现为：其一，检测工作以法律为准绑，以技术标准为依据，检测结果遵循以数据为准的判定原则，客观、公正。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '检测公正性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_030',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '检测是对实体一种或多种性能进行检查、度量、测量和试验的活动。检测的目的是希望了解检测对象（）的状况。',
      options: [
        { key: 'A', content: '外观' },
        { key: 'B', content: '某一性能或某些性能' },
        { key: 'C', content: '使用寿命' },
        { key: 'D', content: '经济价值' }
      ],
      answer: 'B',
      analysis: '检测是对实体一种或多种性能进行检查、度量、测量和试验的活动。检测的目的是希望了解检测对象某一性能或某些性能的状况。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '检测定义'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第一章 绪论 - 多选题 4题 ==========
    {
      id: 'basic_031',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '水利水电工程质量检测的依据包括以下几方面（）',
      options: [
        { key: 'A', content: '法律、法规、规章的规定' },
        { key: 'B', content: '国家标准、水利水电行业标准' },
        { key: 'C', content: '工程承包合同认定的其他标准和文件' },
        { key: 'D', content: '批准的设计文件、金属结构、机电设备安装等技术说明书' }
      ],
      answer: 'A,B,C,D',
      analysis: '水利水电工程质量检测的依据包括以下几方面：(1)法律、法规、规章的规定；(2)国家标准、水利水电行业标准；(3)工程承包合同认定的其他标准和文件；(4)批准的设计文件、金属结构、机电设备安装等技术说明书；(5)其他特定要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测依据'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_032',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '水利水电工程质量检测的特点包括（）',
      options: [
        { key: 'A', content: '科学性' },
        { key: 'B', content: '公正性' },
        { key: 'C', content: '及时性' },
        { key: 'D', content: '权威性' }
      ],
      answer: 'A,B,C,D',
      analysis: '水利水电工程质量检测的特点包括：科学性、公正性、及时性、权威性、局限性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_033',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '质量检测的作用包括（）',
      options: [
        { key: 'A', content: '检测是施工过程质量保证的重要手段' },
        { key: 'B', content: '检测是工程质量监督和监理的重要手段' },
        { key: 'C', content: '检测结果是工程质量评定、工程验收和工程质量纠纷评判的依据' },
        { key: 'D', content: '检测结果是质量改进的科学依据' }
      ],
      answer: 'A,B,C,D',
      analysis: '质量检测的作用包括：(一)检测是施工过程质量保证的重要手段；(二)检测是工程质量监督和监理的重要手段；(三)检测结果是工程质量评定、工程验收和工程质量纠纷评判的依据；(四)检测结果是质量改进的科学依据；(五)检测结果是进行质量事故处理的重要依据。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测作用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_034',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '质量检测的步骤和要求包括（）',
      options: [
        { key: 'A', content: '签订合同' },
        { key: 'B', content: '质量检测的准备' },
        { key: 'C', content: '检测试验的实施' },
        { key: 'D', content: '检测数据的处理和检测报告的编制' }
      ],
      answer: 'A,B,C,D',
      analysis: '质量检测的步骤和要求包括：(一)签订合同；(二)质量检测的准备；(三)检测试验的实施；(四)检测数据的处理和检测报告的编制。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '检测步骤'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第一章 绪论 - 判断题 6题 ==========
    {
      id: 'basic_035',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '检验是对实体的一种或多种性能进行检查、度量、测量和试验，并将结果与规定要求进行比较，以确定每项特性合格情况所进行的活动。检验的目的是要求判定检测的对象是否合格。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检验的目的是要求判定检测的对象是否合格。对所检验对象性能（指标）的要求，应在技术标准、规范或经批准的设计文件中进行具体的规定。检验应包括以下内容：(1)确定检测对象的质量标准；(2)采用规定的方法对检测对象进行检测；(3)将检测结果与标准指标进行比较；(4)做出检测对象是否合格的判断。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检验定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_036',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '工程质量检测单位具备相应资质，工程质量检测人员持证上岗，检测工作以法律为准绳，检测的过程是严格执行法律法规的过程，检测结果具有法律效力，这就是检测工作的权威性特征。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。权威性是检测工作的重要特征之一。工程质量检测单位具备相应资质，工程质量检测人员持证上岗，检测工作以法律为准绳，检测的过程是严格执行法律法规的过程，检测结果具有法律效力。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测权威性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_037',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '检测具有局限性。一般说来，检测只能针对样品进行，而取样本身往往带有人员的主观选择性，很难真正做到随机性，用样品的质量特性来代替检验批产品的质量特性，也总会有一定的偏离。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检测具有局限性。一般说来，检测只能针对样品进行，而取样本身往往带有人员的主观选择性，很难真正做到随机性，用样品的质量特性来代替检验批产品的质量特性，也总会有一定的偏离，如果抽样的代表性偏差大，检测结果对产品质量甚至可能出现误判。因此，质量检测具有局限性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测局限性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_038',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '第三方质量检测单位与被检测单位不存在任何经济利益关系，站在第三者的立场上，进行实事求是的检测，做出不带任何偏见、符合客观实际的判断和公正的评价，这也体现了检测的公正性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检测的公正性还表现为：政府质量监督单位、建设单位或监理单位必要时可以委托具备相应资质的工程质量检测单位（第三方）进行质量检测，第三方质量检测单位与被检测单位不存在任何经济利益关系，站在第三者的立场上，进行实事求是的检测，做出不带任何偏见、符合客观实际的判断和公正的评价，这也体现了检测的公正性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测公正性', '第三方检测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_039',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '在任何情况下，检测应使用现行有效的标准。除非委托人为某种特殊目的，明确要求采用某过期标准对检测对象进行检测，或对标准的某条款加以修改使用，这时检验检测机构应负有提醒和明确责任的义务，在合同中特别说明该情况，并应明确告知委托人，所出具的检测报告按规定不能加盖资质认证CMA印章。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在任何情况下，检测应使用现行有效的标准。除非委托人为某种特殊目的，明确要求采用某过期标准对检测对象进行检测，或对标准的某条款加以修改使用，这时检验检测机构应负有提醒和明确责任的义务，在合同中特别说明该情况，并应明确告知委托人，所出具的检测报告按规定不能加盖资质认证CMA印章。',
      difficulty: DifficultyLevel.HARD,
      tags: ['基础知识', '标准使用', 'CMA'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_040',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第一章 绪论',
      content: '发生重大质量、安全事故，需要通过质量检测查找事故成因，分析事故的影响面和严重程度，追究责任，确定整改或报废范围。这说明检测结果是进行质量事故处理的重要依据。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检测结果是进行质量事故处理的重要依据。发生重大质量、安全事故，需要通过质量检测查找事故成因，分析事故的影响面和严重程度，追究责任，确定整改或报废范围。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '检测作用', '事故处理'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第二章 计量与数据处理 - 单选题 10题 ==========
    {
      id: 'basic_041',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '计量的内容通常可概括为（）个方面。',
      options: [
        { key: 'A', content: '4' },
        { key: 'B', content: '5' },
        { key: 'C', content: '6' },
        { key: 'D', content: '7' }
      ],
      answer: 'C',
      analysis: '计量的内容通常可概括为6个方面：(1)计量单位与单位制；(2)计量器具（或测量仪器），包括实现或复现计量单位的计量基准、计量标准与工作计量器具；(3)量值传递与溯源，包括检定、校准、测试、检验与检测；(4)物理常量、材料与物理特性的测定；(5)测量不确定度、数据处理与测量理论及其方法；(6)计量管理，包括计量保证与计量监督等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_042',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '根据其作用与地位，计量可分为科学计量、工程计量和法制计量3类，分别代表计量的（）3个方面。',
      options: [
        { key: 'A', content: '准确性、一致性、溯源性' },
        { key: 'B', content: '基础性、应用性和公益性' },
        { key: 'C', content: '科学性、实用性和法律性' },
        { key: 'D', content: '理论性、技术性和管理性' }
      ],
      answer: 'B',
      analysis: '根据其作用与地位，计量可分为科学计量、工程计量和法制计量3类，分别代表计量的基础性、应用性和公益性3个方面。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_043',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '计量的特点可以归纳为准确性、一致性、溯源性及法制性（）个方面。',
      options: [
        { key: 'A', content: '3' },
        { key: 'B', content: '4' },
        { key: 'C', content: '5' },
        { key: 'D', content: '6' }
      ],
      answer: 'B',
      analysis: '计量的特点可以归纳为准确性、一致性、溯源性及法制性4个方面。准确性是计量的基本特点，是计量科学的命脉，计量技术工作的核心。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '计量特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_044',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '测量传感器是提供与输入量有确定关系的输出量的器件。由于某些被测量不宜用直接比较的方法测量，往往必须将其变换成具有一定函数关系的同类量或其他量后，才能进行测量。如压电传感器的作用就是将难以直接测量的压力信号转变成容易测量的（）信号。',
      options: [
        { key: 'A', content: '温度' },
        { key: 'B', content: '电流（压）' },
        { key: 'C', content: '位移' },
        { key: 'D', content: '频率' }
      ],
      answer: 'B',
      analysis: '压电传感器的作用就是将难以直接测量的压力信号转变成容易测量的电流（压）信号。传感器的基本类型，按测量原理分类，可分为电阻式传感器、电感式传感器、电容式传感器、光电式传感器、陀螺仪式传感器等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '测量传感器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_045',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '实物量具是使用时以固定形态复现或提供给定量的一个或多个已知值的器具。上述"固定形态"是指固定的物理和化学形态。例如，砝码、量块等本身就是某个确定的量值（质量和长度量），可以作为参考量值提供给测量仪器，与被测量进行比较，所以它们属于（）。',
      options: [
        { key: 'A', content: '测量仪器' },
        { key: 'B', content: '量具' },
        { key: 'C', content: '传感器' },
        { key: 'D', content: '标准物质' }
      ],
      answer: 'B',
      analysis: '砝码、量块等本身就是某个确定的量值（质量和长度量），可以作为参考量值提供给测量仪器，与被测量进行比较，所以它们属于量具。而天平、玻璃水银温度计等，由于它们本身不能提供测量所需的参考量值，所以属于测量仪器。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '实物量具'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_046',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '计量器具的检定是查明和确认计量器具是否符合法定要求的程序，它包括检查、加标记和（或）出具检定证书。为使量值合理有效地传递，确保量值的统一，正式的量值传递工作必须按照（）进行。',
      options: [
        { key: 'A', content: '企业标准' },
        { key: 'B', content: '行业规范' },
        { key: 'C', content: '国家计量检定系统' },
        { key: 'D', content: '地方规定' }
      ],
      answer: 'C',
      analysis: '为使量值合理有效地传递，确保量值的统一，正式的量值传递工作必须按照国家计量检定系统进行。国家计量检定系统（过去曾称为量值传递系统）是由国务院计量行政部门组织制定并批准发布。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量检定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_047',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '标准物质是具有一种或多种足够均匀和很好地确定了的特性，用以校准测量装置、评价测量方法或给材料赋值的一种材料或物质，叫作标准物质或参考物质。标准物质是实现准确一致的测量，保证量值有效传递的（）。',
      options: [
        { key: 'A', content: '计量标准' },
        { key: 'B', content: '测量方法' },
        { key: 'C', content: '检测手段' },
        { key: 'D', content: '质量保证' }
      ],
      answer: 'A',
      analysis: '标准物质是实现准确一致的测量，保证量值有效传递的计量标准。在实际测量中，通过使用不同等级的标准物质，按准确度由低到高，逐级进行量值的追溯，直到国际基本单位，这一过程称为量值的"溯源过程"。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '标准物质'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_048',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '测量不确定度是表征合理赋予被测量之值的分散性，与测量结果相联系的参数。从词义上可理解为是对测量结果可信性、有效性的怀疑程度或不肯定程度，是定量说明测量结果质量的一个参数。用标准差表示的测量不确定度，就是（）。',
      options: [
        { key: 'A', content: '扩展不确定度' },
        { key: 'B', content: '标准不确定度' },
        { key: 'C', content: '合成不确定度' },
        { key: 'D', content: '相对不确定度' }
      ],
      answer: 'B',
      analysis: '用标准差表示的测量不确定度，就是标准不确定度。当测量结果是由若干个其他量的值求得时，按其他各量的方差和协方差算得的标准不确定度，就是合成不确定度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '测量不确定度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_049',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '校准测量能力是指通常提供给用户的最高校准与检测水平，它用置信概率为（）的扩展不确定度表示，有时称为最佳测量能力。',
      options: [
        { key: 'A', content: '68%' },
        { key: 'B', content: '90%' },
        { key: 'C', content: '95%' },
        { key: 'D', content: '99%' }
      ],
      answer: 'C',
      analysis: '校准测量能力是指通常提供给用户的最高校准与检测水平，它用置信概率为95%的扩展不确定度表示，有时称为最佳测量能力。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '校准测量能力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_050',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '国际单位制（SI）是由国际计量大会（CGPM）采纳和推荐的一种一贯单位制。SI是国际单位制的国际通用符号。SI单位的特点主要体现在（）。',
      options: [
        { key: 'A', content: '复杂性、专业性和地区性' },
        { key: 'B', content: '通用性、简明性、实用性和准确性' },
        { key: 'C', content: '科学性、权威性和强制性' },
        { key: 'D', content: '统一性、标准性和规范性' }
      ],
      answer: 'B',
      analysis: '国际单位制（SI）是由国际计量大会（CGPM）采纳和推荐的一种一贯单位制。SI是国际单位制的国际通用符号。SI单位的特点主要体现在通用性、简明性、实用性和准确性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '国际单位制'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第二章 计量与数据处理 - 多选题 4题 ==========
    {
      id: 'basic_051',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '计量的分类包括（）',
      options: [
        { key: 'A', content: '科学计量' },
        { key: 'B', content: '工程计量' },
        { key: 'C', content: '法制计量' },
        { key: 'D', content: '商业计量' }
      ],
      answer: 'A,B,C',
      analysis: '根据其作用与地位，计量可分为科学计量、工程计量和法制计量3类。科学计量是指基础性、探索性、先行性的计量科学研究；工程计量又称工业计量，是指各种工程、工业、企业中的实用计量；法制计量是指由政府或授权机构根据法制、技术和行政的需要进行强制管理的一种社会公用事业。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '计量分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_052',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '传感器的基本类型，按测量原理分类，可分为（）',
      options: [
        { key: 'A', content: '电阻式传感器' },
        { key: 'B', content: '电感式传感器' },
        { key: 'C', content: '电容式传感器' },
        { key: 'D', content: '光电式传感器' }
      ],
      answer: 'A,B,C,D',
      analysis: '传感器的基本类型，按测量原理分类，可分为电阻式传感器、电感式传感器、电容式传感器、光电式传感器、陀螺仪式传感器等；按被测量分类，可分为温度传感器、力学传感器、电学传感器、位移传感器、速度传感器等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '传感器分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_053',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '标准物质可以分为三大类（）',
      options: [
        { key: 'A', content: '化学成分标准物质，如金属、地质、环境等化学成分标准物质' },
        { key: 'B', content: '物理化学特性标准物质，如pH值、燃烧热、聚合物分子量标准物质等' },
        { key: 'C', content: '工程技术特性标准物质，如粒度标准物质、标准橡胶、标准光敏褪色纸等' },
        { key: 'D', content: '生物医学标准物质' }
      ],
      answer: 'A,B,C',
      analysis: '目前标准物质可以分为三大类：①化学成分标准物质，如金属、地质、环境等化学成分标准物质；②物理化学特性标准物质，如pH值、燃烧热、聚合物分子量标准物质等；③工程技术特性标准物质，如粒度标准物质、标准橡胶、标准光敏褪色纸等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '标准物质分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_054',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '计量的特点包括（）',
      options: [
        { key: 'A', content: '准确性' },
        { key: 'B', content: '一致性' },
        { key: 'C', content: '溯源性' },
        { key: 'D', content: '法制性' }
      ],
      answer: 'A,B,C,D',
      analysis: '计量的特点可以归纳为准确性、一致性、溯源性及法制性4个方面。准确性是计量的基本特点，是计量科学的命脉，计量技术工作的核心。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '计量特点'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第二章 计量与数据处理 - 判断题 6题 ==========
    {
      id: 'basic_055',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '准确性是计量的基本特点，是计量科学的命脉，计量技术工作的核心。它是指测量结果与被测量真值的一致程度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。准确性是计量的基本特点，是计量科学的命脉，计量技术工作的核心。它是指测量结果与被测量真值的一致程度。由于实际上不存在完全准确无误的测量，因此在给出量值的同时，必须给出适应于应用目的或实际需要的不确定度或可能的误差范围。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '计量特点', '准确性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_056',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '溯源等级图是指一种代表等级顺序的框图，用以表明计量器具的计量特性与给定量的基准之间的关系。建立该图的目的是要对所有的测量（包括最普通的测量），在其溯源到基准的途径中尽可能减少测量误差又能给出最大的可信度。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。溯源等级图是指一种代表等级顺序的框图，用以表明计量器具的计量特性与给定量的基准之间的关系。建立该图的目的是要对所有的测量（包括最普通的测量），在其溯源到基准的途径中尽可能减少测量误差又能给出最大的可信度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '溯源等级图'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_057',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '测量仪器准确度是指测量仪器给出接近于真值的响应能力，准确度是定性的概念。准确度等级是指符合一定的计量要求，使误差保持在规定极限以内的测量仪器的等别、级别，准确度等级通常按约定注以数字或符号，并称为等级指标。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。测量仪器准确度是指测量仪器给出接近于真值的响应能力，准确度是定性的概念。准确度等级是指符合一定的计量要求，使误差保持在规定极限以内的测量仪器的等别、级别，准确度等级通常按约定注以数字或符号，并称为等级指标。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '测量仪器准确度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_058',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '测量结果的重复性是指在相同测量条件下，对同一被测量进行连续多次测量所得结果之间的一致性，这些条件称为重复性条件。重复性条件包括相同的测量程序、相同的观测者、在相同的条件下使用相同的测量仪器、相同地点、在短时间内重复测量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。测量结果的重复性是指在相同测量条件下，对同一被测量进行连续多次测量所得结果之间的一致性，这些条件称为重复性条件。重复性条件包括相同的测量程序、相同的观测者、在相同的条件下使用相同的测量仪器、相同地点、在短时间内重复测量。重复性可以用测量结果的分散性定量地表示。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '测量重复性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_059',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '测量结果的复现性是指在改变了的测量条件下，同一被测量的测量结果之间的一致性。在给出复现性时，应有效地说明改变条件的详细情况。改变条件可包括测量原理、测量方法、观测者、测量仪器、参考测量标准、地点、使用条件、时间。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。测量结果的复现性是指在改变了的测量条件下，同一被测量的测量结果之间的一致性。在给出复现性时，应有效地说明改变条件的详细情况。改变条件可包括测量原理、测量方法、观测者、测量仪器、参考测量标准、地点、使用条件、时间。复现性可用测量结果的分散性定量地表示。测量结果在这里通常理解为已修正结果。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '测量复现性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_060',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '测量准确度是指测量结果与被测量真值之间的一致程度，准确度不能代替精密度，准确度是一个定性概念。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。测量准确度是指测量结果与被测量真值之间的一致程度，准确度不能代替精密度，准确度是一个定性概念。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '测量准确度'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第二章 计量与数据处理（统计量与抽样方法）- 单选题 10题 ==========
    {
      id: 'basic_061',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '样本均值也称样本平均数，它是样本数据的算术平均数。样本均值是使用最为广泛的反映数据集中位置的度量。它的计算比较简单，但缺点是（）。',
      options: [
        { key: 'A', content: '计算复杂' },
        { key: 'B', content: '受极端值的影响比较大' },
        { key: 'C', content: '不能反映数据特征' },
        { key: 'D', content: '需要大量样本' }
      ],
      answer: 'B',
      analysis: '样本均值是使用最为广泛的反映数据集中位置的度量。它的计算比较简单，但缺点是它受极端值的影响比较大。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '统计量', '样本均值'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_062',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '样本中位数是表示数据集中位置的另一种重要的度量。与均值相比，中位数不受极端值的影响。因此，在某些场合，中位数比均值更能代表（）。',
      options: [
        { key: 'A', content: '数据的最大值' },
        { key: 'B', content: '数据的最小值' },
        { key: 'C', content: '一组数据的中间位置' },
        { key: 'D', content: '数据的分散程度' }
      ],
      answer: 'C',
      analysis: '与均值相比，中位数不受极端值的影响。因此，在某些场合，中位数比均值更能代表一组数据的中间位置。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '统计量', '样本中位数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_063',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '样本众数是样本数据中出现频率最高的值，常记为Mod。样本众数的主要缺点是（）。',
      options: [
        { key: 'A', content: '计算复杂' },
        { key: 'B', content: '受数据的随机性影响比较大，有时也不唯一' },
        { key: 'C', content: '不能反映数据特征' },
        { key: 'D', content: '受极端值影响大' }
      ],
      answer: 'B',
      analysis: '样本众数是样本数据中出现频率最高的值，常记为Mod。样本众数的主要缺点是受数据的随机性影响比较大，有时也不唯一。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '统计量', '样本众数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_064',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '样本极差即是样本数据中最大值与最小值之差，用R表示。样本极差只利用了数据中两个极端值，因此它对数据信息的利用不够充分，极差常用于（）的情况。',
      options: [
        { key: 'A', content: 'n特别大' },
        { key: 'B', content: 'n不大' },
        { key: 'C', content: '数据分散' },
        { key: 'D', content: '数据集中' }
      ],
      answer: 'B',
      analysis: '样本极差只利用了数据中两个极端值，因此它对数据信息的利用不够充分，极差常用于n不大的情况。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '统计量', '样本极差'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_065',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '样本标准差与样本均值之比称为样本变异系数，有时也称之为相对标准差。样本变异系数是在消除量纲影响后的样本分散程度的一种度量，记为（）。',
      options: [
        { key: 'A', content: 'S' },
        { key: 'B', content: 'R' },
        { key: 'C', content: 'Cv' },
        { key: 'D', content: 'M' }
      ],
      answer: 'C',
      analysis: '样本标准差与样本均值之比称为样本变异系数，有时也称之为相对标准差，记为Cv。样本变异系数是在消除量纲影响后的样本分散程度的一种度量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '统计量', '样本变异系数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_066',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '概率抽样的原则（随机性原则）是总体中的每一个样本被选中的概率相等。概率抽样之所以能够保证样本对总体的代表性，其原理就在于它能够很好地按总体内在结构中所蕴含的各种随机事件的概率来构成样本，使样本成为总体的（）。',
      options: [
        { key: 'A', content: '放大' },
        { key: 'B', content: '缩影' },
        { key: 'C', content: '复制' },
        { key: 'D', content: '替代' }
      ],
      answer: 'B',
      analysis: '概率抽样之所以能够保证样本对总体的代表性，其原理就在于它能够很好地按总体内在结构中所蕴含的各种随机事件的概率来构成样本，使样本成为总体的缩影。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样方法', '概率抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_067',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '概率抽样又分以下（）种抽样。',
      options: [
        { key: 'A', content: '3' },
        { key: 'B', content: '4' },
        { key: 'C', content: '5' },
        { key: 'D', content: '6' }
      ],
      answer: 'C',
      analysis: '概率抽样又分以下5种抽样：1.简单随机抽样；2.系统抽样（等距抽样或机械抽样）；3.分层抽样（类型抽样）；4.整群抽样；5.多阶抽样（分段抽样）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样方法', '概率抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_068',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '系统抽样（等距抽样或机械抽样）是把总体的单位进行排序，再计算出抽样距离，然后按照这一固定的抽样距离抽取样本。第一个样本采用简单随机抽样的办法抽取。抽样距离K的计算公式为（）。',
      options: [
        { key: 'A', content: 'K=n/N' },
        { key: 'B', content: 'K=N/n' },
        { key: 'C', content: 'K=N×n' },
        { key: 'D', content: 'K=N+n' }
      ],
      answer: 'B',
      analysis: '系统抽样的抽样距离K（抽样距离）=N（总体规模）/n（样本规模）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样方法', '系统抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_069',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '整群抽样的单位不是单个的个体，而是成群的个体。它是从总体中随机抽取一些小的群体，然后由所抽出的若干个小群体内的所有元素构成调查的样本。对小群体的抽取可采用简单随机抽样、系统抽样和分层抽样的方法。整群抽样的优点是（）。',
      options: [
        { key: 'A', content: '代表性强' },
        { key: 'B', content: '误差小' },
        { key: 'C', content: '简便易行，节省费用，特别是在总体抽样框难以确定的情况下非常适合' },
        { key: 'D', content: '样本量大' }
      ],
      answer: 'C',
      analysis: '整群抽样的优点是：简便易行，节省费用，特别是在总体抽样框难以确定的情况下非常适合。缺点是：样本分布比较集中，代表性相对较差。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样方法', '整群抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_070',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '非概率抽样不是按照等概率原则，而是根据人们的主观经验或其他条件来抽取样本。常用于探索性研究。非概率抽样的种类主要有以下几种，其中（）是抽样标准取决于调查者的主观选择。',
      options: [
        { key: 'A', content: '偶遇抽样' },
        { key: 'B', content: '判断抽样（立意抽样）' },
        { key: 'C', content: '配额抽样' },
        { key: 'D', content: '滚雪球抽样' }
      ],
      answer: 'B',
      analysis: '判断抽样（立意抽样）：抽样标准取决于调查者的主观选择。偶遇抽样：并非简单随机抽样，概率不等。配额抽样：尽可能地根据那些影响研究变量的各种因素来对总体分层，并找出不同特征的成员在总体中所占的比例。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样方法', '非概率抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第二章 计量与数据处理（统计量与抽样方法）- 多选题 4题 ==========
    {
      id: 'basic_071',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '描述样本集中位置的统计量包括（）',
      options: [
        { key: 'A', content: '样本均值' },
        { key: 'B', content: '样本中位数' },
        { key: 'C', content: '样本众数' },
        { key: 'D', content: '样本极差' }
      ],
      answer: 'A,B,C',
      analysis: '描述样本集中位置的统计量包括：(1)样本均值；(2)样本中位数；(3)样本众数。样本极差是描述样本分散程度的统计量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '统计量', '集中位置'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_072',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '描述样本分散程度的统计量包括（）',
      options: [
        { key: 'A', content: '样本极差' },
        { key: 'B', content: '样本方差与样本标准差' },
        { key: 'C', content: '样本变异系数' },
        { key: 'D', content: '样本均值' }
      ],
      answer: 'A,B,C',
      analysis: '描述样本分散程度的统计量包括：(1)样本极差；(2)样本方差与样本标准差；(3)样本变异系数。样本均值是描述样本集中位置的统计量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '统计量', '分散程度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_073',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '概率抽样的种类包括（）',
      options: [
        { key: 'A', content: '简单随机抽样' },
        { key: 'B', content: '系统抽样（等距抽样或机械抽样）' },
        { key: 'C', content: '分层抽样（类型抽样）' },
        { key: 'D', content: '整群抽样' }
      ],
      answer: 'A,B,C,D',
      analysis: '概率抽样又分以下5种抽样：1.简单随机抽样；2.系统抽样（等距抽样或机械抽样）；3.分层抽样（类型抽样）；4.整群抽样；5.多阶抽样（分段抽样）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样方法', '概率抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_074',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '非概率抽样的种类主要有（）',
      options: [
        { key: 'A', content: '偶遇抽样' },
        { key: 'B', content: '判断抽样（立意抽样）' },
        { key: 'C', content: '配额抽样' },
        { key: 'D', content: '简单随机抽样' }
      ],
      answer: 'A,B,C',
      analysis: '非概率抽样的种类主要有以下几种：(1)偶遇抽样：并非简单随机抽样，概率不等；(2)判断抽样（立意抽样）：抽样标准取决于调查者的主观选择；(3)配额抽样：尽可能地根据那些影响研究变量的各种因素来对总体分层。简单随机抽样属于概率抽样。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样方法', '非概率抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第二章 计量与数据处理（统计量与抽样方法）- 判断题 6题 ==========
    {
      id: 'basic_075',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '样本方差定义为离差平方和除以n-1。因为n个离差的总和必为0，所以对n个独立数据，独立的离差个数只有n-1个，称n-1为离差平方和的自由度，因此样本方差是用n-1而不是用n除离差平方和。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。因为n个离差的总和必为0，所以对n个独立数据，独立的离差个数只有n-1个，称n-1为离差平方和的自由度，因此样本方差是用n-1而不是用n除离差平方和。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '统计量', '样本方差'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_076',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '从理论上讲，抽样方法必须是随机抽样。所谓随机抽样，是指总体的每一个个体都有被抽到的可能，并且每个个体被抽到的可能性相同，而不是凭人们的主观意图去挑选。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。从理论上讲，抽样方法必须是随机抽样。所谓随机抽样，是指总体的每一个个体都有被抽到的可能，并且每个个体被抽到的可能性相同，而不是凭人们的主观意图去挑选。当然，在实际应用中要想做到绝对的随机抽样是困难的，不过我们应尽量避免由于抽样引起的误差。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样方法', '随机抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_077',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '简单随机抽样是抽样前先将总体中所有个体进行统一编号，使每一个编号与一个个体对应，然后用抽签或查随机数表的办法，确定要抽个体的编号，最后按号从总体中抽取个体组成样本。从理论上讲，利用简单随机抽样的方法得到的样本代表性强，误差小，但在具体应用中手续比较烦琐，不太常用。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。从理论上讲，利用简单随机抽样的方法得到的样本代表性强，误差小，但在具体应用中手续比较烦琐，不太常用。按照等概率的原则，直接从含有N个元素的总体中抽取n个元素组成的样本（N>n）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样方法', '简单随机抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_078',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '分层抽样是把异质性较强的总体分成一个个同质性较强的子总体，再抽取不同子总体中的样本分别代表该子总体，所有的样本进而代表总体。分层标准为：(1)以调查所要分析和研究的主要变量或相关的变量作为分层的标准；(2)以保证各层内部同质性强、各层之间异质性强、突出总体内在结构的变量作为分层变量；(3)以那些有明显分层区分的变量作为分层变量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。分层抽样是把异质性较强的总体分成一个个同质性较强的子总体，再抽取不同子总体中的样本分别代表该子总体，所有的样本进而代表总体。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样方法', '分层抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_079',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '分层抽样与整群抽样的区别：分层抽样要求各子群体之间的差异较大，而子群体内部的差异较小；整群抽样要求各子群体之间的差异较小，而子群体内部的差异性很大。换句话说，分层抽样是用代表不同子群体的子样本来代表总体中的群体分布；整群抽样是用子群体代表总体，再通过子群体内部样本的分布来反映总体样本的分布。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。分层抽样与整群抽样的区别：分层抽样要求各子群体之间的差异较大，而子群体内部的差异较小；整群抽样要求各子群体之间的差异较小，而子群体内部的差异性很大。',
      difficulty: DifficultyLevel.HARD,
      tags: ['基础知识', '抽样方法', '分层抽样', '整群抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_080',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第二章 计量与数据处理',
      content: '配额抽样与分层抽样的区别：前者注重的是样本与总体在结构比例上的表面一致性；后者一方面要提高各层间的异质性与同层的同质性，另一方面也是为了照顾到某些比例小的层次，使得所抽样本的代表性进一步提高，误差进一步减小。在概率上，前者是按照事先规定的条件，有目的地寻找；后者是客观地、等概率地到各层中进行抽样。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。配额抽样与分层抽样的区别：前者注重的是样本与总体在结构比例上的表面一致性；后者一方面要提高各层间的异质性与同层的同质性，另一方面也是为了照顾到某些比例小的层次，使得所抽样本的代表性进一步提高，误差进一步减小。',
      difficulty: DifficultyLevel.HARD,
      tags: ['基础知识', '抽样方法', '配额抽样', '分层抽样'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第三章 检验检测机构管理 - 单选题 10题 ==========
    {
      id: 'basic_081',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '质量是一组固有特性满足要求的程度。"固有的"（其反义是"赋予的"）就是指在某事或某物中本来就有的，尤其是那种（）的特性。',
      options: [
        { key: 'A', content: '临时' },
        { key: 'B', content: '外在' },
        { key: 'C', content: '永久' },
        { key: 'D', content: '附加' }
      ],
      answer: 'C',
      analysis: '质量是一组固有特性满足要求的程度。"质量"可使用形容词如差、好或优秀来修饰。"固有的"（其反义是"赋予的"）就是指在某事或某物中本来就有的，尤其是那种永久的特性。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '质量管理', '质量定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_082',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构的质量管理是检验检测机构确定质量方针、质量目标、质量策划（检测规程规范的确定）、质量控制（检测的实施与监督）、质量保证（制度、人员、仪器设备、检测环境）和质量改进（内审、管理评审、其他有效的检查方法）促使其实施全部管理职能的所有活动。质量管理的基本职能可以划分为（）。',
      options: [
        { key: 'A', content: '计划、组织、控制' },
        { key: 'B', content: '决策、组织、协调（包括指挥、领导、沟通、指导、激励）、控制（监督、检查）、改进' },
        { key: 'C', content: '策划、实施、检查' },
        { key: 'D', content: '计划、执行、评审' }
      ],
      answer: 'B',
      analysis: '质量管理的基本职能可以划分为决策、组织、协调（包括指挥、领导、沟通、指导、激励）、控制（监督、检查）、改进。检验检测机构应定期进行群众性的质量管理活动，如内部质量审核和管理评审。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '质量管理', '基本职能'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_083',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '质量管理的步骤是：建立检验检测机构的管理体系→实施管理体系→维持、改进管理体系。因此，应将管理要求、技术要求、程序和指导书制定成文件，并实施（）管理。',
      options: [
        { key: 'A', content: '人员' },
        { key: 'B', content: '设备' },
        { key: 'C', content: '文件化' },
        { key: 'D', content: '环境' }
      ],
      answer: 'C',
      analysis: '质量管理的步骤是：建立检验检测机构的管理体系→实施管理体系→维持、改进管理体系。因此，应将管理要求、技术要求、程序和指导书制定成文件，并实施文件化管理。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '质量管理', '文件化管理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_084',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '统计质量控制是指质量是通过一定数量界限表现出来的，根据数理统计的原理和方法，将产品质量特性的波动范围控制在最小，这种质量控制方法简称统计质量控制。在实践中，该理论又发展为老七种统计方法和新七种统计工具。老七种统计方法包括（）。',
      options: [
        { key: 'A', content: '联图法、箭线图法、KJ图法、系统图法' },
        { key: 'B', content: '排列图法、因果分析图法、分层法、调查表法、直方图法、控制图法和散布图法' },
        { key: 'C', content: '矩阵图法、矩阵数据分析法、过程决策程序图法' },
        { key: 'D', content: '流程图法、检查表法、帕累托图法' }
      ],
      answer: 'B',
      analysis: '老七种统计方法包括：排列图法、因果分析图法、分层法、调查表法、直方图法、控制图法和散布图法。这七种方法若结合运用，可有效提高产品质量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '质量管理', '统计质量控制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_085',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '新七种统计工具力图把统计方法和思考过程结合起来，充分发挥全面质量管理的全过程、全员参加和预防为主的特点。新七种统计工具不包括（）。',
      options: [
        { key: 'A', content: '联图法' },
        { key: 'B', content: '箭线图法' },
        { key: 'C', content: '排列图法' },
        { key: 'D', content: 'KJ图法' }
      ],
      answer: 'C',
      analysis: '新七种统计工具包括：联图法、箭线图法、KJ图法、系统图法、矩阵图法、矩阵数据分析法、过程决策程序图法。排列图法属于老七种统计方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '质量管理', '新七种统计工具'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_086',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构管理体系是指检验检测机构为建立方针和目标并实现这些目标的体系。由组织机构、程序、过程和资源四个基本要素构成，且具有一定活动规律的一个有机整体。也即是把影响检测质量的所有要素综合在一起，在质量方针的指引下，为实现质量目标而形成集中统一、步调一致、（）的有机整体。',
      options: [
        { key: 'A', content: '独立运作' },
        { key: 'B', content: '协调配合' },
        { key: 'C', content: '分散管理' },
        { key: 'D', content: '各自为政' }
      ],
      answer: 'B',
      analysis: '检验检测机构管理体系是指检验检测机构为建立方针和目标并实现这些目标的体系。由组织机构、程序、过程和资源四个基本要素构成，且具有一定活动规律的一个有机整体。也即是把影响检测质量的所有要素综合在一起，在质量方针的指引下，为实现质量目标而形成集中统一、步调一致、协调配合的有机整体。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '管理体系'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_087',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '管理体系文件它主要由质量手册、程序文件和作业指导书、质量和技术记录表格等文件构成。管理体系文件是检验检测机构检测检测工作的依据，是检验检测机构内部的（）文件。',
      options: [
        { key: 'A', content: '参考性' },
        { key: 'B', content: '建议性' },
        { key: 'C', content: '法规性' },
        { key: 'D', content: '临时性' }
      ],
      answer: 'C',
      analysis: '管理体系文件是检验检测机构检测检测工作的依据，是检验检测机构内部的法规性文件。管理体系文件应向检验检测机构全体人员宣贯，通过培训使他们理解并贯彻执行，以达到确保检验检测机构检测质量的目的。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '管理体系文件'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_088',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '质量手册就是阐述其质量方针并描述管理体系的文件。质量手册应当包括检验检测机构的质量方针、目标和对客户的各项承诺，以及对体系要素的描述，提出了对过程和活动的管理要求。管理体系形成文件之后，检验检测机构应当以适当的方式使有关人员理解管理体系的要求，并在自己的实际工作中加以实施。质量手册在深度和形式上可以不同，以适应组织的需要。它可能由几个文件组成。根据手册的范围，可以使用限定词，如（）。',
      options: [
        { key: 'A', content: '技术手册、操作手册' },
        { key: 'B', content: '质量保证手册、质量管理手册' },
        { key: 'C', content: '程序手册、作业手册' },
        { key: 'D', content: '管理手册、控制手册' }
      ],
      answer: 'B',
      analysis: '质量手册在深度和形式上可以不同，以适应组织的需要。它可能由几个文件组成。根据手册的范围，可以使用限定词，如质量保证手册、质量管理手册。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '质量手册'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_089',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '管理体系文件的层次划分一般为3个或4个层次，检验检测机构可根据自身的检验工作需要和习惯加以规定。典型的3层质量体系文件层次中，A层次是（）。',
      options: [
        { key: 'A', content: '程序文件' },
        { key: 'B', content: '作业指导书、质量记录' },
        { key: 'C', content: '质量手册' },
        { key: 'D', content: '技术记录' }
      ],
      answer: 'C',
      analysis: '典型的3层质量体系文件层次：A层次-质量手册（按评审准则和规定的质量方针、目标描述管理体系要素与职责及途径，是纲领性文件，具有指导全局的作用）；B层次-程序文件（描述管理体系所涉及的各个部门的职能活动，是质量手册的展开和落实，具有承上启下的作用）；C层次-作业指导书、质量记录（详细的作业指导与证实性文件）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '管理体系文件', '层次'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_090',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '"纠正"和"纠正措施"的区别是："纠正"是指"返修"、"返工"或调整，涉及对现有的不合格所进行的处置；"纠正措施"涉及（）。',
      options: [
        { key: 'A', content: '对现有不合格的处理' },
        { key: 'B', content: '消除产生不合格的原因' },
        { key: 'C', content: '对产品的检验' },
        { key: 'D', content: '对人员的培训' }
      ],
      answer: 'B',
      analysis: '"纠正"和"纠正措施"的区别是："纠正"是指"返修"、"返工"或调整，涉及对现有的不合格所进行的处置；"纠正措施"涉及消除产生不合格的原因。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '纠正措施'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第三章 检验检测机构管理 - 多选题 4题 ==========
    {
      id: 'basic_091',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '管理体系包括（）',
      options: [
        { key: 'A', content: '质量管理体系' },
        { key: 'B', content: '技术管理体系' },
        { key: 'C', content: '行政管理体系' },
        { key: 'D', content: '财务管理体系' }
      ],
      answer: 'A,B,C',
      analysis: '管理体系包括质量管理体系、技术管理体系和行政管理体系。进行质量管理，首先是根据质量目标的需要，准备必要的条件（人力资源、物质资源和工作环境等），然后，通过设置组织机构，分析确定实现检测的各项质量过程，分配、协调各项过程的职责和接口，通过程序的制定规定从事各个质量过程的工作方法，使各项质量过程能经济、有效、协调地进行。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '管理体系'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_092',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '管理体系文件的特点包括（）',
      options: [
        { key: 'A', content: '规范性' },
        { key: 'B', content: '系统性' },
        { key: 'C', content: '协调性' },
        { key: 'D', content: '唯一性' }
      ],
      answer: 'A,B,C,D',
      analysis: '管理体系文件的特点包括：(1)规范性；(2)系统性；(3)协调性；(4)唯一性；(5)适用性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '管理体系文件', '特点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_093',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '管理体系的特性包括（）',
      options: [
        { key: 'A', content: '系统性' },
        { key: 'B', content: '全面性' },
        { key: 'C', content: '有效性' },
        { key: 'D', content: '适应性' }
      ],
      answer: 'A,B,C,D',
      analysis: '管理体系的特性包括：系统性、全面性、有效性、适应性。检验检测机构管理体系的系统性是指检验检测机构建立的管理体系是对质量活动中的各个方面综合起来的一个完整的系统。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '管理体系', '特性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_094',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '对检验检测机构而言，至少应制定以下4方面的作业指导书（）',
      options: [
        { key: 'A', content: '方法方面，用以指导检测过程的，如检测细则、大纲、指南等' },
        { key: 'B', content: '设备方面，设备的使用、操作规范，如自校、在线仪表的特殊管理方法等' },
        { key: 'C', content: '样品方面，包括样品的准备、处置和制备规则' },
        { key: 'D', content: '数据方面，检测的有效位数、修约、异常值的剔除以及测量不确定度的表征规范等' }
      ],
      answer: 'A,B,C,D',
      analysis: '对检验检测机构而言，至少应制定以下4方面的作业指导书：①方法方面；②设备方面；③样品方面；④数据方面。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '作业指导书'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第三章 检验检测机构管理 - 判断题 6题 ==========
    {
      id: 'basic_095',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构的质量管理必须与其活动范围相适应。即与检验检测机构的工作类型、工作范围、工作量相匹配。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检验检测机构的质量管理必须与其活动范围相适应。即与检验检测机构的工作类型、工作范围、工作量相匹配。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '质量管理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_096',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '质量保证是指为了提供足够的信任表明实体能够满足质量要求，而在质量体系中实施并根据需要进行证实的全部有计划和有系统的活动。质量保证有内部和外部两种目的。在组织内部，质量保证向管理者提供信任；在外部合同或其他情况下，质量保证向顾客或他方提供信任。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。质量保证是指为了提供足够的信任表明实体能够满足质量要求，而在质量体系中实施并根据需要进行证实的全部有计划和有系统的活动。质量保证有内部和外部两种目的。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '质量保证'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_097',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '质量改进是质量管理的一部分，致力于增强满足质量要求的能力。要求可以是有关任何方面的，如有效性、效率或可追溯性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。质量改进是质量管理的一部分，致力于增强满足质量要求的能力。要求可以是有关任何方面的，如有效性、效率或可追溯性。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '质量改进'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_098',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构管理体系的全面性是指管理体系应对质量各项活动进行有效的控制。对检验报告质量形成进行全过程、全要素（硬件、软件、物质、人员、报告质量、工作质量）控制。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检验检测机构管理体系的全面性是指管理体系应对质量各项活动进行有效的控制。对检验报告质量形成进行全过程、全要素（硬件、软件、物质、人员、报告质量、工作质量）控制。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '管理体系', '全面性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_099',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构管理体系的有效性是指检验检测机构管理体系的有效性体现在管理体系应能减少、消除和预防质量缺陷的产生，一旦出现质量缺陷能及时发现和迅速纠正，并使各项质量活动都处于受控状态，体现了管理体系要素和功能上的有效性。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检验检测机构管理体系的有效性是指检验检测机构管理体系的有效性体现在管理体系应能减少、消除和预防质量缺陷的产生，一旦出现质量缺陷能及时发现和迅速纠正，并使各项质量活动都处于受控状态，体现了管理体系要素和功能上的有效性。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '管理体系', '有效性'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_100',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '纠正措施是为了防止已出现的不合格（不符合）、缺陷或其他不希望的情况再次发生，消除其产生原因所采取的措施。这种措施可以包括程序和体系等的更改，以实现质量环中任一阶段的质量改进。一个不合格可以有若干个原因。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。纠正措施是为了防止已出现的不合格（不符合）、缺陷或其他不希望的情况再次发生，消除其产生原因所采取的措施。这种措施可以包括程序和体系等的更改，以实现质量环中任一阶段的质量改进。一个不合格可以有若干个原因。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '纠正措施'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第三章 检验检测机构技术管理 - 单选题 10题 ==========
    {
      id: 'basic_101',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构技术管理，主要包括以下内容，不包括（）。',
      options: [
        { key: 'A', content: '抽样与样品管理' },
        { key: 'B', content: '检测方法的管理' },
        { key: 'C', content: '财务管理' },
        { key: 'D', content: '仪器设备管理' }
      ],
      answer: 'C',
      analysis: '检验检测机构技术管理，主要包括以下内容：(1)抽样与样品管理；(2)检测方法的管理；(3)检测环境的管理；(4)仪器设备管理；(5)检测记录与检测报告。财务管理属于行政管理范畴。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '技术管理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_102',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构技术管理人员不仅有单位领导，而且应配备技术负责人、质量负责人、各试验室负责人、质量监督员、设备管理员、样品管理员、（）等。',
      options: [
        { key: 'A', content: '财务人员' },
        { key: 'B', content: '资料管理员' },
        { key: 'C', content: '行政人员' },
        { key: 'D', content: '后勤人员' }
      ],
      answer: 'B',
      analysis: '检验检测机构技术管理人员不仅有单位领导，而且应配备技术负责人、质量负责人、各试验室负责人、质量监督员、设备管理员、样品管理员、资料管理员等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '技术管理', '人员配备'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_103',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '抽样应确保科学、公正，样品量应足够，样品应完好，具有代表性，并符合标准要求。样品的抽取，当有国家或行业标准时，应按标准规定的方法抽取；当没有国家或行业标准时，可以按（）抽取。',
      options: [
        { key: 'A', content: '随意方法' },
        { key: 'B', content: '设计要求或有效合同或同委托方商定的抽样方法' },
        { key: 'C', content: '检测人员经验' },
        { key: 'D', content: '最简便的方法' }
      ],
      answer: 'B',
      analysis: '样品的抽取，当有国家或行业标准时，应按标准规定的方法抽取；当没有国家或行业标准时，可以按设计要求或有效合同或同委托方商定的抽样方法抽取。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样管理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_104',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '现场取样一般应遵从随机抽取的原则，使用适宜的抽样工具和容器。抽样应符合标准规定或事先确定的方法。抽样应有记录，记录包括的内容不包括（）。',
      options: [
        { key: 'A', content: '抽样程序和遵循的方法' },
        { key: 'B', content: '抽样人（被抽样单位和监理单位在场的人员应签字确认）' },
        { key: 'C', content: '抽样时间、位置和环境' },
        { key: 'D', content: '抽样人员的工资待遇' }
      ],
      answer: 'D',
      analysis: '抽样应有记录。记录包括：抽样程序和遵循的方法，抽样人（被抽样单位和监理单位在场的人员应签字确认），抽样时间、位置和环境，抽样工具，样品名称、数量和状态描述，抽样目的和抽样样品的代表性，需要封样的应记录封样的部位、数量和方法，必要时应有抽样位置的图示或其他等效方法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '抽样记录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_105',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '样品均应编号。样品编号应符合编号的唯一性和永久性的原则。取样单位可根据自己单位的特点，自行规定编号规则，以便取样后取样人员能够快速、及时、方便地实行编号。原材料编号规则可确定为：检验检测机构代号－工程代号－原材料代号－年代号－序号。其中原材料代号可规定水泥代号为（）。',
      options: [
        { key: 'A', content: 'S' },
        { key: 'B', content: 'W' },
        { key: 'C', content: 'C' },
        { key: 'D', content: 'G' }
      ],
      answer: 'C',
      analysis: '原材料编号规则可确定为：检验检测机构代号－工程代号－原材料代号－年代号－序号。其中原材料代号可规定水泥代号为C，粉煤灰为F，外加剂为W，砂子为S，粗骨料为G，纤维为V，土料为T等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '样品编号'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_106',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构应建立样品的唯一标识系统，目的是确保样品在检验检测机构检测期间自始至终不会发生混淆，它是每个样品在检测过程中识别和记录的唯一标记。检验检测机构在接收样品时，除取得委托方对样品的编号外，还应对样品进行编号。该编号为检验检测机构的（）编号。',
      options: [
        { key: 'A', content: '委托' },
        { key: 'B', content: '试验用' },
        { key: 'C', content: '临时' },
        { key: 'D', content: '档案' }
      ],
      answer: 'B',
      analysis: '检验检测机构在接收样品时，除取得委托方对样品的编号外，还应对样品进行编号。该编号为检验检测机构的试验用编号，只用在检验检测机构的检测过程（包括样品在检验检测机构中保存、流转和处理）中，并在检测记录中出现，即在样品保管、流转、处置和检测记录中使用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '样品标识'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_107',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '样品管理员在受理委托人的委托检测时，应对样品附件及资料进行详细的描述、登记和记录，并与委托人取得一致。样品的验收中，样品管理员应对委托方提交的样品进行必要的技术性检查，详细描述记录样品的技术状态，当认为样品可能存在潜在的缺陷而不能仅根据其表面状况确定时，样品管理员应注明样品没有发现明显的外观缺陷，但其他隐含特性待查的表述，并取得（）的认可。',
      options: [
        { key: 'A', content: '技术负责人' },
        { key: 'B', content: '质量负责人' },
        { key: 'C', content: '委托人' },
        { key: 'D', content: '检测人员' }
      ],
      answer: 'C',
      analysis: '当认为样品可能存在潜在的缺陷而不能仅根据其表面状况确定时，样品管理员应注明样品没有发现明显的外观缺陷，但其他隐含特性待查的表述，并取得委托人的认可。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '样品验收'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_108',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检测委托合同（协议）由样品管理员提交给检验检测机构相关人员按程序评审。评审的内容主要是，委托的检测项目和应遵循的标准是否属于资质认定确认的范围，根据当前检测任务执行情况是否有能力按委托方要求完成的时间安排并完成。评审过程应有相关人员的明确意见并留有记录。经评审确认后双方代表人签字，合同生效（见表3-2）。合同一式三联，第一联交委托人留存，作为委托检测后领取检测报告和领回样品的凭据。第二联由（）留存待查，作为检测计划的统计凭据。',
      options: [
        { key: 'A', content: '样品管理员' },
        { key: 'B', content: '技术管理室' },
        { key: 'C', content: '质量负责人' },
        { key: 'D', content: '检测人员' }
      ],
      answer: 'B',
      analysis: '合同一式三联，第一联交委托人留存，作为委托检测后领取检测报告和领回样品的凭据。第二联由技术管理室留存待查，作为检测计划的统计凭据。第三联作为检验检测机构存档材料。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测合同'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_109',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检测样品在整个流转过程中以及备份样品在保管室保管中应严格按标准要求保管，委托人有专门要求的应根据合同按委托人要求保管。样品管理员应对样品在检验检测机构期间的保存、安全、保密、完好负责，并对在检期间的样品管理实施监督。样品的储存条件应达到委托人提出的要求，对有特殊储存要求的样品，应设置储存环境的（）设施。',
      options: [
        { key: 'A', content: '加热' },
        { key: 'B', content: '冷却' },
        { key: 'C', content: '监控' },
        { key: 'D', content: '通风' }
      ],
      answer: 'C',
      analysis: '样品的储存条件应达到委托人提出的要求，对有特殊储存要求的样品，应设置储存环境的监控设施。样品管理员应对监控过程实施记录，以证实样品储存始终是符合委托人要求的。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '样品保管'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_110',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '无论样品是否由检验检测机构处置，样品的任何处置必须遵守不得污染和破坏环境的原则。委托人对样品的处置有要求的，委托人如放弃对检后样品的处置权，样品管理员应根据委托人放弃检后样品处置权的事实逐一登记后处置。破坏性检测的样品，应将残渣集中定点保存并按规定及时清除处理；有备份样品的，委托人对检测无异议的，样品到存储期，即可按（）规定的方式自行处理。',
      options: [
        { key: 'A', content: '委托人' },
        { key: 'B', content: '检验检测机构' },
        { key: 'C', content: '监理单位' },
        { key: 'D', content: '建设单位' }
      ],
      answer: 'B',
      analysis: '破坏性检测的样品，应将残渣集中定点保存并按规定及时清除处理；有备份样品的，委托人对检测无异议的，样品到存储期，即可按检验检测机构规定的方式自行处理。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '样品处置'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第三章 检验检测机构技术管理 - 多选题 4题 ==========
    {
      id: 'basic_111',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构技术管理，主要包括以下内容（）',
      options: [
        { key: 'A', content: '抽样与样品管理' },
        { key: 'B', content: '检测方法的管理' },
        { key: 'C', content: '检测环境的管理' },
        { key: 'D', content: '仪器设备管理' }
      ],
      answer: 'A,B,C,D',
      analysis: '检验检测机构技术管理，主要包括以下内容：(1)抽样与样品管理；(2)检测方法的管理；(3)检测环境的管理；(4)仪器设备管理；(5)检测记录与检测报告。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '技术管理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_112',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '抽样要求包括（）',
      options: [
        { key: 'A', content: '抽样应确保科学、公正，样品量应足够，样品应完好，具有代表性，并符合标准要求' },
        { key: 'B', content: '样品的抽取，当有国家或行业标准时，应按标准规定的方法抽取' },
        { key: 'C', content: '设计和合同都没有规定的应与委托方协商确定抽样方法' },
        { key: 'D', content: '无论采用什么方法均应告知委托方并取得其同意' }
      ],
      answer: 'A,B,C,D',
      analysis: '抽样要求：(1)抽样应确保科学、公正，样品量应足够，样品应完好，具有代表性，并符合标准要求；(2)样品的抽取，当有国家或行业标准时，应按标准规定的方法抽取；当没有国家或行业标准时，可以按设计要求或有效合同或同委托方商定的抽样方法抽取；(3)设计和合同都没有规定的应与委托方协商确定抽样方法；(4)无论采用什么方法均应告知委托方并取得其同意。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_113',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '样品的交接中，样品管理员在受理委托人的委托检测时，应对样品附件及资料进行详细的描述、登记和记录，并与委托人取得一致。交接内容包括（）',
      options: [
        { key: 'A', content: '样品的验收' },
        { key: 'B', content: '保密要求的确认' },
        { key: 'C', content: '检测要求的确认' },
        { key: 'D', content: '检测合同的评审和签订' }
      ],
      answer: 'A,B,C,D',
      analysis: '样品的交接内容包括：(1)样品的验收；(2)保密要求的确认；(3)检测要求的确认；(4)检测合同的评审和签订；(5)接收样品和资料。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '样品交接'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_114',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '样品的流转中，检测负责人应与样品管理员共同清点接收的样品和与检测有关的技术资料，并确认样品的状态，包括（）',
      options: [
        { key: 'A', content: '样品编号' },
        { key: 'B', content: '样品的检测状态标识' },
        { key: 'C', content: '样品数量' },
        { key: 'D', content: '样品外观状态' }
      ],
      answer: 'A,B,C,D',
      analysis: '检测负责人应与样品管理员共同清点接收的样品和与检测有关的技术资料，并确认样品的状态，包括样品编号和样品的检测状态标识。清点确认后，检测负责人应在样品管理记录上签字，完成领取供检测的样品和资料的手续。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '样品流转'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第三章 检验检测机构技术管理 - 判断题 6题 ==========
    {
      id: 'basic_115',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '抽样总体计划应根据工程全过程的检测总进度要求确定抽样项目、标准或方法、时间、地点、抽样量、代表性、频次，保证工程的各项检测按计划顺利开展。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。抽样总体计划应根据工程全过程的检测总进度要求确定抽样项目、标准或方法、时间、地点、抽样量、代表性、频次，保证工程的各项检测按计划顺利开展。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样计划'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_116',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '抽样实施方案应运用适当的统计技术，考虑抽样时遇见突发性困难采取的应对措施，并应在有关检测大纲、检测指导书中详细说明，保证抽样计划顺利执行，完成总体计划的要求。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。抽样实施方案应运用适当的统计技术，考虑抽样时遇见突发性困难采取的应对措施，并应在有关检测大纲、检测指导书中详细说明，保证抽样计划顺利执行，完成总体计划的要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样实施'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_117',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '当发生委托人对已有文件规定的抽样程序进行增添、删节或对某条款进行修改等偏离情况时，检验检测机构应评估有关偏离带来的风险，任何偏离不得影响检测质量。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。当发生委托人对已有文件规定的抽样程序进行增添、删节或对某条款进行修改等偏离情况时，检验检测机构应评估有关偏离带来的风险，任何偏离不得影响检测质量。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样偏离'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_118',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '抽样记录是原始记录之一，是以后发生不同意见或纠纷时追溯原始情况的依据。应按规定详细记录抽样的全过程，尤其是对抽样程序有偏离的部分，应随意简化、减少和遗漏。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。抽样记录是原始记录之一，是以后发生不同意见或纠纷时追溯原始情况的依据。应按规定详细记录抽样的全过程，尤其是对抽样程序有偏离的部分，应随意简化、减少和遗漏是错误的，应该详细记录，不能简化、减少和遗漏。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '抽样记录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_119',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构对所接收的样品另行编号，并在整个检测过程中使用，是保证检测的公正性和为委托方产权信息保密的必要措施。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检验检测机构对所接收的样品另行编号，并在整个检测过程中使用，是保证检测的公正性和为委托方产权信息保密的必要措施。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '样品编号', '保密'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_120',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '在整个检测过程中，该编号始终保持不变，具有唯一性。检测过程中应有相应的标识表示样品所处的检测状态。当检测完毕后，在检测报告中恢复使用委托方在委托时给予的样品编号。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。在整个检测过程中，该编号始终保持不变，具有唯一性。检测过程中应有相应的标识表示样品所处的检测状态。当检测完毕后，在检测报告中恢复使用委托方在委托时给予的样品编号。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '样品编号', '检测过程'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第三章 检验检测机构管理 - 检测方法管理、检测环境管理、仪器设备管理、安全与保密管理 ==========
    // ========== 单选题 10题 ==========
    {
      id: 'basic_121',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构应优先使用以国际、区域或国家标准发布的方法。当委托方未指定所用方法时，检验检测机构应（）',
      options: [
        { key: 'A', content: '选择最新发布的方法' },
        { key: 'B', content: '选择检测费用最低的方法' },
        { key: 'C', content: '选择适当的方法并通知委托方' },
        { key: 'D', content: '由检测人员自行决定' }
      ],
      answer: 'C',
      analysis: '当委托方未指定所用方法时，检验检测机构应选择适当的方法并通知委托方。检验检测机构应优先使用以国际、区域或国家标准发布的方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测方法管理', '方法选择'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_122',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '非标准方法是指（）以外的检测方法。',
      options: [
        { key: 'A', content: '国家标准' },
        { key: 'B', content: '行业标准' },
        { key: 'C', content: '地方标准' },
        { key: 'D', content: '标准方法' }
      ],
      answer: 'D',
      analysis: '非标准方法是指标准方法以外的检测方法，包括自制方法、改进方法、超出预定范围使用的标准方法、扩充和修改过的标准方法等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '检测方法管理', '非标准方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_123',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构使用非标准方法前，应进行确认。确认应尽可能全面，以满足（）的需要。',
      options: [
        { key: 'A', content: '检测人员' },
        { key: 'B', content: '预期用途或应用领域' },
        { key: 'C', content: '管理层' },
        { key: 'D', content: '设备能力' }
      ],
      answer: 'B',
      analysis: '检验检测机构使用非标准方法前，应进行确认。确认应尽可能全面，以满足预期用途或应用领域的需要。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测方法管理', '方法确认'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_124',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '试验室的布局应满足检测工作的需要，相互有影响的相邻区域应进行有效隔离。以下不属于试验室环境控制要素的是（）',
      options: [
        { key: 'A', content: '温度和湿度' },
        { key: 'B', content: '灰尘和振动' },
        { key: 'C', content: '电磁干扰' },
        { key: 'D', content: '检测人员数量' }
      ],
      answer: 'D',
      analysis: '试验室环境控制要素包括：温度、湿度、灰尘、振动、电磁干扰、辐射、声级、照明等。检测人员数量不属于环境控制要素。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '检测环境管理', '环境控制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_125',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '试验室照明应满足检测工作的需要，一般工作场所的照度不应低于（）lx。',
      options: [
        { key: 'A', content: '100' },
        { key: 'B', content: '150' },
        { key: 'C', content: '200' },
        { key: 'D', content: '300' }
      ],
      answer: 'D',
      analysis: '试验室照明应满足检测工作的需要，一般工作场所的照度不应低于300lx，精密测量区域的照度应适当提高。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测环境管理', '照明要求'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_126',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '仪器设备在投入使用前应进行验收，验收内容不包括（）',
      options: [
        { key: 'A', content: '外观检查' },
        { key: 'B', content: '功能检查' },
        { key: 'C', content: '计量性能检查' },
        { key: 'D', content: '设备价格核实' }
      ],
      answer: 'D',
      analysis: '仪器设备验收内容包括：外观检查、功能检查、计量性能检查、随机文件资料检查等。设备价格核实不属于技术验收内容。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '仪器设备管理', '设备验收'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_127',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '仪器设备应按规定进行检定或校准，检定或校准周期的确定应考虑（）',
      options: [
        { key: 'A', content: '仪器设备的购买价格' },
        { key: 'B', content: '仪器设备的使用频率和稳定性' },
        { key: 'C', content: '检测人员的技术水平' },
        { key: 'D', content: '委托方的要求' }
      ],
      answer: 'B',
      analysis: '检定或校准周期的确定应考虑仪器设备的使用频率、稳定性、准确度要求、使用环境等因素。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '仪器设备管理', '检定校准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_128',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '试验室应配备必要的消防设施，灭火器材应定期检查，一般灭火器的检查周期为（）',
      options: [
        { key: 'A', content: '每周一次' },
        { key: 'B', content: '每月一次' },
        { key: 'C', content: '每季度一次' },
        { key: 'D', content: '每年一次' }
      ],
      answer: 'B',
      analysis: '灭火器材应定期检查，一般灭火器的检查周期为每月一次，确保灭火器处于正常可用状态。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '安全管理', '消防设施'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_129',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构应建立和保持保护委托方机密信息和所有权的程序。以下不属于保密范围的是（）',
      options: [
        { key: 'A', content: '委托方的技术秘密' },
        { key: 'B', content: '检测数据和结果' },
        { key: 'C', content: '已公开发表的标准方法' },
        { key: 'D', content: '样品信息' }
      ],
      answer: 'C',
      analysis: '保密范围包括委托方的技术秘密、检测数据和结果、样品信息等。已公开发表的标准方法不属于保密范围。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '保密管理', '保密范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_130',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '仪器设备出现故障或异常时，应立即停止使用，并（）',
      options: [
        { key: 'A', content: '继续使用直到完成当前检测' },
        { key: 'B', content: '贴上停用标识并进行隔离' },
        { key: 'C', content: '通知委托方' },
        { key: 'D', content: '报废处理' }
      ],
      answer: 'B',
      analysis: '仪器设备出现故障或异常时，应立即停止使用，贴上停用标识并进行隔离，防止误用。同时应追溯该设备对以往检测结果的影响。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '仪器设备管理', '故障处理'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 4题 ==========
    {
      id: 'basic_131',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '非标准方法包括（）',
      options: [
        { key: 'A', content: '自制方法' },
        { key: 'B', content: '改进方法' },
        { key: 'C', content: '超出预定范围使用的标准方法' },
        { key: 'D', content: '扩充和修改过的标准方法' }
      ],
      answer: 'A,B,C,D',
      analysis: '非标准方法是指标准方法以外的检测方法，包括：自制方法、改进方法、超出预定范围使用的标准方法、扩充和修改过的标准方法等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测方法管理', '非标准方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_132',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '试验室环境控制要素包括（）',
      options: [
        { key: 'A', content: '温度和湿度' },
        { key: 'B', content: '灰尘和振动' },
        { key: 'C', content: '电磁干扰和辐射' },
        { key: 'D', content: '声级和照明' }
      ],
      answer: 'A,B,C,D',
      analysis: '试验室环境控制要素包括：温度、湿度、灰尘、振动、电磁干扰、辐射、声级、照明等。应根据检测项目的要求对相关环境要素进行控制。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测环境管理', '环境控制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_133',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '仪器设备管理的主要内容包括（）',
      options: [
        { key: 'A', content: '设备配置和采购' },
        { key: 'B', content: '设备验收和安装' },
        { key: 'C', content: '设备使用和维护' },
        { key: 'D', content: '设备检定/校准和期间核查' }
      ],
      answer: 'A,B,C,D',
      analysis: '仪器设备管理的主要内容包括：设备配置和采购、设备验收和安装、设备使用和维护、设备检定/校准和期间核查、设备档案管理等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '仪器设备管理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_134',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '试验室安全管理的主要内容包括（）',
      options: [
        { key: 'A', content: '消防安全' },
        { key: 'B', content: '用电安全' },
        { key: 'C', content: '危险化学品安全' },
        { key: 'D', content: '通风与防护' }
      ],
      answer: 'A,B,C,D',
      analysis: '试验室安全管理的主要内容包括：消防安全、用电安全、危险化学品安全、通风与防护、辐射防护、生物安全等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '安全管理'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 6题 ==========
    {
      id: 'basic_135',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构应确保使用的标准为现行有效版本，当标准更新时，应及时对检测方法进行确认和验证。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检验检测机构应确保使用的标准为现行有效版本，建立标准查新制度，当标准更新时，应及时对检测方法进行确认和验证，确保检测能力满足新标准的要求。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '检测方法管理', '标准更新'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_136',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '试验室的温湿度控制只需要在检测时满足要求，其他时间可以不控制。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。试验室的温湿度控制应持续进行，不仅在检测时需要满足要求，在样品存放、仪器设备保管等过程中也需要保持适当的温湿度条件。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测环境管理', '温湿度控制'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_137',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '仪器设备的期间核查是指在两次检定或校准之间，对仪器设备进行核查，以确保其计量性能持续满足要求。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。期间核查是指在两次检定或校准之间，按照规定的程序对仪器设备进行核查，以确保其计量性能持续满足检测工作的要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '仪器设备管理', '期间核查'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_138',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '试验室使用的危险化学品应设专人管理，建立领用登记制度，做到账物相符。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。危险化学品应设专人管理，存放在专用场所，建立领用登记制度，做到账物相符。使用时应采取必要的防护措施。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '安全管理', '危险化学品'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_139',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构的保密工作仅限于对检测数据和结果的保密，不包括对样品信息的保密。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。检验检测机构的保密工作包括对委托方的技术秘密、检测数据和结果、样品信息等的保密。样品信息也属于保密范围。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '保密管理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_140',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '仪器设备应由经过培训并取得授权的人员操作使用，未经授权的人员不得擅自操作仪器设备。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。仪器设备应由经过培训并取得授权的人员操作使用，未经授权的人员不得擅自操作仪器设备，以确保设备的正确使用和检测结果的准确性。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '仪器设备管理', '人员授权'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 第三章 检验检测机构管理 - 检测报告管理、资质认定制度 ==========
    // ========== 单选题 10题 ==========
    {
      id: 'basic_141',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检测报告应根据检验检测机构的情况规定相应的程序进行校/审核，目的是（）',
      options: [
        { key: 'A', content: '增加检测费用' },
        { key: 'B', content: '消除检测报告中出现的差错，保证检测报告的质量' },
        { key: 'C', content: '延长检测周期' },
        { key: 'D', content: '增加检测人员工作量' }
      ],
      answer: 'B',
      analysis: '检测报告应根据检验检测机构的情况规定相应的程序进行校/审核，目的是消除检测报告中出现的差错，保证检测报告的质量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '检测报告', '校审核'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_142',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '经审核的检测报告由受权签字人按核准的授权范围的职权批准签发，任何情况下（）',
      options: [
        { key: 'A', content: '可由技术负责人代替签字批准' },
        { key: 'B', content: '可由质量负责人代替签字批准' },
        { key: 'C', content: '其他人无权代替签字批准' },
        { key: 'D', content: '可由检测人员代替签字批准' }
      ],
      answer: 'C',
      analysis: '经审核的检测报告由受权签字人按核准的授权范围的职权批准签发，任何情况下，其他人无权代替签字批准。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测报告', '授权签字'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_143',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '根据《检验检测机构资质认定能力评价检验检测机构通用要求》（RB/T 214—2017），授权签字人是由检验检测机构提名，经资质认定部门考核合格后，在其资质认定授权的能力范围内签发（）的人员。',
      options: [
        { key: 'A', content: '检验检测报告或证书' },
        { key: 'B', content: '质量手册' },
        { key: 'C', content: '程序文件' },
        { key: 'D', content: '作业指导书' }
      ],
      answer: 'A',
      analysis: '授权签字人是由检验检测机构提名，经资质认定部门考核合格后，在其资质认定授权的能力范围内签发检验检测报告或证书的人员。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '授权签字人', '资质认定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_144',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测专用章加盖在检验检测报告封面的机构名称位置或检验检测结论位置，骑缝位置也应加盖。加盖骑缝章应确保（）',
      options: [
        { key: 'A', content: '每页均有完整印章' },
        { key: 'B', content: '每页均有印章痕迹' },
        { key: 'C', content: '只在首页加盖' },
        { key: 'D', content: '只在末页加盖' }
      ],
      answer: 'B',
      analysis: '检验检测专用章加盖在检验检测报告封面的机构名称位置或检验检测结论位置，骑缝位置也应加盖。加盖骑缝章应确保每页均有印章痕迹。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测报告', '加盖印章'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_145',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '在资质认定范围内出具的检验检测报告上予以使用资质认定标志，加盖（或印刷）在检验检测报告封面上部适当位置（一般在左上角位置）。该标志是（）',
      options: [
        { key: 'A', content: 'ISO标志' },
        { key: 'B', content: 'CMA标志' },
        { key: 'C', content: 'CNAS标志' },
        { key: 'D', content: '企业标志' }
      ],
      answer: 'B',
      analysis: '在资质认定范围内出具的检验检测报告上予以使用资质认定标志（CMA标志），加盖（或印刷）在检验检测报告封面上部适当位置（一般在左上角位置）。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '检测报告', 'CMA标志'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_146',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '当怀疑、发现得知有关于报告数据或结论有误的信息后，技术负责人应立即从技术管理室资料员处调阅原检测报告档案，迅速组织有关试验室的负责人、监督员和检测员对报告中的（）进行核查。',
      options: [
        { key: 'A', content: '格式问题' },
        { key: 'B', content: '可疑数据或遗漏部分' },
        { key: 'C', content: '签字问题' },
        { key: 'D', content: '印章问题' }
      ],
      answer: 'B',
      analysis: '当怀疑、发现得知有关于报告数据或结论有误的信息后，技术负责人应立即从技术管理室资料员处调阅原检测报告档案，迅速组织有关试验室的负责人、监督员和检测员对报告中的可疑数据或遗漏部分进行核查。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测报告', '可疑结果处理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_147',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构留存的"检测报告的修改/补充文件"应与原检测报告（）',
      options: [
        { key: 'A', content: '分开存档保管' },
        { key: 'B', content: '一并存档保管' },
        { key: 'C', content: '销毁处理' },
        { key: 'D', content: '交委托方保管' }
      ],
      answer: 'B',
      analysis: '检验检测机构留存的"检测报告的修改/补充文件"应与原检测报告一并存档保管。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '检测报告', '归档管理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_148',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '当委托人提出通过电话或传真或电子邮件发送报告，则检验检测机构经办人应详细询问并记录委托人的姓名、电话、传真号码（电子信箱）、收件人姓名，还应认真仔细核对（）',
      options: [
        { key: 'A', content: '委托人的身份证号' },
        { key: 'B', content: '委托检测合同中的记录内容' },
        { key: 'C', content: '委托人的银行账号' },
        { key: 'D', content: '委托人的工作单位' }
      ],
      answer: 'B',
      analysis: '当委托人提出通过电话或传真或电子邮件发送报告，则检验检测机构经办人应详细询问并记录委托人的姓名、电话、传真号码（电子信箱）、收件人姓名，还应认真仔细核对委托检测合同中的记录内容。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测报告', '发送程序'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_149',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '有保密要求的文件（包括检测报告）应由机要部门经手交接，不得通过（）',
      options: [
        { key: 'A', content: '专人送达' },
        { key: 'B', content: '机要部门' },
        { key: 'C', content: '邮局邮寄' },
        { key: 'D', content: '双方协商的方式' }
      ],
      answer: 'C',
      analysis: '有保密要求的文件（包括检测报告）应由机要部门经手交接，不得通过邮局邮寄。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '保密管理', '文件交接'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_150',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '资质认定制度最早始于（）年，经过多年的发展，这项对我国检验检测市场的准入制度由最初的产品质量检验机构计量认证制度演变为检验检测机构资质认定制度。',
      options: [
        { key: 'A', content: '1980' },
        { key: 'B', content: '1985' },
        { key: 'C', content: '1990' },
        { key: 'D', content: '1995' }
      ],
      answer: 'B',
      analysis: '资质认定制度最早始于1985年，经过多年的发展，这项对我国检验检测市场的准入制度由最初的产品质量检验机构计量认证制度演变为检验检测机构资质认定制度，并成为我国检验检测机构进入检验检测市场的基本准入制度。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '资质认定', '制度发展'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 4题 ==========
    {
      id: 'basic_151',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检测报告的校/审核过程可作为参考的内容包括（）',
      options: [
        { key: 'A', content: '试验室负责人或质量监督员可对检测过程进行监督并对原始记录和检测报告进行检查核对' },
        { key: 'B', content: '由指定的技术人员对编写好的报告和原始记录进行技术性校核，并签字' },
        { key: 'C', content: '已经定稿交付打印的检测报告由技术管理室负责管理性审查' },
        { key: 'D', content: '经校核和管理性审查的检测报告，由检验检测机构指定的可以承担审核工作的技术人员审核并签字' }
      ],
      answer: 'A,B,C,D',
      analysis: '检测报告的校/审核过程包括：试验室负责人或质量监督员对检测过程进行监督并对原始记录和检测报告进行检查核对；由指定的技术人员对编写好的报告和原始记录进行技术性校核；已经定稿交付打印的检测报告由技术管理室负责管理性审查；经校核和管理性审查的检测报告，由检验检测机构指定的可以承担审核工作的技术人员审核并签字。',
      difficulty: DifficultyLevel.HARD,
      tags: ['基础知识', '检测报告', '校审核程序'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_152',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检测报告的基本格式主要由（）组成。',
      options: [
        { key: 'A', content: '封面、扉页' },
        { key: 'B', content: '报告主页' },
        { key: 'C', content: '附件' },
        { key: 'D', content: '委托合同' }
      ],
      answer: 'A,B,C',
      analysis: '检验检测机构的检测报告应设计规范统一的格式，报告主要由封面、扉页、报告主页、附件组成。委托合同不属于检测报告的组成部分。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测报告', '基本格式'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_153',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '报告发送记录应包含以下内容（）',
      options: [
        { key: 'A', content: '发送报告的编号、报告发送的数量' },
        { key: 'B', content: '采用挂号信发送的应有挂号信回执单据，直接送达的应有接收人签字' },
        { key: 'C', content: '通过电子信箱送达的应有接收人确认收到报告的电子回函记录' },
        { key: 'D', content: '发送记录的汇总文件，经办人签字' }
      ],
      answer: 'A,B,C,D',
      analysis: '报告发送记录应包含：发送报告的编号、报告发送的数量、采用挂号信发送的应有挂号信回执单据、直接送达的应有接收人签字、通过电子信箱送达的应有接收人确认收到报告的电子回函记录、发送记录的汇总文件、经办人签字等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测报告', '发送记录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_154',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '留存的检测报告正本应与委托检测协议（检测任务指令）、原始记录、委托人修改检测方案的书面请求，以及分包检测和批准的例外允许申请等有关的文件一并归档保存。这些文件包括（）',
      options: [
        { key: 'A', content: '委托检测协议（检测任务指令）' },
        { key: 'B', content: '原始记录' },
        { key: 'C', content: '委托人修改检测方案的书面请求' },
        { key: 'D', content: '分包检测和批准的例外允许申请' }
      ],
      answer: 'A,B,C,D',
      analysis: '留存的检测报告正本应与委托检测协议（检测任务指令）、原始记录、委托人修改检测方案的书面请求，以及分包检测和批准的例外允许申请等有关的文件一并归档保存。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测报告', '归档保存'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 6题 ==========
    {
      id: 'basic_155',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '授权签字人应按授权的专业范围和规定的替补顺序行使检测报告的批准签字职权，任何情况下，不得超越范围。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。授权签字人应按授权的专业范围和规定的替补顺序行使检测报告的批准签字职权，任何情况下，不得超越范围。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '授权签字人', '职权范围'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_156',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '授权签字人需要变更（免除或增加）的，检验检测机构应按要求向资质认定发证机关履行变更手续，并由依法组成的资质认定评审组对新推荐提名的授权签字人进行考核，合格后按程序上报国家认证认可监督管理委员会批准，方可获得对授权范围的检测报告签字批准职权。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。授权签字人需要变更（免除或增加）的，检验检测机构应按要求向资质认定发证机关履行变更手续，并由依法组成的资质认定评审组对新推荐提名的授权签字人进行考核，合格后按程序上报国家认证认可监督管理委员会批准，方可获得对授权范围的检测报告签字批准职权。',
      difficulty: DifficultyLevel.HARD,
      tags: ['基础知识', '授权签字人', '变更程序'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_157',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测机构的任何人员，不得违反规定私自发布、公布、评价检测结果，也不得通过任何方式向任何人透露检测数据和结果。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检验检测机构的任何人员，不得违反规定私自发布、公布、评价检测结果，也不得通过任何方式向任何人透露检测数据和结果。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '保密管理', '检测结果'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_158',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '当委托人提出索要检测报告的磁盘文件时，检验检测机构向委托人申明，检测报告的磁盘文件不具有法律效力，其结果仅供参考。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。当委托人提出索要检测报告的磁盘文件时，检验检测机构向委托人申明，检测报告的磁盘文件不具有法律效力，其结果仅供参考。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检测报告', '法律效力'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_159',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '保密文件的交接必须严格履行规定程序，并留有记录。委托单位的保密文件应按委托时双方协商的方式进行交接。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。保密文件的交接必须严格履行规定程序，并留有记录。委托单位的保密文件应按委托时双方协商的方式进行交接。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '保密管理', '文件交接'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_160',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '检验检测行业是高技术服务业、生产性服务业、科技服务业，具有公共保障性和市场开放性的特征。检验检测与计量、标准、认证认可共同构成国家质量基础设施，是现代服务业的重要组成部分。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。检验检测行业是高技术服务业、生产性服务业、科技服务业，具有公共保障性和市场开放性的特征。检验检测与计量、标准、认证认可共同构成国家质量基础设施，是现代服务业的重要组成部分。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '检验检测行业', '资质认定'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}


/**
 * 混凝土工程题目
 */
function getConcreteQuestions(timestamp: number): Question[] {
  return [
    {
      id: 'concrete_001',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 混凝土原材料检测',
      content: '普通硅酸盐水泥的初凝时间不得早于（）分钟。',
      options: [
        { key: 'A', content: '30' },
        { key: 'B', content: '45' },
        { key: 'C', content: '60' },
        { key: 'D', content: '90' }
      ],
      answer: 'B',
      analysis: '根据GB 175-2007《通用硅酸盐水泥》规定，普通硅酸盐水泥的初凝时间不得早于45分钟，终凝时间不得迟于600分钟。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '水泥', '凝结时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_002',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第一章 混凝土原材料检测',
      content: '混凝土用砂的细度模数在（）范围内为中砂。',
      options: [
        { key: 'A', content: '1.6~2.2' },
        { key: 'B', content: '2.3~3.0' },
        { key: 'C', content: '3.1~3.7' },
        { key: 'D', content: '3.7以上' }
      ],
      answer: 'B',
      analysis: '根据砂的细度模数划分：粗砂3.7~3.1，中砂3.0~2.3，细砂2.2~1.6，特细砂1.5~0.7。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '砂', '细度模数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_003',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土性能检测',
      content: '影响混凝土强度的主要因素有（）',
      options: [
        { key: 'A', content: '水灰比' },
        { key: 'B', content: '养护条件' },
        { key: 'C', content: '骨料质量' },
        { key: 'D', content: '施工方法' }
      ],
      answer: 'A,B,C,D',
      analysis: '影响混凝土强度的因素很多，主要包括：水灰比（最主要因素）、养护条件（温度、湿度）、骨料质量、施工方法等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '强度', '影响因素'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_004',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第二章 混凝土性能检测',
      content: '混凝土标准养护条件为温度20±2℃，相对湿度95%以上。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '根据GB/T 50081规定，混凝土标准养护条件为：温度20±2℃，相对湿度95%以上。',
      difficulty: DifficultyLevel.EASY,
      tags: ['混凝土', '养护', '标准条件'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'concrete_005',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_CONCRETE,
      chapter: '第三章 混凝土结构检测',
      content: '回弹法检测混凝土强度时，测区数不应少于（）个。',
      options: [
        { key: 'A', content: '5' },
        { key: 'B', content: '10' },
        { key: 'C', content: '15' },
        { key: 'D', content: '20' }
      ],
      answer: 'B',
      analysis: '根据JGJ/T 23-2011《回弹法检测混凝土抗压强度技术规程》，每一结构或构件的测区数不应少于10个。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['混凝土', '回弹法', '测区'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}


/**
 * 岩土工程（岩石、土工）题目
 */
function getGeotechnicalRockQuestions(timestamp: number): Question[] {
  return [
    {
      id: 'rock_001',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石基本性质',
      content: '岩石的饱和单轴抗压强度与干燥单轴抗压强度之比称为（）',
      options: [
        { key: 'A', content: '软化系数' },
        { key: 'B', content: '风化系数' },
        { key: 'C', content: '强度系数' },
        { key: 'D', content: '弹性系数' }
      ],
      answer: 'A',
      analysis: '软化系数是岩石饱和单轴抗压强度与干燥单轴抗压强度之比，反映岩石抗水软化的能力。软化系数越小，岩石越容易被水软化。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土', '岩石', '软化系数'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'rock_002',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第一章 岩石基本性质',
      content: '根据岩石的饱和单轴抗压强度，坚硬岩的强度应大于（）MPa。',
      options: [
        { key: 'A', content: '30' },
        { key: 'B', content: '60' },
        { key: 'C', content: '90' },
        { key: 'D', content: '120' }
      ],
      answer: 'B',
      analysis: '根据《工程岩体分级标准》，岩石按饱和单轴抗压强度分为：坚硬岩>60MPa，较硬岩30~60MPa，较软岩15~30MPa，软岩5~15MPa，极软岩<5MPa。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土', '岩石', '强度分级'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'rock_003',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 土的物理性质',
      content: '土的三相组成包括（）',
      options: [
        { key: 'A', content: '固相（土粒）' },
        { key: 'B', content: '液相（水）' },
        { key: 'C', content: '气相（空气）' },
        { key: 'D', content: '有机质' }
      ],
      answer: 'A,B,C',
      analysis: '土是由固相（土粒）、液相（水）和气相（空气）三部分组成的三相体系。有机质属于固相的一部分，不是独立的相。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土', '土', '三相组成'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'rock_004',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 土的物理性质',
      content: '土的含水率是指土中水的质量与（）的比值。',
      options: [
        { key: 'A', content: '土的总质量' },
        { key: 'B', content: '干土质量' },
        { key: 'C', content: '土粒质量' },
        { key: 'D', content: '饱和土质量' }
      ],
      answer: 'B',
      analysis: '土的含水率定义为土中水的质量与干土质量之比，用百分数表示。w = mw/ms × 100%',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土', '土', '含水率'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'rock_005',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第三章 土的力学性质',
      content: '土的压缩系数越大，说明土的压缩性越高。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '压缩系数a是表征土压缩性的指标，压缩系数越大，土在相同压力增量下的压缩量越大，即压缩性越高。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土', '土', '压缩性'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}


/**
 * 岩土工程（地基与基础）题目
 */
function getFoundationQuestions(timestamp: number): Question[] {
  return [
    {
      id: 'foundation_001',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第一章 地基基础概述',
      content: '地基承载力特征值是指（）',
      options: [
        { key: 'A', content: '地基土的极限承载力' },
        { key: 'B', content: '地基土的容许承载力' },
        { key: 'C', content: '由载荷试验测定的地基土压力变形曲线线性变形段内规定的变形所对应的压力值' },
        { key: 'D', content: '地基土的标准承载力' }
      ],
      answer: 'C',
      analysis: '地基承载力特征值是由载荷试验测定的地基土压力变形曲线线性变形段内规定的变形所对应的压力值，其最大值为比例界限值。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['地基', '承载力', '特征值'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'foundation_002',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第一章 地基基础概述',
      content: '地基处理的目的包括（）',
      options: [
        { key: 'A', content: '提高地基承载力' },
        { key: 'B', content: '减少地基沉降' },
        { key: 'C', content: '防止地基液化' },
        { key: 'D', content: '增加地基渗透性' }
      ],
      answer: 'A,B,C',
      analysis: '地基处理的主要目的是提高地基承载力、减少地基沉降、防止地基液化等，而不是增加渗透性。',
      difficulty: DifficultyLevel.EASY,
      tags: ['地基', '处理', '目的'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'foundation_003',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
      chapter: '第二章 地基检测',
      content: '静载荷试验是确定地基承载力最可靠的方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '静载荷试验直接在现场对地基土进行加载试验，能够真实反映地基土的承载性能，是确定地基承载力最可靠的方法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['地基', '静载荷试验', '承载力'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}

/**
 * 量测题目
 */
function getMeasurementQuestions(timestamp: number): Question[] {
  return [
    {
      id: 'measure_001',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 测量基础',
      content: '水准测量中，转点的作用是（）',
      options: [
        { key: 'A', content: '传递高程' },
        { key: 'B', content: '确定方向' },
        { key: 'C', content: '测量距离' },
        { key: 'D', content: '校核仪器' }
      ],
      answer: 'A',
      analysis: '在水准测量中，当两点之间距离较远或高差较大时，需要设置转点来传递高程。转点是临时性的，测量完成后不需要保留。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '水准测量', '转点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'measure_002',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第一章 测量基础',
      content: '全站仪测量的基本原理是（）',
      options: [
        { key: 'A', content: '三角测量原理' },
        { key: 'B', content: '电磁波测距原理' },
        { key: 'C', content: '水准测量原理' },
        { key: 'D', content: 'GPS定位原理' }
      ],
      answer: 'B',
      analysis: '全站仪是一种集测角、测距于一体的测量仪器，其测距功能基于电磁波测距原理，通过测量电磁波往返时间来计算距离。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['量测', '全站仪', '测距原理'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'measure_003',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MEASUREMENT,
      chapter: '第二章 变形监测',
      content: '建筑物沉降观测的主要内容包括（）',
      options: [
        { key: 'A', content: '沉降量' },
        { key: 'B', content: '沉降速率' },
        { key: 'C', content: '不均匀沉降' },
        { key: 'D', content: '倾斜' }
      ],
      answer: 'A,B,C,D',
      analysis: '建筑物沉降观测的主要内容包括：沉降量、沉降速率、不均匀沉降、倾斜等，这些数据对于评估建筑物安全性非常重要。',
      difficulty: DifficultyLevel.EASY,
      tags: ['量测', '沉降观测', '监测内容'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}


/**
 * 金属结构题目（基础题目）
 */
function getMetalStructureQuestions(timestamp: number): Question[] {
  return [
    {
      id: 'metal_base_001',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 金属结构概述',
      content: '水工金属结构按用途分类，不包括以下哪种？',
      options: [
        { key: 'A', content: '闸门' },
        { key: 'B', content: '启闭机' },
        { key: 'C', content: '拦污栅' },
        { key: 'D', content: '混凝土搅拌机' }
      ],
      answer: 'D',
      analysis: '水工金属结构按用途分类主要包括：闸门、启闭机、拦污栅、清污机等。混凝土搅拌机属于施工机械，不属于水工金属结构。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_base_002',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第一章 金属结构概述',
      content: '平面闸门按门叶结构形式分类，最常见的是（）',
      options: [
        { key: 'A', content: '平板闸门' },
        { key: 'B', content: '弧形闸门' },
        { key: 'C', content: '人字闸门' },
        { key: 'D', content: '拱形闸门' }
      ],
      answer: 'A',
      analysis: '平面闸门按门叶结构形式分类，最常见的是平板闸门，其结构简单、制造方便、维护容易。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '闸门', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_base_003',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 金属结构检测',
      content: '金属结构焊缝检测的方法包括（）',
      options: [
        { key: 'A', content: '外观检查' },
        { key: 'B', content: '超声波检测' },
        { key: 'C', content: '射线检测' },
        { key: 'D', content: '磁粉检测' }
      ],
      answer: 'A,B,C,D',
      analysis: '金属结构焊缝检测方法包括：外观检查、超声波检测（UT）、射线检测（RT）、磁粉检测（MT）、渗透检测（PT）等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝', '检测方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_base_004',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 金属结构检测',
      content: '超声波检测可以检测焊缝内部缺陷的位置和大小。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '超声波检测是利用超声波在介质中传播时遇到缺陷会产生反射的原理，可以检测焊缝内部缺陷的位置、大小和性质。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '超声波检测'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}

/**
 * 机械电气题目
 */
function getMechanicalElectricalQuestions(timestamp: number): Question[] {
  return [
    {
      id: 'mech_001',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 机械设备检测',
      content: '启闭机按工作原理分类，不包括以下哪种？',
      options: [
        { key: 'A', content: '固定卷扬式启闭机' },
        { key: 'B', content: '液压启闭机' },
        { key: 'C', content: '螺杆式启闭机' },
        { key: 'D', content: '气动启闭机' }
      ],
      answer: 'D',
      analysis: '启闭机按工作原理分类主要包括：固定卷扬式、移动式、液压式、螺杆式等。气动启闭机在水利工程中很少使用。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '启闭机', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_002',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第一章 机械设备检测',
      content: '液压启闭机的主要优点是（）',
      options: [
        { key: 'A', content: '结构简单' },
        { key: 'B', content: '传动平稳、启闭力大' },
        { key: 'C', content: '维护方便' },
        { key: 'D', content: '成本低廉' }
      ],
      answer: 'B',
      analysis: '液压启闭机的主要优点是传动平稳、启闭力大、可实现无级调速、便于自动控制等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '液压启闭机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_003',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第二章 电气设备检测',
      content: '电气设备绝缘电阻测试的目的包括（）',
      options: [
        { key: 'A', content: '检查绝缘是否受潮' },
        { key: 'B', content: '检查绝缘是否老化' },
        { key: 'C', content: '检查绝缘是否有缺陷' },
        { key: 'D', content: '检查设备功率' }
      ],
      answer: 'A,B,C',
      analysis: '电气设备绝缘电阻测试的目的是检查绝缘是否受潮、老化、有缺陷等，以确保设备安全运行。检查设备功率不是绝缘电阻测试的目的。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['机械电气', '电气设备', '绝缘测试'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'mech_004',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_MECHANICAL,
      chapter: '第二章 电气设备检测',
      content: '兆欧表是测量电气设备绝缘电阻的常用仪器。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '兆欧表（又称摇表、绝缘电阻表）是测量电气设备绝缘电阻的常用仪器，可以测量电机、变压器、电缆等设备的绝缘电阻。',
      difficulty: DifficultyLevel.EASY,
      tags: ['机械电气', '兆欧表', '绝缘测试'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
