/**
 * 模拟考试答题页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { AppConstants } from '../common/constants/AppConstants';
import { Question, QuestionType, QuestionOption } from '../common/types/QuestionTypes';
import { questionService } from '../services/QuestionService';
import {
  mockExamService,
  ExamType,
  ExamConfig,
  ExamProgress,
  ExamResult,
  getExamPreset
} from '../services/MockExamService';
import { getSubjectShortName, getSubjectColor } from '../data/SubjectData';
import { Logger } from '../common/utils/Logger';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct MockExamPage {
  @State isLoading: boolean = true;
  @State examConfig: ExamConfig | null = null;
  @State questions: Question[] = [];
  @State currentIndex: number = 0;
  @State currentQuestion: Question | null = null;  // 当前题目，用于触发UI更新
  @State userAnswers: Map<string, string> = new Map();
  @State markedIds: Set<string> = new Set();
  @State remainingTime: number = 0;
  @State showAnswerCard: boolean = false;
  @State isSubmitting: boolean = false;
  // 多选题临时选择
  @State tempMultipleAnswers: Set<string> = new Set();
  // 标记按钮动画
  @State markButtonScale: number = 1;

  private timerId: number = -1;
  private progressId: string = '';
  private startTime: number = 0;

  aboutToAppear(): void {
    this.initExam();
  }

  aboutToDisappear(): void {
    this.stopTimer();
    // 只有在未提交状态下才保存进度，避免交卷后又保存
    if (!this.isSubmitting) {
      this.saveProgressQuietly();
    }
  }

  private async initExam(): Promise<void> {
    const params: RouteParams = Router.getParams();
    const continueExam = params['continueExam'] as boolean;

    if (continueExam) {
      await this.loadSavedProgress();
    } else {
      const examType = (params['examType'] as string || 'full') as ExamType;
      const subjectId = params['subjectId'] as string;
      await this.startNewExam(examType, subjectId);
    }
  }

  private async loadSavedProgress(): Promise<void> {
    try {
      const progress = await mockExamService.loadProgress();
      if (!progress) {
        promptAction.showToast({ message: '未找到考试进度', duration: 2000 });
        Router.back();
        return;
      }

      this.progressId = progress.id;
      const preset = getExamPreset(progress.examType);
      const config: ExamConfig = {
        type: preset.type,
        questionCount: preset.questionCount,
        timeLimit: preset.timeLimit,
        scoreRules: preset.scoreRules,
        subjectId: progress.subjectId
      };
      this.examConfig = config;
      this.questions = await questionService.getQuestionsByIds(progress.questionIds);
      this.userAnswers = progress.userAnswers;
      this.markedIds = progress.markedIds;
      this.currentIndex = progress.currentIndex;
      this.setCurrentQuestion(this.currentIndex);
      this.remainingTime = progress.remainingTime;
      this.startTime = Date.now() - (this.examConfig.timeLimit - this.remainingTime) * 1000;

      // 恢复当前题目的多选状态
      this.syncTempMultipleAnswers();

      this.startTimer();
      this.isLoading = false;
    } catch (error) {
      Logger.error('[MockExamPage] Failed to load progress', error as Error);
      promptAction.showToast({ message: '加载失败', duration: 2000 });
      Router.back();
    }
  }

  private async startNewExam(examType: ExamType, subjectId?: string): Promise<void> {
    try {
      const preset = getExamPreset(examType);
      const config: ExamConfig = {
        type: preset.type,
        questionCount: preset.questionCount,
        timeLimit: preset.timeLimit,
        scoreRules: preset.scoreRules,
        subjectId: subjectId
      };
      this.examConfig = config;

      this.questions = await mockExamService.generateExam(this.examConfig);

      if (this.questions.length === 0) {
        promptAction.showToast({ message: '题库题目不足，无法开始考试', duration: 2000 });
        Router.back();
        return;
      }

      this.progressId = `progress_${Date.now()}`;
      this.remainingTime = this.examConfig.timeLimit;
      this.startTime = Date.now();
      this.userAnswers = new Map();
      this.markedIds = new Set();
      this.currentIndex = 0;
      this.setCurrentQuestion(0);

      // 清除旧进度并保存新进度
      await mockExamService.clearProgress();
      await this.saveProgress();

      this.startTimer();
      this.isLoading = false;
    } catch (error) {
      Logger.error('[MockExamPage] Failed to start exam', error as Error);
      promptAction.showToast({ message: '开始考试失败', duration: 2000 });
      Router.back();
    }
  }

  private startTimer(): void {
    this.timerId = setInterval(() => {
      if (this.remainingTime > 0) {
        this.remainingTime--;
        // 每30秒自动保存
        if (this.remainingTime % 30 === 0) {
          this.saveProgressQuietly();
        }
      } else {
        this.stopTimer();
        this.autoSubmit();
      }
    }, 1000);
  }

  private stopTimer(): void {
    if (this.timerId !== -1) {
      clearInterval(this.timerId);
      this.timerId = -1;
    }
  }

  /**
   * 设置当前题目（创建新对象引用以触发UI更新）
   */
  private setCurrentQuestion(index: number): void {
    if (index >= 0 && index < this.questions.length) {
      const q = this.questions[index];
      this.currentQuestion = {
        id: q.id,
        type: q.type,
        subjectId: q.subjectId,
        chapter: q.chapter,
        content: q.content,
        options: [...q.options],  // 复制数组
        answer: q.answer,
        analysis: q.analysis,
        difficulty: q.difficulty,
        tags: [...q.tags],  // 复制数组
        createTime: q.createTime,
        updateTime: q.updateTime
      };
    } else {
      this.currentQuestion = null;
    }
  }

  private async saveProgress(): Promise<void> {
    if (!this.examConfig) return;

    const progress: ExamProgress = {
      id: this.progressId,
      examType: this.examConfig.type,
      subjectId: this.examConfig.subjectId,
      questionIds: this.questions.map(q => q.id),
      userAnswers: this.userAnswers,
      markedIds: this.markedIds,
      currentIndex: this.currentIndex,
      remainingTime: this.remainingTime,
      createTime: this.startTime,
      updateTime: Date.now()
    };

    await mockExamService.saveProgress(progress);
  }

  private saveProgressQuietly(): void {
    this.saveProgress().catch((e: Error) => {
      Logger.error('[MockExamPage] Auto save failed', e);
    });
  }

  private syncTempMultipleAnswers(): void {
    const question = this.currentQuestion;
    if (question && question.type === QuestionType.MULTIPLE) {
      const saved = this.userAnswers.get(question.id);
      if (saved) {
        this.tempMultipleAnswers = new Set(saved.split(','));
      } else {
        this.tempMultipleAnswers = new Set();
      }
    } else {
      this.tempMultipleAnswers = new Set();
    }
  }

  private selectAnswer(optionKey: string): void {
    const question = this.currentQuestion;
    if (!question) return;

    if (question.type === QuestionType.MULTIPLE) {
      // 多选题
      if (this.tempMultipleAnswers.has(optionKey)) {
        this.tempMultipleAnswers.delete(optionKey);
      } else {
        this.tempMultipleAnswers.add(optionKey);
      }
      // 更新 Map
      const newSet = new Set(this.tempMultipleAnswers);
      this.tempMultipleAnswers = newSet;
      // 保存答案
      if (newSet.size > 0) {
        const sorted = Array.from(newSet).sort();
        this.userAnswers.set(question.id, sorted.join(','));
      } else {
        this.userAnswers.delete(question.id);
      }
    } else {
      // 单选/判断
      this.userAnswers.set(question.id, optionKey);
    }
    // 触发更新
    this.userAnswers = new Map(this.userAnswers);
  }

  private toggleMark(): void {
    const question = this.currentQuestion;
    if (!question) return;

    if (this.markedIds.has(question.id)) {
      this.markedIds.delete(question.id);
    } else {
      this.markedIds.add(question.id);
    }
    this.markedIds = new Set(this.markedIds);
  }

  private goToQuestion(index: number): void {
    if (index >= 0 && index < this.questions.length) {
      this.currentIndex = index;
      this.setCurrentQuestion(index);
      this.syncTempMultipleAnswers();
      this.showAnswerCard = false;
    }
  }

  private prevQuestion(): void {
    if (this.currentIndex > 0) {
      this.goToQuestion(this.currentIndex - 1);
    }
  }

  private nextQuestion(): void {
    if (this.currentIndex < this.questions.length - 1) {
      this.goToQuestion(this.currentIndex + 1);
    }
  }

  private confirmSubmit(): void {
    const unanswered = this.questions.length - this.userAnswers.size;
    const message = unanswered > 0
      ? `还有 ${unanswered} 题未作答，确定交卷吗？`
      : '确定要交卷吗？';

    const btn1: promptAction.Button = { text: '继续答题', color: ThemeColors.TEXT_SECONDARY };
    const btn2: promptAction.Button = { text: '确定交卷', color: ThemeColors.PRIMARY };
    const options: promptAction.ShowDialogOptions = {
      title: '交卷确认',
      message: message,
      buttons: [btn1, btn2]
    };
    promptAction.showDialog(options).then((result: promptAction.ShowDialogSuccessResponse) => {
      if (result.index === 1) {
        this.submitExam();
      }
    });
  }

  private autoSubmit(): void {
    promptAction.showToast({ message: '考试时间到，自动交卷', duration: 2000 });
    this.submitExam();
  }

  private async submitExam(): Promise<void> {
    if (this.isSubmitting || !this.examConfig) return;
    this.isSubmitting = true;
    this.stopTimer();

    try {
      // 计算成绩
      const result = mockExamService.calculateScore(this.questions, this.userAnswers, this.examConfig);
      const duration = Math.floor((Date.now() - this.startTime) / 1000);
      result.duration = duration;

      // 保存考试记录（包含完整题目数据）
      const recordId = await mockExamService.saveExamRecord(
        result,
        this.examConfig,
        this.questions.map(q => q.id),
        this.userAnswers,
        duration,
        this.questions
      );

      // 清除进度
      await mockExamService.clearProgress();

      // 跳转结果页
      const resultParams: RouteParams = {};
      resultParams['examRecordId'] = recordId as Object;
      resultParams['examResult'] = result as Object;
      resultParams['examConfig'] = this.examConfig as Object;
      Router.replace('pages/MockExamResultPage', resultParams);
    } catch (error) {
      Logger.error('[MockExamPage] Failed to submit exam', error as Error);
      promptAction.showToast({ message: '交卷失败，请重试', duration: 2000 });
      this.isSubmitting = false;
    }
  }

  private formatTime(seconds: number): string {
    const h = Math.floor(seconds / 3600);
    const m = Math.floor((seconds % 3600) / 60);
    const s = seconds % 60;
    if (h > 0) {
      return `${h.toString().padStart(2, '0')}:${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`;
    }
    return `${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`;
  }

  private getCurrentQuestion(): Question | null {
    return this.currentQuestion;
  }

  private isOptionSelected(optionKey: string): boolean {
    const question = this.currentQuestion;
    if (!question) return false;

    if (question.type === QuestionType.MULTIPLE) {
      return this.tempMultipleAnswers.has(optionKey);
    }
    return this.userAnswers.get(question.id) === optionKey;
  }

  private isOptionSelectedForQuestion(optionKey: string, questionId: string, questionType: QuestionType): boolean {
    if (questionType === QuestionType.MULTIPLE) {
      return this.tempMultipleAnswers.has(optionKey);
    }
    return this.userAnswers.get(questionId) === optionKey;
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      // 顶部背景色延伸到状态栏（绝对定位在顶部）
      Column()
        .width('100%')
        .height(AppConstants.STATUS_BAR_HEIGHT + 56)
        .backgroundColor(ThemeColors.SURFACE)
        .position({ x: 0, y: 0 })

      // 主内容区域
      Column() {
        if (this.isLoading) {
          this.LoadingState()
        } else {
          // 顶部栏
          this.TopBar()
          // 题目内容
          this.QuestionContent()
          // 底部操作栏
          this.BottomBar()
        }

        // 答题卡弹窗
        if (this.showAnswerCard) {
          this.AnswerCardDialog()
        }
      }
      .width('100%')
      .height('100%')
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(ThemeColors.BACKGROUND)
  }

  @Builder
  LoadingState() {
    Column() {
      LoadingProgress().width(48).height(48).color(ThemeColors.PRIMARY)
      Text('正在加载试卷...')
        .fontSize(14)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: 16 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  TopBar() {
    Row() {
      // 返回按钮
      Text('‹')
        .fontSize(28)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .width(40)
        .height(40)
        .textAlign(TextAlign.Center)
        .onClick(() => {
          this.saveProgressQuietly();
          Router.back();
        })

      // 进度 + 倒计时
      Row({ space: 6 }) {
        Text(`${this.currentIndex + 1} / ${this.questions.length}`)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.TEXT_PRIMARY)
        Text('🕐')
          .fontSize(14)
        Text(this.formatTime(this.remainingTime))
          .fontSize(14)
          .fontColor(this.remainingTime < 600 ? ThemeColors.ERROR : ThemeColors.TEXT_SECONDARY)
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)

      // 标记按钮
      Text(this.currentQuestion && this.markedIds.has(this.currentQuestion.id) ? '★' : '☆')
        .fontSize(24)
        .fontColor(this.currentQuestion && this.markedIds.has(this.currentQuestion.id) ? '#FFB800' : ThemeColors.TEXT_HINT)
        .width(40)
        .height(40)
        .textAlign(TextAlign.Center)
        .onClick(() => {
          if (this.currentQuestion) {
            const wasMarked = this.markedIds.has(this.currentQuestion.id);
            this.toggleMark();
            promptAction.showToast({
              message: wasMarked ? '已取消标记' : '已标记此题',
              duration: 1500
            });
          }
        })
    }
    .width('100%')
    .height(56)
    .padding({ left: 8, right: 8 })
    .backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  QuestionContent() {
    Scroll() {
      Column() {
        if (this.currentQuestion !== null && this.currentIndex >= 0) {
          // 题目标签
          Row({ space: 8 }) {
            Text(this.getQuestionTypeName(this.currentQuestion.type) + '题')
              .fontSize(12)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
              .backgroundColor(ThemeColors.PRIMARY)
              .borderRadius(12)

            Text(getSubjectShortName(this.currentQuestion.subjectId))
              .fontSize(12)
              .fontColor(ThemeColors.WHITE)
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
              .backgroundColor(getSubjectColor(this.currentQuestion.subjectId))
              .borderRadius(12)
          }
          .width('100%')

          // 题目内容
          Text(this.currentQuestion.content)
            .fontSize(17)
            .fontColor(ThemeColors.TEXT_PRIMARY)
            .lineHeight(28)
            .margin({ top: 16, bottom: 24 })
            .width('100%')

          // 选项列表
          Column({ space: 12 }) {
            ForEach(this.currentQuestion.options, (option: QuestionOption) => {
              this.OptionItem(option, this.currentQuestion!.type, this.currentQuestion!.id)
            }, (option: QuestionOption) => `${this.currentQuestion!.id}_${option.key}`)
          }
          .width('100%')
        }
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 16, bottom: 16 })
      .alignItems(HorizontalAlign.Start)
    }
    .scrollBar(BarState.Off)
    .layoutWeight(1)
    .backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  OptionItem(option: QuestionOption, questionType: QuestionType, questionId: string) {
    Row() {
      // 选项字母圆圈 - 带边框样式
      Row() {
        Text(option.key)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.isOptionSelectedForQuestion(option.key, questionId, questionType) ? ThemeColors.WHITE : ThemeColors.PRIMARY)
      }
      .width(32)
      .height(32)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(this.isOptionSelectedForQuestion(option.key, questionId, questionType) ? ThemeColors.PRIMARY : ThemeColors.SURFACE)
      .border({
        width: 1.5,
        color: ThemeColors.PRIMARY
      })
      .borderRadius(16)

      // 选项内容
      Text(option.content)
        .fontSize(15)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .margin({ left: 14 })
        .maxLines(10)
    }
    .width('100%')
    .padding({ left: 14, right: 16, top: 16, bottom: 16 })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
    .border({
      width: 1,
      color: this.isOptionSelectedForQuestion(option.key, questionId, questionType) ? ThemeColors.PRIMARY : ThemeColors.BORDER
    })
    .onClick(() => { this.selectAnswer(option.key); })
  }

  @Builder
  BottomBar() {
    Column() {
      // 答题卡入口
      Row() {
        Text('答题卡')
          .fontSize(14)
          .fontColor(ThemeColors.PRIMARY)
        Text(` (已答 ${this.userAnswers.size}/${this.questions.length})`)
          .fontSize(13)
          .fontColor(ThemeColors.TEXT_HINT)
        Text(this.showAnswerCard ? ' ▲' : ' ▼')
          .fontSize(12)
          .fontColor(ThemeColors.PRIMARY)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding({ top: 10, bottom: 8 })
      .onClick(() => { this.showAnswerCard = !this.showAnswerCard; })

      // 底部按钮
      Row({ space: 12 }) {
        // 上一题
        Button('上一题')
          .fontSize(15)
          .fontColor(this.currentIndex > 0 ? ThemeColors.PRIMARY : ThemeColors.TEXT_HINT)
          .backgroundColor(ThemeColors.BACKGROUND)
          .borderRadius(24)
          .height(44)
          .layoutWeight(1)
          .enabled(this.currentIndex > 0)
          .onClick(() => { this.prevQuestion(); })

        // 交卷按钮
        Button('交卷')
          .fontSize(15)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor('#FF6B6B')
          .borderRadius(24)
          .height(44)
          .width(80)
          .onClick(() => { this.confirmSubmit(); })

        // 下一题
        Button('下一题')
          .fontSize(15)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.PRIMARY)
          .borderRadius(24)
          .height(44)
          .layoutWeight(1)
          .onClick(() => {
            if (this.currentIndex < this.questions.length - 1) {
              this.nextQuestion();
            } else {
              this.confirmSubmit();
            }
          })
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 32 })
    }
    .width('100%')
    .backgroundColor(ThemeColors.SURFACE)
    .border({ width: { top: 1 }, color: ThemeColors.BORDER })
  }

  @Builder
  AnswerCardDialog() {
    Column() {
      // 遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.5)')
        .onClick(() => { this.showAnswerCard = false; })
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })

    Column() {
      // 标题
      Row() {
        Text('答题卡')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Blank()

        Text('✕')
          .fontSize(20)
          .fontColor(ThemeColors.TEXT_HINT)
          .onClick(() => { this.showAnswerCard = false; })
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 16, bottom: 12 })

      // 图例
      Row({ space: 16 }) {
        this.LegendItem('●', '已答', ThemeColors.PRIMARY)
        this.LegendItem('○', '未答', ThemeColors.GRAY_300)
        this.LegendItem('⚑', '标记', ThemeColors.WARNING)
      }
      .width('100%')
      .padding({ left: 20, right: 20, bottom: 12 })

      // 题号网格
      Scroll() {
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(this.questions, (question: Question, index: number) => {
            this.AnswerCardItem(question, index)
          }, (question: Question, index: number) => `${question.id}_${index}`)
        }
        .width('100%')
        .padding({ left: 16, right: 16 })
      }
      .scrollBar(BarState.Off)
      .layoutWeight(1)
    }
    .width('100%')
    .height('50%')
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius({ topLeft: 20, topRight: 20 })
    .position({ x: 0, y: '50%' })
  }

  @Builder
  LegendItem(icon: string, label: string, color: ResourceColor) {
    Row({ space: 4 }) {
      Text(icon)
        .fontSize(14)
        .fontColor(color)
      Text(label)
        .fontSize(12)
        .fontColor(ThemeColors.TEXT_SECONDARY)
    }
  }

  @Builder
  AnswerCardItem(question: Question, index: number) {
    Column() {
      Text(`${index + 1}`)
        .fontSize(13)
        .fontColor(this.getCardItemColor(question))
    }
    .width(40)
    .height(40)
    .margin(4)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.getCardItemBgColor(question))
    .borderRadius(8)
    .border({
      width: this.currentIndex === index ? 2 : 1,
      color: this.currentIndex === index ? ThemeColors.PRIMARY : ThemeColors.BORDER
    })
    .onClick(() => { this.goToQuestion(index); })
  }

  private getCardItemColor(question: Question): ResourceColor {
    if (this.userAnswers.has(question.id)) {
      return ThemeColors.WHITE;
    }
    if (this.markedIds.has(question.id)) {
      return ThemeColors.WARNING;
    }
    return ThemeColors.TEXT_SECONDARY;
  }

  private getCardItemBgColor(question: Question): ResourceColor {
    if (this.userAnswers.has(question.id)) {
      return ThemeColors.PRIMARY;
    }
    if (this.markedIds.has(question.id)) {
      return '#FFF7E6';
    }
    return ThemeColors.SURFACE;
  }

  private getQuestionTypeName(type: QuestionType): string {
    switch (type) {
      case QuestionType.SINGLE: return '单选';
      case QuestionType.MULTIPLE: return '多选';
      case QuestionType.JUDGE: return '判断';
      default: return '其他';
    }
  }
}
