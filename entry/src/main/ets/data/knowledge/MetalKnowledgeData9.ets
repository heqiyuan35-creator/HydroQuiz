/**
 * 金属结构 - 知识库文章数据第9部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const METAL_KNOWLEDGE_ARTICLES_9: KnowledgeArticle[] = [
  {
    id: 'metal_article_025',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 拉开法附着力检验',
    summary: '介绍拉开法检验涂层附着力的方法及定量指标',
    content: '拉开法检验附着力指标可参考表3-4或由供需双方商定。拉开法可选用拉脱式涂层附着力测试仪检验，检测方法按仪器说明书的规定进行。涂层附着力定量指标按涂料类别分为三档：环氧类、聚氨酯类、氟碳涂料附着力大于等于5.0兆帕；氯化橡胶类、丙烯酸树脂、乙烯树脂类、无机富锌类、环氧沥青、醇酸树脂类附着力大于等于3.0兆帕；酚醛树脂、油性涂料附着力大于等于1.5兆帕。检验宜采用具有硬质刃口的切割工具，其形状见图3-2，并应切割出表3-5中规定尺寸的格子。切痕深度应将涂层切断至基体金属。如有可能，切割成格子后，采用供需双方协商认可的一种合适胶带，借助于一个辊子或用手指施以5牛的载荷将胶带压紧在被切格的涂层上，然后沿垂直于涂层表面的方向快速将胶带拉开。',
    contentType: ContentType.TEXT,
    tags: ['拉开法', '附着力', '定量指标', '拉脱式测试仪'],
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
    id: 'metal_article_026',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 涂层针孔检验',
    summary: '介绍厚浆型涂料涂层针孔检验的方法和要求',
    content: '对于厚浆型涂料，由于一次成膜较厚，干燥相对困难，产生针孔的可能性较大，所以应用针孔仪进行全面检验。厚浆型涂料用针孔检测仪进行检验，按设计规定电压值检测漆膜针孔。若发现针孔，用砂纸、弹性砂轮片作打磨处理后再进行补涂。涂层系统各层间的涂覆间隔时间应按涂料制造厂的规定执行，如超过其最长间隔时间，则应将前一涂层打毛后再进行涂装，以保证涂层间的结合力。涂层缺陷部位可采用手工和动力工具除锈进行局部修理，表面清洁度等级应达到GBT 8923.2中的规定。在役金属结构进行防腐维护时，宜彻底清除旧涂料涂层和基底锈蚀部位的金属涂层，与基体结合牢固且保存完好的金属涂层可在清理出金属涂层光泽后予以保留。',
    contentType: ContentType.TEXT,
    tags: ['针孔检验', '厚浆型涂料', '针孔检测仪', '涂层修理'],
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
    id: 'metal_article_027',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 埋件防护检验',
    summary: '介绍埋件外露部分和埋入面的防护检验要求',
    content: '埋件外露部分的涂装可参照SL 105附录C表C-3或表C-4选用涂料，并延伸到埋入面20毫米左右；其余与混凝土接触的埋入面可根据存放周期、环境条件决定是否选用水泥浆进行临时防护。埋件涂装水泥浆的部位，其表面预处理清洁度等级宜不低于GBT 8923.1中的规定。水泥浆厚度宜在300至800微米。水泥浆涂装后应及时进行喷水养护。表面预处理质量检验包括表面清洁度检验和表面粗糙度检验。表面清洁度和表面粗糙度的质量评定均应在良好的散射日光下或照度相当的人工照明条件下进行。检验人员应具有正常的视力。采用切割法时，在方格形切样内无金属涂层从基底上剥离，或剥离发生在涂层的层间应产生剥离。',
    contentType: ContentType.TEXT,
    tags: ['埋件防护', '水泥浆', '临时防护', '表面预处理'],
    source: '金属结构第3版',
    readTime: 10,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  }
];
