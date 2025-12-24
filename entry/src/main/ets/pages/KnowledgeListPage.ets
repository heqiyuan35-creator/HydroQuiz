/**
 * 知识库列表页 - 美化版
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { router } from '@kit.ArkUI';
import { KnowledgeArticle, KnowledgeSubject } from '../common/types/KnowledgeTypes';
import { KnowledgeService } from '../services/KnowledgeService';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';

interface RouteParams {
  subjectId?: string;
}

@Entry
@Component
struct KnowledgeListPage {
  @State currentSubjectId: string = '';
  @State articles: KnowledgeArticle[] = [];
  @State subject: KnowledgeSubject | null = null;
  @State isLoading: boolean = true;
  @State searchText: string = '';
  private knowledgeService: KnowledgeService = KnowledgeService.getInstance();

  aboutToAppear(): void {
    const params = router.getParams() as RouteParams;
    if (params) {
      if (params.subjectId) {
        this.currentSubjectId = params.subjectId;
        const foundSubject = this.knowledgeService.getSubjectById(params.subjectId);
        if (foundSubject) {
          this.subject = foundSubject;
        }
      }
    }
    this.loadArticles();
    this.isLoading = false;
  }

  onPageShow(): void {
    // 页面显示时刷新文章列表数据（从详情页返回时更新阅读状态）
    this.loadArticles();
  }

  private loadArticles(): void {
    if (this.currentSubjectId) {
      this.articles = this.knowledgeService.getArticlesBySubject(this.currentSubjectId);
    } else {
      this.articles = this.knowledgeService.getAllArticles();
    }
  }

  private getFilteredArticles(): KnowledgeArticle[] {
    if (!this.searchText.trim()) {
      return this.articles;
    }
    const keyword = this.searchText.trim().toLowerCase();
    return this.articles.filter((a: KnowledgeArticle) =>
      a.title.toLowerCase().includes(keyword) ||
      a.summary.toLowerCase().includes(keyword) ||
      a.categoryName.toLowerCase().includes(keyword)
    );
  }

  private getSubjectColor(): string {
    return this.subject ? this.subject.color : ThemeColors.PRIMARY;
  }

  private getReadProgress(): number {
    return 0;
  }

  build() {
    Column() {
      // 顶部导航栏
      this.NavigationBar()

      // 科目信息卡片
      if (this.subject) {
        this.SubjectInfoCard()
      }

      // 搜索框
      this.SearchBar()

      // 文章列表
      if (this.isLoading) {
        this.LoadingView()
      } else if (this.getFilteredArticles().length === 0) {
        this.EmptyView()
      } else {
        this.ArticleList()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(ThemeColors.BACKGROUND)
  }

  @Builder
  NavigationBar() {
    Row() {
      // 返回按钮
      Row() {
        Text('‹')
          .fontSize(28)
          .fontColor(ThemeColors.TEXT_SECONDARY)
      }
      .width(40)
      .height(40)
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        router.back();
      })

      Text(this.subject ? this.subject.name : '知识库')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ left: 4 })

      Blank()

      // 文章数量徽章
      if (this.articles.length > 0) {
        Text(`${this.articles.length} 篇`)
          .fontSize(12)
          .fontColor(this.getSubjectColor())
          .padding({ left: 10, right: 10, top: 4, bottom: 4 })
          .backgroundColor(this.getSubjectColor() + '15')
          .borderRadius(12)
      }
    }
    .width('100%')
    .height(56)
    .padding({ left: 8, right: ThemeConstants.SPACING_MD })
    .backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  SubjectInfoCard() {
    Row() {
      // 科目图标
      Column() {
        Image(this.getSubjectIcon())
          .width(28)
          .height(28)
          .objectFit(ImageFit.Contain)
      }
      .width(48)
      .height(48)
      .borderRadius(12)
      .backgroundColor(this.getSubjectColor() + '15')
      .justifyContent(FlexAlign.Center)

      // 科目信息
      Column() {
        Text(this.subject!.name)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        // 统计信息
        Text(`共 ${this.articles.length} 篇文章`)
          .fontSize(11)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 8 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ left: 12 })
    }
    .width('100%')
    .padding({ left: 14, right: 14, top: 12, bottom: 12 })
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: 8 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
    .shadow({ radius: 2, color: 'rgba(0,0,0,0.04)', offsetY: 1 })
  }

  @Builder
  SearchBar() {
    Row() {
      Image($r('app.media.Search'))
        .width(16)
        .height(16)
        .margin({ left: 12 })
        .objectFit(ImageFit.Contain)

      TextInput({ placeholder: '搜索文章...', text: this.searchText })
        .placeholderColor(ThemeColors.TEXT_HINT)
        .placeholderFont({ size: 13 })
        .fontSize(13)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .backgroundColor(Color.Transparent)
        .layoutWeight(1)
        .height(36)
        .onChange((value: string) => {
          this.searchText = value;
        })

      if (this.searchText.length > 0) {
        Text('✕')
          .fontSize(13)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ right: 12 })
          .onClick(() => {
            this.searchText = '';
          })
      }
    }
    .width('100%')
    .height(40)
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: 8 })
    .backgroundColor(ThemeColors.GRAY_100)
    .borderRadius(20)
  }

  @Builder
  LoadingView() {
    Column() {
      LoadingProgress()
        .width(48)
        .height(48)
        .color(this.getSubjectColor())

      Text('加载中...')
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: ThemeConstants.SPACING_MD })
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  EmptyView() {
    Column() {
      Text('📚')
        .fontSize(56)

      Text(this.searchText ? '未找到相关文章' : '暂无文章')
        .fontSize(16)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: ThemeConstants.SPACING_MD })

      Text(this.searchText ? '试试其他关键词吧' : '敬请期待更多内容')
        .fontSize(13)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: 4 })
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  ArticleList() {
    List() {
      ForEach(this.getFilteredArticles(), (article: KnowledgeArticle, index: number) => {
        ListItem() {
          this.ArticleItem(article, index)
        }
      }, (article: KnowledgeArticle) => article.id)
    }
    .width('100%')
    .layoutWeight(1)
    .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: 4, bottom: ThemeConstants.SPACING_LG })
  }

  @Builder
  ArticleItem(article: KnowledgeArticle, index: number) {
    Row() {
      // 左侧序号区域
      Column() {
        Text(`${index + 1}`)
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.getSubjectColor())
      }
      .width(28)
      .height(28)
      .borderRadius(14)
      .backgroundColor(this.getSubjectColor() + '15')
      .justifyContent(FlexAlign.Center)
      .margin({ left: 12, top: 14 })

      // 内容区
      Column() {
        // 标题行
        Row() {
          Text(article.title)
            .fontSize(15)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.knowledgeService.isArticleRead(article.id) ? ThemeColors.TEXT_HINT : ThemeColors.TEXT_PRIMARY)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .layoutWeight(1)

          // 已读标记
          if (this.knowledgeService.isArticleRead(article.id)) {
            Text('已读')
              .fontSize(10)
              .fontColor(ThemeColors.SUCCESS)
              .padding({ left: 6, right: 6, top: 2, bottom: 2 })
              .backgroundColor(ThemeColors.SUCCESS + '15')
              .borderRadius(8)
              .margin({ left: 8 })
          }
        }
        .width('100%')

        // 分类和来源
        Row() {
          Text(article.categoryName)
            .fontSize(11)
            .fontColor(this.getSubjectColor())

          if (article.source) {
            Text(` · ${article.source}`)
              .fontSize(11)
              .fontColor(ThemeColors.TEXT_HINT)
              .maxLines(1)
          }
        }
        .margin({ top: 6 })

        // 底部信息行
        Row() {
          Text(`⏱ ${article.readTime}分钟`)
            .fontSize(11)
            .fontColor(ThemeColors.TEXT_HINT)

          Blank()

          // 箭头
          Text('›')
            .fontSize(18)
            .fontColor(ThemeColors.TEXT_HINT)
        }
        .width('100%')
        .margin({ top: 8 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .padding({ left: 12, right: 14, top: 14, bottom: 14 })
    }
    .width('100%')
    .alignItems(VerticalAlign.Top)
    .margin({ top: 8 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
    .border({ width: 1, color: ThemeColors.GRAY_200 })
    .shadow({ radius: 2, color: 'rgba(0,0,0,0.03)', offsetY: 1 })
    .onClick(() => {
      const navParams: Record<string, string> = {};
      navParams['articleId'] = article.id;
      router.pushUrl({
        url: AppConstants.ROUTE_KNOWLEDGE_DETAIL,
        params: navParams
      });
    })
  }

  private getSubjectIcon(): Resource {
    if (!this.subject) return $r('app.media.KnowledgeBase');
    switch (this.subject.id) {
      case AppConstants.SUBJECT_BASIC: return $r('app.media.Basicknowledge');
      case AppConstants.SUBJECT_CONCRETE: return $r('app.media.Concrete');
      case AppConstants.SUBJECT_GEOTECHNICAL_ROCK: return $r('app.media.Rock');
      case AppConstants.SUBJECT_GEOTECHNICAL_FOUNDATION: return $r('app.media.Foundation');
      case AppConstants.SUBJECT_MEASUREMENT: return $r('app.media.Measurement');
      case AppConstants.SUBJECT_METAL: return $r('app.media.Metal');
      case AppConstants.SUBJECT_MECHANICAL: return $r('app.media.Machine');
      default: return $r('app.media.KnowledgeBase');
    }
  }
}
