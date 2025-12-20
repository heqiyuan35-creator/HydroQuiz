/**
 * 金属结构 - 知识库文章数据第8部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const METAL_KNOWLEDGE_ARTICLES_8: KnowledgeArticle[] = [
  {
    id: 'metal_article_022',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 涂层外观检验',
    summary: '介绍涂层外观检验的方法和质量要求',
    content: '涂装过程中，应进行湿膜外观检查，每层涂料涂装前应先对上一涂层进行检查。若发现有漏涂、流挂、皱皮等缺陷应及时进行处理，并宜用湿膜测厚仪估测湿膜厚度。涂层在固化前应避免雨淋、暴晒、践踏等，固化后应进行外观检验。涂层表面应光滑、颜色均匀一致、无流挂、皱皮、鼓泡、针孔、裂纹等缺陷。表面预处理与涂装之间的间隔时间应尽可能缩短。在潮湿或工业大气等环境条件下，应在2小时内涂装完毕；在晴天或湿度不大的条件下，最长应不超过8小时。涂装前，应对不涂装或暂不涂装的部位进行遮蔽。焊缝和边角部位宜采用刷涂方法进行第一道施工，其余部位应选用高压无气喷涂或空气喷涂。在工地焊缝两侧各100至150毫米宽度内宜先涂装不影响焊接性能的车间底漆，厚度为20微米左右；安装后，应按相同技术要求对预留区域重新进行表面预处理以及涂装。',
    contentType: ContentType.TEXT,
    tags: ['涂层外观', '湿膜检查', '缺陷检验', '涂装间隔'],
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
    id: 'metal_article_023',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 涂层厚度检验',
    summary: '介绍涂层厚度检验的方法、测量要求及合格标准',
    content: '涂膜固化后，应进行干膜厚度测定。85%以上的局部厚度应达到设计厚度，未达到设计厚度的部位，其最小局部厚度应不低于设计厚度的85%。检测涂膜厚度的测厚仪精度应不低于正负10%。测量前，应在标准块上对仪器进行校准，确认仪器测量精度满足要求。用测厚仪测量时，应在1平方分米的基准面上进行3次测量，每次测量的位置应相距25至75毫米，取3次测量值的算术平均值为该基准面的局部厚度。对于涂装前表面粗糙度大于100微米的涂膜进行测量时，其局部厚度应为5次测量值的算术平均值。对于平整表面，每10平方米至少应测量3个局部厚度；结构复杂、面积较小的表面，宜每2平方米测一个局部厚度。当产品规范或设计有附加要求时，应按产品规范或设计执行。测量局部厚度时，应注意基准面检测分布的均匀性和代表性。',
    contentType: ContentType.TEXT,
    tags: ['涂层厚度', '干膜测定', '测厚仪', '合格标准'],
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
    id: 'metal_article_024',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_003',
    categoryName: '防腐检测',
    title: '第三章 防腐蚀质量检验 - 涂层附着力检验方法',
    summary: '介绍涂层附着力检验的划格法和拉开法',
    content: '涂膜固化后应选用划格法或拉开法进行附着力检验。附着力检验为破坏性试验，宜做抽检或带样试验。划格法：当涂膜厚度大于250微米时，应用划叉法检验，在涂膜上划两条夹角为60度的切割线，并应划透至基底，用透明压敏胶带粘牢划口部分，快速撕起胶带，涂层应无剥落。当涂膜厚度不大于250微米时，应按照GBT 9286中的规定用划格法进行检验，按表3-3的规定检查漆膜附着力等级，其前三级均为合格漆膜。漆膜附着力检查分为0至5级：0级切割的边缘完全是平滑的没有一个方格脱落；1级在切割交叉处涂层有少许薄片分离划格区受影响明显不大于5%；2级涂层沿切割边缘或切口交叉处脱落明显大于5%但受影响明显不大于15%；3级涂层沿切割边缘部分和全部以大碎片脱落或它在格子的不同部位上部分和全部剥落明显大于15%但划格区受影响明显不大于35%；4级涂层沿切割边缘大碎片剥落或者一些方格部分或全部出现脱落明显大于35%但划格区受影响明显不大于65%；5级甚至按第4类也识别不出其剥落程度。',
    contentType: ContentType.TEXT,
    tags: ['附着力检验', '划格法', '划叉法', '等级评定'],
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
