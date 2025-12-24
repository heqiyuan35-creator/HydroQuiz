/**
 * 高德地图测试页面 - 最简单的示例
 * 按照官方文档写法
 */
import {
  AMap,
  MapsInitializer,
  MapView,
  MapViewComponent,
  MapViewManager
} from '@amap/amap_lbs_map3d';
import { hilog } from '@kit.PerformanceAnalysisKit';

// 高德 API Key
const AMAP_KEY = '6f356712f041528b048e8e12d23043bd';

// 初始化 Key（在组件外部执行）
MapsInitializer.setApiKey(AMAP_KEY);
hilog.info(0x0000, 'MapTest', '设置 API Key: %{public}s', AMAP_KEY);

// 注册地图回调（在组件外部执行）
MapViewManager.getInstance().registerMapViewCreatedCallback((mapview?: MapView, mapViewName?: string) => {
  hilog.info(0x0000, 'MapTest', '地图回调触发, mapview存在: %{public}s', mapview ? 'true' : 'false');
  
  if (!mapview) {
    hilog.error(0x0000, 'MapTest', 'mapview 为空!');
    return;
  }

  let mapView = mapview;
  mapView.onCreate();
  hilog.info(0x0000, 'MapTest', 'mapView.onCreate() 完成');

  mapView.getMapAsync((map: AMap) => {
    hilog.info(0x0000, 'MapTest', 'getMapAsync 回调, map存在: %{public}s', map ? 'true' : 'false');
    let aMap: AMap = map;
    // 可以在这里操作地图
    hilog.info(0x0000, 'MapTest', '地图初始化完成!');
  });
});

@Entry
@Component
struct MapTestPage {
  @State status: string = '加载中...';

  aboutToAppear(): void {
    hilog.info(0x0000, 'MapTest', 'MapTestPage aboutToAppear');
    this.status = '地图组件已加载';
  }

  build() {
    Column() {
      // 状态栏
      Text('高德地图测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .padding(16)

      Text(this.status)
        .fontSize(14)
        .fontColor('#666666')
        .padding({ left: 16, right: 16, bottom: 8 })

      // 地图组件 - 按官方文档写法
      MapViewComponent()
        .width('100%')
        .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
