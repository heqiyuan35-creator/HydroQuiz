# HarmonyOS 开发技术深度问答

基于 HydroQuiz（水利工程检测员刷题宝）项目实践总结的30个鸿蒙开发技术深度问答

---

## 问题1：ArkTS 状态管理机制

**问：在 HarmonyOS ArkTS 开发中，@State、@Prop、@Link、@StorageLink、@StorageProp 这几个状态管理装饰器各自的作用是什么？它们之间有什么区别？在实际项目中应该如何选择使用？请结合具体场景举例说明。**

答：这些装饰器是 ArkTS 响应式状态管理的核心，各有不同的适用场景：

**@State**：组件内部私有状态，当值变化时自动触发 UI 重新渲染。适用于组件内部独立管理的数据。
```typescript
@State isLoading: boolean = true;
@State articles: KnowledgeArticle[] = [];
@State searchText: string = '';
```

**@Prop**：父组件向子组件单向传递数据，子组件可以修改本地副本但不会影响父组件。

**@Link**：父子组件双向数据绑定，子组件的修改会同步到父组件。

**@StorageLink**：与 AppStorage 双向绑定，实现跨组件、跨页面的全局状态共享。
```typescript
@StorageLink('knowledgeRefreshTrigger') @Watch('onKnowledgeRefreshTrigger') 
knowledgeRefreshTrigger: number = 0;
```

**@StorageProp**：与 AppStorage 单向绑定，只读取不写入。

选择原则：组件内部状态用 @State；父子传参用 @Prop/@Link；全局状态用 @StorageLink/@StorageProp。

---

## 问题2：@Watch 监听器的工作原理

**问：在 ArkTS 中，@Watch 装饰器是如何工作的？它可以监听哪些类型的状态变量？当被监听的变量是对象或数组时，深层属性的变化能否被监听到？如何解决深层监听的问题？**

答：@Watch 用于监听状态变量的变化，当变量值改变时自动调用指定的回调函数。

```typescript
@StorageLink('knowledgeRefreshTrigger') @Watch('onKnowledgeRefreshTrigger') 
knowledgeRefreshTrigger: number = 0;

onKnowledgeRefreshTrigger(): void {
  // 当 knowledgeRefreshTrigger 值变化时自动调用
  this.knowledgeSubjects = this.knowledgeService.getSubjects();
  this.allKnowledgeArticles = [...this.knowledgeService.getAllArticles()];
  this.knowledgeRefreshKey++;  // 强制 UI 更新
}
```

**深层监听问题**：@Watch 只能监听变量引用的变化，无法监听对象/数组内部属性的变化。解决方案：
1. 修改时创建新对象/数组：`this.articles = [...newArticles]`
2. 使用计数器强制刷新：`this.refreshKey++`
3. 使用 @Observed 和 @ObjectLink 实现深度观察

---

## 问题3：组件生命周期管理

**问：ArkUI 组件的完整生命周期包括哪些阶段？aboutToAppear、aboutToDisappear、onPageShow、onPageHide 这些生命周期函数分别在什么时机被调用？在一个多 Tab 页面应用中，切换 Tab 时会触发哪些生命周期函数？如何正确管理资源的初始化和释放？**

答：ArkUI 组件生命周期函数及调用时机：

- **aboutToAppear()**：组件实例创建后、build() 执行前调用，用于初始化数据
- **aboutToDisappear()**：组件销毁前调用，用于释放资源
- **onPageShow()**：页面显示时调用（仅 @Entry 组件），包括首次显示和从其他页面返回
- **onPageHide()**：页面隐藏时调用（仅 @Entry 组件）

```typescript
aboutToAppear(): void {
  this.startTime = Date.now();
  this.allArticles = this.knowledgeService.getAllArticles();
  this.setupTTSCallback();
}

aboutToDisappear(): void {
  this.ttsService.stop();
  this.ttsService.clearCallback();
  // 通知主页刷新数据
  const currentTrigger = AppStorage.get<number>('knowledgeRefreshTrigger') || 0;
  AppStorage.set('knowledgeRefreshTrigger', currentTrigger + 1);
}

onPageShow(): void {
  // 页面返回时刷新数据
  this.loadArticles();
}
```

**Tab 切换**：使用 Tabs 组件时，切换 Tab 不会触发 onPageShow/onPageHide，需要在 onChange 回调中处理。

---

## 问题4：路由导航与参数传递

**问：在 HarmonyOS 应用中，如何实现页面之间的导航跳转？router.pushUrl 和 router.replaceUrl 有什么区别？如何在页面之间传递复杂参数？当从详情页返回列表页时，如何通知列表页刷新数据？**

答：HarmonyOS 使用 `@kit.ArkUI` 中的 router 模块进行页面导航：

```typescript
import { router } from '@kit.ArkUI';

// pushUrl：将新页面压入栈，可以返回
router.pushUrl({
  url: 'pages/KnowledgeDetailPage',
  params: { articleId: article.id }
});

// replaceUrl：替换当前页面，无法返回
router.replaceUrl({ url: 'pages/LoginPage' });

// 返回上一页
router.back();
```

**参数传递**：
```typescript
// 发送方
const params: Record<string, string> = {};
params['articleId'] = article.id;
params['mode'] = 'edit';
router.pushUrl({ url: 'pages/DetailPage', params: params });

// 接收方
interface RouteParams {
  articleId: string;
  mode?: string;
}

aboutToAppear(): void {
  const params = router.getParams() as RouteParams;
  if (params?.articleId) {
    this.loadArticle(params.articleId);
  }
}
```

**返回刷新**：使用 AppStorage 触发机制或 onPageShow 生命周期。

---

## 问题5：关系型数据库设计与操作

**问：HarmonyOS 提供了哪些数据持久化方案？在需要存储结构化数据时，如何使用关系型数据库 RDB？请详细说明数据库的初始化、表的创建、数据的增删改查操作，以及如何处理数据库版本升级和字段迁移？**

答：HarmonyOS 数据持久化方案包括：Preferences（轻量键值对）、RDB（关系型数据库）、分布式数据管理等。

**数据库初始化**：
```typescript
import { relationalStore } from '@kit.ArkData';

const config: relationalStore.StoreConfig = {
  name: 'HydroQuiz.db',
  securityLevel: relationalStore.SecurityLevel.S1
};

this.rdbStore = await relationalStore.getRdbStore(context, config);
```

**创建表和索引**：
```typescript
const createTable: string = `
  CREATE TABLE IF NOT EXISTS knowledge_read_records (
    article_id TEXT PRIMARY KEY,
    view_count INTEGER DEFAULT 0,
    read_time INTEGER DEFAULT 0,
    progress INTEGER DEFAULT 0,
    last_read_time INTEGER NOT NULL
  )
`;
await this.rdbStore.executeSql(createTable);
await this.rdbStore.executeSql('CREATE INDEX IF NOT EXISTS idx_read_time ON knowledge_read_records(last_read_time)');
```

**CRUD 操作**：
```typescript
// 查询
const predicates = new relationalStore.RdbPredicates('knowledge_read_records');
predicates.equalTo('article_id', articleId);
const resultSet = await store.query(predicates);

// 插入
const valueBucket: relationalStore.ValuesBucket = {
  article_id: articleId,
  view_count: 1,
  last_read_time: Date.now()
};
await store.insert('knowledge_read_records', valueBucket);

// 更新
await store.update(valueBucket, predicates);

// 删除
await store.delete(predicates);
```

**版本升级迁移**：
```typescript
// 添加新字段（兼容旧版本）
try {
  await this.rdbStore.executeSql('ALTER TABLE wrong_questions ADD COLUMN note TEXT DEFAULT \'\'');
} catch (e) {
  // 字段已存在，忽略错误
}
```

---

## 问题6：异步数据库操作与等待机制

**问：在应用启动时，数据库初始化是异步的，但其他服务可能在数据库初始化完成前就尝试访问数据库。如何设计一个可靠的等待机制，确保所有数据库操作都在初始化完成后执行？如何处理等待超时的情况？**

答：设计一个基于 Promise 的等待机制：

```typescript
class DatabaseService {
  private isInitialized: boolean = false;
  private initResolvers: Array<() => void> = [];

  async waitForReady(timeoutMs: number = 10000): Promise<boolean> {
    if (this.isReady()) {
      return true;
    }

    return new Promise<boolean>((resolve) => {
      const timeout = setTimeout(() => {
        // 超时处理
        const index = this.initResolvers.indexOf(resolveFunc);
        if (index > -1) {
          this.initResolvers.splice(index, 1);
        }
        Logger.warn('[DatabaseService] Wait for ready timeout');
        resolve(false);
      }, timeoutMs);

      const resolveFunc = () => {
        clearTimeout(timeout);
        resolve(true);
      };

      this.initResolvers.push(resolveFunc);
    });
  }

  private notifyReady(): void {
    for (const resolver of this.initResolvers) {
      resolver();
    }
    this.initResolvers = [];
  }

  async initialize(context: Context): Promise<void> {
    // ... 初始化逻辑
    this.isInitialized = true;
    this.notifyReady();  // 通知所有等待者
  }
}
```

**使用方式**：
```typescript
private async loadStatistics(): Promise<void> {
  const isReady = await databaseService.waitForReady(10000);
  if (!isReady) {
    Logger.warn('Database not ready, using default values');
    return;
  }
  // 执行数据库操作
}
```

---

## 问题7：单例模式服务设计

**问：在 HarmonyOS 应用开发中，为什么要使用单例模式来设计服务类？如何在 ArkTS 中正确实现单例模式？单例服务如何管理内存缓存和数据库数据的同步？当需要刷新缓存数据时，如何设计刷新机制？**

答：单例模式确保全局只有一个服务实例，避免重复初始化和数据不一致。

**单例实现**：
```typescript
export class KnowledgeService {
  private static instance: KnowledgeService;
  private allArticles: KnowledgeArticle[] = [];
  private viewCounts: Map<string, number> = new Map();
  private isDataLoaded: boolean = false;

  private constructor() {
    this.initArticles();
    this.loadFromDatabase();
  }

  public static getInstance(): KnowledgeService {
    if (!KnowledgeService.instance) {
      KnowledgeService.instance = new KnowledgeService();
    }
    return KnowledgeService.instance;
  }
}
```

**缓存与数据库同步**：
```typescript
// 写入时同时更新缓存和数据库
public async incrementViewCount(articleId: string): Promise<void> {
  // 1. 更新内存缓存
  const currentCount = this.viewCounts.get(articleId) || 0;
  this.viewCounts.set(articleId, currentCount + 1);

  // 2. 异步持久化到数据库
  try {
    const store = databaseService.getStore();
    const valueBucket: relationalStore.ValuesBucket = {
      view_count: currentCount + 1,
      last_read_time: Date.now()
    };
    await store.update(valueBucket, predicates);
  } catch (error) {
    Logger.error('Failed to save view count', error as Error);
  }
}

// 刷新机制
public async refreshData(): Promise<void> {
  this.viewCounts.clear();
  this.isDataLoaded = false;
  await this.loadFromDatabase();
}
```

---

## 问题8：@Builder 可复用 UI 组件设计

**问：在 ArkUI 中，@Builder 装饰器用于创建可复用的 UI 片段。@Builder 函数与普通函数有什么区别？如何向 @Builder 函数传递参数？@Builder 函数内部如何访问组件的状态变量？在设计复杂列表项时，如何合理使用 @Builder 提高代码复用性？**

答：@Builder 是 ArkUI 的轻量级 UI 复用机制，比自定义组件更轻量。

**特点**：
- 可以直接访问所在组件的状态变量和方法
- 支持参数传递
- 不创建新的组件实例，性能更好

```typescript
@Builder
KnowledgeArticleTreeItem(article: KnowledgeArticle, color: string) {
  Row() {
    Column() {
      // 标题行 - 可以访问组件方法
      Row() {
        Text(article.title)
          .fontSize(14)
          .fontColor(this.knowledgeService.isArticleRead(article.id) 
            ? ThemeColors.TEXT_HINT 
            : ThemeColors.TEXT_PRIMARY)
          .layoutWeight(1)

        // 已读标记
        if (this.knowledgeService.isArticleRead(article.id)) {
          Text('已读')
            .fontSize(10)
            .fontColor(ThemeColors.SUCCESS)
            .backgroundColor(ThemeColors.SUCCESS + '15')
            .borderRadius(8)
        }
      }
      .width('100%')

      // 元信息
      Row() {
        if (article.source) {
          Text(article.source)
            .fontSize(11)
            .fontColor(color)  // 使用传入的参数
        }
        Text(`⏱ ${article.readTime}分钟`)
          .fontSize(11)
          .fontColor(ThemeColors.TEXT_HINT)
      }
    }
    .layoutWeight(1)

    Text('›')
      .fontSize(18)
      .fontColor(ThemeColors.TEXT_HINT)
  }
  .onClick(() => {
    // 可以访问组件方法
    this.navigateToDetail(article.id);
  })
}

// 使用
ForEach(this.getArticlesByCategory(category.id), (article: KnowledgeArticle) => {
  this.KnowledgeArticleTreeItem(article, subject.color)
}, (article: KnowledgeArticle) => article.id)
```

---

## 问题9：ForEach 列表渲染优化

**问：在 ArkUI 中使用 ForEach 进行列表渲染时，第三个参数（键值生成函数）的作用是什么？如果不提供或提供不当会导致什么问题？当列表数据发生变化时，ArkUI 是如何进行差异化更新的？如何优化大数据量列表的渲染性能？**

答：ForEach 的键值生成函数用于标识每个列表项的唯一性，是 ArkUI 进行高效差异化更新的关键。

**键值函数的作用**：
```typescript
ForEach(
  this.articles,                              // 数据源
  (article: KnowledgeArticle) => {            // 渲染函数
    this.ArticleItem(article)
  },
  (article: KnowledgeArticle) => article.id   // 键值生成函数
)
```

**不提供键值函数的问题**：
- 默认使用索引作为键值
- 数据顺序变化时会导致不必要的重新渲染
- 可能出现状态错乱（如输入框内容错位）

**差异化更新原理**：
1. 数据变化时，ArkUI 比较新旧键值列表
2. 键值相同的项复用已有组件实例
3. 新增键值创建新组件，删除的键值销毁对应组件

**性能优化策略**：
```typescript
// 1. 使用 LazyForEach 实现懒加载
LazyForEach(this.dataSource, (item: Article) => {
  ListItem() { this.ArticleItem(item) }
}, (item: Article) => item.id)

// 2. 使用 List 的 cachedCount 控制缓存数量
List() { ... }
  .cachedCount(5)

// 3. 避免在渲染函数中进行复杂计算
// 4. 使用 @Reusable 装饰器实现组件复用
```

---

## 问题10：Tabs 组件与多页面管理

**问：在开发一个多 Tab 页面的应用时，如何使用 Tabs 组件实现底部导航栏？如何自定义 Tab 栏的样式？当切换 Tab 时如何执行特定的业务逻辑？如何实现 Tab 切换时的动画效果？如何在代码中主动切换到指定的 Tab？**

答：Tabs 组件是实现多页面切换的核心组件。

**基础实现**：
```typescript
@State currentIndex: number = 0;
private tabController: TabsController = new TabsController();

Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
  TabContent() {
    this.HomeContent()
  }
  .tabBar(this.TabBarBuilder(this.tabList[0], 0))

  TabContent() {
    this.QuestionBankContent()
  }
  .tabBar(this.TabBarBuilder(this.tabList[1], 1))

  TabContent() {
    this.KnowledgeContent()
  }
  .tabBar(this.TabBarBuilder(this.tabList[2], 2))
}
.barHeight(56)
.barBackgroundColor(ThemeColors.SURFACE)
.onChange((index: number) => {
  this.currentIndex = index;
  // 切换到知识库Tab时刷新数据
  if (index === 2) {
    this.updateKnowledgeUI();
  }
})
```

**自定义 Tab 栏样式**：
```typescript
@State tabScales: number[] = [1, 1, 1, 1];
@State tabOffsetY: number[] = [0, 0, 0, 0];

@Builder
TabBarBuilder(item: TabItem, index: number) {
  Column() {
    Image(this.getTabIconResource(index))
      .width(24)
      .height(24)

    Text(item.title)
      .fontSize(ThemeConstants.FONT_SIZE_XS)
      .fontColor(this.currentIndex === index ? ThemeColors.PRIMARY : ThemeColors.TEXT_HINT)
      .margin({ top: 4 })
  }
  .scale({ x: this.tabScales[index], y: this.tabScales[index] })
  .translate({ y: this.tabOffsetY[index] })
  .onClick(() => {
    if (this.currentIndex !== index) {
      this.playTabBounce(index);
    }
    this.currentIndex = index;
    this.tabController.changeIndex(index);
  })
}
```

**Tab 切换动画**：
```typescript
private playTabBounce(index: number): void {
  animateTo({ duration: 100, curve: Curve.EaseOut }, () => {
    this.tabScales[index] = 0.85;
    this.tabOffsetY[index] = -4;
  });
  setTimeout(() => {
    animateTo({ duration: 200, curve: Curve.EaseOut }, () => {
      this.tabScales[index] = 1.05;
      this.tabOffsetY[index] = -2;
    });
  }, 100);
  setTimeout(() => {
    animateTo({ duration: 150, curve: Curve.EaseInOut }, () => {
      this.tabScales[index] = 1;
      this.tabOffsetY[index] = 0;
    });
  }, 300);
}
```

---

## 问题11：文本转语音（TTS）服务集成
的高亮显示？如何实现搜索历史记录的保存和展示？如何优化搜索性能，避免频繁触发搜索？如何实现多字段联合搜索？**

答：搜索功能是知识库应用的核心功能之一。

**搜索输入与防抖**：
```typescript
@State searchText: string = '';
private searchTimer: number = -1;

TextInput({ placeholder: '搜索知识点...', text: this.searchText })
  .onChange((value: string) => {
    this.searchText = value;
    // 防抖处理，避免频繁搜索
    if (this.searchTimer !== -1) {
      clearTimeout(this.searchTimer);
    }
    this.searchTimer = setTimeout(() => {
      this.performSearch(value);
    }, 300);
  })
```

**多字段搜索实现**：
```typescript
private performSearch(keyword: string): void {
  if (!keyword.trim()) {
    this.searchResults = [];
    return;
  }

  const lowerKeyword = keyword.toLowerCase();
  this.searchResults = this.allArticles.filter(article => {
    return article.title.toLowerCase().includes(lowerKeyword) ||
           article.summary.toLowerCase().includes(lowerKeyword) ||
           article.content.toLowerCase().includes(lowerKeyword) ||
           article.tags.some(tag => tag.toLowerCase().includes(lowerKeyword));
  });
}
```

**关键词高亮显示**：
```typescript
@Builder
HighlightText(text: string, keyword: string) {
  if (!keyword) {
    Text(text)
  } else {
    Row() {
      ForEach(this.splitTextByKeyword(text, keyword), (part: TextPart) => {
        Text(part.text)
          .fontColor(part.isHighlight ? ThemeColors.PRIMARY : ThemeColors.TEXT_PRIMARY)
          .backgroundColor(part.isHighlight ? ThemeColors.PRIMARY + '20' : 'transparent')
      })
    }
  }
}

private splitTextByKeyword(text: string, keyword: string): TextPart[] {
  const parts: TextPart[] = [];
  const lowerText = text.toLowerCase();
  const lowerKeyword = keyword.toLowerCase();
  let lastIndex = 0;

  let index = lowerText.indexOf(lowerKeyword);
  while (index !== -1) {
    if (index > lastIndex) {
      parts.push({ text: text.substring(lastIndex, index), isHighlight: false });
    }
    parts.push({ text: text.substring(index, index + keyword.length), isHighlight: true });
    lastIndex = index + keyword.length;
    index = lowerText.indexOf(lowerKeyword, lastIndex);
  }

  if (lastIndex < text.length) {
    parts.push({ text: text.substring(lastIndex), isHighlight: false });
  }

  return parts;
}
```

---

## 问题20：Scroll 组件与滚动控制


**问：在 ArkUI 中，如何使用 Scroll 组件实现可滚动的内容区域？如何监听滚动事件并获取滚动位置？如何实现滚动到顶部/底部的功能？如何实现下拉刷新和上拉加载更多？如何在滚动时实现标题栏的渐变效果？**

答：Scroll 组件是实现可滚动内容的基础组件。

**基础用法与滚动控制**：
```typescript
private scroller: Scroller = new Scroller();
@State scrollY: number = 0;

Scroll(this.scroller) {
  Column() {
    // 内容
  }
}
.scrollable(ScrollDirection.Vertical)
.scrollBar(BarState.Auto)
.onScroll((xOffset: number, yOffset: number) => {
  this.scrollY += yOffset;
  this.updateHeaderOpacity();
})
.onScrollEdge((side: Edge) => {
  if (side === Edge.Bottom) {
    this.loadMoreData();
  }
})

// 滚动到顶部
private scrollToTop(): void {
  this.scroller.scrollTo({ xOffset: 0, yOffset: 0, animation: { duration: 300 } });
}

// 滚动到指定位置
private scrollToPosition(offset: number): void {
  this.scroller.scrollTo({ xOffset: 0, yOffset: offset, animation: { duration: 200 } });
}
```

**标题栏渐变效果**：
```typescript
@State headerOpacity: number = 0;

private updateHeaderOpacity(): void {
  const maxScroll = 100;
  this.headerOpacity = Math.min(this.scrollY / maxScroll, 1);
}

// 标题栏
Row() {
  Text('知识库')
    .fontSize(18)
    .fontWeight(FontWeight.Bold)
}
.backgroundColor(`rgba(255, 255, 255, ${this.headerOpacity})`)
.shadow({
  radius: this.headerOpacity * 8,
  color: 'rgba(0, 0, 0, 0.1)',
  offsetY: 2
})
```

---

## 问题21：Preferences 轻量级数据存储


**问：HarmonyOS 的 Preferences 存储适用于什么场景？如何初始化和使用 Preferences？Preferences 支持存储哪些数据类型？如何存储复杂对象（如数组、对象）？Preferences 与关系型数据库相比有什么优缺点？**

答：Preferences 是轻量级键值对存储，适合存储配置信息、用户偏好等小量数据。

**初始化与基本操作**：
```typescript
import { preferences } from '@kit.ArkData';

class PreferencesService {
  private prefs: preferences.Preferences | null = null;
  private static instance: PreferencesService;

  async initialize(context: Context): Promise<void> {
    this.prefs = await preferences.getPreferences(context, 'app_settings');
  }

  // 存储基本类型
  async setString(key: string, value: string): Promise<void> {
    await this.prefs?.put(key, value);
    await this.prefs?.flush();
  }

  async getString(key: string, defaultValue: string = ''): Promise<string> {
    return (await this.prefs?.get(key, defaultValue)) as string;
  }

  async setNumber(key: string, value: number): Promise<void> {
    await this.prefs?.put(key, value);
    await this.prefs?.flush();
  }

  async getNumber(key: string, defaultValue: number = 0): Promise<number> {
    return (await this.prefs?.get(key, defaultValue)) as number;
  }

  async setBoolean(key: string, value: boolean): Promise<void> {
    await this.prefs?.put(key, value);
    await this.prefs?.flush();
  }
}
```

**存储复杂对象**：
```typescript
// 存储数组/对象需要序列化为 JSON 字符串
async setObject<T>(key: string, value: T): Promise<void> {
  const jsonString = JSON.stringify(value);
  await this.prefs?.put(key, jsonString);
  await this.prefs?.flush();
}

async getObject<T>(key: string, defaultValue: T): Promise<T> {
  const jsonString = await this.prefs?.get(key, '') as string;
  if (!jsonString) return defaultValue;
  try {
    return JSON.parse(jsonString) as T;
  } catch {
    return defaultValue;
  }
}

// 使用示例
await prefsService.setObject('searchHistory', ['关键词1', '关键词2']);
const history = await prefsService.getObject<string[]>('searchHistory', []);
```

**Preferences vs RDB**：
- Preferences：简单键值对，适合配置项，无需定义表结构
- RDB：结构化数据，支持复杂查询，适合大量数据

---

## 问题22：promptAction 交互反馈


**问：在 HarmonyOS 应用中，如何向用户展示轻量级的交互反馈？promptAction 提供了哪些类型的弹窗？如何自定义 Toast 的显示位置和时长？如何实现确认对话框？如何在对话框中获取用户的选择结果？**

答：promptAction 是 ArkUI 提供的轻量级交互反馈 API。

**Toast 提示**：
```typescript
import { promptAction } from '@kit.ArkUI';

// 基础 Toast
promptAction.showToast({
  message: '操作成功',
  duration: 2000,
  bottom: 100  // 距离底部的距离
});

// 自定义位置
promptAction.showToast({
  message: '已添加到收藏',
  duration: 1500,
  bottom: 200
});
```

**确认对话框**：
```typescript
promptAction.showDialog({
  title: '确认删除',
  message: '确定要删除这条记录吗？此操作不可恢复。',
  buttons: [
    { text: '取消', color: ThemeColors.TEXT_SECONDARY },
    { text: '删除', color: ThemeColors.ERROR }
  ]
}).then((result) => {
  if (result.index === 1) {
    // 用户点击了删除按钮
    this.deleteRecord();
  }
});
```

**ActionSheet 操作菜单**：
```typescript
promptAction.showActionMenu({
  title: '选择操作',
  buttons: [
    { text: '编辑', color: ThemeColors.PRIMARY },
    { text: '分享', color: ThemeColors.PRIMARY },
    { text: '删除', color: ThemeColors.ERROR }
  ]
}).then((result) => {
  switch (result.index) {
    case 0: this.editItem(); break;
    case 1: this.shareItem(); break;
    case 2: this.deleteItem(); break;
  }
}).catch(() => {
  // 用户取消
});
```

---

## 问题23：资源引用与国际化


**问：在 HarmonyOS 应用中，如何使用资源引用（$r）来管理字符串、颜色、图片等资源？资源文件的目录结构是怎样的？如何实现应用的国际化（多语言支持）？如何在代码中动态获取资源值？**

答：HarmonyOS 使用资源引用机制统一管理应用资源。

**资源目录结构**：
```
resources/
├── base/                    # 默认资源
│   ├── element/
│   │   ├── string.json      # 字符串资源
│   │   ├── color.json       # 颜色资源
│   │   └── float.json       # 数值资源
│   ├── media/               # 图片资源
│   └── profile/             # 配置文件
├── zh_CN/                   # 中文资源
│   └── element/
│       └── string.json
├── en_US/                   # 英文资源
│   └── element/
│       └── string.json
└── dark/                    # 深色模式资源
    └── element/
        └── color.json
```

**定义资源**：
```json
// resources/base/element/string.json
{
  "string": [
    { "name": "app_name", "value": "水利刷题宝" },
    { "name": "tab_home", "value": "首页" },
    { "name": "tab_question", "value": "题库" },
    { "name": "confirm_delete", "value": "确定要删除吗？" }
  ]
}

// resources/base/element/color.json
{
  "color": [
    { "name": "primary", "value": "#1890FF" },
    { "name": "text_primary", "value": "#333333" }
  ]
}
```

**使用资源引用**：
```typescript
// 字符串资源
Text($r('app.string.app_name'))

// 颜色资源
Text('标题')
  .fontColor($r('app.color.text_primary'))

// 图片资源
Image($r('app.media.icon_home'))

// 数值资源
.fontSize($r('app.float.font_size_base'))
```

**动态获取资源值**：
```typescript
import { resourceManager } from '@kit.LocalizationKit';

const context = getContext(this);
const resManager = context.resourceManager;
const appName = await resManager.getStringValue($r('app.string.app_name'));
```

---

## 问题24：Grid 网格布局


**问：在 ArkUI 中，如何使用 Grid 组件实现网格布局？如何设置网格的行列数和间距？如何实现不规则的网格布局（如某些项占据多行或多列）？Grid 与 Flex 布局相比有什么优势？如何实现响应式的网格布局？**

答：Grid 组件用于创建规则的网格布局。

**基础网格布局**：
```typescript
Grid() {
  ForEach(this.categories, (category: Category) => {
    GridItem() {
      Column() {
        Image(category.icon)
          .width(40)
          .height(40)
        Text(category.name)
          .fontSize(14)
          .margin({ top: 8 })
      }
      .padding(16)
      .backgroundColor(ThemeColors.SURFACE)
      .borderRadius(12)
    }
  })
}
.columnsTemplate('1fr 1fr 1fr')  // 3列等宽
.rowsGap(12)                      // 行间距
.columnsGap(12)                   // 列间距
.width('100%')
.height('auto')
```

**不规则网格（跨行跨列）**：
```typescript
Grid() {
  GridItem() {
    // 大卡片，占据2列2行
    this.LargeCard()
  }
  .columnStart(0)
  .columnEnd(1)
  .rowStart(0)
  .rowEnd(1)

  GridItem() {
    this.SmallCard()
  }
  .columnStart(2)
  .rowStart(0)

  // 更多 GridItem...
}
.columnsTemplate('1fr 1fr 1fr')
.rowsTemplate('1fr 1fr')
```

**响应式网格**：
```typescript
@State screenWidth: number = 0;

aboutToAppear(): void {
  this.screenWidth = px2vp(display.getDefaultDisplaySync().width);
}

private getColumnsTemplate(): string {
  if (this.screenWidth > 600) {
    return '1fr 1fr 1fr 1fr';  // 大屏4列
  } else if (this.screenWidth > 400) {
    return '1fr 1fr 1fr';      // 中屏3列
  }
  return '1fr 1fr';            // 小屏2列
}

Grid() { ... }
  .columnsTemplate(this.getColumnsTemplate())
```

---

## 问题25：条件渲染与性能优化


**问：在 ArkUI 中，如何实现条件渲染？if/else 条件渲染与 Visibility 属性控制显示隐藏有什么区别？在性能敏感的场景下应该如何选择？如何避免条件渲染导致的不必要重建？**

答：条件渲染是控制 UI 显示的重要手段，不同方式有不同的性能特点。

**if/else 条件渲染**：
```typescript
// 条件为 false 时，组件会被销毁
if (this.isLoading) {
  LoadingIndicator()
} else if (this.hasError) {
  ErrorView()
} else {
  ContentView()
}
```

**Visibility 属性控制**：
```typescript
// 组件始终存在，只是不可见
Column() {
  LoadingIndicator()
}
.visibility(this.isLoading ? Visibility.Visible : Visibility.None)
```

**区别与选择**：
| 特性 | if/else | Visibility |
|------|---------|------------|
| 组件生命周期 | 销毁/重建 | 保持存在 |
| 内存占用 | 低（不显示时释放） | 高（始终占用） |
| 切换性能 | 低（需重建） | 高（只改属性） |
| 状态保持 | 不保持 | 保持 |

**最佳实践**：
```typescript
// 频繁切换且需要保持状态：使用 Visibility
Column() {
  this.TabContent1()
}
.visibility(this.currentTab === 0 ? Visibility.Visible : Visibility.None)

Column() {
  this.TabContent2()
}
.visibility(this.currentTab === 1 ? Visibility.Visible : Visibility.None)

// 不常显示或初始化成本低：使用 if/else
if (this.showDialog) {
  this.DialogContent()
}
```

---

## 问题26：自定义组件封装


**问：在 ArkUI 中，如何创建可复用的自定义组件？@Component 装饰器的作用是什么？如何设计组件的对外接口（Props）？如何在自定义组件中使用插槽（Slot）实现内容分发？如何实现组件的事件回调？**

答：自定义组件是实现代码复用和模块化的重要手段。

**基础组件定义**：
```typescript
@Component
export struct CardItem {
  // Props - 外部传入的属性
  @Prop title: string = '';
  @Prop subtitle: string = '';
  @Prop imageUrl: string = '';
  @Prop showBadge: boolean = false;

  // 事件回调
  onCardClick?: () => void;
  onMoreClick?: () => void;

  build() {
    Column() {
      Row() {
        if (this.imageUrl) {
          Image(this.imageUrl)
            .width(48)
            .height(48)
            .borderRadius(8)
        }

        Column() {
          Text(this.title)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)

          if (this.subtitle) {
            Text(this.subtitle)
              .fontSize(12)
              .fontColor(ThemeColors.TEXT_SECONDARY)
          }
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)

        if (this.showBadge) {
          Badge({ count: 1, style: { badgeSize: 8 } })
        }
      }
      .width('100%')
      .onClick(() => this.onCardClick?.())
    }
    .padding(16)
    .backgroundColor(ThemeColors.SURFACE)
    .borderRadius(12)
  }
}
```

**使用自定义组件**：
```typescript
CardItem({
  title: article.title,
  subtitle: article.summary,
  imageUrl: article.coverImage,
  showBadge: !article.isRead,
  onCardClick: () => this.navigateToDetail(article.id),
  onMoreClick: () => this.showOptions(article)
})
```

**使用 @BuilderParam 实现插槽**：
```typescript
@Component
struct Container {
  @BuilderParam content: () => void = this.defaultContent;

  @Builder
  defaultContent() {
    Text('默认内容')
  }

  build() {
    Column() {
      Text('标题')
      this.content()  // 插槽内容
    }
  }
}

// 使用
Container() {
  Text('自定义内容')
  Button('按钮')
}
```

---

## 问题27：手势识别与交互


**问：ArkUI 支持哪些手势识别？如何实现点击、长按、滑动、缩放等手势？如何组合多个手势？如何处理手势冲突？如何实现自定义的手势交互效果？**

答：ArkUI 提供了丰富的手势识别能力。

**基础手势**：
```typescript
Column() {
  Text('手势测试')
}
// 点击手势
.onClick(() => {
  console.log('单击');
})
// 长按手势
.gesture(
  LongPressGesture({ repeat: false, duration: 500 })
    .onAction(() => {
      console.log('长按');
      this.showContextMenu();
    })
)
```

**滑动手势**：
```typescript
@State offsetX: number = 0;

Row() {
  // 内容
}
.translate({ x: this.offsetX })
.gesture(
  PanGesture({ direction: PanDirection.Horizontal })
    .onActionStart(() => {
      this.startX = this.offsetX;
    })
    .onActionUpdate((event: GestureEvent) => {
      this.offsetX = this.startX + event.offsetX;
    })
    .onActionEnd(() => {
      // 判断滑动方向和距离
      if (this.offsetX < -100) {
        this.showDeleteButton();
      } else {
        animateTo({ duration: 200 }, () => {
          this.offsetX = 0;
        });
      }
    })
)
```

**组合手势**：
```typescript
// 并行手势 - 同时识别多个手势
.gesture(
  GestureGroup(GestureMode.Parallel,
    TapGesture({ count: 2 })
      .onAction(() => console.log('双击')),
    LongPressGesture()
      .onAction(() => console.log('长按'))
  )
)

// 顺序手势 - 按顺序触发
.gesture(
  GestureGroup(GestureMode.Sequence,
    LongPressGesture({ duration: 300 }),
    PanGesture()
  )
  .onActionEnd(() => console.log('长按后拖动'))
)
```

**缩放手势**：
```typescript
@State scale: number = 1;

Image(this.imageUrl)
  .scale({ x: this.scale, y: this.scale })
  .gesture(
    PinchGesture({ fingers: 2 })
      .onActionUpdate((event: GestureEvent) => {
        this.scale = event.scale;
      })
  )
```

---

## 问题28：Web 组件与 H5 交互


**问：在 HarmonyOS 应用中，如何使用 Web 组件加载网页或本地 HTML？如何实现原生与 H5 页面的双向通信？如何拦截 H5 页面的请求？如何处理 H5 页面中的文件下载？如何优化 Web 组件的加载性能？**

答：Web 组件用于在应用中嵌入网页内容。

**加载网页**：
```typescript
import { webview } from '@kit.ArkWeb';

@State webController: webview.WebviewController = new webview.WebviewController();

Web({ src: 'https://example.com', controller: this.webController })
  .width('100%')
  .height('100%')
  .javaScriptAccess(true)
  .domStorageAccess(true)

// 加载本地 HTML
Web({ src: $rawfile('study_report.html'), controller: this.webController })
```

**原生调用 H5**：
```typescript
// 执行 JavaScript
this.webController.runJavaScript('updateData(' + JSON.stringify(data) + ')');

// 带回调的调用
this.webController.runJavaScript('getData()')
  .then((result) => {
    console.log('H5 返回:', result);
  });
```

**H5 调用原生**：
```typescript
Web({ src: this.url, controller: this.webController })
  .javaScriptProxy({
    object: {
      // 暴露给 H5 的方法
      showToast: (message: string) => {
        promptAction.showToast({ message });
      },
      navigateTo: (page: string) => {
        router.pushUrl({ url: page });
      },
      getDeviceInfo: () => {
        return JSON.stringify({ platform: 'HarmonyOS' });
      }
    },
    name: 'NativeBridge',  // H5 中通过 window.NativeBridge 调用
    methodList: ['showToast', 'navigateTo', 'getDeviceInfo'],
    controller: this.webController
  })
```

**H5 端调用**：
```javascript
// 在 H5 页面中
window.NativeBridge.showToast('来自H5的消息');
const info = window.NativeBridge.getDeviceInfo();
```

---

## 问题29：应用启动优化


**问：HarmonyOS 应用的启动流程是怎样的？如何优化应用的冷启动时间？在 EntryAbility 中应该做哪些初始化工作？如何实现启动页（Splash Screen）？如何进行启动性能的监控和分析？**

答：应用启动优化是提升用户体验的关键。

**启动流程**：
1. 系统加载应用进程
2. 执行 EntryAbility.onCreate()
3. 执行 EntryAbility.onWindowStageCreate()
4. 加载首页组件，执行 aboutToAppear()
5. 执行 build() 渲染 UI

**EntryAbility 优化**：
```typescript
export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // 只做必要的初始化，避免耗时操作
    Logger.info('EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // 异步初始化数据库，不阻塞 UI
    this.initializeServicesAsync();

    // 立即加载首页
    windowStage.loadContent('pages/MainTabPage', (err) => {
      if (err.code) {
        Logger.error('Failed to load content');
        return;
      }
    });
  }

  private async initializeServicesAsync(): Promise<void> {
    // 异步初始化，不阻塞启动
    setTimeout(async () => {
      await databaseService.initialize(this.context);
      await userService.initialize();
    }, 0);
  }
}
```

**启动页实现**：
```typescript
@Entry
@Component
struct SplashPage {
  @State showSplash: boolean = true;

  aboutToAppear(): void {
    // 预加载数据
    this.preloadData();

    // 延迟跳转
    setTimeout(() => {
      router.replaceUrl({ url: 'pages/MainTabPage' });
    }, 2000);
  }

  build() {
    Column() {
      Image($r('app.media.logo'))
        .width(120)
        .height(120)

      Text('水利刷题宝')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('v1.0.0')
        .fontSize(14)
        .fontColor(ThemeColors.TEXT_HINT)
        .margin({ top: 8 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
```

**性能监控**：
```typescript
// 记录启动时间
const startTime = Date.now();

aboutToAppear(): void {
  const loadTime = Date.now() - startTime;
  Logger.info(`Page load time: ${loadTime}ms`);
}
```

---

## 问题30：应用打包与发布


**问：HarmonyOS 应用的打包格式是什么？HAP 和 APP 包有什么区别？如何配置应用的签名？如何进行代码混淆保护？如何配置应用的版本号和更新策略？发布到应用市场需要注意哪些事项？**

答：HarmonyOS 应用打包和发布涉及多个配置环节。

**包格式说明**：
- **HAP (Harmony Ability Package)**：模块级别的包，一个应用可以包含多个 HAP
- **APP**：应用级别的包，包含所有 HAP，用于上架应用市场

**签名配置**：
```json
// build-profile.json5
{
  "app": {
    "signingConfigs": [
      {
        "name": "release",
        "type": "HarmonyOS",
        "material": {
          "certpath": "签名证书路径.cer",
          "storePassword": "密钥库密码",
          "keyAlias": "密钥别名",
          "keyPassword": "密钥密码",
          "profile": "发布profile路径.p7b",
          "signAlg": "SHA256withECDSA",
          "storeFile": "密钥库路径.p12"
        }
      }
    ]
  }
}
```

**代码混淆配置**：
```txt
// entry/obfuscation-rules.txt
-enable-property-obfuscation
-enable-toplevel-obfuscation
-enable-filename-obfuscation
-enable-export-obfuscation

# 保留规则
-keep-property-name
  title
  content
  id
```

**版本配置**：
```json
// AppScope/app.json5
{
  "app": {
    "bundleName": "com.example.hydroquiz",
    "vendor": "何启源",
    "versionCode": 1000000,
    "versionName": "1.0.0",
    "icon": "$media:app_icon",
    "label": "$string:app_name"
  }
}
```

**发布注意事项**：
1. 确保所有权限都有合理的使用说明
2. 准备应用截图和描述文案
3. 测试不同设备的兼容性
4. 检查隐私政策和用户协议
5. 确保应用图标和名称符合规范

---

## 作者信息

- **作者**：何启源
- **联系方式**：2770113524@qq.com
- **项目**：HydroQuiz（水利工程检测员刷题宝）

---

*本文档基于 HarmonyOS 5.0 和 ArkTS 开发实践总结，持续更新中。*