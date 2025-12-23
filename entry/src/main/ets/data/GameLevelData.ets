/**
 * 闯关模式关卡配置数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { GameChapter, GameLevel, GameDifficulty } from '../common/types/GameTypes';
import { AppConstants } from '../common/constants/AppConstants';
import { ThemeColors } from '../theme/ThemeColors';

/**
 * 创建关卡
 */
function createLevel(
  chapterId: string,
  levelNumber: number,
  name: string,
  description: string,
  questionCount: number,
  difficulty: GameDifficulty,
  requiredStars: number
): GameLevel {
  return {
    id: `${chapterId}_level_${levelNumber}`,
    chapterId: chapterId,
    levelNumber: levelNumber,
    name: name,
    description: description,
    questionCount: questionCount,
    difficulty: difficulty,
    requiredStars: requiredStars,
    isUnlocked: levelNumber === 1,
    bestStars: 0,
    bestScore: 0,
    completedTimes: 0
  };
}

/**
 * 基础知识章节关卡
 */
const BASIC_LEVELS: GameLevel[] = [
  createLevel('chapter_basic', 1, '初识水利', '了解水利工程基础概念', 5, 'easy', 0),
  createLevel('chapter_basic', 2, '基础概念', '掌握基本术语和定义', 5, 'easy', 2),
  createLevel('chapter_basic', 3, '检测入门', '学习检测基本流程', 6, 'easy', 5),
  createLevel('chapter_basic', 4, '标准规范', '熟悉相关标准规范', 6, 'medium', 8),
  createLevel('chapter_basic', 5, '质量控制', '了解质量控制要点', 7, 'medium', 12),
  createLevel('chapter_basic', 6, '安全知识', '掌握安全操作规程', 7, 'medium', 16),
  createLevel('chapter_basic', 7, '综合应用', '综合运用基础知识', 8, 'hard', 20),
  createLevel('chapter_basic', 8, '基础Boss', '基础知识终极挑战', 10, 'boss', 24)
];

/**
 * 混凝土工程章节关卡
 */
const CONCRETE_LEVELS: GameLevel[] = [
  createLevel('chapter_concrete', 1, '混凝土基础', '认识混凝土材料', 5, 'easy', 0),
  createLevel('chapter_concrete', 2, '原材料检测', '水泥、骨料检测', 5, 'easy', 2),
  createLevel('chapter_concrete', 3, '配合比设计', '混凝土配合比', 6, 'easy', 5),
  createLevel('chapter_concrete', 4, '拌合物性能', '工作性能检测', 6, 'medium', 8),
  createLevel('chapter_concrete', 5, '强度检测', '抗压强度试验', 7, 'medium', 12),
  createLevel('chapter_concrete', 6, '耐久性检测', '抗渗、抗冻检测', 7, 'medium', 16),
  createLevel('chapter_concrete', 7, '外加剂检测', '外加剂性能检测', 7, 'hard', 20),
  createLevel('chapter_concrete', 8, '结构检测', '结构实体检测', 8, 'hard', 24),
  createLevel('chapter_concrete', 9, '缺陷处理', '缺陷检测与处理', 8, 'hard', 28),
  createLevel('chapter_concrete', 10, '混凝土Boss', '混凝土终极挑战', 12, 'boss', 32)
];

/**
 * 岩土工程（岩石、土工）章节关卡
 */
const GEOTECHNICAL_ROCK_LEVELS: GameLevel[] = [
  createLevel('chapter_geo_rock', 1, '岩石基础', '岩石分类与特性', 5, 'easy', 0),
  createLevel('chapter_geo_rock', 2, '土的分类', '土的工程分类', 5, 'easy', 2),
  createLevel('chapter_geo_rock', 3, '物理性质', '物理性质试验', 6, 'easy', 5),
  createLevel('chapter_geo_rock', 4, '力学性质', '力学性质试验', 6, 'medium', 8),
  createLevel('chapter_geo_rock', 5, '现场试验', '原位测试方法', 7, 'medium', 12),
  createLevel('chapter_geo_rock', 6, '取样技术', '取样与保存', 7, 'medium', 16),
  createLevel('chapter_geo_rock', 7, '数据分析', '试验数据处理', 8, 'hard', 20),
  createLevel('chapter_geo_rock', 8, '岩土Boss', '岩土终极挑战', 10, 'boss', 24)
];

/**
 * 岩土工程（地基与基础）章节关卡
 */
const GEOTECHNICAL_FOUNDATION_LEVELS: GameLevel[] = [
  createLevel('chapter_geo_found', 1, '地基基础', '地基基础概念', 5, 'easy', 0),
  createLevel('chapter_geo_found', 2, '承载力', '地基承载力检测', 5, 'easy', 2),
  createLevel('chapter_geo_found', 3, '桩基检测', '桩基础检测方法', 6, 'medium', 5),
  createLevel('chapter_geo_found', 4, '沉降观测', '沉降变形监测', 6, 'medium', 8),
  createLevel('chapter_geo_found', 5, '基坑监测', '基坑工程监测', 7, 'medium', 12),
  createLevel('chapter_geo_found', 6, '地基处理', '地基处理检测', 7, 'hard', 16),
  createLevel('chapter_geo_found', 7, '综合检测', '综合检测技术', 8, 'hard', 20),
  createLevel('chapter_geo_found', 8, '地基Boss', '地基终极挑战', 10, 'boss', 24)
];

/**
 * 量测章节关卡
 */
const MEASUREMENT_LEVELS: GameLevel[] = [
  createLevel('chapter_measure', 1, '量测基础', '量测基本概念', 5, 'easy', 0),
  createLevel('chapter_measure', 2, '测量仪器', '常用测量仪器', 5, 'easy', 2),
  createLevel('chapter_measure', 3, '水准测量', '水准测量方法', 6, 'easy', 5),
  createLevel('chapter_measure', 4, '角度测量', '角度测量技术', 6, 'medium', 8),
  createLevel('chapter_measure', 5, '距离测量', '距离测量方法', 7, 'medium', 12),
  createLevel('chapter_measure', 6, '变形监测', '变形监测技术', 7, 'medium', 16),
  createLevel('chapter_measure', 7, '数据处理', '测量数据处理', 8, 'hard', 20),
  createLevel('chapter_measure', 8, '量测Boss', '量测终极挑战', 10, 'boss', 24)
];

/**
 * 金属结构章节关卡
 */
const METAL_LEVELS: GameLevel[] = [
  createLevel('chapter_metal', 1, '金属基础', '金属材料基础', 5, 'easy', 0),
  createLevel('chapter_metal', 2, '钢材检测', '钢材性能检测', 5, 'easy', 2),
  createLevel('chapter_metal', 3, '焊接检测', '焊接质量检测', 6, 'medium', 5),
  createLevel('chapter_metal', 4, '无损检测', '无损检测技术', 6, 'medium', 8),
  createLevel('chapter_metal', 5, '防腐检测', '防腐涂层检测', 7, 'medium', 12),
  createLevel('chapter_metal', 6, '闸门检测', '闸门结构检测', 7, 'hard', 16),
  createLevel('chapter_metal', 7, '综合检测', '综合检测技术', 8, 'hard', 20),
  createLevel('chapter_metal', 8, '金属Boss', '金属终极挑战', 10, 'boss', 24)
];

/**
 * 机械电气章节关卡
 */
const MECHANICAL_LEVELS: GameLevel[] = [
  createLevel('chapter_mech', 1, '机械基础', '机械设备基础', 5, 'easy', 0),
  createLevel('chapter_mech', 2, '电气基础', '电气设备基础', 5, 'easy', 2),
  createLevel('chapter_mech', 3, '启闭机检测', '启闭机检测', 6, 'medium', 5),
  createLevel('chapter_mech', 4, '水泵检测', '水泵性能检测', 6, 'medium', 8),
  createLevel('chapter_mech', 5, '电机检测', '电机性能检测', 7, 'medium', 12),
  createLevel('chapter_mech', 6, '控制系统', '控制系统检测', 7, 'hard', 16),
  createLevel('chapter_mech', 7, '综合检测', '综合检测技术', 8, 'hard', 20),
  createLevel('chapter_mech', 8, '机电Boss', '机电终极挑战', 10, 'boss', 24)
];

/**
 * 所有章节数据
 */
export const GAME_CHAPTERS: GameChapter[] = [
  {
    id: 'chapter_basic',
    subjectId: AppConstants.SUBJECT_BASIC,
    name: '基础知识',
    shortName: '基础',
    icon: '📚',
    color: ThemeColors.SUBJECT_BASIC,
    levels: BASIC_LEVELS,
    totalStars: BASIC_LEVELS.length * 3,
    earnedStars: 0,
    isUnlocked: true,
    order: 1
  },
  {
    id: 'chapter_concrete',
    subjectId: AppConstants.SUBJECT_CONCRETE,
    name: '混凝土工程',
    shortName: '混凝土',
    icon: '🏗️',
    color: ThemeColors.SUBJECT_CONCRETE,
    levels: CONCRETE_LEVELS,
    totalStars: CONCRETE_LEVELS.length * 3,
    earnedStars: 0,
    isUnlocked: false,
    order: 2
  },
  {
    id: 'chapter_geo_rock',
    subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
    name: '岩土工程（岩石、土工）',
    shortName: '岩土',
    icon: '🪨',
    color: ThemeColors.SUBJECT_GEOTECHNICAL_ROCK,
    levels: GEOTECHNICAL_ROCK_LEVELS,
    totalStars: GEOTECHNICAL_ROCK_LEVELS.length * 3,
    earnedStars: 0,
    isUnlocked: false,
    order: 3
  },
  {
    id: 'chapter_geo_found',
    subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
    name: '岩土工程（地基与基础）',
    shortName: '地基',
    icon: '🏛️',
    color: ThemeColors.SUBJECT_GEOTECHNICAL_FOUNDATION,
    levels: GEOTECHNICAL_FOUNDATION_LEVELS,
    totalStars: GEOTECHNICAL_FOUNDATION_LEVELS.length * 3,
    earnedStars: 0,
    isUnlocked: false,
    order: 4
  },
  {
    id: 'chapter_measure',
    subjectId: AppConstants.SUBJECT_MEASUREMENT,
    name: '量测',
    shortName: '量测',
    icon: '📏',
    color: ThemeColors.SUBJECT_MEASUREMENT,
    levels: MEASUREMENT_LEVELS,
    totalStars: MEASUREMENT_LEVELS.length * 3,
    earnedStars: 0,
    isUnlocked: false,
    order: 5
  },
  {
    id: 'chapter_metal',
    subjectId: AppConstants.SUBJECT_METAL,
    name: '金属结构',
    shortName: '金属',
    icon: '⚙️',
    color: ThemeColors.SUBJECT_METAL,
    levels: METAL_LEVELS,
    totalStars: METAL_LEVELS.length * 3,
    earnedStars: 0,
    isUnlocked: false,
    order: 6
  },
  {
    id: 'chapter_mech',
    subjectId: AppConstants.SUBJECT_MECHANICAL,
    name: '机械电气',
    shortName: '机电',
    icon: '🔧',
    color: ThemeColors.SUBJECT_MECHANICAL,
    levels: MECHANICAL_LEVELS,
    totalStars: MECHANICAL_LEVELS.length * 3,
    earnedStars: 0,
    isUnlocked: false,
    order: 7
  }
];

/**
 * 获取章节数据
 */
export function getChapterById(chapterId: string): GameChapter | undefined {
  return GAME_CHAPTERS.find((chapter: GameChapter) => chapter.id === chapterId);
}

/**
 * 获取关卡数据
 */
export function getLevelById(levelId: string): GameLevel | undefined {
  for (const chapter of GAME_CHAPTERS) {
    const level = chapter.levels.find((l: GameLevel) => l.id === levelId);
    if (level) return level;
  }
  return undefined;
}

/**
 * 获取章节的所有关卡
 */
export function getLevelsByChapterId(chapterId: string): GameLevel[] {
  const chapter = getChapterById(chapterId);
  return chapter ? chapter.levels : [];
}
