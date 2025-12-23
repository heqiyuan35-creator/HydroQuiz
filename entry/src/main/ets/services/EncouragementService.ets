/**
 * 鼓励语服务
 * HydroQuiz - 水利工程检测员刷题宝
 */
import {
  CORRECT_ENCOURAGEMENTS,
  COMBO_ENCOURAGEMENTS,
  WRONG_ENCOURAGEMENTS,
  GOAL_COMPLETE_ENCOURAGEMENTS,
  CHECK_IN_ENCOURAGEMENTS,
  EXAM_ENCOURAGEMENTS,
  STREAK_ENCOURAGEMENTS,
  LEVEL_COMPLETE_ENCOURAGEMENTS
} from '../data/EncouragementData';

/**
 * 鼓励语服务类
 */
class EncouragementService {
  /**
   * 从数组中随机获取一条
   */
  private getRandomFromArray(arr: string[]): string {
    if (arr.length === 0) return '';
    const index = Math.floor(Math.random() * arr.length);
    return arr[index];
  }

  /**
   * 获取答对鼓励语
   */
  getCorrectEncouragement(streak: number = 0): string {
    // 检查是否有连击
    if (streak > 0) {
      const comboKeys = [20, 10, 5, 3];
      for (const key of comboKeys) {
        if (streak >= key && streak % key === 0) {
          const comboMessages = COMBO_ENCOURAGEMENTS.get(key);
          if (comboMessages && comboMessages.length > 0) {
            return this.getRandomFromArray(comboMessages);
          }
        }
      }
    }

    return this.getRandomFromArray(CORRECT_ENCOURAGEMENTS);
  }

  /**
   * 获取连击鼓励语
   */
  getComboEncouragement(comboCount: number): string {
    const thresholds = [20, 10, 5, 3];
    for (const threshold of thresholds) {
      if (comboCount >= threshold) {
        const messages = COMBO_ENCOURAGEMENTS.get(threshold);
        if (messages && messages.length > 0) {
          return this.getRandomFromArray(messages);
        }
      }
    }
    return '';
  }

  /**
   * 获取答错鼓励语
   */
  getWrongEncouragement(): string {
    return this.getRandomFromArray(WRONG_ENCOURAGEMENTS);
  }

  /**
   * 获取完成目标鼓励语
   */
  getGoalCompleteEncouragement(): string {
    return this.getRandomFromArray(GOAL_COMPLETE_ENCOURAGEMENTS);
  }

  /**
   * 获取打卡鼓励语
   */
  getCheckInEncouragement(days: number): string {
    const thresholds = [30, 7, 3, 1];
    for (const threshold of thresholds) {
      if (days >= threshold) {
        const messages = CHECK_IN_ENCOURAGEMENTS.get(threshold);
        if (messages && messages.length > 0) {
          return this.getRandomFromArray(messages);
        }
      }
    }
    return '签到成功！';
  }

  /**
   * 获取考试鼓励语
   */
  getExamEncouragement(score: number, isPassed: boolean): string {
    let key: string;
    if (score >= 100) {
      key = 'perfect';
    } else if (score >= 90) {
      key = 'excellent';
    } else if (isPassed) {
      key = 'pass';
    } else {
      key = 'fail';
    }

    const messages = EXAM_ENCOURAGEMENTS.get(key);
    if (messages && messages.length > 0) {
      return this.getRandomFromArray(messages);
    }
    return isPassed ? '恭喜通过！' : '继续加油！';
  }

  /**
   * 获取连续学习鼓励语
   */
  getStreakEncouragement(days: number): string {
    const thresholds = [100, 60, 30, 14, 7, 3];
    for (const threshold of thresholds) {
      if (days >= threshold) {
        const messages = STREAK_ENCOURAGEMENTS.get(threshold);
        if (messages && messages.length > 0) {
          return this.getRandomFromArray(messages);
        }
      }
    }
    return '';
  }

  /**
   * 获取闯关成功鼓励语
   */
  getLevelCompleteEncouragement(stars: number): string {
    const messages = LEVEL_COMPLETE_ENCOURAGEMENTS.get(stars);
    if (messages && messages.length > 0) {
      return this.getRandomFromArray(messages);
    }
    return '通关成功！';
  }

  /**
   * 获取通用鼓励语（用于各种场景）
   */
  getGeneralEncouragement(): string {
    const generalMessages = [
      '加油！你是最棒的！',
      '坚持就是胜利！',
      '相信自己，你可以的！',
      '每一步都是进步！',
      '努力终将有回报！'
    ];
    return this.getRandomFromArray(generalMessages);
  }
}

export const encouragementService = new EncouragementService();
