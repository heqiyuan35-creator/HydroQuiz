/**
 * 文本转语音服务
 * HydroQuiz - 水利工程检测员刷题宝
 * 基于 Core Speech Kit 实现 TTS 功能
 */
import { textToSpeech } from '@kit.CoreSpeechKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = 'TextToSpeechService';

// TTS 状态枚举
export enum TTSState {
  IDLE = 'idle',
  CREATING = 'creating',
  READY = 'ready',
  SPEAKING = 'speaking',
  PAUSED = 'paused',
  ERROR = 'error'
}

// TTS 回调接口
export interface TTSCallback {
  onStart?: (requestId: string) => void;
  onComplete?: (requestId: string) => void;
  onStop?: (requestId: string) => void;
  onError?: (requestId: string, errorCode: number, errorMessage: string) => void;
  onStateChange?: (state: TTSState) => void;
}

export class TextToSpeechService {
  private static instance: TextToSpeechService;
  private ttsEngine: textToSpeech.TextToSpeechEngine | null = null;
  private state: TTSState = TTSState.IDLE;
  private callback: TTSCallback | null = null;
  private currentRequestId: string = '';

  private constructor() {}

  public static getInstance(): TextToSpeechService {
    if (!TextToSpeechService.instance) {
      TextToSpeechService.instance = new TextToSpeechService();
    }
    return TextToSpeechService.instance;
  }

  /**
   * 初始化 TTS 引擎
   */
  public async initEngine(): Promise<boolean> {
    if (this.ttsEngine) {
      return true;
    }

    this.updateState(TTSState.CREATING);

    return new Promise((resolve) => {
      const extraParam: Record<string, Object> = {
        "style": 'interaction-broadcast',
        "locate": 'CN',
        "name": 'HydroQuizTTS'
      };

      const initParamsInfo: textToSpeech.CreateEngineParams = {
        language: 'zh-CN',
        person: 0, // 聆小珊女声
        online: 1,
        extraParams: extraParam
      };

      try {
        textToSpeech.createEngine(initParamsInfo,
          (err: BusinessError, engine: textToSpeech.TextToSpeechEngine) => {
            if (!err && engine) {
              console.info(TAG, 'TTS engine created successfully');
              this.ttsEngine = engine;
              this.setupListener();
              this.updateState(TTSState.READY);
              resolve(true);
            } else {
              console.error(TAG, `Failed to create TTS engine: ${err?.code}, ${err?.message}`);
              this.updateState(TTSState.ERROR);
              resolve(false);
            }
          });
      } catch (error) {
        const e = error as BusinessError;
        console.error(TAG, `Exception creating TTS engine: ${e.code}, ${e.message}`);
        this.updateState(TTSState.ERROR);
        resolve(false);
      }
    });
  }

  /**
   * 设置 TTS 监听器
   */
  private setupListener(): void {
    if (!this.ttsEngine) return;

    const speakListener: textToSpeech.SpeakListener = {
      onStart: (requestId: string, response: textToSpeech.StartResponse) => {
        console.info(TAG, `onStart: ${requestId}`);
        this.updateState(TTSState.SPEAKING);
        this.callback?.onStart?.(requestId);
      },
      onComplete: (requestId: string, response: textToSpeech.CompleteResponse) => {
        console.info(TAG, `onComplete: ${requestId}`);
        this.updateState(TTSState.READY);
        this.callback?.onComplete?.(requestId);
      },
      onStop: (requestId: string, response: textToSpeech.StopResponse) => {
        console.info(TAG, `onStop: ${requestId}`);
        this.updateState(TTSState.READY);
        this.callback?.onStop?.(requestId);
      },
      onData: (requestId: string, audio: ArrayBuffer, response: textToSpeech.SynthesisResponse) => {
        // 音频数据回调，playType=1 时系统自动播放，无需处理
      },
      onError: (requestId: string, errorCode: number, errorMessage: string) => {
        console.error(TAG, `onError: ${requestId}, code: ${errorCode}, msg: ${errorMessage}`);
        if (errorCode === 1002300007) {
          // 引擎未初始化，需要重新创建
          this.ttsEngine = null;
          this.updateState(TTSState.IDLE);
        } else {
          this.updateState(TTSState.ERROR);
        }
        this.callback?.onError?.(requestId, errorCode, errorMessage);
      }
    };

    this.ttsEngine.setListener(speakListener);
  }


  /**
   * 过滤文本中的特殊符号，使朗读更自然
   * @param text 原始文本
   * @returns 过滤后的文本
   */
  private filterSpecialSymbols(text: string): string {
    // 过滤特殊符号，保留基本标点和文字
    let filtered = text
      // 移除表格相关符号
      .replace(/[│├┤┬┴┼─═║╔╗╚╝╠╣╦╩╬┌┐└┘]/g, ' ')
      // 移除方框和勾选符号
      .replace(/[□■◇◆○●△▲▽▼☆★◎✓✔✗✘☐☑☒]/g, '')
      // 移除数学运算符号（保留基本的加减乘除）
      .replace(/[≈≠≤≥∞∑∏∫∂√∛∜±∓×÷∈∉∪∩⊂⊃⊆⊇∀∃∅∧∨¬⊕⊗]/g, '')
      // 移除希腊字母符号
      .replace(/[αβγδεζηθικλμνξοπρστυφχψωΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ]/g, '')
      // 移除上下标数字
      .replace(/[⁰¹²³⁴⁵⁶⁷⁸⁹₀₁₂₃₄₅₆₇₈₉⁺⁻⁼⁽⁾ⁿ]/g, '')
      // 移除箭头符号
      .replace(/[←→↑↓↔↕⇐⇒⇑⇓⇔⇕➔➜➡⬅⬆⬇]/g, '')
      // 移除括号内的编号如(1)、[2]等，但保留内容
      .replace(/[\[\]【】〔〕〈〉《》「」『』]/g, '')
      // 移除特殊引号
      .replace(/[""''`´]/g, '')
      // 移除项目符号
      .replace(/[•·‣⁃◦▪▫]/g, '')
      // 移除分隔线
      .replace(/[-]{3,}/g, '')
      .replace(/[=]{3,}/g, '')
      .replace(/[_]{3,}/g, '')
      .replace(/[*]{3,}/g, '')
      // 移除法律条文中的特殊格式符号
      .replace(/[§¶†‡※]/g, '')
      // 移除货币和单位符号（朗读时会读出来）
      .replace(/[℃℉°′″‰‱]/g, '')
      // 移除版权和商标符号
      .replace(/[©®™℗]/g, '')
      // 移除制表符和特殊空白字符
      .replace(/[\t\v\f\r]/g, ' ')
      // 移除多余的空格和换行
      .replace(/\s+/g, ' ')
      // 移除连续的标点符号
      .replace(/[，。！？；：、]{2,}/g, '。')
      // 处理条款编号格式，使朗读更自然
      .replace(/第([一二三四五六七八九十百千]+)条/g, '第$1条，')
      .replace(/第([一二三四五六七八九十百千]+)章/g, '第$1章，')
      .replace(/第([一二三四五六七八九十百千]+)节/g, '第$1节，')
      // 处理比例尺格式，如"1比200"或"1:200"
      .replace(/1[:：比](\d+)/g, '一比$1')
      // 处理正负符号
      .replace(/正负(\d+)/g, '正负$1')
      .replace(/[±](\d+)/g, '正负$1')
      // 处理序号格式，如"（一）"、"（1）"等
      .replace(/[（(]([一二三四五六七八九十]+)[）)]/g, '第$1，')
      .replace(/[（(](\d+)[）)]/g, '第$1，')
      .trim();

    return filtered;
  }

  /**
   * 开始朗读文本
   * @param text 要朗读的文本
   * @param speed 语速 (0.5-2.0)，默认 1.0
   */
  public async speak(text: string, speed: number = 1.0): Promise<boolean> {
    if (!text || text.trim().length === 0) {
      return false;
    }

    // 过滤特殊符号
    text = this.filterSpecialSymbols(text);
    console.info(TAG, `Filtered text length: ${text.length}`);

    // 文本长度限制（最大10000字）
    if (text.length > 10000) {
      text = text.substring(0, 10000);
      console.warn(TAG, 'Text truncated to 10000 characters');
    }

    if (!this.ttsEngine) {
      const initialized = await this.initEngine();
      if (!initialized) {
        return false;
      }
    }

    // 如果正在播放，先停止
    if (this.state === TTSState.SPEAKING) {
      this.stop();
    }

    this.currentRequestId = `tts_${Date.now()}`;

    const extraParam: Record<string, Object> = {
      "queueMode": 0,
      "speed": Math.max(0.5, Math.min(2.0, speed)),
      "volume": 2,
      "pitch": 1,
      "languageContext": 'zh-CN',
      "audioType": "pcm",
      "soundChannel": 3,
      "playType": 1 // 系统自动播放
    };

    const speakParams: textToSpeech.SpeakParams = {
      requestId: this.currentRequestId,
      extraParams: extraParam
    };

    try {
      this.ttsEngine!.speak(text, speakParams);
      return true;
    } catch (error) {
      const e = error as BusinessError;
      console.error(TAG, `Speak failed: ${e.code}, ${e.message}`);
      return false;
    }
  }

  /**
   * 停止朗读
   */
  public stop(): void {
    if (this.ttsEngine && this.state === TTSState.SPEAKING) {
      try {
        this.ttsEngine.stop();
      } catch (error) {
        console.error(TAG, `Stop failed: ${(error as BusinessError).message}`);
      }
    }
  }

  /**
   * 检查是否正在播放
   */
  public isBusy(): boolean {
    if (this.ttsEngine) {
      try {
        return this.ttsEngine.isBusy();
      } catch (error) {
        return false;
      }
    }
    return false;
  }

  /**
   * 获取当前状态
   */
  public getState(): TTSState {
    return this.state;
  }

  /**
   * 设置回调
   */
  public setCallback(callback: TTSCallback): void {
    this.callback = callback;
  }

  /**
   * 清除回调
   */
  public clearCallback(): void {
    this.callback = null;
  }

  /**
   * 更新状态
   */
  private updateState(newState: TTSState): void {
    this.state = newState;
    this.callback?.onStateChange?.(newState);
  }

  /**
   * 释放资源
   */
  public shutdown(): void {
    if (this.ttsEngine) {
      try {
        this.ttsEngine.shutdown();
        this.ttsEngine = null;
        this.updateState(TTSState.IDLE);
        console.info(TAG, 'TTS engine shutdown');
      } catch (error) {
        console.error(TAG, `Shutdown failed: ${(error as BusinessError).message}`);
      }
    }
  }
}
