/**
 * 知识库分类数据
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { KnowledgeCategory, KnowledgeSubject } from '../../common/types/KnowledgeTypes';
import { AppConstants } from '../../common/constants/AppConstants';
import { ThemeColors } from '../../theme/ThemeColors';

/**
 * 基础知识分类
 */
export const BASIC_CATEGORIES: KnowledgeCategory[] = [
  { id: 'basic_001', subjectId: AppConstants.SUBJECT_BASIC, name: '水利工程概论', icon: 'book', articleCount: 0, order: 1 },
  { id: 'basic_002', subjectId: AppConstants.SUBJECT_BASIC, name: '计量与数据处理', icon: 'theory', articleCount: 0, order: 2 },
  { id: 'basic_003', subjectId: AppConstants.SUBJECT_BASIC, name: '检验检测机构管理', icon: 'management', articleCount: 0, order: 3 },
  { id: 'basic_004', subjectId: AppConstants.SUBJECT_BASIC, name: '质量标准', icon: 'quality', articleCount: 0, order: 4 },
  { id: 'basic_005', subjectId: AppConstants.SUBJECT_BASIC, name: '法律法规', icon: 'law', articleCount: 0, order: 5 }
];

/**
 * 混凝土工程分类
 */
export const CONCRETE_CATEGORIES: KnowledgeCategory[] = [
  { id: 'concrete_001', subjectId: AppConstants.SUBJECT_CONCRETE, name: '绪论', icon: 'intro', articleCount: 0, order: 1 },
  { id: 'concrete_002', subjectId: AppConstants.SUBJECT_CONCRETE, name: '水泥', icon: 'cement', articleCount: 0, order: 2 },
  { id: 'concrete_003', subjectId: AppConstants.SUBJECT_CONCRETE, name: '外加剂', icon: 'admixture', articleCount: 0, order: 3 },
  { id: 'concrete_004', subjectId: AppConstants.SUBJECT_CONCRETE, name: '混凝土性能', icon: 'performance', articleCount: 0, order: 4 },
  { id: 'concrete_005', subjectId: AppConstants.SUBJECT_CONCRETE, name: '骨料检测', icon: 'aggregate', articleCount: 0, order: 5 },
  { id: 'concrete_006', subjectId: AppConstants.SUBJECT_CONCRETE, name: '强度检测', icon: 'strength', articleCount: 0, order: 6 },
  { id: 'concrete_007', subjectId: AppConstants.SUBJECT_CONCRETE, name: '耐久性检测', icon: 'durability', articleCount: 0, order: 7 },
  { id: 'concrete_008', subjectId: AppConstants.SUBJECT_CONCRETE, name: '结构检测', icon: 'structure', articleCount: 0, order: 8 }
];

/**
 * 岩土工程（岩石、土工）分类
 */
export const GEOTECHNICAL_ROCK_CATEGORIES: KnowledgeCategory[] = [
  { id: 'geo_rock_001', subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK, name: '岩石物理性质', icon: 'rock_physics', articleCount: 0, order: 1 },
  { id: 'geo_rock_002', subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK, name: '岩石力学性质', icon: 'rock_mechanics', articleCount: 0, order: 2 },
  { id: 'geo_rock_003', subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK, name: '土工试验', icon: 'soil_test', articleCount: 0, order: 3 },
  { id: 'geo_rock_004', subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK, name: '土的物理性质', icon: 'soil_physics', articleCount: 0, order: 4 },
  { id: 'geo_rock_005', subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK, name: '土的力学性质', icon: 'soil_mechanics', articleCount: 0, order: 5 }
];

/**
 * 岩土工程（地基与基础）分类
 */
export const GEOTECHNICAL_FOUNDATION_CATEGORIES: KnowledgeCategory[] = [
  { id: 'geo_found_001', subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION, name: '地基处理', icon: 'foundation_treatment', articleCount: 0, order: 1 },
  { id: 'geo_found_002', subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION, name: '基础检测', icon: 'foundation_test', articleCount: 0, order: 2 },
  { id: 'geo_found_003', subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION, name: '桩基检测', icon: 'pile_test', articleCount: 0, order: 3 },
  { id: 'geo_found_004', subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION, name: '地基承载力', icon: 'bearing_capacity', articleCount: 0, order: 4 },
  { id: 'geo_found_005', subjectId: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION, name: '沉降观测', icon: 'settlement', articleCount: 0, order: 5 }
];

/**
 * 量测分类
 */
export const MEASUREMENT_CATEGORIES: KnowledgeCategory[] = [
  { id: 'measure_001', subjectId: AppConstants.SUBJECT_MEASUREMENT, name: '测量基础', icon: 'measure_basic', articleCount: 0, order: 1 },
  { id: 'measure_002', subjectId: AppConstants.SUBJECT_MEASUREMENT, name: '变形监测', icon: 'deformation', articleCount: 0, order: 2 },
  { id: 'measure_003', subjectId: AppConstants.SUBJECT_MEASUREMENT, name: '竣工测量', icon: 'completion', articleCount: 0, order: 3 },
  { id: 'measure_004', subjectId: AppConstants.SUBJECT_MEASUREMENT, name: '渗流监测', icon: 'seepage', articleCount: 0, order: 4 },
  { id: 'measure_005', subjectId: AppConstants.SUBJECT_MEASUREMENT, name: '仪器设备', icon: 'instrument', articleCount: 0, order: 5 },
  { id: 'measure_006', subjectId: AppConstants.SUBJECT_MEASUREMENT, name: '应力应变监测', icon: 'stress_strain', articleCount: 0, order: 6 }
];

/**
 * 金属结构分类
 */
export const METAL_CATEGORIES: KnowledgeCategory[] = [
  { id: 'metal_001', subjectId: AppConstants.SUBJECT_METAL, name: '焊接检测', icon: 'welding', articleCount: 0, order: 1 },
  { id: 'metal_002', subjectId: AppConstants.SUBJECT_METAL, name: '无损检测', icon: 'ndt', articleCount: 0, order: 2 },
  { id: 'metal_003', subjectId: AppConstants.SUBJECT_METAL, name: '防腐检测', icon: 'anticorrosion', articleCount: 0, order: 3 },
  { id: 'metal_004', subjectId: AppConstants.SUBJECT_METAL, name: '闸门检测', icon: 'gate', articleCount: 0, order: 4 },
  { id: 'metal_005', subjectId: AppConstants.SUBJECT_METAL, name: '启闭机检测', icon: 'hoist', articleCount: 0, order: 5 }
];

/**
 * 机械电气分类
 */
export const MECHANICAL_CATEGORIES: KnowledgeCategory[] = [
  { id: 'mech_001', subjectId: AppConstants.SUBJECT_MECHANICAL, name: '水轮机检测', icon: 'turbine', articleCount: 0, order: 1 },
  { id: 'mech_002', subjectId: AppConstants.SUBJECT_MECHANICAL, name: '发电机检测', icon: 'generator', articleCount: 0, order: 2 },
  { id: 'mech_003', subjectId: AppConstants.SUBJECT_MECHANICAL, name: '电气设备检测', icon: 'electrical', articleCount: 0, order: 3 },
  { id: 'mech_004', subjectId: AppConstants.SUBJECT_MECHANICAL, name: '继电保护', icon: 'relay', articleCount: 0, order: 4 },
  { id: 'mech_005', subjectId: AppConstants.SUBJECT_MECHANICAL, name: '自动化系统', icon: 'automation', articleCount: 0, order: 5 }
];

/**
 * 知识库科目列表
 */
export const KNOWLEDGE_SUBJECTS: KnowledgeSubject[] = [
  {
    id: AppConstants.SUBJECT_BASIC,
    name: '基础知识',
    shortName: '基础',
    icon: 'book',
    color: ThemeColors.SUBJECT_BASIC,
    categories: BASIC_CATEGORIES,
    articleCount: 0
  },
  {
    id: AppConstants.SUBJECT_CONCRETE,
    name: '混凝土工程',
    shortName: '混凝土',
    icon: 'concrete',
    color: ThemeColors.SUBJECT_CONCRETE,
    categories: CONCRETE_CATEGORIES,
    articleCount: 0
  },
  {
    id: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
    name: '岩土工程（岩石、土工）',
    shortName: '岩土',
    icon: 'rock',
    color: ThemeColors.SUBJECT_GEOTECHNICAL_ROCK,
    categories: GEOTECHNICAL_ROCK_CATEGORIES,
    articleCount: 0
  },
  {
    id: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
    name: '岩土工程（地基与基础）',
    shortName: '地基',
    icon: 'foundation',
    color: ThemeColors.SUBJECT_GEOTECHNICAL_FOUNDATION,
    categories: GEOTECHNICAL_FOUNDATION_CATEGORIES,
    articleCount: 0
  },
  {
    id: AppConstants.SUBJECT_MEASUREMENT,
    name: '量测',
    shortName: '量测',
    icon: 'ruler',
    color: ThemeColors.SUBJECT_MEASUREMENT,
    categories: MEASUREMENT_CATEGORIES,
    articleCount: 0
  },
  {
    id: AppConstants.SUBJECT_METAL,
    name: '金属结构',
    shortName: '金属',
    icon: 'metal',
    color: ThemeColors.SUBJECT_METAL,
    categories: METAL_CATEGORIES,
    articleCount: 0
  },
  {
    id: AppConstants.SUBJECT_MECHANICAL,
    name: '机械电气',
    shortName: '机电',
    icon: 'gear',
    color: ThemeColors.SUBJECT_MECHANICAL,
    categories: MECHANICAL_CATEGORIES,
    articleCount: 0
  }
];

/**
 * 获取所有分类
 */
export function getAllCategories(): KnowledgeCategory[] {
  return [
    ...BASIC_CATEGORIES,
    ...CONCRETE_CATEGORIES,
    ...GEOTECHNICAL_ROCK_CATEGORIES,
    ...GEOTECHNICAL_FOUNDATION_CATEGORIES,
    ...MEASUREMENT_CATEGORIES,
    ...METAL_CATEGORIES,
    ...MECHANICAL_CATEGORIES
  ];
}

/**
 * 根据科目ID获取分类列表
 */
export function getCategoriesBySubject(subjectId: string): KnowledgeCategory[] {
  const subject = KNOWLEDGE_SUBJECTS.find((s: KnowledgeSubject) => s.id === subjectId);
  return subject ? subject.categories : [];
}

/**
 * 根据分类ID获取分类信息
 */
export function getCategoryById(categoryId: string): KnowledgeCategory | undefined {
  return getAllCategories().find((c: KnowledgeCategory) => c.id === categoryId);
}

/**
 * 根据科目ID获取科目信息
 */
export function getKnowledgeSubjectById(subjectId: string): KnowledgeSubject | undefined {
  return KNOWLEDGE_SUBJECTS.find((s: KnowledgeSubject) => s.id === subjectId);
}
