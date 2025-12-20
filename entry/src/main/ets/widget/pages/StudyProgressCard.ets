/**
 * 学习进度卡片 (2x4)
 * 展示今日学习成果
 */
let storageProgress = new LocalStorage();

@Entry(storageProgress)
@Component
struct StudyProgressCard {
  @LocalStorageProp('todayCount') todayCount: number = 0;
  @LocalStorageProp('targetCount') targetCount: number = 20;
  @LocalStorageProp('correctCount') correctCount: number = 0;
  @LocalStorageProp('wrongCount') wrongCount: number = 0;
  @LocalStorageProp('accuracy') accuracy: number = 0;
  @LocalStorageProp('isCheckedIn') isCheckedIn: boolean = false;
  @LocalStorageProp('streakDays') streakDays: number = 0;
  @LocalStorageProp('progressPercent') progressPercent: number = 0;

  build() {
    Stack() {
      // 背景图
      Image($r('app.media.Wavebackground'))
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
          colors: [['rgba(24, 144, 255, 0.8)', 0.0], ['rgba(0, 80, 179, 0.9)', 1.0]]
        })

      // 内容层
      Column() {
        // 顶部标题栏
        Row() {
          Column() {
            Text('今日学习')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor('#FFFFFF')

            Text('刷题宝')
              .fontSize(10)
              .fontColor('#FFFFFF')
              .opacity(0.7)
              .margin({ top: 2 })
          }
          .alignItems(HorizontalAlign.Start)

          Blank()

          // 打卡状态徽章
          if (this.isCheckedIn) {
            Row() {
              Text('✓ 已打卡')
                .fontSize(10)
                .fontColor('#52C41A')
            }
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .backgroundColor('rgba(82, 196, 26, 0.25)')
            .borderRadius(8)
          } else if (this.todayCount >= this.targetCount) {
            Row() {
              Text('🏆 可打卡')
                .fontSize(10)
                .fontColor('#FFA940')
            }
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .backgroundColor('rgba(255, 169, 64, 0.25)')
            .borderRadius(8)
          }
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 12 })

        // 主要数据区域
        Row() {
          // 左侧：做题数量
          Column() {
            Text(`${this.todayCount}`)
              .fontSize(42)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')

            Text(`目标 ${this.targetCount} 题`)
              .fontSize(12)
              .fontColor('#FFFFFF')
              .opacity(0.8)
              .margin({ top: 4 })
          }
          .alignItems(HorizontalAlign.Start)

          Blank()

          // 右侧：正确率圆环
          Stack() {
            // 背景圆环
            Circle()
              .width(56)
              .height(56)
              .fill(Color.Transparent)
              .stroke('rgba(255, 255, 255, 0.25)')
              .strokeWidth(5)

            // 进度圆环
            Circle()
              .width(56)
              .height(56)
              .fill(Color.Transparent)
              .stroke(this.accuracy >= 80 ? '#52C41A' : (this.accuracy >= 60 ? '#FFA940' : '#FF4D4F'))
              .strokeWidth(5)
              .strokeDashArray([this.accuracy * 1.76, 176])
              .rotate({ angle: -90 })

            // 中间文字
            Column() {
              Text(`${this.accuracy}%`)
                .fontSize(13)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FFFFFF')
              Text('正确率')
                .fontSize(8)
                .fontColor('#FFFFFF')
                .opacity(0.8)
            }
          }
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 8 })

        Blank()

        // 进度条区域
        Column() {
          Row() {
            Text('完成进度')
              .fontSize(10)
              .fontColor('#FFFFFF')
              .opacity(0.8)

            Blank()

            Text(`${this.progressPercent}%`)
              .fontSize(10)
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Medium)
          }
          .width('100%')

          // 进度条
          Stack({ alignContent: Alignment.Start }) {
            Row()
              .width('100%')
              .height(6)
              .backgroundColor('rgba(255, 255, 255, 0.25)')
              .borderRadius(3)

            Row()
              .width(`${Math.max(this.progressPercent, 2)}%`)
              .height(6)
              .linearGradient({
                direction: GradientDirection.Right,
                colors: [['#52C41A', 0.0], ['#73D13D', 1.0]]
              })
              .borderRadius(3)
          }
          .width('100%')
          .margin({ top: 6 })
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 14 })
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
