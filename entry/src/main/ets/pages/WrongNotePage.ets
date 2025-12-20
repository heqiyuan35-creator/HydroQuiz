/**
 * 错题笔记页面
 * HydroQuiz - 水利工程检测员刷题宝
 * 独立的笔记管理模块，支持文本编辑、语音录入
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import { Question, WrongQuestion } from '../common/types/QuestionTypes';
import { questionService } from '../services/QuestionService';
import { answerRecordService } from '../services/AnswerRecordService';
import { getSubjectShortName, getSubjectColor } from '../data/SubjectData';
import { Logger } from '../common/utils/Logger';
import { speechRecognitionService, SpeechRecognitionCallback } from '../services/SpeechRecognitionService';
import { textRecognitionService, TextRecognitionCallback } from '../services/TextRecognitionService';
import { abilityAccessCtrl, common, Permissions } from '@kit.AbilityKit';
import { promptAction, curves } from '@kit.ArkUI';

// 入场动画常量
const ENTRY_INTERVAL: number = 30;
const ENTRY_DURATION: number = 300;
const DELETE_ZONE_HEIGHT: number = 100;

/**
 * 笔记项 - 使用 @Observed 实现状态追踪
 */
@Observed
class NoteItem {
  wrong: WrongQuestion;
  question: Question;
  // 动画状态
  scaleVal: number = 1;
  opacityVal: number = 1;
  translateX: number = 0;
  translateY: number = 0;

  constructor(wrong: WrongQuestion, question: Question) {
    this.wrong = wrong;
    this.question = question;
  }

  hasNote(): boolean {
    return this.wrong.note !== undefined && this.wrong.note !== null && this.wrong.note.length > 0;
  }
}

/**
 * 笔记项动画包装组件
 */
@Component
struct NoteItemAnimWrapper {
  @ObjectLink item: NoteItem;
  @Prop index: number = 0;
  @Prop isDragging: boolean = false;
  @BuilderParam content: () => void;

  build() {
    Column() {
      if (this.content) {
        this.content()
      }
    }
    .translate({ x: this.item.translateX, y: this.item.translateY })
    .scale({ x: this.item.scaleVal, y: this.item.scaleVal })
    .opacity(this.item.opacityVal)
    .zIndex(this.isDragging ? 999 : 0)
    .transition(
      TransitionEffect.OPACITY
        .combine(TransitionEffect.scale({ x: 0.8, y: 0.8 }))
        .animation({ duration: ENTRY_DURATION, curve: Curve.Friction, delay: ENTRY_INTERVAL * this.index })
    )
  }
}

@Entry
@Component
struct WrongNotePage {
  @State isLoading: boolean = true;
  @State noteItems: NoteItem[] = [];
  @State allWrongItems: NoteItem[] = [];
  @State filterMode: string = 'all';
  @State selectedItem: NoteItem | null = null;
  @State showNoteEditor: boolean = false;
  @State editingNote: string = '';
  @State isSaving: boolean = false;
  @State showList: boolean = false;
  // 语音录入相关状态
  @State isRecording: boolean = false;
  @State recordingText: string = '';
  @State hasMicPermission: boolean = false;
  // 统计数据
  @State notesCount: number = 0;
  // OCR 识别相关
  @State isRecognizing: boolean = false;
  // 拖拽删除相关
  @State isDragging: boolean = false;
  @State draggingItemId: string = '';
  @State isInDeleteZone: boolean = false;
  @State showDeleteZone: boolean = false;
  @State deleteZoneScale: number = 1;


  aboutToAppear(): void {
    this.loadData();
    this.checkMicPermission();
  }

  onPageShow(): void {
    this.loadData();
  }

  aboutToDisappear(): void {
    if (this.isRecording) {
      speechRecognitionService.cancelRecording();
    }
    speechRecognitionService.shutdown();
    textRecognitionService.release();
  }

  private async checkMicPermission(): Promise<void> {
    try {
      const atManager = abilityAccessCtrl.createAtManager();
      const context = getContext(this) as common.UIAbilityContext;
      const bundleInfo = context.applicationInfo;
      const tokenId = bundleInfo.accessTokenId;
      const grantStatus = atManager.checkAccessTokenSync(tokenId, 'ohos.permission.MICROPHONE');
      this.hasMicPermission = grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
    } catch (error) {
      Logger.error('[WrongNotePage] Check mic permission error', error as Error);
      this.hasMicPermission = false;
    }
  }

  private async requestMicPermission(): Promise<boolean> {
    const permissions: Permissions[] = ['ohos.permission.MICROPHONE'];
    const atManager = abilityAccessCtrl.createAtManager();
    const context = getContext(this) as common.UIAbilityContext;
    try {
      const result = await atManager.requestPermissionsFromUser(context, permissions);
      const grantStatus = result.authResults[0];
      this.hasMicPermission = grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      return this.hasMicPermission;
    } catch (error) {
      Logger.error('[WrongNotePage] Request mic permission error', error as Error);
      return false;
    }
  }

  private async startVoiceInput(): Promise<void> {
    if (!this.hasMicPermission) {
      const granted = await this.requestMicPermission();
      if (!granted) {
        promptAction.showToast({ message: '需要麦克风权限才能使用语音录入', duration: 2000 });
        return;
      }
    }
    this.recordingText = '';
    const callback: SpeechRecognitionCallback = {
      onStart: () => { Logger.info('[WrongNotePage] Voice recording started'); },
      onResult: (text: string, isFinal: boolean) => {
        this.recordingText = text;
      },
      onComplete: (text: string) => {
        this.isRecording = false;
        if (text && text.length > 0) {
          this.editingNote = this.editingNote.length > 0 ? this.editingNote + '\n' + text : text;
          promptAction.showToast({ message: '语音识别完成', duration: 1500 });
        }
        this.recordingText = '';
      },
      onError: (errorCode: number, errorMessage: string) => {
        this.isRecording = false;
        this.recordingText = '';
        promptAction.showToast({ message: `语音识别失败: ${errorMessage}`, duration: 2000 });
      }
    };
    const started = await speechRecognitionService.startRecording(callback);
    if (started) {
      this.isRecording = true;
    } else {
      promptAction.showToast({ message: '启动语音识别失败', duration: 2000 });
    }
  }

  private stopVoiceInput(): void {
    speechRecognitionService.stopRecording();
  }

  /**
   * 拍照识别文字
   */
  private async startOcrRecognition(): Promise<void> {
    if (this.isRecognizing) {
      return;
    }
    this.isRecognizing = true;
    promptAction.showToast({ message: '请选择图片...', duration: 1500 });

    const callback: TextRecognitionCallback = {
      onSuccess: (text: string) => {
        this.isRecognizing = false;
        if (text && text.length > 0) {
          // 将识别结果追加到笔记
          if (this.editingNote.length > 0) {
            this.editingNote = this.editingNote + '\n' + text;
          } else {
            this.editingNote = text;
          }
          promptAction.showToast({ message: '文字识别成功', duration: 1500 });
        }
      },
      onError: (errorCode: number, errorMessage: string) => {
        this.isRecognizing = false;
        if (errorCode !== 1001) { // 1001 是未选择图片，不提示
          promptAction.showToast({ message: `识别失败: ${errorMessage}`, duration: 2000 });
        }
      }
    };

    await textRecognitionService.selectAndRecognize(callback);
  }

  private async loadData(): Promise<void> {
    try {
      const wrongList = await answerRecordService.getWrongQuestions();
      const items: NoteItem[] = [];
      for (const wrong of wrongList) {
        const question = await questionService.getQuestionById(wrong.questionId);
        if (question) {
          items.push(new NoteItem(wrong, question));
        }
      }
      this.allWrongItems = items;
      this.applyFilter();
    } catch (error) {
      Logger.error('[WrongNotePage] Failed to load data', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  private applyFilter(): void {
    this.notesCount = this.allWrongItems.filter((item: NoteItem) => item.hasNote()).length;
    if (this.filterMode === 'hasNote') {
      this.noteItems = this.allWrongItems.filter((item: NoteItem) => item.hasNote());
    } else {
      this.noteItems = [...this.allWrongItems];
    }
    // 触发入场动画
    this.showList = false;
    setTimeout(() => {
      this.triggerEntryAnimation();
    }, 50);
  }

  private triggerEntryAnimation(): void {
    if (this.noteItems.length === 0) return;
    this.getUIContext()?.animateTo({
      duration: ENTRY_DURATION + ENTRY_INTERVAL * (this.noteItems.length - 1),
      curve: Curve.Friction
    }, () => {
      this.showList = true;
    });
  }

  private openNoteEditor(item: NoteItem): void {
    this.selectedItem = item;
    this.editingNote = item.wrong.note || '';
    this.showNoteEditor = true;
  }

  private closeNoteEditor(): void {
    this.showNoteEditor = false;
    this.selectedItem = null;
    this.editingNote = '';
  }

  private async saveNote(): Promise<void> {
    if (!this.selectedItem) return;
    this.isSaving = true;
    try {
      await answerRecordService.updateWrongQuestionNote(this.selectedItem.question.id, this.editingNote);
      const index = this.allWrongItems.findIndex((item: NoteItem) => item.question.id === this.selectedItem!.question.id);
      if (index >= 0) {
        this.allWrongItems[index].wrong.note = this.editingNote;
      }
      this.applyFilter();
      this.closeNoteEditor();
      promptAction.showToast({ message: '笔记保存成功', duration: 1500 });
    } catch (error) {
      Logger.error('[WrongNotePage] Failed to save note', error as Error);
      promptAction.showToast({ message: '保存失败，请重试', duration: 2000 });
    } finally {
      this.isSaving = false;
    }
  }

  /**
   * 删除笔记并播放动画（点击删除按钮）
   */
  private async deleteNoteWithAnimation(item: NoteItem): Promise<void> {
    this.getUIContext()?.animateTo({
      duration: 300,
      curve: Curve.EaseIn
    }, () => {
      item.scaleVal = 0;
      item.opacityVal = 0;
    });
    setTimeout(async () => {
      await answerRecordService.updateWrongQuestionNote(item.question.id, '');
      item.wrong.note = '';
      // 重置动画状态
      item.scaleVal = 1;
      item.opacityVal = 1;
      this.applyFilter();
      promptAction.showToast({ message: '笔记已删除', duration: 1500 });
    }, 300);
  }

  /**
   * 开始拖拽
   */
  private startDragging(item: NoteItem): void {
    this.isDragging = true;
    this.draggingItemId = item.question.id;
    this.showDeleteZone = true;
    this.deleteZoneScale = 1;
  }

  /**
   * 拖拽删除项目
   */
  private async deleteItemByDrag(item: NoteItem): Promise<void> {
    this.getUIContext()?.animateTo({
      duration: 300,
      curve: Curve.EaseIn
    }, () => {
      item.scaleVal = 0;
      item.opacityVal = 0;
    });
    setTimeout(async () => {
      await answerRecordService.updateWrongQuestionNote(item.question.id, '');
      item.wrong.note = '';
      item.scaleVal = 1;
      item.opacityVal = 1;
      item.translateX = 0;
      item.translateY = 0;
      this.applyFilter();
      promptAction.showToast({ message: '笔记已删除', duration: 1500 });
    }, 300);
  }


  build() {
    Stack() {
      Column() {
        this.NavigationBar()
        if (this.isLoading) {
          this.LoadingState()
        } else if (this.allWrongItems.length === 0) {
          this.EmptyState()
        } else {
          this.FilterBar()
          this.NoteList()
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor(ThemeColors.BACKGROUND)
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT })

      if (this.showNoteEditor) {
        this.NoteEditorPanel()
      }

      // 拖拽删除区域
      if (this.showDeleteZone) {
        this.DeleteZone()
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  DeleteZone() {
    Column() {
      Image(this.isInDeleteZone ? $r('app.media.Selectanddelete') : $r('app.media.delete'))
        .width(this.isInDeleteZone ? 48 : 36)
        .height(this.isInDeleteZone ? 48 : 36)
        .fillColor(this.isInDeleteZone ? ThemeColors.ERROR : ThemeColors.TEXT_HINT)
        .animation({ duration: 200, curve: Curve.EaseOut })

      Text(this.isInDeleteZone ? '松手删除' : '拖到这里删除')
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(this.isInDeleteZone ? ThemeColors.ERROR : ThemeColors.TEXT_HINT)
        .margin({ top: 8 })
    }
    .width('100%')
    .height(DELETE_ZONE_HEIGHT)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.isInDeleteZone ? 'rgba(255, 77, 79, 0.15)' : 'rgba(0, 0, 0, 0.05)')
    .border({ width: { top: 1 }, color: this.isInDeleteZone ? ThemeColors.ERROR : ThemeColors.BORDER })
    .position({ x: 0, y: '100%' })
    .translate({ y: -DELETE_ZONE_HEIGHT })
    .scale({ x: this.deleteZoneScale, y: this.deleteZoneScale })
    .animation({ duration: 200, curve: Curve.EaseOut })
  }

  @Builder
  NavigationBar() {
    Row() {
      Row() {
        Image($r('app.media.back'))
          .width(24)
          .height(24)
      }
      .width(48)
      .height(48)
      .justifyContent(FlexAlign.Center)
      .onClick(() => { Router.back(); })

      Text('错题笔记')
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
  FilterBar() {
    Row({ space: 12 }) {
      this.FilterChip('all', `全部 ${this.allWrongItems.length}`)
      this.FilterChip('hasNote', `有笔记 ${this.notesCount}`)
      Blank()
      Text(`覆盖率 ${this.allWrongItems.length > 0 ? Math.round(this.notesCount / this.allWrongItems.length * 100) : 0}%`)
        .fontSize(12)
        .fontColor(ThemeColors.TEXT_HINT)
    }
    .width('100%')
    .padding({ left: 16, right: 16, top: 10, bottom: 10 })
    .backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  FilterChip(mode: string, label: string) {
    Text(label)
      .fontSize(13)
      .fontColor(this.filterMode === mode ? ThemeColors.WHITE : ThemeColors.TEXT_SECONDARY)
      .padding({ left: 14, right: 14, top: 6, bottom: 6 })
      .backgroundColor(this.filterMode === mode ? ThemeColors.PRIMARY : ThemeColors.GRAY_100)
      .borderRadius(16)
      .onClick(() => {
        if (this.filterMode !== mode) {
          this.filterMode = mode;
          this.applyFilter();
        }
      })
  }

  @Builder
  LoadingState() {
    Column() {
      LoadingProgress().width(48).height(48).color(ThemeColors.PRIMARY)
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  EmptyState() {
    Column() {
      Text('📝').fontSize(64)
      Text('暂无错题')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ top: 16 })
      Text('做错的题目会出现在这里，你可以为它们添加笔记')
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: 8 })
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  NoteList() {
    if (this.noteItems.length === 0) {
      Column() {
        Text('🔍').fontSize(48)
        Text('没有找到有笔记的错题')
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .margin({ top: 12 })
        Text('查看全部')
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.PRIMARY)
          .margin({ top: 8 })
          .onClick(() => {
            this.filterMode = 'all';
            this.applyFilter();
          })
      }
      .width('100%')
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
    } else {
      Scroll() {
        Column() {
          if (this.showList) {
            ForEach(this.noteItems, (item: NoteItem, index: number) => {
              NoteItemAnimWrapper({
                item: item,
                index: index,
                isDragging: this.isDragging && this.draggingItemId === item.question.id,
                content: () => { this.NoteCard(item) }
              })
            }, (item: NoteItem) => item.question.id)
          }
        }
        .width('100%')
        .transition(TransitionEffect.opacity(0.99))
      }
      .scrollBar(BarState.Off)
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16, top: 8, bottom: 16 })
      .align(Alignment.Top)
      .transition(TransitionEffect.opacity(0.99))
    }
  }


  @Builder
  NoteCard(item: NoteItem) {
    Column() {
      // 第一行：科目 + 错误次数 + 操作
      Row() {
        Text(getSubjectShortName(item.question.subjectId))
          .fontSize(11)
          .fontColor(ThemeColors.WHITE)
          .padding({ left: 8, right: 8, top: 2, bottom: 2 })
          .backgroundColor(getSubjectColor(item.question.subjectId))
          .borderRadius(8)

        Text(`错${item.wrong.wrongCount}次`)
          .fontSize(11)
          .fontColor(ThemeColors.ERROR)
          .margin({ left: 6 })

        Blank()

        if (item.hasNote()) {
          Text('✓')
            .fontSize(11)
            .fontColor(ThemeColors.SUCCESS)
        }

        Text(item.hasNote() ? '编辑' : '写笔记')
          .fontSize(12)
          .fontColor(ThemeColors.PRIMARY)
          .margin({ left: 6 })
          .onClick(() => { this.openNoteEditor(item); })
      }
      .width('100%')

      // 题目内容
      Text(item.question.content)
        .fontSize(13)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ top: 8 })

      // 笔记预览
      if (item.hasNote()) {
        Row() {
          Text(`📝 ${item.wrong.note}`)
            .fontSize(12)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .layoutWeight(1)
        }
        .width('100%')
        .margin({ top: 6 })
        .padding(8)
        .backgroundColor('#F0FDF4')
        .borderRadius(6)
      }

      // 底部提示
      if (item.hasNote()) {
        Text('💡 长按拖拽可删除笔记')
          .fontSize(10)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ top: 6 })
      }
    }
    .width('100%')
    .padding(12)
    .margin({ bottom: 10 })
    .backgroundColor(item.hasNote() ? '#FAFFFE' : ThemeColors.SURFACE)
    .borderRadius(10)
    .border({
      width: { left: 4, top: 1, right: 1, bottom: 1 },
      color: {
        left: item.hasNote() ? ThemeColors.SUCCESS : ThemeColors.GRAY_300,
        top: item.hasNote() ? '#D1FAE5' : ThemeColors.BORDER,
        right: item.hasNote() ? '#D1FAE5' : ThemeColors.BORDER,
        bottom: item.hasNote() ? '#D1FAE5' : ThemeColors.BORDER
      }
    })
    .gesture(
      GestureGroup(GestureMode.Sequence,
        LongPressGesture({ repeat: false, duration: 500 })
          .onAction(() => {
            if (item.hasNote()) {
              this.startDragging(item);
            }
          }),
        PanGesture({ fingers: 1, direction: PanDirection.All, distance: 1 })
          .onActionUpdate((event: GestureEvent) => {
            if (this.isDragging && this.draggingItemId === item.question.id) {
              item.translateX = event.offsetX;
              item.translateY = event.offsetY;
              const wasInDeleteZone = this.isInDeleteZone;
              this.isInDeleteZone = event.offsetY > 150;
              if (this.isInDeleteZone !== wasInDeleteZone) {
                this.getUIContext()?.animateTo({ curve: curves.springMotion() }, () => {
                  this.deleteZoneScale = this.isInDeleteZone ? 1.1 : 1;
                });
              }
            }
          })
          .onActionEnd(() => {
            if (this.isDragging) {
              if (this.isInDeleteZone) {
                this.deleteItemByDrag(item);
              } else {
                this.getUIContext()?.animateTo({ curve: curves.springMotion() }, () => {
                  item.translateX = 0;
                  item.translateY = 0;
                });
              }
              this.isDragging = false;
              this.draggingItemId = '';
              this.isInDeleteZone = false;
              this.showDeleteZone = false;
            }
          })
          .onActionCancel(() => {
            this.getUIContext()?.animateTo({ curve: curves.springMotion() }, () => {
              item.translateX = 0;
              item.translateY = 0;
            });
            this.isDragging = false;
            this.draggingItemId = '';
            this.isInDeleteZone = false;
            this.showDeleteZone = false;
          })
      )
    )
  }

  @Builder
  NoteEditorPanel() {
    Column() {
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0, 0, 0, 0.5)')
        .onClick(() => { this.closeNoteEditor(); })
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })

    Column() {
      Row() {
        Column().width(40).height(4).backgroundColor(ThemeColors.GRAY_300).borderRadius(2)
      }
      .width('100%')
      .padding({ top: 12, bottom: 8 })
      .justifyContent(FlexAlign.Center)

      Row() {
        Text('取消')
          .fontSize(15)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .onClick(() => { this.closeNoteEditor(); })

        Text('编辑笔记')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Text(this.isSaving ? '保存中' : '保存')
          .fontSize(15)
          .fontColor(this.isSaving ? ThemeColors.TEXT_HINT : ThemeColors.PRIMARY)
          .fontWeight(FontWeight.Medium)
          .onClick(() => { if (!this.isSaving) { this.saveNote(); } })
      }
      .width('100%')
      .padding({ left: 16, right: 16 })

      if (this.selectedItem) {
        Row() {
          Text(getSubjectShortName(this.selectedItem.question.subjectId))
            .fontSize(11)
            .fontColor(ThemeColors.WHITE)
            .padding({ left: 8, right: 8, top: 2, bottom: 2 })
            .backgroundColor(getSubjectColor(this.selectedItem.question.subjectId))
            .borderRadius(8)

          Text(this.selectedItem.question.content)
            .fontSize(13)
            .fontColor(ThemeColors.TEXT_SECONDARY)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .layoutWeight(1)
            .margin({ left: 8 })
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 12 })
      }

      Column() {
        TextArea({ text: this.editingNote, placeholder: '记录你的学习心得、易错点、解题技巧...' })
          .width('100%')
          .height(180)
          .fontSize(15)
          .backgroundColor(ThemeColors.GRAY_50)
          .borderRadius(12)
          .padding(14)
          .onChange((value: string) => { this.editingNote = value; })

        if (this.isRecording) {
          Column() {
            Row({ space: 8 }) {
              Circle().width(8).height(8).fill(ThemeColors.ERROR)
              Text('正在录音...').fontSize(14).fontColor(ThemeColors.ERROR)
            }
            if (this.recordingText.length > 0) {
              Text(this.recordingText)
                .fontSize(14)
                .fontColor(ThemeColors.TEXT_SECONDARY)
                .margin({ top: 8 })
                .maxLines(2)
            }
            Button('停止录音')
              .fontSize(14)
              .fontColor(ThemeColors.WHITE)
              .backgroundColor(ThemeColors.ERROR)
              .borderRadius(20)
              .margin({ top: 12 })
              .onClick(() => { this.stopVoiceInput(); })
          }
          .width('100%')
          .padding(12)
          .margin({ top: 12 })
          .backgroundColor(ThemeColors.GRAY_50)
          .borderRadius(12)
        }

        Row({ space: 24 }) {
          // 拍照识别
          Column() {
            Text(this.isRecognizing ? '⏳' : '📷').fontSize(22)
            Text(this.isRecognizing ? '识别中' : '拍照识别')
              .fontSize(11)
              .fontColor(this.isRecognizing ? ThemeColors.WARNING : ThemeColors.PRIMARY)
              .margin({ top: 4 })
          }
          .onClick(() => {
            if (!this.isRecognizing) {
              this.startOcrRecognition();
            }
          })

          // 语音录入
          Column() {
            Text(this.isRecording ? '🔴' : '🎤').fontSize(22)
            Text(this.isRecording ? '录音中' : '语音录入')
              .fontSize(11)
              .fontColor(this.isRecording ? ThemeColors.ERROR : ThemeColors.PRIMARY)
              .margin({ top: 4 })
          }
          .onClick(() => {
            if (!this.isRecording) { this.startVoiceInput(); }
            else { this.stopVoiceInput(); }
          })
        }
        .width('100%')
        .margin({ top: 16 })
        .justifyContent(FlexAlign.Start)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 16, bottom: 32 })
    }
    .width('100%')
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius({ topLeft: 20, topRight: 20 })
    .position({ x: 0, y: '40%' })
  }
}
