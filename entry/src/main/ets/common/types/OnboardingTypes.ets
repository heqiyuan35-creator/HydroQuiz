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
 * 8个步骤：欢迎 + 首页功能介绍 + Tab导航介绍
 */
export const GUIDE_STEPS: GuideStep[] = [
  {
    id: 'welcome',
    title: '欢迎使用水利刷题宝！ 👋',
    description: '恭喜你完成了水平测试！接下来让我带你快速了解应用的主要功能，助你高效备考。',
    tabIndex: 0
  },
  {
    id: 'user-header',
    title: '个人信息',
    description: '这里显示你的头像和昵称，点击右上角设置图标可以修改个人信息和学习计划。',
    tabIndex: 0
  },
  {
    id: 'daily-stats',
    title: '今日学习统计',
    description: '实时显示今日掌握度、连续打卡天数和刷题数量，点击可查看详情。',
    tabIndex: 0
  },
  {
    id: 'daily-practice',
    title: '每日一练',
    description: '每天完成设定的题目数量即可打卡，坚持打卡养成学习习惯！向下滑动可以看到更多练习模式。',
    tabIndex: 0
  },
  {
    id: 'intensive',
    title: '更多练习模式',
    description: '除了每日一练，还有强化训练、专项练习、模拟考试等多种模式，满足不同学习需求。',
    tabIndex: 0
  },
  {
    id: 'tab-bank',
    title: '题库',
    description: '按科目分类浏览所有题目，支持顺序练习。还可以查看错题本和收藏夹。',
    tabIndex: 1
  },
  {
    id: 'tab-knowledge',
    title: '知识库',
    description: '丰富的水利工程知识文章，帮助你理解考点、巩固记忆。',
    tabIndex: 2
  },
  {
    id: 'tab-profile',
    title: '我的',
    description: '查看学习统计、成就徽章，还可以在设置中调整每日目标和学习计划。',
    tabIndex: 3
  }
];
