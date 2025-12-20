# HarmonyOS 开发技术详解

> 念安的项目技术文档 - 让你一看就会，一用就对

## 目录

1. [拖动删除效果](#1-拖动删除效果)
2. [动画效果](#2-动画效果)
3. [语音转文字 (ASR)](#3-语音转文字-asr)
4. [文字转语音 (TTS)](#4-文字转语音-tts)
5. [图片转文字 (OCR)](#5-图片转文字-ocr)
6. [Form Kit 卡片开发](#6-form-kit-卡片开发)
7. [ArkWeb 网页组件](#7-arkweb-网页组件)
8. [ECharts 图表集成](#8-echarts-图表集成)
9. [ArkTS 常见错误与解决方案](#9-arkts-常见错误与解决方案)
10. [ArkTS 最佳实践](#10-arkts-最佳实践)

---

## 1. 拖动删除效果

### 核心原理
通过 `GestureGroup` 组合长按手势和拖拽手势，实现"长按激活 → 拖拽移动 → 松手删除"的交互流程。

### 关键代码

```typescript
// 1. 定义状态变量
@State isDragging: boolean = false;           // 是否正在拖拽
@State draggingItemId: string = '';           // 正在拖拽的项目ID
@State isInDeleteZone: boolean = false;       // 是否在删除区域
@State showDeleteZone: boolean = false;       // 是否显示删除区域

// 2. 使用 @Observed 类追踪单项动画状态
@Observed
class WrongQuestionItem {
  translateX: number = 0;    // X轴偏移
  translateY: number = 0;    // Y轴偏移
  scaleVal: number = 1;      // 缩放值
  opacityVal: number = 1;    // 透明度
}
```

### 手势组合实现

```typescript
.gesture(
  GestureGroup(GestureMode.Sequence,  // 顺序执行：先长按，再拖拽
    // 第一步：长按触发
    LongPressGesture({ repeat: false, duration: 500 })
      .onAction(() => {
        this.isDragging = true;
        this.draggingItemId = item.question.id;
        this.showDeleteZone = true;  // 显示底部删除区域
      }),
    
    // 第二步：拖拽移动
    PanGesture({ fingers: 1, direction: PanDirection.All, distance: 1 })
      .onActionUpdate((event: GestureEvent) => {
        if (this.isDragging) {
          // 实时更新位置
          item.translateX = event.offsetX;
          item.translateY = event.offsetY;
          
          // 检测是否进入删除区域（向下拖拽超过150px）
          this.isInDeleteZone = event.offsetY > 150;
        }
      })
      .onActionEnd(() => {
        if (this.isInDeleteZone) {
          // 在删除区域松手 → 执行删除
          this.deleteItemWithAnimation(item);
        } else {
          // 不在删除区域 → 弹回原位
          this.getUIContext()?.animateTo({ curve: curves.springMotion() }, () => {
            item.translateX = 0;
            item.translateY = 0;
          });
        }
        // 重置状态
        this.isDragging = false;
        this.showDeleteZone = false;
      })
  )
)
```

### 删除区域 UI

```typescript
@Builder
DeleteZone() {
  Column() {
    Image(this.isInDeleteZone ? $r('app.media.Selectanddelete') : $r('app.media.delete'))
      .width(this.isInDeleteZone ? 48 : 36)
      .height(this.isInDeleteZone ? 48 : 36)
      .fillColor(this.isInDeleteZone ? ThemeColors.ERROR : ThemeColors.TEXT_HINT)
      .animation({ duration: 200, curve: Curve.EaseOut })

    Text(this.isInDeleteZone ? '松手删除' : '拖到这里删除')
      .fontSize(14)
      .fontColor(this.isInDeleteZone ? ThemeColors.ERROR : ThemeColors.TEXT_HINT)
  }
  .width('100%')
  .height(100)
  .justifyContent(FlexAlign.Center)
  .backgroundColor(this.isInDeleteZone ? 'rgba(255, 77, 79, 0.15)' : 'rgba(0, 0, 0, 0.05)')
  .position({ x: 0, y: '100%' })
  .translate({ y: -100 })  // 固定在底部
}
```

### 使用要点
- `GestureMode.Sequence` 确保手势按顺序执行
- `@Observed` + `@ObjectLink` 实现单项状态追踪
- `curves.springMotion()` 提供弹性回弹效果
- 删除区域使用 `position` + `translate` 固定在底部

---

## 2. 动画效果

### 2.1 入场动画（列表项依次出现）

```typescript
// 动画常量
const ENTRY_INTERVAL: number = 30;   // 每项延迟间隔(ms)
const ENTRY_DURATION: number = 300;  // 动画时长(ms)

// 包装组件实现入场动画
@Component
struct WrongItemAnimWrapper {
  @ObjectLink item: WrongQuestionItem;
  @Prop index: number = 0;

  build() {
    Column() {
      // 内容
    }
    .transition(
      TransitionEffect.OPACITY
        .combine(TransitionEffect.scale({ x: 0.5, y: 0.5 }))
        .animation({ 
          duration: ENTRY_DURATION, 
          curve: Curve.Friction, 
          delay: ENTRY_INTERVAL * this.index  // 关键：根据索引延迟
        })
    )
  }
}

// 触发入场动画
private triggerEntryAnimation(): void {
  this.getUIContext()?.animateTo({
    duration: ENTRY_DURATION + ENTRY_INTERVAL * (this.wrongItems.length - 1),
    curve: Curve.Friction
  }, () => {
    this.showList = true;  // 切换状态触发 transition
  });
}
```

### 2.2 飞走动画（两阶段动画）

```typescript
/**
 * 飞走动画：先向右移动80px，再向左滑出屏幕
 */
private async flyAwayAndRemove(questionId: string): Promise<void> {
  const targetItem = this.wrongItems.find(i => i.question.id === questionId);
  if (!targetItem) return;

  const phase1Duration = 300;  // 阶段1时长
  const phase2Duration = 400;  // 阶段2时长
  const rightOffset = 80;      // 向右偏移
  const leftOffset = -500;     // 向左滑出

  // 创建动画器
  const animatorOption: AnimatorOptions = {
    duration: phase1Duration + phase2Duration,
    easing: 'linear',
    iterations: 1,
    fill: 'forwards',
    begin: 0,
    end: 100  // 用百分比控制进度
  };

  const animator = this.getUIContext()?.createAnimator(animatorOption);
  
  animator.onFrame = (progress: number) => {
    const phase1End = (phase1Duration / (phase1Duration + phase2Duration)) * 100;

    if (progress <= phase1End) {
      // 阶段1：向右移动（缓出效果）
      const phase1Progress = progress / phase1End;
      const easeOut = 1 - Math.pow(1 - phase1Progress, 3);
      targetItem.translateX = rightOffset * easeOut;
    } else {
      // 阶段2：向左滑出（缓入效果）
      const phase2Progress = (progress - phase1End) / (100 - phase1End);
      const easeIn = Math.pow(phase2Progress, 2);
      targetItem.translateX = rightOffset + (leftOffset - rightOffset) * easeIn;
      targetItem.opacityVal = 1 - phase2Progress * 0.5;  // 逐渐变淡
    }
  };

  animator.onFinish = () => {
    // 动画完成后从列表移除
    this.wrongItems = this.wrongItems.filter(i => i.question.id !== questionId);
  };

  animator.play();
}
```

### 2.3 删除缩放动画

```typescript
private async deleteItemWithAnimation(item: WrongQuestionItem): Promise<void> {
  // 播放缩放+淡出动画
  this.getUIContext()?.animateTo({
    duration: 300,
    curve: Curve.EaseIn
  }, () => {
    item.scaleVal = 0;
    item.opacityVal = 0;
  });

  // 等待动画完成后删除数据
  setTimeout(async () => {
    await answerRecordService.markAsMastered(item.question.id);
    this.wrongItems = this.wrongItems.filter(i => i.question.id !== item.question.id);
  }, 300);
}
```

### 2.4 进度条渐变动画

```typescript
// 进度条背景
Row()
  .width('100%')
  .height(6)
  .backgroundColor('rgba(255, 255, 255, 0.25)')
  .borderRadius(3)

// 进度条填充（渐变色）
Row()
  .width(`${Math.max(this.progressPercent, 2)}%`)
  .height(6)
  .linearGradient({
    direction: GradientDirection.Right,
    colors: [['#52C41A', 0.0], ['#73D13D', 1.0]]
  })
  .borderRadius(3)
```

### 动画常用曲线
| 曲线 | 效果 | 适用场景 |
|------|------|----------|
| `Curve.Friction` | 摩擦减速 | 入场动画 |
| `Curve.EaseIn` | 缓入 | 退出/消失 |
| `Curve.EaseOut` | 缓出 | 进入/出现 |
| `curves.springMotion()` | 弹性 | 回弹效果 |

---

## 3. 语音转文字 (ASR)

### 核心 Kit
```typescript
import { speechRecognizer } from '@kit.CoreSpeechKit';
```

### 服务封装

```typescript
class SpeechRecognitionService {
  private asrEngine: speechRecognizer.SpeechRecognitionEngine | null = null;
  private sessionId: string = '';
  private isRecording: boolean = false;

  /**
   * 初始化语音识别引擎
   */
  async initialize(): Promise<boolean> {
    const extraParam: Record<string, Object> = {
      'locate': 'CN',
      'recognizerMode': 'short'  // 短语音模式，不超过60s
    };

    const initParamsInfo: speechRecognizer.CreateEngineParams = {
      language: 'zh-CN',
      online: 1,  // 离线模式
      extraParams: extraParam
    };

    return new Promise((resolve) => {
      speechRecognizer.createEngine(initParamsInfo, (err, engine) => {
        if (!err && engine) {
          this.asrEngine = engine;
          this.setupListener();
          resolve(true);
        } else {
          resolve(false);
        }
      });
    });
  }

  /**
   * 设置识别回调监听
   */
  private setupListener(): void {
    const listener: speechRecognizer.RecognitionListener = {
      onStart: (sessionId, eventMessage) => {
        // 开始识别
      },
      onResult: (sessionId, result) => {
        const text = result.result || '';
        const isFinal = result.isFinal || false;
        // 实时返回识别结果
        this.callback?.onResult?.(text, isFinal);
      },
      onComplete: (sessionId, eventMessage) => {
        this.isRecording = false;
        this.callback?.onComplete?.(this.finalResult);
      },
      onError: (sessionId, errorCode, errorMessage) => {
        this.isRecording = false;
        this.callback?.onError?.(errorCode, errorMessage);
      }
    };
    this.asrEngine.setListener(listener);
  }

  /**
   * 开始语音识别（麦克风录音）
   */
  async startRecording(callback: SpeechRecognitionCallback): Promise<boolean> {
    if (this.isRecording) return false;
    
    this.callback = callback;
    this.sessionId = `session_${Date.now()}`;

    // 音频参数配置
    const audioParam: speechRecognizer.AudioInfo = {
      audioType: 'pcm',
      sampleRate: 16000,
      soundChannel: 1,
      sampleBit: 16
    };

    // 识别参数配置
    const extraParam: Record<string, Object> = {
      'recognitionMode': 0,       // 实时识别
      'vadBegin': 2000,           // 静音检测开始时间
      'vadEnd': 3000,             // 静音检测结束时间
      'maxAudioDuration': 60000   // 最大录音时长60秒
    };

    const recognizerParams: speechRecognizer.StartParams = {
      sessionId: this.sessionId,
      audioInfo: audioParam,
      extraParams: extraParam
    };

    this.asrEngine!.startListening(recognizerParams);
    this.isRecording = true;
    return true;
  }

  /**
   * 停止语音识别
   */
  stopRecording(): void {
    if (this.isRecording && this.asrEngine) {
      this.asrEngine.finish(this.sessionId);
    }
  }
}
```

### 页面使用示例

```typescript
// 1. 检查麦克风权限
private async checkMicPermission(): Promise<void> {
  const atManager = abilityAccessCtrl.createAtManager();
  const context = getContext(this) as common.UIAbilityContext;
  const tokenId = context.applicationInfo.accessTokenId;
  const grantStatus = atManager.checkAccessTokenSync(tokenId, 'ohos.permission.MICROPHONE');
  this.hasMicPermission = grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
}

// 2. 请求权限
private async requestMicPermission(): Promise<boolean> {
  const permissions: Permissions[] = ['ohos.permission.MICROPHONE'];
  const atManager = abilityAccessCtrl.createAtManager();
  const context = getContext(this) as common.UIAbilityContext;
  const result = await atManager.requestPermissionsFromUser(context, permissions);
  return result.authResults[0] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
}

// 3. 开始语音输入
private async startVoiceInput(): Promise<void> {
  if (!this.hasMicPermission) {
    const granted = await this.requestMicPermission();
    if (!granted) {
      promptAction.showToast({ message: '需要麦克风权限' });
      return;
    }
  }

  const callback: SpeechRecognitionCallback = {
    onResult: (text, isFinal) => {
      this.recordingText = text;  // 实时显示
    },
    onComplete: (text) => {
      this.isRecording = false;
      this.editingNote += text;   // 追加到文本
    },
    onError: (errorCode, errorMessage) => {
      this.isRecording = false;
      promptAction.showToast({ message: `识别失败: ${errorMessage}` });
    }
  };

  await speechRecognitionService.startRecording(callback);
  this.isRecording = true;
}
```

### 权限配置 (module.json5)
```json
{
  "requestPermissions": [
    {
      "name": "ohos.permission.MICROPHONE",
      "reason": "$string:mic_permission_reason",
      "usedScene": {
        "abilities": ["EntryAbility"],
        "when": "inuse"
      }
    }
  ]
}
```

---

## 4. 文字转语音 (TTS)

### 核心 Kit
```typescript
import { textToSpeech } from '@kit.CoreSpeechKit';
```

### 服务封装

```typescript
export class TextToSpeechService {
  private static instance: TextToSpeechService;
  private ttsEngine: textToSpeech.TextToSpeechEngine | null = null;
  private state: TTSState = TTSState.IDLE;

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
    if (this.ttsEngine) return true;

    const extraParam: Record<string, Object> = {
      "style": 'interaction-broadcast',
      "locate": 'CN',
      "name": 'HydroQuizTTS'
    };

    const initParamsInfo: textToSpeech.CreateEngineParams = {
      language: 'zh-CN',
      person: 0,      // 聆小珊女声
      online: 1,
      extraParams: extraParam
    };

    return new Promise((resolve) => {
      textToSpeech.createEngine(initParamsInfo, (err, engine) => {
        if (!err && engine) {
          this.ttsEngine = engine;
          this.setupListener();
          resolve(true);
        } else {
          resolve(false);
        }
      });
    });
  }

  /**
   * 设置 TTS 监听器
   */
  private setupListener(): void {
    const speakListener: textToSpeech.SpeakListener = {
      onStart: (requestId, response) => {
        this.updateState(TTSState.SPEAKING);
        this.callback?.onStart?.(requestId);
      },
      onComplete: (requestId, response) => {
        this.updateState(TTSState.READY);
        this.callback?.onComplete?.(requestId);
      },
      onStop: (requestId, response) => {
        this.updateState(TTSState.READY);
        this.callback?.onStop?.(requestId);
      },
      onData: (requestId, audio, response) => {
        // playType=1 时系统自动播放，无需处理
      },
      onError: (requestId, errorCode, errorMessage) => {
        this.updateState(TTSState.ERROR);
        this.callback?.onError?.(requestId, errorCode, errorMessage);
      }
    };
    this.ttsEngine.setListener(speakListener);
  }

  /**
   * 开始朗读文本
   * @param text 要朗读的文本
   * @param speed 语速 (0.5-2.0)，默认 1.0
   */
  public async speak(text: string, speed: number = 1.0): Promise<boolean> {
    if (!text || text.trim().length === 0) return false;

    // 过滤特殊符号
    text = this.filterSpecialSymbols(text);

    // 文本长度限制（最大10000字）
    if (text.length > 10000) {
      text = text.substring(0, 10000);
    }

    if (!this.ttsEngine) {
      const initialized = await this.initEngine();
      if (!initialized) return false;
    }

    // 如果正在播放，先停止
    if (this.state === TTSState.SPEAKING) {
      this.stop();
    }

    const extraParam: Record<string, Object> = {
      "queueMode": 0,
      "speed": Math.max(0.5, Math.min(2.0, speed)),
      "volume": 2,
      "pitch": 1,
      "languageContext": 'zh-CN',
      "audioType": "pcm",
      "soundChannel": 3,
      "playType": 1  // 系统自动播放
    };

    const speakParams: textToSpeech.SpeakParams = {
      requestId: `tts_${Date.now()}`,
      extraParams: extraParam
    };

    this.ttsEngine!.speak(text, speakParams);
    return true;
  }

  /**
   * 停止朗读
   */
  public stop(): void {
    if (this.ttsEngine && this.state === TTSState.SPEAKING) {
      this.ttsEngine.stop();
    }
  }

  /**
   * 过滤特殊符号，使朗读更自然
   */
  private filterSpecialSymbols(text: string): string {
    return text
      .replace(/[│├┤┬┴┼─═║╔╗╚╝╠╣╦╩╬┌┐└┘]/g, ' ')  // 表格符号
      .replace(/[□■◇◆○●△▲▽▼☆★◎✓✔✗✘☐☑☒]/g, '')   // 特殊符号
      .replace(/[←→↑↓↔↕⇐⇒⇑⇓⇔⇕➔➜➡⬅⬆⬇]/g, '')     // 箭头
      .replace(/第([一二三四五六七八九十百千]+)条/g, '第$1条，')  // 条款格式
      .replace(/1[:：比](\d+)/g, '一比$1')          // 比例尺
      .replace(/\s+/g, ' ')
      .trim();
  }
}
```

### 页面使用示例

```typescript
// 初始化
private ttsService: TextToSpeechService = TextToSpeechService.getInstance();

aboutToAppear(): void {
  this.setupTTSCallback();
}

aboutToDisappear(): void {
  this.ttsService.stop();
  this.ttsService.clearCallback();
}

private setupTTSCallback(): void {
  const callback: TTSCallback = {
    onStateChange: (state: TTSState) => { 
      this.ttsState = state; 
    },
    onComplete: (requestId: string) => { 
      promptAction.showToast({ message: '朗读完成' }); 
    },
    onError: (requestId, errorCode, errorMessage) => {
      promptAction.showToast({ message: `朗读失败: ${errorMessage}` });
    }
  };
  this.ttsService.setCallback(callback);
}

// 朗读按钮点击
private async handleTTSButtonClick(): Promise<void> {
  if (this.ttsState === TTSState.SPEAKING) {
    this.ttsService.stop();
  } else {
    const textToSpeak = `${this.article.title}。${this.article.content}`;
    await this.ttsService.speak(textToSpeak, 1.0);
  }
}
```

---

## 5. 图片转文字 (OCR)

### 核心 Kit
```typescript
import { textRecognition } from '@kit.CoreVisionKit';
import { image } from '@kit.ImageKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
```

### 服务封装

```typescript
class TextRecognitionService {
  private isInitialized: boolean = false;

  /**
   * 初始化 OCR 服务
   */
  async initialize(): Promise<boolean> {
    if (this.isInitialized) return true;
    const result = await textRecognition.init();
    this.isInitialized = result;
    return result;
  }

  /**
   * 释放 OCR 服务
   */
  async release(): Promise<void> {
    if (this.isInitialized) {
      await textRecognition.release();
      this.isInitialized = false;
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
      }).then((res) => {
        if (res.photoUris && res.photoUris.length > 0) {
          resolve(res.photoUris[0]);
        } else {
          resolve('');
        }
      }).catch(() => {
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
      return null;
    }
  }

  /**
   * 识别图片中的文字
   */
  async recognizeText(pixelMap: image.PixelMap): Promise<string> {
    if (!this.isInitialized) {
      await this.initialize();
    }

    const visionInfo: textRecognition.VisionInfo = {
      pixelMap: pixelMap
    };

    const config: textRecognition.TextRecognitionConfiguration = {
      isDirectionDetectionSupported: false
    };

    const result = await textRecognition.recognizeText(visionInfo, config);
    return result.value;
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
      callback.onError?.(1000, '识别失败');
    }
  }
}

export const textRecognitionService = new TextRecognitionService();
```

### 页面使用示例

```typescript
private async startOcrRecognition(): Promise<void> {
  if (this.isRecognizing) return;
  
  this.isRecognizing = true;
  promptAction.showToast({ message: '请选择图片...' });

  const callback: TextRecognitionCallback = {
    onSuccess: (text: string) => {
      this.isRecognizing = false;
      // 将识别结果追加到笔记
      this.editingNote = this.editingNote.length > 0 
        ? this.editingNote + '\n' + text 
        : text;
      promptAction.showToast({ message: '文字识别成功' });
    },
    onError: (errorCode: number, errorMessage: string) => {
      this.isRecognizing = false;
      if (errorCode !== 1001) {  // 1001 是未选择图片
        promptAction.showToast({ message: `识别失败: ${errorMessage}` });
      }
    }
  };

  await textRecognitionService.selectAndRecognize(callback);
}
```

---

## 6. Form Kit 卡片开发

### 核心 Kit
```typescript
import { formBindingData, FormExtensionAbility, formInfo, formProvider } from '@kit.FormKit';
```

### 6.1 卡片扩展能力 (EntryFormAbility)

```typescript
export default class EntryFormAbility extends FormExtensionAbility {
  /**
   * 卡片添加时触发
   */
  onAddForm(want: Want): formBindingData.FormBindingData {
    const formId = want.parameters?.[formInfo.FormParam.IDENTITY_KEY] as string;
    const formName = want.parameters?.[formInfo.FormParam.NAME_KEY] as string;

    // 保存 formId 到 Preferences（用于后续更新）
    this.saveFormId(formId);

    // 根据卡片名称返回不同数据
    if (formName === 'StudyProgress') {
      return this.getStudyProgressData();
    } else {
      return this.getStudyReminderData();
    }
  }

  /**
   * 卡片更新时触发
   */
  onUpdateForm(formId: string): void {
    this.updateFormData(formId);
  }

  /**
   * 卡片事件触发（用户点击刷新按钮等）
   */
  onFormEvent(formId: string, message: string): void {
    const msgObj = JSON.parse(message) as Record<string, string>;
    if (msgObj['action'] === 'refresh') {
      this.updateFormData(formId);
    }
  }

  /**
   * 卡片移除时触发
   */
  onRemoveForm(formId: string): void {
    this.removeFormId(formId);
  }

  /**
   * 获取学习进度卡片数据
   */
  private getStudyProgressData(): formBindingData.FormBindingData {
    const rawData = this.loadStudyData();
    
    const progressData = {
      todayCount: rawData.todayCount,
      targetCount: rawData.targetCount,
      correctCount: rawData.correctCount,
      wrongCount: rawData.wrongCount,
      accuracy: rawData.todayCount > 0 
        ? Math.round((rawData.correctCount / rawData.todayCount) * 100) 
        : 0,
      isCheckedIn: rawData.isCheckedIn,
      streakDays: rawData.streakDays,
      progressPercent: rawData.targetCount > 0
        ? Math.min(100, Math.round((rawData.todayCount / rawData.targetCount) * 100))
        : 0
    };

    return formBindingData.createFormBindingData(progressData);
  }

  /**
   * 从 Preferences 加载学习数据
   */
  private loadStudyData(): StudyProgressData {
    const pref = preferences.getPreferencesSync(this.context, { name: 'hydro_quiz_prefs' });
    const today = new Date().toDateString();
    const lastStudyDate = pref.getSync('lastStudyDate', '') as string;

    // 如果不是今天的数据，重置今日统计
    if (lastStudyDate !== today) {
      return {
        todayCount: 0,
        targetCount: pref.getSync('dailyTarget', 20) as number,
        correctCount: 0,
        wrongCount: 0,
        isCheckedIn: false,
        streakDays: pref.getSync('streakDays', 0) as number
      };
    }

    return {
      todayCount: pref.getSync('todayAnswerCount', 0) as number,
      targetCount: pref.getSync('dailyTarget', 20) as number,
      correctCount: pref.getSync('todayCorrectCount', 0) as number,
      wrongCount: pref.getSync('todayWrongCount', 0) as number,
      isCheckedIn: pref.getSync('isCheckedInToday', false) as boolean,
      streakDays: pref.getSync('streakDays', 0) as number
    };
  }

  /**
   * 更新卡片数据
   */
  private updateFormData(formId: string): void {
    const rawData = this.loadStudyData();
    const formData = formBindingData.createFormBindingData(rawData);

    formProvider.updateForm(formId, formData)
      .then(() => { console.info('Update form success'); })
      .catch((error) => { console.error('Update form failed'); });
  }
}
```

### 6.2 卡片 UI 页面

```typescript
// StudyProgressCard.ets
let storageProgress = new LocalStorage();

@Entry(storageProgress)
@Component
struct StudyProgressCard {
  // 使用 @LocalStorageProp 绑定卡片数据
  @LocalStorageProp('todayCount') todayCount: number = 0;
  @LocalStorageProp('targetCount') targetCount: number = 20;
  @LocalStorageProp('correctCount') correctCount: number = 0;
  @LocalStorageProp('accuracy') accuracy: number = 0;
  @LocalStorageProp('isCheckedIn') isCheckedIn: boolean = false;
  @LocalStorageProp('progressPercent') progressPercent: number = 0;

  build() {
    Stack() {
      // 背景图
      Image($r('app.media.Wavebackground'))
        .width('100%').height('100%')
        .objectFit(ImageFit.Cover)
        .borderRadius(16)

      // 渐变遮罩层
      Column()
        .width('100%').height('100%')
        .borderRadius(16)
        .linearGradient({
          direction: GradientDirection.RightBottom,
          colors: [['rgba(24, 144, 255, 0.8)', 0.0], ['rgba(0, 80, 179, 0.9)', 1.0]]
        })

      // 内容层
      Column() {
        // 顶部标题
        Row() {
          Text('今日学习').fontSize(14).fontColor('#FFFFFF')
          Blank()
          if (this.isCheckedIn) {
            Text('✓ 已打卡').fontSize(10).fontColor('#52C41A')
              .backgroundColor('rgba(82, 196, 26, 0.25)')
              .padding({ left: 8, right: 8, top: 4, bottom: 4 })
              .borderRadius(8)
          }
        }
        .width('100%').padding({ left: 16, right: 16, top: 12 })

        // 主要数据
        Row() {
          Column() {
            Text(`${this.todayCount}`).fontSize(42).fontWeight(FontWeight.Bold).fontColor('#FFFFFF')
            Text(`目标 ${this.targetCount} 题`).fontSize(12).fontColor('#FFFFFF').opacity(0.8)
          }
          Blank()
          // 正确率圆环
          this.AccuracyRing()
        }
        .width('100%').padding({ left: 16, right: 16, top: 8 })

        Blank()

        // 进度条
        this.ProgressBar()
      }
      .width('100%').height('100%')
    }
    .width('100%').height('100%')
    .borderRadius(16)
    .onClick(() => {
      // 点击卡片跳转到 App
      postCardAction(this, {
        action: 'router',
        abilityName: 'EntryAbility',
        params: { targetPage: 'MainTabPage' }
      });
    })
  }

  @Builder
  AccuracyRing() {
    Stack() {
      Circle().width(56).height(56).fill(Color.Transparent)
        .stroke('rgba(255, 255, 255, 0.25)').strokeWidth(5)
      Circle().width(56).height(56).fill(Color.Transparent)
        .stroke(this.accuracy >= 80 ? '#52C41A' : '#FFA940')
        .strokeWidth(5)
        .strokeDashArray([this.accuracy * 1.76, 176])
        .rotate({ angle: -90 })
      Text(`${this.accuracy}%`).fontSize(13).fontWeight(FontWeight.Bold).fontColor('#FFFFFF')
    }
  }

  @Builder
  ProgressBar() {
    Column() {
      Row() {
        Text('完成进度').fontSize(10).fontColor('#FFFFFF').opacity(0.8)
        Blank()
        Text(`${this.progressPercent}%`).fontSize(10).fontColor('#FFFFFF')
      }
      Stack({ alignContent: Alignment.Start }) {
        Row().width('100%').height(6).backgroundColor('rgba(255, 255, 255, 0.25)').borderRadius(3)
        Row().width(`${Math.max(this.progressPercent, 2)}%`).height(6)
          .linearGradient({ direction: GradientDirection.Right, colors: [['#52C41A', 0], ['#73D13D', 1]] })
          .borderRadius(3)
      }
      .margin({ top: 6 })
    }
    .width('100%').padding({ left: 16, right: 16, bottom: 14 })
  }
}
```

### 6.3 App 端数据同步服务

```typescript
// WidgetDataService.ets
class WidgetDataService {
  private context: common.UIAbilityContext | null = null;

  init(context: common.UIAbilityContext): void {
    this.context = context;
  }

  /**
   * 更新今日答题数据
   */
  async updateTodayStats(correctCount: number, wrongCount: number): Promise<void> {
    const pref = preferences.getPreferencesSync(this.context, { name: 'hydro_quiz_prefs' });
    const today = new Date().toDateString();
    const lastDate = pref.getSync('lastStudyDate', '') as string;

    // 如果是新的一天，重置统计
    if (lastDate !== today) {
      pref.putSync('lastStudyDate', today);
      pref.putSync('todayAnswerCount', 0);
      pref.putSync('todayCorrectCount', 0);
      pref.putSync('todayWrongCount', 0);
    }

    // 更新统计
    const currentTotal = pref.getSync('todayAnswerCount', 0) as number;
    pref.putSync('todayAnswerCount', currentTotal + correctCount + wrongCount);
    pref.putSync('todayCorrectCount', (pref.getSync('todayCorrectCount', 0) as number) + correctCount);
    pref.putSync('todayWrongCount', (pref.getSync('todayWrongCount', 0) as number) + wrongCount);

    await pref.flush();

    // 更新所有卡片
    await this.updateAllWidgets();
  }

  /**
   * 更新所有卡片
   */
  private async updateAllWidgets(): Promise<void> {
    const pref = preferences.getPreferencesSync(this.context, { name: 'hydro_quiz_prefs' });
    const formIdsStr = pref.getSync('formIds', '') as string;
    if (!formIdsStr) return;

    const formIds = formIdsStr.split(',').filter(id => id.length > 0);
    const data = await this.getWidgetData();
    const formData = formBindingData.createFormBindingData(data);

    for (const formId of formIds) {
      formProvider.updateForm(formId, formData)
        .catch((err) => { console.error(`Update form ${formId} failed`); });
    }
  }
}

export const widgetDataService = new WidgetDataService();
```

### 6.4 卡片配置 (form_config.json)

```json
{
  "forms": [
    {
      "name": "StudyReminder",
      "description": "学习提醒卡片",
      "src": "./ets/widget/pages/StudyReminderCard.ets",
      "window": {
        "designWidth": 720,
        "autoDesignWidth": true
      },
      "colorMode": "auto",
      "isDefault": true,
      "updateEnabled": true,
      "scheduledUpdateTime": "10:30",
      "updateDuration": 1,
      "defaultDimension": "2*2",
      "supportDimensions": ["2*2"]
    },
    {
      "name": "StudyProgress",
      "description": "学习进度卡片",
      "src": "./ets/widget/pages/StudyProgressCard.ets",
      "window": {
        "designWidth": 720,
        "autoDesignWidth": true
      },
      "colorMode": "auto",
      "isDefault": false,
      "updateEnabled": true,
      "updateDuration": 1,
      "defaultDimension": "2*4",
      "supportDimensions": ["2*4"]
    }
  ]
}
```

---

## 快速参考表

| 功能 | Kit | 核心 API |
|------|-----|----------|
| 语音转文字 | CoreSpeechKit | `speechRecognizer.createEngine()` |
| 文字转语音 | CoreSpeechKit | `textToSpeech.createEngine()` |
| 图片转文字 | CoreVisionKit | `textRecognition.recognizeText()` |
| 卡片开发 | FormKit | `FormExtensionAbility` |
| 图片选择 | MediaLibraryKit | `PhotoViewPicker` |
| 数据存储 | ArkData | `preferences` |
| 动画 | ArkUI | `animateTo()`, `transition()` |
| 手势 | ArkUI | `GestureGroup`, `PanGesture` |
| 网页组件 | ArkWeb | `Web`, `webview.WebviewController` |
| 图表 | ECharts (JS) | `echarts.init()`, `setOption()` |

---

## 常见问题

### Q1: 语音识别没有声音？
检查麦克风权限是否已授权，使用 `abilityAccessCtrl.checkAccessTokenSync()` 检查。

### Q2: TTS 朗读失败？
确保文本长度不超过 10000 字，且已过滤特殊符号。

### Q3: 卡片数据不更新？
检查 formId 是否正确保存，使用 `formProvider.updateForm()` 主动推送更新。

### Q4: 拖拽动画不流畅？
使用 `@Observed` + `@ObjectLink` 追踪单项状态，避免整个列表重渲染。

---

> 文档版本: 1.0  
> 更新日期: 2025-12-20


---

## 7. ArkWeb 网页组件

### 核心 Kit
```typescript
import { webview } from '@kit.ArkWeb';
```

### 7.1 基础使用

```typescript
@Entry
@Component
struct WebPage {
  // 创建 WebviewController 控制器
  private webController: webview.WebviewController = new webview.WebviewController();
  private isWebReady: boolean = false;

  aboutToAppear(): void {
    // 开启调试模式（开发时使用）
    try {
      webview.WebviewController.setWebDebuggingAccess(true);
    } catch (error) {
      console.error('Failed to set web debugging');
    }
  }

  build() {
    Column() {
      Web({ 
        src: $rawfile('report.html'),  // 加载本地 HTML
        controller: this.webController 
      })
        .width('100%')
        .height('100%')
        .javaScriptAccess(true)      // 启用 JavaScript
        .domStorageAccess(true)      // 启用 DOM 存储
        .fileAccess(true)            // 启用文件访问
        .onPageEnd(() => {
          // 页面加载完成回调
          this.isWebReady = true;
          this.initWebContent();
        })
    }
  }
}
```

### 7.2 ArkTS 调用 JavaScript

```typescript
// 方式1：直接执行 JS 代码
private initWebContent(): void {
  const data = { name: 'test', value: 100 };
  const dataJson = JSON.stringify(data);
  
  // 转义特殊字符，避免 JS 解析错误
  const escapedJson = dataJson
    .replace(/\\/g, '\\\\')
    .replace(/'/g, "\\'")
    .replace(/\n/g, '\\n')
    .replace(/\r/g, '\\r');
  
  // 调用 HTML 中定义的 JS 函数
  this.webController.runJavaScript(`initCharts('${escapedJson}')`);
}

// 方式2：带返回值的调用
private async getWebData(): Promise<string> {
  try {
    const result = await this.webController.runJavaScript('getData()');
    return result;
  } catch (error) {
    return '';
  }
}
```

### 7.3 JavaScript 调用 ArkTS

```typescript
// ArkTS 端注册方法
aboutToAppear(): void {
  // 注册供 JS 调用的方法
  this.webController.registerJavaScriptProxy({
    onButtonClick: (param: string) => {
      console.info('JS called: ' + param);
      // 处理来自 Web 的调用
    },
    getData: () => {
      return JSON.stringify({ status: 'ok' });
    }
  }, 'nativeApp', ['onButtonClick', 'getData']);
}

// HTML 端调用
// <script>
//   nativeApp.onButtonClick('hello');
//   var data = nativeApp.getData();
// </script>
```

### 7.4 加载不同来源的内容

```typescript
// 1. 加载本地 rawfile 资源
Web({ src: $rawfile('index.html'), controller: this.webController })

// 2. 加载网络 URL
Web({ src: 'https://example.com', controller: this.webController })

// 3. 加载 HTML 字符串
this.webController.loadData(
  '<html><body><h1>Hello</h1></body></html>',
  'text/html',
  'UTF-8',
  ''
);
```

### 7.5 常用配置属性

```typescript
Web({ src: $rawfile('index.html'), controller: this.webController })
  .javaScriptAccess(true)           // 启用 JavaScript
  .domStorageAccess(true)           // 启用 localStorage/sessionStorage
  .fileAccess(true)                 // 启用 file:// 协议
  .imageAccess(true)                // 启用图片加载
  .mixedMode(MixedMode.All)         // 允许 HTTPS 页面加载 HTTP 资源
  .cacheMode(CacheMode.Default)     // 缓存模式
  .textZoomRatio(100)               // 文字缩放比例
  .zoomAccess(true)                 // 允许缩放
  .overviewModeAccess(true)         // 概览模式
  .backgroundColor(Color.White)     // 背景色
```

---

## 8. ECharts 图表集成

### 8.1 项目结构

```
entry/src/main/resources/rawfile/
├── echarts.js          # ECharts 库文件（从官网下载）
└── study_report.html   # 图表页面
```

### 8.2 HTML 模板结构

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <title>学习报告</title>
  <!-- 引入 ECharts -->
  <script src="echarts.js"></script>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html, body { width: 100%; height: 100%; background: #F5F7FA; }
    .chart-box { width: 100%; height: 260px; }
  </style>
</head>
<body>
  <div class="container">
    <div class="chart-box" id="trendChart"></div>
    <div class="chart-box" id="pieChart"></div>
  </div>
  
  <script>
    var trendChart = null;
    var pieChart = null;

    // 供 ArkTS 调用的初始化函数
    function initCharts(dataJson) {
      try {
        var data = JSON.parse(dataJson);
        initTrendChart(data.weekTrend);
        initPieChart(data.subjectData);
      } catch (e) {
        console.error('initCharts error:', e);
      }
    }

    // 供 ArkTS 调用的更新函数
    function updateCharts(dataJson) {
      initCharts(dataJson);
    }
  </script>
</body>
</html>
```

### 8.3 柱状图实现

```javascript
function initTrendChart(weekTrend) {
  var dom = document.getElementById('trendChart');
  if (!dom) return;
  
  trendChart = echarts.init(dom);
  
  // 处理数据
  var dates = weekTrend.map(function(d) { return d.date.substring(5); });
  var totals = weekTrend.map(function(d) { return d.totalCount; });
  var corrects = weekTrend.map(function(d) { return d.correctCount; });

  trendChart.setOption({
    tooltip: { trigger: 'axis' },
    legend: { data: ['做题数', '正确数'], bottom: 0 },
    grid: { left: 10, right: 10, top: 20, bottom: 40, containLabel: true },
    xAxis: { 
      type: 'category', 
      data: dates,
      axisLine: { lineStyle: { color: '#e8e8e8' } },
      axisLabel: { color: '#999' }
    },
    yAxis: { 
      type: 'value', 
      minInterval: 1,
      axisLine: { show: false },
      splitLine: { lineStyle: { color: '#f0f0f0', type: 'dashed' } }
    },
    series: [
      { 
        name: '做题数', 
        type: 'bar', 
        data: totals,
        itemStyle: { color: '#1890FF', borderRadius: [4, 4, 0, 0] },
        barWidth: 16
      },
      { 
        name: '正确数', 
        type: 'bar', 
        data: corrects,
        itemStyle: { color: '#52C41A', borderRadius: [4, 4, 0, 0] },
        barWidth: 16
      }
    ]
  });
}
```

### 8.4 饼图/环形图实现

```javascript
function initPieChart(subjectData) {
  var dom = document.getElementById('pieChart');
  if (!dom) return;
  
  pieChart = echarts.init(dom);
  
  // 颜色映射
  var COLORS = {
    '001': '#1677FF', '002': '#389E0D', '003': '#D46B08',
    '004': '#C41D7F', '005': '#531DAB', '006': '#006D75'
  };
  var NAMES = {
    '001': '基础知识', '002': '混凝土', '003': '岩土',
    '004': '地基', '005': '量测', '006': '金属结构'
  };
  
  // 处理数据
  var pieData = subjectData
    .filter(function(s) { return s.totalCount > 0; })
    .map(function(s) {
      return { 
        value: s.totalCount, 
        name: NAMES[s.subjectId] || s.subjectId,
        itemStyle: { color: COLORS[s.subjectId] }
      };
    });

  pieChart.setOption({
    tooltip: { 
      trigger: 'item', 
      formatter: '{b}: {c}题 ({d}%)' 
    },
    series: [{
      type: 'pie',
      radius: ['40%', '65%'],  // 环形图：内外半径
      center: ['50%', '50%'],
      itemStyle: { 
        borderRadius: 6, 
        borderColor: '#fff', 
        borderWidth: 2 
      },
      label: { 
        show: true, 
        formatter: '{b}\n{d}%', 
        fontSize: 11 
      },
      data: pieData
    }]
  });
}
```

### 8.5 响应式处理

```javascript
// 监听窗口大小变化，自动调整图表
window.addEventListener('resize', function() {
  if (trendChart) trendChart.resize();
  if (pieChart) pieChart.resize();
});
```

### 8.6 ArkTS 端完整示例

```typescript
import { webview } from '@kit.ArkWeb';

// 数据接口定义
export interface StudyReportData {
  totalQuestions: number;
  completedQuestions: number;
  overallAccuracy: number;
  weekTrend: DailyStudyData[];
  subjectData: SubjectStudyData[];
}

@Entry
@Component
struct StudyReportPage {
  @State isLoading: boolean = true;
  @State reportData: StudyReportData | null = null;
  
  private webController: webview.WebviewController = new webview.WebviewController();
  private isWebReady: boolean = false;

  aboutToAppear(): void {
    this.loadData();
  }

  private async loadData(): Promise<void> {
    try {
      this.reportData = await studyReportService.getReportData();
      if (this.isWebReady) {
        this.initCharts();
      }
    } finally {
      this.isLoading = false;
    }
  }

  private initCharts(): void {
    if (!this.reportData) return;
    
    const dataJson = JSON.stringify(this.reportData);
    const escapedJson = dataJson
      .replace(/\\/g, '\\\\')
      .replace(/'/g, "\\'")
      .replace(/\n/g, '\\n')
      .replace(/\r/g, '\\r');
    
    this.webController.runJavaScript(`initCharts('${escapedJson}')`);
  }

  build() {
    Stack() {
      Web({ src: $rawfile('study_report.html'), controller: this.webController })
        .width('100%')
        .height('100%')
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onPageEnd(() => {
          this.isWebReady = true;
          if (this.reportData) {
            this.initCharts();
          }
        })

      if (this.isLoading) {
        LoadingProgress().width(40).height(40)
      }
    }
  }
}
```

### 8.7 常用图表类型速查

| 图表类型 | type 值 | 适用场景 |
|----------|---------|----------|
| 柱状图 | `bar` | 数量对比、趋势 |
| 折线图 | `line` | 趋势变化 |
| 饼图 | `pie` | 占比分布 |
| 环形图 | `pie` + radius | 占比分布（带中心空白） |
| 雷达图 | `radar` | 多维度对比 |
| 仪表盘 | `gauge` | 进度、完成率 |

---

## 9. ArkTS 常见错误与解决方案

> 本节整理了 HarmonyOS ArkTS 开发中常见的编译错误及其解决方案，帮助快速定位和修复问题。

### 9.1 arkts-limited-throw - throw 语句类型限制

**错误信息**: `"throw" statements cannot accept values of arbitrary types`

**原因**: ArkTS 要求 `throw` 语句只能抛出 `Error` 类型的对象。

```typescript
// ❌ 错误写法
throw 'Database not initialized';
throw error;  // error 是 unknown 类型

// ✅ 正确写法
throw new Error('Database not initialized');
throw new Error(`Operation failed: ${(error as Error).message}`);
```

---

### 9.2 arkts-no-utility-types - 不支持工具类型

**错误信息**: `Some of utility types are not supported`

**原因**: ArkTS 不支持 TypeScript 的 utility types，如 `Omit<T, K>`、`Pick<T, K>`、`Partial<T>` 等。

```typescript
// ❌ 错误写法
async saveRecord(record: Omit<AnswerRecord, 'id'>): Promise<string>

// ✅ 正确写法 - 定义独立的接口
export interface AnswerRecordInput {
  questionId: string;
  userAnswer: string;
  isCorrect: boolean;
  answerTime: number;
  createTime: number;
}

async saveRecord(record: AnswerRecordInput): Promise<string>
```

---

### 9.3 arkts-no-obj-literals-as-types - 对象字面量不能作为类型

**错误信息**: `Object literals cannot be used as type declarations`

**原因**: ArkTS 不允许在函数参数中直接使用对象字面量作为类型声明。

```typescript
// ❌ 错误写法
async saveExamRecord(record: {
  examType: string;
  totalCount: number;
}): Promise<string>

// ✅ 正确写法 - 定义独立的接口
export interface ExamRecordInput {
  examType: string;
  totalCount: number;
}

async saveExamRecord(record: ExamRecordInput): Promise<string>
```

---

### 9.4 arkts-no-untyped-obj-literals - 对象字面量必须有类型

**错误信息**: `Object literal must correspond to some explicitly declared class or interface`

**原因**: ArkTS 要求对象字面量必须对应明确声明的类或接口。

```typescript
// ❌ 错误写法
await service.saveRecord({
  questionId: question.id,
  userAnswer: userAnswer,
  isCorrect: isCorrect
});

// ✅ 正确写法 - 先创建类型化的对象
const recordInput: AnswerRecordInput = {
  questionId: question.id,
  userAnswer: userAnswer,
  isCorrect: isCorrect
};
await service.saveRecord(recordInput);
```

---

### 9.5 arkts-no-structural-typing - 不支持结构化类型

**错误信息**: `Structural typing is not supported`

**原因**: ArkTS 不支持结构化类型，两个具有相同结构但不同名称的类型不能互相赋值。

```typescript
// ❌ 错误写法 - 在不同文件中定义相同结构的接口
// MainTabPage.ets
interface TodayStats { total: number; correct: number; }
@State todayStats: TodayStats = { total: 0, correct: 0 };

// AnswerRecordService.ets
export interface TodayStatistics { total: number; correct: number; }

// 赋值时会报错
this.todayStats = await service.getTodayStatistics();  // 类型不匹配！

// ✅ 正确写法 - 导入并使用相同的类型
import { TodayStatistics } from '../services/AnswerRecordService';
@State todayStats: TodayStatistics = { total: 0, correct: 0 };
```

---

### 9.6 @Builder 中不能使用变量声明

**错误信息**: `Only UI component syntax can be written here`

**原因**: `@Builder` 装饰器内部只能包含 UI 组件语法，不能使用变量声明。

```typescript
// ❌ 错误写法
@Builder
WeekDayItem(label: string, dayIndex: number) {
  const isToday = dayIndex === this.getTodayWeekDay();  // 错误！
  Column() {
    Text(isToday ? '✓' : label)
  }
}

// ✅ 正确写法 - 将逻辑抽取到独立方法
private isToday(dayIndex: number): boolean {
  return dayIndex === this.getTodayWeekDay();
}

@Builder
WeekDayItem(label: string, dayIndex: number) {
  Column() {
    Text(this.isToday(dayIndex) ? '✓' : label)
  }
}
```

---

### 9.7 Resource Pack Error - 资源目录结构错误

**错误信息**: `Failed to scan resources: invalid path '...', not a file`

**原因**: `resources/base/profile` 目录只能存放 JSON5 配置文件。

```
// ❌ 错误结构
resources/base/profile/
├── main_pages.json       ✅
└── htmlFolder/           ❌ 不能放文件夹
    └── code.html

// ✅ 正确结构
resources/base/profile/
├── main_pages.json       ✅ 只放 JSON5 配置文件
└── backup_config.json    ✅

planningDoc/              // 参考文件放这里
└── reference/
    └── code.html
```

---

### 9.8 文件结构损坏 - 孤立代码块

**错误信息**: `';' expected`、`Cannot find name 'type'`

**原因**: 函数已正确结束，但后面出现了孤立的代码块。

```typescript
// ❌ 错误结构
export function getQuestions(): Question[] {
  return [
    { id: 'q_001', type: QuestionType.SINGLE, ... },
  ];
}
    // 孤立代码 - 不在任何函数内！
    {
      id: 'q_002',
      type: QuestionType.SINGLE,  // 报错！
    }
  ];
}

// ✅ 正确结构
export function getQuestions(): Question[] {
  return [
    { id: 'q_001', type: QuestionType.SINGLE, ... },
    { id: 'q_002', type: QuestionType.SINGLE, ... }  // 在数组内
  ];
}
```

**诊断方法**: 查看错误行号，检查函数的 `];` 和 `}` 是否提前出现。

---

### 9.9 题目ID重复导致数据异常

**问题现象**: 题库分类页面显示某些科目题目数量为0

**原因**: 数据库使用题目ID作为主键，重复ID导致插入失败。

```typescript
// ❌ 错误 - ID重复
// MockQuestionData.ets
function getMetalQuestions() {
  return [{ id: 'metal_001', ... }];  // ID: metal_001
}

// MetalQuestionsData.ets
export function getMetalQuestions1() {
  return [{ id: 'metal_001', ... }];  // ID重复！
}

// ✅ 正确 - 使用不同的ID
// 方案1：删除重复的基础函数
// 方案2：使用不同的ID前缀
{ id: 'metal_base_001', ... }  // 基础数据
{ id: 'metal_ext_001', ... }   // 扩展数据
```

**诊断方法**:
```bash
grep -r "id: 'metal_001'" entry/src/main/ets/data/
```

---

## 10. ArkTS 最佳实践

### 10.1 接口定义规范

```typescript
// 输入参数接口
export interface AnswerRecordInput {
  questionId: string;
  userAnswer: string;
  isCorrect: boolean;
  answerTime: number;
  createTime: number;
}

// 返回结果接口
export interface TodayStatistics {
  total: number;
  correct: number;
  accuracy: number;
}
```

### 10.2 错误处理规范

```typescript
try {
  // 业务逻辑
} catch (error) {
  Logger.error('[Service] Operation failed', error as Error);
  throw new Error('Operation failed: specific reason');
}
```

### 10.3 对象创建规范

```typescript
// ✅ 推荐写法
const result: TodayStatistics = {
  total: 0,
  correct: 0,
  accuracy: 0
};
return result;

// ❌ 不推荐写法
return { total: 0, correct: 0, accuracy: 0 };
```

### 10.4 大文件管理规范

```typescript
// ✅ 推荐：按模块拆分数据文件
// ConcreteQuestionsData1.ets - 混凝土基础题目
// ConcreteQuestionsData2.ets - 混凝土进阶题目
// ConcreteQuestionsData3.ets - 混凝土综合题目

// 主文件中导入合并
import { getConcreteQuestions1 } from './ConcreteQuestionsData1';
import { getConcreteQuestions2 } from './ConcreteQuestionsData2';

questions.push(...getConcreteQuestions1(now));
questions.push(...getConcreteQuestions2(now));
```

### 10.5 ID命名规范

```typescript
// 推荐格式：{科目缩写}_{文件编号}_{序号}
{ id: 'concrete_1_001', ... }  // 混凝土第1个文件第1题
{ id: 'concrete_1_002', ... }  // 混凝土第1个文件第2题
{ id: 'concrete_2_001', ... }  // 混凝土第2个文件第1题
{ id: 'metal_1_001', ... }     // 金属结构第1个文件第1题
```

---

## 错误速查表

| 错误码 | 错误类型 | 快速解决 |
|--------|----------|----------|
| arkts-limited-throw | throw 类型限制 | 使用 `throw new Error()` |
| arkts-no-utility-types | 不支持工具类型 | 定义独立接口替代 |
| arkts-no-obj-literals-as-types | 对象字面量类型 | 定义独立接口 |
| arkts-no-untyped-obj-literals | 无类型对象 | 先声明类型再创建对象 |
| arkts-no-structural-typing | 结构化类型 | 导入使用相同类型定义 |
| 10905209 | @Builder 变量声明 | 抽取到独立方法 |
| 11211101 | 资源目录错误 | profile 只放 JSON5 |

---

## 参考资料

- [ArkTS 语言规范](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-overview-0000001774279614-V3)
- [ArkTS 与 TypeScript 差异](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/typescript-to-arkts-migration-guide-0000001774119994-V3)
- [HarmonyOS 开发者文档](https://developer.harmonyos.com/)

---

---

## 9. 高德地图 SDK 开发

> 本节整理了 HarmonyOS 高德地图 SDK 的核心功能和使用方法，涵盖地图显示、标记、定位、搜索、路线规划等完整功能。

### 9.1 SDK 模块与安装

#### 模块组成

| 模块 | 包名 | 功能 |
|------|------|------|
| 地图SDK | `@amap/amap_lbs_map3d` | 地图显示、标记、覆盖物等 |
| 搜索SDK | `@amap/amap_lbs_search` | POI搜索、路线规划、地理编码等 |
| 定位SDK | `@amap/amap_lbs_location` | 高精度定位（可选） |
| 公共模块 | `@amap/amap_lbs_common` | 隐私政策、公共类型定义 |

#### 安装配置

```json5
// oh-package.json5
{
  "dependencies": {
    "@amap/amap_lbs_map3d": "^2.1.0",
    "@amap/amap_lbs_search": "^1.0.8",
    "@amap/amap_lbs_common": "^1.0.3"
  }
}
```

---

### 9.2 隐私政策与初始化（必须）

```typescript
import { MapsInitializer } from '@amap/amap_lbs_map3d';
import { ServiceSettings } from '@amap/amap_lbs_search';
import { AMapPrivacyShowStatus, AMapPrivacyInfoStatus, AMapPrivacyAgreeStatus } from '@amap/amap_lbs_common';

// 在 EntryAbility.onCreate() 中调用
private initAMapSDK(): void {
  // 1. 设置隐私政策（必须在初始化之前）
  MapsInitializer.updatePrivacyShow(AMapPrivacyShowStatus.DidShow, AMapPrivacyInfoStatus.DidContain);
  MapsInitializer.updatePrivacyAgree(AMapPrivacyAgreeStatus.DidAgree);
  
  ServiceSettings.updatePrivacyShow(AMapPrivacyShowStatus.DidShow, AMapPrivacyInfoStatus.DidContain, this.context);
  ServiceSettings.updatePrivacyAgree(AMapPrivacyAgreeStatus.DidAgree, this.context);
  
  // 2. 设置 API Key
  MapsInitializer.setApiKey("你的API_Key");
}
```

---

### 9.3 显示地图

```typescript
import { AMap, MapView, MapViewComponent, MapViewManager, MapViewCreateCallback, CameraUpdateFactory, LatLng } from '@amap/amap_lbs_map3d';

const MAP_VIEW_NAME = 'MyMap';

@Entry
@Component
struct MapPage {
  private mapView: MapView | undefined;
  private aMap: AMap | undefined;

  private mapViewCreateCallback: MapViewCreateCallback = (mapview, mapViewName) => {
    if (!mapview || mapViewName !== MAP_VIEW_NAME) return;
    
    this.mapView = mapview;
    this.mapView.onCreate();  // 必须调用
    
    this.mapView.getMapAsync((map: AMap) => {
      this.aMap = map;
      // 移动到指定位置
      const center = new LatLng(39.909187, 116.397451);
      map.moveCamera(CameraUpdateFactory.newLatLngZoom(center, 15));
    });
  };

  aboutToAppear(): void {
    MapViewManager.getInstance().registerMapViewCreatedCallback(this.mapViewCreateCallback);
  }

  aboutToDisappear(): void {
    MapViewManager.getInstance().unregisterMapViewCreatedCallback(this.mapViewCreateCallback);
    this.mapView?.onDestroy();  // 必须调用
  }

  build() {
    MapViewComponent({ mapViewName: MAP_VIEW_NAME })
      .width('100%')
      .height('100%')
  }
}
```

---

### 9.4 地图类型与UI控件

```typescript
import { MapType, UiSettings } from '@amap/amap_lbs_map3d';

// 切换地图类型
aMap.setMapType(MapType.MAP_TYPE_NORMAL);     // 标准地图
aMap.setMapType(MapType.MAP_TYPE_SATELLITE);  // 卫星地图
aMap.setMapType(MapType.MAP_TYPE_NIGHT);      // 夜间地图

// UI控件设置
const uiSettings: UiSettings = aMap.getUiSettings();
uiSettings.setZoomControlsEnabled(true);      // 缩放按钮
uiSettings.setCompassEnabled(true);           // 指南针
uiSettings.setScaleControlsEnabled(true);     // 比例尺
uiSettings.setZoomGesturesEnabled(true);      // 缩放手势
uiSettings.setRotateGesturesEnabled(true);    // 旋转手势
```

---

### 9.5 地图标记 Marker

```typescript
import { Marker, MarkerOptions, BitmapDescriptorFactory } from '@amap/amap_lbs_map3d';

// 添加默认标记
const options = new MarkerOptions();
options.setPosition(new LatLng(39.909187, 116.397451));
options.setTitle('天安门');
options.setSnippet('北京市中心');
options.setDraggable(true);  // 可拖拽
const marker = aMap.addMarker(options);

// 添加彩色标记（必须使用异步方法）
const icon = await BitmapDescriptorFactory.defaultMarkerASync(context, BitmapDescriptorFactory.HUE_GREEN);
options.setIcon(icon);

// 自定义View标记
const customIcon = await BitmapDescriptorFactory.fromView(() => {
  this.CustomMarkerBuilder();  // @Builder 方法
});
options.setIcon(customIcon);

// 标记点击事件
aMap.setOnMarkerClickListener((marker: Marker): boolean => {
  marker.showInfoWindow();
  return true;
});
```

---

### 9.6 定位蓝点

```typescript
import { MyLocationStyle, OnLocationChangedListener } from '@amap/amap_lbs_map3d';
import { geoLocationManager } from '@kit.LocationKit';

// 配置定位样式
const locationStyle = new MyLocationStyle();
locationStyle.myLocationType(MyLocationStyle.LOCATION_TYPE_LOCATE);  // 定位一次
locationStyle.strokeColor(0x800000FF);   // 精度圈边框
locationStyle.radiusFillColor(0x200000FF);  // 精度圈填充

aMap.setMyLocationStyle(locationStyle);
aMap.setLocationSource(this);  // 实现 LocationSource 接口
aMap.setMyLocationEnabled(true);

// LocationSource 接口实现
activate(listener: OnLocationChangedListener): void {
  geoLocationManager.getCurrentLocation({
    priority: geoLocationManager.LocationRequestPriority.FIRST_FIX
  }).then((location) => {
    listener.onLocationChanged(location);
  });
}

deactivate(): void {
  // 停止定位
}
```

**定位模式**:
| 模式 | 说明 |
|------|------|
| `LOCATION_TYPE_SHOW` | 只显示位置 |
| `LOCATION_TYPE_LOCATE` | 定位一次并移动 |
| `LOCATION_TYPE_FOLLOW` | 持续跟随 |
| `LOCATION_TYPE_MAP_ROTATE` | 地图随方向旋转 |

---

### 9.7 POI 搜索

```typescript
import { PoiSearch, PoiQuery, PoiResult, PoiItem, OnPoiSearchListener, PoiSearchBound, LatLonPoint } from '@amap/amap_lbs_search';

// 初始化
const poiSearch = new PoiSearch(context, undefined);
poiSearch.setOnPoiSearchListener({
  onPoiSearched: (result: PoiResult | undefined, errorCode: number) => {
    if (errorCode === 1000 && result) {
      const pois = result.getPois();
      pois?.forEach((poi: PoiItem) => {
        console.log(poi.getTitle(), poi.getSnippet(), poi.getDistance());
      });
    }
  },
  onPoiItemSearched: () => {}
});

// 关键字搜索
const query = new PoiQuery('餐厅', '', '北京');
query.setPageSize(20);
poiSearch.setQuery(query);
poiSearch.searchPOIAsyn();

// 周边搜索
const centerPoint = new LatLonPoint(39.909187, 116.397451);
const bound = PoiSearchBound.createCircleSearchBound(centerPoint, 3000);  // 3公里
poiSearch.setBound(bound);
poiSearch.searchPOIAsyn();
```

---

### 9.8 地理编码与逆地理编码

```typescript
import { GeocodeSearch, GeocodeQuery, ReGeocodeQuery, LatLonPoint } from '@amap/amap_lbs_search';

const geocodeSearch = new GeocodeSearch(context);
geocodeSearch.setOnGeocodeSearchListener({
  // 地址 → 坐标
  onGeocodeSearched: (result, errorCode) => {
    const address = result?.getGeocodeAddressList()?.[0];
    const point = address?.getLatLonPoint();
    console.log(point?.getLatitude(), point?.getLongitude());
  },
  // 坐标 → 地址
  onReGeocodeSearched: (result, errorCode) => {
    const address = result?.getReGeocodeAddress();
    console.log(address?.getFormatAddress());
  }
});

// 地理编码
const geoQuery = new GeocodeQuery('北京市天安门', '北京');
geocodeSearch.getFromLocationNameAsyn(geoQuery);

// 逆地理编码
const point = new LatLonPoint(39.909187, 116.397451);
const reGeoQuery = new ReGeocodeQuery(point, 200, 'base');
geocodeSearch.getFromLocationAsyn(reGeoQuery);
```

---

### 9.9 路线规划

```typescript
import { RouteSearch, DriveRouteQuery, WalkRouteQuery, FromAndTo, LatLonPoint, DrivePath } from '@amap/amap_lbs_search';

const routeSearch = new RouteSearch(context);
routeSearch.setRouteSearchListener({
  onDriveRouteSearched: (result, errorCode) => {
    const path = result?.getPaths()?.[0] as DrivePath;
    console.log('距离:', path?.getDistance(), '时间:', path?.getDuration());
    
    // 绘制路线
    const steps = path?.getSteps();
    steps?.forEach(step => {
      const polyline = step.getPolyline();  // 坐标点数组
    });
  },
  onWalkRouteSearched: (result, errorCode) => { /* 步行路线 */ },
  onBusRouteSearched: () => {},
  onRideRouteSearched: () => {}
});

// 驾车路线
const fromAndTo = new FromAndTo(
  new LatLonPoint(39.942295, 116.335891),  // 起点
  new LatLonPoint(39.995576, 116.481288)   // 终点
);
const driveQuery = new DriveRouteQuery(fromAndTo, RouteSearch.DrivingDefault, undefined, undefined, '');
routeSearch.calculateDriveRouteAsyn(driveQuery);

// 步行路线
const walkQuery = new WalkRouteQuery(fromAndTo);
routeSearch.calculateWalkRouteAsyn(walkQuery);
```

**驾车策略**:
| 策略 | 说明 |
|------|------|
| `DrivingDefault` | 速度优先 |
| `DrivingNoHighway` | 不走高速 |
| `DrivingNoFare` | 避免收费 |
| `DrivingShortest` | 距离最短 |

---

### 9.10 绘图与测距

```typescript
import { Polyline, PolylineOptions, Polygon, PolygonOptions, Circle, CircleOptions, AMapUtils } from '@amap/amap_lbs_map3d';

// 绘制折线
const polylineOptions = new PolylineOptions();
polylineOptions.setPoints([point1, point2, point3]);
polylineOptions.setWidth(8);
polylineOptions.setColor(0xFF2196F3);
const polyline = aMap.addPolyline(polylineOptions);

// 绘制多边形
const polygonOptions = new PolygonOptions();
polygonOptions.setPoints([point1, point2, point3]);
polygonOptions.setStrokeWidth(5);
polygonOptions.setStrokeColor(0xFF4CAF50);
polygonOptions.setFillColor(0x304CAF50);
const polygon = aMap.addPolygon(polygonOptions);

// 绘制圆形
const circleOptions = new CircleOptions();
circleOptions.setCenter(center);
circleOptions.setRadius(1000);  // 米
circleOptions.setStrokeColor(0xFFFF9800);
circleOptions.setFillColor(0x30FF9800);
const circle = aMap.addCircle(circleOptions);

// 测距与面积计算
const distance = AMapUtils.calculateLineDistance(point1, point2);  // 两点距离（米）
const area = AMapUtils.calculateArea(points);  // 多边形面积（平方米）
```

---

### 9.11 地图事件监听

```typescript
// 地图点击
aMap.setOnMapClickListener((point: LatLng) => {
  console.log('点击:', point.latitude, point.longitude);
});

// 地图长按
aMap.setOnMapLongClickListener((point: LatLng) => {
  console.log('长按:', point.latitude, point.longitude);
});

// 相机变化
aMap.setOnCameraChangeListener(new OnCameraChangeListener(
  (position) => { /* 移动中 */ },
  (position) => { /* 移动结束 */ }
));

// POI点击
aMap.addOnPOIClickListener((poi: Poi) => {
  console.log('POI:', poi.getName(), poi.getPoiId());
});
```

---

### 9.12 权限配置

```json5
// module.json5
{
  "requestPermissions": [
    {
      "name": "ohos.permission.INTERNET",
      "reason": "$string:permission_internet_reason",
      "usedScene": { "abilities": ["EntryAbility"], "when": "always" }
    },
    {
      "name": "ohos.permission.LOCATION",
      "reason": "$string:permission_location_reason",
      "usedScene": { "abilities": ["EntryAbility"], "when": "inuse" }
    },
    {
      "name": "ohos.permission.APPROXIMATELY_LOCATION",
      "reason": "$string:permission_location_reason",
      "usedScene": { "abilities": ["EntryAbility"], "when": "inuse" }
    }
  ]
}
```

---

### 9.13 高德地图 API 速查表

| 功能 | 核心类 | 关键方法 |
|------|--------|----------|
| 地图显示 | `MapViewComponent` | `getMapAsync()` |
| 地图控制 | `AMap` | `moveCamera()`, `animateCamera()` |
| 标记 | `MarkerOptions` | `addMarker()`, `setIcon()` |
| 定位 | `MyLocationStyle` | `setMyLocationEnabled()` |
| POI搜索 | `PoiSearch` | `searchPOIAsyn()` |
| 地理编码 | `GeocodeSearch` | `getFromLocationNameAsyn()` |
| 逆地理编码 | `GeocodeSearch` | `getFromLocationAsyn()` |
| 路线规划 | `RouteSearch` | `calculateDriveRouteAsyn()` |
| 折线 | `PolylineOptions` | `addPolyline()` |
| 多边形 | `PolygonOptions` | `addPolygon()` |
| 圆形 | `CircleOptions` | `addCircle()` |
| 测距 | `AMapUtils` | `calculateLineDistance()` |
| 面积 | `AMapUtils` | `calculateArea()` |

---

> 文档版本: 1.2  
> 更新日期: 2025-12-20  
> 整理自 HydroQuiz 项目开发实践 + 高德地图 HarmonyOS SDK 教程

---

## 10. 华为原生地图 (Map Kit) 开发

> 本节整理了 HarmonyOS 原生 Map Kit 的核心功能，无需第三方 SDK，直接使用系统能力实现地图功能。

### 10.1 核心模块与导入

```typescript
// 地图核心模块
import { map, mapCommon, MapComponent } from '@kit.MapKit';

// 搜索服务
import { site } from '@kit.MapKit';

// 导航服务
import { navi } from '@kit.MapKit';

// 定位服务
import { geoLocationManager } from '@kit.LocationKit';
```

**Map Kit 优势**：
- 无需申请第三方 API Key
- 系统级集成，性能更优
- 与 HarmonyOS 深度整合

---

### 10.2 显示地图

```typescript
import { map, mapCommon, MapComponent } from '@kit.MapKit';
import { AsyncCallback } from '@kit.BasicServicesKit';

@Entry
@Component
struct BasicMap {
  private mapOptions?: mapCommon.MapOptions;
  private callback?: AsyncCallback<map.MapComponentController>;
  private mapController?: map.MapComponentController;
  private mapEventManager?: map.MapEventManager;

  @State isMapReady: boolean = false;

  aboutToAppear(): void {
    // 地图初始化参数
    this.mapOptions = {
      position: {
        target: { latitude: 39.909187, longitude: 116.397451 },
        zoom: 15
      }
    };

    // 地图初始化回调
    this.callback = async (err, mapController) => {
      if (!err) {
        this.mapController = mapController;
        this.mapEventManager = mapController.getEventManager();
        this.isMapReady = true;

        // 监听地图加载完成
        this.mapEventManager.on("mapLoad", () => {
          console.info('Map loaded');
        });
      }
    };
  }

  // 页面显示时将地图切换到前台
  onPageShow(): void {
    this.mapController?.show();
  }

  // 页面隐藏时将地图切换到后台
  onPageHide(): void {
    this.mapController?.hide();
  }

  build() {
    MapComponent({ mapOptions: this.mapOptions, mapCallback: this.callback })
      .width('100%')
      .height('100%')
  }
}
```

---

### 10.3 地图类型与日夜模式

```typescript
// 地图类型
this.mapController.setMapType(mapCommon.MapType.STANDARD);  // 标准地图
this.mapController.setMapType(mapCommon.MapType.TERRAIN);   // 地形地图
this.mapController.setMapType(mapCommon.MapType.NONE);      // 空白地图

// 日夜模式
this.mapController.setDayNightMode(mapCommon.DayNightMode.DAY);    // 日间模式
this.mapController.setDayNightMode(mapCommon.DayNightMode.NIGHT);  // 夜间模式
```

---

### 10.4 UI控件与手势控制

```typescript
// UI控件
this.mapController.setZoomControlsEnabled(true);      // 缩放按钮
this.mapController.setCompassControlsEnabled(true);   // 指南针
this.mapController.setScaleControlsEnabled(true);     // 比例尺

// 手势控制
this.mapController.setZoomGesturesEnabled(true);      // 缩放手势
this.mapController.setRotateGesturesEnabled(true);    // 旋转手势
this.mapController.setScrollGesturesEnabled(true);    // 滑动手势
```

---

### 10.5 相机控制

```typescript
// 移动到指定位置
const position: mapCommon.LatLng = { latitude: 39.909187, longitude: 116.397451 };
const cameraUpdate: map.CameraUpdate = map.newLatLng(position, 15);  // 位置 + 缩放级别

// 直接移动
this.mapController.moveCamera(cameraUpdate);

// 动画移动
this.mapController.animateCamera(cameraUpdate, 1000);  // 1秒动画

// 获取当前相机位置
const cameraPosition = this.mapController.getCameraPosition();
console.log('中心点:', cameraPosition.target);
console.log('缩放级别:', cameraPosition.zoom);
console.log('旋转角度:', cameraPosition.bearing);
console.log('倾斜角度:', cameraPosition.tilt);
```

---

### 10.6 地图事件监听

```typescript
const eventManager = this.mapController.getEventManager();

// 地图点击
eventManager.on("mapClick", (position: mapCommon.LatLng) => {
  console.log('点击:', position.latitude, position.longitude);
});

// 地图长按
eventManager.on("mapLongClick", (position: mapCommon.LatLng) => {
  console.log('长按:', position.latitude, position.longitude);
});

// 相机变化
eventManager.on("cameraChange", () => {
  const pos = this.mapController.getCameraPosition();
  console.log('相机变化:', pos.zoom);
});

// 地图加载完成
eventManager.on("mapLoad", () => {
  console.log('地图加载完成');
});

// 标记点击
eventManager.on("markerClick", (marker: map.Marker) => {
  console.log('标记点击:', marker.getTitle());
  marker.setInfoWindowVisible(true);
});
```

---

### 10.7 添加标记 Marker

```typescript
// 添加标记
const markerOptions: mapCommon.MarkerOptions = {
  position: { latitude: 39.909187, longitude: 116.397451 },
  title: '天安门',
  snippet: '北京市中心',
  clickable: true,
  icon: 'marker_red.svg'  // rawfile 中的图标
};

const marker = await this.mapController.addMarker(markerOptions);

// 标记操作
marker.setTitle('新标题');
marker.setPosition({ latitude: 39.92, longitude: 116.40 });
marker.setClickable(true);
marker.setInfoWindowVisible(true);  // 显示信息窗口
marker.remove();  // 移除标记
```

---

### 10.8 绘制覆盖物

```typescript
// 绘制折线
const polyline = await this.mapController.addPolyline({
  points: [
    { latitude: 39.909, longitude: 116.397 },
    { latitude: 39.915, longitude: 116.404 },
    { latitude: 39.920, longitude: 116.410 }
  ],
  width: 8,
  color: 0xFF2196F3,  // ARGB 蓝色
  clickable: false
});

// 绘制多边形
const polygon = await this.mapController.addPolygon({
  points: [
    { latitude: 39.909, longitude: 116.397 },
    { latitude: 39.915, longitude: 116.404 },
    { latitude: 39.920, longitude: 116.390 }
  ],
  strokeWidth: 6,
  strokeColor: 0xFF4CAF50,   // 绿色边框
  fillColor: 0x304CAF50      // 半透明绿色填充
});

// 绘制圆形
const circle = await this.mapController.addCircle({
  center: { latitude: 39.909187, longitude: 116.397451 },
  radius: 1000,  // 米
  strokeWidth: 6,
  strokeColor: 0xFFFF9800,
  fillColor: 0x30FF9800
});

// 移除覆盖物
polyline.remove();
polygon.remove();
circle.remove();
```

---

### 10.9 POI 搜索 (site)

```typescript
import { site } from '@kit.MapKit';

// 周边搜索
const params: site.NearbySearchParams = {
  location: { latitude: 39.909187, longitude: 116.397451 },
  radius: 5000,        // 搜索半径（米）
  query: '餐厅',       // 搜索关键词
  pageSize: 10,
  pageIndex: 1,
  language: 'zh'
};

const result = await site.nearbySearch(params);
if (result && result.sites) {
  result.sites.forEach((s: site.Site) => {
    console.log('名称:', s.name);
    console.log('地址:', s.formatAddress);
    console.log('坐标:', s.location);
  });
}
```

---

### 10.10 路线规划 (navi)

```typescript
import { navi } from '@kit.MapKit';

// 驾车路线
const driveParams: navi.DrivingRouteParams = {
  origins: [{ latitude: 39.909187, longitude: 116.397451 }],
  destination: { latitude: 39.999614, longitude: 116.326478 },
  language: 'zh_CN'
};
const driveResult = await navi.getDrivingRoutes(driveParams);

// 步行路线
const walkParams: navi.RouteParams = {
  origins: [{ latitude: 39.909187, longitude: 116.397451 }],
  destination: { latitude: 39.999614, longitude: 116.326478 },
  language: 'zh_CN'
};
const walkResult = await navi.getWalkingRoutes(walkParams);

// 骑行路线
const bikeResult = await navi.getCyclingRoutes(walkParams);

// 处理结果
if (driveResult && driveResult.routes && driveResult.routes.length > 0) {
  const route = driveResult.routes[0];
  console.log('路线信息:', route);
}
```

---

### 10.11 定位功能

```typescript
import { geoLocationManager } from '@kit.LocationKit';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';

// 请求权限
const permissions: Permissions[] = [
  'ohos.permission.APPROXIMATELY_LOCATION',
  'ohos.permission.LOCATION'
];
const atManager = abilityAccessCtrl.createAtManager();
const result = await atManager.requestPermissionsFromUser(context, permissions);

// 获取当前位置
const request: geoLocationManager.CurrentLocationRequest = {
  priority: geoLocationManager.LocationRequestPriority.FIRST_FIX,
  scenario: geoLocationManager.LocationRequestScenario.UNSET,
  maxAccuracy: 100
};

const location = await geoLocationManager.getCurrentLocation(request);
console.log('经度:', location.longitude);
console.log('纬度:', location.latitude);
console.log('精度:', location.accuracy);
```

---

### 10.12 距离计算

```typescript
// 计算两点间距离（米）
function calculateDistance(p1: mapCommon.LatLng, p2: mapCommon.LatLng): number {
  const R = 6371000;  // 地球半径（米）
  const dLat = (p2.latitude - p1.latitude) * Math.PI / 180;
  const dLon = (p2.longitude - p1.longitude) * Math.PI / 180;
  const a = Math.sin(dLat / 2) ** 2 +
            Math.cos(p1.latitude * Math.PI / 180) *
            Math.cos(p2.latitude * Math.PI / 180) *
            Math.sin(dLon / 2) ** 2;
  return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
}
```

---

### 10.13 华为 Map Kit API 速查表

| 功能 | 模块 | 关键方法 |
|------|------|----------|
| 地图显示 | `MapComponent` | `mapCallback` |
| 地图控制 | `map.MapComponentController` | `moveCamera()`, `animateCamera()` |
| 相机位置 | `map` | `newLatLng()`, `getCameraPosition()` |
| 地图类型 | `mapCommon.MapType` | `setMapType()` |
| 日夜模式 | `mapCommon.DayNightMode` | `setDayNightMode()` |
| 标记 | `mapCommon.MarkerOptions` | `addMarker()` |
| 折线 | `mapCommon.PolylineOptions` | `addPolyline()` |
| 多边形 | `mapCommon.PolygonOptions` | `addPolygon()` |
| 圆形 | `mapCommon.CircleOptions` | `addCircle()` |
| 事件监听 | `map.MapEventManager` | `on("mapClick")` |
| POI搜索 | `site` | `nearbySearch()` |
| 驾车路线 | `navi` | `getDrivingRoutes()` |
| 步行路线 | `navi` | `getWalkingRoutes()` |
| 骑行路线 | `navi` | `getCyclingRoutes()` |
| 定位 | `geoLocationManager` | `getCurrentLocation()` |

---

### 10.14 高德 vs 华为原生地图对比

| 功能 | 高德地图 SDK | 华为 Map Kit |
|------|-------------|--------------|
| API Key | 需要申请 | 不需要 |
| 地图组件 | `MapViewComponent` | `MapComponent` |
| 控制器获取 | `getMapAsync()` 回调 | `mapCallback` 回调 |
| 相机移动 | `CameraUpdateFactory.newLatLngZoom()` | `map.newLatLng()` |
| 标记添加 | `aMap.addMarker()` | `mapController.addMarker()` |
| POI搜索 | `PoiSearch` | `site.nearbySearch()` |
| 路线规划 | `RouteSearch` | `navi.getDrivingRoutes()` |
| 地理编码 | `GeocodeSearch` | 需配置 API Key |
| 生命周期 | `onCreate()` / `onDestroy()` | `show()` / `hide()` |

---

> 文档版本: 1.3  
> 更新日期: 2025-12-20  
> 整理自 HydroQuiz 项目开发实践 + 高德/华为地图 HarmonyOS SDK 教程
