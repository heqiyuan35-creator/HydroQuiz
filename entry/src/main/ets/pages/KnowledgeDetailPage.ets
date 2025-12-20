/**
 * 知识详情页
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { router, promptAction } from '@kit.ArkUI';
import { KnowledgeArticle, ContentType } from '../common/types/KnowledgeTypes';
import { KnowledgeService } from '../services/KnowledgeService';
import { TextToSpeechService, TTSState, TTSCallback } from '../services/TextToSpeechService';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';

interface RouteParams {
  articleId: string;
}

// 护眼配色常量
const EYE_CARE_BG: string = '#F5F0E6';
const EYE_CARE_SURFACE: string = '#FAF7F0';
const EYE_CARE_TEXT_PRIMARY: string = '#3D3D3D';
const EYE_CARE_TEXT_SECONDARY: string = '#666666';
const EYE_CARE_TEXT_HINT: string = '#999999';
const EYE_CARE_DIVIDER: string = '#E8E4DB';
const EYE_CARE_ACCENT: string = '#8B7355';
const EYE_CARE_TAG_BG: string = '#E8E0D0';

@Entry
@Component
struct KnowledgeDetailPage {
  @State article: KnowledgeArticle | null = null;
  @State isFavorited: boolean = false;
  @State isLoading: boolean = true;
  @State ttsState: TTSState = TTSState.IDLE;
  @State showNoteDialog: boolean = false;
  @State noteContent: string = '';
  @State allArticles: KnowledgeArticle[] = [];
  @State currentIndex: number = -1;
  private knowledgeService: KnowledgeService = KnowledgeService.getInstance();
  private ttsService: TextToSpeechService = TextToSpeechService.getInstance();
  private startTime: number = 0;

  aboutToAppear(): void {
    this.startTime = Date.now();
    this.allArticles = this.knowledgeService.getAllArticles();
    const params = router.getParams() as RouteParams;
    if (params && params.articleId) {
      this.loadArticle(params.articleId);
    }
    this.isLoading = false;
    this.setupTTSCallback();
  }

  private loadArticle(articleId: string): void {
    const foundArticle = this.knowledgeService.getArticleById(articleId);
    if (foundArticle) {
      this.article = foundArticle;
      this.isFavorited = this.knowledgeService.isFavorited(articleId);
      this.knowledgeService.incrementViewCount(articleId);
      this.currentIndex = this.allArticles.findIndex((a: KnowledgeArticle) => a.id === articleId);
      this.noteContent = this.knowledgeService.getArticleNote(articleId);
    }
  }

  aboutToDisappear(): void {
    if (this.article) {
      const readTime = Math.floor((Date.now() - this.startTime) / 1000);
      this.knowledgeService.updateReadProgress(this.article.id, 100, readTime);
    }
    this.ttsService.stop();
    this.ttsService.clearCallback();
  }

  private setupTTSCallback(): void {
    const callback: TTSCallback = {
      onStateChange: (state: TTSState) => { this.ttsState = state; },
      onComplete: (requestId: string) => { promptAction.showToast({ message: '朗读完成', duration: 1500 }); },
      onError: (requestId: string, errorCode: number, errorMessage: string) => {
        promptAction.showToast({ message: `朗读失败: ${errorMessage}`, duration: 2000 });
      }
    };
    this.ttsService.setCallback(callback);
  }

  private goPrevArticle(): void {
    if (this.currentIndex > 0) {
      this.loadArticle(this.allArticles[this.currentIndex - 1].id);
      this.startTime = Date.now();
    }
  }

  private goNextArticle(): void {
    if (this.currentIndex < this.allArticles.length - 1) {
      this.loadArticle(this.allArticles[this.currentIndex + 1].id);
      this.startTime = Date.now();
    }
  }

  private saveNote(): void {
    if (this.article) {
      this.knowledgeService.saveArticleNote(this.article.id, this.noteContent);
      promptAction.showToast({ message: '笔记已保存', duration: 1500 });
      this.showNoteDialog = false;
    }
  }

  build() {
    Stack() {
      Column() {
        this.NavigationBar()
        if (this.isLoading) {
          this.LoadingView()
        } else if (this.article) {
          this.ContentView()
          this.BottomBar()
        } else {
          this.EmptyView()
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor(EYE_CARE_BG)

      if (this.showNoteDialog) {
        this.NoteDialog()
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  NavigationBar() {
    Column() {
      Row().width('100%').height(48)
      Row() {
        Row() {
          Text('‹').fontSize(28).fontColor(EYE_CARE_TEXT_SECONDARY)
        }
        .width(40).height(40).justifyContent(FlexAlign.Center)
        .onClick(() => { router.back(); })

        Blank()

        if (this.article) {
          Row({ space: 16 }) {
            Column() {
              Text(this.isFavorited ? '★' : '☆')
                .fontSize(24)
                .fontColor(this.isFavorited ? '#FFB800' : EYE_CARE_TEXT_HINT)
            }
            .onClick(() => {
              if (this.article) {
                if (this.isFavorited) {
                  this.knowledgeService.unfavoriteArticle(this.article.id);
                  promptAction.showToast({ message: '已取消收藏', duration: 1500 });
                } else {
                  this.knowledgeService.favoriteArticle(this.article.id);
                  promptAction.showToast({ message: '已收藏', duration: 1500 });
                }
                this.isFavorited = !this.isFavorited;
              }
            })

            Row() {
              Text(this.ttsState === TTSState.SPEAKING ? '停止' : '朗诵')
                .fontSize(13)
                .fontColor(this.ttsState === TTSState.SPEAKING ? ThemeColors.PRIMARY : EYE_CARE_TEXT_HINT)
              Text(this.ttsState === TTSState.SPEAKING ? '⏹' : '▶')
                .fontSize(14)
                .fontColor(this.ttsState === TTSState.SPEAKING ? ThemeColors.PRIMARY : EYE_CARE_TEXT_HINT)
                .margin({ left: 4 })
            }
            .onClick(() => { this.handleTTSButtonClick(); })
          }
        }
      }
      .width('100%').height(56).padding({ left: 8, right: ThemeConstants.SPACING_MD })
    }
    .width('100%').backgroundColor(EYE_CARE_SURFACE)
  }

  @Builder
  LoadingView() {
    Column() {
      LoadingProgress().width(48).height(48).color(EYE_CARE_ACCENT)
      Text('加载中...').fontSize(ThemeConstants.FONT_SIZE_SM).fontColor(EYE_CARE_TEXT_HINT)
        .margin({ top: ThemeConstants.SPACING_MD })
    }
    .width('100%').layoutWeight(1).justifyContent(FlexAlign.Center)
  }

  @Builder
  EmptyView() {
    Column() {
      Text('😕').fontSize(48)
      Text('文章不存在').fontSize(ThemeConstants.FONT_SIZE_MD).fontColor(EYE_CARE_TEXT_HINT)
        .margin({ top: ThemeConstants.SPACING_MD })
    }
    .width('100%').layoutWeight(1).justifyContent(FlexAlign.Center)
  }

  @Builder
  ContentView() {
    Scroll() {
      Column() {
        this.ArticleHeader()
        this.ArticleContent()
        if (this.noteContent.length > 0) {
          this.NotePreview()
        }
      }
      .padding({ bottom: 100 })
    }
    .scrollBar(BarState.Off).width('100%').layoutWeight(1)
  }

  @Builder
  ArticleHeader() {
    Column() {
      Row() {
        Text(this.article!.categoryName)
          .fontSize(12).fontColor(EYE_CARE_ACCENT)
          .padding({ left: 10, right: 10, top: 4, bottom: 4 })
          .backgroundColor(EYE_CARE_TAG_BG).borderRadius(12)
        if (this.article!.source) {
          Text(this.article!.source).fontSize(12).fontColor(EYE_CARE_TEXT_HINT)
            .margin({ left: ThemeConstants.SPACING_SM })
        }
      }

      Text(this.article!.title)
        .fontSize(22).fontWeight(FontWeight.Bold).fontColor(EYE_CARE_TEXT_PRIMARY)
        .lineHeight(32).margin({ top: ThemeConstants.SPACING_MD })

      Row({ space: 16 }) {
        Row() {
          Text('📄').fontSize(12)
          Text(this.getContentTypeText(this.article!.contentType))
            .fontSize(12).fontColor(EYE_CARE_TEXT_HINT).margin({ left: 4 })
        }
        Row() {
          Text('⏱').fontSize(12)
          Text(`${this.article!.readTime} 分钟`).fontSize(12).fontColor(EYE_CARE_TEXT_HINT).margin({ left: 4 })
        }
        Row() {
          Text('👁').fontSize(12)
          Text(`${this.article!.viewCount}`).fontSize(12).fontColor(EYE_CARE_TEXT_HINT).margin({ left: 4 })
        }
      }
      .margin({ top: ThemeConstants.SPACING_SM })

      if (this.article!.tags.length > 0) {
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(this.article!.tags, (tag: string) => {
            Text(`#${tag}`).fontSize(12).fontColor(EYE_CARE_ACCENT)
              .margin({ right: ThemeConstants.SPACING_SM, top: ThemeConstants.SPACING_XS })
          })
        }
        .margin({ top: ThemeConstants.SPACING_SM })
      }

      Row().width('100%').height(1).backgroundColor(EYE_CARE_DIVIDER).margin({ top: ThemeConstants.SPACING_MD })
    }
    .width('100%').padding(ThemeConstants.SPACING_MD).alignItems(HorizontalAlign.Start)
  }

  @Builder
  ArticleContent() {
    Column() {
      Text(this.cleanTextForDisplay(this.article!.content))
        .fontSize(16).fontColor(EYE_CARE_TEXT_PRIMARY).lineHeight(28).letterSpacing(0.5)
    }
    .width('100%').padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  NotePreview() {
    Column() {
      Row() {
        Text('📝 我的笔记').fontSize(14).fontWeight(FontWeight.Medium).fontColor(EYE_CARE_ACCENT)
        Blank()
        Text('编辑').fontSize(12).fontColor(ThemeColors.PRIMARY)
          .onClick(() => { this.showNoteDialog = true; })
      }
      .width('100%')
      Text(this.noteContent).fontSize(14).fontColor(EYE_CARE_TEXT_SECONDARY).lineHeight(22)
        .margin({ top: 8 }).maxLines(5).textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width('100%').padding(ThemeConstants.SPACING_MD)
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD })
    .backgroundColor(EYE_CARE_SURFACE).borderRadius(12)
    .border({ width: 1, color: EYE_CARE_DIVIDER })
  }

  @Builder
  BottomBar() {
    Row() {
      Row() {
        Text('‹').fontSize(20).fontColor(this.currentIndex > 0 ? ThemeColors.PRIMARY : EYE_CARE_TEXT_HINT)
        Text('上一节').fontSize(14).fontColor(this.currentIndex > 0 ? ThemeColors.PRIMARY : EYE_CARE_TEXT_HINT)
          .margin({ left: 4 })
      }
      .padding({ left: 16, right: 16, top: 10, bottom: 10 })
      .backgroundColor(this.currentIndex > 0 ? ThemeColors.PRIMARY + '15' : EYE_CARE_TAG_BG)
      .borderRadius(20)
      .onClick(() => { if (this.currentIndex > 0) this.goPrevArticle(); })

      Row() {
        Text('✏️').fontSize(16)
        Text('随心记').fontSize(14).fontColor(EYE_CARE_ACCENT).margin({ left: 4 })
      }
      .padding({ left: 20, right: 20, top: 10, bottom: 10 })
      .backgroundColor(EYE_CARE_SURFACE).borderRadius(20)
      .border({ width: 1, color: EYE_CARE_ACCENT })
      .onClick(() => { this.showNoteDialog = true; })

      Row() {
        Text('下一节').fontSize(14)
          .fontColor(this.currentIndex < this.allArticles.length - 1 ? ThemeColors.PRIMARY : EYE_CARE_TEXT_HINT)
        Text('›').fontSize(20)
          .fontColor(this.currentIndex < this.allArticles.length - 1 ? ThemeColors.PRIMARY : EYE_CARE_TEXT_HINT)
          .margin({ left: 4 })
      }
      .padding({ left: 16, right: 16, top: 10, bottom: 10 })
      .backgroundColor(this.currentIndex < this.allArticles.length - 1 ? ThemeColors.PRIMARY + '15' : EYE_CARE_TAG_BG)
      .borderRadius(20)
      .onClick(() => { if (this.currentIndex < this.allArticles.length - 1) this.goNextArticle(); })
    }
    .width('100%')
    .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD,
      top: ThemeConstants.SPACING_SM, bottom: ThemeConstants.SPACING_MD })
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(EYE_CARE_SURFACE)
    .border({ width: { top: 1 }, color: EYE_CARE_DIVIDER })
  }

  @Builder
  NoteDialog() {
    Column() {
      Column().width('100%').height('100%').backgroundColor('rgba(0,0,0,0.5)')
        .onClick(() => { this.showNoteDialog = false; })
    }
    .width('100%').height('100%').position({ x: 0, y: 0 })

    Column() {
      Row() {
        Text('取消').fontSize(15).fontColor(EYE_CARE_TEXT_SECONDARY)
          .onClick(() => { this.showNoteDialog = false; })
        Text('编辑笔记').fontSize(17).fontWeight(FontWeight.Medium).fontColor(EYE_CARE_TEXT_PRIMARY)
        Text('保存').fontSize(15).fontColor(ThemeColors.PRIMARY).fontWeight(FontWeight.Medium)
          .onClick(() => { this.saveNote(); })
      }
      .width('100%').padding({ left: 16, right: 16, top: 16, bottom: 12 }).justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text(this.article?.categoryName || '').fontSize(11).fontColor(ThemeColors.WHITE)
          .padding({ left: 8, right: 8, top: 2, bottom: 2 }).backgroundColor(EYE_CARE_ACCENT).borderRadius(8)
        Text(this.article?.title || '').fontSize(13).fontColor(EYE_CARE_TEXT_SECONDARY)
          .maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis }).layoutWeight(1).margin({ left: 8 })
      }
      .width('100%').padding({ left: 16, right: 16, bottom: 12 })

      TextArea({ text: this.noteContent, placeholder: '记录你的学习心得、易错点、解题技巧...' })
        .width('100%').height(200).fontSize(15).fontColor(EYE_CARE_TEXT_PRIMARY)
        .placeholderColor(EYE_CARE_TEXT_HINT).backgroundColor(EYE_CARE_BG)
        .padding(12).borderRadius(8).margin({ left: 16, right: 16 })
        .onChange((value: string) => { this.noteContent = value; })

      Row({ space: 24 }) {
        Column() {
          Text('📷').fontSize(24)
          Text('拍照识别').fontSize(11).fontColor(EYE_CARE_TEXT_HINT).margin({ top: 4 })
        }
        .onClick(() => { promptAction.showToast({ message: '功能开发中...', duration: 1500 }); })
        Column() {
          Text('🎤').fontSize(24)
          Text('语音录入').fontSize(11).fontColor(EYE_CARE_TEXT_HINT).margin({ top: 4 })
        }
        .onClick(() => { promptAction.showToast({ message: '功能开发中...', duration: 1500 }); })
      }
      .width('100%').padding({ left: 16, right: 16, top: 16, bottom: 24 })
    }
    .width('100%').backgroundColor(EYE_CARE_SURFACE)
    .borderRadius({ topLeft: 20, topRight: 20 }).position({ x: 0, y: '50%' })
  }

  private async handleTTSButtonClick(): Promise<void> {
    if (this.ttsState === TTSState.SPEAKING) {
      this.ttsService.stop();
    } else {
      if (!this.article) return;
      const textToSpeak = this.cleanTextForTTS(`${this.article.title}。${this.article.content}`);
      const success = await this.ttsService.speak(textToSpeak, 1.0);
      if (!success) {
        promptAction.showToast({ message: '启动朗读失败，请重试', duration: 2000 });
      }
    }
  }

  private cleanTextForTTS(text: string): string {
    return text
      .replace(/#{1,6}\s*/g, '').replace(/[\*_~`]/g, '').replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
      .replace(/[\[\]]/g, '').replace(/[|<>]/g, '').replace(/[（(]\d+[)）]/g, '第$1，')
      .replace(/[（(][一二三四五六七八九十]+[)）]/g, '').replace(/[（()）]/g, '')
      .replace(/℃/g, '摄氏度').replace(/Ω/g, '欧姆').replace(/μm/g, '微米').replace(/μg/g, '微克')
      .replace(/㎡/g, '平方米').replace(/㎥/g, '立方米').replace(/kg/g, '千克').replace(/mg/g, '毫克')
      .replace(/mm/g, '毫米').replace(/cm/g, '厘米').replace(/×/g, '乘以').replace(/÷/g, '除以')
      .replace(/±/g, '正负').replace(/≈/g, '约等于').replace(/≠/g, '不等于').replace(/≤/g, '小于等于')
      .replace(/≥/g, '大于等于').replace(/∑/g, '求和').replace(/√/g, '根号').replace(/∞/g, '无穷大')
      .replace(/π/g, '派').replace(/σ/g, '西格玛').replace(/μ/g, '缪').replace(/α/g, '阿尔法')
      .replace(/β/g, '贝塔').replace(/γ/g, '伽马').replace(/δ/g, '德尔塔').replace(/ε/g, '艾普西龙')
      .replace(/φ/g, '斐').replace(/²/g, '的平方').replace(/³/g, '的立方').replace(/¹/g, '')
      .replace(/⁰/g, '').replace(/₀/g, '0').replace(/₁/g, '1').replace(/₂/g, '2').replace(/ₙ/g, 'n')
      .replace(/[—–-]/g, '至').replace(/\s+/g, ' ')
      .replace(/[\u{1F300}-\u{1F9FF}]|[\u{2600}-\u{26FF}]|[\u{2700}-\u{27BF}]/gu, '').trim();
  }

  private cleanTextForDisplay(text: string): string {
    return text.replace(/^#{1,6}\s*/gm, '').replace(/\*\*([^*]+)\*\*/g, '$1').replace(/\*([^*]+)\*/g, '$1')
      .replace(/__([^_]+)__/g, '$1').replace(/_([^_]+)_/g, '$1').replace(/`([^`]+)`/g, '$1')
      .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1').trim();
  }

  private getContentTypeText(type: ContentType): string {
    switch (type) {
      case ContentType.TEXT: return '图文';
      case ContentType.PDF: return 'PDF文档';
      case ContentType.VIDEO: return '视频教程';
      case ContentType.IMAGE: return '图片';
      default: return '图文';
    }
  }
}
