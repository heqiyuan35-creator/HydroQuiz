/**
 * 高德地图定位服务
 * 使用高德 Web API 进行定位和逆地理编码
 */
import { http } from '@kit.NetworkKit';
import { geoLocationManager } from '@kit.LocationKit';
import { abilityAccessCtrl, bundleManager, common, Permissions } from '@kit.AbilityKit';
import { Logger } from '../common/utils/Logger';

// 高德 API Key
const AMAP_KEY = '6f356712f041528b048e8e12d23043bd';

// 位置信息接口
export interface LocationInfo {
  latitude: number;
  longitude: number;
  address?: string;
  city?: string;
  district?: string;
  province?: string;
  street?: string;
  formattedAddress?: string;
}

// 逆地理编码响应
interface ReGeoResponse {
  status: string;
  info: string;
  regeocode?: {
    formatted_address: string;
    addressComponent: {
      province: string;
      city: string | string[];
      district: string;
      street: string;
      streetNumber: string;
    };
  };
}

export class AMapLocationService {
  private static instance: AMapLocationService;
  private currentLocation: LocationInfo | null = null;
  private isLocating: boolean = false;

  private constructor() {}

  public static getInstance(): AMapLocationService {
    if (!AMapLocationService.instance) {
      AMapLocationService.instance = new AMapLocationService();
    }
    return AMapLocationService.instance;
  }

  /**
   * 检查定位权限
   */
  async checkLocationPermission(): Promise<boolean> {
    try {
      const atManager = abilityAccessCtrl.createAtManager();
      const bundleInfo = bundleManager.getBundleInfoForSelfSync(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION
      );
      const tokenId = bundleInfo.appInfo.accessTokenId;

      const locationStatus = atManager.checkAccessTokenSync(
        tokenId,
        'ohos.permission.LOCATION'
      );
      const approxStatus = atManager.checkAccessTokenSync(
        tokenId,
        'ohos.permission.APPROXIMATELY_LOCATION'
      );

      return locationStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
             approxStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
    } catch (error) {
      Logger.error('[AMapLocation] Check permission failed', error as Error);
      return false;
    }
  }

  /**
   * 请求定位权限
   */
  async requestLocationPermission(context: common.UIAbilityContext): Promise<boolean> {
    try {
      const atManager = abilityAccessCtrl.createAtManager();
      const permissions: Permissions[] = [
        'ohos.permission.LOCATION',
        'ohos.permission.APPROXIMATELY_LOCATION'
      ];

      const result = await atManager.requestPermissionsFromUser(context, permissions);
      return result.authResults.some(
        status => status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED
      );
    } catch (error) {
      Logger.error('[AMapLocation] Request permission failed', error as Error);
      return false;
    }
  }

  /**
   * 获取当前位置（使用系统定位）
   */
  async getCurrentLocation(): Promise<LocationInfo | null> {
    if (this.isLocating) {
      return this.currentLocation;
    }

    this.isLocating = true;

    try {
      // 检查定位服务是否可用
      const isEnabled = geoLocationManager.isLocationEnabled();
      if (!isEnabled) {
        Logger.warn('[AMapLocation] Location service is disabled');
        this.isLocating = false;
        return null;
      }

      // 获取位置
      const request: geoLocationManager.CurrentLocationRequest = {
        priority: geoLocationManager.LocationRequestPriority.FIRST_FIX,
        scenario: geoLocationManager.LocationRequestScenario.UNSET,
        maxAccuracy: 100
      };

      const location = await geoLocationManager.getCurrentLocation(request);

      this.currentLocation = {
        latitude: location.latitude,
        longitude: location.longitude
      };

      // 逆地理编码获取地址
      const address = await this.reverseGeocode(location.latitude, location.longitude);
      if (address) {
        this.currentLocation = { ...this.currentLocation, ...address };
      }

      Logger.info(`[AMapLocation] Got location: ${location.latitude}, ${location.longitude}`);
      return this.currentLocation;

    } catch (error) {
      Logger.error('[AMapLocation] Get location failed', error as Error);
      return null;
    } finally {
      this.isLocating = false;
    }
  }

  /**
   * 逆地理编码 - 坐标转地址
   */
  async reverseGeocode(latitude: number, longitude: number): Promise<Partial<LocationInfo> | null> {
    try {
      const httpRequest = http.createHttp();
      const url = `https://restapi.amap.com/v3/geocode/regeo?key=${AMAP_KEY}&location=${longitude},${latitude}&extensions=base`;

      const response = await httpRequest.request(url, {
        method: http.RequestMethod.GET,
        header: { 'Content-Type': 'application/json' }
      });

      httpRequest.destroy();

      if (response.responseCode === 200) {
        const result = JSON.parse(response.result as string) as ReGeoResponse;

        if (result.status === '1' && result.regeocode) {
          const addr = result.regeocode.addressComponent;
          const city = Array.isArray(addr.city) ? addr.city[0] || '' : addr.city;

          return {
            formattedAddress: result.regeocode.formatted_address,
            province: addr.province,
            city: city,
            district: addr.district,
            street: addr.street
          };
        }
      }

      return null;
    } catch (error) {
      Logger.error('[AMapLocation] Reverse geocode failed', error as Error);
      return null;
    }
  }

  /**
   * 获取缓存的位置
   */
  getCachedLocation(): LocationInfo | null {
    return this.currentLocation;
  }

  /**
   * 获取高德 API Key
   */
  getApiKey(): string {
    return AMAP_KEY;
  }
}

export const amapLocationService = AMapLocationService.getInstance();
