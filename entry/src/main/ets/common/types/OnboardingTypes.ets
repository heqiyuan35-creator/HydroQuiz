/**
 * 新手导引类型定义
 * HydroQuiz - 水利工程检测员刷题宝
 */

/**
 * 说明卡片位置类型
 */
export type CardPosition = 'top' | 'bottom' | 'auto';

/**
 * 导引步骤接口
 */
export interface GuideStep {
  id: string;                    // 步骤唯一标识
  targetId: string;              // 目标区域ID
  title: string;                 // 功能标题
  description: string;           // 功能描述
  position: CardPosition;        // 说明卡片位置
}

/**
 * 导引状态接口
 */
export interface OnboardingState {
  isActive: boolean;             // 导引是否激活
  currentStepIndex: number;      // 当前步骤索引
  hasCompleted: boolean;         // 是否已完成导引
}

/**
 * 区域矩形接口
 */
export interface AreaRect {
  x: number;                     // 区域左上角X坐标
  y: number;                     // 区域左上角Y坐标
  width: number;                 // 区域宽度
  height: number;                // 区域高度
}

/**
 * 导引步骤配置
 * 包含10个导引步骤：6个首页功能 + 4个Tab导航
 */
export const GUIDE_STEPS: GuideStep[] = [
  {
    id: 'header',
    targetId: 'home-header',
    title: '个人中心',
    description: '这里显示你的头像和问候语，点击设置图标可以进入设置页面',
    position: 'bottom'
  },
  {
    id: 'progress',
    targetId: 'learning-progress',
    title: '学习进度',
    description: '查看今日学习情况和打卡状态，完成每日目标即可打卡',
    position: 'bottom'
  },
  {
    id: 'practice',
    targetId: 'practice-entry',
    title: '顺序刷题',
    description: '按科目顺序练习题目，系统会记录你的进度',
    position: 'auto'
  },
  {
    id: 'exam',
    targetId: 'exam-entry',
    title: '模拟考试',
    description: '模拟真实考试环境，检验学习成果',
    position: 'auto'
  },
  {
    id: 'wrong',
    targetId: 'wrong-entry',
    title: '错题本',
    description: '自动收集做错的题目，方便针对性复习',
    position: 'auto'
  },
  {
    id: 'favorite',
    targetId: 'favorite-entry',
    title: '收藏夹',
    description: '收藏重要题目，随时查看复习',
    position: 'auto'
  },
  {
    id: 'tab-home',
    targetId: 'tab-home',
    title: '首页',
    description: '返回首页查看学习概览和快捷入口',
    position: 'top'
  },
  {
    id: 'tab-bank',
    targetId: 'tab-bank',
    title: '题库',
    description: '按科目分类浏览所有题目',
    position: 'top'
  },
  {
    id: 'tab-knowledge',
    targetId: 'tab-knowledge',
    title: '知识库',
    description: '查看水利工程相关知识文章',
    position: 'top'
  },
  {
    id: 'tab-profile',
    targetId: 'tab-profile',
    title: '我的',
    description: '查看个人信息、学习统计和成就',
    position: 'top'
  }
];
