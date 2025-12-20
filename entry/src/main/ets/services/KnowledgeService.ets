/**
 * 知识库服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import {
  KnowledgeArticle,
  KnowledgeCategory,
  KnowledgeSubject,
  KnowledgeSearchResult,
  KnowledgeReadRecord,
  KnowledgeFavorite,
  ReadingRecord
} from '../common/types/KnowledgeTypes';
import {
  KNOWLEDGE_SUBJECTS,
  getAllCategories,
  getCategoriesBySubject,
  getCategoryById,
  getKnowledgeSubjectById
} from '../data/knowledge/KnowledgeCategoryData';

// 导入各科目知识数据
import { BASIC_KNOWLEDGE_ARTICLES } from '../data/knowledge/BasicKnowledgeData';
import { CONCRETE_KNOWLEDGE_ARTICLES } from '../data/knowledge/ConcreteKnowledgeData';
import { GEOTECHNICAL_ROCK_KNOWLEDGE_ARTICLES } from '../data/knowledge/GeotechnicalRockKnowledgeData';
import { GEOTECHNICAL_ROCK_KNOWLEDGE_ARTICLES_2 } from '../data/knowledge/GeotechnicalRockKnowledgeData2';
import { GEOTECHNICAL_FOUNDATION_KNOWLEDGE_ARTICLES } from '../data/knowledge/GeotechnicalFoundationKnowledgeData';
import { MEASUREMENT_KNOWLEDGE_ARTICLES } from '../data/knowledge/MeasurementKnowledgeData';
import { MEASUREMENT_KNOWLEDGE_ARTICLES_5 } from '../data/knowledge/MeasurementKnowledgeData2';
import { MEASUREMENT_KNOWLEDGE_ARTICLES_6, MEASUREMENT_KNOWLEDGE_ARTICLES_6_2, MEASUREMENT_KNOWLEDGE_ARTICLES_6_3, MEASUREMENT_KNOWLEDGE_ARTICLES_6_4 } from '../data/knowledge/MeasurementKnowledgeData6';
import { METAL_KNOWLEDGE_ARTICLES } from '../data/knowledge/MetalKnowledgeData';
import { METAL_KNOWLEDGE_ARTICLES_2 } from '../data/knowledge/MetalKnowledgeData2';
import { METAL_KNOWLEDGE_ARTICLES_3 } from '../data/knowledge/MetalKnowledgeData3';
import { METAL_KNOWLEDGE_ARTICLES_4 } from '../data/knowledge/MetalKnowledgeData4';
import { METAL_KNOWLEDGE_ARTICLES_5 } from '../data/knowledge/MetalKnowledgeData5';
import { METAL_KNOWLEDGE_ARTICLES_6 } from '../data/knowledge/MetalKnowledgeData6';
import { METAL_KNOWLEDGE_ARTICLES_7 } from '../data/knowledge/MetalKnowledgeData7';
import { METAL_KNOWLEDGE_ARTICLES_8 } from '../data/knowledge/MetalKnowledgeData8';
import { METAL_KNOWLEDGE_ARTICLES_9 } from '../data/knowledge/MetalKnowledgeData9';
import { MECHANICAL_KNOWLEDGE_ARTICLES } from '../data/knowledge/MechanicalKnowledgeData';
import { MECHANICAL_KNOWLEDGE_ARTICLES_2 } from '../data/knowledge/MechanicalKnowledgeData2';
import { MECHANICAL_KNOWLEDGE_ARTICLES_3 } from '../data/knowledge/MechanicalKnowledgeData3';
import { MECHANICAL_KNOWLEDGE_ARTICLES_4 } from '../data/knowledge/MechanicalKnowledgeData4';
import { MECHANICAL_KNOWLEDGE_ARTICLES_5 } from '../data/knowledge/MechanicalKnowledgeData5';
import { MECHANICAL_KNOWLEDGE_ARTICLES_6 } from '../data/knowledge/MechanicalKnowledgeData6';
import { MECHANICAL_KNOWLEDGE_ARTICLES_7 } from '../data/knowledge/MechanicalKnowledgeData7';
import { MECHANICAL_KNOWLEDGE_ARTICLES_8 } from '../data/knowledge/MechanicalKnowledgeData8';
import { MECHANICAL_KNOWLEDGE_ARTICLES_9 } from '../data/knowledge/MechanicalKnowledgeData9';
import { MECHANICAL_KNOWLEDGE_ARTICLES_10 } from '../data/knowledge/MechanicalKnowledgeData10';
import { MECHANICAL_KNOWLEDGE_ARTICLES_11 } from '../data/knowledge/MechanicalKnowledgeData11';
import { MECHANICAL_KNOWLEDGE_ARTICLES_12 } from '../data/knowledge/MechanicalKnowledgeData12';
import { MECHANICAL_KNOWLEDGE_ARTICLES_13 } from '../data/knowledge/MechanicalKnowledgeData13';

/**
 * 知识库服务类
 */
export class KnowledgeService {
  private static instance: KnowledgeService;
  private allArticles: KnowledgeArticle[] = [];
  private readingRecords: Map<string, KnowledgeReadRecord> = new Map();
  private favorites: Map<string, KnowledgeFavorite> = new Map();
  private articleNotes: Map<string, string> = new Map(); // 文章笔记

  private constructor() {
    this.initArticles();
  }

  /**
   * 获取单例实例
   */
  public static getInstance(): KnowledgeService {
    if (!KnowledgeService.instance) {
      KnowledgeService.instance = new KnowledgeService();
    }
    return KnowledgeService.instance;
  }

  /**
   * 初始化文章数据
   */
  private initArticles(): void {
    this.allArticles = [];
    this.allArticles = this.allArticles.concat(BASIC_KNOWLEDGE_ARTICLES);
    this.allArticles = this.allArticles.concat(CONCRETE_KNOWLEDGE_ARTICLES);
    this.allArticles = this.allArticles.concat(GEOTECHNICAL_ROCK_KNOWLEDGE_ARTICLES);
    this.allArticles = this.allArticles.concat(GEOTECHNICAL_ROCK_KNOWLEDGE_ARTICLES_2);
    this.allArticles = this.allArticles.concat(GEOTECHNICAL_FOUNDATION_KNOWLEDGE_ARTICLES);
    this.allArticles = this.allArticles.concat(MEASUREMENT_KNOWLEDGE_ARTICLES);
    this.allArticles = this.allArticles.concat(MEASUREMENT_KNOWLEDGE_ARTICLES_5);
    this.allArticles = this.allArticles.concat(MEASUREMENT_KNOWLEDGE_ARTICLES_6);
    this.allArticles = this.allArticles.concat(MEASUREMENT_KNOWLEDGE_ARTICLES_6_2);
    this.allArticles = this.allArticles.concat(MEASUREMENT_KNOWLEDGE_ARTICLES_6_3);
    this.allArticles = this.allArticles.concat(MEASUREMENT_KNOWLEDGE_ARTICLES_6_4);
    this.allArticles = this.allArticles.concat(METAL_KNOWLEDGE_ARTICLES);
    this.allArticles = this.allArticles.concat(METAL_KNOWLEDGE_ARTICLES_2);
    this.allArticles = this.allArticles.concat(METAL_KNOWLEDGE_ARTICLES_3);
    this.allArticles = this.allArticles.concat(METAL_KNOWLEDGE_ARTICLES_4);
    this.allArticles = this.allArticles.concat(METAL_KNOWLEDGE_ARTICLES_5);
    this.allArticles = this.allArticles.concat(METAL_KNOWLEDGE_ARTICLES_6);
    this.allArticles = this.allArticles.concat(METAL_KNOWLEDGE_ARTICLES_7);
    this.allArticles = this.allArticles.concat(METAL_KNOWLEDGE_ARTICLES_8);
    this.allArticles = this.allArticles.concat(METAL_KNOWLEDGE_ARTICLES_9);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_2);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_3);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_4);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_5);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_6);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_7);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_8);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_9);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_10);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_11);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_12);
    this.allArticles = this.allArticles.concat(MECHANICAL_KNOWLEDGE_ARTICLES_13);
  }

  /**
   * 获取所有科目
   */
  public getSubjects(): KnowledgeSubject[] {
    const result: KnowledgeSubject[] = [];
    for (const subject of KNOWLEDGE_SUBJECTS) {
      const articleCount = this.getArticleCountBySubject(subject.id);
      const updatedCategories: KnowledgeCategory[] = [];
      for (const cat of subject.categories) {
        const updatedCat: KnowledgeCategory = {
          id: cat.id,
          subjectId: cat.subjectId,
          name: cat.name,
          icon: cat.icon,
          articleCount: this.getArticleCountByCategory(cat.id),
          order: cat.order
        };
        updatedCategories.push(updatedCat);
      }
      const updatedSubject: KnowledgeSubject = {
        id: subject.id,
        name: subject.name,
        shortName: subject.shortName,
        icon: subject.icon,
        color: subject.color,
        categories: updatedCategories,
        articleCount: articleCount
      };
      result.push(updatedSubject);
    }
    return result;
  }

  /**
   * 根据科目ID获取科目信息
   */
  public getSubjectById(subjectId: string): KnowledgeSubject | undefined {
    return getKnowledgeSubjectById(subjectId);
  }

  /**
   * 获取科目下的分类
   */
  public getCategoriesBySubject(subjectId: string): KnowledgeCategory[] {
    const categories = getCategoriesBySubject(subjectId);
    const result: KnowledgeCategory[] = [];
    for (const cat of categories) {
      const updatedCat: KnowledgeCategory = {
        id: cat.id,
        subjectId: cat.subjectId,
        name: cat.name,
        icon: cat.icon,
        articleCount: this.getArticleCountByCategory(cat.id),
        order: cat.order
      };
      result.push(updatedCat);
    }
    return result;
  }

  /**
   * 获取文章列表（兼容方法）
   */
  public getArticles(): KnowledgeArticle[] {
    return this.allArticles;
  }

  /**
   * 获取所有文章
   */
  public getAllArticles(): KnowledgeArticle[] {
    return this.allArticles;
  }

  /**
   * 根据科目ID获取文章列表
   */
  public getArticlesBySubject(subjectId: string): KnowledgeArticle[] {
    return this.allArticles.filter((article: KnowledgeArticle) => article.subjectId === subjectId);
  }

  /**
   * 根据分类ID获取文章列表
   */
  public getArticlesByCategory(categoryId: string): KnowledgeArticle[] {
    return this.allArticles.filter((article: KnowledgeArticle) => article.categoryId === categoryId);
  }

  /**
   * 根据文章ID获取文章详情
   */
  public getArticleById(articleId: string): KnowledgeArticle | undefined {
    return this.allArticles.find((article: KnowledgeArticle) => article.id === articleId);
  }

  /**
   * 获取置顶文章
   */
  public getPinnedArticles(subjectId?: string): KnowledgeArticle[] {
    let articles = this.allArticles.filter((article: KnowledgeArticle) => article.isPinned);
    if (subjectId) {
      articles = articles.filter((article: KnowledgeArticle) => article.subjectId === subjectId);
    }
    return articles;
  }

  /**
   * 获取推荐文章
   */
  public getRecommendedArticles(limit: number = 10): KnowledgeArticle[] {
    // 按更新时间排序，取最新的文章
    const sortedArticles = this.allArticles.slice();
    sortedArticles.sort((a: KnowledgeArticle, b: KnowledgeArticle) => b.updateTime - a.updateTime);
    return sortedArticles.slice(0, limit);
  }

  /**
   * 搜索文章
   */
  public searchArticles(keyword: string): KnowledgeSearchResult[] {
    if (!keyword.trim()) {
      return [];
    }

    const results: KnowledgeSearchResult[] = [];
    const lowerKeyword = keyword.toLowerCase();

    this.allArticles.forEach((article: KnowledgeArticle) => {
      // 标题匹配
      if (article.title.toLowerCase().includes(lowerKeyword)) {
        const result: KnowledgeSearchResult = {
          article: article,
          matchType: 'title',
          highlight: article.title
        };
        results.push(result);
        return;
      }

      // 标签匹配
      const matchedTag = article.tags.find((tag: string) => tag.toLowerCase().includes(lowerKeyword));
      if (matchedTag) {
        const result: KnowledgeSearchResult = {
          article: article,
          matchType: 'tag',
          highlight: matchedTag
        };
        results.push(result);
        return;
      }

      // 内容匹配
      if (article.content.toLowerCase().includes(lowerKeyword)) {
        const index = article.content.toLowerCase().indexOf(lowerKeyword);
        const start = Math.max(0, index - 20);
        const end = Math.min(article.content.length, index + keyword.length + 20);
        const result: KnowledgeSearchResult = {
          article: article,
          matchType: 'content',
          highlight: '...' + article.content.substring(start, end) + '...'
        };
        results.push(result);
      }
    });

    return results;
  }

  /**
   * 获取科目文章数量
   */
  public getArticleCountBySubject(subjectId: string): number {
    return this.allArticles.filter((article: KnowledgeArticle) => article.subjectId === subjectId).length;
  }

  /**
   * 获取分类文章数量
   */
  public getArticleCountByCategory(categoryId: string): number {
    return this.allArticles.filter((article: KnowledgeArticle) => article.categoryId === categoryId).length;
  }

  /**
   * 记录阅读
   */
  public recordReading(articleId: string, readTime: number, progress: number): void {
    const existing = this.readingRecords.get(articleId);
    const existingId = existing ? existing.id : `read_${articleId}_${Date.now()}`;
    const existingReadTime = existing ? existing.readTime : 0;
    const existingProgress = existing ? existing.progress : 0;
    const record: KnowledgeReadRecord = {
      id: existingId,
      articleId: articleId,
      readTime: existingReadTime + readTime,
      progress: Math.max(existingProgress, progress),
      lastReadTime: Date.now()
    };
    this.readingRecords.set(articleId, record);
  }

  /**
   * 更新阅读进度（兼容方法）
   */
  public updateReadProgress(articleId: string, progress: number, readTime: number): void {
    this.recordReading(articleId, readTime, progress);
  }

  /**
   * 增加浏览次数
   */
  public incrementViewCount(articleId: string): void {
    const article = this.getArticleById(articleId);
    if (article) {
      article.viewCount = article.viewCount + 1;
    }
  }

  /**
   * 获取阅读记录
   */
  public getReadingRecord(articleId: string): KnowledgeReadRecord | undefined {
    return this.readingRecords.get(articleId);
  }

  /**
   * 获取最近阅读
   */
  public getRecentReadings(limit: number = 10): KnowledgeArticle[] {
    const records = Array.from(this.readingRecords.values())
      .sort((a: KnowledgeReadRecord, b: KnowledgeReadRecord) => b.lastReadTime - a.lastReadTime)
      .slice(0, limit);

    const result: KnowledgeArticle[] = [];
    for (const record of records) {
      const article = this.getArticleById(record.articleId);
      if (article !== undefined) {
        result.push(article);
      }
    }
    return result;
  }

  /**
   * 收藏文章
   */
  public favoriteArticle(articleId: string): void {
    if (!this.favorites.has(articleId)) {
      const favorite: KnowledgeFavorite = {
        id: `fav_${articleId}_${Date.now()}`,
        articleId: articleId,
        createTime: Date.now()
      };
      this.favorites.set(articleId, favorite);
    }
  }

  /**
   * 取消收藏
   */
  public unfavoriteArticle(articleId: string): void {
    this.favorites.delete(articleId);
  }

  /**
   * 是否已收藏
   */
  public isFavorited(articleId: string): boolean {
    return this.favorites.has(articleId);
  }

  /**
   * 获取收藏列表
   */
  public getFavoriteArticles(): KnowledgeArticle[] {
    const favorites = Array.from(this.favorites.values())
      .sort((a: KnowledgeFavorite, b: KnowledgeFavorite) => b.createTime - a.createTime);

    const result: KnowledgeArticle[] = [];
    for (const fav of favorites) {
      const article = this.getArticleById(fav.articleId);
      if (article !== undefined) {
        result.push(article);
      }
    }
    return result;
  }

  /**
   * 获取文章总数
   */
  public getTotalArticleCount(): number {
    return this.allArticles.length;
  }

  /**
   * 保存文章笔记
   */
  public saveArticleNote(articleId: string, note: string): void {
    if (note.trim()) {
      this.articleNotes.set(articleId, note);
    } else {
      this.articleNotes.delete(articleId);
    }
  }

  /**
   * 获取文章笔记
   */
  public getArticleNote(articleId: string): string {
    return this.articleNotes.get(articleId) || '';
  }

  /**
   * 获取有笔记的文章列表
   */
  public getArticlesWithNotes(): KnowledgeArticle[] {
    const result: KnowledgeArticle[] = [];
    this.articleNotes.forEach((note: string, articleId: string) => {
      const article = this.getArticleById(articleId);
      if (article) {
        result.push(article);
      }
    });
    return result;
  }

  /**
   * 获取笔记数量
   */
  public getNoteCount(): number {
    return this.articleNotes.size;
  }
}
