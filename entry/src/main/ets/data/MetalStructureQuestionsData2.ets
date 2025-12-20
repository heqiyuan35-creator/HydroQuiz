/**
 * 金属结构题目数据 - 第二部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：金属结构（第3版）第二章 焊接质量检验
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取金属结构题目（第二部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getMetalStructureQuestions2(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'metal_041',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊接质量检验是始终贯穿在金属结构制造安装过程中保证和控制焊接质量的重要手段之一。焊接质量检验分为焊前检验、过程检验和（）。',
      options: [
        { key: 'A', content: '焊后检验' },
        { key: 'B', content: '外观检验' },
        { key: 'C', content: '无损检验' },
        { key: 'D', content: '理化检验' }
      ],
      answer: 'A',
      analysis: '焊接质量检验分为焊前检验、过程检验和焊后检验。焊前检验的目的是以预防为主，督促做好施焊前的各项准备工作，最大限度地避免或减少焊接缺陷产生的可能性。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊接检验', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_042',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊前检验的目的是以（）为主，督促做好施焊前的各项准备工作，最大限度地避免或减少焊接缺陷产生的可能性。',
      options: [
        { key: 'A', content: '预防' },
        { key: 'B', content: '检测' },
        { key: 'C', content: '修复' },
        { key: 'D', content: '评定' }
      ],
      answer: 'A',
      analysis: '焊前检验的目的是以预防为主，督促做好施焊前的各项准备工作，最大限度地避免或减少焊接缺陷产生的可能性。焊前检验是保证焊接质量的前提。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊接检验', '焊前检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_043',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '过程检验的目的是防止和及时发现焊接缺陷，进行有效的焊接缺陷修复，保证焊接结构件在（）中的质量。',
      options: [
        { key: 'A', content: '制造过程' },
        { key: 'B', content: '设计过程' },
        { key: 'C', content: '运输过程' },
        { key: 'D', content: '安装过程' }
      ],
      answer: 'A',
      analysis: '过程检验的目的是防止和及时发现焊接缺陷，进行有效的焊接缺陷修复，保证焊接结构件在制造过程中的质量。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊接检验', '过程检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_044',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '闸门（含拦污栅）焊缝按其质量特性重要度分为（）类。',
      options: [
        { key: 'A', content: '三' },
        { key: 'B', content: '二' },
        { key: 'C', content: '四' },
        { key: 'D', content: '五' }
      ],
      answer: 'A',
      analysis: '闸门（含拦污栅）焊缝按其质量特性重要度分为三类：一类焊缝、二类焊缝、三类焊缝。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝分类', '闸门'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_045',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '闸门一类焊缝包括闸门主梁、边梁、臂柱的腹板及翼缘板的（）。',
      options: [
        { key: 'A', content: '对接焊缝' },
        { key: 'B', content: '角焊缝' },
        { key: 'C', content: '组合焊缝' },
        { key: 'D', content: '塞焊缝' }
      ],
      answer: 'A',
      analysis: '闸门一类焊缝包括：闸门主梁、边梁、臂柱的腹板及翼缘板的对接焊缝；闸门及拦污栅吊耳板与门叶或栅体连接的对接焊缝等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝分类', '一类焊缝'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_046',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '启闭机焊缝分类中，主梁、端梁、滑轮支座梁、卷筒支座梁的腹板和翼板的对接焊缝属于（）。',
      options: [
        { key: 'A', content: '一类焊缝' },
        { key: 'B', content: '二类焊缝' },
        { key: 'C', content: '三类焊缝' },
        { key: 'D', content: '四类焊缝' }
      ],
      answer: 'A',
      analysis: '启闭机一类焊缝包括：主梁、端梁、滑轮支座梁、卷筒支座梁的腹板和翼板的对接焊缝；支腿的腹板和翼板的对接焊缝，支腿与主梁连接的对接焊缝等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝分类', '启闭机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_047',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '压力钢管焊缝分为三类，其中钢管管壁纵缝、厂房内按明管设计的钢管管壁环缝、预留环缝、凑合节合拢环缝、坝内弹性垫层管的环缝属于（）。',
      options: [
        { key: 'A', content: '一类焊缝' },
        { key: 'B', content: '二类焊缝' },
        { key: 'C', content: '三类焊缝' },
        { key: 'D', content: '四类焊缝' }
      ],
      answer: 'A',
      analysis: '压力钢管一类焊缝包括：钢管管壁纵缝、厂房内按明管设计的钢管管壁环缝、预留环缝、凑合节合拢环缝、坝内弹性垫层管的环缝。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝分类', '压力钢管'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_048',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊缝外观质量检验包括直接外观检验和（）。',
      options: [
        { key: 'A', content: '间接外观检验' },
        { key: 'B', content: '无损检验' },
        { key: 'C', content: '理化检验' },
        { key: 'D', content: '破坏性检验' }
      ],
      answer: 'A',
      analysis: '焊缝外观质量检验包括直接外观检验和间接外观检验。直接外观检验是用眼睛直接观察测量焊缝的形状尺寸。间接外观检验必须借助于工业内窥镜等工具进行观察试验。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝检验', '外观检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_049',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊缝外观检验是用肉眼或借助样板，或用低倍放大镜（不大于5倍）观察焊缝外形尺寸的检验方法。在测量焊缝外形尺寸时，可采用（）。',
      options: [
        { key: 'A', content: '标准样板和量规' },
        { key: 'B', content: '超声波探伤仪' },
        { key: 'C', content: '射线探伤机' },
        { key: 'D', content: '磁粉探伤仪' }
      ],
      answer: 'A',
      analysis: '焊缝外观检验是用肉眼或借助样板，或用低倍放大镜（不大于5倍）观察焊缝外形尺寸的检验方法。在测量焊缝外形尺寸时，可采用标准样板和量规。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝检验', '外观检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_050',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊接检验人员应经过专门的技术培训，并取得相应的上岗资格证书。无损检测人员必须按照《无损检测人员资格鉴定与认证》（GB/T 9445）的要求进行培训和资格鉴定合格，取得（）并通过相关行业部门的资格认可。',
      options: [
        { key: 'A', content: '全国通用资格证书' },
        { key: 'B', content: '企业内部证书' },
        { key: 'C', content: '培训结业证书' },
        { key: 'D', content: '学历证书' }
      ],
      answer: 'A',
      analysis: '无损检测人员必须按照《无损检测人员资格鉴定与认证》（GB/T 9445）的要求进行培训和资格鉴定合格，取得全国通用资格证书并通过相关行业部门的资格认可。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊接检验', '人员资格'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_051',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '《无损检测 应用导则》（GB/T 5616）的原则和程序开展与其资格证书准许项目相同的检测工作，质量评定和检测报告审核应由（）级及以上的无损检测人员担任。',
      options: [
        { key: 'A', content: '2' },
        { key: 'B', content: '1' },
        { key: 'C', content: '3' },
        { key: 'D', content: '4' }
      ],
      answer: 'A',
      analysis: '《无损检测 应用导则》（GB/T 5616）的原则和程序开展与其资格证书准许项目相同的检测工作，质量评定和检测报告审核应由2级及以上的无损检测人员担任。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊接检验', '人员资格'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_052',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '常用的无损探伤方法有射线检验（RT）、超声波探伤（UT）、磁粉探伤（MT）、渗透探伤（PT）、衍射时差法超声检测（TOFD）等。其中射线检验、超声波探伤、衍射时差法超声检测主要用于检测（）。',
      options: [
        { key: 'A', content: '焊缝内部缺陷' },
        { key: 'B', content: '焊缝表面缺陷' },
        { key: 'C', content: '焊缝外观尺寸' },
        { key: 'D', content: '焊缝化学成分' }
      ],
      answer: 'A',
      analysis: '射线检验、超声波探伤、衍射时差法超声检测主要用于检测焊缝内部缺陷。磁粉探伤和渗透探伤主要用于检测焊缝表面缺陷。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_053',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '磁粉探伤和渗透探伤主要用于检测焊缝（）缺陷。',
      options: [
        { key: 'A', content: '表面' },
        { key: 'B', content: '内部' },
        { key: 'C', content: '根部' },
        { key: 'D', content: '全部' }
      ],
      answer: 'A',
      analysis: '磁粉探伤和渗透探伤主要用于检测焊缝表面缺陷。射线检验、超声波探伤、衍射时差法超声检测主要用于检测焊缝内部缺陷。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '无损检测', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_054',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '闸门二类焊缝包括闸门面板的对接焊缝、拦污栅主梁和边梁的腹板及翼缘板（）。',
      options: [
        { key: 'A', content: '对接焊缝' },
        { key: 'B', content: '角焊缝' },
        { key: 'C', content: '组合焊缝' },
        { key: 'D', content: '塞焊缝' }
      ],
      answer: 'A',
      analysis: '闸门二类焊缝包括：闸门面板的对接焊缝；拦污栅主梁和边梁的腹板及翼缘板对接焊缝；闸门主梁、边梁、臂柱的翼缘板与腹板的组合焊缝及角焊缝等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝分类', '二类焊缝'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_055',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '三类焊缝是指不属于一类焊缝、二类焊缝的（）。',
      options: [
        { key: 'A', content: '其他焊缝' },
        { key: 'B', content: '对接焊缝' },
        { key: 'C', content: '角焊缝' },
        { key: 'D', content: '组合焊缝' }
      ],
      answer: 'A',
      analysis: '三类焊缝：不属于一类焊缝、二类焊缝的其他焊缝。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝分类', '三类焊缝'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_056',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '启闭机二类焊缝包括主梁、端梁、支座梁、支腿的腹板和翼板的（）。',
      options: [
        { key: 'A', content: '组合焊缝或角焊缝' },
        { key: 'B', content: '对接焊缝' },
        { key: 'C', content: '塞焊缝' },
        { key: 'D', content: '点焊缝' }
      ],
      answer: 'A',
      analysis: '启闭机二类焊缝包括：主梁、端梁、支座梁、支腿的腹板和翼板的组合焊缝或角焊缝；主梁与端梁、主梁与支腿连接的组合焊缝或角焊缝等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝分类', '启闭机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_057',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '压力钢管二类焊缝包括除列入一类焊缝外的其他钢管管壁环缝、支撑环对接焊缝和主要受力角焊缝或（）。',
      options: [
        { key: 'A', content: '组合焊缝' },
        { key: 'B', content: '塞焊缝' },
        { key: 'C', content: '点焊缝' },
        { key: 'D', content: '堆焊缝' }
      ],
      answer: 'A',
      analysis: '压力钢管二类焊缝包括：除列入一类焊缝外的其他钢管管壁环缝；支撑环对接焊缝和主要受力角焊缝或组合焊缝；明管加劲环对接焊缝等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝分类', '压力钢管'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_058',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '直接外观检验是用眼睛直接观察测量焊缝的形状尺寸，在检验过程中可以采用适当的照明，利用反光镜调节照射角度和观察角度，或借助于（）进行观察。',
      options: [
        { key: 'A', content: '低倍放大镜' },
        { key: 'B', content: '高倍显微镜' },
        { key: 'C', content: '电子显微镜' },
        { key: 'D', content: '红外线仪器' }
      ],
      answer: 'A',
      analysis: '直接外观检验是用眼睛直接观察测量焊缝的形状尺寸，在检验过程中可以采用适当的照明，利用反光镜调节照射角度和观察角度，或借助于低倍放大镜进行观察。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝检验', '外观检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_059',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '间接外观检验必须借助于工业内窥镜等工具进行观察试验，用于眼睛不能接近的焊缝外观检验，如直径较小的管子及厚制的小直径容器的（）等。',
      options: [
        { key: 'A', content: '内表面焊缝' },
        { key: 'B', content: '外表面焊缝' },
        { key: 'C', content: '对接焊缝' },
        { key: 'D', content: '角焊缝' }
      ],
      answer: 'A',
      analysis: '间接外观检验必须借助于工业内窥镜等工具进行观察试验，用于眼睛不能接近的焊缝外观检验，如直径较小的管子及厚制的小直径容器的内表面焊缝等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝检验', '间接外观检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_060',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '《水工金属结构焊接通用技术条件》的标准号是（）。',
      options: [
        { key: 'A', content: 'SL 36' },
        { key: 'B', content: 'GB/T 11345' },
        { key: 'C', content: 'GB/T 3323' },
        { key: 'D', content: 'GB/T 26951' }
      ],
      answer: 'A',
      analysis: '《水工金属结构焊接通用技术条件》（SL 36）是焊接质量检验的主要标准及规范之一。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '标准规范'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'metal_061',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊接质量检验分为（）。',
      options: [
        { key: 'A', content: '焊前检验' },
        { key: 'B', content: '过程检验' },
        { key: 'C', content: '焊后检验' },
        { key: 'D', content: '理化检验' }
      ],
      answer: 'A,B,C',
      analysis: '焊接质量检验分为焊前检验、过程检验和焊后检验。焊前检验是保证焊接质量的前提，过程检验是防止和及时发现焊接缺陷，焊后检验是确保焊件质量完全符合技术文件的要求。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊接检验', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_062',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊接质量检验主要标准及规范有（）。',
      options: [
        { key: 'A', content: '《水工金属结构焊接通用技术条件》（SL 36）' },
        { key: 'B', content: '《焊缝无损检测超声检测技术、检测等级和评定》（GB/T 11345）' },
        { key: 'C', content: '《金属熔化焊焊接接头射线照相》（GB/T 3323）' },
        { key: 'D', content: '《焊缝无损检测 磁粉检测》（GB/T 26951）' }
      ],
      answer: 'A,B,C,D',
      analysis: '焊接质量检验主要标准及规范包括：《水工金属结构焊接通用技术条件》（SL 36）、《焊缝无损检测超声检测技术、检测等级和评定》（GB/T 11345）、《金属熔化焊焊接接头射线照相》（GB/T 3323）、《焊缝无损检测 磁粉检测》（GB/T 26951）等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊接检验', '标准规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_063',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '闸门一类焊缝包括（）。',
      options: [
        { key: 'A', content: '闸门主梁、边梁、臂柱的腹板及翼缘板的对接焊缝' },
        { key: 'B', content: '闸门及拦污栅吊耳板与门叶或栅体连接的对接焊缝' },
        { key: 'C', content: '闸门主梁腹板与边梁腹板连接的组合焊缝或角焊缝' },
        { key: 'D', content: '转向吊杆的组合焊缝或角焊缝' }
      ],
      answer: 'A,B,C,D',
      analysis: '闸门一类焊缝包括：闸门主梁、边梁、臂柱的腹板及翼缘板的对接焊缝；闸门及拦污栅吊耳板与门叶或栅体连接的对接焊缝；闸门主梁腹板与边梁腹板连接的组合焊缝或角焊缝；转向吊杆的组合焊缝或角焊缝；人字闸门端柱隔板与主梁腹板及端板的组合焊缝。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝分类', '一类焊缝'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_064',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '启闭机一类焊缝包括（）。',
      options: [
        { key: 'A', content: '主梁、端梁、滑轮支座梁、卷筒支座梁的腹板和翼板的对接焊缝' },
        { key: 'B', content: '支腿的腹板和翼板的对接焊缝，支腿与主梁连接的对接焊缝' },
        { key: 'C', content: '吊耳板的对接焊缝' },
        { key: 'D', content: '卷筒的纵向、环向对接焊缝' }
      ],
      answer: 'A,B,C,D',
      analysis: '启闭机一类焊缝包括：主梁、端梁、滑轮支座梁、卷筒支座梁的腹板和翼板的对接焊缝；支腿的腹板和翼板的对接焊缝，支腿与主梁连接的对接焊缝；吊耳板的对接焊缝；卷筒的纵向、环向对接焊缝等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝分类', '启闭机'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_065',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '常用的无损探伤方法有（）。',
      options: [
        { key: 'A', content: '射线检验（RT）' },
        { key: 'B', content: '超声波探伤（UT）' },
        { key: 'C', content: '磁粉探伤（MT）' },
        { key: 'D', content: '渗透探伤（PT）' }
      ],
      answer: 'A,B,C,D',
      analysis: '常用的无损探伤方法有射线检验（RT）、超声波探伤（UT）、磁粉探伤（MT）、渗透探伤（PT）、衍射时差法超声检测（TOFD）等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '无损检测', '方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_066',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊缝外观质量检验方法包括（）。',
      options: [
        { key: 'A', content: '直接外观检验' },
        { key: 'B', content: '间接外观检验' },
        { key: 'C', content: '射线检验' },
        { key: 'D', content: '超声波检验' }
      ],
      answer: 'A,B',
      analysis: '焊缝外观质量检验包括直接外观检验和间接外观检验。直接外观检验是用眼睛直接观察测量焊缝的形状尺寸，间接外观检验必须借助于工业内窥镜等工具进行观察试验。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝检验', '外观检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_067',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '压力钢管一类焊缝包括（）。',
      options: [
        { key: 'A', content: '钢管管壁纵缝' },
        { key: 'B', content: '厂房内按明管设计的钢管管壁环缝' },
        { key: 'C', content: '预留环缝、凑合节合拢环缝' },
        { key: 'D', content: '坝内弹性垫层管的环缝' }
      ],
      answer: 'A,B,C,D',
      analysis: '压力钢管一类焊缝包括：钢管管壁纵缝、厂房内按明管设计的钢管管壁环缝、预留环缝、凑合节合拢环缝、坝内弹性垫层管的环缝。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝分类', '压力钢管'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_068',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '闸门二类焊缝包括（）。',
      options: [
        { key: 'A', content: '闸门面板的对接焊缝' },
        { key: 'B', content: '拦污栅主梁和边梁的腹板及翼缘板对接焊缝' },
        { key: 'C', content: '闸门主梁、边梁、臂柱的翼缘板与腹板的组合焊缝及角焊缝' },
        { key: 'D', content: '闸门吊耳板与门叶的组合焊缝或角焊缝' }
      ],
      answer: 'A,B,C,D',
      analysis: '闸门二类焊缝包括：闸门面板的对接焊缝；拦污栅主梁和边梁的腹板及翼缘板对接焊缝；闸门主梁、边梁、臂柱的翼缘板与腹板的组合焊缝及角焊缝；闸门吊耳板与门叶的组合焊缝或角焊缝等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '焊缝分类', '二类焊缝'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'metal_069',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊接质量检验是始终贯穿在金属结构制造安装过程中保证和控制焊接质量的重要手段之一。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。焊接质量检验是始终贯穿在金属结构制造安装过程中保证和控制焊接质量的重要手段之一。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊接检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_070',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊前检验是保证焊接质量的前提。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。焊前检验是保证焊接质量的前提。焊前检验的目的是以预防为主，督促做好施焊前的各项准备工作，最大限度地避免或减少焊接缺陷产生的可能性。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊接检验', '焊前检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_071',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '由于条件限制，有些检验项目在制造过程中不能进行，必须对产品进行焊后质量检验，以确保焊件质量完全符合技术文件的要求。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。由于条件限制，有些检验项目在制造过程中不能进行，必须对产品进行焊后质量检验，以确保焊件质量完全符合技术文件的要求。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊接检验', '焊后检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_072',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '闸门（含拦污栅）焊缝按其质量特性重要度分为四类。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。闸门（含拦污栅）焊缝按其质量特性重要度分为三类：一类焊缝、二类焊缝、三类焊缝。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_073',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '压力钢管焊缝分为三类。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。压力钢管焊缝分为三类：一类焊缝、二类焊缝、三类焊缝。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝分类', '压力钢管'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_074',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊接检验人员应经过专门的技术培训，并取得相应的上岗资格证书。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。焊接检验人员应经过专门的技术培训，并取得相应的上岗资格证书。无损检测人员必须按照《无损检测人员资格鉴定与认证》（GB/T 9445）的要求进行培训和资格鉴定合格。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊接检验', '人员资格'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_075',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线检验、超声波探伤、衍射时差法超声检测主要用于检测焊缝表面缺陷。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。射线检验、超声波探伤、衍射时差法超声检测主要用于检测焊缝内部缺陷。磁粉探伤和渗透探伤主要用于检测焊缝表面缺陷。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '无损检测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_076',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '磁粉探伤和渗透探伤主要用于检测焊缝表面缺陷。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。磁粉探伤和渗透探伤主要用于检测焊缝表面缺陷。射线检验、超声波探伤、衍射时差法超声检测主要用于检测焊缝内部缺陷。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '无损检测'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_077',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '焊缝外观检验是用肉眼或借助样板，或用低倍放大镜（不大于5倍）观察焊缝外形尺寸的检验方法。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。焊缝外观检验是用肉眼或借助样板，或用低倍放大镜（不大于5倍）观察焊缝外形尺寸的检验方法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝检验', '外观检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_078',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '水工金属结构的所有焊缝均须进行外观检查。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。水工金属结构的所有焊缝均须进行外观检查，闸门及启闭机焊缝外观质量应符合表2-1的规定。压力钢管焊缝外观质量应符合表2-2的规定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝检验', '外观检验'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_079',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '《焊缝无损检测超声检测技术、检测等级和评定》的标准号是GB/T 11345。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。《焊缝无损检测超声检测技术、检测等级和评定》（GB/T 11345）是焊接质量检验的主要标准及规范之一。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '标准规范'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_080',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '三类焊缝是指不属于一类焊缝、二类焊缝的其他焊缝。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。三类焊缝：不属于一类焊缝、二类焊缝的其他焊缝。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '焊缝分类', '三类焊缝'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
