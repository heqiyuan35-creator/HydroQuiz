/**
 * 知识库列表页
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { router } from '@kit.ArkUI';
import { KnowledgeArticle, KnowledgeSubject, ContentType } from '../common/types/KnowledgeTypes';
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

  private loadArticles(): void {
    if (this.currentSubjectId) {
      this.articles = this.knowledgeService.getArticlesBySubject(this.currentSubjectId);
    } else {
      this.articles = this.knowledgeService.getAllArticles();
    }
  }

  build() {
    Column() {
      // 顶部导航栏
      this.NavigationBar()

      // 文章列表
      if (this.isLoading) {
        this.LoadingView()
      } else if (this.articles.length === 0) {
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
      Image($r('app.media.back'))
        .width(24)
        .height(24)
        .onClick(() => {
          router.back();
        })

      Text(this.subject ? this.subject.name : '知识库')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ left: ThemeConstants.SPACING_MD })

      Blank()
    }
    .width('100%')
    .height(56)
    .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
    .backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  LoadingView() {
    Column() {
      LoadingProgress()
        .width(48)
        .height(48)
        .color(ThemeColors.PRIMARY)

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
        .fontSize(48)

      Text('暂无文章')
        .fontSize(ThemeConstants.FONT_SIZE_MD)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: ThemeConstants.SPACING_MD })

      Text('敬请期待更多内容')
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: ThemeConstants.SPACING_XS })
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  ArticleList() {
    List() {
      ForEach(this.articles, (article: KnowledgeArticle) => {
        ListItem() {
          this.ArticleItem(article)
        }
      }, (article: KnowledgeArticle) => article.id)
    }
    .width('100%')
    .layoutWeight(1)
    .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
  }

  @Builder
  ArticleItem(article: KnowledgeArticle) {
    Row() {
      Column() {
        // 分类和来源
        Row() {
          Text(article.categoryName)
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.PRIMARY)

          if (article.source) {
            Text(` · ${article.source}`)
              .fontSize(ThemeConstants.FONT_SIZE_XS)
              .fontColor(ThemeColors.TEXT_HINT)
          }
        }

        // 标题
        Text(article.title)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .margin({ top: ThemeConstants.SPACING_XS })
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        // 摘要
        Text(article.summary)
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: ThemeConstants.SPACING_XS })
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        // 元信息
        Row() {
          Text(this.getContentTypeText(article.contentType))
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_HINT)

          Text(`⏱ ${article.readTime} 分钟`)
            .fontSize(ThemeConstants.FONT_SIZE_XS)
            .fontColor(ThemeColors.TEXT_HINT)
            .margin({ left: ThemeConstants.SPACING_SM })
        }
        .margin({ top: ThemeConstants.SPACING_SM })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      // 缩略图
      Column() {
        Text(this.getContentTypeIcon(article.contentType))
          .fontSize(32)
      }
      .width(60)
      .height(60)
      .backgroundColor(ThemeColors.PRIMARY + '1A')
      .borderRadius(ThemeConstants.RADIUS_BASE)
      .justifyContent(FlexAlign.Center)
      .margin({ left: ThemeConstants.SPACING_SM })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ top: ThemeConstants.SPACING_SM })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .onClick(() => {
      const navParams: Record<string, string> = {};
      navParams['articleId'] = article.id;
      router.pushUrl({
        url: AppConstants.ROUTE_KNOWLEDGE_DETAIL,
        params: navParams
      });
    })
  }

  private getContentTypeText(type: ContentType): string {
    switch (type) {
      case ContentType.TEXT:
        return '📄 图文';
      case ContentType.PDF:
        return '📑 PDF';
      case ContentType.VIDEO:
        return '🎬 视频';
      case ContentType.IMAGE:
        return '🖼️ 图片';
      default:
        return '📄 图文';
    }
  }

  private getContentTypeIcon(type: ContentType): string {
    switch (type) {
      case ContentType.TEXT:
        return '📚';
      case ContentType.PDF:
        return '📑';
      case ContentType.VIDEO:
        return '🎬';
      case ContentType.IMAGE:
        return '🖼️';
      default:
        return '📚';
    }
  }
}
