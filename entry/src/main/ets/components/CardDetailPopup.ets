/**
 * 卡片详情弹窗组件
 * HydroQuiz - 水利工程检测员刷题宝
 * 放大查看卡片详情和解析
 */
import { KnowledgeCard, UserCard, CardRarity } from '../common/types/CardTypes';

@Component
export struct CardDetailPopup {
  @Prop cardDef: KnowledgeCard;
  @Prop userCard: UserCard | null = null;
  // 动画状态
  @State cardScale: number = 0.3;
  @State cardOpacity: number = 0;
  @State bgOpacity: number = 0;
  @State showBack: boolean = false;
  @State flipAngle: number = 0;
  // 触摸摆动
  @State rotateX: number = 0;
  @State rotateY: number = 0;
  @State isPressed: boolean = false;
  onClose: () => void = () => {};

  aboutToAppear() {
    // 入场动画
    setTimeout(() => {
      animateTo({ duration: 300, curve: Curve.EaseOut }, () => {
        this.bgOpacity = 1;
        this.cardScale = 1;
        this.cardOpacity = 1;
      });
    }, 50);
  }

  // 关闭动画
  private closeWithAnimation(): void {
    animateTo({ duration: 200, curve: Curve.EaseIn }, () => {
      this.cardScale = 0.3;
      this.cardOpacity = 0;
      this.bgOpacity = 0;
    });
    setTimeout(() => {
      this.onClose();
    }, 200);
  }

  // 翻转卡片
  private flipCard(): void {
    animateTo({ duration: 300, curve: Curve.EaseInOut }, () => {
      this.flipAngle = this.showBack ? 0 : 180;
    });
    setTimeout(() => {
      this.showBack = !this.showBack;
    }, 150);
  }

  // 获取稀有度颜色
  getRarityColor(): string {
    switch (this.cardDef.rarity) {
      case CardRarity.N: return '#9E9E9E';
      case CardRarity.R: return '#2196F3';
      case CardRarity.SR: return '#9C27B0';
      case CardRarity.SSR: return '#FF9800';
      default: return '#9E9E9E';
    }
  }

  // 获取稀有度名称
  getRarityName(): string {
    switch (this.cardDef.rarity) {
      case CardRarity.N: return '普通';
      case CardRarity.R: return '稀有';
      case CardRarity.SR: return '史诗';
      case CardRarity.SSR: return '传说';
      default: return '普通';
    }
  }

  // 获取卡片图标
  getCardIcon(): string {
    const subjectId: string = this.cardDef.subjectId;
    if (subjectId.includes('geotechnical')) return '🏔️';
    if (subjectId.includes('concrete')) return '🧱';
    if (subjectId.includes('metal')) return '⚙️';
    if (subjectId.includes('mechanical')) return '🔧';
    if (subjectId.includes('survey')) return '📐';
    return '📚';
  }

  // 获取科目名称
  getSubjectName(): string {
    const subjectId: string = this.cardDef.subjectId;
    if (subjectId.includes('geotechnical')) return '岩土工程';
    if (subjectId.includes('concrete')) return '混凝土';
    if (subjectId.includes('metal')) return '金属结构';
    if (subjectId.includes('mechanical')) return '机械电气';
    if (subjectId.includes('survey')) return '测量';
    return '综合';
  }

  // 格式化时间
  formatTime(timestamp: number): string {
    const date = new Date(timestamp);
    const y = date.getFullYear();
    const m = String(date.getMonth() + 1).padStart(2, '0');
    const d = String(date.getDate()).padStart(2, '0');
    return `${y}-${m}-${d}`;
  }

  // 渲染星级
  @Builder
  StarRating() {
    if (this.userCard) {
      Row() {
        ForEach([1, 2, 3, 4, 5], (star: number) => {
          Text(star <= this.userCard!.starLevel ? '★' : '☆')
            .fontSize(24)
            .fontColor(star <= this.userCard!.starLevel ? '#FFD700' : '#444444')
            .textShadow({ radius: 4, color: star <= this.userCard!.starLevel ? '#FFD700' : 'transparent' })
        })
      }
    }
  }

  build() {
    Stack() {
      // 背景遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.85)')
        .opacity(this.bgOpacity)
        .onClick(() => this.closeWithAnimation())

      // 卡片容器
      Column() {
        // 大卡片
        Stack() {
          // 卡片正面
          if (!this.showBack) {
            this.CardFront()
          } else {
            // 卡片背面（解析）
            this.CardBack()
          }
        }
        .width(280)
        .height(400)
        .borderRadius(20)
        .clip(true)
        .shadow({
          radius: 30,
          color: this.getRarityColor() + '80',
          offsetX: 0,
          offsetY: 10
        })
        // 3D旋转效果
        .rotate({
          x: 1,
          y: 0,
          z: 0,
          angle: this.rotateX,
          centerX: '50%',
          centerY: '50%'
        })
        .rotate({
          x: 0,
          y: 1,
          z: 0,
          angle: this.rotateY + this.flipAngle,
          centerX: '50%',
          centerY: '50%'
        })
        .scale({ x: this.cardScale, y: this.cardScale })
        .opacity(this.cardOpacity)
        .gesture(
          PanGesture({ direction: PanDirection.All })
            .onActionStart(() => {
              this.isPressed = true;
            })
            .onActionUpdate((event: GestureEvent) => {
              this.rotateY = Math.max(-20, Math.min(20, event.offsetX * 0.2));
              this.rotateX = Math.max(-20, Math.min(20, -event.offsetY * 0.2));
            })
            .onActionEnd(() => {
              animateTo({ duration: 300, curve: Curve.EaseOut }, () => {
                this.rotateX = 0;
                this.rotateY = 0;
                this.isPressed = false;
              });
            })
        )

        // 操作按钮
        Row() {
          // 翻转按钮
          Column() {
            Text('🔄')
              .fontSize(24)
            Text(this.showBack ? '看正面' : '看解析')
              .fontSize(12)
              .fontColor('#FFFFFF')
              .margin({ top: 4 })
          }
          .padding(16)
          .onClick(() => this.flipCard())

          // 关闭按钮
          Column() {
            Text('✕')
              .fontSize(24)
              .fontColor('#FFFFFF')
            Text('关闭')
              .fontSize(12)
              .fontColor('#FFFFFF')
              .margin({ top: 4 })
          }
          .padding(16)
          .onClick(() => this.closeWithAnimation())
        }
        .margin({ top: 24 })
        .opacity(this.cardOpacity)
      }
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

      // 稀有度标签
      Row() {
        Text(this.cardDef.rarity)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .padding({ left: 12, right: 12, top: 4, bottom: 4 })
          .backgroundColor(this.getRarityColor())
          .borderRadius(12)
          .shadow({ radius: 8, color: this.getRarityColor() })

        Blank()

        Text(this.getRarityName())
          .fontSize(12)
          .fontColor(this.getRarityColor())
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 12 })

      // 卡片图标
      Stack() {
        // 光晕背景
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
      .margin({ top: 20 })

      // 卡片名称
      Text(this.cardDef.name)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FFFFFF')
        .margin({ top: 16 })
        .textShadow({ radius: 4, color: this.getRarityColor() })

      // 星级
      this.StarRating()

      // 科目标签
      Text(this.getSubjectName())
        .fontSize(12)
        .fontColor('rgba(255,255,255,0.6)')
        .padding({ left: 12, right: 12, top: 4, bottom: 4 })
        .backgroundColor('rgba(255,255,255,0.1)')
        .borderRadius(10)
        .margin({ top: 12 })

      // 知识点简介
      Text(this.cardDef.backContent)
        .fontSize(13)
        .fontColor('rgba(255,255,255,0.8)')
        .lineHeight(20)
        .maxLines(3)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ top: 16, left: 20, right: 20 })
        .textAlign(TextAlign.Center)

      Blank()

      // 底部信息
      if (this.userCard) {
        Row() {
          Text(`获取: ${this.userCard.obtainCount}次`)
            .fontSize(11)
            .fontColor('rgba(255,255,255,0.4)')
          
          Blank()
          
          Text(`碎片: ${this.userCard.fragments}`)
            .fontSize(11)
            .fontColor('rgba(255,255,255,0.4)')
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 12 })
      }

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
      // 顶部
      Row()
        .width('100%')
        .height(6)
        .linearGradient({
          angle: 90,
          colors: [[this.getRarityColor(), 0], ['#FFD700', 0.5], [this.getRarityColor(), 1]]
        })

      // 标题
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

      // 解析内容
      Scroll() {
        Column() {
          // 题目解析
          if (this.cardDef.questionAnalysis) {
            Column() {
              Text('💡 解析')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#4CAF50')
                .alignSelf(ItemAlign.Start)

              Text(this.cardDef.questionAnalysis)
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

          // 考点
          if (this.cardDef.examPoint) {
            Column() {
              Text('📌 考点')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FF9800')
                .alignSelf(ItemAlign.Start)

              Text(this.cardDef.examPoint)
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

          // 记忆口诀
          if (this.cardDef.memoryTip) {
            Column() {
              Text('🧠 记忆口诀')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#E040FB')
                .alignSelf(ItemAlign.Start)

              Text(this.cardDef.memoryTip)
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

          // 获取信息
          if (this.userCard) {
            Column() {
              Text('📊 收集信息')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#2196F3')
                .alignSelf(ItemAlign.Start)

              Row() {
                Text('首次获取:')
                  .fontSize(12)
                  .fontColor('rgba(255,255,255,0.5)')
                Text(this.formatTime(this.userCard.firstObtainTime))
                  .fontSize(12)
                  .fontColor('rgba(255,255,255,0.8)')
                  .margin({ left: 8 })
              }
              .margin({ top: 8 })

              Row() {
                Text('获取次数:')
                  .fontSize(12)
                  .fontColor('rgba(255,255,255,0.5)')
                Text(`${this.userCard.obtainCount}次`)
                  .fontSize(12)
                  .fontColor('rgba(255,255,255,0.8)')
                  .margin({ left: 8 })
              }
              .margin({ top: 4 })

              Row() {
                Text('当前碎片:')
                  .fontSize(12)
                  .fontColor('rgba(255,255,255,0.5)')
                Text(`${this.userCard.fragments}`)
                  .fontSize(12)
                  .fontColor('rgba(255,255,255,0.8)')
                  .margin({ left: 8 })
              }
              .margin({ top: 4 })
            }
            .width('100%')
            .padding(12)
            .backgroundColor('rgba(33,150,243,0.1)')
            .borderRadius(12)
            .margin({ top: 12 })
          }
        }
        .padding({ left: 16, right: 16, bottom: 16 })
      }
      .layoutWeight(1)

      // 底部装饰
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
    // 背面需要镜像翻转
    .rotate({
      x: 0,
      y: 1,
      z: 0,
      angle: 180
    })
  }
}
