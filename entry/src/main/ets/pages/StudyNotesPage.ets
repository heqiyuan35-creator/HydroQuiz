/**
 * 学习笔记页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { router, promptAction } from '@kit.ArkUI';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { KnowledgeService } from '../services/KnowledgeService';
import { KnowledgeArticle } from '../common/types/KnowledgeTypes';
import { answerRecordService } from '../services/AnswerRecordService';
import { WrongQuestion } from '../common/types/QuestionTypes';
import { questionService } from '../services/QuestionService';

// 笔记类型
type NoteType = 'knowledge' | 'wrong';

// 笔记项接口
interface NoteItem {
  id: string;
  type: NoteType;
  title: string;
  categoryName: string;
  note: string;
  updateTime: number;
}

@Entry
@Component
struct StudyNotesPage {
  @State isLoading: boolean = true;
  @State selectedTab: NoteType = 'knowledge';
  @State knowledgeNotes: NoteItem[] = [];
  @State wrongNotes: NoteItem[] = [];
  private knowledgeService: KnowledgeService = KnowledgeService.getInstance();

  aboutToAppear(): void {
    this.loadNotes();
  }

  onPageShow(): void {
    // 页面显示时刷新笔记数据
    this.loadNotes();
  }

  private async loadNotes(): Promise<void> {
    this.isLoading = true;
    try {
      // 加载知识库笔记
      const articlesWithNotes = this.knowledgeService.getArticlesWithNotes();
      this.knowledgeNotes = articlesWithNotes.map((article: KnowledgeArticle) => {
        const item: NoteItem = {
          id: article.id,
          type: 'knowledge',
          title: article.title,
          categoryName: article.categoryName,
          note: this.knowledgeService.getArticleNote(article.id),
          updateTime: Date.now()
        };
        return item;
      });

      // 加载错题笔记
      const wrongQuestions = await answerRecordService.getWrongQuestionsWithNotes();
      const wrongNoteItems: NoteItem[] = [];
      for (const wq of wrongQuestions) {
        const question = await questionService.getQuestionById(wq.questionId);
        if (question) {
          const item: NoteItem = {
            id: wq.questionId,
            type: 'wrong',
            title: question.content.substring(0, 50) + (question.content.length > 50 ? '...' : ''),
            categoryName: '错题笔记',
            note: wq.note || '',
            updateTime: wq.lastWrongTime
          };
          wrongNoteItems.push(item);
        }
      }
      this.wrongNotes = wrongNoteItems;
    } catch (error) {
      promptAction.showToast({ message: '加载笔记失败', duration: 2000 });
    } finally {
      this.isLoading = false;
    }
  }

  private getCurrentNotes(): NoteItem[] {
    return this.selectedTab === 'knowledge' ? this.knowledgeNotes : this.wrongNotes;
  }

  private getTotalCount(): number {
    return this.knowledgeNotes.length + this.wrongNotes.length;
  }

  build() {
    Column() {
      // 顶部导航栏
      this.NavigationBar()

      // Tab切换
      this.TabBar()

      // 内容区域
      if (this.isLoading) {
        this.LoadingView()
      } else if (this.getCurrentNotes().length === 0) {
        this.EmptyView()
      } else {
        this.NoteList()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(ThemeColors.BACKGROUND)
  }

  @Builder
  NavigationBar() {
    Column() {
      Row().width('100%').height(48)
      Row() {
        Row() {
          Text('‹').fontSize(28).fontColor(ThemeColors.TEXT_SECONDARY)
        }
        .width(40).height(40).justifyContent(FlexAlign.Center)
        .onClick(() => { router.back(); })

        Text('学习笔记')
          .fontSize(ThemeConstants.FONT_SIZE_LG)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Row() {
          Text(`共 ${this.getTotalCount()} 条`)
            .fontSize(ThemeConstants.FONT_SIZE_SM)
            .fontColor(ThemeColors.TEXT_HINT)
        }
        .width(80)
      }
      .width('100%').height(56).padding({ left: 8, right: ThemeConstants.SPACING_MD })
    }
    .width('100%').backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  TabBar() {
    Row() {
      this.TabItem('knowledge', '知识笔记', this.knowledgeNotes.length)
      this.TabItem('wrong', '错题笔记', this.wrongNotes.length)
    }
    .width('100%')
    .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD,
      top: ThemeConstants.SPACING_SM, bottom: ThemeConstants.SPACING_SM })
    .backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  TabItem(type: NoteType, label: string, count: number) {
    Column() {
      Row() {
        Text(label)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(this.selectedTab === type ? ThemeColors.PRIMARY : ThemeColors.TEXT_SECONDARY)
          .fontWeight(this.selectedTab === type ? FontWeight.Medium : FontWeight.Normal)
        Text(` ${count}`)
          .fontSize(ThemeConstants.FONT_SIZE_SM)
          .fontColor(this.selectedTab === type ? ThemeColors.PRIMARY : ThemeColors.TEXT_HINT)
      }
      .padding({ left: 16, right: 16, top: 10, bottom: 10 })

      Row()
        .width(40)
        .height(3)
        .backgroundColor(this.selectedTab === type ? ThemeColors.PRIMARY : ThemeColors.TRANSPARENT)
        .borderRadius(2)
    }
    .layoutWeight(1)
    .onClick(() => { this.selectedTab = type; })
  }

  @Builder
  LoadingView() {
    Column() {
      LoadingProgress().width(48).height(48).color(ThemeColors.PRIMARY)
      Text('加载中...').fontSize(ThemeConstants.FONT_SIZE_SM).fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: ThemeConstants.SPACING_MD })
    }
    .width('100%').layoutWeight(1).justifyContent(FlexAlign.Center)
  }

  @Builder
  EmptyView() {
    Column() {
      Text('📝').fontSize(64)
      Text(this.selectedTab === 'knowledge' ? '暂无知识笔记' : '暂无错题笔记')
        .fontSize(ThemeConstants.FONT_SIZE_MD)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: ThemeConstants.SPACING_MD })
      Text(this.selectedTab === 'knowledge' ? '阅读知识库文章时可以添加笔记' : '做错题时可以添加笔记')
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: ThemeConstants.SPACING_XS })
    }
    .width('100%').layoutWeight(1).justifyContent(FlexAlign.Center)
  }

  @Builder
  NoteList() {
    List() {
      ForEach(this.getCurrentNotes(), (item: NoteItem) => {
        ListItem() {
          this.NoteCard(item)
        }
      }, (item: NoteItem) => item.id)
    }
    .width('100%')
    .layoutWeight(1)
    .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_SM })
  }

  @Builder
  NoteCard(item: NoteItem) {
    Column() {
      // 标题行
      Row() {
        Text(item.categoryName)
          .fontSize(11)
          .fontColor(ThemeColors.WHITE)
          .padding({ left: 8, right: 8, top: 2, bottom: 2 })
          .backgroundColor(item.type === 'knowledge' ? ThemeColors.PRIMARY : ThemeColors.WARNING)
          .borderRadius(8)

        Text(item.title)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .fontWeight(FontWeight.Medium)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .layoutWeight(1)
          .margin({ left: 8 })
      }
      .width('100%')

      // 笔记内容
      Text(item.note)
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .lineHeight(20)
        .maxLines(3)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ top: 8 })
        .width('100%')

      // 时间
      Text(this.formatTime(item.updateTime))
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: 8 })
        .width('100%')
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ bottom: ThemeConstants.SPACING_SM })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .onClick(() => {
      if (item.type === 'knowledge') {
        router.pushUrl({ url: 'pages/KnowledgeDetailPage', params: { articleId: item.id } });
      } else {
        router.pushUrl({ url: 'pages/AnswerPage', params: { questionId: item.id, mode: 'single' } });
      }
    })
  }

  private formatTime(timestamp: number): string {
    const date = new Date(timestamp);
    const month = date.getMonth() + 1;
    const day = date.getDate();
    return `${month}月${day}日`;
  }
}
