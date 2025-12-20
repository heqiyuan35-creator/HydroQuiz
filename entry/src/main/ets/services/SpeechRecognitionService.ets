/**
 * 语音识别服务
 * HydroQuiz - 水利工程检测员刷题宝
 * 使用 HarmonyOS CoreSpeechKit 实现语音转文字
 */
import { speechRecognizer } from '@kit.CoreSpeechKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../common/utils/Logger';

/**
 * 语音识别回调接口
 */
export interface SpeechRecognitionCallback {
  onStart?: () => void;
  onResult?: (text: string, isFinal: boolean) => void;
  onComplete?: (text: string) => void;
  onError?: (errorCode: number, errorMessage: string) => void;
}

/**
 * 语音识别服务类
 */
class SpeechRecognitionService {
  private asrEngine: speechRecognizer.SpeechRecognitionEngine | null = null;
  private sessionId: string = '';
  private isRecording: boolean = false;
  private callback: SpeechRecognitionCallback | null = null;
  private finalResult: string = '';

  /**
   * 初始化语音识别引擎
   */
  async initialize(): Promise<boolean> {
    if (this.asrEngine) {
      Logger.info('[SpeechRecognitionService] Engine already initialized');
      return true;
    }

    return new Promise((resolve) => {
      try {
        // 设置创建引擎参数
        const extraParam: Record<string, Object> = {
          'locate': 'CN',
          'recognizerMode': 'short' // 短语音模式，不超过60s
        };

        const initParamsInfo: speechRecognizer.CreateEngineParams = {
          language: 'zh-CN',
          online: 1, // 离线模式
          extraParams: extraParam
        };

        // 创建引擎
        speechRecognizer.createEngine(initParamsInfo,
          (err: BusinessError, engine: speechRecognizer.SpeechRecognitionEngine) => {
            if (!err && engine) {
              this.asrEngine = engine;
              this.setupListener();
              Logger.info('[SpeechRecognitionService] Engine created successfully');
              resolve(true);
            } else {
              Logger.error(`[SpeechRecognitionService] Failed to create engine: ${err?.message}`);
              resolve(false);
            }
          });
      } catch (error) {
        Logger.error('[SpeechRecognitionService] Initialize error', error as Error);
        resolve(false);
      }
    });
  }

  /**
   * 设置识别回调监听
   */
  private setupListener(): void {
    if (!this.asrEngine) return;

    const listener: speechRecognizer.RecognitionListener = {
      onStart: (sessionId: string, eventMessage: string) => {
        Logger.info(`[SpeechRecognitionService] onStart: ${sessionId}`);
        this.finalResult = '';
        if (this.callback?.onStart) {
          this.callback.onStart();
        }
      },

      onEvent: (sessionId: string, eventCode: number, eventMessage: string) => {
        Logger.info(`[SpeechRecognitionService] onEvent: ${eventCode} - ${eventMessage}`);
      },

      onResult: (sessionId: string, result: speechRecognizer.SpeechRecognitionResult) => {
        Logger.info(`[SpeechRecognitionService] onResult: ${JSON.stringify(result)}`);
        const text = result.result || '';
        const isFinal = result.isFinal || false;

        if (isFinal) {
          this.finalResult = text;
        }

        if (this.callback?.onResult) {
          this.callback.onResult(text, isFinal);
        }
      },

      onComplete: (sessionId: string, eventMessage: string) => {
        Logger.info(`[SpeechRecognitionService] onComplete: ${eventMessage}`);
        this.isRecording = false;

        if (this.callback?.onComplete) {
          this.callback.onComplete(this.finalResult);
        }
      },

      onError: (sessionId: string, errorCode: number, errorMessage: string) => {
        Logger.error(`[SpeechRecognitionService] onError: ${errorCode} - ${errorMessage}`);
        this.isRecording = false;

        if (this.callback?.onError) {
          this.callback.onError(errorCode, errorMessage);
        }
      }
    };

    this.asrEngine.setListener(listener);
  }

  /**
   * 开始语音识别（麦克风录音）
   */
  async startRecording(callback: SpeechRecognitionCallback): Promise<boolean> {
    if (this.isRecording) {
      Logger.warn('[SpeechRecognitionService] Already recording');
      return false;
    }

    // 确保引擎已初始化
    if (!this.asrEngine) {
      const initialized = await this.initialize();
      if (!initialized) {
        callback.onError?.(1002200001, '语音识别引擎初始化失败');
        return false;
      }
    }

    this.callback = callback;
    this.sessionId = `session_${Date.now()}`;
    this.finalResult = '';

    try {
      // 音频参数配置
      const audioParam: speechRecognizer.AudioInfo = {
        audioType: 'pcm',
        sampleRate: 16000,
        soundChannel: 1,
        sampleBit: 16
      };

      // 识别参数配置
      const extraParam: Record<string, Object> = {
        'recognitionMode': 0, // 实时识别
        'vadBegin': 2000,     // 静音检测开始时间
        'vadEnd': 3000,       // 静音检测结束时间
        'maxAudioDuration': 60000 // 最大录音时长60秒
      };

      const recognizerParams: speechRecognizer.StartParams = {
        sessionId: this.sessionId,
        audioInfo: audioParam,
        extraParams: extraParam
      };

      this.asrEngine!.startListening(recognizerParams);
      this.isRecording = true;
      Logger.info('[SpeechRecognitionService] Started recording');
      return true;
    } catch (error) {
      Logger.error('[SpeechRecognitionService] Start recording error', error as Error);
      callback.onError?.(1002200002, '开始录音失败');
      return false;
    }
  }

  /**
   * 停止语音识别
   */
  stopRecording(): void {
    if (!this.isRecording || !this.asrEngine) {
      return;
    }

    try {
      this.asrEngine.finish(this.sessionId);
      Logger.info('[SpeechRecognitionService] Stopped recording');
    } catch (error) {
      Logger.error('[SpeechRecognitionService] Stop recording error', error as Error);
    }
  }

  /**
   * 取消语音识别
   */
  cancelRecording(): void {
    if (!this.asrEngine) return;

    try {
      this.asrEngine.cancel(this.sessionId);
      this.isRecording = false;
      Logger.info('[SpeechRecognitionService] Cancelled recording');
    } catch (error) {
      Logger.error('[SpeechRecognitionService] Cancel recording error', error as Error);
    }
  }

  /**
   * 释放引擎资源
   */
  shutdown(): void {
    if (!this.asrEngine) return;

    try {
      this.asrEngine.shutdown();
      this.asrEngine = null;
      this.isRecording = false;
      Logger.info('[SpeechRecognitionService] Engine shutdown');
    } catch (error) {
      Logger.error('[SpeechRecognitionService] Shutdown error', error as Error);
    }
  }

  /**
   * 检查是否正在录音
   */
  getIsRecording(): boolean {
    return this.isRecording;
  }
}

// 导出单例
export const speechRecognitionService = new SpeechRecognitionService();
