/**
 * 闯关模式主页
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router } from '../router/Router';
import { gameService, GameStats } from '../services/GameService';
import { GameChapter, GameLevel, getDifficultyConfig } from '../common/types/GameTypes';
import { ThemeColors } from '../theme/ThemeColors';
import { AppConstants } from '../common/constants/AppConstants';

// 入场动画常量
const LEVEL_ENTRY_DELAY: number = 50;
const LEVEL_ENTRY_DURATION: number = 300;

@Entry
@Component
struct GameModePage {
  @State chapters: GameChapter[] = [];
  @State selectedChapter: GameChapter | null = null;
  @State gameStats: GameStats | null = null;
  @State isLoading: boolean = true;
  // 入场动画状态
  @State showLevelList: boolean = false;
  @State levelScales: number[] = [];
  @State levelOpacities: number[] = [];

  aboutToAppear(): void {
    this.loadData();
  }

  async loadData(): Promise<void> {
    this.isLoading = true;
    try {
      this.chapters = await gameService.getAllChapters();
      this.gameStats = await gameService.getGameStats();
      if (this.chapters.length > 0) {
        this.selectedChapter = this.chapters[0];
        this.initLevelAnimationStates();
      }
    } catch (error) {
      console.error('Load game data failed:', error);
    }
    this.isLoading = false;
    // 触发入场动画
    setTimeout(() => {
      this.playLevelEntryAnimation();
    }, 100);
  }

  /**
   * 初始化关卡动画状态
   */
  private initLevelAnimationStates(): void {
    if (this.selectedChapter) {
      const count = this.selectedChapter.levels.length;
      this.levelScales = new Array(count).fill(0.5);
      this.levelOpacities = new Array(count).fill(0);
    }
  }

  /**
   * 播放关卡入场动画
   */
  private playLevelEntryAnimation(): void {
    this.showLevelList = true;
    if (!this.selectedChapter) return;

    this.selectedChapter.levels.forEach((level: GameLevel, index: number) => {
      setTimeout(() => {
        animateTo({
          duration: LEVEL_ENTRY_DURATION,
          curve: Curve.EaseOut
        }, () => {
          this.levelScales[index] = 1;
          this.levelOpacities[index] = 1;
        });
      }, index * LEVEL_ENTRY_DELAY);
    });
  }

  @Builder
  buildHeader() {
    Row() {
      Image($r('app.media.back'))
        .width(24)
        .height(24)
        .fillColor(Color.White)
        .onClick(() => Router.back())

      Text('答题闯关')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .fontColor(Color.White)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Row().width(24)
    }
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
  }

  @Builder
  buildStatsCard() {
    Row() {
      Column() {
        Row() {
          Text('⭐')
            .fontSize(20)
          Text(`${this.gameStats?.totalStars || 0}`)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
            .margin({ left: 4 })
          Text(`/${this.gameStats?.maxStars || 0}`)
            .fontSize(14)
            .fontColor('rgba(255,255,255,0.7)')
        }
        Text('总星星数')
          .fontSize(12)
          .fontColor('rgba(255,255,255,0.8)')
          .margin({ top: 4 })
      }
      .layoutWeight(1)

      Divider()
        .vertical(true)
        .height(40)
        .color('rgba(255,255,255,0.3)')

      Column() {
        Text(`${this.gameStats?.completedLevels || 0}/${this.gameStats?.totalLevels || 0}`)
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        Text('已通关')
          .fontSize(12)
          .fontColor('rgba(255,255,255,0.8)')
          .margin({ top: 4 })
      }
      .layoutWeight(1)

      Divider()
        .vertical(true)
        .height(40)
        .color('rgba(255,255,255,0.3)')

      Column() {
        Text(`${Math.round(this.gameStats?.progress || 0)}%`)
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        Text('完成度')
          .fontSize(12)
          .fontColor('rgba(255,255,255,0.8)')
          .margin({ top: 4 })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .padding(16)
    .margin({ top: 12 })
  }

  @Builder
  buildChapterTabs() {
    Scroll() {
      Row() {
        ForEach(this.chapters, (chapter: GameChapter) => {
          Column() {
            // 图标带白色圆形背景
            Column() {
              Image(this.getChapterIcon(chapter.subjectId))
                .width(24)
                .height(24)
                .objectFit(ImageFit.Contain)
            }
            .width(40)
            .height(40)
            .borderRadius(20)
            .backgroundColor(this.selectedChapter?.id === chapter.id ? 'rgba(255,255,255,0.95)' : 'rgba(255,255,255,0.3)')
            .justifyContent(FlexAlign.Center)

            Text(chapter.shortName)
              .fontSize(12)
              .fontColor(this.selectedChapter?.id === chapter.id ? Color.White : 'rgba(255,255,255,0.7)')
              .margin({ top: 6 })

            if (this.selectedChapter?.id === chapter.id) {
              Row()
                .width(20)
                .height(3)
                .backgroundColor(Color.White)
                .borderRadius(2)
                .margin({ top: 4 })
            }
          }
          .padding({ left: 10, right: 10, top: 8, bottom: 8 })
          .onClick(() => {
            if (this.selectedChapter?.id !== chapter.id) {
              this.selectedChapter = chapter;
              // 重新初始化并播放入场动画
              this.showLevelList = false;
              this.initLevelAnimationStates();
              setTimeout(() => {
                this.playLevelEntryAnimation();
              }, 50);
            }
          })
        })
      }
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .width('100%')
    .margin({ top: 16 })
  }

  /**
   * 获取章节图标
   */
  private getChapterIcon(subjectId: string): Resource {
    switch (subjectId) {
      case '001': return $r('app.media.Basicknowledge');
      case '002': return $r('app.media.Concrete');
      case '003': return $r('app.media.Rock');
      case '004': return $r('app.media.Foundation');
      case '005': return $r('app.media.Measurement');
      case '006': return $r('app.media.Metal');
      case '007': return $r('app.media.Machine');
      default: return $r('app.media.Basicknowledge');
    }
  }

  @Builder
  buildChapterProgress() {
    if (this.selectedChapter) {
      Row() {
        Text(this.selectedChapter.name)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#333333')

        Blank()

        Text(`⭐ ${this.selectedChapter.earnedStars}/${this.selectedChapter.totalStars}`)
          .fontSize(14)
          .fontColor('#666666')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 16 })
    }
  }

  @Builder
  buildLevelItem(level: GameLevel, index: number) {
    Row() {
      // 关卡序号和状态
      Stack() {
        if (level.isUnlocked) {
          Circle()
            .width(48)
            .height(48)
            .fill(level.bestStars > 0 ? ThemeColors.PRIMARY : '#E8E8E8')

          if (level.bestStars > 0) {
            Text('✓')
              .fontSize(20)
              .fontColor(Color.White)
          } else {
            Text(level.levelNumber.toString())
              .fontSize(18)
              .fontWeight(FontWeight.Medium)
              .fontColor('#666666')
          }
        } else {
          Circle()
            .width(48)
            .height(48)
            .fill('#F5F5F5')
          Text('🔒')
            .fontSize(20)
        }
      }

      // 关卡信息
      Column() {
        Row() {
          Text(level.name)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(level.isUnlocked ? '#333333' : '#999999')

          Text(getDifficultyConfig(level.difficulty).icon)
            .fontSize(14)
            .margin({ left: 8 })
        }

        Text(`${level.questionCount}题 · ${getDifficultyConfig(level.difficulty).name}`)
          .fontSize(12)
          .fontColor('#999999')
          .margin({ top: 4 })

        // 星级显示
        if (level.bestStars > 0) {
          Row() {
            ForEach([1, 2, 3], (star: number) => {
              Text(star <= level.bestStars ? '⭐' : '☆')
                .fontSize(14)
            })
            Text(`最高${level.bestScore}分`)
              .fontSize(12)
              .fontColor('#999999')
              .margin({ left: 8 })
          }
          .margin({ top: 4 })
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ left: 12 })

      // 开始按钮
      if (level.isUnlocked) {
        Button(level.bestStars > 0 ? '再战' : '开始')
          .height(32)
          .fontSize(14)
          .backgroundColor(level.bestStars > 0 ? '#F5F5F5' : ThemeColors.PRIMARY)
          .fontColor(level.bestStars > 0 ? '#666666' : Color.White)
          .onClick(() => {
            const params: Record<string, Object> = {
              'levelId': level.id as Object,
              'chapterId': level.chapterId as Object
            };
            Router.push('pages/GameLevelPage', params);
          })
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ bottom: 12 })
    .opacity(level.isUnlocked ? (this.levelOpacities[index] ?? 1) : 0.6 * (this.levelOpacities[index] ?? 1))
    .scale({ x: this.levelScales[index] ?? 1, y: this.levelScales[index] ?? 1 })
    .onClick(() => {
      if (level.isUnlocked) {
        const params: Record<string, Object> = {
          'levelId': level.id as Object,
          'chapterId': level.chapterId as Object
        };
        Router.push('pages/GameLevelPage', params);
      }
    })
  }

  @Builder
  buildLevelList() {
    if (this.selectedChapter && this.showLevelList) {
      List() {
        ForEach(this.selectedChapter.levels, (level: GameLevel, index: number) => {
          ListItem() {
            this.buildLevelItem(level, index)
          }
        })
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16, top: 8, bottom: 16 })
      .listDirection(Axis.Vertical)
      .scrollBar(BarState.Off)
    }
  }

  build() {
    Column() {
      // 渐变背景头部
      Column() {
        this.buildHeader()
        this.buildStatsCard()
        this.buildChapterTabs()
      }
      .width('100%')
      .linearGradient({
        direction: GradientDirection.Bottom,
        colors: [[ThemeColors.PRIMARY, 0], ['#4A90E2', 1]]
      })
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT, bottom: 16 })

      // 章节进度
      this.buildChapterProgress()

      // 关卡列表
      this.buildLevelList()
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
