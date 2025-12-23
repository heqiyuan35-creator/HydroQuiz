/**
 * 我的卡册页面
 * HydroQuiz - 水利工程检测员刷题宝
 */
import { router } from '@kit.ArkUI';
import { KnowledgeCard, UserCard, CardRarity, CardFilter, DropStatistics, CardContentType } from '../common/types/CardTypes';
import { cardService } from '../services/CardService';
import { cardStatisticsService } from '../services/CardStatisticsService';
import { CardItem } from '../components/CardItem';
import { CardDetailPopup } from '../components/CardDetailPopup';

/**
 * 选项接口
 */
interface SelectOption {
  value: string;
  label: string;
}

@Entry
@Component
struct CardAlbumPage {
  @State userCards: UserCard[] = [];
  @State cardDefsMap: Map<string, KnowledgeCard> = new Map();
  @State sortBy: string = 'time';
  @State filterRarity: string = 'all';
  @State isLoading: boolean = true;
  @State showDetail: boolean = false;
  @State selectedCard: KnowledgeCard | null = null;
  @State selectedUserCard: UserCard | null = null;
  @State statistics: DropStatistics | null = null;
  @State todayDropCount: number = 0;

  private sortOptions: SelectOption[] = [];
  private rarityOptions: SelectOption[] = [];

  aboutToAppear() {
    this.initOptions();
    this.loadData();
  }

  initOptions() {
    this.sortOptions = [
      { value: 'time', label: '获取时间' } as SelectOption,
      { value: 'rarity', label: '稀有度' } as SelectOption,
      { value: 'star', label: '星级' } as SelectOption
    ];

    this.rarityOptions = [
      { value: 'all', label: '全部' } as SelectOption,
      { value: 'N', label: 'N' } as SelectOption,
      { value: 'R', label: 'R' } as SelectOption,
      { value: 'SR', label: 'SR' } as SelectOption,
      { value: 'SSR', label: 'SSR' } as SelectOption
    ];
  }

  async loadData() {
    this.isLoading = true;
    try {
      // 加载卡片定义
      const allDefs = cardService.getAllCardDefinitions();
      this.cardDefsMap = new Map<string, KnowledgeCard>();
      for (const c of allDefs) {
        this.cardDefsMap.set(c.id, c);
      }
      
      // 加载用户卡片
      await this.loadUserCards();
      
      // 加载统计数据
      this.statistics = await cardStatisticsService.getDropStatistics();
      this.todayDropCount = await cardStatisticsService.getTodayDropCount();
    } catch (error) {
      console.error('Failed to load data', error);
    }
    this.isLoading = false;
  }

  async loadUserCards() {
    const filter: CardFilter = {
      sortBy: this.sortBy as 'time' | 'rarity' | 'star',
      sortOrder: 'desc'
    };
    
    if (this.filterRarity !== 'all') {
      filter.rarity = this.filterRarity as CardRarity;
    }
    
    this.userCards = await cardService.filterUserCards(filter);
  }

  // 获取稀有度颜色
  getRarityColor(rarity: string): string {
    switch (rarity) {
      case 'N': return '#9E9E9E';
      case 'R': return '#2196F3';
      case 'SR': return '#9C27B0';
      case 'SSR': return '#FF9800';
      default: return '#666666';
    }
  }

  // 格式化时间
  formatTime(timestamp: number): string {
    const date = new Date(timestamp);
    const now = new Date();
    const diff = now.getTime() - timestamp;
    
    if (diff < 60000) return '刚刚';
    if (diff < 3600000) return `${Math.floor(diff / 60000)}分钟前`;
    if (diff < 86400000) return `${Math.floor(diff / 3600000)}小时前`;
    if (diff < 604800000) return `${Math.floor(diff / 86400000)}天前`;
    
    return `${date.getMonth() + 1}月${date.getDate()}日`;
  }

  build() {
    Stack() {
      Column() {
        // 顶部导航栏
        Row() {
          Image("")
            .width(24)
            .height(24)
            .fillColor('#FFFFFF')
            .onClick(() => router.back())

          Text('')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
            .margin({ left: 16 })

          Blank()

          // 图鉴入口
          Text('')
            .fontSize(14)
            .fontColor('#FFD700')
            .onClick(() => {
              router.pushUrl({ url: 'pages/CardCollectionPage' });
            })
        }
        .width('100%')
        .height(56)
        .padding({ left: 16, right: 16 })
        .backgroundColor('#1a1a2e')

        // 统计信息
        Row() {
          // 卡片数量
          Column() {
            Text(`${this.userCards.length}`)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFD700')
            Text('已收集')
              .fontSize(12)
              .fontColor('rgba(255,255,255,0.5)')
          }
          .layoutWeight(1)

          // 今日获得
          Column() {
            Text(`${this.todayDropCount}`)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#4CAF50')
            Text('今日获得')
              .fontSize(12)
              .fontColor('rgba(255,255,255,0.5)')
          }
          .layoutWeight(1)

          // 欧气值
          Column() {
            Text(`${this.statistics?.luckValue || 50}`)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#E040FB')
            Text('欧气值')
              .fontSize(12)
              .fontColor('rgba(255,255,255,0.5)')
          }
          .layoutWeight(1)

          // 总掉落
          Column() {
            Text(`${this.statistics?.totalDrops || 0}`)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#2196F3')
            Text('总掉落')
              .fontSize(12)
              .fontColor('rgba(255,255,255,0.5)')
          }
          .layoutWeight(1)
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#252540')

        // 筛选和排序栏
        Row() {
          // 稀有度筛选
          Row() {
            ForEach(this.rarityOptions, (item: SelectOption) => {
              Text(item.label)
                .fontSize(11)
                .fontColor(this.filterRarity === item.value ? '#FFFFFF' : 'rgba(255,255,255,0.5)')
                .backgroundColor(this.filterRarity === item.value ? this.getRarityColor(item.value) : 'transparent')
                .padding({ left: 8, right: 8, top: 3, bottom: 3 })
                .borderRadius(10)
                .margin({ right: 6 })
                .onClick(() => {
                  this.filterRarity = item.value;
                  this.loadUserCards();
                })
            })
          }

          Blank()

          // 排序选择
          Row() {
            Text('排序:')
              .fontSize(11)
              .fontColor('rgba(255,255,255,0.5)')
            ForEach(this.sortOptions, (item: SelectOption) => {
              Text(item.label)
                .fontSize(11)
                .fontColor(this.sortBy === item.value ? '#FFD700' : 'rgba(255,255,255,0.5)')
                .margin({ left: 8 })
                .onClick(() => {
                  this.sortBy = item.value;
                  this.loadUserCards();
                })
            })
          }
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 12, bottom: 12 })

        // 卡片列表
        if (this.isLoading) {
          Column() {
            LoadingProgress()
              .width(40)
              .height(40)
              .color('#FFD700')
            Text('加载中...')
              .fontSize(14)
              .fontColor('rgba(255,255,255,0.5)')
              .margin({ top: 12 })
          }
          .width('100%')
          .height(300)
          .justifyContent(FlexAlign.Center)
        } else if (this.userCards.length === 0) {
          Column() {
            Text('🎴')
              .fontSize(60)
              .opacity(0.3)
            Text('还没有收集到卡片')
              .fontSize(14)
              .fontColor('rgba(255,255,255,0.5)')
              .margin({ top: 12 })
            Text('答题有机会获得卡片哦~')
              .fontSize(12)
              .fontColor('rgba(255,255,255,0.3)')
              .margin({ top: 4 })
          }
          .width('100%')
          .height(300)
          .justifyContent(FlexAlign.Center)
        } else {
          List() {
            ForEach(this.userCards, (userCard: UserCard) => {
              ListItem() {
                this.CardListItem(userCard)
              }
            })
          }
          .width('100%')
          .layoutWeight(1)
          .padding({ left: 16, right: 16, bottom: 20 })
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#1a1a2e')

      // 卡片详情弹窗
      if (this.showDetail && this.selectedCard) {
        CardDetailPopup({
          cardDef: this.selectedCard,
          userCard: this.selectedUserCard,
          onClose: () => {
            this.showDetail = false;
            this.selectedCard = null;
            this.selectedUserCard = null;
          }
        })
      }
    }
  }

  @Builder
  CardListItem(userCard: UserCard) {
    Row() {
      // 真实卡片缩略图
      CardItem({
        cardDef: this.cardDefsMap.get(userCard.cardId) || this.getDefaultCard(userCard.cardId),
        userCard: userCard,
        isCollected: true,
        onCardClick: () => {
          const cardDef = this.cardDefsMap.get(userCard.cardId);
          if (cardDef) {
            this.selectedCard = cardDef;
            this.selectedUserCard = userCard;
            this.showDetail = true;
          }
        }
      })

      // 卡片信息
      Column() {
        Row() {
          Text(this.cardDefsMap.get(userCard.cardId)?.name || '未知卡片')
            .fontSize(15)
            .fontWeight(FontWeight.Medium)
            .fontColor('#FFFFFF')
          
          Text(this.cardDefsMap.get(userCard.cardId)?.rarity || 'N')
            .fontSize(10)
            .fontColor('#FFFFFF')
            .backgroundColor(this.getRarityColor(this.cardDefsMap.get(userCard.cardId)?.rarity || 'N'))
            .padding({ left: 4, right: 4, top: 1, bottom: 1 })
            .borderRadius(2)
            .margin({ left: 8 })
        }

        // 星级
        Row() {
          ForEach([1, 2, 3, 4, 5], (star: number) => {
            Text(star <= userCard.starLevel ? '★' : '☆')
              .fontSize(12)
              .fontColor(star <= userCard.starLevel ? '#FFD700' : '#666666')
          })
          
          if (userCard.starLevel >= 5) {
            Text('MAX')
              .fontSize(8)
              .fontColor('#FFFFFF')
              .backgroundColor('#FF5722')
              .padding({ left: 3, right: 3, top: 1, bottom: 1 })
              .borderRadius(2)
              .margin({ left: 4 })
          }
        }
        .margin({ top: 4 })

        // 碎片进度
        Row() {
          Text(`碎片: ${userCard.fragments}`)
            .fontSize(11)
            .fontColor('rgba(255,255,255,0.5)')
          
          Text(`获取: ${userCard.obtainCount}次`)
            .fontSize(11)
            .fontColor('rgba(255,255,255,0.5)')
            .margin({ left: 12 })
        }
        .margin({ top: 4 })
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 12 })
      .layoutWeight(1)

      // 获取时间
      Text(this.formatTime(userCard.lastObtainTime))
        .fontSize(11)
        .fontColor('rgba(255,255,255,0.3)')
    }
    .width('100%')
    .padding(12)
    .backgroundColor('#252540')
    .borderRadius(12)
    .margin({ bottom: 8 })
  }

  // 获取默认卡片定义
  private getDefaultCard(cardId: string): KnowledgeCard {
    const defaultCard: KnowledgeCard = {
      id: cardId,
      name: '未知卡片',
      rarity: CardRarity.N,
      subjectId: 'unknown',
      contentType: CardContentType.KNOWLEDGE,
      frontImage: '',
      backContent: '',
      questionAnalysis: '',
      isLimited: false
    };
    return defaultCard;
  }
}
