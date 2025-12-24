/**
 * 高德地图页面
 * 使用高德地图原生 SDK 显示地图和当前位置
 */
import { router } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { promptAction } from '@kit.ArkUI';
import { geoLocationManager } from '@kit.LocationKit';
import {
  AMap,
  MapsInitializer,
  MapView,
  MapViewComponent,
  MapViewManager,
  Marker,
  MarkerOptions,
  LatLng,
  CameraUpdateFactory
} from '@amap/amap_lbs_map3d';
import { ThemeColors, ThemeConstants } from '../common/constants/ThemeConstants';
import { amapLocationService, LocationInfo } from '../services/AMapLocationService';
import { Logger } from '../common/utils/Logger';

// 高德 API Key
const AMAP_KEY = '6f356712f041528b048e8e12d23043bd';

@Entry
@Component
struct MapPage {
  @State isLoading: boolean = true;
  @State locationInfo: LocationInfo | null = null;
  @State hasPermission: boolean = false;
  @State errorMessage: string = '';
  @State isMapReady: boolean = false;
  @State debugInfo: string = '初始化中...';

  private aMap: AMap | null = null;
  private mapView: MapView | null = null;
  private locationMarker: Marker | null = null;

  aboutToAppear(): void {
    Logger.info('[MapPage] aboutToAppear - 开始初始化');
    this.debugInfo = '设置API Key...';
    
    try {
      // 初始化高德地图 Key
      MapsInitializer.setApiKey(AMAP_KEY);
      Logger.info('[MapPage] API Key 设置成功: ' + AMAP_KEY);
      this.debugInfo = 'API Key已设置，注册地图回调...';
    } catch (error) {
      const err = error as Error;
      Logger.error('[MapPage] 设置API Key失败: ' + err.message);
      this.debugInfo = '设置API Key失败: ' + err.message;
      this.errorMessage = '地图初始化失败: ' + err.message;
    }

    // 注册地图创建回调
    try {
      MapViewManager.getInstance().registerMapViewCreatedCallback(
        (mapview?: MapView, mapViewName?: string) => {
          Logger.info('[MapPage] 地图回调触发, mapview: ' + (mapview ? '存在' : '不存在'));
          this.debugInfo = '地图回调触发...';
          
          if (!mapview) {
            Logger.error('[MapPage] mapview 为空');
            this.debugInfo = '错误: mapview为空';
            this.errorMessage = '地图创建失败';
            this.isLoading = false;
            return;
          }
          
          this.mapView = mapview;
          Logger.info('[MapPage] 调用 mapView.onCreate()');
          this.debugInfo = '调用onCreate...';
          
          try {
            this.mapView.onCreate();
            Logger.info('[MapPage] onCreate 成功，调用 getMapAsync');
            this.debugInfo = '获取AMap对象...';
            
            this.mapView.getMapAsync((map: AMap) => {
              Logger.info('[MapPage] getMapAsync 回调, map: ' + (map ? '存在' : '不存在'));
              this.aMap = map;
              this.isMapReady = true;
              this.debugInfo = '地图准备就绪!';
              Logger.info('[MapPage] 地图准备就绪');
              // 地图准备好后获取位置
              this.initLocation();
            });
          } catch (error) {
            const err = error as Error;
            Logger.error('[MapPage] 地图初始化异常: ' + err.message);
            this.debugInfo = '地图初始化异常: ' + err.message;
            this.errorMessage = '地图初始化异常';
            this.isLoading = false;
          }
        }
      );
      Logger.info('[MapPage] 地图回调注册成功');
    } catch (error) {
      const err = error as Error;
      Logger.error('[MapPage] 注册地图回调失败: ' + err.message);
      this.debugInfo = '注册回调失败: ' + err.message;
      this.errorMessage = '地图服务不可用';
      this.isLoading = false;
    }
  }

  aboutToDisappear(): void {
    Logger.info('[MapPage] aboutToDisappear - 清理资源');
    if (this.mapView) {
      try {
        this.mapView.onDestroy();
        Logger.info('[MapPage] mapView.onDestroy 成功');
      } catch (error) {
        Logger.error('[MapPage] mapView.onDestroy 失败', error as Error);
      }
    }
  }

  private async initLocation(): Promise<void> {
    Logger.info('[MapPage] initLocation 开始');
    this.debugInfo = '检查定位权限...';
    
    try {
      // 检查权限
      this.hasPermission = await amapLocationService.checkLocationPermission();
      Logger.info('[MapPage] 定位权限检查结果: ' + this.hasPermission);

      if (!this.hasPermission) {
        Logger.info('[MapPage] 请求定位权限');
        this.debugInfo = '请求定位权限...';
        const context = getContext(this) as common.UIAbilityContext;
        this.hasPermission = await amapLocationService.requestLocationPermission(context);
        Logger.info('[MapPage] 权限请求结果: ' + this.hasPermission);
      }

      if (!this.hasPermission) {
        Logger.warn('[MapPage] 用户拒绝定位权限');
        this.errorMessage = '需要定位权限才能显示当前位置';
        this.debugInfo = '定位权限被拒绝';
        this.isLoading = false;
        return;
      }

      // 获取位置
      Logger.info('[MapPage] 开始获取位置');
      this.debugInfo = '获取当前位置...';
      const location = await amapLocationService.getCurrentLocation();
      
      if (location) {
        Logger.info('[MapPage] 获取位置成功: ' + location.latitude + ', ' + location.longitude);
        this.locationInfo = location;
        this.debugInfo = '位置: ' + location.latitude.toFixed(4) + ', ' + location.longitude.toFixed(4);
        this.updateMapLocation(location);
      } else {
        Logger.error('[MapPage] 获取位置失败');
        this.errorMessage = '获取位置失败，请检查定位服务是否开启';
        this.debugInfo = '获取位置失败';
      }
    } catch (error) {
      const err = error as Error;
      Logger.error('[MapPage] initLocation 异常: ' + err.message);
      this.errorMessage = '定位服务异常: ' + err.message;
      this.debugInfo = '定位异常: ' + err.message;
    } finally {
      this.isLoading = false;
    }
  }

  /**
   * 更新地图位置和标记
   */
  private updateMapLocation(location: LocationInfo): void {
    Logger.info('[MapPage] updateMapLocation 开始');
    
    if (!this.aMap) {
      Logger.error('[MapPage] aMap 为空，无法更新位置');
      this.debugInfo = '错误: 地图对象为空';
      return;
    }

    try {
      const latLng = new LatLng(location.latitude, location.longitude);
      Logger.info('[MapPage] 创建 LatLng 成功');

      // 移动地图到当前位置
      this.aMap.moveCamera(CameraUpdateFactory.newLatLngZoom(latLng, 16));
      Logger.info('[MapPage] moveCamera 成功');

      // 移除旧标记
      if (this.locationMarker) {
        this.locationMarker.remove();
        Logger.info('[MapPage] 移除旧标记');
      }

      // 添加新标记
      const markerOptions = new MarkerOptions();
      markerOptions.position(latLng);
      markerOptions.title('当前位置');
      if (location.formattedAddress) {
        markerOptions.snippet(location.formattedAddress);
      }

      this.locationMarker = this.aMap.addMarker(markerOptions);
      Logger.info('[MapPage] 添加标记成功');

      // 显示信息窗口
      if (this.locationMarker) {
        this.locationMarker.showInfoWindow();
        Logger.info('[MapPage] 显示信息窗口');
      }

      this.debugInfo = '地图更新完成';
    } catch (error) {
      const err = error as Error;
      Logger.error('[MapPage] updateMapLocation 异常: ' + err.message);
      this.debugInfo = '更新地图异常: ' + err.message;
    }
  }

  /**
   * 刷新位置
   */
  private async refreshLocation(): Promise<void> {
    Logger.info('[MapPage] refreshLocation 开始');
    this.isLoading = true;
    this.errorMessage = '';
    this.debugInfo = '刷新位置...';

    try {
      const location = await amapLocationService.getCurrentLocation();
      if (location) {
        this.locationInfo = location;
        this.updateMapLocation(location);
        promptAction.showToast({ message: '位置已更新' });
        Logger.info('[MapPage] 位置刷新成功');
      } else {
        promptAction.showToast({ message: '获取位置失败' });
        Logger.error('[MapPage] 位置刷新失败');
      }
    } catch (error) {
      Logger.error('[MapPage] refreshLocation 异常', error as Error);
    }

    this.isLoading = false;
  }

  /**
   * 回到当前位置
   */
  private backToCurrentLocation(): void {
    if (this.locationInfo && this.aMap) {
      const latLng = new LatLng(this.locationInfo.latitude, this.locationInfo.longitude);
      this.aMap.animateCamera(CameraUpdateFactory.newLatLngZoom(latLng, 16));
      Logger.info('[MapPage] 回到当前位置');
    }
  }

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.Back'))
          .width(24)
          .height(24)
          .onClick(() => router.back())

        Text('我的位置')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(ThemeColors.TEXT_PRIMARY)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        // 刷新按钮
        Image($r('app.media.Refresh'))
          .width(24)
          .height(24)
          .onClick(() => this.refreshLocation())
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(ThemeColors.SURFACE)

      // 调试信息
      Row() {
        Text('调试: ' + this.debugInfo)
          .fontSize(12)
          .fontColor(ThemeColors.TEXT_HINT)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#FFF3E0')

      // 位置信息卡片
      if (this.locationInfo && !this.isLoading) {
        Row() {
          Column() {
            Text('📍 ' + (this.locationInfo.formattedAddress || '未知位置'))
              .fontSize(14)
              .fontColor(ThemeColors.TEXT_PRIMARY)
              .maxLines(2)
              .textOverflow({ overflow: TextOverflow.Ellipsis })

            Row() {
              Text(`经度: ${this.locationInfo.longitude.toFixed(6)}`)
                .fontSize(12)
                .fontColor(ThemeColors.TEXT_HINT)
              Text(`  纬度: ${this.locationInfo.latitude.toFixed(6)}`)
                .fontSize(12)
                .fontColor(ThemeColors.TEXT_HINT)
            }
            .margin({ top: 4 })
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)
        }
        .width('100%')
        .padding(12)
        .backgroundColor(ThemeColors.SURFACE)
        .border({ width: { bottom: 1 }, color: ThemeColors.GRAY_200 })
      }

      // 地图区域
      Stack() {
        // 高德地图组件
        MapViewComponent()
          .width('100%')
          .height('100%')

        // 加载中遮罩
        if (this.isLoading) {
          Column() {
            LoadingProgress()
              .width(48)
              .height(48)
              .color(ThemeColors.PRIMARY)
            Text('正在加载...')
              .fontSize(14)
              .fontColor(ThemeColors.TEXT_SECONDARY)
              .margin({ top: 12 })
            Text(this.debugInfo)
              .fontSize(12)
              .fontColor(ThemeColors.TEXT_HINT)
              .margin({ top: 8 })
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('rgba(255, 255, 255, 0.9)')
        }

        // 错误提示
        if (this.errorMessage && !this.isLoading) {
          Column() {
            Text('😕')
              .fontSize(48)
            Text(this.errorMessage)
              .fontSize(14)
              .fontColor(ThemeColors.TEXT_SECONDARY)
              .margin({ top: 12 })
              .textAlign(TextAlign.Center)
            Text(this.debugInfo)
              .fontSize(12)
              .fontColor(ThemeColors.TEXT_HINT)
              .margin({ top: 8 })

            Button('重试')
              .fontSize(14)
              .fontColor(ThemeColors.WHITE)
              .backgroundColor(ThemeColors.PRIMARY)
              .margin({ top: 20 })
              .onClick(() => this.initLocation())
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('rgba(255, 255, 255, 0.95)')
        }

        // 回到当前位置按钮
        if (this.locationInfo && !this.isLoading && !this.errorMessage) {
          Column() {
            Text('📍')
              .fontSize(20)
          }
          .width(44)
          .height(44)
          .borderRadius(22)
          .backgroundColor(ThemeColors.SURFACE)
          .justifyContent(FlexAlign.Center)
          .shadow({ radius: 4, color: 'rgba(0,0,0,0.15)', offsetX: 0, offsetY: 2 })
          .position({ x: '85%', y: '80%' })
          .onClick(() => this.backToCurrentLocation())
        }
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(ThemeColors.BACKGROUND)
  }
}
