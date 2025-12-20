/**
 * 学习提醒卡片 (2x2)
 * 提醒用户每日刷题打卡
 */
let storageReminder = new LocalStorage();

@Entry(storageReminder)
@Component
struct StudyReminderCard {
  @LocalStorageProp('todayCount') todayCount: number = 0;
  @LocalStorageProp('targetCount') targetCount: number = 20;
  @LocalStorageProp('isCheckedIn') isCheckedIn: boolean = false;
  @LocalStorageProp('streakDays') streakDays: number = 0;
  @LocalStorageProp('encourageText') encourageText: string = '📚 开始今天的学习吧！';

  build() {
    Stack() {
      // 背景图
      Image($r('app.media.CardBackground'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)
        .borderRadius(16)

      // 渐变遮罩层
      Column()
        .width('100%')
        .height('100%')
        .borderRadius(16)
        .linearGradient({
          direction: GradientDirection.RightBottom,
          colors: [['rgba(24, 144, 255, 0.85)', 0.0], ['rgba(9, 109, 217, 0.9)', 1.0]]
        })

      // 内容层
      Column() {
        // 顶部：应用名称
        Row() {
          Text('刷题宝')
            .fontSize(12)
            .fontColor('#FFFFFF')
            .opacity(0.9)

          Blank()

          // 打卡状态
          if (this.isCheckedIn) {
            Text('✓ 已打卡')
              .fontSize(10)
              .fontColor('#52C41A')
              .backgroundColor('rgba(82, 196, 26, 0.3)')
              .padding({ left: 6, right: 6, top: 2, bottom: 2 })
              .borderRadius(8)
          }
        }
        .width('100%')
        .padding({ left: 12, right: 12, top: 10 })

        // 中间：今日做题数
        Column() {
          Text(`${this.todayCount}`)
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')

          Text(`/ ${this.targetCount} 题`)
            .fontSize(12)
            .fontColor('#FFFFFF')
            .opacity(0.8)
            .margin({ top: 2 })
        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)

        // 底部：鼓励文案 + 连续打卡
        Column() {
          Text(this.encourageText)
            .fontSize(11)
            .fontColor('#FFFFFF')
            .opacity(0.95)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })

          if (this.streakDays > 0) {
            Text(`🔥 连续打卡 ${this.streakDays} 天`)
              .fontSize(10)
              .fontColor('#FFA940')
              .margin({ top: 4 })
          }
        }
        .width('100%')
        .padding({ left: 12, right: 12, bottom: 10 })
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .borderRadius(16)
    .onClick(() => {
      postCardAction(this, {
        action: 'router',
        abilityName: 'EntryAbility',
        params: {
          targetPage: 'MainTabPage'
        }
      });
    })
  }
}
