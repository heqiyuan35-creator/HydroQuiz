/**
 * 应用入口Ability
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { AbilityConstant, ConfigurationConstant, UIAbility, Want, abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { databaseService } from '../data/database/DatabaseService';
import { initMockQuestions } from '../data/MockQuestionData';
import { userService } from '../services/UserService';
import { answerRecordService } from '../services/AnswerRecordService';
import { widgetDataService } from '../services/WidgetDataService';
import { initializationState } from '../common/utils/InitializationState';
import { achievementService } from '../services/AchievementService';

const DOMAIN: number = 0x0000;
const TAG: string = 'HydroQuiz';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'Ability onCreate');

    // 设置颜色模式跟随系统
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      hilog.error(DOMAIN, TAG, 'Failed to set colorMode: %{public}s', JSON.stringify(err));
    }

    // 初始化数据库
    this.initDatabase();
  }

  /**
   * 初始化数据库
   */
  private async initDatabase(): Promise<void> {
    try {
      await databaseService.initialize(this.context);
      hilog.info(DOMAIN, TAG, 'Database initialized successfully');

      // 初始化模拟题库数据（强制重新初始化以更新题库）
      await initMockQuestions(true);
      hilog.info(DOMAIN, TAG, 'Mock questions initialized');

      // 初始化用户服务
      await userService.init(this.context);
      hilog.info(DOMAIN, TAG, 'User service initialized');

      // 清理超过一个月的错题数据
      await answerRecordService.cleanOldWrongQuestions();
      hilog.info(DOMAIN, TAG, 'Old wrong questions cleaned');


      // 初始化卡片数据服务
      widgetDataService.init(this.context);
      hilog.info(DOMAIN, TAG, 'Widget data service initialized');

      // 初始化成就服务
      await achievementService.init(this.context);
      hilog.info(DOMAIN, TAG, 'Achievement service initialized');

      // 同步当前数据到卡片 Preferences
      await this.syncWidgetData();
      hilog.info(DOMAIN, TAG, 'Widget data synced');

      // 标记初始化完成
      initializationState.markInitialized();
      hilog.info(DOMAIN, TAG, 'Initialization completed');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'Failed to initialize database: %{public}s', JSON.stringify(error));
      // 即使出错也标记完成，避免启动页卡住
      initializationState.markInitialized();
    }
  }

  /**
   * 同步数据到卡片
   */
  private async syncWidgetData(): Promise<void> {
    try {
      // 获取今日统计
      const todayStats = await answerRecordService.getTodayStatistics();
      // 获取每日目标
      const dailyTarget = await userService.getDailyGoal();
      // 获取打卡状态
      const isCheckedIn = await userService.hasCheckedInToday();

      // 同步到卡片 Preferences
      await widgetDataService.initSync(
        todayStats.total,
        todayStats.correct,
        todayStats.total - todayStats.correct,
        dailyTarget,
        isCheckedIn
      );
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'Failed to sync widget data: %{public}s', JSON.stringify(error));
    }
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, 'Ability onWindowStageCreate');

    // 获取主窗口并设置竖屏
    windowStage.getMainWindow((err, windowClass) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to get main window: %{public}s', JSON.stringify(err));
        return;
      }

      // 设置竖屏显示
      windowClass.setPreferredOrientation(window.Orientation.PORTRAIT, (err) => {
        if (err.code) {
          hilog.error(DOMAIN, TAG, 'Failed to set orientation: %{public}s', JSON.stringify(err));
          return;
        }
        hilog.info(DOMAIN, TAG, 'Set orientation to PORTRAIT');
      });

      // 设置全屏显示
      windowClass.setWindowLayoutFullScreen(true, (err) => {
        if (err.code) {
          hilog.error(DOMAIN, TAG, 'Failed to set full screen: %{public}s', JSON.stringify(err));
          return;
        }
        hilog.info(DOMAIN, TAG, 'Set full screen mode');
      });
    });

    // 加载启动页
    windowStage.loadContent('pages/SplashPage', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load content: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading SplashPage');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'Ability onForeground');
  }

  /**
   * 请求麦克风权限
   */
  async requestMicrophonePermission(): Promise<boolean> {
    const permissions: Permissions[] = ['ohos.permission.MICROPHONE'];
    const atManager = abilityAccessCtrl.createAtManager();

    try {
      const result = await atManager.requestPermissionsFromUser(this.context, permissions);
      const grantStatus = result.authResults[0];
      if (grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
        hilog.info(DOMAIN, TAG, 'Microphone permission granted');
        return true;
      } else {
        hilog.warn(DOMAIN, TAG, 'Microphone permission denied');
        return false;
      }
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'Request permission error: %{public}s', JSON.stringify(error));
      return false;
    }
  }

  /**
   * 检查麦克风权限
   */
  checkMicrophonePermission(): boolean {
    const atManager = abilityAccessCtrl.createAtManager();
    try {
      const tokenId = this.context.applicationInfo.accessTokenId;
      const grantStatus = atManager.checkAccessTokenSync(tokenId, 'ohos.permission.MICROPHONE');
      return grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'Check permission error: %{public}s', JSON.stringify(error));
      return false;
    }
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'Ability onBackground');
  }
}
