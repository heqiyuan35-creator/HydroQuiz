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
  targetId: string;              // 目标组件ID（用于高亮框选）
  title: string;                 // 功能标题
  description: string;           // 功能描述
  cardPosition: CardPosition;    // 说明卡片位置
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
 * 区域矩形接口
 */
export interface AreaRect {
  x: number;
  y: number;
  width: number;
  height: number;
}

/**
 * 导引步骤配置
 * 首页功能详细介绍 + 底部Tab导航
 */
export const GUIDE_STEPS: GuideStep[] = [
  // 欢迎步骤（无高亮）
  {
    id: 'welcome',
    targetId: '',
    title: '欢迎使用水利刷题宝！ 👋',
    description: '恭喜你完成了水平测试！接下来让我带你快速了解应用的主要功能，助你高效备考。',
    cardPosition: 'center',
    tabIndex: 0
  },
  // 首页 - 用户信息区
  {
    id: 'user-header',
    targetId: 'guide-user-header',
    title: '个人信息',
    description: '这里显示你的头像和昵称，点击右侧设置图标可以修改个人信息和学习计划。',
    cardPosition: 'bottom',
    tabIndex: 0
  },
  // 首页 - 学习统计
  {
    id: 'daily-stats',
    targetId: 'guide-daily-stats',
    title: '今日学习统计',
    description: '实时显示今日掌握度、连续打卡天数和刷题数量，点击可查看详情。',
    cardPosition: 'bottom',
    tabIndex: 0
  },
  // 首页 - 每日一练
  {
    id: 'daily-practice',
    targetId: 'guide-daily-practice',
    title: '每日一练',
    description: '每天完成设定的题目数量即可打卡，坚持打卡养成学习习惯！',
    cardPosition: 'bottom',
    tabIndex: 0
  },
  // 首页 - 强化训练
  {
    id: 'intensive',
    targetId: 'guide-intensive',
    title: '强化训练',
    description: '100道综合随机题目，全面检验学习成果，适合考前冲刺。',
    cardPosition: 'bottom',
    tabIndex: 0
  },
  // 题库Tab
  {
    id: 'tab-bank',
    targetId: 'guide-tab-bank',
    title: '题库',
    description: '按科目分类浏览所有题目，支持顺序练习、错题本和收藏夹功能。',
    cardPosition: 'top',
    tabIndex: 1
  },
  // 知识库Tab
  {
    id: 'tab-knowledge',
    targetId: 'guide-tab-knowledge',
    title: '知识库',
    description: '丰富的水利工程知识文章，帮助你理解考点、巩固记忆。',
    cardPosition: 'top',
    tabIndex: 2
  },
  // 我的Tab
  {
    id: 'tab-profile',
    targetId: 'guide-tab-profile',
    title: '我的',
    description: '查看学习统计、成就徽章，还可以在设置中调整学习计划。',
    cardPosition: 'top',
    tabIndex: 3
  }
];
