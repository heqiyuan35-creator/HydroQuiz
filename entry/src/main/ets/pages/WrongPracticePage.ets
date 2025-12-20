/**
 * 错题练习页面 - 专门用于错题本的单题练习
 * 答完后自动返回错题本
 */
import { Router, RouteParams } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { Question, QuestionOption, QuestionType } from '../common/types/QuestionTypes';
import { getSubjectShortName, getSubjectColor } from '../data/SubjectData';
import { questionService } from '../services/QuestionService';
import { answerRecordService, AnswerRecordInput } from '../services/AnswerRecordService';
import { Logger } from '../common/utils/Logger';
import { AppConstants } from '../common/constants/AppConstants';

@Entry
@Component
struct WrongPracticePage {
  @State question: Question | null = null;
  @State selectedOptions: string[] = [];
  @State showAnswer: boolean = false;
  @State isFavorite: boolean = false;
  @State isDarkMode: boolean = false;
  @State isLoading: boolean = true;
  @State answerStartTime: number = 0;
  @State isCorrect: boolean = false;
  private questionId: string = '';
  private autoReturnDelay: number = 1500; // 自动返回延迟（毫秒）

  aboutToAppear(): void {
    const params: RouteParams = Router.getParams();
    if (params['questionId']) {
      this.questionId = params['questionId'] as string;
    }
    this.loadQuestion();
  }

  private async loadQuestion(): Promise<void> {
    try {
      if (this.questionId) {
        this.question = await questionService.getQuestionById(this.questionId);
        if (this.question) {
          this.answerStartTime = Date.now();
          this.isFavorite = await answerRecordService.isFavorite(this.questionId);
        }
      }
    } catch (error) {
      Logger.error('[WrongPracticePage] Failed to load question', error as Error);
    } finally {
      this.isLoading = false;
    }
  }

  private selectOption(optionKey: string): void {
    if (this.showAnswer) return;
    if (!this.question) return;

    if (this.question.type === QuestionType.SINGLE || this.question.type === QuestionType.JUDGE) {
      this.selectedOptions = [optionKey];
    } else if (this.question.type === QuestionType.MULTIPLE) {
      const index = this.selectedOptions.indexOf(optionKey);
      if (index > -1) {
        this.selectedOptions = this.selectedOptions.filter((item: string) => item !== optionKey);
      } else {
        this.selectedOptions = [...this.selectedOptions, optionKey];
      }
    }
  }

  private async submitAnswer(): Promise<void> {
    if (this.selectedOptions.length === 0 || !this.question) return;

    const userAnswer = this.selectedOptions.sort().join(',');
    const answerTime = Math.round((Date.now() - this.answerStartTime) / 1000);
    this.isCorrect = userAnswer === this.question.answer;

    // 保存答题记录
    try {
      const recordInput: AnswerRecordInput = {
        questionId: this.question.id,
        userAnswer: userAnswer,
        isCorrect: this.isCorrect,
        answerTime: answerTime,
        createTime: Date.now()
      };
      await answerRecordService.saveAnswerRecord(recordInput);
    } catch (error) {
      Logger.error('[WrongPracticePage] Failed to save answer record', error as Error);
    }

    this.showAnswer = true;

    // 自动返回
    setTimeout(() => {
      Router.back();
    }, this.autoReturnDelay);
  }

  private async toggleFavorite(): Promise<void> {
    if (!this.question) return;
    try {
      if (this.isFavorite) {
        await answerRecordService.removeFavorite(this.question.id);
      } else {
        await answerRecordService.addFavorite(this.question.id);
      }
      this.isFavorite = !this.isFavorite;
    } catch (error) {
      Logger.error('[WrongPracticePage] Failed to toggle favorite', error as Error);
    }
  }

  private isOptionCorrect(optionKey: string): boolean {
    if (!this.question) return false;
    return this.question.answer.split(',').includes(optionKey);
  }

  private getQuestionTypeName(type: QuestionType): string {
    switch (type) {
      case QuestionType.SINGLE: return '单选题';
      case QuestionType.MULTIPLE: return '多选题';
      case QuestionType.JUDGE: return '判断题';
      default: return '未知';
    }
  }

  build() {
    Column() {
      this.NavigationBar()

      if (this.isLoading) {
        Column() {
          LoadingProgress().width(48).height(48).color(ThemeColors.PRIMARY)
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else if (this.question) {
        // 题目+选项+解析（整体可滚动）
        Scroll() {
          Column() {
            // 题目信息
            this.QuestionInfo()
            // 题目内容
            this.QuestionContent()
            // 选项列表（紧贴题目）
            this.OptionList()
            // 答案解析
            if (this.showAnswer) {
              this.AnswerAnalysis()
              this.AutoReturnHint()
            }
          }
          .width('100%')
          .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD, bottom: ThemeConstants.SPACING_MD })
          .alignItems(HorizontalAlign.Start)
        }
        .scrollBar(BarState.Off)
        .layoutWeight(1)
        .align(Alignment.Top)

        // 底部操作栏
        if (!this.showAnswer) {
          this.BottomBar()
        }
      } else {
        Column() {
          Text('题目加载失败').fontSize(ThemeConstants.FONT_SIZE_LG).fontColor(ThemeColors.TEXT_SECONDARY)
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(ThemeColors.BACKGROUND)
    .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
  }

  @Builder
  NavigationBar() {
    Row() {
      Row() {
        Image($r('app.media.back')).width(24).height(24)
      }
      .width(40).height(40)
      .justifyContent(FlexAlign.Center)
      .onClick(() => { Router.back(); })

      Text('错题练习')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Row() {
        Text(this.isFavorite ? '⭐' : '☆')
          .fontSize(ThemeConstants.FONT_SIZE_XL)
          .fontColor(this.isFavorite ? ThemeColors.WARNING : ThemeColors.TEXT_HINT)
      }
      .width(40).height(40)
      .justifyContent(FlexAlign.Center)
      .onClick(() => { this.toggleFavorite(); })
    }
    .width('100%')
    .height(56)
    .padding({ left: ThemeConstants.SPACING_SM, right: ThemeConstants.SPACING_SM })
    .backgroundColor(ThemeColors.SURFACE)
  }

  @Builder
  QuestionInfo() {
    Row() {
      // 题型标签
      Text(this.getQuestionTypeName(this.question!.type))
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontColor(ThemeColors.WHITE)
        .padding({ left: 10, right: 10, top: 4, bottom: 4 })
        .backgroundColor(ThemeColors.PRIMARY)
        .borderRadius(10)

      // 科目标签 - 使用科目颜色
      Text(getSubjectShortName(this.question!.subjectId))
        .fontSize(ThemeConstants.FONT_SIZE_XS)
        .fontWeight(FontWeight.Medium)
        .fontColor(ThemeColors.WHITE)
        .padding({ left: 10, right: 10, top: 4, bottom: 4 })
        .backgroundColor(getSubjectColor(this.question!.subjectId))
        .borderRadius(10)
        .margin({ left: ThemeConstants.SPACING_SM })
    }
    .width('100%')
  }

  @Builder
  QuestionContent() {
    Text(this.question!.content)
      .fontSize(ThemeConstants.FONT_SIZE_MD)
      .fontColor(ThemeColors.TEXT_PRIMARY)
      .lineHeight(24)
      .width('100%')
      .margin({ top: ThemeConstants.SPACING_MD })
  }

  @Builder
  OptionList() {
    Column() {
      ForEach(this.question!.options, (option: QuestionOption) => {
        this.OptionItem(option)
      })
    }
    .width('100%')
  }

  @Builder
  OptionItem(option: QuestionOption) {
    Row() {
      Column() {
        Text(option.key)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.getOptionKeyColor(option.key))
      }
      .width(32).height(32)
      .borderRadius(16)
      .backgroundColor(this.getOptionKeyBgColor(option.key))
      .justifyContent(FlexAlign.Center)

      Text(option.content)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.TEXT_PRIMARY)
        .layoutWeight(1)
        .margin({ left: ThemeConstants.SPACING_BASE })

      if (this.showAnswer) {
        if (this.isOptionCorrect(option.key)) {
          Text('✓').fontSize(ThemeConstants.FONT_SIZE_LG).fontColor(ThemeColors.SUCCESS)
        } else if (this.selectedOptions.includes(option.key)) {
          Text('✗').fontSize(ThemeConstants.FONT_SIZE_LG).fontColor(ThemeColors.ERROR)
        }
      }
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_BASE)
    .margin({ top: ThemeConstants.SPACING_SM })
    .backgroundColor(this.getOptionBgColor(option.key))
    .borderRadius(ThemeConstants.RADIUS_MD)
    .border({ width: 1, color: this.getOptionBorderColor(option.key) })
    .onClick(() => { this.selectOption(option.key); })
  }

  private getOptionKeyColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) return ThemeColors.WHITE;
      if (this.selectedOptions.includes(key)) return ThemeColors.WHITE;
    } else if (this.selectedOptions.includes(key)) {
      return ThemeColors.WHITE;
    }
    return ThemeColors.TEXT_SECONDARY;
  }

  private getOptionKeyBgColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) return ThemeColors.SUCCESS;
      if (this.selectedOptions.includes(key)) return ThemeColors.ERROR;
    } else if (this.selectedOptions.includes(key)) {
      return ThemeColors.PRIMARY;
    }
    return ThemeColors.GRAY_100;
  }

  private getOptionBgColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) return 'rgba(82, 196, 26, 0.1)';
      if (this.selectedOptions.includes(key)) return 'rgba(255, 77, 79, 0.1)';
    }
    return ThemeColors.SURFACE;
  }

  private getOptionBorderColor(key: string): string {
    if (this.showAnswer) {
      if (this.isOptionCorrect(key)) return ThemeColors.SUCCESS;
      if (this.selectedOptions.includes(key)) return ThemeColors.ERROR;
    } else if (this.selectedOptions.includes(key)) {
      return ThemeColors.PRIMARY;
    }
    return ThemeColors.BORDER;
  }

  @Builder
  AnswerAnalysis() {
    Column() {
      Row() {
        Text(this.isCorrect ? '✓ 回答正确' : '✗ 回答错误')
          .fontSize(ThemeConstants.FONT_SIZE_MD)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.isCorrect ? ThemeColors.SUCCESS : ThemeColors.ERROR)
      }
      .width('100%')
      .padding({ bottom: ThemeConstants.SPACING_SM })

      Row() {
        Text('正确答案：').fontSize(ThemeConstants.FONT_SIZE_BASE).fontColor(ThemeColors.TEXT_SECONDARY)
        Text(this.question!.answer)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.SUCCESS)
      }
      .width('100%')

      Column() {
        Text('解析：')
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontWeight(FontWeight.Medium)
          .fontColor(ThemeColors.TEXT_PRIMARY)
        Text(this.question!.analysis)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .lineHeight(22)
          .margin({ top: ThemeConstants.SPACING_XS })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .margin({ top: ThemeConstants.SPACING_SM })
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ top: ThemeConstants.SPACING_MD })
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
  }

  @Builder
  AutoReturnHint() {
    Row() {
      Text(this.isCorrect ? '🎉 答对了！即将返回...' : '💪 继续加油！即将返回...')
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(this.isCorrect ? ThemeColors.SUCCESS : ThemeColors.WARNING)
    }
    .width('100%')
    .padding(ThemeConstants.SPACING_MD)
    .margin({ top: ThemeConstants.SPACING_MD })
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  BottomBar() {
    Row() {
      Blank()
      Button('确认答案')
        .width(200)
        .height(44)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .fontColor(ThemeColors.WHITE)
        .backgroundColor(this.selectedOptions.length > 0 ? ThemeColors.PRIMARY : ThemeColors.GRAY_300)
        .borderRadius(ThemeConstants.RADIUS_BASE)
        .enabled(this.selectedOptions.length > 0)
        .onClick(() => { this.submitAnswer(); })
      Blank()
    }
    .width('100%')
    .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD, top: ThemeConstants.SPACING_MD, bottom: 32 })
    .backgroundColor(ThemeColors.SURFACE)
  }
}
