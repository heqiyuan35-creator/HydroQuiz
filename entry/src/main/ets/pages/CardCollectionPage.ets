/**
 * 卡片图鉴页面
 * HydroQuiz - 水利工程检测员刷题宝
 * 网格展示竖向卡片
 */
import { router } from '@kit.ArkUI';
import { KnowledgeCard, UserCard, CardRarity, CollectionProgress } from '../common/types/CardTypes';
import { cardService } from '../services/CardService';
import { CardDetailPopup } from '../components/CardDetailPopup';
import { AppConstants } from '../common/constants/AppConstants';

interface SelectOption {
  value: string;
  label: string;
}

@Entry
@Component
struct CardCollectionPage {
  @State selectedRarity: string = 'all';
  @State selectedSubject: string = 'all';
  @State allCards: KnowledgeCard[] = [];
  @State userCardsMap: Map<string, UserCard> = new Map();
  @State progress: CollectionProgress | null = null;
  @State isLoading: boolean = true;
  @State showDetail: boolean = false;
  @State selectedCard: KnowledgeCard | null = null;
  private rarityOptions: SelectOption[] = [];
  private subjectOptions: SelectOption[] = [];

  aboutToAppear() {
    this.initOptions();
    this.loadData();
  }

  initOptions() {
    this.rarityOptions = [
      { value: 'all', label: '全部' } as SelectOption,
      { value: 'N', label: 'N' } as SelectOption,
      { value: 'R', label: 'R' } as SelectOption,
      { value: 'SR', label: 'SR' } as SelectOption,
      { value: 'SSR', label: 'SSR' } as SelectOption
    ];
    this.subjectOptions = [
      { value: 'all', label: '全部科目' } as SelectOption,
      { value: 'basic', label: '基础知识' } as SelectOption,
      { value: 'concrete', label: '混凝土' } as SelectOption,
      { value: 'geotechnical', label: '岩土' } as SelectOption,
      { value: 'measurement', label: '量测' } as SelectOption,
      { value: 'metal', label: '金属结构' } as SelectOption,
      { value: 'mechanical', label: '机械电气' } as SelectOption,
      { value: 'special', label: '特殊卡片' } as SelectOption
    ];
  }

  async loadData() {
    this.isLoading = true;
    try {
      this.allCards = cardService.getAllCardDefinitions();
      const userCards = await cardService.getUserCards();
      this.userCardsMap = new Map<string, UserCard>();
      for (const uc of userCards) {
        this.userCardsMap.set(uc.cardId, uc);
      }
      this.progress = await cardService.getCollectionProgress();
    } catch (error) {
      console.error('Failed to load card data', error);
    }
    this.isLoading = false;
  }

  getFilteredCards(): KnowledgeCard[] {
    let filtered = this.allCards;
    if (this.selectedRarity !== 'all') {
      filtered = filtered.filter(c => c.rarity === this.selectedRarity);
    }
    if (this.selectedSubject !== 'all') {
      filtered = filtered.filter(c => c.subjectId === this.selectedSubject);
    }
    const rarityOrder: Record<string, number> = { 'SSR': 4, 'SR': 3, 'R': 2, 'N': 1 };
    filtered.sort((a, b) => (rarityOrder[b.rarity] || 0) - (rarityOrder[a.rarity] || 0));
    return filtered;
  }

  getRarityColor(rarity: string): string {
    switch (rarity) {
      case 'N': return '#9E9E9E';
      case 'R': return '#2196F3';
      case 'SR': return '#9C27B0';
      case 'SSR': return '#FF9800';
      default: return '#666666';
    }
  }

  getRarityProgressText(rarity: string): string {
    if (!this.progress) return '0/0';
    const rarityProgress = this.progress.byRarity.get(rarity as CardRarity);
    if (rarityProgress) return `${rarityProgress.collected}/${rarityProgress.total}`;
    return '0/0';
  }

  build() {
    Stack() {
      Column() {
        // 顶部导航栏
        Row() {
          Image($r('app.media.back'))
            .width(24).height(24).fillColor('#FFFFFF')
            .onClick(() => router.back())
          Text('卡片图鉴')
            .fontSize(18).fontWeight(FontWeight.Bold).fontColor('#FFFFFF').margin({ left: 16 })
          Blank()
        }
        .width('100%').height(56).padding({ left: 16, right: 16 }).backgroundColor('#1a1a2e')

        // 收集进度
        if (this.progress) {
          Column() {
            Row() {
              Text('收集进度').fontSize(14).fontColor('rgba(255,255,255,0.7)')
              Blank()
              Text(`${this.progress.collected}/${this.progress.total}`)
                .fontSize(14).fontWeight(FontWeight.Bold).fontColor('#FFD700')
            }.width('100%')
            Progress({ value: this.progress.collected, total: this.progress.total })
              .width('100%').height(8).color('#FFD700').backgroundColor('rgba(255,255,255,0.1)').margin({ top: 8 })
            Row() {
              ForEach(this.rarityOptions.filter(r => r.value !== 'all'), (item: SelectOption) => {
                Column() {
                  Text(item.label).fontSize(12).fontColor(this.getRarityColor(item.value)).fontWeight(FontWeight.Bold)
                  Text(this.getRarityProgressText(item.value)).fontSize(10).fontColor('rgba(255,255,255,0.5)').margin({ top: 2 })
                }.margin({ right: 16 })
              })
            }.width('100%').margin({ top: 12 })
          }.width('100%').padding(16).backgroundColor('#252540')
        }

        // 稀有度筛选
        Row() {
          ForEach(this.rarityOptions, (item: SelectOption) => {
            Text(item.label)
              .fontSize(12)
              .fontColor(this.selectedRarity === item.value ? '#FFFFFF' : 'rgba(255,255,255,0.5)')
              .backgroundColor(this.selectedRarity === item.value ? this.getRarityColor(item.value) : 'transparent')
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
              .borderRadius(12)
              .margin({ right: 8 })
              .onClick(() => { this.selectedRarity = item.value; })
          })
        }.width('100%').padding({ left: 16, right: 16, top: 12, bottom: 8 })

        // 科目筛选
        Scroll() {
          Row() {
            ForEach(this.subjectOptions, (item: SelectOption) => {
              Text(item.label)
                .fontSize(11)
                .fontColor(this.selectedSubject === item.value ? '#FFFFFF' : 'rgba(255,255,255,0.5)')
                .backgroundColor(this.selectedSubject === item.value ? '#4CAF50' : 'rgba(255,255,255,0.1)')
                .padding({ left: 8, right: 8, top: 4, bottom: 4 })
                .borderRadius(8)
                .margin({ right: 8 })
                .onClick(() => { this.selectedSubject = item.value; })
            })
          }
        }.scrollable(ScrollDirection.Horizontal).scrollBar(BarState.Off).width('100%').padding({ left: 16, right: 16, bottom: 12 })

        // 卡片网格
        if (this.isLoading) {
          Column() {
            LoadingProgress().width(40).height(40).color('#FFD700')
            Text('加载中...').fontSize(14).fontColor('rgba(255,255,255,0.5)').margin({ top: 12 })
          }.width('100%').layoutWeight(1).justifyContent(FlexAlign.Center)
        } else {
          Scroll() {
            Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
              ForEach(this.getFilteredCards(), (card: KnowledgeCard) => {
                Column() {
                  CollectionCard({
                    cardDef: card,
                    userCard: this.userCardsMap.get(card.id) || null,
                    isCollected: this.userCardsMap.has(card.id),
                    onCardClick: () => {
                      if (this.userCardsMap.has(card.id)) {
                        this.selectedCard = card;
                        this.showDetail = true;
                      }
                    }
                  })
                }.width('50%').padding(6)
              })
            }.width('100%').padding({ left: 6, right: 6, bottom: 20 })
          }.layoutWeight(1)
        }
      }
      .width('100%').height('100%').backgroundColor('#1a1a2e')
      .padding({ top: AppConstants.STATUS_BAR_HEIGHT })

      if (this.showDetail && this.selectedCard) {
        CardDetailPopup({
          cardDef: this.selectedCard,
          userCard: this.userCardsMap.get(this.selectedCard.id) || null,
          onClose: () => {
            this.showDetail = false;
            this.selectedCard = null;
          }
        })
      }
    }
  }
}


/**
 * 图鉴卡片组件（支持未收集状态）
 */
@Component
struct CollectionCard {
  @Prop cardDef: KnowledgeCard;
  @Prop userCard: UserCard | null = null;
  @Prop isCollected: boolean = false;
  @State rotateX: number = 0;
  @State rotateY: number = 0;
  @State cardScale: number = 1;
  @State isPressed: boolean = false;
  onCardClick: () => void = () => {};

  getRarityColor(): string {
    switch (this.cardDef.rarity) {
      case CardRarity.N: return '#9E9E9E';
      case CardRarity.R: return '#2196F3';
      case CardRarity.SR: return '#9C27B0';
      case CardRarity.SSR: return '#FF9800';
      default: return '#9E9E9E';
    }
  }

  getRarityName(): string {
    switch (this.cardDef.rarity) {
      case CardRarity.N: return '普通';
      case CardRarity.R: return '稀有';
      case CardRarity.SR: return '史诗';
      case CardRarity.SSR: return '传说';
      default: return '普通';
    }
  }

  getCardIcon(): string {
    if (!this.isCollected) return '❓';
    const subjectId: string = this.cardDef.subjectId;
    if (subjectId.includes('geotechnical')) return '🏔️';
    if (subjectId.includes('concrete')) return '🧱';
    if (subjectId.includes('metal')) return '⚙️';
    if (subjectId.includes('mechanical')) return '🔧';
    if (subjectId.includes('survey')) return '📐';
    return '📚';
  }

  getSubjectName(): string {
    const subjectId: string = this.cardDef.subjectId;
    if (subjectId.includes('geotechnical')) return '岩土工程';
    if (subjectId.includes('concrete')) return '混凝土';
    if (subjectId.includes('metal')) return '金属结构';
    if (subjectId.includes('mechanical')) return '机械电气';
    if (subjectId.includes('survey')) return '测量';
    return '综合';
  }

  build() {
    Column() {
      Column() {
        // 顶部稀有度
        Row() {
          Text(this.cardDef.rarity)
            .fontSize(10)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
            .backgroundColor(this.isCollected ? this.getRarityColor() : '#444444')
            .padding({ left: 8, right: 8, top: 2, bottom: 2 })
            .borderRadius(8)
          Blank()
          Text(this.getRarityName())
            .fontSize(10)
            .fontColor(this.isCollected ? this.getRarityColor() : '#666666')
        }
        .width('100%')
        .padding({ left: 10, right: 10, top: 10 })

        // 图标
        Stack() {
          if (this.isCollected && (this.cardDef.rarity === CardRarity.SR || this.cardDef.rarity === CardRarity.SSR)) {
            Column()
              .width(60).height(60).borderRadius(30)
              .backgroundColor(this.getRarityColor())
              .opacity(0.3).blur(15)
          }
          Text(this.getCardIcon())
            .fontSize(this.isCollected ? 48 : 36)
            .opacity(this.isCollected ? 1 : 0.3)
        }
        .margin({ top: 12 })

        // 名称
        Text(this.isCollected ? this.cardDef.name : '???')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.isCollected ? '#FFFFFF' : '#555555')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: 10 })

        // 星级
        if (this.isCollected && this.userCard) {
          Row() {
            ForEach([1, 2, 3, 4, 5], (star: number) => {
              Text(star <= this.userCard!.starLevel ? '★' : '☆')
                .fontSize(14)
                .fontColor(star <= this.userCard!.starLevel ? '#FFD700' : '#444444')
            })
          }.margin({ top: 6 })
        } else {
          Row() {
            ForEach([1, 2, 3, 4, 5], (_: number) => {
              Text('☆').fontSize(14).fontColor('#333333')
            })
          }.margin({ top: 6 })
        }

        // 科目
        Text(this.getSubjectName())
          .fontSize(10)
          .fontColor(this.isCollected ? 'rgba(255,255,255,0.6)' : 'rgba(255,255,255,0.3)')
          .padding({ left: 8, right: 8, top: 3, bottom: 3 })
          .backgroundColor('rgba(255,255,255,0.1)')
          .borderRadius(8)
          .margin({ top: 8 })

        Blank()

        // 底部
        if (this.isCollected && this.userCard) {
          Row() {
            Text(`碎片:${this.userCard.fragments}`).fontSize(9).fontColor('rgba(255,255,255,0.4)')
            Blank()
            Text(`获取:${this.userCard.obtainCount}次`).fontSize(9).fontColor('rgba(255,255,255,0.4)')
          }.width('100%').padding({ left: 10, right: 10, bottom: 10 })
        } else {
          Text('未收集')
            .fontSize(10)
            .fontColor('rgba(255,255,255,0.3)')
            .margin({ bottom: 10 })
        }
      }
      .width('100%')
      .height(220)
      .linearGradient({
        angle: 180,
        colors: this.isCollected
          ? [['#2a2a3e', 0], ['#1a1a2e', 0.5], ['#0f0f1a', 1]]
          : [['#1a1a1a', 0], ['#0f0f0f', 1]]
      })
      .borderRadius(12)
      .border({
        width: 2,
        color: this.isCollected ? this.getRarityColor() : '#333333'
      })
      .shadow({
        radius: this.isPressed ? 15 : 8,
        color: this.isCollected ? this.getRarityColor() + '60' : 'rgba(0,0,0,0.3)',
        offsetX: 0,
        offsetY: this.isPressed ? 2 : 4
      })
      .opacity(this.isCollected ? 1 : 0.6)
      .rotate({ x: 1, y: 0, z: 0, angle: this.rotateX, centerX: '50%', centerY: '50%' })
      .rotate({ x: 0, y: 1, z: 0, angle: this.rotateY, centerX: '50%', centerY: '50%' })
      .scale({ x: this.cardScale, y: this.cardScale })
      .animation({ duration: 150, curve: Curve.EaseOut })
    }
    .gesture(
      GestureGroup(GestureMode.Parallel,
        PanGesture({ direction: PanDirection.All })
          .onActionStart(() => {
            if (this.isCollected) {
              this.isPressed = true;
              this.cardScale = 1.02;
            }
          })
          .onActionUpdate((event: GestureEvent) => {
            if (this.isCollected) {
              this.rotateY = Math.max(-12, Math.min(12, event.offsetX * 0.2));
              this.rotateX = Math.max(-12, Math.min(12, -event.offsetY * 0.2));
            }
          })
          .onActionEnd(() => {
            animateTo({ duration: 300, curve: Curve.EaseOut }, () => {
              this.rotateX = 0;
              this.rotateY = 0;
              this.cardScale = 1;
              this.isPressed = false;
            });
          }),
        TapGesture()
          .onAction(() => {
            this.onCardClick();
          })
      )
    )
  }
}
