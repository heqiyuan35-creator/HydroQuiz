/**
 * 机械电气 - 知识库文章数据第11部分
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const MECHANICAL_KNOWLEDGE_ARTICLES_11: KnowledgeArticle[] = [
  {
    id: 'mech_article_030',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 试验准备工作',
    summary: '介绍效率试验前的准备工作，包括图纸资料、现场检查、管道尺寸测量等',
    content: '试验的准备工作包括图纸和资料、现场检查、测试段管道几何尺寸、仪器设备等。图纸和资料：与试验有关的图纸、资料、文件、技术要求、合格证、运行条件等提交试验负责人。现场检查：试验前试验负责人会同试验委托方对机组状态和测试系统进行全面彻底的检查，主要检查内容有：机器完整并符合相关技术条件；流道是否畅通；通流部件有否磨损空蚀；测压孔、测压管及连接管形状位置是否正确，是否畅通无阻。测试段管道几何尺寸：根据测流方法，机组投入试验前应精确测出测试段管道几何尺寸，确定高程基准点，以此传递到水力比能测量系统。在测取发电机或电动机功率，间接测取水轮机或水泵功率时，事先给出发电机或电动机效率现场试验结果或厂家给定值。仪器设备：对试验仪器设备进行标记和率定，标记应注明型号、量程、精度、制造厂、编号、出厂日期、有效使用期。率定时，全部仪器包括电气测量的互感器，试验前均应按有关规程进行率定，如不在现场率定，则应有有效检验证书。',
    contentType: ContentType.TEXT,
    tags: ['试验准备', '现场检查', '仪器设备', '率定'],
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
    id: 'mech_article_031',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 流速仪法原理',
    summary: '介绍流速仪法测量流量的基本原理及适用条件',
    content: '流速仪法：方法原理是流速仪法要求把一定数量的流速仪布置在明渠或封闭管道的适当断面的特定测点处，同时测出各流速点的时均值，并对整个测流断面积分，从而得出流量。对圆形断面流量等于流速对半径和角度的二重积分，对矩形断面流量等于流速对x和y的二重积分。适用于流速仪法的测量断面有：封闭式管道或压力钢管；引水建筑物；上、下游明渠即引水渠或尾水渠。若在明渠中使用该方法，明渠必须是断面规则的人工渠道。使用条件：测量断面平均流速应在0.4米每秒以上，最大不宜超过10米每秒。流速分布必须规则，流速矢量与流速仪轴线之间的交角不得超过5度，流速分布的不对称度Y不得大于0.05。流体介质应为水，水质必须清洁。管道必须满流。水流必须稳定。流速仪测量时，在整个测试过程中水流必须稳定，如果在测试过程中流量或负荷出现超出规定的任何波动，都应重新开始测试。支持杆和流速仪迎水面积与测量断面面积之比不得大于0.06。',
    contentType: ContentType.TEXT,
    tags: ['流速仪法', '流量测量', '测量断面', '使用条件'],
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
    id: 'mech_article_032',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    categoryId: 'mech_001',
    categoryName: '水轮机检测',
    title: '第五章 水力机械效率 - 流速仪安装与率定',
    summary: '介绍流速仪的安装要求及率定方法',
    content: '流速仪：采用旋转发出电脉冲的旋桨式流速仪，支撑流速仪轴的轴承是非常重要的。流速仪应满足温度的变化，水中有看不见的微小杂质时不影响其正常运转。流速仪安装：流速仪轴线应与渠道或管道的轴线平行，并将其固定在支持杆上，尽可能减小振动。流速仪或测点数目应足以保证可以清晰地确定在整个测量断面上的流速分布。流速仪用于测量斜向水流的流速时，具体内容请参考标准ISO3354。流速仪率定：率定时，所采用的安装方式和支持杆要与试验时状态一致。如果流速仪都安装在垂直的支持杆上，则支持杆到流速仪旋转桨叶的距离不得小于150毫米。最好对多个流速仪同时进行率定，并且其安装距离与试验时情况相同。率定过程按照标准ISO3455进行。测量采样时间：每个流速仪的测量采样时间应至少为2分钟。如果流速存在波动，则每个测程至少应包括4个波动周期。这也许会对整个试验进程产生影响，但至少应对两种典型工况观测10至15分钟流速仪的转速变化，才能确定波动的持续时间。',
    contentType: ContentType.TEXT,
    tags: ['流速仪', '安装要求', '率定方法', '采样时间'],
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
