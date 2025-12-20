/**
 * 新手导引类型定义
 * HydroQuiz - 水利工程检测员刷题宝
 */

/**
 * 说明卡片位置类型
 */
export type CardPosition = 'top' | 'bottom' | 'center';

/**
 * 导引步骤接口
 */
export interface GuideStep {
  id: string;                    // 步骤唯一标识
  title: string;                 // 功能标题
  description: string;           // 功能描述
  position: CardPosition;        // 说明卡片位置
  tabIndex?: number;             // 需要切换到的Tab索引（可选）
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
 * 导引步骤配置
 * 简化为5个步骤：欢迎 + 4个Tab介绍
 */
export const GUIDE_STEPS: GuideStep[] = [
  {
    id: 'welcome',
    title: '欢迎使用水利刷题宝！',
    description: '恭喜你完成了水平测试！接下来让我带你快速了解应用的主要功能。',
    position: 'center'
  },
  {
    id: 'tab-home',
    title: '首页',
    description: '这里是你的学习主阵地，可以查看学习进度、每日打卡，还有各种练习入口。向下滑动可以看到更多功能哦！',
    position: 'top',
    tabIndex: 0
  },
  {
    id: 'tab-bank',
    title: '题库',
    description: '按科目分类浏览所有题目，支持顺序练习和随机练习，还能查看错题本和收藏夹。',
    position: 'top',
    tabIndex: 1
  },
  {
    id: 'tab-knowledge',
    title: '知识库',
    description: '这里有丰富的水利工程知识文章，帮助你理解考点、巩固记忆。',
    position: 'top',
    tabIndex: 2
  },
  {
    id: 'tab-profile',
    title: '我的',
    description: '查看个人信息、学习统计、成就徽章，还可以在设置中调整学习计划。',
    position: 'top',
    tabIndex: 3
  }
];
