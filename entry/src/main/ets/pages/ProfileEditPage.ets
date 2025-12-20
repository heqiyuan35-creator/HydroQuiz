/**
 * 个人信息编辑页面
 */
import { Router } from '../router/Router';
import { ThemeColors } from '../theme/ThemeColors';
import { ThemeConstants } from '../theme/ThemeConstants';
import { userService, UserInfo } from '../services/UserService';
import { AppConstants } from '../common/constants/AppConstants';

@Entry
@Component
struct ProfileEditPage {
  @State userInfo: UserInfo = {
    nickname: '水利学员',
    gender: 'male',
    userId: '',
    status: '水利检测员备考中'
  };
  @State isLoading: boolean = true;
  @State editingNickname: string = '';
  @State showNicknameDialog: boolean = false;

  aboutToAppear(): void {
    this.loadUserInfo();
  }

  private async loadUserInfo(): Promise<void> {
    this.userInfo = await userService.getUserInfo();
    this.editingNickname = this.userInfo.nickname;
    this.isLoading = false;
  }

  private getAvatarResource(): Resource {
    return this.userInfo.gender === 'male' ? $r('app.media.Maleavatar') : $r('app.media.Femaleavatar');
  }

  private async onGenderChange(gender: 'male' | 'female'): Promise<void> {
    if (this.userInfo.gender !== gender) {
      const newInfo: UserInfo = {
        nickname: this.userInfo.nickname,
        gender: gender,
        userId: this.userInfo.userId,
        status: this.userInfo.status
      };
      this.userInfo = newInfo;
      await userService.updateGender(gender);
    }
  }

  private async saveNickname(): Promise<void> {
    if (this.editingNickname.trim()) {
      const newInfo: UserInfo = {
        nickname: this.editingNickname.trim(),
        gender: this.userInfo.gender,
        userId: this.userInfo.userId,
        status: this.userInfo.status
      };
      this.userInfo = newInfo;
      await userService.updateNickname(this.editingNickname.trim());
    }
    this.showNicknameDialog = false;
  }


  build() {
    Column() {
      // 顶部导航栏
      Row() {
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

        Text('编辑资料')
          .fontSize(ThemeConstants.FONT_SIZE_LG)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Text('')
          .width(24)
      }
      .width('100%')
      .height(56)
      .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })

      if (this.isLoading) {
        Column() {
          LoadingProgress()
            .width(40)
            .height(40)
        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else {
        Scroll() {
          Column() {
            // 头像区域
            Column() {
              Text('头像')
                .fontSize(ThemeConstants.FONT_SIZE_SM)
                .fontColor(ThemeColors.TEXT_HINT)
                .width('100%')
                .margin({ bottom: ThemeConstants.SPACING_SM })

              Image(this.getAvatarResource())
                .width(80)
                .height(80)
                .borderRadius(40)
                .objectFit(ImageFit.Cover)
                .border({ width: 2, color: ThemeColors.PRIMARY })

              Text('选择性别可更换默认头像')
                .fontSize(ThemeConstants.FONT_SIZE_XS)
                .fontColor(ThemeColors.TEXT_HINT)
                .margin({ top: ThemeConstants.SPACING_SM })
            }
            .width('100%')
            .padding(ThemeConstants.SPACING_LG)
            .backgroundColor(ThemeColors.SURFACE)
            .borderRadius(ThemeConstants.RADIUS_MD)
            .alignItems(HorizontalAlign.Center)

            // 基本信息
            Column() {
              // 昵称
              Row() {
                Text('昵称')
                  .fontSize(ThemeConstants.FONT_SIZE_BASE)
                  .fontColor(ThemeColors.TEXT_PRIMARY)

                Blank()

                Text(this.userInfo.nickname)
                  .fontSize(ThemeConstants.FONT_SIZE_BASE)
                  .fontColor(ThemeColors.TEXT_SECONDARY)

                Image($r('app.media.Rightarrow'))
                  .width(16)
                  .height(16)
                  .margin({ left: ThemeConstants.SPACING_SM })
              }
              .width('100%')
              .height(50)
              .onClick(() => {
                this.showNicknameDialog = true;
              })

              Divider().height(0.5).color(ThemeColors.BORDER)

              // 性别
              Row() {
                Text('性别')
                  .fontSize(ThemeConstants.FONT_SIZE_BASE)
                  .fontColor(ThemeColors.TEXT_PRIMARY)

                Blank()

                Row() {
                  this.GenderOption('男', 'male')
                  this.GenderOption('女', 'female')
                }
              }
              .width('100%')
              .height(50)

              Divider().height(0.5).color(ThemeColors.BORDER)

              // 用户ID
              Row() {
                Text('用户ID')
                  .fontSize(ThemeConstants.FONT_SIZE_BASE)
                  .fontColor(ThemeColors.TEXT_PRIMARY)

                Blank()

                Text(this.userInfo.userId)
                  .fontSize(ThemeConstants.FONT_SIZE_BASE)
                  .fontColor(ThemeColors.TEXT_HINT)
              }
              .width('100%')
              .height(50)
            }
            .width('100%')
            .padding({ left: ThemeConstants.SPACING_MD, right: ThemeConstants.SPACING_MD })
            .margin({ top: ThemeConstants.SPACING_MD })
            .backgroundColor(ThemeColors.SURFACE)
            .borderRadius(ThemeConstants.RADIUS_MD)
          }
          .padding(ThemeConstants.SPACING_MD)
        }
        .layoutWeight(1)
      }

      // 昵称编辑弹窗
      if (this.showNicknameDialog) {
        this.NicknameDialog()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(ThemeColors.BACKGROUND)
    .padding({ top: AppConstants.STATUS_BAR_HEIGHT })
  }


  @Builder
  GenderOption(label: string, value: 'male' | 'female') {
    Row() {
      Text(label)
        .fontSize(ThemeConstants.FONT_SIZE_SM)
        .fontColor(this.userInfo.gender === value ? ThemeColors.WHITE : ThemeColors.TEXT_SECONDARY)
    }
    .width(50)
    .height(28)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.userInfo.gender === value ? ThemeColors.PRIMARY : ThemeColors.GRAY_100)
    .borderRadius(14)
    .margin({ left: ThemeConstants.SPACING_SM })
    .onClick(() => {
      this.onGenderChange(value);
    })
  }

  @Builder
  NicknameDialog() {
    Column() {
      // 遮罩层
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('#00000066')
        .onClick(() => {
          this.showNicknameDialog = false;
        })
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })
    .justifyContent(FlexAlign.Center)

    // 弹窗内容
    Column() {
      Text('修改昵称')
        .fontSize(ThemeConstants.FONT_SIZE_LG)
        .fontWeight(FontWeight.Bold)
        .fontColor(ThemeColors.TEXT_PRIMARY)

      TextInput({ text: this.editingNickname, placeholder: '请输入昵称' })
        .width('100%')
        .height(44)
        .fontSize(ThemeConstants.FONT_SIZE_BASE)
        .margin({ top: ThemeConstants.SPACING_MD })
        .onChange((value: string) => {
          this.editingNickname = value;
        })

      Row() {
        Button('取消')
          .width('45%')
          .height(40)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.TEXT_SECONDARY)
          .backgroundColor(ThemeColors.GRAY_100)
          .onClick(() => {
            this.editingNickname = this.userInfo.nickname;
            this.showNicknameDialog = false;
          })

        Button('确定')
          .width('45%')
          .height(40)
          .fontSize(ThemeConstants.FONT_SIZE_BASE)
          .fontColor(ThemeColors.WHITE)
          .backgroundColor(ThemeColors.PRIMARY)
          .onClick(() => {
            this.saveNickname();
          })
      }
      .width('100%')
      .margin({ top: ThemeConstants.SPACING_LG })
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('80%')
    .padding(ThemeConstants.SPACING_LG)
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(ThemeConstants.RADIUS_MD)
    .position({ x: '10%', y: '35%' })
  }
}
