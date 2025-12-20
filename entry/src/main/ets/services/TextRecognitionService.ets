/**
 * 文字识别服务（OCR）
 * HydroQuiz - 水利工程检测员刷题宝
 * 使用 HarmonyOS CoreVisionKit 实现图片文字识别
 */
import { textRecognition } from '@kit.CoreVisionKit';
import { image } from '@kit.ImageKit';
import { fileIo } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../common/utils/Logger';

/**
 * OCR 识别回调接口
 */
export interface TextRecognitionCallback {
  onSuccess?: (text: string) => void;
  onError?: (errorCode: number, errorMessage: string) => void;
}

/**
 * 文字识别服务类
 */
class TextRecognitionService {
  private isInitialized: boolean = false;

  /**
   * 初始化 OCR 服务
   */
  async initialize(): Promise<boolean> {
    if (this.isInitialized) {
      return true;
    }
    try {
      const result = await textRecognition.init();
      this.isInitialized = result;
      Logger.info(`[TextRecognitionService] OCR init result: ${result}`);
      return result;
    } catch (error) {
      Logger.error('[TextRecognitionService] Failed to init OCR', error as Error);
      return false;
    }
  }

  /**
   * 释放 OCR 服务
   */
  async release(): Promise<void> {
    if (!this.isInitialized) {
      return;
    }
    try {
      await textRecognition.release();
      this.isInitialized = false;
      Logger.info('[TextRecognitionService] OCR released');
    } catch (error) {
      Logger.error('[TextRecognitionService] Failed to release OCR', error as Error);
    }
  }

  /**
   * 打开相册选择图片
   */
  async selectImageFromGallery(): Promise<string> {
    return new Promise<string>((resolve) => {
      const photoPicker = new photoAccessHelper.PhotoViewPicker();
      photoPicker.select({
        MIMEType: photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE,
        maxSelectNumber: 1
      }).then((res: photoAccessHelper.PhotoSelectResult) => {
        if (res.photoUris && res.photoUris.length > 0) {
          resolve(res.photoUris[0]);
        } else {
          resolve('');
        }
      }).catch((err: BusinessError) => {
        Logger.error(`[TextRecognitionService] Failed to select image: ${err.message}`);
        resolve('');
      });
    });
  }

  /**
   * 从 URI 加载图片为 PixelMap
   */
  async loadImageFromUri(uri: string): Promise<image.PixelMap | null> {
    try {
      const fileSource = await fileIo.open(uri, fileIo.OpenMode.READ_ONLY);
      const imageSource = image.createImageSource(fileSource.fd);
      const pixelMap = await imageSource.createPixelMap();
      await fileIo.close(fileSource.fd);
      return pixelMap;
    } catch (error) {
      Logger.error('[TextRecognitionService] Failed to load image', error as Error);
      return null;
    }
  }

  /**
   * 识别图片中的文字
   */
  async recognizeText(pixelMap: image.PixelMap): Promise<string> {
    if (!this.isInitialized) {
      const initResult = await this.initialize();
      if (!initResult) {
        return '';
      }
    }

    const visionInfo: textRecognition.VisionInfo = {
      pixelMap: pixelMap
    };

    const config: textRecognition.TextRecognitionConfiguration = {
      isDirectionDetectionSupported: false
    };

    try {
      const result = await textRecognition.recognizeText(visionInfo, config);
      Logger.info(`[TextRecognitionService] Recognized text length: ${result.value.length}`);
      return result.value;
    } catch (error) {
      const bizError = error as BusinessError;
      Logger.error(`[TextRecognitionService] Failed to recognize: ${bizError.message}`);
      return '';
    }
  }

  /**
   * 一键选择图片并识别文字
   */
  async selectAndRecognize(callback: TextRecognitionCallback): Promise<void> {
    try {
      // 1. 选择图片
      const uri = await this.selectImageFromGallery();
      if (!uri) {
        callback.onError?.(1001, '未选择图片');
        return;
      }

      // 2. 加载图片
      const pixelMap = await this.loadImageFromUri(uri);
      if (!pixelMap) {
        callback.onError?.(1002, '图片加载失败');
        return;
      }

      // 3. 识别文字
      const text = await this.recognizeText(pixelMap);
      if (text && text.length > 0) {
        callback.onSuccess?.(text);
      } else {
        callback.onError?.(1003, '未识别到文字');
      }
    } catch (error) {
      const bizError = error as BusinessError;
      callback.onError?.(bizError.code || 1000, bizError.message || '识别失败');
    }
  }
}

// 导出单例
export const textRecognitionService = new TextRecognitionService();
