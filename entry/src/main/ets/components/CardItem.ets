/**
 * 卡片展示组件
 * HydroQuiz - 水利工程检测员刷题宝
 * 真实卡片效果：触摸摆动、点击放大查看
 */
import { KnowledgeCard, UserCard, CardRarity } from '../common/types/CardTypes';

/**
 * 真实卡片组件 - 支持触摸摆动效果
 */
@Component
export struct CardItem {
  @Prop cardDef: KnowledgeCard;
  @Prop userCard: UserCard | null = null;
  @Prop isCollected: boolean = false;
  @Prop showDetail: boolean = false;
  // 触摸摆动状态
  @State rotateX: number = 0;
  @State rotateY: number = 0;
  @State cardScale: number = 1;
  @State isPressed: boolean = false;
  // 光泽效果位置
  @State shineX: number = 50;
  @State shineY: number = 50;
  onCardClick: () => void = () => {};

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

  // 获取稀有度渐变背景
  getRarityGradient(): LinearGradient {
    if (!this.isCollected) {
      return new LinearGradient([
        { color: '#2a2a2a', offset: 0 },
        { color: '#1a1a1a', offset: 1 }
      ]);
    }
    switch (this.cardDef.rarity) {
      case CardRarity.N:
        return new LinearGradient([
          { color: '#5a5a5a', offset: 0 },
          { color: '#3a3a3a', offset: 0.5 },
          { color: '#2a2a2a', offset: 1 }
        ]);
      case CardRarity.R:
        return new LinearGradient([
          { color: '#1E88E5', offset: 0 },
          { color: '#1565C0', offset: 0.5 },
          { color: '#0D47A1', offset: 1 }
        ]);
      case CardRarity.SR:
        return new LinearGradient([
          { color: '#AB47BC', offset: 0 },
          { color: '#8E24AA', offset: 0.5 },
          { color: '#6A1B9A', offset: 1 }
        ]);
      case CardRarity.SSR:
        return new LinearGradient([
          { color: '#FFB74D', offset: 0 },
          { color: '#FF9800', offset: 0.3 },
          { color: '#F57C00', offset: 0.6 },
          { color: '#E65100', offset: 1 }
        ]);
      default:
        return new LinearGradient([
          { color: '#424242', offset: 0 },
          { color: '#303030', offset: 1 }
        ]);
    }
  }

  // 获取卡片图标
  getCardIcon(): string {
    if (!this.isCollected) return '❓';
    // 根据科目返回不同图标
    const subjectId: string = this.cardDef.subjectId;
    if (subjectId.includes('geotechnical')) return '🏔️';
    if (subjectId.includes('concrete')) return '🧱';
    if (subjectId.includes('metal')) return '⚙️';
    if (subjectId.includes('mechanical')) return '🔧';
    if (subjectId.includes('survey')) return '📐';
    return '📚';
  }

  // 渲染星级
  @Builder
  StarRating() {
    if (this.userCard) {
      Row() {
        ForEach([1, 2, 3, 4, 5], (star: number) => {
          Text(star <= this.userCard!.starLevel ? '★' : '☆')
            .fontSize(9)
            .fontColor(star <= this.userCard!.starLevel ? '#FFD700' : '#555555')
        })
      }
    }
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.TopEnd }) {
        // 卡片主体
        Column() {
          // 卡片顶部装饰线
          Row()
            .width('80%')
            .height(2)
            .linearGradient({
              angle: 90,
              colors: [['transparent', 0], [this.getRarityColor(), 0.5], ['transparent', 1]]
            })
            .margin({ top: 6 })

          // 卡片图标区域
          Stack() {
            // 背景光晕
            if (this.isCollected && (this.cardDef.rarity === CardRarity.SR || this.cardDef.rarity === CardRarity.SSR)) {
              Column()
                .width(50)
                .height(50)
                .borderRadius(25)
                .backgroundColor(this.getRarityColor())
                .opacity(0.3)
                .blur(10)
            }
            
            // 图标
            Text(this.getCardIcon())
              .fontSize(this.isCollected ? 36 : 28)
              .opacity(this.isCollected ? 1 : 0.3)
          }
          .margin({ top: 8 })

          // 卡片名称
          Text(this.isCollected ? this.cardDef.name : '???')
            .fontSize(11)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.isCollected ? '#FFFFFF' : '#555555')
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .margin({ top: 6 })
            .width('85%')
            .textAlign(TextAlign.Center)

          // 星级显示
          if (this.isCollected && this.userCard) {
            this.StarRating()
          }

          // 满级标识
          if (this.userCard && this.userCard.starLevel >= 5) {
            Text('MAX')
              .fontSize(7)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
              .backgroundColor('#FF5722')
              .padding({ left: 3, right: 3, top: 1, bottom: 1 })
              .borderRadius(2)
              .margin({ top: 2 })
          }
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Start)
        .alignItems(HorizontalAlign.Center)
        .padding({ bottom: 6 })

        // 稀有度标识
        Text(this.cardDef.rarity)
          .fontSize(9)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .backgroundColor(this.getRarityColor())
          .padding({ left: 4, right: 4, top: 1, bottom: 1 })
          .borderRadius(3)
          .margin({ top: 4, right: 4 })
          .shadow({ radius: 4, color: this.getRarityColor(), offsetX: 0, offsetY: 0 })
      }
      .width(85)
      .height(110)
      .linearGradient({
        angle: 135,
        colors: this.getRarityGradient().colors.map(c => [c.color, c.offset])
      })
      .borderRadius(10)
      .border({
        width: this.isCollected ? 2 : 1,
        color: this.isCollected ? this.getRarityColor() : '#333333'
      })
      .shadow({
        radius: this.isPressed ? 15 : 8,
        color: this.isCollected ? this.getRarityColor() + '60' : 'rgba(0,0,0,0.3)',
        offsetX: 0,
        offsetY: this.isPressed ? 2 : 4
      })
      .opacity(this.isCollected ? 1 : 0.6)
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
        angle: this.rotateY,
        centerX: '50%',
        centerY: '50%'
      })
      .scale({ x: this.cardScale, y: this.cardScale })
      .animation({ duration: 150, curve: Curve.EaseOut })
    }
    .gesture(
      GestureGroup(GestureMode.Parallel,
        // 触摸手势 - 实现摆动效果
        PanGesture({ direction: PanDirection.All })
          .onActionStart(() => {
            this.isPressed = true;
            this.cardScale = 1.05;
          })
          .onActionUpdate((event: GestureEvent) => {
            // 根据触摸位置计算旋转角度
            const offsetX = event.offsetX;
            const offsetY = event.offsetY;
            // 限制旋转角度在 -15 到 15 度之间
            this.rotateY = Math.max(-15, Math.min(15, offsetX * 0.3));
            this.rotateX = Math.max(-15, Math.min(15, -offsetY * 0.3));
            // 更新光泽位置
            this.shineX = 50 + offsetX * 0.5;
            this.shineY = 50 + offsetY * 0.5;
          })
          .onActionEnd(() => {
            // 松手后恢复
            animateTo({ duration: 300, curve: Curve.EaseOut }, () => {
              this.rotateX = 0;
              this.rotateY = 0;
              this.cardScale = 1;
              this.isPressed = false;
              this.shineX = 50;
              this.shineY = 50;
            });
          }),
        // 点击手势
        TapGesture()
          .onAction(() => {
            this.onCardClick();
          })
      )
    )
  }
}

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
