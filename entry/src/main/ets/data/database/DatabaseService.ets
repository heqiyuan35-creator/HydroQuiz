/**
 * 数据库服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { relationalStore } from '@kit.ArkData';
import { Context } from '@kit.AbilityKit';
import { Logger } from '../../common/utils/Logger';

const DB_NAME: string = 'HydroQuiz.db';
const DB_SECURITY_LEVEL: relationalStore.SecurityLevel = relationalStore.SecurityLevel.S1;

/**
 * 数据库服务类
 */
class DatabaseService {
  private rdbStore: relationalStore.RdbStore | null = null;
  private isInitialized: boolean = false;
  private initPromise: Promise<void> | null = null;
  private initResolvers: Array<() => void> = [];

  /**
   * 初始化数据库
   */
  async initialize(context: Context): Promise<void> {
    if (this.isInitialized) {
      Logger.info('[DatabaseService] Already initialized');
      return;
    }

    try {
      const config: relationalStore.StoreConfig = {
        name: DB_NAME,
        securityLevel: DB_SECURITY_LEVEL
      };

      this.rdbStore = await relationalStore.getRdbStore(context, config);
      await this.createTables();
      this.isInitialized = true;
      Logger.info('[DatabaseService] Database initialized successfully');

      // 通知所有等待者数据库已就绪
      this.notifyReady();
    } catch (error) {
      Logger.error('[DatabaseService] Failed to initialize database', error as Error);
      throw new Error('Database initialization failed');
    }
  }

  /**
   * 创建数据表
   */
  private async createTables(): Promise<void> {
    if (!this.rdbStore) {
      throw new Error('Database not initialized');
    }


    // 题目表
    const createQuestionsTable: string = `
      CREATE TABLE IF NOT EXISTS questions (
        id TEXT PRIMARY KEY,
        type TEXT NOT NULL,
        subject_id TEXT NOT NULL,
        chapter TEXT,
        content TEXT NOT NULL,
        options TEXT,
        answer TEXT NOT NULL,
        analysis TEXT,
        difficulty INTEGER DEFAULT 1,
        tags TEXT,
        create_time INTEGER,
        update_time INTEGER
      )
    `;

    // 答题记录表
    const createAnswerRecordsTable: string = `
      CREATE TABLE IF NOT EXISTS answer_records (
        id TEXT PRIMARY KEY,
        question_id TEXT NOT NULL,
        user_answer TEXT NOT NULL,
        is_correct INTEGER NOT NULL,
        answer_time INTEGER,
        create_time INTEGER NOT NULL
      )
    `;

    // 错题表
    const createWrongQuestionsTable: string = `
      CREATE TABLE IF NOT EXISTS wrong_questions (
        id TEXT PRIMARY KEY,
        question_id TEXT NOT NULL UNIQUE,
        wrong_count INTEGER DEFAULT 1,
        last_wrong_time INTEGER,
        is_mastered INTEGER DEFAULT 0,
        note TEXT DEFAULT ''
      )
    `;

    // 收藏表
    const createFavoritesTable: string = `
      CREATE TABLE IF NOT EXISTS favorites (
        id TEXT PRIMARY KEY,
        question_id TEXT NOT NULL UNIQUE,
        group_name TEXT DEFAULT '默认',
        create_time INTEGER NOT NULL
      )
    `;

    // 考试记录表
    const createExamRecordsTable: string = `
      CREATE TABLE IF NOT EXISTS exam_records (
        id TEXT PRIMARY KEY,
        exam_type TEXT NOT NULL,
        subject_id TEXT,
        total_count INTEGER NOT NULL,
        correct_count INTEGER NOT NULL,
        score REAL NOT NULL,
        duration INTEGER NOT NULL,
        create_time INTEGER NOT NULL,
        question_ids TEXT,
        answers TEXT
      )
    `;

    // 学习统计表
    const createStudyStatisticsTable: string = `
      CREATE TABLE IF NOT EXISTS study_statistics (
        id TEXT PRIMARY KEY,
        date TEXT NOT NULL UNIQUE,
        study_time INTEGER DEFAULT 0,
        question_count INTEGER DEFAULT 0,
        correct_count INTEGER DEFAULT 0
      )
    `;

    // 练习进度表
    const createPracticeProgressTable: string = `
      CREATE TABLE IF NOT EXISTS practice_progress (
        subject_id TEXT PRIMARY KEY,
        total_count INTEGER DEFAULT 0,
        done_count INTEGER DEFAULT 0,
        correct_count INTEGER DEFAULT 0,
        last_question_index INTEGER DEFAULT 0
      )
    `;

    try {
      await this.rdbStore.executeSql(createQuestionsTable);
      await this.rdbStore.executeSql(createAnswerRecordsTable);
      await this.rdbStore.executeSql(createWrongQuestionsTable);
      await this.rdbStore.executeSql(createFavoritesTable);
      await this.rdbStore.executeSql(createExamRecordsTable);
      await this.rdbStore.executeSql(createStudyStatisticsTable);
      await this.rdbStore.executeSql(createPracticeProgressTable);

      // 创建索引
      await this.rdbStore.executeSql('CREATE INDEX IF NOT EXISTS idx_questions_subject ON questions(subject_id)');
      await this.rdbStore.executeSql('CREATE INDEX IF NOT EXISTS idx_questions_type ON questions(type)');
      await this.rdbStore.executeSql('CREATE INDEX IF NOT EXISTS idx_answer_records_question ON answer_records(question_id)');
      await this.rdbStore.executeSql('CREATE INDEX IF NOT EXISTS idx_answer_records_time ON answer_records(create_time)');

      // 数据库迁移：为 wrong_questions 表添加 note 字段（兼容旧版本）
      try {
        await this.rdbStore.executeSql('ALTER TABLE wrong_questions ADD COLUMN note TEXT DEFAULT \'\'');
        Logger.info('[DatabaseService] Added note column to wrong_questions');
      } catch (e) {
        // 字段已存在，忽略错误
      }

      // 卡片系统表
      await this.createCardTables();

      Logger.info('[DatabaseService] Tables created successfully');
    } catch (error) {
      Logger.error('[DatabaseService] Failed to create tables', error as Error);
      throw new Error('Failed to create database tables');
    }
  }

  /**
   * 创建卡片系统相关表
   */
  private async createCardTables(): Promise<void> {
    if (!this.rdbStore) {
      throw new Error('Database not initialized');
    }

    // 用户卡片表
    const createUserCardsTable: string = `
      CREATE TABLE IF NOT EXISTS user_cards (
        id TEXT PRIMARY KEY,
        card_id TEXT NOT NULL UNIQUE,
        star_level INTEGER DEFAULT 1,
        fragments INTEGER DEFAULT 0,
        first_obtain_time INTEGER NOT NULL,
        last_obtain_time INTEGER NOT NULL,
        obtain_count INTEGER DEFAULT 1
      )
    `;

    // 卡片掉落记录表
    const createCardDropRecordsTable: string = `
      CREATE TABLE IF NOT EXISTS card_drop_records (
        id TEXT PRIMARY KEY,
        card_id TEXT NOT NULL,
        drop_time INTEGER NOT NULL,
        question_id TEXT,
        subject_id TEXT,
        practice_mode TEXT,
        is_new INTEGER DEFAULT 0
      )
    `;

    // 掉落状态表（保底计数等）
    const createCardDropStateTable: string = `
      CREATE TABLE IF NOT EXISTS card_drop_state (
        id TEXT PRIMARY KEY,
        pity_count INTEGER DEFAULT 0,
        last_drop_time INTEGER DEFAULT 0,
        total_drops INTEGER DEFAULT 0,
        total_answers INTEGER DEFAULT 0
      )
    `;

    try {
      await this.rdbStore.executeSql(createUserCardsTable);
      await this.rdbStore.executeSql(createCardDropRecordsTable);
      await this.rdbStore.executeSql(createCardDropStateTable);

      // 添加 total_answers 列（如果不存在）- 用于数据库升级
      try {
        await this.rdbStore.executeSql('ALTER TABLE card_drop_state ADD COLUMN total_answers INTEGER DEFAULT 0');
      } catch (e) {
        // 列已存在，忽略错误
      }

      // 创建卡片相关索引
      await this.rdbStore.executeSql('CREATE INDEX IF NOT EXISTS idx_user_cards_card_id ON user_cards(card_id)');
      await this.rdbStore.executeSql('CREATE INDEX IF NOT EXISTS idx_drop_records_time ON card_drop_records(drop_time)');
      await this.rdbStore.executeSql('CREATE INDEX IF NOT EXISTS idx_drop_records_card ON card_drop_records(card_id)');

      Logger.info('[DatabaseService] Card tables created successfully');
    } catch (error) {
      Logger.error('[DatabaseService] Failed to create card tables', error as Error);
      throw new Error('Failed to create card database tables');
    }
  }

  /**
   * 获取数据库实例
   */
  getStore(): relationalStore.RdbStore {
    if (!this.rdbStore) {
      throw new Error('Database not initialized');
    }
    return this.rdbStore;
  }

  /**
   * 检查是否已初始化
   */
  isReady(): boolean {
    return this.isInitialized && this.rdbStore !== null;
  }

  /**
   * 等待数据库初始化完成
   * 如果已初始化，立即返回；否则等待初始化完成
   */
  async waitForReady(timeoutMs: number = 10000): Promise<boolean> {
    if (this.isReady()) {
      return true;
    }

    return new Promise<boolean>((resolve) => {
      const timeout = setTimeout(() => {
        // 超时，从等待列表中移除
        const index = this.initResolvers.indexOf(resolveFunc);
        if (index > -1) {
          this.initResolvers.splice(index, 1);
        }
        Logger.warn('[DatabaseService] Wait for ready timeout');
        resolve(false);
      }, timeoutMs);

      const resolveFunc = () => {
        clearTimeout(timeout);
        resolve(true);
      };

      this.initResolvers.push(resolveFunc);
    });
  }

  /**
   * 通知所有等待者数据库已就绪
   */
  private notifyReady(): void {
    for (const resolver of this.initResolvers) {
      resolver();
    }
    this.initResolvers = [];
  }

  /**
   * 关闭数据库
   */
  async close(): Promise<void> {
    if (this.rdbStore) {
      this.rdbStore = null;
      this.isInitialized = false;
      Logger.info('[DatabaseService] Database closed');
    }
  }
}

// 导出单例
export const databaseService = new DatabaseService();
