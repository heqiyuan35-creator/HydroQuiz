/**
 * 金属结构 - 知识库文章数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeArticle, ContentType } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';

export const METAL_KNOWLEDGE_ARTICLES: KnowledgeArticle[] = [
  {
    id: 'metal_article_001',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 概述',
    summary: '介绍焊接质量检验的重要性、检验阶段及主要标准规范',
    content: '焊接质量检验是始终贯穿在金属结构制造安装过程中保证和控制焊接质量的重要手段之一。焊接质量检验分为焊前检验、过程检验和焊后检验。焊前检验的目的是以预防为主，督促做好施焊前的各项准备工作，最大限度地避免或减少焊接缺陷产生的可能性。焊前检验是保证焊接质量的前提。过程检验的目的是防止和及时发现焊接缺陷，进行有效的焊接缺陷修复，保证焊接结构件在制造过程中的质量。焊后检验是必须对产品进行焊后质量检验，以确保焊件质量完全符合技术文件的要求。',
    contentType: ContentType.TEXT,
    tags: ['焊接质量检验', '焊前检验', '过程检验', '焊后检验'],
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
    id: 'metal_article_002',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 主要标准及规范',
    summary: '介绍焊接质量检验的主要标准及规范文件',
    content: '焊接质量检验主要标准及规范有：水工金属结构焊接通用技术条件SL 36、焊缝无损检测超声检测技术检测等级和评定GB/T 11345、焊缝无损检测超声检测焊缝中的显示特征GB/T 29711、焊缝无损检测超声检测验收等级GB/T 29712、金属熔化焊焊接接头射线照相GB/T 3323、焊缝无损检测磁粉检测GB/T 26951、无损检测渗透检测方法JB/T 9218、厚钢板超声检验方法GB/T 2970、钢锻件超声检测方法GB/T 6402、铸钢件超声检测第1部分一般用途铸钢件GB/T 7233.1、铸钢件超声检测第2部分高承压铸钢件GB/T 7233.2。',
    contentType: ContentType.TEXT,
    tags: ['焊接标准', '无损检测', 'SL 36', 'GB/T标准'],
    source: '金属结构第3版',
    readTime: 8,
    isPinned: false,
    isDownloaded: false,
    createTime: Date.now(),
    updateTime: Date.now(),
    viewCount: 0,
    relatedQuestionIds: []
  },
  {
    id: 'metal_article_003',
    subjectId: AppConstants.SUBJECT_METAL,
    categoryId: 'metal_001',
    categoryName: '焊接检验',
    title: '第二章 焊接质量检验 - 闸门焊缝分类',
    summary: '介绍闸门含拦污栅焊缝按质量特性重要度的分类',
    content: '闸门含拦污栅焊缝按其质量特性重要度分为三类。一类焊缝包括：闸门主梁、边梁、臂柱的腹板及翼缘板的对接焊缝；闸门及拦污栅吊耳板与门叶或栅体连接的对接焊缝，拉杆的腹板拼接、翼缘板拼接的对接焊缝；闸门主梁腹板与边梁腹板连接的组合焊缝或角焊缝，主梁翼缘板与边梁翼缘板连接的对接焊缝；转向吊杆的组合焊缝或角焊缝；人字闸门端柱隔板与主梁腹板及端板的组合焊缝。二类焊缝包括：闸门面板的对接焊缝；拦污栅主梁和边梁的腹板及翼缘板对接焊缝；闸门主梁、边梁、臂柱的翼缘板与腹板的组合焊缝及角焊缝；闸门吊耳板与门叶的组合焊缝或角焊缝；主梁、边梁与门叶面板相连接的组合焊缝或角焊缝；臂柱与连接板的组合焊缝或角焊缝。三类焊缝：不属于一类焊缝、二类焊缝的其他焊缝，设计有特殊要求者除外。',
    contentType: ContentType.TEXT,
    tags: ['闸门焊缝', '焊缝分类', '一类焊缝', '二类焊缝', '三类焊缝'],
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
