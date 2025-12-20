/**
 * 机械电气 - 知识库文章数据第8部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_8: KnowledgeArticle[] = [
  {
    id: 'mech_article_022',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '激光式传感器 - 激光干涉测长仪',
    summary: '介绍激光干涉测长仪的工作原理及迈克尔逊干涉系统',
    content: '激光干涉传感器的基本工作原理就是光的干涉原理。在实际测量中应用最广泛的是迈克尔逊双光束干涉系统。如图1-52所示。从光源发出的光，经分光镜分为两路。一路透过分光镜射向可动反射镜M1，另一路由分光镜反射到固定反射镜M2，并分别从M1和M2反射回来，经过分光镜叠加在接受屏上。每当M1移动二分之一波长时，接受屏上的干涉条纹就会出现一次由暗到亮或者由亮到暗的变化。计算这些明暗变化次数就可以计算出M1的移动量。利用这一原理测量位移的光学系统称为迈克尔逊干涉系统。激光干涉仪就是用这个系统来测长的。位移量等于干涉条纹明暗变化次数乘以激光波长除以2倍空气折射率。式中N为干涉条纹明暗变化次数；激光波长为激光波长；空气折射率为空气折射率，受环境温度、湿度、气体成分等因素影响，真空中空气折射率等于1。',
    contentType: ContentType.TEXT,
    tags: ['激光干涉', '测长仪', '迈克尔逊', '干涉条纹'],
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
    id: 'mech_article_023',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '激光式传感器 - 激光测速仪与全息测量',
    summary: '介绍激光测速仪和激光全息测量仪器的工作原理',
    content: '激光测速仪：激光测速仪的工作原理是光学多普勒效应和光干涉原理。当激光照到运动物体时，被物体反射的光的频率将发生变化，这种现象称为多普勒效应。激光全息测量仪器：激光全息原理是由激光器发出的光束经分光镜分为两路：一路经反射镜1反射后成为参考光束射向感光胶片，另一路经反射镜2反射后射向被测物，再由被测物反射后也射向感光胶片。此光束和参考光束在感光胶片上叠加后产生干涉图样见图1-53。干涉图样的形状反映被测物反射光束与参考光束的相位差，从而反映被测物表面几何形状相互位置的关系。',
    contentType: ContentType.TEXT,
    tags: ['激光测速', '多普勒效应', '全息测量', '干涉图样'],
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
    id: 'mech_article_024',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '光纤传感器 - 概述与分类',
    summary: '介绍光纤传感器的分类及光纤液位传感器的工作原理',
    content: '光纤传感器按其工作原理可分为功能型和非功能型两类。功能型光纤传感器是利用光纤本身的某种敏感特性或功能制成的传感器。非功能型光纤传感器是利用其他敏感元件感受被测量的变化，光纤仅作为信息的传输介质。光纤液位传感器：图1-42a所示是一种U形结构。当测头浸入到液体内时，无包层的光纤光波导的数值孔径增加，液体起到了包层的作用，接收光强与液体的折射率和测头弯曲的形状有关。为了避免杂光干扰，光源采用交流调制。图1-42c所示结构中，两根多模光纤由棱镜耦合在一起，它的光调制深度最强，而且对光源和光电接收器的要求不高。由于同一种溶液在不同浓度时的折射率不同，所以经过标定，这种液位传感器也可作为浓度计。光纤液位计用于易燃、易爆场合，但不能探测污染液体及会黏附在测头表面的黏稠物质。',
    contentType: ContentType.TEXT,
    tags: ['光纤传感器', '功能型', '非功能型', '液位传感器'],
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
