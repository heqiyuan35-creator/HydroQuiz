/**
 * 成就通知服务
 * 用于在成就解锁时通知UI显示弹窗
 */
import { Achievement } from './AchievementService';

// 成就解锁回调类型
export type AchievementUnlockCallback = (achievement: Achievement) => void;

class AchievementNotificationService {
  private callbacks: AchievementUnlockCallback[] = [];

  /**
   * 注册成就解锁回调
   */
  register(callback: AchievementUnlockCallback): void {
    this.callbacks.push(callback);
  }

  /**
   * 取消注册回调
   */
  unregister(callback: AchievementUnlockCallback): void {
    const index = this.callbacks.indexOf(callback);
    if (index > -1) {
      this.callbacks.splice(index, 1);
    }
  }

  /**
   * 通知所有监听者有新成就解锁
   */
  notify(achievement: Achievement): void {
    for (const callback of this.callbacks) {
      try {
        callback(achievement);
      } catch (e) {
        // 忽略回调错误
      }
    }
  }

  /**
   * 清除所有回调
   */
  clear(): void {
    this.callbacks = [];
  }
}

export const achievementNotificationService = new AchievementNotificationService();
