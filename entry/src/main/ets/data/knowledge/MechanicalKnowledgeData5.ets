/**
 * 机械电气 - 知识库文章数据第5部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_5: KnowledgeArticle[] = [
  {
    id: 'mech_article_013',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '半导体传感器 - 磁敏传感器概述',
    summary: '介绍磁敏传感器的分类及霍尔元件的结构和工作原理',
    content: '磁敏传感器是基于磁电转换原理的传感器。磁敏传感器主要有霍尔元件、磁敏电阻、磁敏二极管、磁敏三极管。霍尔元件是一种半导体磁电转换元件，一般由锗、锑化铟、砷化镓等半导体材料制成。它们利用霍尔效应工作，霍尔元件多采用N型半导体材料。霍尔元件越薄d越小，霍尔系数就越大，薄膜霍尔元件厚度只有1微米左右。霍尔元件由霍尔片、四根引线和壳体组成。霍尔片是一块半导体单晶薄片一般为4毫米乘以2毫米乘以0.1毫米，在它的长度方向两端面上焊有a、b两根引线，称为控制电流端引线，通常用红色导线，其焊接处称为控制电极激励电极或短边端面；在它的另两侧端面的中间以点的形式对称地焊有c、d两根霍尔输出引线，通常用绿色导线，其焊接处称为霍尔电极长边端面。霍尔元件的壳体是用非导磁金属、陶瓷或环氧树脂封装。',
    contentType: ContentType.TEXT,
    tags: ['磁敏传感器', '霍尔元件', '半导体', '磁电转换'],
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
    id: 'mech_article_014',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '半导体传感器 - 霍尔效应与应用',
    summary: '介绍霍尔效应的原理及霍尔元件的应用领域',
    content: '霍尔效应：将一载流导体这里是霍尔元件放在磁场中，如果磁场方向与电流方向正交，则在磁场和电流两者垂直的方向上将会出现横向电势，这一现象称为霍尔效应，相应的电动势称为霍尔电势。霍尔效应的产生是由于运动电荷受到磁场中洛伦磁力的作用效果。任何带电质点在磁场中沿着和磁力线垂直的方向运动时，都要受到磁场力的作用，这个力称为洛伦磁力。霍尔电势按下式计算：霍尔电势等于霍尔系数乘以电流乘以磁感应强度除以薄片厚度，也等于霍尔常数乘以电流乘以磁感应强度。式中霍尔系数由载流材料的物理性质决定；霍尔常数即灵敏度系数，与载流材料的物理性质和几何尺寸有关，表示在单位磁感应强度和单位控制电流时的霍尔电势的大小；磁感应强度为磁感应强度；薄片厚度为薄片厚度。改变磁感应强度或电流，就可以改变霍尔电势值。运用这一特性，就可以把被测量参数转换为电压量的变化。应用：可以测量角位移、线位移、加速度、零件计数、转速、压力等，也可以用来检测钢丝绳断丝。',
    contentType: ContentType.TEXT,
    tags: ['霍尔效应', '洛伦磁力', '霍尔电势', '位移测量'],
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
    id: 'mech_article_015',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '半导体传感器 - 磁阻电阻与磁敏二极管',
    summary: '介绍磁阻电阻和磁敏二极管的工作原理及应用',
    content: '磁阻电阻：将一载流导体置于外磁场中，除产生霍尔效应外，其电阻也会随磁场而变化，这种现象称为磁电阻效应，简称磁阻效应。磁敏电阻器就是利用磁阻效应制成的一种磁敏元件。磁阻效应位移传感器的工作原理见图1-47。磁敏电阻的应用非常广泛。除用它做成探头、配上简单线路可以探测各种磁场外，在测量方面还可制成位移检测器、角度检测器、功率计、安培计等。此外，还有可用磁敏电阻制成交流放大器、振荡器等。磁敏二极管SMD：磁敏二极管的结构和工作原理如图1-48所示。在高阻半导体芯片本征型I两端，分别制作P、N两个电极，形成PIN结。P、N都为重掺杂区，本征区I的长度较长。同时对I区的两侧面进行不同的处理。一个侧面磨成光滑面，另一面打毛。由于粗糙的表面处容易使电子空穴对复合而消失，我们称之为复合面，这样就构成了磁敏二极管。',
    contentType: ContentType.TEXT,
    tags: ['磁阻电阻', '磁敏二极管', '磁阻效应', 'PIN结'],
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
