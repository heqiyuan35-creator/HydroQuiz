/**
 * 卡片掉落弹窗组件
 * HydroQuiz - 水利工程检测员刷题宝
 * 真实卡片掉落效果
 */
import { DroppedCard, CardRarity } from '../common/types/CardTypes';

/**
 * 线性渐变颜色项
 */
interface GradientColorStop {
  color: string;
  offset: number;
}

/**
 * 线性渐变类
 */
class LinearGradient {
  colors: GradientColorStop[];
  constructor(colors: GradientColorStop[]) {
    this.colors = colors;
  }
}

@Component
export struct CardDropPopup {
  @Prop droppedCard: DroppedCard;
  @State cardScale: number = 0;
  @State cardRotateY: number = -180;
  @State cardRotateZ: number = -30;
  @State cardOffsetY: number = -200;
  @State showBack: boolean = false;
  @State glowOpacity: number = 0;
  @State isFlipping: boolean = false;
  // 触摸摆动
  @State touchRotateX: number = 0;
  @State touchRotateY: number = 0;
  @State bgOpacity: number = 0;
  onClose: () => void = () => {};

  aboutToAppear() {
    // 背景淡入
    animateTo({ duration: 200 }, () => {
      this.bgOpacity = 1;
    });

    // 入场动画：从上方飘落 + 旋转展开
    setTimeout(() => {
      animateTo({
        duration: 600,
        curve: Curve.EaseOut
      }, () => {
        this.cardOffsetY = 0;
        this.cardRotateZ = 0;
        this.cardScale = 1;
      });
      
      setTimeout(() => {
        animateTo({
          duration: 500,
          curve: Curve.EaseInOut
        }, () => {
          this.cardRotateY = 0;
        });
      }, 300);
    }, 100);

    // SR/SSR光效
    if (this.droppedCard.card.rarity === CardRarity.SR || 
        this.droppedCard.card.rarity === CardRarity.SSR) {
      animateTo({
        duration: 1000,
        curve: Curve.EaseInOut,
        iterations: -1,
        playMode: PlayMode.Alternate
      }, () => {
        this.glowOpacity = 0.6;
      });
    }
  }

  // 获取稀有度颜色
  getRarityColor(): string {
    switch (this.droppedCard.card.rarity) {
      case CardRarity.N: return '#9E9E9E';
      case CardRarity.R: return '#2196F3';
      case CardRarity.SR: return '#9C27B0';
      case CardRarity.SSR: return '#FF9800';
      default: return '#9E9E9E';
    }
  }

  // 获取卡片图标
  getCardIcon(): string {
    const subjectId: string = this.droppedCard.card.subjectId;
    if (subjectId.includes('geotechnical')) return '🏔️';
    if (subjectId.includes('concrete')) return '🧱';
    if (subjectId.includes('metal')) return '⚙️';
    if (subjectId.includes('mechanical')) return '🔧';
    if (subjectId.includes('survey')) return '📐';
    return '📚';
  }

  // 获取科目名称
  getSubjectName(): string {
    const subjectId: string = this.droppedCard.card.subjectId;
    if (subjectId.includes('geotechnical')) return '岩土工程';
    if (subjectId.includes('concrete')) return '混凝土';
    if (subjectId.includes('metal')) return '金属结构';
    if (subjectId.includes('mechanical')) return '机械电气';
    if (subjectId.includes('survey')) return '测量';
    return '综合';
  }

  // 翻转卡片
  private flipCard(): void {
    if (this.isFlipping) return;
    this.isFlipping = true;
    animateTo({
      duration: 400,
      curve: Curve.EaseInOut,
      onFinish: () => {
        this.isFlipping = false;
      }
    }, () => {
      this.showBack = !this.showBack;
    });
  }

  build() {
    Stack() {
      // 背景遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.85)')
        .opacity(this.bgOpacity)
        .onClick(() => this.onClose())

      // 卡片容器
      Column() {
        // SR/SSR光效
        if (this.droppedCard.card.rarity === CardRarity.SR || 
            this.droppedCard.card.rarity === CardRarity.SSR) {
          Column()
            .width(300)
            .height(460)
            .borderRadius(20)
            .backgroundColor(this.getRarityColor())
            .opacity(this.glowOpacity)
            .blur(30)
            .position({ x: -10, y: -10 })
        }

        // 卡片主体
        Stack() {
          if (!this.showBack) {
            this.CardFront()
          } else {
            this.CardBack()
          }
        }
        .width(280)
        .height(440)
        .borderRadius(20)
        .clip(true)
        .shadow({
          radius: 30,
          color: this.getRarityColor() + '80',
          offsetX: 0,
          offsetY: 10
        })
        .scale({ x: this.cardScale, y: this.cardScale })
        .rotate({ 
          x: 1,
          y: 0,
          z: 0,
          angle: this.touchRotateX,
          centerX: '50%',
          centerY: '50%'
        })
        .rotate({ 
          x: 0,
          y: 1,
          z: 0,
          angle: this.cardRotateY + this.touchRotateY,
          centerX: '50%',
          centerY: '50%'
        })
        .rotate({
          x: 0,
          y: 0, 
          z: 1,
          angle: this.cardRotateZ
        })
        .translate({ y: this.cardOffsetY })
        .gesture(
          GestureGroup(GestureMode.Parallel,
            PanGesture({ direction: PanDirection.All })
              .onActionUpdate((event: GestureEvent) => {
                this.touchRotateY = Math.max(-20, Math.min(20, event.offsetX * 0.2));
                this.touchRotateX = Math.max(-20, Math.min(20, -event.offsetY * 0.2));
              })
              .onActionEnd(() => {
                animateTo({ duration: 300, curve: Curve.EaseOut }, () => {
                  this.touchRotateX = 0;
                  this.touchRotateY = 0;
                });
              }),
            TapGesture()
              .onAction(() => {
                this.flipCard();
              })
          )
        )

        // 操作按钮
        Row() {
          // 翻转提示
          Column() {
            Text('🔄')
              .fontSize(20)
            Text(this.showBack ? '看正面' : '看解析')
              .fontSize(11)
              .fontColor('rgba(255,255,255,0.7)')
              .margin({ top: 4 })
          }
          .onClick(() => this.flipCard())
          .margin({ right: 40 })

          // 收下按钮
          Button('收下卡片')
            .width(140)
            .height(44)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
            .backgroundColor('#4CAF50')
            .shadow({ radius: 8, color: '#4CAF50' })
            .onClick(() => this.onClose())
        }
        .margin({ top: 24 })
        .opacity(this.cardScale)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }

  // 卡片正面
  @Builder
  CardFront() {
    Column() {
      // 顶部装饰
      Row()
        .width('100%')
        .height(6)
        .linearGradient({
          angle: 90,
          colors: [['transparent', 0], [this.getRarityColor(), 0.2], [this.getRarityColor(), 0.8], ['transparent', 1]]
        })

      // 顶部标识
      Row() {
        if (this.droppedCard.isNew) {
          Text('✨ NEW')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
            .backgroundColor('#FF5722')
            .padding({ left: 8, right: 8, top: 3, bottom: 3 })
            .borderRadius(10)
            .shadow({ radius: 4, color: '#FF5722' })
        }
        Blank()
        Text(this.droppedCard.card.rarity)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .backgroundColor(this.getRarityColor())
          .padding({ left: 10, right: 10, top: 3, bottom: 3 })
          .borderRadius(10)
          .shadow({ radius: 6, color: this.getRarityColor() })
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 12 })

      // 卡片图标
      Stack() {
        Column()
          .width(100)
          .height(100)
          .borderRadius(50)
          .backgroundColor(this.getRarityColor())
          .opacity(0.2)
          .blur(20)

        Text(this.getCardIcon())
          .fontSize(72)
      }
      .margin({ top: 24 })

      // 卡片名称
      Text(this.droppedCard.card.name)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FFFFFF')
        .margin({ top: 16 })
        .textShadow({ radius: 4, color: this.getRarityColor() })

      // 碎片信息
      if (!this.droppedCard.isNew && this.droppedCard.fragmentCount > 0) {
        Row() {
          Text('💎')
            .fontSize(16)
          Text(`碎片 +${this.droppedCard.fragmentCount}`)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFD700')
            .margin({ left: 4 })
        }
        .margin({ top: 8 })
      }

      // 科目标签
      Text(this.getSubjectName())
        .fontSize(12)
        .fontColor('rgba(255,255,255,0.6)')
        .padding({ left: 12, right: 12, top: 4, bottom: 4 })
        .backgroundColor('rgba(255,255,255,0.1)')
        .borderRadius(10)
        .margin({ top: 12 })

      // 知识点预览
      Scroll() {
        Text(this.droppedCard.card.backContent)
          .fontSize(13)
          .fontColor('rgba(255,255,255,0.8)')
          .lineHeight(20)
          .textAlign(TextAlign.Center)
          .padding({ left: 16, right: 16 })
      }
      .layoutWeight(1)
      .margin({ top: 16 })

      // 底部装饰
      Row()
        .width('100%')
        .height(4)
        .linearGradient({
          angle: 90,
          colors: [['transparent', 0], [this.getRarityColor(), 0.3], [this.getRarityColor(), 0.7], ['transparent', 1]]
        })
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      angle: 180,
      colors: [['#2a2a3e', 0], ['#1a1a2e', 0.5], ['#0f0f1a', 1]]
    })
    .border({
      width: 3,
      color: this.getRarityColor()
    })
    .borderRadius(20)
  }

  // 卡片背面（解析）
  @Builder
  CardBack() {
    Column() {
      Row()
        .width('100%')
        .height(6)
        .linearGradient({
          angle: 90,
          colors: [[this.getRarityColor(), 0], ['#FFD700', 0.5], [this.getRarityColor(), 1]]
        })

      Row() {
        Text('📖')
          .fontSize(20)
        Text('知识解析')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFD700')
          .margin({ left: 8 })
      }
      .margin({ top: 16 })

      Scroll() {
        Column() {
          if (this.droppedCard.card.questionAnalysis) {
            Column() {
              Text('💡 解析')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#4CAF50')
                .alignSelf(ItemAlign.Start)

              Text(this.droppedCard.card.questionAnalysis)
                .fontSize(13)
                .fontColor('rgba(255,255,255,0.9)')
                .lineHeight(22)
                .margin({ top: 8 })
            }
            .width('100%')
            .padding(12)
            .backgroundColor('rgba(76,175,80,0.1)')
            .borderRadius(12)
            .margin({ top: 12 })
          }

          if (this.droppedCard.card.examPoint) {
            Column() {
              Text('📌 考点')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FF9800')
                .alignSelf(ItemAlign.Start)

              Text(this.droppedCard.card.examPoint)
                .fontSize(13)
                .fontColor('rgba(255,255,255,0.9)')
                .lineHeight(20)
                .margin({ top: 8 })
            }
            .width('100%')
            .padding(12)
            .backgroundColor('rgba(255,152,0,0.1)')
            .borderRadius(12)
            .margin({ top: 12 })
          }

          if (this.droppedCard.card.memoryTip) {
            Column() {
              Text('🧠 记忆口诀')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#E040FB')
                .alignSelf(ItemAlign.Start)

              Text(this.droppedCard.card.memoryTip)
                .fontSize(13)
                .fontColor('#E040FB')
                .lineHeight(20)
                .margin({ top: 8 })
            }
            .width('100%')
            .padding(12)
            .backgroundColor('rgba(224,64,251,0.1)')
            .borderRadius(12)
            .margin({ top: 12 })
          }
        }
        .padding({ left: 16, right: 16, bottom: 16 })
      }
      .layoutWeight(1)

      Row()
        .width('100%')
        .height(4)
        .linearGradient({
          angle: 90,
          colors: [[this.getRarityColor(), 0], ['#FFD700', 0.5], [this.getRarityColor(), 1]]
        })
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      angle: 180,
      colors: [['#1a2a1a', 0], ['#0f1a0f', 0.5], ['#0a0f0a', 1]]
    })
    .border({
      width: 3,
      color: '#FFD700'
    })
    .borderRadius(20)
  }
}
