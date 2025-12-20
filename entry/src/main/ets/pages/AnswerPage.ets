/**
 * 答题页面 - 核心刷题界面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { Question, QuestionOption, QuestionType, SubjectInfo } from '../common/types/QuestionTypes';
import { getSubjectShortName, getSubjectColor, SUBJECT_LIST } from '../data/SubjectData';
import { questionService, QuestionQuery } from '../services/QuestionService';
import { answerRecordService, AnswerRecordInput, SubjectWrongStat } from '../services/AnswerRecordService';
import { AppConstants } from '../common/constants/AppConstants';
import { Logger } from '../common/utils/Logger';

/**
 * 科目错题统计接口
 */
interface SubjectWrongInfo {
  subjectId: string;
  subjectName: string;
  shortName: string;
  color: string;
  wrongCount: number;
}

@Entry
@Component
struct AnswerPage {
  @State currentIndex: number = 0;
  @State questions: Question[] = [];
  @State userAnswers: Map<string, string> = new Map();
  @State showAnswer: boolean = false;
  @State isFavorite: boolean = false;
  @State isDarkMode: boolean = false;
  @State subjectId: string = '';
  @State mode: string = 'sequence';
  @State isLoading: boolean = true;
  @State answerStartTime: number = 0;
  @State showAnswerCard: boolean = false;
  @State answerResultMap: Map<string, boolean> = new Map(); // questionId -> isCorrect
  // 练习完成分析弹窗
  @State showAnalysisDialog: boolean = false;
  @State analysisWeakSubjects: SubjectWrongInfo[] = [];

  // 当前题目
  @State currentQuestion: Question | null = null;
  // 用户选择的答案
  @State selectedOptions: string[] = [];
  // 是否来自错题本（单题练习模式）
  @State fromWrongBook: boolean = false;
  // 指定的题目ID
  @State specifiedQuestionId: string = '';
  // 错题重做模式：sequence/random/highFreq/timed
  @State wrongMode: string = 'sequence';
  // 限时挑战相关
  @State timeLimit: number = 0; // 限时秒数，0表示不限时
  @State remainingTime: number = 0; // 剩余时间
  @State isTimedMode: boolean = false; // 是否限时模式
  @State questionCount: number = 0; // 练习题目数量
  private timerInterval: number = -1; // 计时器ID

  aboutToAppear(): void {
    const params: RouteParams = Router.getParams();
    if (params['subjectId']) {
      this.subjectId = params['subjectId'] as string;
    }
    if (params['mode']) {
      this.mode = params['mode'] as string;
    }
    if (params['fromWrongBook']) {
      this.fromWrongBook = params['fromWrongBook'] as boolean;
    }
    if (params['questionId']) {
      this.specifiedQuestionId = params['questionId'] as string;
    }
    // 错题重做模式参数
    if (params['wrongMode']) {
      this.wrongMode = params['wrongMode'] as string;
    }
    if (params['timeLimit']) {
      this.timeLimit = params['timeLimit'] as number;
      this.remainingTime = this.timeLimit;
      this.isTimedMode = this.timeLimit > 0;
    }
    if (params['questionCount']) {
      this.questionCount = params['questionCount'] as number;
    }

    // 加载题目
    this.loadQuestions();
  }

  aboutToDisappear(): void {
    // 清除计时器
    this.clearTimer();
  }

  /**
   * 清除计时器
   */
  private clearTimer(): void {
    if (this.timerInterval !== -1) {
      clearInterval(this.timerInterval);
      this.timerInterval = -1;
    }
  }

  /**
   * 加载题目
   */
  private async loadQuestions(): Promise<void> {
    try {
      // 如果来自错题本且指定了题目ID，只加载这一道题
      if (this.fromWrongBook && this.specifiedQuestionId) {
        await this.loadSingleQuestion(this.specifiedQuestionId);
      } else if (this.mode === AppConstants.PRACTICE_MODE_WRONG) {
        // 错题练习模式
        await this.loadWrongQuestions();
      } else if (this.mode === AppConstants.PRACTICE_MODE_FAVORITE) {
        // 收藏练习模式
        await this.loadFavoriteQuestions();
      } else if (this.mode === 'single' && this.specifiedQuestionId) {
        // 单题模式
        await this.loadSingleQuestion(this.specifiedQuestionId);
      } else if (this.mode === 'daily') {
        // 每日一练：随机题目，数量=每日目标
        await this.loadDailyQuestions();
      } else if (this.mode === 'intensive') {
        // 强化训练：100道全随机
        await this.loadIntensiveQuestions();
      } else if (this.mode === 'weakness') {
        // 专项练习：根据错题数据智能出题
        await this.loadWeaknessQuestions();
      } else if (this.mode === 'important') {
        // 高频重点：重要题目随机50道
        await this.loadImportantQuestions();
      } else if (this.mode === 'subject') {
        // 科目强化：指定科目随机50题
        await this.loadSubjectQuestions();
      } else {
        // 普通练习模式
        await this.loadNormalQuestions();
      }

      if (this.questions.length > 0) {
        this.currentQuestion = this.questions[0];
        this.answerStartTime = Date.now();
        // 检查是否已收藏
        this.checkFavoriteStatus();
      }

      Logger.info(`[AnswerPage] Loaded ${this.questions.length} questions in ${this.mode} mode, fromWrongBook: ${this.fromWrongBook}`);
    } catch (error) {
      Logger.error('[AnswerPage] Failed to load questions', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  /**
   * 加载单个题目
   */
  private async loadSingleQuestion(questionId: string): Promise<void> {
    const question = await questionService.getQuestionById(questionId);
    if (question) {
      this.questions = [question];
    } else {
      this.questions = [];
    }
  }

  /**
   * 加载普通练习题目
   */
  private async loadNormalQuestions(): Promise<void> {
    const query: QuestionQuery = {
      // 不设置limit，加载全部题目
    };

    // 根据科目筛选
    if (this.subjectId) {
      query.subjectId = this.subjectId;
    }

    // 根据模式设置
    if (this.mode === AppConstants.PRACTICE_MODE_RANDOM) {
      query.random = true;
    }

    this.questions = await questionService.getQuestions(query);
  }

  /**
   * 加载错题练习题目
   */
  private async loadWrongQuestions(): Promise<void> {
    let wrongQuestions = await answerRecordService.getWrongQuestions();

    if (wrongQuestions.length === 0) {
      this.questions = [];
      return;
    }

    // 根据错题重做模式处理
    switch (this.wrongMode) {
      case 'random':
        // 随机打乱
        wrongQuestions = this.shuffleArray(wrongQuestions);
        break;
      case 'highFreq':
        // 按错误次数降序排列
        wrongQuestions.sort((a, b) => b.wrongCount - a.wrongCount);
        break;
      case 'timed':
        // 限时模式，随机打乱
        wrongQuestions = this.shuffleArray(wrongQuestions);
        break;
      case 'sequence':
      default:
        // 按时间顺序（默认已排序）
        break;
    }

    // 限制题目数量
    if (this.questionCount > 0 && this.questionCount < wrongQuestions.length) {
      wrongQuestions = wrongQuestions.slice(0, this.questionCount);
    }

    // 获取题目详情
    const wrongIds = wrongQuestions.map(w => w.questionId);
    const questions = await questionService.getQuestionsByIds(wrongIds);

    // 保持排序顺序
    const orderedQuestions: Question[] = [];
    wrongIds.forEach((id: string) => {
      const found = questions.find((q: Question) => q.id === id);
      if (found) {
        orderedQuestions.push(found);
      }
    });
    this.questions = orderedQuestions;

    // 如果是限时模式，启动计时器
    if (this.isTimedMode && this.questions.length > 0) {
      this.startTimer();
    }
  }

  /**
   * 随机打乱数组
   */
  private shuffleArray<T>(array: T[]): T[] {
    const result = [...array];
    for (let i = result.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      const temp = result[i];
      result[i] = result[j];
      result[j] = temp;
    }
    return result;
  }

  /**
   * 启动限时计时器
   */
  private startTimer(): void {
    this.timerInterval = setInterval(() => {
      if (this.remainingTime > 0) {
        this.remainingTime--;
      } else {
        // 时间到，自动结束
        clearInterval(this.timerInterval);
        this.timerInterval = -1;
        this.onTimeUp();
      }
    }, 1000);
  }

  /**
   * 时间到处理
   */
  private onTimeUp(): void {
    // 清除计时器
    this.clearTimer();
    // 显示时间到提示，然后返回
    AlertDialog.show({
      title: '⏱️ 时间到！',
      message: `本次练习完成 ${this.userAnswers.size} 题，正确 ${this.getCorrectCount()} 题`,
      confirm: {
        value: '确定',
        action: () => {
          Router.back();
        }
      }
    });
  }

  /**
   * 格式化时间显示
   */
  private formatTime(seconds: number): string {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  }

  /**
   * 加载收藏练习题目
   */
  private async loadFavoriteQuestions(): Promise<void> {
    const favoriteIds = await answerRecordService.getFavoriteQuestionIds();
    if (favoriteIds.length > 0) {
      this.questions = await questionService.getQuestionsByIds(favoriteIds);
    } else {
      this.questions = [];
    }
  }

  /**
   * 每日一练：随机题目，默认20题
   */
  private async loadDailyQuestions(): Promise<void> {
    const query: QuestionQuery = {
      random: true,
      limit: this.questionCount > 0 ? this.questionCount : 20 // 默认20题
    };
    this.questions = await questionService.getQuestions(query);
  }

  /**
   * 强化训练：100道全随机综合题
   */
  private async loadIntensiveQuestions(): Promise<void> {
    const query: QuestionQuery = {
      random: true,
      limit: 100
    };
    this.questions = await questionService.getQuestions(query);
  }

  /**
   * 专项练习：根据错题数据智能出题，错的类别多的题目多
   */
  private async loadWeaknessQuestions(): Promise<void> {
    // 获取错题统计，按科目分组
    const wrongStats = await answerRecordService.getWrongQuestionsBySubject();
    
    if (wrongStats.length === 0) {
      // 没有错题数据，随机出50题
      const query: QuestionQuery = {
        random: true,
        limit: 50
      };
      this.questions = await questionService.getQuestions(query);
      return;
    }

    // 计算总错题数
    let totalWrong = 0;
    wrongStats.forEach((stat: SubjectWrongStat) => {
      totalWrong += stat.wrongCount;
    });

    // 按错题比例分配题目数量，总共50题
    const totalQuestions = 50;
    const allQuestions: Question[] = [];

    for (const stat of wrongStats) {
      // 按比例计算该科目应出的题目数量
      const ratio = stat.wrongCount / totalWrong;
      const count = Math.max(1, Math.round(totalQuestions * ratio));
      
      const query: QuestionQuery = {
        subjectId: stat.subjectId,
        random: true,
        limit: count
      };
      const questions = await questionService.getQuestions(query);
      allQuestions.push(...questions);
    }

    // 打乱顺序
    this.questions = this.shuffleArray(allQuestions).slice(0, totalQuestions);
  }

  /**
   * 高频重点：重要题目随机50道
   */
  private async loadImportantQuestions(): Promise<void> {
    // 获取标记为重要的题目
    const query: QuestionQuery = {
      random: true,
      limit: 50
    };
    // 优先获取高频错题和收藏题目
    const wrongQuestions = await answerRecordService.getWrongQuestions();
    const favoriteIds = await answerRecordService.getFavoriteQuestionIds();
    
    // 合并高频错题ID和收藏ID
    const importantIds = new Set<string>();
    
    // 添加错误次数>=2的题目
    wrongQuestions.filter(w => w.wrongCount >= 2).forEach(w => {
      importantIds.add(w.questionId);
    });
    
    // 添加收藏题目
    favoriteIds.forEach((id: string) => {
      importantIds.add(id);
    });

    if (importantIds.size >= 50) {
      // 从重要题目中随机选50道
      const idArray = Array.from(importantIds);
      const shuffled = this.shuffleArray(idArray).slice(0, 50);
      this.questions = await questionService.getQuestionsByIds(shuffled);
    } else {
      // 重要题目不足50道，补充随机题目
      const importantQuestions = importantIds.size > 0 
        ? await questionService.getQuestionsByIds(Array.from(importantIds))
        : [];
      
      const remainingCount = 50 - importantQuestions.length;
      if (remainingCount > 0) {
        const randomQuestions = await questionService.getQuestions(query);
        // 过滤掉已有的题目
        const filtered = randomQuestions.filter((q: Question) => !importantIds.has(q.id));
        this.questions = [...importantQuestions, ...filtered.slice(0, remainingCount)];
      } else {
        this.questions = importantQuestions;
      }
    }
    
    // 打乱顺序
    this.questions = this.shuffleArray(this.questions);
  }

  /**
   * 科目强化：指定科目随机50题
   */
  private async loadSubjectQuestions(): Promise<void> {
    const limit = this.questionCount > 0 ? this.questionCount : 50;
    const query: QuestionQuery = {
      subjectId: this.subjectId,
      random: true,
      limit: limit
    };
    this.questions = await questionService.getQuestions(query);
  }

  /**
   * 检查收藏状态
   */
  private async checkFavoriteStatus(): Promise<void> {
    if (this.currentQuestion) {
      this.isFavorite = await answerRecordService.isFavorite(this.currentQuestion.id);
    }
  }

  /**
   * 选择选项
   */
  private selectOption(optionKey: string): void {
    if (this.showAnswer) return;

    const question = this.currentQuestion;
    if (!question) return;

    if (question.type === QuestionType.SINGLE || question.type === QuestionType.JUDGE) {
      // 单选题/判断题：选择后直接显示答案解析，不自动跳转
      this.selectedOptions = [optionKey];
      this.submitAnswer();
    } else if (question.type === QuestionType.MULTIPLE) {
      // 多选题：需要手动确认
      const index = this.selectedOptions.indexOf(optionKey);
      if (index > -1) {
        this.selectedOptions = this.selectedOptions.filter((item: string) => item !== optionKey);
      } else {
        this.selectedOptions = [...this.selectedOptions, optionKey];
      }
    }
  }

  /**
   * 提交答案
   */
  private async submitAnswer(): Promise<void> {
    if (this.selectedOptions.length === 0) return;

    const question = this.currentQuestion;
    if (!question) return;

    // 保存用户答案
    const userAnswer = [...this.selectedOptions].sort().join(',');
    this.userAnswers.set(question.id, userAnswer);

    // 计算答题时间
    const answerTime = Math.round((Date.now() - this.answerStartTime) / 1000);
    const isCorrect = userAnswer === question.answer;

    // 保存答题记录到数据库
    try {
      const recordInput: AnswerRecordInput = {
        questionId: question.id,
        userAnswer: userAnswer,
        isCorrect: isCorrect,
        answerTime: answerTime,
        createTime: Date.now()
      };
      await answerRecordService.saveAnswerRecord(recordInput);
      // 记录答题结果
      this.answerResultMap.set(question.id, isCorrect);
    } catch (error) {
      Logger.error('[AnswerPage] Failed to save answer record', error as Error);
    }

    // 显示答案
    this.showAnswer = true;
  }

  /**
   * 跳转到指定题目
   */
  private goToQuestion(index: number): void {
    if (index >= 0 && index < this.questions.length) {
      const targetQuestion = this.questions[index];
      const savedAnswer = this.userAnswers.get(targetQuestion.id);
      
      // 一次性设置所有状态，避免多次触发渲染
      this.currentIndex = index;
      this.currentQuestion = targetQuestion;
      this.answerStartTime = Date.now();
      
      // 根据是否有保存的答案，一次性设置选项和显示状态
      if (savedAnswer) {
        this.selectedOptions = savedAnswer.split(',');
        this.showAnswer = true;
      } else {
        this.selectedOptions = [];
        this.showAnswer = false;
      }

      // 检查收藏状态
      this.checkFavoriteStatus();
    }
  }

  /**
   * 下一题
   */
  private nextQuestion(): void {
    if (this.currentIndex < this.questions.length - 1) {
      const nextIndex = this.currentIndex + 1;
      const targetQuestion = this.questions[nextIndex];
      const savedAnswer = this.userAnswers.get(targetQuestion.id);
      
      // 一次性设置所有状态，避免多次触发渲染
      this.currentIndex = nextIndex;
      this.currentQuestion = targetQuestion;
      this.answerStartTime = Date.now();
      
      // 根据是否有保存的答案，一次性设置选项和显示状态
      if (savedAnswer) {
        this.selectedOptions = savedAnswer.split(',');
        this.showAnswer = true;
      } else {
        this.selectedOptions = [];
        this.showAnswer = false;
      }

      // 检查收藏状态
      this.checkFavoriteStatus();
    }
  }

  /**
   * 上一题
   */
  private prevQuestion(): void {
    if (this.currentIndex > 0) {
      const prevIndex = this.currentIndex - 1;
      const targetQuestion = this.questions[prevIndex];
      const savedAnswer = this.userAnswers.get(targetQuestion.id);
      
      // 一次性设置所有状态，避免多次触发渲染
      this.currentIndex = prevIndex;
      this.currentQuestion = targetQuestion;
      this.answerStartTime = Date.now();
      
      // 根据是否有保存的答案，一次性设置选项和显示状态
      if (savedAnswer) {
        this.selectedOptions = savedAnswer.split(',');
        this.showAnswer = true;
      } else {
        this.selectedOptions = [];
        this.showAnswer = false;
      }

      // 检查收藏状态
      this.checkFavoriteStatus();
    }
  }

  /**
   * 切换收藏状态
   */
  private async toggleFavorite(): Promise<void> {
    if (!this.currentQuestion) return;

    try {
      if (this.isFavorite) {
        await answerRecordService.removeFavorite(this.currentQuestion.id);
      } else {
        await answerRecordService.addFavorite(this.currentQuestion.id);
      }
      this.isFavorite = !this.isFavorite;
    } catch (error) {
      Logger.error('[AnswerPage] Failed to toggle favorite', error as Error);
    }
  }

  /**
   * 判断选项是否正确
   */
  private isOptionCorrect(optionKey: string): boolean {
    if (!this.currentQuestion) return false;
    const correctAnswers = this.currentQuestion.answer.split(',');
    return correctAnswers.includes(optionKey);
  }

  /**
   * 判断用户答案是否正确
   */
  private isAnswerCorrect(): boolean {
    if (!this.currentQuestion) return false;
    // 使用展开运算符创建副本，避免修改原数组
    const userAnswer = [...this.selectedOptions].sort().join(',');
    return userAnswer === this.currentQuestion.answer;
  }

  /**
   * 获取题型名称
   */
  private getQuestionTypeName(type: QuestionType): string {
    switch (type) {
      case QuestionType.SINGLE:
        return '单选题';
      case QuestionType.MULTIPLE:
        return '多选题';
      case QuestionType.JUDGE:
        return '判断题';
      case QuestionType.CASE:
        return '案例分析';
      default:
        return '未知';
    }
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
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

            Text('加载题目中...')
              .fontSize(ThemeConstants.FONT_SIZE_BASE)
              .fontColor(ThemeColors.TEXT_SECONDARY)
              .margin({ top: ThemeConstants.SPACING_MD })
          }
          .width('100%')
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
        } else if (this.currentQuestion) {
          // 题目+选项+解析（整体可滚动）
          Scroll() {
            Column() {
              // 题目信息
              this.QuestionInfo()
              // 题目内容
              this.QuestionContent()
              // 选项列表
              this.OptionList()
              // 答案解析（提交后显示）
              if (this.showAnswer) {
                this.AnswerAnalysis()
              }
            }
            .width('100%')
            .padding(ThemeConstants.SPACING_MD)
          }
          .scrollBar(BarState.Off)
          .layoutWeight(1)
          .align(Alignment.Top)

          // 底部操作栏
          this.BottomBar()
        } else {
          // 无题目
          Column() {
            Text('暂无题目')
              .fontSize(ThemeConstants.FONT_SIZE_LG)
              .fontColor(ThemeColors.TEXT_SECONDARY)
          }
          .width('100%')
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
        }
      }
      .width('100%')
      .height('100%')

      // 答题卡弹窗
      if (this.showAnswerCard) {
        Column() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor('rgba(0,0,0,0.5)')
            .onClick(() => {
              this.showAnswerCard = false;
            })
        }
        .width('100%')
        .height('100%')
        .position({ x: 0, y: 0 })

        this.PracticeAnswerCardPanel()
      }

      // 练习完成分析弹窗
      if (this.showAnalysisDialog) {
        Column() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor('rgba(0,0,0,0.5)')
        }
        .width('100%')
        .height('100%')
        .position({ x: 0, y: 0 })

        Column() {
          this.PracticeAnalysisDialog()
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .position({ x: 0, y: 0 })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.isDarkMode ? ThemeColors.BACKGROUND_DARK : ThemeColors.BACKGROUND)
    .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
  }

  /**
   * 练习完成分析弹窗
   */
  @Builder
  PracticeAnalysisDialog() {
    Column() {
      // 顶部结果区域
      Column() {
        Text('🎯')
          .fontSize(36)

        Text(this.getModeName() + '完成！')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .margin({ top: 8 })

        // 成绩统计
        Row() {
          this.ResultStatItem(`${this.userAnswers.size}`, '答题', ThemeColors.PRIMARY)
          this.ResultStatItem(`${this.getCorrectCount()}`, '正确', ThemeColors.SUCCESS)
          this.ResultStatItem(`${this.getWrongCount()}`, '错误', ThemeColors.ERROR)
          this.ResultStatItem(`${this.userAnswers.size > 0 ? Math.round(this.getCorrectCount() / this.userAnswers.size * 100) : 0}%`, '正确率', ThemeColors.WARNING)
        }
        .width('100%')
        .margin({ top: 16 })
        .justifyContent(FlexAlign.SpaceEvenly)

        // 正向反馈
        Text(this.getPositiveFeedback())
          .fontSize(13)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .margin({ top: 12 })
      }
      .width('100%')
      .padding(20)

      Divider().color(ThemeColors.GRAY_200)

      // 薄弱科目分析
      if (this.analysisWeakSubjects.length > 0) {
        Column() {
          Row() {
            Text('📊 薄弱方向')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor(ThemeColors.TEXT_PRIMARY)
          }
          .width('100%')
          .margin({ bottom: 10 })

          ForEach(this.analysisWeakSubjects, (item: SubjectWrongInfo, index: number) => {
            Row() {
              // 排名
              Text(`${index + 1}`)
                .fontSize(11)
                .fontColor(ThemeColors.WHITE)
                .fontWeight(FontWeight.Bold)
                .textAlign(TextAlign.Center)
                .width(20)
                .height(20)
                .borderRadius(10)
                .backgroundColor(index === 0 ? '#FF4D4F' : (index === 1 ? '#FF7A45' : '#FAAD14'))

              // 科目名称
              Text(item.shortName)
                .fontSize(14)
                .fontColor(ThemeColors.TEXT_PRIMARY)
                .margin({ left: 8 })

              // 错题数
              Text(`${item.wrongCount}道`)
                .fontSize(12)
                .fontColor(ThemeColors.ERROR)
                .margin({ left: 6 })

              Blank()

              // 练习按钮
              Text('练习')
                .fontSize(12)
                .fontColor(ThemeColors.WHITE)
                .padding({ left: 12, right: 12, top: 5, bottom: 5 })
                .backgroundColor(item.color)
                .borderRadius(12)
                .onClick(() => {
                  this.showAnalysisDialog = false;
                  const params: RouteParams = {};
                  params['subjectId'] = item.subjectId as Object;
                  params['mode'] = 'subject' as Object;
                  params['questionCount'] = 30 as Object;
                  Router.replace('pages/AnswerPage', params);
                })

              // 知识按钮
              Text('知识')
                .fontSize(12)
                .fontColor(item.color)
                .padding({ left: 12, right: 12, top: 5, bottom: 5 })
                .backgroundColor(item.color + '15')
                .borderRadius(12)
                .margin({ left: 8 })
                .onClick(() => {
                  this.showAnalysisDialog = false;
                  const params: RouteParams = {};
                  params['subjectId'] = item.subjectId as Object;
                  Router.push('pages/KnowledgeListPage', params);
                })
            }
            .width('100%')
            .padding(10)
            .margin({ bottom: 6 })
            .backgroundColor(ThemeColors.GRAY_50)
            .borderRadius(8)
          }, (item: SubjectWrongInfo) => item.subjectId)
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 12, bottom: 8 })
      }

      // 底部按钮
      Row({ space: 12 }) {
        Button('返回')
          .layoutWeight(1)
          .height(42)
          .fontSize(14)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .backgroundColor(ThemeColors.GRAY_100)
          .borderRadius(21)
          .onClick(() => {
            this.showAnalysisDialog = false;
            Router.back();
          })

        Button('再来一组')
          .layoutWeight(1)
          .height(42)
          .fontSize(14)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.PRIMARY)
          .borderRadius(21)
          .onClick(() => {
            this.showAnalysisDialog = false;
            const params: RouteParams = {};
            params['mode'] = this.mode as Object;
            if (this.subjectId) {
              params['subjectId'] = this.subjectId as Object;
            }
            Router.replace('pages/AnswerPage', params);
          })
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 8, bottom: 16 })
    }
    .width('85%')
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(16)
    .shadow({ radius: 16, color: 'rgba(0,0,0,0.1)', offsetY: 4 })
  }

  @Builder
  ResultStatItem(value: string, label: string, color: ResourceColor) {
    Column() {
      Text(value)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(color)
      Text(label)
        .fontSize(11)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: 2 })
    }
  }

  /**
   * 导航栏
   */
  @Builder
  NavigationBar() {
    Row() {
      // 返回按钮
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

      // 中间区域：进度 + 限时倒计时
      Column() {
        // 进度（点击打开答题卡）
        Row() {
          Text(`${this.currentIndex + 1} / ${this.questions.length}`)
            .fontSize(ThemeConstants.FONT_SIZE_MD)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.TEXT_PRIMARY)

          Text(' 📋')
            .fontSize(ThemeConstants.FONT_SIZE_SM)
        }
        .onClick(() => {
          this.showAnswerCard = true;
        })

        // 限时模式显示倒计时
        if (this.isTimedMode) {
          Row() {
            Text('⏱️')
              .fontSize(12)
            Text(this.formatTime(this.remainingTime))
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.remainingTime <= 60 ? ThemeColors.ERROR : ThemeColors.WARNING)
              .margin({ left: 4 })
          }
          .margin({ top: 2 })
        }
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)

      // 收藏按钮
      Row() {
        Image(this.isFavorite ? $r('app.media.AddedtoFavorites') : $r('app.media.Tobesaved'))
          .width(24)
          .height(24)
          .objectFit(ImageFit.Contain)
      }
      .width(40)
      .height(40)
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        this.toggleFavorite();
      })
    }
    .width('100%')
    .height(56)
    .padding({ left: ThemeConstants.SPACING_SM, right: ThemeConstants.SPACING_SM })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
  }

  /**
   * 题目信息
   */
  @Builder
  QuestionInfo() {
    Row() {
      // 题型标签
      Text(this.getQuestionTypeName(this.currentQuestion!.type))
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.WHITE)
        .padding({ left: 10, right: 10, top: 4, bottom: 4 })
        .backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(10)

      // 科目标签
      Text(getSubjectShortName(this.currentQuestion!.subjectId))
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontWeight(FontWeight.Medium)
        .fontColor(ThemeColors.WHITE)
        .padding({ left: 10, right: 10, top: 4, bottom: 4 })
        .backgroundColor(getSubjectColor(this.currentQuestion!.subjectId))
        .borderRadius(10)
        .margin({ left: ThemeConstants.SPACING_SM })
    }
    .width('100%')
  }

  /**
   * 题目内容
   */
  @Builder
  QuestionContent() {
    Column() {
      Text(this.currentQuestion!.content)
        .fontSize(ThemeConstants.FONT_SIZE_MD)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .lineHeight(24)
    }
    .width('100%')
    .margin({ top: ThemeConstants.SPACING_MD })
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * 选项列表
   */
  @Builder
  OptionList() {
    Column() {
      ForEach(this.currentQuestion!.options, (option: QuestionOption) => {
        this.OptionItem(option)
      })
    }
    .width('100%')
  }

  /**
   * 选项项
   */
  @Builder
  OptionItem(option: QuestionOption) {
    Row() {
      // 选项标识
      Column() {
        Text(option.key)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.getOptionKeyColor(option.key))
      }
      .width(32)
      .height(32)
      .borderRadius(16)
      .backgroundColor(this.getOptionKeyBgColor(option.key))
      .justifyContent(FlexAlign.Center)

      // 选项内容
      Text(option.content)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .margin({ left: ThemeConstants.SPACING_BASE })

      // 正确/错误标识
      if (this.showAnswer) {
        if (this.isOptionCorrect(option.key)) {
          Text('✓')
            .fontSize(ThemeConstants.FONT_SIZE_LG)
            .fontColor(ThemeColors.SUCCESS)
        } else if (this.selectedOptions.includes(option.key)) {
          Text('✗')
            .fontSize(ThemeConstants.FONT_SIZE_LG)
            .fontColor(ThemeColors.ERROR)
        }
      }
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_BASE)
    .margin({ top: ThemeConstants.SPACING_SM })
    .backgroundColor(this.getOptionBgColor(option.key))
    .borderRadius(ThemeConstants.RADIUS_MD)
    .border({
      width: 1,
      color: this.getOptionBorderColor(option.key)
    })
    .onClick(() => {
      this.selectOption(option.key);
    })
  }

  /**
   * 获取选项标识颜色
   */
  private getOptionKeyColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) {
        return ThemeColors.WHITE;
      } else if (this.selectedOptions.includes(key)) {
        return ThemeColors.WHITE;
      }
    } else if (this.selectedOptions.includes(key)) {
      return ThemeColors.WHITE;
    }
    return ThemeColors.TEXT_SECONDARY;
  }

  /**
   * 获取选项标识背景色
   */
  private getOptionKeyBgColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) {
        return ThemeColors.SUCCESS;
      } else if (this.selectedOptions.includes(key)) {
        return ThemeColors.ERROR;
      }
    } else if (this.selectedOptions.includes(key)) {
      return ThemeColors.PRIMARY;
    }
    return this.isDarkMode ? ThemeColors.SURFACE_VARIANT_DARK : ThemeColors.GRAY_100;
  }

  /**
   * 获取选项背景色
   */
  private getOptionBgColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) {
        return 'rgba(82, 196, 26, 0.1)';
      } else if (this.selectedOptions.includes(key)) {
        return 'rgba(255, 77, 79, 0.1)';
      }
    }
    return this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE;
  }

  /**
   * 获取选项边框色
   */
  private getOptionBorderColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) {
        return ThemeColors.SUCCESS;
      } else if (this.selectedOptions.includes(key)) {
        return ThemeColors.ERROR;
      }
    } else if (this.selectedOptions.includes(key)) {
      return ThemeColors.PRIMARY;
    }
    return this.isDarkMode ? ThemeColors.BORDER_DARK : ThemeColors.BORDER;
  }

  /**
   * 答案解析
   */
  @Builder
  AnswerAnalysis() {
    Column() {
      // 结果提示卡片
      Row() {
        // 结果图标
        Column() {
          Text(this.isAnswerCorrect() ? '✓' : '✗')
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor(ThemeColors.WHITE)
        }
        .width(56)
        .height(56)
        .borderRadius(28)
        .backgroundColor(this.isAnswerCorrect() ? ThemeColors.SUCCESS : ThemeColors.ERROR)
        .justifyContent(FlexAlign.Center)

        Column() {
          Text(this.isAnswerCorrect() ? '回答正确！' : '回答错误')
            .fontSize(ThemeConstants.FONT_SIZE_LG)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.isAnswerCorrect() ? ThemeColors.SUCCESS : ThemeColors.ERROR)

          Text(this.isAnswerCorrect() ? '继续保持，你很棒！' : '别灰心，看看解析吧')
            .fontSize(ThemeConstants.FONT_SIZE_SM)
            .fontColor(ThemeColors.TEXT_HINT)
            .margin({ top: 4 })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: ThemeConstants.SPACING_MD })
      }
      .width('100%')
      .padding(ThemeConstants.SPACING_MD)
      .backgroundColor(this.isAnswerCorrect() ? 'rgba(82, 196, 26, 0.1)' : 'rgba(255, 77, 79, 0.1)')
      .borderRadius(ThemeConstants.RADIUS_MD)

      // 解析
      Column() {
        Row() {
          Text('💡')
            .fontSize(16)
          Text(' 题目解析')
            .fontSize(ThemeConstants.FONT_SIZE_BASE)
            .fontWeight(FontWeight.Medium)
            .fontColor(ThemeColors.TEXT_PRIMARY)
        }
        .width('100%')

        Text(this.currentQuestion!.analysis || '暂无解析')
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .lineHeight(24)
          .margin({ top: ThemeConstants.SPACING_SM })
      }
      .width('100%')
      .padding(ThemeConstants.SPACING_MD)
      .margin({ top: ThemeConstants.SPACING_SM })
      .backgroundColor(ThemeColors.SURFACE)
      .borderRadius(ThemeConstants.RADIUS_MD)
      .border({ width: 1, color: ThemeColors.GRAY_200 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .margin({ top: ThemeConstants.SPACING_MD })
  }

  /**
   * 判断是否为多选题且未提交答案
   */
  private isMultipleAndNotSubmitted(): boolean {
    return this.currentQuestion !== null &&
      this.currentQuestion.type === QuestionType.MULTIPLE &&
      !this.showAnswer;
  }

  /**
   * 底部操作栏
   */
  @Builder
  BottomBar() {
    Row() {
      // 上一题
      Button('上一题')
        .width(100)
        .height(44)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(this.currentIndex > 0 ? ThemeColors.PRIMARY : ThemeColors.TEXT_DISABLED)
        .backgroundColor(ThemeColors.TRANSPARENT)
        .borderWidth(1)
        .borderColor(this.currentIndex > 0 ? ThemeColors.PRIMARY : ThemeColors.BORDER)
        .borderRadius(ThemeConstants.RADIUS_BASE)
        .enabled(this.currentIndex > 0)
        .onClick(() => {
          this.prevQuestion();
        })

      Blank()

      // 来自错题本的单题模式，答完直接返回
      if (this.fromWrongBook && this.showAnswer) {
        Button('返回错题本')
          .width(120)
          .height(44)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.PRIMARY)
          .borderRadius(ThemeConstants.RADIUS_BASE)
          .onClick(() => {
            Router.back();
          })
      } else if (this.isMultipleAndNotSubmitted()) {
        // 多选题未提交时显示"确认答案"按钮
        Button('确认答案')
          .width(120)
          .height(44)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(this.selectedOptions.length > 0 ? ThemeColors.PRIMARY : ThemeColors.TEXT_DISABLED)
          .borderRadius(ThemeConstants.RADIUS_BASE)
          .enabled(this.selectedOptions.length > 0)
          .onClick(() => {
            this.submitAnswer();
          })
      } else {
        // 下一题按钮
        Button(this.currentIndex < this.questions.length - 1 ? '下一题' : '完成')
          .width(120)
          .height(44)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(this.currentIndex < this.questions.length - 1 ? ThemeColors.PRIMARY : ThemeColors.SUCCESS)
          .borderRadius(ThemeConstants.RADIUS_BASE)
          .onClick(() => {
            if (this.currentIndex < this.questions.length - 1) {
              this.nextQuestion();
            } else {
              // 完成练习，显示分析弹窗
              this.showPracticeAnalysis();
            }
          })
      }
    }
    .width('100%')
    .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD, bottom: 32 })
    .backgroundColor(this.isDarkMode ? ThemeColors.SURFACE_DARK : ThemeColors.SURFACE)
  }

  /**
   * 显示练习完成分析
   */
  private showPracticeAnalysis(): void {
    // 只有特定模式才显示分析弹窗
    const analysisModels = ['daily', 'intensive', 'weakness', 'important'];
    if (!analysisModels.includes(this.mode)) {
      Router.back();
      return;
    }

    // 计算本次练习的错题科目分布
    this.analysisWeakSubjects = this.calculateWeakSubjects();
    
    // 如果没有错题，直接返回
    if (this.getWrongCount() === 0) {
      Router.back();
      return;
    }

    this.showAnalysisDialog = true;
  }

  /**
   * 计算薄弱科目（本次练习的错题分布）
   */
  private calculateWeakSubjects(): SubjectWrongInfo[] {
    const subjectWrongMap: Map<string, number> = new Map();

    // 统计每个科目的错题数
    this.answerResultMap.forEach((isCorrect: boolean, questionId: string) => {
      if (!isCorrect) {
        const question = this.questions.find((q: Question) => q.id === questionId);
        if (question) {
          const count = subjectWrongMap.get(question.subjectId) || 0;
          subjectWrongMap.set(question.subjectId, count + 1);
        }
      }
    });

    // 转换为数组并排序
    const result: SubjectWrongInfo[] = [];
    subjectWrongMap.forEach((wrongCount: number, subjectId: string) => {
      const subject = SUBJECT_LIST.find((s: SubjectInfo) => s.id === subjectId);
      if (subject) {
        const info: SubjectWrongInfo = {
          subjectId: subjectId,
          subjectName: subject.name,
          shortName: subject.shortName,
          color: subject.color,
          wrongCount: wrongCount
        };
        result.push(info);
      }
    });

    // 按错题数量降序排序，取前3个
    result.sort((a: SubjectWrongInfo, b: SubjectWrongInfo) => b.wrongCount - a.wrongCount);
    return result.slice(0, 3);
  }

  /**
   * 获取正向反馈文案
   */
  private getPositiveFeedback(): string {
    const accuracy = this.userAnswers.size > 0 
      ? Math.round(this.getCorrectCount() / this.userAnswers.size * 100) 
      : 0;
    
    if (accuracy >= 90) {
      return '太棒了！你的表现非常出色！🎉';
    } else if (accuracy >= 70) {
      return '做得不错！继续保持这个势头！💪';
    } else if (accuracy >= 50) {
      return '有进步空间，针对薄弱点多练习！📚';
    } else {
      return '别灰心，每次练习都是进步！加油！🌟';
    }
  }

  /**
   * 获取练习模式名称
   */
  private getModeName(): string {
    switch (this.mode) {
      case 'daily': return '每日一练';
      case 'intensive': return '强化训练';
      case 'weakness': return '专项练习';
      case 'important': return '高频重点';
      default: return '练习';
    }
  }

  /**
   * 练习答题卡面板
   */
  @Builder
  PracticeAnswerCardPanel() {
    Column() {
      // 标题栏
      Row() {
        Text('答题卡')
          .fontSize(ThemeConstants.FONT_SIZE_LG)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)

        Blank()

        Text('✕')
          .fontSize(ThemeConstants.FONT_SIZE_XL)
          .fontColor(ThemeColors.TEXT_HINT)
          .onClick(() => {
            this.showAnswerCard = false;
          })
      }
      .width('100%')
      .padding(ThemeConstants.SPACING_MD)

      // 统计信息
      Row() {
        this.PracticeStatItem('已答', this.userAnswers.size, ThemeColors.PRIMARY)
        this.PracticeStatItem('正确', this.getCorrectCount(), ThemeColors.SUCCESS)
        this.PracticeStatItem('错误', this.getWrongCount(), ThemeColors.ERROR)
      }
      .width('100%')
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
      .justifyContent(FlexAlign.SpaceAround)

      // 题目网格
      Scroll() {
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
          ForEach(this.generatePracticeIndexArray(), (index: number) => {
            this.PracticeQuestionItem(index)
          })
        }
        .width('100%')
        .padding(ThemeConstants.SPACING_SM)
      }
      .layoutWeight(1)

      // 图例
      Row() {
        this.PracticeLegendItem(ThemeColors.GRAY_200, '未答')
        this.PracticeLegendItem(ThemeColors.SUCCESS, '正确')
        this.PracticeLegendItem(ThemeColors.ERROR, '错误')
      }
      .width('100%')
      .padding(ThemeConstants.SPACING_MD)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(ThemeColors.GRAY_50)
    }
    .width('100%')
    .height('60%')
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius({ topLeft: ThemeConstants.RADIUS_LG, topRight: ThemeConstants.RADIUS_LG })
  }

  private generatePracticeIndexArray(): number[] {
    const arr: number[] = [];
    for (let i = 0; i < this.questions.length; i++) {
      arr.push(i);
    }
    return arr;
  }

  private getCorrectCount(): number {
    let count = 0;
    this.answerResultMap.forEach((isCorrect: boolean) => {
      if (isCorrect) count++;
    });
    return count;
  }

  private getWrongCount(): number {
    let count = 0;
    this.answerResultMap.forEach((isCorrect: boolean) => {
      if (!isCorrect) count++;
    });
    return count;
  }

  @Builder
  PracticeStatItem(label: string, count: number, color: string) {
    Row() {
      Circle()
        .width(12)
        .height(12)
        .fill(color)

      Text(`${label}: ${count}`)
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(ThemeColors.TEXT_SECONDARY)
        .margin({ left: ThemeConstants.SPACING_XS })
    }
  }

  @Builder
  PracticeQuestionItem(index: number) {
    Column() {
      Text(`${index + 1}`)
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(this.getPracticeItemTextColor(index))
    }
    .width(44)
    .height(44)
    .margin(4)
    .borderRadius(ThemeConstants.RADIUS_BASE)
    .backgroundColor(this.getPracticeItemBgColor(index))
    .border({
      width: this.currentIndex === index ? 2 : 0,
      color: ThemeColors.WARNING
    })
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.goToQuestion(index);
      this.showAnswerCard = false;
    })
  }

  private getPracticeItemBgColor(index: number): string {
    if (index >= this.questions.length) return ThemeColors.GRAY_200;
    const question = this.questions[index];
    const result = this.answerResultMap.get(question.id);
    if (result === undefined) return ThemeColors.GRAY_200;
    return result ? ThemeColors.SUCCESS : ThemeColors.ERROR;
  }

  private getPracticeItemTextColor(index: number): string {
    if (index >= this.questions.length) return ThemeColors.TEXT_SECONDARY;
    const question = this.questions[index];
    const result = this.answerResultMap.get(question.id);
    if (result === undefined) return ThemeColors.TEXT_SECONDARY;
    return ThemeColors.WHITE;
  }

  @Builder
  PracticeLegendItem(color: string, label: string) {
    Row() {
      Column()
        .width(16)
        .height(16)
        .borderRadius(4)
        .backgroundColor(color)

      Text(label)
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ left: ThemeConstants.SPACING_XXS })
    }
    .margin({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
  }
}
