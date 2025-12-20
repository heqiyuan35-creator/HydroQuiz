/**
 * 金属结构 - 知识库文章数据第2部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const METAL_KNOWLEDGE_ARTICLES_2: KnowledgeArticle[] = [
  {
    id: 'metal_article_004',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 启闭机焊缝分类',
    summary: '介绍启闭机焊缝按质量特性重要度的分类',
    content: '启闭机焊缝分类。一类焊缝包括：主梁、端梁、滑轮支座梁、卷筒支座梁的腹板和翼板的对接焊缝；支腿的腹板和翼板的对接焊缝，支腿与主梁连接的对接焊缝；吊耳板的对接焊缝；卷筒的纵向、环向对接焊缝；悬臂吊吊杆、臂杆、立柱分段拼接的对接焊缝，与端部零件连接的对接焊缝；液压缸体分段连接的对接焊缝、缸体与法兰连接的对接焊缝；活塞杆对接焊缝及其与端部零件连接的对接焊缝。二类焊缝包括：主梁、端梁、支座梁、支腿的腹板和翼板的组合焊缝或角焊缝；主梁与端梁、主梁与支腿连接的组合焊缝或角焊缝，支腿与端板连接的组合焊缝或角焊缝；主梁和端梁翼缘板连接的对接焊缝；悬臂吊吊杆、臂杆腹板与翼板连接的组合焊缝或角焊缝；与吊耳板连接的组合焊缝或角焊缝；液压缸体与固定座板、铰轴座连接的组合焊缝或角焊缝；自动挂脱梁上下吊耳与梁体连接的组合焊缝或角焊缝。三类焊缝：不属于一类焊缝、二类焊缝的其他焊缝。',
    contentType: ContentType.TEXT,
    tags: ['启闭机焊缝', '焊缝分类', '一类焊缝', '二类焊缝'],
    source: '金属结构第3版',
    readTime: 12,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'metal_article_005',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 压力钢管焊缝分类',
    summary: '介绍压力钢管焊缝按质量特性重要度的分类',
    content: '压力钢管焊缝分为三类。一类焊缝包括：钢管管壁纵缝、厂房内按明管设计的钢管管壁环缝、预留环缝、凑合节合拢环缝、坝内弹性垫层管的环缝；岔管管壁纵缝、环缝，岔管加强构件的对接焊缝，加强构件与管壁相接处的组合焊缝；伸缩节内外套管、压圈环的纵缝，外套管与端板、压圈环与端板的连接焊缝；闷头焊缝及闷头与管壁的连接焊缝；人孔颈管的对接焊缝，人孔颈管与颈口法兰盘和管壁的连接焊缝；泄水孔洞钢衬和冲沙孔钢衬的纵、横环缝。二类焊缝包括：除列入一类焊缝外的其他钢管管壁环缝；支撑环对接焊缝和主要受力角焊缝或组合焊缝；明管加劲环对接焊缝；加劲环、阻水环、止推环与钢管连接的角焊缝。三类焊缝：不属于一类焊缝、二类焊缝的其他焊缝。',
    contentType: ContentType.TEXT,
    tags: ['压力钢管', '焊缝分类', '钢管焊缝', '岔管焊缝'],
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
    id: 'metal_article_006',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 焊缝外观质量检验方法',
    summary: '介绍焊缝外观质量检验的方法，包括直接外观检验和间接外观检验',
    content: '焊缝外观质量检验包括直接外观检验和间接外观检验。直接外观检验是用眼睛直接观察测量焊缝的形状尺寸，在检验过程中可以采用适当的照明，利用反光镜调节照射角度和观察角度，或借助于低倍放大镜进行观察。间接外观检验必须借助于工业内窥镜等工具进行观察试验，用于眼睛不能接近的焊缝外观检验，如直径较小的管子及厚制的小直径容器的内表面焊缝等。焊缝外观检验是用肉眼或借助样板，或用低倍放大镜不大于5倍观察焊缝外形尺寸的检验方法。在测量焊缝外形尺寸时，可采用标准样板和量规。',
    contentType: ContentType.TEXT,
    tags: ['外观检验', '直接检验', '间接检验', '焊缝测量'],
    source: '金属结构第3版',
    readTime: 8,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  }
];
