/**
 * 机械电气 - 知识库文章数据第7部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_7: KnowledgeArticle[] = [
  {
    id: 'mech_article_019',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '红外测试系统 - 红外检测与红外探测器',
    summary: '介绍红外检测的原理及红外探测器的分类',
    content: '红外检测通过接收物体发出的红外线即红外辐射，将其热像显示在荧光屏上，从而准确判断物体表面的温度分布情况，具有准确、实时、快速等优点。任何物体由于其自身分子的运动，不停地向外辐射红外热能，从而在物体表面形成一定的温度场，俗称热像。红外探测器：热探测器在吸收红外辐射后能后温度升高，引起某种物理性质的变化，这种变化与吸收的红外辐射形成一定的关系。常用的物理现象有温差热电现象、金属或半导体电阻阻值变化现象、热释电现象、气体压强变化现象、金属热膨胀现象等。因此，只要检测出上述变化即可确定被吸收的红外辐射能大小。用这些物理现象制成的热电探测器，在理论上对一切波长的红外辐射具有相同的响应。但实际上仍存在差异，其响应速度取决于热探测器的热容量和热扩散率的大小。热电偶型：将热电偶置于环境温度下，将结点涂上黑层置于辐射中，可根据产生的热电动势测量入射辐射功率的大小。为提高探测率，通常采用热电堆型。',
    contentType: ContentType.TEXT,
    tags: ['红外检测', '红外探测器', '热探测器', '热电偶'],
    source: '机械电气第3版',
    readTime: 12,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'mech_article_020',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '红外测试系统 - 光子探测器与红外测试应用',
    summary: '介绍光子探测器的特点及红外测试的应用领域',
    content: '光子探测器：利用光子效应制成的探测器称为光电探测器。常用的光子效应有光电效应、光生伏特效应、光电导效应。热探测器与光子探测器比较，具有以下特点：热探测器对各种波长都响应，光子探测器只对一段波长区间有响应；热探测器不需要冷却，光子探测器多数需要冷却；热探测器响应时间比光子探测器长；热探测器性能与器件尺寸、形状、工艺等有关，光子探测器容易实现规格化。红外测试应用包括：辐射温度计、红外测温仪、红外热像仪。气动型：气动型探测器是利用气体吸收红外辐射后，温度升高、体积增大的特性来反映红外辐射的强弱。热释电型：半导体材料受到应力作用时，其电阻率会发生变化，这种现象称为压阻效应。',
    contentType: ContentType.TEXT,
    tags: ['光子探测器', '红外测试', '辐射温度计', '红外热像仪'],
    source: '机械电气第3版',
    readTime: 10,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'mech_article_021',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '激光式传感器 - 概述与特点',
    summary: '介绍激光式传感器的特点及广泛应用领域',
    content: '激光是在20世纪60年代初问世的。由于激光具有方向性强、亮度高、单色性好等特点，被广泛应用于工农业生产、国防军事、医学卫生、科学研究等各个方面，如用来测距、通信、准直、定向、打孔、切割、焊接，用来精密检测、定位等，还用做长度基准和光频标准。由于激光器、光学零件和光电器件所构成的激光测量装置能将被测量如长度、流量、速度等转换成电信号，因此广义上也可将激光测量装置称为激光式传感器。激光干涉式测量仪器：激光干涉式传感器以激光为光源，测量精度高，测量精度可达10的负8次方至10的负7次方量级，分辨力高，量程大，可达几十米。激光干涉传感器可用做普通干涉系统，用来测长。也可用做全息干涉系统，用来检测复杂表面等。',
    contentType: ContentType.TEXT,
    tags: ['激光传感器', '激光测量', '方向性', '单色性'],
    source: '机械电气第3版',
    readTime: 10,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  }
];
