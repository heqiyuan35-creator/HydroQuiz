/**
 * 金属结构题目数据 - 第五部分
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：金属结构（第3版）第二章 焊接质量检验 - 增感屏、像质计、暗袋、射线照相质量
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取金属结构题目（第五部分）
 * 单选题20题、多选题8题、判断题12题，共40题
 */
export function getMetalStructureQuestions5(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'metal_161',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '增感屏在使用过程中，其表面应保持光滑、清洁、无污秽、损伤、变形。装片后要求增感屏与胶片能紧密贴合，胶片与增感屏之间不能夹杂（）。',
      options: [
        { key: 'A', content: '异物' },
        { key: 'B', content: '空气' },
        { key: 'C', content: '水分' },
        { key: 'D', content: '灰尘' }
      ],
      answer: 'A',
      analysis: '增感屏在使用过程中，其表面应保持光滑、清洁、无污秽、损伤、变形。装片后要求增感屏与胶片能紧密贴合，胶片与增感屏之间不能夹杂异物。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '增感屏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_162',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '铝箔增感屏卷曲、受折后，会引起胶片与增感屏接触不良，使底片影像（）。',
      options: [
        { key: 'A', content: '模糊' },
        { key: 'B', content: '过曝' },
        { key: 'C', content: '欠曝' },
        { key: 'D', content: '变色' }
      ],
      answer: 'A',
      analysis: '铝箔增感屏卷曲、受折后，会引起胶片与增感屏接触不良，使底片影像模糊。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '增感屏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_163',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '铅箔增感屏保存时间过长，会产生铅箔与基材之间脱胶和合金成分镉、锡在表面呈线状析出的现象。此时，在增感屏表面出现黑线条，在底片上则产生（）。',
      options: [
        { key: 'A', content: '白线条' },
        { key: 'B', content: '黑线条' },
        { key: 'C', content: '灰斑' },
        { key: 'D', content: '黑斑' }
      ],
      answer: 'A',
      analysis: '铅箔增感屏保存时间过长，会产生铅箔与基材之间脱胶和合金成分镉、锡在表面呈线状析出的现象。此时，在增感屏表面出现黑线条，在底片上则产生白线条。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '增感屏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_164',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '工业射线照相用的像质计有金属丝型、孔型和槽型三种，其中（）应用最广。',
      options: [
        { key: 'A', content: '金属丝型' },
        { key: 'B', content: '孔型' },
        { key: 'C', content: '槽型' },
        { key: 'D', content: '阶梯型' }
      ],
      answer: 'A',
      analysis: '工业射线照相用的像质计有金属丝型、孔型和槽型三种，其中金属丝型应用最广。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_165',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '目前世界上以（）像质计应用最为普遍。',
      options: [
        { key: 'A', content: '等比数列' },
        { key: 'B', content: '等差数列' },
        { key: 'C', content: '等径' },
        { key: 'D', content: '单丝' }
      ],
      answer: 'A',
      analysis: '按金属丝的直径变化规律，金属丝型像质计分为等差数列、等比数列、等径、单丝等几种形式。目前世界上以等比数列像质计应用最为普遍。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_166',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '等比数列像质计的线径公比有两种：一种为¹⁰√10（R10系列），一种为²⁰√10（R20系列）。通常使用公比为R10系列像质计，其相邻金属丝的直径之比为¹⁰√10≈（）。',
      options: [
        { key: 'A', content: '1.25' },
        { key: 'B', content: '1.10' },
        { key: 'C', content: '1.50' },
        { key: 'D', content: '1.12' }
      ],
      answer: 'A',
      analysis: '通常使用公比为R10系列像质计，其相邻金属丝的直径之比为¹⁰√10≈1.25或者为1/¹⁰√10≈0.8。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_167',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '金属丝型像质计结构以七根编号相连接的金属线为一组，每个像质计中所有金属线应由相同材料构成，并固定在弱吸收材料（以不影响成像质量为原则）制成的包芯中。像质计金属线应相互平行排列，其长度l有三种规格，分别为（）mm。',
      options: [
        { key: 'A', content: '10、25和50' },
        { key: 'B', content: '5、10和20' },
        { key: 'C', content: '15、30和60' },
        { key: 'D', content: '20、40和80' }
      ],
      answer: 'A',
      analysis: '像质计金属线应相互平行排列，其长度l有三种规格，分别为10mm、25mm和50mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_168',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '像质计按材料不同可分为钢质像质计、铝质像质计、钛质像质计、铜质像质计等，分别用代号（）代表。',
      options: [
        { key: 'A', content: 'FE、AL、TI、CU' },
        { key: 'B', content: 'Fe、Al、Ti、Cu' },
        { key: 'C', content: 'S、A、T、C' },
        { key: 'D', content: '钢、铝、钛、铜' }
      ],
      answer: 'A',
      analysis: '像质计按材料不同可分为钢质像质计、铝质像质计、钛质像质计、铜质像质计等，分别用代号FE、AL、TI、CU代表。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_169',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '不管使用何种类型的像质计，像质计的摆放位置都会直接影响像质计灵敏度的指示值。在摆放像质计时，摆放位置一般是在射线透照区内显示灵敏度（）部位。',
      options: [
        { key: 'A', content: '较低' },
        { key: 'B', content: '较高' },
        { key: 'C', content: '中等' },
        { key: 'D', content: '最高' }
      ],
      answer: 'A',
      analysis: '在摆放像质计时，摆放位置一般是在射线透照区内显示灵敏度较低部位，如离胶片远的工件表面、透照厚度较大部位。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_170',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '透照焊缝时，金属丝型像质计应放在被检焊缝射源一侧，被检区的一端，使金属线横贯焊缝并与焊缝方向垂直，像质计上直径小的金属线应在被检区（）。',
      options: [
        { key: 'A', content: '外侧' },
        { key: 'B', content: '内侧' },
        { key: 'C', content: '中心' },
        { key: 'D', content: '边缘' }
      ],
      answer: 'A',
      analysis: '透照焊缝时，金属丝型像质计应放在被检焊缝射源一侧，被检区的一端，使金属线横贯焊缝并与焊缝方向垂直，像质计上直径小的金属线应在被检区外侧。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_171',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '采用射源置于圆心位置的周向曝光技术时，像质计可每隔（）°放一个。',
      options: [
        { key: 'A', content: '120' },
        { key: 'B', content: '90' },
        { key: 'C', content: '180' },
        { key: 'D', content: '60' }
      ],
      answer: 'A',
      analysis: '采用射源置于圆心位置的周向曝光技术时，像质计可每隔120°放一个。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_172',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '对于平板孔型像质计，要求放在离被检焊缝边缘5mm以上的母材表面，且像质计下应放置一定厚度的垫片，垫片厚度大致等于被检焊缝的（）。',
      options: [
        { key: 'A', content: '总余高' },
        { key: 'B', content: '厚度' },
        { key: 'C', content: '宽度' },
        { key: 'D', content: '深度' }
      ],
      answer: 'A',
      analysis: '对于平板孔型像质计，要求放在离被检焊缝边缘5mm以上的母材表面，且像质计下应放置一定厚度的垫片，垫片厚度大致等于被检焊缝的总余高。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_173',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '平板孔型像质计垫片的目的是使得受检区域的黑度不低于像质计黑度范围的（）。',
      options: [
        { key: 'A', content: '15%' },
        { key: 'B', content: '10%' },
        { key: 'C', content: '20%' },
        { key: 'D', content: '25%' }
      ],
      answer: 'A',
      analysis: '其目的是使得受检区域的黑度不低于像质计黑度范围的15%，垫片的尺寸应超过像质计尺寸，使得至少有3条像质计轮廓线可在照片上看清楚。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_174',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '装胶片的暗袋可采用对射线吸收少而遮光性好的黑色塑料膜或合成革制作，要求材料薄、软、滑。用黑色塑料膜制作的暗袋比较容易老化，天冷时发硬、热压合的暗袋边容易破裂，用（）制暗袋则可避免上述弊端。',
      options: [
        { key: 'A', content: '黑色合成革缝制' },
        { key: 'B', content: '白色塑料膜' },
        { key: 'C', content: '铝箔' },
        { key: 'D', content: '纸质材料' }
      ],
      answer: 'A',
      analysis: '用黑色塑料膜制作的暗袋比较容易老化，天冷时发硬、热压合的暗袋边容易破裂，用黑色合成革缝制成的暗袋则可避免上述弊端。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '暗袋'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_175',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '暗袋背面还应贴上一个"B"铅字标记，以此作为监测（）的附件。',
      options: [
        { key: 'A', content: '背散射线' },
        { key: 'B', content: '正面射线' },
        { key: 'C', content: '侧面射线' },
        { key: 'D', content: '透射射线' }
      ],
      answer: 'A',
      analysis: '暗袋背面还应贴上一个"B"铅字标记，以此作为监测背散射线的附件。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '暗袋'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_176',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '为屏蔽后方散射线，应制作一些与胶片暗袋尺寸相仿的屏蔽板。屏蔽板由（）mm厚的铝板制成。',
      options: [
        { key: 'A', content: '1' },
        { key: 'B', content: '2' },
        { key: 'C', content: '0.5' },
        { key: 'D', content: '3' }
      ],
      answer: 'A',
      analysis: '为屏蔽后方散射线，应制作一些与胶片暗袋尺寸相仿的屏蔽板。屏蔽板由1mm厚的铝板制成。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '屏蔽板'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_177',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '中心指示器上装有约（）mm厚的铝光圈，可有效地遮挡非检测区的射线，以减少前方散射线。',
      options: [
        { key: 'A', content: '6' },
        { key: 'B', content: '3' },
        { key: 'C', content: '10' },
        { key: 'D', content: '1' }
      ],
      answer: 'A',
      analysis: '射线机窗口应装设中心指示器。中心指示器上装有约6mm厚的铝光圈，可有效地遮挡非检测区的射线，以减少前方散射线。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '中心指示器'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_178',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线照相灵敏度是射线照相对比度（缺陷影像与其周围背景的黑度差）、不清晰度（影像轮廓边缘黑度过渡区的宽度）和颗粒度（影像黑度的不均匀程度）三大要素的综合结果，而此三大要素又分别受到不同（）因素的影响。',
      options: [
        { key: 'A', content: '工艺' },
        { key: 'B', content: '材料' },
        { key: 'C', content: '环境' },
        { key: 'D', content: '设备' }
      ],
      answer: 'A',
      analysis: '射线照相灵敏度是射线照相对比度、不清晰度和颗粒度三大要素的综合结果，而此三大要素又分别受到不同工艺因素的影响。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '照相灵敏度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_179',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '把底片上某一小区域和相邻区域的黑度差称为底片对比度，又叫（）。',
      options: [
        { key: 'A', content: '底片反差' },
        { key: 'B', content: '黑度差' },
        { key: 'C', content: '灰度差' },
        { key: 'D', content: '密度差' }
      ],
      answer: 'A',
      analysis: '把底片上某一小区域和相邻区域的黑度差称为底片对比度，又叫底片反差。显然，底片对比度越大，影像就越容易被观察和识别。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '底片对比度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_180',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '底片上总不清晰度U是Ug和Ui的综合结果，目前描述U、Ug和Ui比较广泛采用的关系式为U=（）。',
      options: [
        { key: 'A', content: '(Ug²+Ui²)^(1/2)' },
        { key: 'B', content: 'Ug+Ui' },
        { key: 'C', content: 'Ug×Ui' },
        { key: 'D', content: '(Ug+Ui)/2' }
      ],
      answer: 'A',
      analysis: '底片上总不清晰度U是Ug和Ui的综合结果，目前描述U、Ug和Ui比较广泛采用的关系式为U=(Ug²+Ui²)^(1/2)。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '射线检验', '不清晰度'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'metal_181',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '增感屏的使用注意事项包括（）。',
      options: [
        { key: 'A', content: '表面应保持光滑、清洁、无污秽、损伤、变形' },
        { key: 'B', content: '装片后要求增感屏与胶片能紧密贴合' },
        { key: 'C', content: '胶片与增感屏之间不能夹杂异物' },
        { key: 'D', content: '铅箔增感屏保管时要注意防潮，防止有害气体的侵蚀' }
      ],
      answer: 'A,B,C,D',
      analysis: '增感屏的使用注意事项包括：表面应保持光滑、清洁、无污秽、损伤、变形；装片后要求增感屏与胶片能紧密贴合；胶片与增感屏之间不能夹杂异物；铅箔增感屏保管时要注意防潮，防止有害气体的侵蚀。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '增感屏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_182',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '铅箔的表面比较柔软，如有划伤或者开裂，由于发射二次电子的表面积增大，会使底片上出现类似裂纹的细黑线。铅箔表面如有油污，会（）。',
      options: [
        { key: 'A', content: '吸收二次电子' },
        { key: 'B', content: '形成减感现象' },
        { key: 'C', content: '使底片上产生白影' },
        { key: 'D', content: '使底片上产生黑影' }
      ],
      answer: 'A,B,C',
      analysis: '铅箔表面如有油污，会吸收二次电子，形成减感现象，使底片上产生白影。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '射线检验', '增感屏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_183',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '工业射线照相用的像质计有（）。',
      options: [
        { key: 'A', content: '金属丝型' },
        { key: 'B', content: '孔型' },
        { key: 'C', content: '槽型' },
        { key: 'D', content: '双丝型' }
      ],
      answer: 'A,B,C,D',
      analysis: '工业射线照相用的像质计有金属丝型、孔型和槽型三种，其中金属丝型应用最广。除上述像质计外，还有一种双丝型像质计，这种像质计不是用来测量射线照相灵敏度的，而是用来测量射线照相不清晰度的。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_184',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '按金属丝的直径变化规律，金属丝型像质计分为（）等几种形式。',
      options: [
        { key: 'A', content: '等差数列' },
        { key: 'B', content: '等比数列' },
        { key: 'C', content: '等径' },
        { key: 'D', content: '单丝' }
      ],
      answer: 'A,B,C,D',
      analysis: '按金属丝的直径变化规律，金属丝型像质计分为等差数列、等比数列、等径、单丝等几种形式。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_185',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '定位标记包括（）。',
      options: [
        { key: 'A', content: '中心标记' },
        { key: 'B', content: '焊缝编号（纵环缝或封头拼接缝等）' },
        { key: 'C', content: '部位编号（或片号）' },
        { key: 'D', content: '拍片日期、板厚等标记' }
      ],
      answer: 'A,B,C,D',
      analysis: '定位标记包括中心标记、焊缝编号（纵环缝或封头拼接缝等）、部位编号（或片号）。其他还有拍片日期、板厚等标记。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '标记带'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_186',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线照相灵敏度是（）三大要素的综合结果。',
      options: [
        { key: 'A', content: '射线照相对比度（缺陷影像与其周围背景的黑度差）' },
        { key: 'B', content: '不清晰度（影像轮廓边缘黑度过渡区的宽度）' },
        { key: 'C', content: '颗粒度（影像黑度的不均匀程度）' },
        { key: 'D', content: '曝光量' }
      ],
      answer: 'A,B,C',
      analysis: '射线照相灵敏度是射线照相对比度（缺陷影像与其周围背景的黑度差）、不清晰度（影像轮廓边缘黑度过渡区的宽度）和颗粒度（影像黑度的不均匀程度）三大要素的综合结果。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '照相灵敏度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_187',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '在实际工业射线照相中，底片影像不清晰的原因有多种，如果排除试件或射源移动、屏-胶片接触不良等偶然因素，不考虑使用盐类增感屏荧光散射引起的屏不清晰度，那么射线照相不清晰度的因素主要有（）。',
      options: [
        { key: 'A', content: '由于射源有一定尺寸而引起的几何不清晰度Ug' },
        { key: 'B', content: '由于电子在胶片乳剂中散射而引起的固有不清晰度Ui' },
        { key: 'C', content: '胶片颗粒度' },
        { key: 'D', content: '曝光时间' }
      ],
      answer: 'A,B',
      analysis: '射线照相不清晰度的因素主要有两方面，即由于射源有一定尺寸而引起的几何不清晰度Ug以及由于电子在胶片乳剂中散射而引起的固有不清晰度Ui。',
      difficulty: DifficultyLevel.HARD,
      tags: ['金属结构', '射线检验', '不清晰度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_188',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '射线照相辅助器材很多，除上述用品、设备、器材外，为方便工作，还应备齐一些小器件，如（）。',
      options: [
        { key: 'A', content: '卷尺、钢印、榔头、照明灯、电筒' },
        { key: 'B', content: '各种尺寸的铅遮板、补偿泥、贴片磁钢、透明胶带' },
        { key: 'C', content: '各式铅字、盛放铅字的字盘、画线尺、石笔、记号笔等' },
        { key: 'D', content: '计算机、打印机' }
      ],
      answer: 'A,B,C',
      analysis: '射线照相辅助器材很多，为方便工作，还应备齐一些小器件，如卷尺、钢印、榔头、照明灯、电筒、各种尺寸的铅遮板、补偿泥、贴片磁钢、透明胶带、各式铅字、盛放铅字的字盘、画线尺、石笔、记号笔等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '辅助器材'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'metal_189',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '铝箔增感屏卷曲、受折后，会引起胶片与增感屏接触不良，使底片影像模糊。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。铝箔增感屏卷曲、受折后，会引起胶片与增感屏接触不良，使底片影像模糊。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '增感屏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_190',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '铅箔增感屏保存时间过长，在增感屏表面出现黑线条，在底片上则产生黑线条。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。铅箔增感屏保存时间过长，在增感屏表面出现黑线条，在底片上则产生白线条，而不是黑线条。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '增感屏'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_191',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '工业射线照相用的像质计有金属丝型、孔型和槽型三种，其中孔型应用最广。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。工业射线照相用的像质计有金属丝型、孔型和槽型三种，其中金属丝型应用最广，而不是孔型。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_192',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '双丝型像质计是用来测量射线照相灵敏度的。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。双丝型像质计不是用来测量射线照相灵敏度的，而是用来测量射线照相不清晰度的。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_193',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '目前世界上以等比数列像质计应用最为普遍。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。目前世界上以等比数列像质计应用最为普遍。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_194',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '像质计金属线应相互平行排列，其长度l有三种规格，分别为10mm、25mm和50mm。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。像质计金属线应相互平行排列，其长度l有三种规格，分别为10mm、25mm和50mm。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_195',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '在摆放像质计时，摆放位置一般是在射线透照区内显示灵敏度较高部位。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。在摆放像质计时，摆放位置一般是在射线透照区内显示灵敏度较低部位，如离胶片远的工件表面、透照厚度较大部位。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_196',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '采用射源置于圆心位置的周向曝光技术时，像质计可每隔90°放一个。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。采用射源置于圆心位置的周向曝光技术时，像质计可每隔120°放一个，而不是90°。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '像质计'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_197',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '暗袋背面还应贴上一个"B"铅字标记，以此作为监测背散射线的附件。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。暗袋背面还应贴上一个"B"铅字标记，以此作为监测背散射线的附件。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '暗袋'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_198',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '为屏蔽后方散射线，屏蔽板由1mm厚的铝板制成。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。为屏蔽后方散射线，应制作一些与胶片暗袋尺寸相仿的屏蔽板。屏蔽板由1mm厚的铝板制成。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['金属结构', '射线检验', '屏蔽板'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_199',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '底片对比度越大，影像就越容易被观察和识别。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。把底片上某一小区域和相邻区域的黑度差称为底片对比度，又叫底片反差。显然，底片对比度越大，影像就越容易被观察和识别。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '底片对比度'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'metal_200',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_METAL,
      chapter: '第二章 焊接质量检验',
      content: '黑度变化区域的宽度越大，影像的轮廓就越模糊。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。很明显，黑度变化区域的宽度越大，影像的轮廓就越模糊，所以该黑度变化区域的宽度就定义为射线照相不清晰度U。',
      difficulty: DifficultyLevel.EASY,
      tags: ['金属结构', '射线检验', '不清晰度'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
