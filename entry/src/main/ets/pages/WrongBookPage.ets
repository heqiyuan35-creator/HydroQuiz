/**
 * 错题本页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { answerRecordService, TodayStatistics } from '../services/AnswerRecordService';
import { questionService } from '../services/QuestionService';
import { WrongQuestion, Question, AnswerRecord } from '../common/types/QuestionTypes';
import { getSubjectShortName, getSubjectColor, SUBJECT_LIST } from '../data/SubjectData';
import { SubjectInfo } from '../common/types/QuestionTypes';
import { Logger } from '../common/utils/Logger';
import { curves, AnimatorOptions, AnimatorResult } from '@kit.ArkUI';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 错题显示项 - 使用 @Observed 实现单项状态追踪
 */
@Observed
class WrongQuestionItem {
  wrong: WrongQuestion;
  question: Question;
  // 动画状态
  translateX: number = 0;
  translateY: number = 0;
  scaleVal: number = 1;
  rotateAngle: number = 0;
  opacityVal: number = 1;
  // 选中状态
  isSelected: boolean = false;

  constructor(wrong: WrongQuestion, question: Question) {
    this.wrong = wrong;
    this.question = question;
  }
}

// 入场动画常量
const ENTRY_INTERVAL: number = 30; // 每个元素的延迟间隔
const ENTRY_DURATION: number = 300; // 入场动画时长

// 排序选项
interface SortOption {
  id: string;
  name: string;
}

const SORT_OPTIONS: SortOption[] = [
  { id: 'time_desc', name: '最近错误' },
  { id: 'time_asc', name: '最早错误' },
  { id: 'count_desc', name: '错误最多' },
  { id: 'count_asc', name: '错误最少' }
];

// 删除区域配置
const DELETE_ZONE_HEIGHT: number = 100; // 删除区域高度
const DELETE_ZONE_THRESHOLD: number = 0.7; // 屏幕高度比例，超过此位置进入删除区域

/**
 * 错题项包装组件 - 用于追踪动画状态
 */
@Component
struct WrongItemAnimWrapper {
  @ObjectLink item: WrongQuestionItem;
  @Prop index: number = 0;
  @Prop isDragging: boolean = false;
  @BuilderParam content: () => void;

  build() {
    Column() {
      if (this.content) {
        this.content()
      }
    }
    // 飞走/拖拽动画：使用显式动画属性
    .translate({ x: this.item.translateX, y: this.item.translateY })
    .scale({ x: this.item.scaleVal, y: this.item.scaleVal })
    .rotate({ angle: this.item.rotateAngle })
    .opacity(this.item.opacityVal)
    // 拖拽时提升层级
    .zIndex(this.isDragging ? 999 : 0)
    // 入场动画：使用 transition
    .transition(
      TransitionEffect.OPACITY
        .combine(TransitionEffect.scale({ x: 0.5, y: 0.5 }))
        .animation({ duration: ENTRY_DURATION, curve: Curve.Friction, delay: ENTRY_INTERVAL * this.index })
    )
  }
}

@Entry
@Component
struct WrongBookPage {
  @State isDarkMode: boolean = false;
  @State isLoading: boolean = true;
  @State wrongItems: WrongQuestionItem[] = [];
  @State allWrongItems: WrongQuestionItem[] = []; // 原始数据（用于筛选）
  @State filterMode: string = 'all'; // 'all' | 'today'
  @State pageTitle: string = '错题本';
  @State showList: boolean = false; // 控制列表入场动画
  @State selectedSubject: string = 'all'; // 科目筛选
  @State selectedSort: string = 'time_desc'; // 排序方式
  @State showFilterPanel: boolean = false; // 显示筛选面板
  @State isSelectMode: boolean = false; // 多选模式
  @State selectedCount: number = 0; // 选中数量

  // 拖拽删除相关状态
  @State isDragging: boolean = false; // 是否正在拖拽
  @State draggingItemId: string = ''; // 正在拖拽的项目ID
  @State isInDeleteZone: boolean = false; // 是否在删除区域
  @State showDeleteZone: boolean = false; // 是否显示删除区域
  @State deleteZoneScale: number = 1; // 删除区域缩放

  // 记录当前正在练习的题目ID
  private currentPracticeQuestionId: string = '';
  // 是否从答题页返回（用于判断是否需要入场动画）
  private isReturningFromPractice: boolean = false;

  aboutToAppear(): void {
    // 获取路由参数
    const params: RouteParams = Router.getParams();
    if (params['filter'] === 'today') {
      this.filterMode = 'today';
      this.pageTitle = '今日错题';
    }
    this.loadWrongQuestions();
  }

  onPageShow(): void {
    // 页面显示时检查是否有题目需要处理
    if (this.currentPracticeQuestionId) {
      this.isReturningFromPractice = true;
      this.checkAnswerResult(this.currentPracticeQuestionId);
      this.currentPracticeQuestionId = '';
    } else {
      // 普通刷新
      this.loadWrongQuestions();
    }
  }

  /**
   * 检查答题结果
   */
  private async checkAnswerResult(questionId: string): Promise<void> {
    try {
      // 获取该题目最新的答题记录
      const records = await answerRecordService.getRecordsByQuestionId(questionId);
      if (records.length > 0) {
        const latestRecord = records[0]; // 最新的记录
        if (latestRecord.isCorrect) {
          // 答对了，触发飞走动画并删除
          this.flyAwayAndRemove(questionId);
        } else {
          // 答错了，刷新列表（错误次数已在答题时更新）
          this.loadWrongQuestions();
        }
      }
    } catch (error) {
      Logger.error('[WrongBookPage] Failed to check answer result', error as Error);
      this.loadWrongQuestions();
    }
  }

  /**
   * 触发飞走动画并删除题目
   * 动画效果：先向右移动80px，再向左滑出屏幕
   */
  private async flyAwayAndRemove(questionId: string): Promise<void> {
    // 标记为已掌握
    await answerRecordService.markAsMastered(questionId);

    // 找到要飞走的元素
    const targetItem = this.wrongItems.find((i: WrongQuestionItem) => i.question.id === questionId);
    if (!targetItem) return;

    // 阶段1：向右移动80px（弹性效果）
    const phase1Duration = 300;
    const phase2Duration = 400;
    const rightOffset = 80;
    const leftOffset = -500; // 向左滑出屏幕

    // 创建动画器实现两阶段动画
    const animatorOption: AnimatorOptions = {
      duration: phase1Duration + phase2Duration,
      delay: 0,
      easing: 'linear',
      iterations: 1,
      fill: 'forwards',
      direction: 'normal',
      begin: 0,
      end: 100 // 用百分比控制进度
    };

    const animator: AnimatorResult | undefined = this.getUIContext()?.createAnimator(animatorOption);
    if (!animator) return;

    animator.onFrame = (progress: number) => {
      // progress: 0 -> 100
      const phase1End = (phase1Duration / (phase1Duration + phase2Duration)) * 100; // 约42.8

      if (progress <= phase1End) {
        // 阶段1：向右移动，使用缓出效果
        const phase1Progress = progress / phase1End; // 0 -> 1
        const easeOut = 1 - Math.pow(1 - phase1Progress, 3); // cubic ease out
        targetItem.translateX = rightOffset * easeOut;
        targetItem.opacityVal = 1;
      } else {
        // 阶段2：向左滑出
        const phase2Progress = (progress - phase1End) / (100 - phase1End); // 0 -> 1
        const easeIn = Math.pow(phase2Progress, 2); // quadratic ease in
        targetItem.translateX = rightOffset + (leftOffset - rightOffset) * easeIn;
        targetItem.opacityVal = 1 - phase2Progress * 0.5; // 逐渐变淡
      }
    };

    animator.onFinish = () => {
      // 动画完成后从列表中移除
      this.wrongItems = this.wrongItems.filter((i: WrongQuestionItem) => i.question.id !== questionId);
    };

    // 播放动画
    animator.play();
  }

  /**
   * 加载错题列表
   */
  private async loadWrongQuestions(): Promise<void> {
    try {
      let wrongList: WrongQuestion[];

      if (this.filterMode === 'today') {
        wrongList = await answerRecordService.getTodayWrongQuestions();
      } else {
        wrongList = await answerRecordService.getWrongQuestions();
      }

      const items: WrongQuestionItem[] = [];

      for (const wrong of wrongList) {
        const question = await questionService.getQuestionById(wrong.questionId);
        if (question) {
          items.push(new WrongQuestionItem(wrong, question));
        }
      }

      // 保存原始数据
      this.allWrongItems = items;
      Logger.info(`[WrongBookPage] Loaded ${items.length} wrong questions (filter: ${this.filterMode})`);

      // 应用筛选和排序
      this.applyFilterAndSort();
    } catch (error) {
      Logger.error('[WrongBookPage] Failed to load wrong questions', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  /**
   * 触发入场动画
   */
  private triggerEntryAnimation(): void {
    const itemCount = this.wrongItems.length;
    if (itemCount === 0) return;

    this.getUIContext()?.animateTo({
      duration: ENTRY_DURATION + ENTRY_INTERVAL * (itemCount - 1),
      curve: Curve.Friction
    }, () => {
      this.showList = true;
    });
  }

  /**
   * 应用筛选和排序
   */
  private applyFilterAndSort(): void {
    let filtered = [...this.allWrongItems];

    // 科目筛选
    if (this.selectedSubject !== 'all') {
      filtered = filtered.filter((item: WrongQuestionItem) => item.question.subjectId === this.selectedSubject);
    }

    // 排序
    filtered.sort((a: WrongQuestionItem, b: WrongQuestionItem) => {
      switch (this.selectedSort) {
        case 'time_desc':
          return b.wrong.lastWrongTime - a.wrong.lastWrongTime;
        case 'time_asc':
          return a.wrong.lastWrongTime - b.wrong.lastWrongTime;
        case 'count_desc':
          return b.wrong.wrongCount - a.wrong.wrongCount;
        case 'count_asc':
          return a.wrong.wrongCount - b.wrong.wrongCount;
        default:
          return 0;
      }
    });

    this.showList = false;
    this.wrongItems = filtered;

    setTimeout(() => {
      this.triggerEntryAnimation();
    }, 50);
  }

  /**
   * 切换科目筛选
   */
  private selectSubject(subjectId: string): void {
    if (this.selectedSubject === subjectId) return;
    this.selectedSubject = subjectId;
    this.applyFilterAndSort();
  }

  /**
   * 切换排序方式
   */
  private selectSort(sortId: string): void {
    if (this.selectedSort === sortId) return;
    this.selectedSort = sortId;
    this.applyFilterAndSort();
  }

  /**
   * 获取科目错题数量
   */
  private getSubjectCount(subjectId: string): number {
    if (subjectId === 'all') {
      return this.allWrongItems.length;
    }
    return this.allWrongItems.filter((item: WrongQuestionItem) => item.question.subjectId === subjectId).length;
  }

  /**
   * 获取当前排序名称
   */
  private getSortName(): string {
    const option = SORT_OPTIONS.find((o: SortOption) => o.id === this.selectedSort);
    return option ? option.name : '排序';
  }

  /**
   * 循环切换排序选项
   */
  private cycleSortOption(): void {
    const currentIndex = SORT_OPTIONS.findIndex((o: SortOption) => o.id === this.selectedSort);
    const nextIndex = (currentIndex + 1) % SORT_OPTIONS.length;
    this.selectSort(SORT_OPTIONS[nextIndex].id);
  }

  /**
   * 进入多选模式
   */
  private enterSelectMode(): void {
    this.isSelectMode = true;
    this.selectedCount = 0;
    this.wrongItems.forEach((item: WrongQuestionItem) => {
      item.isSelected = false;
    });
  }

  /**
   * 退出多选模式
   */
  private exitSelectMode(): void {
    this.isSelectMode = false;
    this.selectedCount = 0;
    this.wrongItems.forEach((item: WrongQuestionItem) => {
      item.isSelected = false;
    });
  }

  /**
   * 切换选中状态
   */
  private toggleSelect(item: WrongQuestionItem): void {
    item.isSelected = !item.isSelected;
    this.updateSelectedCount();
  }

  /**
   * 更新选中数量
   */
  private updateSelectedCount(): void {
    this.selectedCount = this.wrongItems.filter((item: WrongQuestionItem) => item.isSelected).length;
  }

  /**
   * 全选/取消全选
   */
  private toggleSelectAll(): void {
    const allSelected = this.selectedCount === this.wrongItems.length;
    this.wrongItems.forEach((item: WrongQuestionItem) => {
      item.isSelected = !allSelected;
    });
    this.updateSelectedCount();
  }

  /**
   * 批量删除（标记为已掌握）
   */
  private async batchDelete(): Promise<void> {
    const selectedItems = this.wrongItems.filter((item: WrongQuestionItem) => item.isSelected);
    if (selectedItems.length === 0) return;

    // 批量标记为已掌握
    for (const item of selectedItems) {
      await answerRecordService.markAsMastered(item.question.id);
    }

    // 从列表中移除
    this.wrongItems = this.wrongItems.filter((item: WrongQuestionItem) => !item.isSelected);
    this.allWrongItems = this.allWrongItems.filter((item: WrongQuestionItem) =>
      !selectedItems.some((s: WrongQuestionItem) => s.question.id === item.question.id)
    );

    // 退出多选模式
    this.exitSelectMode();

    Logger.info(`[WrongBookPage] Batch deleted ${selectedItems.length} questions`);
  }

  /**
   * 开始错题练习
   */
  private startPractice(): void {
    const params: RouteParams = {};
    params['mode'] = 'wrong' as Object;
    Router.goToAnswer(params);
  }

  /**
   * 查看单个错题（进入答题页面）
   */
  private viewQuestion(item: WrongQuestionItem): void {
    const params: RouteParams = {};
    params['questionId'] = item.question.id as Object;
    params['mode'] = 'single' as Object;
    params['fromWrongBook'] = true as Object; // 标记来自错题本
    Router.goToAnswer(params);
  }

  /**
   * 开始练习错题（记录题目ID，返回时检查结果）
   */
  private startPracticeQuestion(item: WrongQuestionItem): void {
    // 记录当前练习的题目ID
    this.currentPracticeQuestionId = item.question.id;

    // 跳转到专门的错题练习页面
    const params: RouteParams = {};
    params['questionId'] = item.question.id as Object;
    Router.push('pages/WrongPracticePage', params);
  }

  /**
   * 开始拖拽
   */
  private startDragging(item: WrongQuestionItem): void {
    this.isDragging = true;
    this.draggingItemId = item.question.id;
    this.showDeleteZone = true;
    this.deleteZoneScale = 1;
    Logger.info(`[WrongBookPage] Start dragging: ${item.question.id}`);
  }



  /**
   * 删除项目并播放动画
   */
  private async deleteItemWithAnimation(item: WrongQuestionItem): Promise<void> {
    // 播放删除动画
    this.getUIContext()?.animateTo({
      duration: 300,
      curve: Curve.EaseIn
    }, () => {
      item.scaleVal = 0;
      item.opacityVal = 0;
    });

    // 等待动画完成后删除
    setTimeout(async () => {
      // 标记为已掌握
      await answerRecordService.markAsMastered(item.question.id);

      // 从列表中移除
      this.wrongItems = this.wrongItems.filter((i: WrongQuestionItem) => i.question.id !== item.question.id);
      this.allWrongItems = this.allWrongItems.filter((i: WrongQuestionItem) => i.question.id !== item.question.id);

      Logger.info(`[WrongBookPage] Deleted item: ${item.question.id}`);
    }, 300);
  }

  build() {
    Stack() {
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
        } else if (this.allWrongItems.length === 0) {
          // 空状态（原始数据为空）
          this.EmptyState()
        } else {
          // 筛选栏（非多选模式时显示）
          if (!this.isSelectMode) {
            this.FilterBar()
          }

          if (this.wrongItems.length === 0) {
            // 筛选后无结果
            this.FilterEmptyState()
          } else {
            // 错题列表
            this.WrongList()
          }

          // 底部操作栏（拖拽时隐藏）
          if (this.isSelectMode) {
            // 多选模式：批量操作栏
            this.BatchActionBar()
          } else if (this.wrongItems.length > 0 && !this.isDragging) {
            // 普通模式：开始练习按钮（拖拽时隐藏）
            this.PracticeBar()
          }
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor(this.isDarkMode ? ThemeColors.BACKGROUND_DARK : ThemeColors.BACKGROUND)
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT })

      // 拖拽删除区域（底部）
      if (this.showDeleteZone) {
        this.DeleteZone()
      }
    }
    .width('100%')
    .height('100%')
  }

  /**
   * 删除区域
   */
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
      // 左侧按钮
      Row() {
        if (this.isSelectMode) {
          Text('取消')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.TEXT_SECONDARY)
        } else {
          Image($r('app.media.back'))
            .width(24)
            .height(24)
        }
      }
      .width(50)
      .height(40)
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        if (this.isSelectMode) {
          this.exitSelectMode();
        } else {
          Router.back();
        }
      })

      // 标题
      Text(this.isSelectMode ? `已选 ${this.selectedCount} 项` : `${this.pageTitle} (${this.wrongItems.length})`)
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      // 右侧按钮
      if (this.wrongItems.length > 0) {
        if (this.isSelectMode) {
          Text(this.selectedCount === this.wrongItems.length ? '取消全选' : '全选')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.PRIMARY)
            .padding({ left: 8, right: 8 })
            .onClick(() => {
              this.toggleSelectAll();
            })
        } else {
          Text('管理')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontColor(ThemeColors.PRIMARY)
            .padding({ left: 12, right: 12 })
            .onClick(() => {
              this.enterSelectMode();
            })
        }
      } else {
        Row().width(50).height(40)
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
      Image($r('app.media.WrongQuestion'))
        .width(64)
        .height(64)
        .objectFit(ImageFit.Contain)

      Text('暂无错题')
        .fontSize(ThemeConstants.FONT_SIZE_XL)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .margin({ top: ThemeConstants.SPACING_MD })

      Text('做错的题目会自动收录到这里')
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
  FilterEmptyState() {
    Column() {
      Text('🔍')
        .fontSize(48)

      Text('该科目暂无错题')
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ top: ThemeConstants.SPACING_MD })

      Text('查看全部')
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.PRIMARY)
        .margin({ top: ThemeConstants.SPACING_SM })
        .onClick(() => {
          this.selectSubject('all');
        })
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  FilterBar() {
    Row() {
      // 科目筛选（横向滚动）
      Scroll() {
        Row({ space: 8 }) {
          // 全部
          this.SubjectChip('all', '全部')

          // 各科目（只显示有错题的）
          ForEach(SUBJECT_LIST, (subject: SubjectInfo) => {
            if (this.getSubjectCount(subject.id) > 0) {
              this.SubjectChip(subject.id, subject.shortName)
            }
          })
        }
        .padding({ left: 12, right: 8 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .layoutWeight(1)

      // 排序按钮
      Row() {
        Text(this.getSortName())
          .fontSize(12)
          .fontColor(ThemeColors.TEXT_SECONDARY)
        Text('▼')
          .fontSize(8)
          .fontColor(ThemeColors.TEXT_HINT)
          .margin({ left: 2 })
      }
      .padding({ left: 10, right: 12, top: 6, bottom: 6 })
      .onClick(() => {
        this.cycleSortOption();
      })
    }
    .width('100%')
    .height(48)
    .backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  SubjectChip(subjectId: string, name: string) {
    Row() {
      Text(name)
        .fontSize(13)
        .fontColor(this.selectedSubject === subjectId ? ThemeColors.WHITE : ThemeColors.TEXT_SECONDARY)

      if (this.getSubjectCount(subjectId) > 0) {
        Text(`${this.getSubjectCount(subjectId)}`)
          .fontSize(11)
          .fontColor(this.selectedSubject === subjectId ? ThemeColors.WHITE : ThemeColors.TEXT_HINT)
          .margin({ left: 4 })
      }
    }
    .padding({ left: 12, right: 12, top: 6, bottom: 6 })
    .backgroundColor(this.selectedSubject === subjectId ? ThemeColors.PRIMARY : ThemeColors.GRAY_100)
    .borderRadius(16)
    .onClick(() => {
      this.selectSubject(subjectId);
    })
  }

  /**
   * 获取元素索引
   */
  private getItemIndex(questionId: string): number {
    return this.wrongItems.findIndex((i: WrongQuestionItem) => i.question.id === questionId);
  }

  @Builder
  WrongList() {
    Scroll() {
      Column() {
        if (this.showList) {
          ForEach(this.wrongItems, (item: WrongQuestionItem, index: number) => {
            WrongItemAnimWrapper({
              item: item,
              index: index,
              isDragging: this.isDragging && this.draggingItemId === item.question.id,
              content: () => {
                this.WrongItem(item)
              }
            })
          }, (item: WrongQuestionItem) => item.question.id)
        }
      }
      .width('100%')
      // 父容器保持透明度0.99，确保子元素转场生效
      .transition(TransitionEffect.opacity(0.99))
    }
    .scrollBar(BarState.Off)
    .width('100%')
    .layoutWeight(1)
    .padding(ThemeConstants.SPACING_MD)
    .align(Alignment.Top)
    // Scroll也需要保持透明度
    .transition(TransitionEffect.opacity(0.99))
  }

  @Builder
  WrongItem(item: WrongQuestionItem) {
    Row() {
      // 多选模式下显示选择框
      if (this.isSelectMode) {
        Checkbox()
          .select(item.isSelected)
          .selectedColor(ThemeColors.PRIMARY)
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .width(22)
          .height(22)
          .margin({ right: 12 })
          .onChange((value: boolean) => {
            item.isSelected = value;
            this.updateSelectedCount();
          })
      }

      Column() {
        // 顶部：科目标签 + 错误次数
        Row() {
          // 科目标签
          Text(getSubjectShortName(item.question.subjectId))
            .fontSize(12)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.WHITE)
            .padding({ left: 10, right: 10, top: 4, bottom: 4 })
            .backgroundColor(getSubjectColor(item.question.subjectId))
            .borderRadius(10)

          // 错误次数
          Row() {
            Text('错误')
              .fontSize(11)
              .fontColor(ThemeColors.ERROR)
            Text(` ${item.wrong.wrongCount} `)
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .fontColor(ThemeColors.ERROR)
            Text('次')
              .fontSize(11)
              .fontColor(ThemeColors.ERROR)
          }
          .margin({ left: 10 })

          Blank()

          // 箭头指示（非多选模式）
          if (!this.isSelectMode) {
            Text('›')
              .fontSize(20)
              .fontColor(ThemeColors.TEXT_HINT)
          }
        }
        .width('100%')

        // 题目内容
        Text(item.question.content)
          .fontSize(15)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .lineHeight(22)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: 10 })

        // 底部：开始练习按钮（非多选模式）
        if (!this.isSelectMode) {
          Row() {
            Text('💡 长按拖拽可删除')
              .fontSize(11)
              .fontColor(ThemeColors.TEXT_HINT)

            Blank()

            Text('开始练习')
              .fontSize(13)
              .fontColor(ThemeColors.PRIMARY)
              .padding({ left: 16, right: 16, top: 6, bottom: 6 })
              .borderRadius(14)
              .border({ width: 1, color: ThemeColors.PRIMARY })
              .onClick(() => {
                this.startPracticeQuestion(item);
              })
          }
          .width('100%')
          .margin({ top: 12 })
        }
      }
      .layoutWeight(1)
    }
    .width('100%')
    .padding(14)
    .margin({ bottom: 10 })
    .backgroundColor(item.isSelected
      ? 'rgba(24, 144, 255, 0.08)'
      : (this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE))
    .borderRadius(12)
    .border({
      width: item.isSelected ? 2 : 1,
      color: item.isSelected ? ThemeColors.PRIMARY : ThemeColors.BORDER
    })
    .onClick(() => {
      if (this.isSelectMode) {
        // 多选模式：切换选中状态
        this.toggleSelect(item);
      } else if (!this.isDragging) {
        // 普通模式：进入练习
        this.startPracticeQuestion(item);
      }
    })
    .gesture(
      GestureGroup(GestureMode.Sequence,
        // 先长按触发
        LongPressGesture({ repeat: false, duration: 500 })
          .onAction(() => {
            if (!this.isSelectMode) {
              this.startDragging(item);
            }
          }),
        // 然后拖拽
        PanGesture({ fingers: 1, direction: PanDirection.All, distance: 1 })
          .onActionUpdate((event: GestureEvent) => {
            if (this.isDragging && this.draggingItemId === item.question.id) {
              // 直接更新位置（不用动画，更跟手）
              item.translateX = event.offsetX;
              item.translateY = event.offsetY;

              // 检查是否进入删除区域（基于偏移量判断）
              const wasInDeleteZone = this.isInDeleteZone;
              // 当向下拖拽超过一定距离时进入删除区域
              this.isInDeleteZone = event.offsetY > 150;

              // 进入/离开删除区域时的动画反馈
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
                // 在删除区域松手，执行删除
                this.deleteItemWithAnimation(item);
              } else {
                // 不在删除区域，恢复位置
                this.getUIContext()?.animateTo({ curve: curves.springMotion() }, () => {
                  item.translateX = 0;
                  item.translateY = 0;
                });
              }

              // 重置状态
              this.isDragging = false;
              this.draggingItemId = '';
              this.isInDeleteZone = false;
              this.showDeleteZone = false;
            }
          })
          .onActionCancel(() => {
            // 取消拖拽
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
  BatchActionBar() {
    Row() {
      // 删除按钮（标记为已掌握）
      Column() {
        Image(this.selectedCount > 0 ? $r('app.media.Selectanddelete') : $r('app.media.delete'))
          .width(28)
          .height(28)
          .fillColor(this.selectedCount > 0 ? ThemeColors.ERROR : ThemeColors.TEXT_HINT)
        Text('移除')
          .fontSize(12)
          .fontColor(this.selectedCount > 0 ? ThemeColors.ERROR : ThemeColors.TEXT_HINT)
          .margin({ top: 4 })
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .opacity(this.selectedCount > 0 ? 1 : 0.5)
      .onClick(() => {
        if (this.selectedCount > 0) {
          this.batchDelete();
        }
      })
    }
    .width('100%')
    .height(70)
    .padding({ bottom: 10 })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
    .border({ width: { top: 1 }, color: ThemeColors.BORDER })
  }

  @Builder
  PracticeBar() {
    Row({ space: 10 }) {
      // 统计分析按钮
      Button('📊 统计')
        .height(40)
        .fontSize(13)
        .fontColor(ThemeColors.PRIMARY)
        .backgroundColor(ThemeColors.WHITE)
        .borderRadius(20)
        .border({ width: 1, color: ThemeColors.PRIMARY })
        .padding({ left: 14, right: 14 })
        .onClick(() => {
          Router.push('pages/WrongStatisticsPage');
        })

      // 笔记按钮
      Button('📝 笔记')
        .height(40)
        .fontSize(13)
        .fontColor(ThemeColors.SECONDARY)
        .backgroundColor(ThemeColors.WHITE)
        .borderRadius(20)
        .border({ width: 1, color: ThemeColors.SECONDARY })
        .padding({ left: 14, right: 14 })
        .onClick(() => {
          Router.push('pages/WrongNotePage');
        })

      // 开始练习按钮
      Button('开始练习')
        .height(40)
        .fontSize(13)
        .fontColor(ThemeColors.WHITE)
        .backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(20)
        .padding({ left: 20, right: 20 })
        .onClick(() => {
          Router.push('pages/WrongPracticeModePage');
        })
    }
    .width('100%')
    .height(70)
    .padding({ left: 16, right: 16, bottom: AppConstants.BOTTOM_NAV_HEIGHT })
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
    .border({ width: { top: 1 }, color: ThemeColors.BORDER })
  }
}
