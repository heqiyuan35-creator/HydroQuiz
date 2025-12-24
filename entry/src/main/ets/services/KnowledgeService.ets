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
import { relationalStore } from '@kit.ArkData';
import { databaseService } from '../data/database/DatabaseService';
import { Logger } from '../common/utils/Logger';

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
  private viewCounts: Map<string, number> = new Map(); // 浏览次数缓存
  private isDataLoaded: boolean = false;

  private constructor() {
    this.initArticles();
    this.loadFromDatabase();
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
   * 从数据库加载持久化数据
   */
  private async loadFromDatabase(): Promise<void> {
    try {
      // 等待数据库就绪
      const isReady = await databaseService.waitForReady(5000);
      if (!isReady) {
        Logger.warn('[KnowledgeService] Database not ready, using memory only');
        return;
      }

      const store = databaseService.getStore();

      // 加载阅读记录
      await this.loadReadRecords(store);

      // 加载收藏
      await this.loadFavorites(store);

      // 加载笔记
      await this.loadNotes(store);

      this.isDataLoaded = true;
      Logger.info('[KnowledgeService] Data loaded from database');
    } catch (error) {
      Logger.error('[KnowledgeService] Failed to load from database', error as Error);
    }
  }

  /**
   * 加载阅读记录
   */
  private async loadReadRecords(store: relationalStore.RdbStore): Promise<void> {
    try {
      const predicates = new relationalStore.RdbPredicates('knowledge_read_records');
      const resultSet = await store.query(predicates);

      while (resultSet.goToNextRow()) {
        const articleId = resultSet.getString(resultSet.getColumnIndex('article_id'));
        const viewCount = resultSet.getLong(resultSet.getColumnIndex('view_count'));
        const readTime = resultSet.getLong(resultSet.getColumnIndex('read_time'));
        const progress = resultSet.getLong(resultSet.getColumnIndex('progress'));
        const lastReadTime = resultSet.getLong(resultSet.getColumnIndex('last_read_time'));

        // 保存浏览次数到缓存
        this.viewCounts.set(articleId, viewCount);

        // 保存阅读记录
        const record: KnowledgeReadRecord = {
          id: `read_${articleId}`,
          articleId: articleId,
          readTime: readTime,
          progress: progress,
          lastReadTime: lastReadTime
        };
        this.readingRecords.set(articleId, record);
      }

      resultSet.close();
      Logger.info(`[KnowledgeService] Loaded ${this.viewCounts.size} read records`);
    } catch (error) {
      Logger.error('[KnowledgeService] Failed to load read records', error as Error);
    }
  }

  /**
   * 加载收藏
   */
  private async loadFavorites(store: relationalStore.RdbStore): Promise<void> {
    try {
      const predicates = new relationalStore.RdbPredicates('knowledge_favorites');
      const resultSet = await store.query(predicates);

      while (resultSet.goToNextRow()) {
        const articleId = resultSet.getString(resultSet.getColumnIndex('article_id'));
        const createTime = resultSet.getLong(resultSet.getColumnIndex('create_time'));

        const favorite: KnowledgeFavorite = {
          id: `fav_${articleId}`,
          articleId: articleId,
          createTime: createTime
        };
        this.favorites.set(articleId, favorite);
      }

      resultSet.close();
      Logger.info(`[KnowledgeService] Loaded ${this.favorites.size} favorites`);
    } catch (error) {
      Logger.error('[KnowledgeService] Failed to load favorites', error as Error);
    }
  }

  /**
   * 加载笔记
   */
  private async loadNotes(store: relationalStore.RdbStore): Promise<void> {
    try {
      const predicates = new relationalStore.RdbPredicates('knowledge_notes');
      const resultSet = await store.query(predicates);

      while (resultSet.goToNextRow()) {
        const articleId = resultSet.getString(resultSet.getColumnIndex('article_id'));
        const note = resultSet.getString(resultSet.getColumnIndex('note'));

        this.articleNotes.set(articleId, note);
      }

      resultSet.close();
      Logger.info(`[KnowledgeService] Loaded ${this.articleNotes.size} notes`);
    } catch (error) {
      Logger.error('[KnowledgeService] Failed to load notes', error as Error);
    }
  }

  /**
   * 刷新数据（从数据库重新加载）
   */
  public async refreshData(): Promise<void> {
    // 清空缓存
    this.readingRecords.clear();
    this.favorites.clear();
    this.articleNotes.clear();
    this.viewCounts.clear();
    this.isDataLoaded = false;

    // 从数据库重新加载
    await this.loadFromDatabase();
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
   * 获取所有文章（带浏览次数）
   */
  public getAllArticles(): KnowledgeArticle[] {
    // 同步 viewCounts 到文章对象并返回新数组以触发UI更新
    const result: KnowledgeArticle[] = [];
    for (const article of this.allArticles) {
      const viewCount = this.viewCounts.get(article.id) || 0;
      // 创建新对象以触发UI响应式更新
      const updatedArticle: KnowledgeArticle = {
        id: article.id,
        subjectId: article.subjectId,
        categoryId: article.categoryId,
        categoryName: article.categoryName,
        title: article.title,
        summary: article.summary,
        content: article.content,
        contentType: article.contentType,
        tags: article.tags,
        source: article.source,
        readTime: article.readTime,
        isPinned: article.isPinned,
        isDownloaded: article.isDownloaded,
        createTime: article.createTime,
        updateTime: article.updateTime,
        viewCount: viewCount,
        relatedQuestionIds: article.relatedQuestionIds
      };
      result.push(updatedArticle);
    }
    return result;
  }

  /**
   * 根据科目ID获取文章列表
   */
  public getArticlesBySubject(subjectId: string): KnowledgeArticle[] {
    const result: KnowledgeArticle[] = [];
    for (const article of this.allArticles) {
      if (article.subjectId === subjectId) {
        const viewCount = this.viewCounts.get(article.id) || 0;
        const updatedArticle: KnowledgeArticle = {
          id: article.id,
          subjectId: article.subjectId,
          categoryId: article.categoryId,
          categoryName: article.categoryName,
          title: article.title,
          summary: article.summary,
          content: article.content,
          contentType: article.contentType,
          tags: article.tags,
          source: article.source,
          readTime: article.readTime,
          isPinned: article.isPinned,
          isDownloaded: article.isDownloaded,
          createTime: article.createTime,
          updateTime: article.updateTime,
          viewCount: viewCount,
          relatedQuestionIds: article.relatedQuestionIds
        };
        result.push(updatedArticle);
      }
    }
    return result;
  }

  /**
   * 根据分类ID获取文章列表
   */
  public getArticlesByCategory(categoryId: string): KnowledgeArticle[] {
    const result: KnowledgeArticle[] = [];
    for (const article of this.allArticles) {
      if (article.categoryId === categoryId) {
        const viewCount = this.viewCounts.get(article.id) || 0;
        const updatedArticle: KnowledgeArticle = {
          id: article.id,
          subjectId: article.subjectId,
          categoryId: article.categoryId,
          categoryName: article.categoryName,
          title: article.title,
          summary: article.summary,
          content: article.content,
          contentType: article.contentType,
          tags: article.tags,
          source: article.source,
          readTime: article.readTime,
          isPinned: article.isPinned,
          isDownloaded: article.isDownloaded,
          createTime: article.createTime,
          updateTime: article.updateTime,
          viewCount: viewCount,
          relatedQuestionIds: article.relatedQuestionIds
        };
        result.push(updatedArticle);
      }
    }
    return result;
  }

  /**
   * 同步 viewCounts 到文章对象
   */
  private syncViewCounts(): void {
    for (const article of this.allArticles) {
      const viewCount = this.viewCounts.get(article.id);
      if (viewCount !== undefined) {
        article.viewCount = viewCount;
      }
    }
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
  public async recordReading(articleId: string, readTime: number, progress: number): Promise<void> {
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

    // 持久化到数据库
    try {
      if (!databaseService.isReady()) {
        return;
      }
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('knowledge_read_records');
      predicates.equalTo('article_id', articleId);
      const resultSet = await store.query(predicates);

      const currentViewCount = this.viewCounts.get(articleId) || 0;

      if (resultSet.goToNextRow()) {
        resultSet.close();
        // 更新现有记录
        const updatePredicates = new relationalStore.RdbPredicates('knowledge_read_records');
        updatePredicates.equalTo('article_id', articleId);
        const valueBucket: relationalStore.ValuesBucket = {
          read_time: record.readTime,
          progress: record.progress,
          last_read_time: record.lastReadTime
        };
        await store.update(valueBucket, updatePredicates);
      } else {
        resultSet.close();
        // 插入新记录
        const valueBucket: relationalStore.ValuesBucket = {
          article_id: articleId,
          view_count: currentViewCount,
          read_time: record.readTime,
          progress: record.progress,
          last_read_time: record.lastReadTime
        };
        await store.insert('knowledge_read_records', valueBucket);
      }

      Logger.info(`[KnowledgeService] Reading recorded: ${articleId}`);
    } catch (error) {
      Logger.error('[KnowledgeService] Failed to save reading record', error as Error);
    }
  }

  /**
   * 更新阅读进度（兼容方法）
   */
  public updateReadProgress(articleId: string, progress: number, readTime: number): void {
    // 异步调用 recordReading
    this.recordReading(articleId, readTime, progress);
  }

  /**
   * 增加浏览次数
   */
  public async incrementViewCount(articleId: string): Promise<void> {
    const article = this.getArticleById(articleId);
    if (article) {
      // 更新内存中的浏览次数
      const currentCount = this.viewCounts.get(articleId) || 0;
      const newCount = currentCount + 1;
      this.viewCounts.set(articleId, newCount);
      article.viewCount = newCount;

      // 持久化到数据库
      try {
        if (!databaseService.isReady()) {
          return;
        }
        const store = databaseService.getStore();
        const predicates = new relationalStore.RdbPredicates('knowledge_read_records');
        predicates.equalTo('article_id', articleId);
        const resultSet = await store.query(predicates);

        if (resultSet.goToNextRow()) {
          resultSet.close();
          // 更新现有记录
          const updatePredicates = new relationalStore.RdbPredicates('knowledge_read_records');
          updatePredicates.equalTo('article_id', articleId);
          const valueBucket: relationalStore.ValuesBucket = {
            view_count: newCount,
            last_read_time: Date.now()
          };
          await store.update(valueBucket, updatePredicates);
        } else {
          resultSet.close();
          // 插入新记录
          const valueBucket: relationalStore.ValuesBucket = {
            article_id: articleId,
            view_count: newCount,
            read_time: 0,
            progress: 0,
            last_read_time: Date.now()
          };
          await store.insert('knowledge_read_records', valueBucket);
        }

        Logger.info(`[KnowledgeService] View count updated: ${articleId} = ${newCount}`);
      } catch (error) {
        Logger.error('[KnowledgeService] Failed to save view count', error as Error);
      }
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
  public async favoriteArticle(articleId: string): Promise<void> {
    if (!this.favorites.has(articleId)) {
      const favorite: KnowledgeFavorite = {
        id: `fav_${articleId}_${Date.now()}`,
        articleId: articleId,
        createTime: Date.now()
      };
      this.favorites.set(articleId, favorite);

      // 持久化到数据库
      try {
        if (!databaseService.isReady()) {
          return;
        }
        const store = databaseService.getStore();
        const valueBucket: relationalStore.ValuesBucket = {
          article_id: articleId,
          create_time: favorite.createTime
        };
        await store.insert('knowledge_favorites', valueBucket);
        Logger.info(`[KnowledgeService] Favorited article: ${articleId}`);
      } catch (error) {
        Logger.error('[KnowledgeService] Failed to save favorite', error as Error);
      }
    }
  }

  /**
   * 取消收藏
   */
  public async unfavoriteArticle(articleId: string): Promise<void> {
    this.favorites.delete(articleId);

    // 从数据库删除
    try {
      if (!databaseService.isReady()) {
        return;
      }
      const store = databaseService.getStore();
      const predicates = new relationalStore.RdbPredicates('knowledge_favorites');
      predicates.equalTo('article_id', articleId);
      await store.delete(predicates);
      Logger.info(`[KnowledgeService] Unfavorited article: ${articleId}`);
    } catch (error) {
      Logger.error('[KnowledgeService] Failed to delete favorite', error as Error);
    }
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
  public async saveArticleNote(articleId: string, note: string): Promise<void> {
    if (note.trim()) {
      this.articleNotes.set(articleId, note);

      // 持久化到数据库
      try {
        if (!databaseService.isReady()) {
          return;
        }
        const store = databaseService.getStore();
        const predicates = new relationalStore.RdbPredicates('knowledge_notes');
        predicates.equalTo('article_id', articleId);
        const resultSet = await store.query(predicates);

        if (resultSet.goToNextRow()) {
          resultSet.close();
          // 更新现有笔记
          const updatePredicates = new relationalStore.RdbPredicates('knowledge_notes');
          updatePredicates.equalTo('article_id', articleId);
          const valueBucket: relationalStore.ValuesBucket = {
            note: note,
            update_time: Date.now()
          };
          await store.update(valueBucket, updatePredicates);
        } else {
          resultSet.close();
          // 插入新笔记
          const valueBucket: relationalStore.ValuesBucket = {
            article_id: articleId,
            note: note,
            update_time: Date.now()
          };
          await store.insert('knowledge_notes', valueBucket);
        }

        Logger.info(`[KnowledgeService] Note saved for article: ${articleId}`);
      } catch (error) {
        Logger.error('[KnowledgeService] Failed to save note', error as Error);
      }
    } else {
      this.articleNotes.delete(articleId);

      // 从数据库删除
      try {
        if (!databaseService.isReady()) {
          return;
        }
        const store = databaseService.getStore();
        const predicates = new relationalStore.RdbPredicates('knowledge_notes');
        predicates.equalTo('article_id', articleId);
        await store.delete(predicates);
        Logger.info(`[KnowledgeService] Note deleted for article: ${articleId}`);
      } catch (error) {
        Logger.error('[KnowledgeService] Failed to delete note', error as Error);
      }
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

  /**
   * 获取已阅读文章数量（有浏览记录的文章）
   */
  public getReadArticleCount(): number {
    return this.viewCounts.size;
  }

  /**
   * 获取收藏数量
   */
  public getFavoriteCount(): number {
    return this.favorites.size;
  }

  /**
   * 检查文章是否已读
   */
  public isArticleRead(articleId: string): boolean {
    return this.viewCounts.has(articleId) && (this.viewCounts.get(articleId) || 0) > 0;
  }

  /**
   * 获取科目已读文章数量
   */
  public getReadCountBySubject(subjectId: string): number {
    let count = 0;
    this.viewCounts.forEach((viewCount: number, articleId: string) => {
      const article = this.getArticleById(articleId);
      if (article && article.subjectId === subjectId && viewCount > 0) {
        count++;
      }
    });
    return count;
  }

  /**
   * 获取文章浏览次数
   */
  public getArticleViewCount(articleId: string): number {
    return this.viewCounts.get(articleId) || 0;
  }
}
