/**
 * 收藏页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { answerRecordService } from '../services/AnswerRecordService';
import { questionService } from '../services/QuestionService';
import { FavoriteQuestion, Question } from '../common/types/QuestionTypes';
import { getSubjectShortName, getSubjectColor } from '../data/SubjectData';
import { Logger } from '../common/utils/Logger';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 收藏显示项
 */
interface FavoriteItem {
  favorite: FavoriteQuestion;
  question: Question;
}

@Entry
@Component
struct FavoritePage {
  @State isDarkMode: boolean = false;
  @State isLoading: boolean = true;
  @State favoriteItems: FavoriteItem[] = [];

  aboutToAppear(): void {
    this.loadFavorites();
  }

  onPageShow(): void {
    // 页面显示时刷新数据
    this.loadFavorites();
  }

  /**
   * 加载收藏列表
   */
  private async loadFavorites(): Promise<void> {
    try {
      const favoriteList = await answerRecordService.getFavorites();
      const items: FavoriteItem[] = [];

      for (const favorite of favoriteList) {
        const question = await questionService.getQuestionById(favorite.questionId);
        if (question) {
          items.push({ favorite, question });
        }
      }

      this.favoriteItems = items;
      Logger.info(`[FavoritePage] Loaded ${items.length} favorites`);
    } catch (error) {
      Logger.error('[FavoritePage] Failed to load favorites', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  /**
   * 开始收藏练习
   */
  private startPractice(): void {
    const params: RouteParams = {};
    params['mode'] = 'favorite' as Object;
    Router.goToAnswer(params);
  }

  /**
   * 查看单个题目
   */
  private viewQuestion(item: FavoriteItem): void {
    const params: RouteParams = {};
    params['questionId'] = item.question.id as Object;
    params['mode'] = 'single' as Object;
    Router.goToAnswer(params);
  }

  /**
   * 取消收藏
   */
  private async removeFavorite(item: FavoriteItem): Promise<void> {
    try {
      await answerRecordService.removeFavorite(item.question.id);
      // 从列表中移除
      this.favoriteItems = this.favoriteItems.filter((i: FavoriteItem) => i.question.id !== item.question.id);
    } catch (error) {
      Logger.error('[FavoritePage] Failed to remove favorite', error as Error);
    }
  }

  /**
   * 格式化时间
   */
  private formatTime(timestamp: number): string {
    const date = new Date(timestamp);
    const month = date.getMonth() + 1;
    const day = date.getDate();
    return `${month}月${day}日`;
  }

  build() {
    Column() {
      // 顶部导航栏
      this.NavigationBar()

      if (this.isLoading) {
        // 加载中
        Column() {
          LoadingProgress()
            .width(48)
            .height(48)
            .color(ThemeColors.PRIMARY)
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else if (this.favoriteItems.length === 0) {
        // 空状态
        this.EmptyState()
      } else {
        // 收藏列表
        this.FavoriteList()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.isDarkMode ? ThemeColors.BACKGROUND_DARK : ThemeColors.BACKGROUND)
    .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
  }

  @Builder
  NavigationBar() {
    Row() {
      Row() {
        Image($r('app.media.back'))
          .width(24)
          .height(24)
      }
      .width(40)
      .height(40)
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        Router.back();
      })

      Text(`我的收藏 (${this.favoriteItems.length})`)
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      // 练习按钮
      if (this.favoriteItems.length > 0) {
        Text('练习')
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.PRIMARY)
          .padding({ left: 12, right: 12 })
          .onClick(() => {
            this.startPractice();
          })
      } else {
        Row().width(40).height(40)
      }
    }
    .width('100%')
    .height(56)
    .padding({ left: ThemeConstants.SPACING_SM, right: ThemeConstants.SPACING_SM })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
  }

  @Builder
  EmptyState() {
    Column() {
      Text('⭐')
        .fontSize(64)

      Text('暂无收藏')
        .fontSize(ThemeConstants.FONT_SIZE_XL)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ top: ThemeConstants.SPACING_MD })

      Text('答题时点击星标可收藏题目')
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: ThemeConstants.SPACING_SM })

      Button('去做题')
        .width(120)
        .height(44)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .backgroundColor(ThemeColors.PRIMARY)
        .margin({ top: ThemeConstants.SPACING_LG })
        .onClick(() => {
          Router.goToPractice();
        })
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  FavoriteList() {
    List() {
      ForEach(this.favoriteItems, (item: FavoriteItem) => {
        ListItem() {
          this.FavoriteItem(item)
        }
      })
    }
    .width('100%')
    .layoutWeight(1)
    .padding(ThemeConstants.SPACING_MD)
  }

  @Builder
  FavoriteItem(item: FavoriteItem) {
    Column() {
      // 题目信息
      Row() {
        Text(getSubjectShortName(item.question.subjectId))
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.WHITE)
          .padding({ left: 8, right: 8, top: 3, bottom: 3 })
          .backgroundColor(getSubjectColor(item.question.subjectId))
          .borderRadius(6)

        Text(this.formatTime(item.favorite.createTime))
          .fontSize(ThemeConstants.FONT_SIZE_XS)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ left: ThemeConstants.SPACING_SM })

        Blank()

        // 收藏图标
        Text('⭐')
          .fontSize(ThemeConstants.FONT_SIZE_MD)
      }
      .width('100%')

      // 题目内容
      Text(item.question.content)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ top: ThemeConstants.SPACING_SM })

      // 操作按钮
      Row() {
        Text('查看详情')
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.PRIMARY)
          .onClick(() => {
            this.viewQuestion(item);
          })

        Blank()

        Text('取消收藏')
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.TEXT_HINT)
          .onClick(() => {
            this.removeFavorite(item);
          })
      }
      .width('100%')
      .margin({ top: ThemeConstants.SPACING_SM })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ bottom: ThemeConstants.SPACING_SM })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .onClick(() => {
      this.viewQuestion(item);
    })
  }
}
