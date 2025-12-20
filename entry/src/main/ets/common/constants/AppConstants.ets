/**
 * 应用常量定义
 * HydroQuiz - 水利工程检测员刷题宝
 */

export class AppConstants {
  // 应用信息
  static readonly APP_NAME: string = '水利工程检测员刷题宝';
  static readonly APP_VERSION: string = '1.0.0';
  static readonly APP_PACKAGE: string = 'com.example.hydroquiz';
  static readonly APP_SLOGAN: string = '专业水利工程检测员考试备考神器';
  static readonly APP_DESCRIPTION: string = '水利工程检测员刷题宝是一款专为水利工程检测员资格考试设计的专业刷题应用，涵盖基础知识、混凝土工程、岩土工程、量测、金属结构、机械电气等全部考试科目，助您高效备考，一次通关。';

  // 路由路径
  static readonly ROUTE_SPLASH: string = 'pages/SplashPage';
  static readonly ROUTE_MAIN: string = 'pages/MainTabPage';
  static readonly ROUTE_HOME: string = 'pages/HomePage';
  static readonly ROUTE_PRACTICE: string = 'pages/PracticePage';
  static readonly ROUTE_ANSWER: string = 'pages/AnswerPage';
  static readonly ROUTE_EXAM: string = 'pages/ExamPage';
  static readonly ROUTE_EXAM_RESULT: string = 'pages/ExamResultPage';
  static readonly ROUTE_STATISTICS: string = 'pages/StatisticsPage';
  static readonly ROUTE_WRONG_BOOK: string = 'pages/WrongBookPage';
  static readonly ROUTE_FAVORITE: string = 'pages/FavoritePage';
  static readonly ROUTE_PROFILE: string = 'pages/ProfilePage';
  static readonly ROUTE_SETTINGS: string = 'pages/SettingsPage';
  static readonly ROUTE_THEME_SETTINGS: string = 'pages/ThemeSettingsPage';
  static readonly ROUTE_ABOUT: string = 'pages/AboutPage';
  static readonly ROUTE_QUESTION_BANK: string = 'pages/QuestionBankPage';
  static readonly ROUTE_WRONG_STATISTICS: string = 'pages/WrongStatisticsPage';
  static readonly ROUTE_MOCK_EXAM_ENTRY: string = 'pages/MockExamEntryPage';
  static readonly ROUTE_MOCK_EXAM: string = 'pages/MockExamPage';
  static readonly ROUTE_MOCK_EXAM_RESULT: string = 'pages/MockExamResultPage';
  static readonly ROUTE_MOCK_EXAM_HISTORY: string = 'pages/MockExamHistoryPage';
  static readonly ROUTE_KNOWLEDGE_LIST: string = 'pages/KnowledgeListPage';
  static readonly ROUTE_KNOWLEDGE_DETAIL: string = 'pages/KnowledgeDetailPage';

  // 科目ID
  static readonly SUBJECT_BASIC: string = '001';           // 基础知识
  static readonly SUBJECT_CONCRETE: string = '002';        // 混凝土工程
  static readonly SUBJECT_GEOTECHNICAL_ROCK: string = '003'; // 岩土工程（岩石、土工）
  static readonly SUBJECT_GEOTECHNICAL_FOUNDATION: string = '004'; // 岩土工程（地基与基础）
  static readonly SUBJECT_MEASUREMENT: string = '005';     // 量测
  static readonly SUBJECT_METAL: string = '006';           // 金属结构
  static readonly SUBJECT_MECHANICAL: string = '007';      // 机械电气

  // 题型
  static readonly QUESTION_TYPE_SINGLE: string = 'single';       // 单选题
  static readonly QUESTION_TYPE_MULTIPLE: string = 'multiple';   // 多选题
  static readonly QUESTION_TYPE_JUDGE: string = 'judge';         // 判断题
  static readonly QUESTION_TYPE_CASE: string = 'case';           // 案例分析题

  // 练习模式
  static readonly PRACTICE_MODE_SEQUENCE: string = 'sequence';   // 顺序练习
  static readonly PRACTICE_MODE_RANDOM: string = 'random';       // 随机练习
  static readonly PRACTICE_MODE_WRONG: string = 'wrong';         // 错题练习
  static readonly PRACTICE_MODE_FAVORITE: string = 'favorite';   // 收藏练习
  static readonly PRACTICE_MODE_SMART: string = 'smart';         // 智能练习

  // 考试类型
  static readonly EXAM_TYPE_MOCK: string = 'mock';               // 模拟考试
  static readonly EXAM_TYPE_CHAPTER: string = 'chapter';         // 章节测试
  static readonly EXAM_TYPE_DAILY: string = 'daily';             // 每日一练

  // 难度等级
  static readonly DIFFICULTY_EASY: number = 1;
  static readonly DIFFICULTY_MEDIUM: number = 2;
  static readonly DIFFICULTY_HARD: number = 3;

  // 存储Key
  static readonly STORAGE_USER_SETTINGS: string = 'user_settings';
  static readonly STORAGE_STUDY_GOAL: string = 'study_goal';
  static readonly STORAGE_THEME_MODE: string = 'theme_mode';
  static readonly STORAGE_FONT_SIZE: string = 'font_size';
  static readonly STORAGE_LAST_PRACTICE: string = 'last_practice';

  // 默认值
  static readonly DEFAULT_DAILY_GOAL: number = 50;               // 每日目标题数
  static readonly DEFAULT_EXAM_TIME: number = 120;               // 考试时长（分钟）
  static readonly DEFAULT_EXAM_QUESTION_COUNT: number = 100;     // 考试题目数量

  // 安全区域高度（适配状态栏和底部导航栏）
  static readonly STATUS_BAR_HEIGHT: number = 48;                // 状态栏高度
  static readonly BOTTOM_NAV_HEIGHT: number = 28;                // 底部导航栏安全区域高度
}
