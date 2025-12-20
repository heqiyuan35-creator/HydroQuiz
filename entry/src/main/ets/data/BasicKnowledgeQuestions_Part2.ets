/**
 * 基础知识题目 - 第二部分（第三章 检验检测机构资质认定制度）
 * 新增20题：单选10题(50%)、多选4题(20%)、判断6题(30%)
 * 内容来源：质量检测工作基础知识（第3版）第三章
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取基础知识扩展题目 - 检验检测机构资质认定制度
 */
export function getBasicKnowledgeQuestionsPart2(timestamp: number): Question[] {
  return [
    // ========== 单选题 10题 ==========
    {
      id: 'basic_161',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '1987年国家计量局颁布的《产品质量检验机构计量认证管理办法》同时废止。《实验室和检查机构资质认定管理办法》第六条规定：资质认定的形式包括计量认证和审查认可。（）号令的实施，使《中华人民共和国认证认可条例》确定的实验室和检查机构资质认定制度逐步规范、完善和发展。',
      options: [
        { key: 'A', content: '76' },
        { key: 'B', content: '86' },
        { key: 'C', content: '96' },
        { key: 'D', content: '106' }
      ],
      answer: 'B',
      analysis: '86号令的实施，使《中华人民共和国认证认可条例》确定的实验室和检查机构资质认定制度逐步规范、完善和发展。于2006年4月1日起实施。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '资质认定', '管理办法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_162',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '2006年7月27日，为贯彻落实《实验室和检查机构资质认定管理办法》，国家认监委印发了《实验室资质认定评审准则》（国认实函[2006]141），自（）年1月1日开始实施。',
      options: [
        { key: 'A', content: '2006' },
        { key: 'B', content: '2007' },
        { key: 'C', content: '2008' },
        { key: 'D', content: '2009' }
      ],
      answer: 'B',
      analysis: '《实验室资质认定评审准则》自2007年1月1日开始实施，同时原国家质量技术监督局2000年发布的《产品质量检验机构计量认证/审查认可（验收）评审准则》（试行）废止。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '资质认定', '评审准则'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_163',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '2015年3月，国家质量监督检验检疫总局审议通过《检验检测机构资质认定管理办法》（简称"163号令"），于2015年4月9日公布，自（）年8月1日实施。',
      options: [
        { key: 'A', content: '2015' },
        { key: 'B', content: '2016' },
        { key: 'C', content: '2017' },
        { key: 'D', content: '2018' }
      ],
      answer: 'A',
      analysis: '《检验检测机构资质认定管理办法》于2015年4月9日公布，自2015年8月1日实施。该办法体现了"简政放权、放管结合、优化服务"的行政审批制度改革要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '资质认定', '163号令'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_164',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '2017年10月16日，国家认监委发布了《检验检测机构资质认定能力评价 检验检测机构通用要求》（RB/T 214—2017）等（）项认证认可行业标准，作为检验检测机构资质认定评审和管理的要求。',
      options: [
        { key: 'A', content: '5' },
        { key: 'B', content: '6' },
        { key: 'C', content: '7' },
        { key: 'D', content: '8' }
      ],
      answer: 'C',
      analysis: '2017年10月16日，国家认监委发布了《检验检测机构资质认定能力评价 检验检测机构通用要求》（RB/T 214—2017）等7项认证认可行业标准。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '资质认定', '行业标准'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_165',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '《检验检测机构资质认定能力评价 检验检测机构通用要求》（RB/T 214—2017）采用了国际标准《检测和校准实验室能力的通用要求》（ISO/IEC 17025:2017）的要求，规定了对检验检测机构进行资质认定能力评价时，在（）方面的通用要求。',
      options: [
        { key: 'A', content: '机构、人员、场所' },
        { key: 'B', content: '机构、人员、场所环境' },
        { key: 'C', content: '机构、人员、场所环境、设备设施' },
        { key: 'D', content: '机构、人员、场所环境、设备设施和管理体系' }
      ],
      answer: 'D',
      analysis: 'RB/T 214—2017规定了对检验检测机构进行资质认定能力评价时，在机构、人员、场所环境、设备设施和管理体系方面的通用要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '资质认定', 'RB/T 214'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_166',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '2001年8月29日，国家认证认可监督管理委员会（以下简称"国家认监委"）成立，产品质量检验机构计量认证、审查认可（验收）职能划转到国家认监委，产品质量检验机构计量认证和审查认可（验收）成为国家认监委的（）项行政许可制度。',
      options: [
        { key: 'A', content: '一' },
        { key: 'B', content: '两' },
        { key: 'C', content: '三' },
        { key: 'D', content: '四' }
      ],
      answer: 'B',
      analysis: '产品质量检验机构计量认证和审查认可（验收）成为国家认监委的两项行政许可制度。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '资质认定', '国家认监委'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_167',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '2003年9月3日，国务院公布了《中华人民共和国认证认可条例》（中华人民共和国国务院令第390号），自2003年（）月1日起正式实施。',
      options: [
        { key: 'A', content: '9' },
        { key: 'B', content: '10' },
        { key: 'C', content: '11' },
        { key: 'D', content: '12' }
      ],
      answer: 'C',
      analysis: '《中华人民共和国认证认可条例》自2003年11月1日起正式实施。其中第十六条规定："向社会出具具有证明作用的数据和结果的检查机构、实验室，应当具备有关法律、行政法规规定的基本条件和能力，并依法经认定后，方可从事相应活动，认定结果由国务院认证认可监督管理部门公布。"',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '资质认定', '认证认可条例'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_168',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '为了使实验室认可工作同国际通行做法完全一致，使我国的实验室管理水平和检测能力同国际惯例接轨，1994年9月原国家技术监督局成立了中国实验室国家认可委员会（英文缩写CNACL），由CNACL负责实验室认可工作，其运作程序同国际通行做法完全一致，运行数年来已为国际同行所认可，（）年同亚太实验室认可合作组织（APLAC）有关成员签署了互认协议。',
      options: [
        { key: 'A', content: '1997' },
        { key: 'B', content: '1998' },
        { key: 'C', content: '1999' },
        { key: 'D', content: '2000' }
      ],
      answer: 'C',
      analysis: '1999年同亚太实验室认可合作组织（APLAC）有关成员签署了互认协议，2000年又同国际实验室认可合作组织（ILAC）的35个成员签署了互认协议。',
      difficulty: DifficultyLevel.HARD,
      tags: ['基础知识', '实验室认可', 'CNACL'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_169',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '2006年3月31日，中国实验室认可委员会又与中国认证机构国家认可委员会合并，组建了中国合格评定国家认可委员会，简称（）。',
      options: [
        { key: 'A', content: 'CNACL' },
        { key: 'B', content: 'CNAL' },
        { key: 'C', content: 'CNAS' },
        { key: 'D', content: 'CCIB' }
      ],
      answer: 'C',
      analysis: '2006年3月31日，中国实验室认可委员会又与中国认证机构国家认可委员会合并，组建了中国合格评定国家认可委员会，简称CNAS。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '实验室认可', 'CNAS'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_170',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '截至2005年年底，全国计量认证证书共发放20574张，获证实验室达2万余家（有的实验室以不同名义获多张证书）。计量认证已经成为一个"品牌"，是目前我国实验室评价管理工作中应用范围最广、知名度最高的管理模式。经济活动中评价产品质量的检验报告必须带有（）标志已成为社会共识。',
      options: [
        { key: 'A', content: 'CMA' },
        { key: 'B', content: 'CAL' },
        { key: 'C', content: 'CNAS' },
        { key: 'D', content: '计量认证' }
      ],
      answer: 'D',
      analysis: '经济活动中评价产品质量的检验报告必须带有计量认证标志已成为社会共识。计量认证是具有中国特色的政府对实验室的强制认可。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量认证', '检验报告'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 4题 ==========
    {
      id: 'basic_171',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '计量认证与审查认可（验收）的社会作用包括（）',
      options: [
        { key: 'A', content: '承担了产品质量监督检验、质量仲裁检验、商贸验货检验' },
        { key: 'B', content: '药品检验、防疫检验、工程质量检测、环境监测、地质勘测' },
        { key: 'C', content: '节能监测和进出口等大量的检测任务' },
        { key: 'D', content: '为工农业生产和工程项目出据了科学、准确、可靠的检测数据' }
      ],
      answer: 'A,B,C,D',
      analysis: '计量认证与审查认可（验收）的社会作用涵盖了国民经济各个领域，包括产品质量监督检验、质量仲裁检验、商贸验货检验、药品检验、防疫检验、工程质量检测、环境监测、地质勘测、节能监测和进出口等大量的检测任务。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量认证', '社会作用'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_172',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '国家发布的法律法规和有关部门发布的部门规章中，凡涉及检验检测机构资质的，都把计量认证作为必要的前置资质要求。例如（）',
      options: [
        { key: 'A', content: '2004年4月30日国务院令第405号颁布的《中华人民共和国道路交通安全法实施条例》第十五条规定："质量技术监督部门负责对机动车安全技术检验机构实行资格管理和计量认证管理。"' },
        { key: 'B', content: '2004年12月16日中国气象局第8号令发布的《防雷减灾管理办法》第二十九条规定："防雷产品检测机构应当通过计量认证。"' },
        { key: 'C', content: '2006年4月29日中华人民共和国主席令第49号颁布的《中华人民共和国农产品质量安全法》第三十五条规定："农产品质量安全检测机构应当依法经计量认证合格。"' },
        { key: 'D', content: '2005年9月28日建设部令第141号发布的《建设工程质量检测管理办法》第五条规定："申请建设工程检测资质，需要提供与所申请资质范围相对应的计量认证证书。"' }
      ],
      answer: 'A,B,C,D',
      analysis: '由此可见，计量认证作为我国政府强制实施的一种资质认定形式，已经被多部法律法规所引用，产生极其深远的社会影响。',
      difficulty: DifficultyLevel.HARD,
      tags: ['基础知识', '计量认证', '法律法规'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_173',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '2015年7月31日，为贯彻落实《检验检测机构资质认定管理办法》，国家认监委印发了《国家认监委关于实施〈检验检测机构资质认定管理办法〉的若干意见》（国认实[2015]49号），该若干意见就"检验检测机构资质认定实施范围""检验检测机构主体准入条件"等（）个方面提出了指导意见。',
      options: [
        { key: 'A', content: '8' },
        { key: 'B', content: '10' },
        { key: 'C', content: '12' },
        { key: 'D', content: '15' }
      ],
      answer: 'C',
      analysis: '该若干意见就"检验检测机构资质认定实施范围""检验检测机构主体准入条件""调整有关检验检测机构资质、资格许可权限"等12个方面提出了指导意见。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '资质认定', '若干意见'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_174',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '2015年7月31日，国家认监委印发了《国家认监委关于印发检验检测机构资质认定配套工作程序和技术要求的通知》（国认实[2015]50号），包括（）等15份配套工作程序和技术要求。',
      options: [
        { key: 'A', content: '《检验检测机构资质认定评审准则》（试行）' },
        { key: 'B', content: '《检验检测机构资质认定 公正性和保密性要求》' },
        { key: 'C', content: '《检验检测机构资质认定评审员管理要求》' },
        { key: 'D', content: '《检验检测机构资质认定证书和标志管理要求》' }
      ],
      answer: 'A,B,C,D',
      analysis: '国认实[2015]50号包括《检验检测机构资质认定评审准则》（试行）、《检验检测机构资质认定 公正性和保密性要求》等15份配套工作程序和技术要求。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '资质认定', '配套文件'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 6题 ==========
    {
      id: 'basic_175',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '计量认证是我国通过计量立法，对凡是为社会出具公证数据的检验检测机构（实验室）进行强制考核的一种手段，也可以说，计量认证是具有中国特色的政府对实验室的强制认可。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。计量认证是我国通过计量立法，对凡是为社会出具公证数据的检验检测机构（实验室）进行强制考核的一种手段，也可以说，计量认证是具有中国特色的政府对实验室的强制认可。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '计量认证', '强制认可'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_176',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '审查认可（验收）是政府质量管理部门对依法设置或授权承担产品质量检验任务的质检机构设立条件、界定任务范围、检验能力考核、最终授权（验收）的强制性管理手段。这一授权（验收）前的评审，当然也完全可以建立在计量认证/审查认可评审或实验室认可评审的基础上。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。这样就可以大大减少对实验室的重复评审，这是多年来质检机构（实验室）一直期盼的。为此，将计量认证和审查认可（验收）评审内容统一，正是我们改革调整发展的真正目的。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '审查认可', '授权验收'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_177',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: 'CNACL实验室认可工作是我国完全与国际惯例接轨的一套国家实验室认可体系，目前已有亚太、欧洲、南非和南美洲等地区实验室认可机构等国外认可机构承认其认可结果。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。CNACL实验室认可工作是我国完全与国际惯例接轨的一套国家实验室认可体系，目前已有亚太、欧洲、南非和南美洲等地区实验室认可机构等国外认可机构承认其认可结果。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '实验室认可', 'CNACL'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_178',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '为推动实验室认可在我国的发展，对于一些特定实验室（如国家质检中心、省级产品质量检纤检所），政府授权实验室认可委员会从事原来由政府直接组织专家进行的技术评审工作，这是体现政府职能转变、政事分开的一项重大举措。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。为了减轻实验室负担，对于同时申请实验室认可和资质认定（计量认证、审查认可）的，国家鼓励其同时进行评审，通过后分别发证。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '实验室认可', '政府职能'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_179',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '按照国际惯例，申请实验室认可是实验室的自愿行为。实验室为完善其内部质量体系和技术保证能力向认可机构申请认可，由认可机构对其质量体系和技术能力进行评审，进而做出是否符合认可准则的评价结论。如获得认可证书，则证明其具备向用户、社会及政府提供自身质量保证的能力。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。按照国际惯例，申请实验室认可是实验室的自愿行为。实验室为完善其内部质量体系和技术保证能力向认可机构申请认可，由认可机构对其质量体系和技术能力进行评审。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['基础知识', '实验室认可', '自愿行为'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'basic_180',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_BASIC,
      chapter: '第三章 检验检测机构管理',
      content: '《检验检测机构资质认定管理办法》体现了"简政放权、放管结合、优化服务"的行政审批制度改革要求，顺应了检验检测行业快速发展的客观需要。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。《检验检测机构资质认定管理办法》体现了"简政放权、放管结合、优化服务"的行政审批制度改革要求，顺应了检验检测行业快速发展的客观需要。',
      difficulty: DifficultyLevel.EASY,
      tags: ['基础知识', '资质认定', '简政放权'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
