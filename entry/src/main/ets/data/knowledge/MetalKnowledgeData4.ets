/**
 * 金属结构 - 知识库文章数据第4部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const METAL_KNOWLEDGE_ARTICLES_4: KnowledgeArticle[] = [
  {
    id: 'metal_article_010',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 射线照相辅助器材',
    summary: '介绍射线照相检验中使用的辅助器材，包括暗袋、标记带、屏蔽铅板等',
    content: '射线照相辅助器材包括暗袋、标记带、屏蔽铅板、中心指示器等。暗袋用于装胶片，可采用对射线吸收少而遮光性好的黑色塑料膜或合成革制作，要求材料薄、软、滑。暗袋的尺寸尤其宽度要与增感屏、胶片尺寸相匹配。标记带用于使每张射线底片与工件被检部位始终可以对照，在透照过程中应将识别标记和定位标记与被检区域同时透照在底片上。定位标记包括中心标记、焊缝编号、部位编号或片号等。屏蔽铅板用于屏蔽后方散射线，应制作一些与胶片暗袋尺寸相仿的屏蔽板，屏蔽板由1毫米厚的铝板制成。中心指示器用于射线机窗口应装设中心指示器，中心指示器上装有约6毫米厚的铝光圈，可有效地遮挡非检测区的射线。',
    contentType: ContentType.TEXT,
    tags: ['射线照相', '辅助器材', '暗袋', '标记带', '屏蔽铅板'],
    source: '金属结构第3版',
    readTime: 10,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'metal_article_011',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 增感屏的分类及使用',
    summary: '介绍增感屏的分类、使用注意事项及保管要求',
    content: '目前常用的增感屏有金属增感屏、荧光增感屏和金属荧光增感屏三种。其中以使用金属增感屏所得底片像质最佳，金属荧光增感屏次之，荧光增感屏最差，但增感系数以荧光增感屏最高，金属增感屏最低。增感屏在使用过程中，其表面应保持光滑、清洁、无污秽、损伤、变形。装片后要求增感屏与胶片能紧密贴合，胶片与增感屏之间不能夹杂异物。铝箔增感屏卷曲、受折后，会引起胶片与增感屏接触不良，使底片影像模糊。铝箔的表面比较柔软，如有划伤或者开裂，由于发射二次电子的表面积增大，会使底片上出现类似裂纹的细黑线。铝箔增感屏保管时要注意防潮，防止有害气体的侵蚀。',
    contentType: ContentType.TEXT,
    tags: ['增感屏', '金属增感屏', '荧光增感屏', '射线检验'],
    source: '金属结构第3版',
    readTime: 10,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'metal_article_012',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 像质计的分类及摆放',
    summary: '介绍像质计的分类、构造特点及摆放要求',
    content: '工业射线照相用的像质计有金属丝型、孔型和槽型三种，其中金属丝型应用最广。按金属丝的直径变化规律，金属丝型像质计分为等差数列、等比数列、等径、单丝等几种形式。我国最早曾使用过等差数列像质计，目前世界上以等比数列像质计应用最为普遍。金属丝型像质计结构以七根编号相连接的金属线为一组，每个像质计中所有金属线应由相同材料构成，并固定在弱吸收材料以不影响成像质量为原则制成的包芯中。像质计金属线应相互平行排列，其长度有三种规格，分别为10毫米、25毫米和50毫米。透照焊缝时，金属丝型像质计应放在被检焊缝射源一侧，被检区的一端，使金属线横贯焊缝并与焊缝方向垂直，像质计上直径小的金属线应在被检区外侧。',
    contentType: ContentType.TEXT,
    tags: ['像质计', '金属丝型', '等比数列', '射线检验'],
    source: '金属结构第3版',
    readTime: 12,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  }
];
