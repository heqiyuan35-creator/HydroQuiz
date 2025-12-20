/**
 * 科目数据定义
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { SubjectInfo } from '../common/types/QuestionTypes';
import { ThemeColors } from '../theme/ThemeColors';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 科目列表数据
 */
export const SUBJECT_LIST: SubjectInfo[] = [
  {
    id: AppConstants.SUBJECT_BASIC,
    name: '基础知识',
    shortName: '基础',
    icon: 'book',
    color: ThemeColors.SUBJECT_BASIC,
    questionCount: 0,
    description: '水利检测基础理论知识'
  },
  {
    id: AppConstants.SUBJECT_CONCRETE,
    name: '混凝土工程',
    shortName: '混凝土',
    icon: 'concrete',
    color: ThemeColors.SUBJECT_CONCRETE,
    questionCount: 0,
    description: '混凝土工程检测技术'
  },
  {
    id: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
    name: '岩土工程（岩石、土工）',
    shortName: '岩土',
    icon: 'rock',
    color: ThemeColors.SUBJECT_GEOTECHNICAL_ROCK,
    questionCount: 0,
    description: '岩石与土工检测技术'
  },
  {
    id: AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION,
    name: '岩土工程（地基与基础）',
    shortName: '地基',
    icon: 'foundation',
    color: ThemeColors.SUBJECT_GEOTECHNICAL_FOUNDATION,
    questionCount: 0,
    description: '地基与基础检测技术'
  },
  {
    id: AppConstants.SUBJECT_MEASUREMENT,
    name: '量测',
    shortName: '量测',
    icon: 'ruler',
    color: ThemeColors.SUBJECT_MEASUREMENT,
    questionCount: 0,
    description: '工程量测技术'
  },
  {
    id: AppConstants.SUBJECT_METAL,
    name: '金属结构',
    shortName: '金属',
    icon: 'metal',
    color: ThemeColors.SUBJECT_METAL,
    questionCount: 0,
    description: '金属结构检测技术'
  },
  {
    id: AppConstants.SUBJECT_MECHANICAL,
    name: '机械电气',
    shortName: '机电',
    icon: 'gear',
    color: ThemeColors.SUBJECT_MECHANICAL,
    questionCount: 0,
    description: '机械电气检测技术'
  }
];

/**
 * 根据科目ID获取科目信息
 */
export function getSubjectById(subjectId: string): SubjectInfo | undefined {
  return SUBJECT_LIST.find((subject: SubjectInfo) => subject.id === subjectId);
}

/**
 * 根据科目ID获取科目名称
 */
export function getSubjectName(subjectId: string): string {
  const subject = getSubjectById(subjectId);
  return subject ? subject.name : '未知科目';
}

/**
 * 根据科目ID获取科目短名称（用于标签显示）
 */
export function getSubjectShortName(subjectId: string): string {
  if (!subjectId) {
    return '未知';
  }
  const subject = getSubjectById(subjectId);
  return subject ? subject.shortName : '未知';
}

/**
 * 根据科目ID获取科目颜色
 */
export function getSubjectColor(subjectId: string): string {
  if (!subjectId) {
    return '#1677FF'; // 默认蓝色
  }
  const subject = getSubjectById(subjectId);
  return subject ? subject.color : '#1677FF';
}
