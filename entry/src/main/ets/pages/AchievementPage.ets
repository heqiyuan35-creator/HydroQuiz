/**
 * 成就系统页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import { achievementService, Achievement, ACHIEVEMENT_CATEGORIES } from '../services/AchievementService';
import { Logger } from '../common/utils/Logger';

@Entry
@Component
struct AchievementPage {
  @State isLoading: boolean = true;
  @State achievements: Achievement[] = [];
  @State selectedCategory: string = '全部';
  @State totalCount: number = 0;
  @State unlockedCount: number = 0;
  @State showUnlockDialog: boolean = false;
  @State unlockedAchievement: Achievement | null = null;

  aboutToAppear(): void {
    this.loadData();
  }

  onPageShow(): void {
    this.checkNewAchievements();
  }

  private async loadData(): Promise<void> {
    try {
      this.achievements = await achievementService.getAllAchievements();
      const stats = await achievementService.getStats();
      this.totalCount = stats.total;
      this.unlockedCount = stats.unlocked;
    } catch (error) {
      Logger.error('[AchievementPage] Failed to load data', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  private async checkNewAchievements(): Promise<void> {
    try {
      const newlyUnlocked = await achievementService.checkAndUnlock();
      if (newlyUnlocked.length > 0) {
        // 显示第一个新解锁的成就
        this.unlockedAchievement = newlyUnlocked[0];
        this.showUnlockDialog = true;
        // 刷新数据
        await this.loadData();
      }
    } catch (error) {
      Logger.error('[AchievementPage] Failed to check achievements', error as Error);
    }
  }

  private getFilteredAchievements(): Achievement[] {
    if (this.selectedCategory === '全部') return this.achievements;
    return this.achievements.filter(a => a.category === this.selectedCategory);
  }

  private getProgressPercent(): number {
    if (this.totalCount === 0) return 0;
    return Math.round(this.unlockedCount / this.totalCount * 100);
  }

  build() {
    Stack() {
      Column() {
        this.NavigationBar()

        if (this.isLoading) {
          this.LoadingState()
        } else {
          Scroll() {
            Column() {
              this.ProgressCard()
              this.CategoryTabs()
              this.AchievementGrid()
            }
            .width('100%')
            .padding({ left: 16, right: 16, bottom: 24 })
          }
          .scrollBar(BarState.Off)
          .layoutWeight(1)
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor(ThemeColors.BACKGROUND)
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT })

      // 成就解锁弹框
      if (this.showUnlockDialog && this.unlockedAchievement) {
        this.UnlockDialog()
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  NavigationBar() {
    Row() {
      Row() {
        Image($r('app.media.back')).width(24).height(24)
      }
      .width(48).height(48).justifyContent(FlexAlign.Center)
      .onClick(() => { Router.back(); })

      Text('我的成就')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Row().width(48).height(48)
    }
    .width('100%')
    .height(56)
    .backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  LoadingState() {
    Column() {
      LoadingProgress().width(48).height(48).color(ThemeColors.PRIMARY)
    }
    .width('100%').layoutWeight(1).justifyContent(FlexAlign.Center)
  }

  @Builder
  ProgressCard() {
    Column() {
      Row() {
        Column() {
          Text('成就进度')
            .fontSize(14).fontColor('rgba(255,255,255,0.8)')
          Row() {
            Text(`${this.unlockedCount}`)
              .fontSize(36).fontWeight(FontWeight.Bold).fontColor(ThemeColors.WHITE)
            Text(` / ${this.totalCount}`)
              .fontSize(18).fontColor('rgba(255,255,255,0.7)')
          }
          .margin({ top: 4 })
        }
        .alignItems(HorizontalAlign.Start)

        Stack() {
          Progress({ value: this.getProgressPercent(), total: 100, type: ProgressType.Ring })
            .width(70).height(70)
            .color(ThemeColors.WHITE)
            .backgroundColor('rgba(255,255,255,0.3)')
            .style({ strokeWidth: 8 })
          Text(`${this.getProgressPercent()}%`)
            .fontSize(14).fontWeight(FontWeight.Bold).fontColor(ThemeColors.WHITE)
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .padding(20)
    .margin({ top: 16 })
    .linearGradient({
      angle: 135,
      colors: [['#667eea', 0], ['#764ba2', 1]]
    })
    .borderRadius(16)
  }

  @Builder
  CategoryTabs() {
    Scroll() {
      Row({ space: 10 }) {
        this.CategoryTab('全部')
        ForEach(ACHIEVEMENT_CATEGORIES, (cat: string) => {
          this.CategoryTab(cat)
        }, (cat: string) => cat)
      }
      .padding({ top: 16, bottom: 8 })
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .width('100%')
  }

  @Builder
  CategoryTab(category: string) {
    Text(category)
      .fontSize(14)
      .fontColor(this.selectedCategory === category ? ThemeColors.WHITE : ThemeColors.TEXT_SECONDARY)
      .padding({ left: 16, right: 16, top: 8, bottom: 8 })
      .backgroundColor(this.selectedCategory === category ? ThemeColors.PRIMARY : ThemeColors.SURFACE)
      .borderRadius(20)
      .onClick(() => { this.selectedCategory = category; })
  }

  @Builder
  AchievementGrid() {
    Column() {
      ForEach(this.getFilteredAchievements(), (achievement: Achievement) => {
        this.AchievementItem(achievement)
      }, (achievement: Achievement) => achievement.id)
    }
    .width('100%')
    .margin({ top: 8 })
  }

  @Builder
  AchievementItem(achievement: Achievement) {
    Row() {
      // 图标
      Column() {
        Text(achievement.icon)
          .fontSize(32)
      }
      .width(60).height(60)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(achievement.isUnlocked ? '#FFF7E6' : '#F5F5F5')
      .borderRadius(12)
      .opacity(achievement.isUnlocked ? 1 : 0.5)

      // 信息
      Column() {
        Row({ space: 8 }) {
          Text(achievement.name)
            .fontSize(15).fontWeight(FontWeight.Medium)
            .fontColor(achievement.isUnlocked ? ThemeColors.TEXT_PRIMARY : ThemeColors.TEXT_HINT)
          if (achievement.isUnlocked) {
            Text('已解锁')
              .fontSize(10).fontColor(ThemeColors.SUCCESS)
              .padding({ left: 6, right: 6, top: 2, bottom: 2 })
              .backgroundColor('#E6F7E6')
              .borderRadius(8)
          }
        }

        Text(achievement.description)
          .fontSize(13)
          .fontColor(achievement.isUnlocked ? ThemeColors.TEXT_SECONDARY : ThemeColors.TEXT_HINT)
          .margin({ top: 4 })

        // 进度条
        if (!achievement.isUnlocked) {
          Row() {
            Progress({ value: achievement.progress, total: achievement.targetValue })
              .width(120).height(6)
              .color(ThemeColors.PRIMARY)
              .backgroundColor('#E8E8E8')
              .style({ strokeWidth: 6 })
            Text(`${achievement.progress}/${achievement.targetValue}`)
              .fontSize(11).fontColor(ThemeColors.TEXT_HINT).margin({ left: 8 })
          }
          .margin({ top: 6 })
        } else if (achievement.unlockTime > 0) {
          Text(this.formatUnlockTime(achievement.unlockTime))
            .fontSize(11).fontColor(ThemeColors.TEXT_HINT).margin({ top: 6 })
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ left: 14 })
    }
    .width('100%')
    .padding(14)
    .margin({ bottom: 10 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
    .opacity(achievement.isUnlocked ? 1 : 0.8)
  }

  @Builder
  UnlockDialog() {
    Column() {
      // 遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.5)')
        .onClick(() => { this.showUnlockDialog = false; })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)

    // 弹框内容
    Column() {
      // 光效背景
      Column() {
        Text('🎉')
          .fontSize(48)
          .margin({ bottom: 8 })
        Text('成就解锁!')
          .fontSize(20).fontWeight(FontWeight.Bold).fontColor('#FFD700')
      }
      .width('100%')
      .padding({ top: 30, bottom: 20 })
      .linearGradient({
        angle: 180,
        colors: [['#667eea', 0], ['#764ba2', 1]]
      })
      .borderRadius({ topLeft: 20, topRight: 20 })

      // 成就信息
      Column() {
        Text(this.unlockedAchievement?.icon || '')
          .fontSize(56)
          .margin({ top: 20 })
        Text(this.unlockedAchievement?.name || '')
          .fontSize(22).fontWeight(FontWeight.Bold).fontColor(ThemeColors.TEXT_PRIMARY)
          .margin({ top: 12 })
        Text(this.unlockedAchievement?.description || '')
          .fontSize(14).fontColor(ThemeColors.TEXT_SECONDARY)
          .margin({ top: 8 })

        Button('太棒了!')
          .fontSize(16).fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.PRIMARY)
          .borderRadius(24).height(48).width('80%')
          .margin({ top: 30, bottom: 24 })
          .onClick(() => { this.showUnlockDialog = false; })
      }
      .width('100%')
      .backgroundColor(ThemeColors.WHITE)
      .borderRadius({ bottomLeft: 20, bottomRight: 20 })
    }
    .width('85%')
    .position({ x: '7.5%', y: '25%' })
    .shadow({ radius: 20, color: 'rgba(0,0,0,0.3)', offsetY: 10 })
  }

  private formatUnlockTime(timestamp: number): string {
    const date = new Date(timestamp);
    const month = date.getMonth() + 1;
    const day = date.getDate();
    return `${month}月${day}日解锁`;
  }
}
