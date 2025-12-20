# ArkTS 编译错误解决方案

## 概述

本文档记录 HydroQuiz 项目开发过程中遇到的 ArkTS 编译错误及其解决方案。

---

## 错误类型汇总

### 1. arkts-limited-throw

**错误信息**: `"throw" statements cannot accept values of arbitrary types`

**原因**: ArkTS 要求 `throw` 语句只能抛出 `Error` 类型的对象，不能抛出任意类型。

**错误示例**:
```typescript
// ❌ 错误写法
throw 'Database not initialized';
throw error;  // error 是 unknown 类型
```

**正确写法**:
```typescript
// ✅ 正确写法
throw new Error('Database not initialized');
throw new Error('Failed to initialize database');
```

**涉及文件**:
- `DatabaseService.ets`
- `AnswerRecordService.ets`

---

### 2. arkts-no-utility-types

**错误信息**: `Some of utility types are not supported`

**原因**: ArkTS 不支持 TypeScript 的 utility types，如 `Omit<T, K>`、`Pick<T, K>`、`Partial<T>` 等。

**错误示例**:
```typescript
// ❌ 错误写法
async saveAnswerRecord(record: Omit<AnswerRecord, 'id'>): Promise<string>
```

**正确写法**:
```typescript
// ✅ 正确写法 - 定义独立的接口
export interface AnswerRecordInput {
  questionId: string;
  userAnswer: string;
  isCorrect: boolean;
  answerTime: number;
  createTime: number;
}

async saveAnswerRecord(record: AnswerRecordInput): Promise<string>
```

**涉及文件**:
- `AnswerRecordService.ets`

---

### 3. arkts-no-obj-literals-as-types

**错误信息**: `Object literals cannot be used as type declarations`

**原因**: ArkTS 不允许在函数参数中直接使用对象字面量作为类型声明。

**错误示例**:
```typescript
// ❌ 错误写法
async saveExamRecord(record: {
  examType: string;
  subjectId?: string;
  totalCount: number;
  // ...
}): Promise<string>
```

**正确写法**:
```typescript
// ✅ 正确写法 - 定义独立的接口
export interface ExamRecordInput {
  examType: string;
  subjectId: string;
  totalCount: number;
  correctCount: number;
  score: number;
  duration: number;
  questionIds: string;
  answers: string;
}

async saveExamRecord(record: ExamRecordInput): Promise<string>
```

**涉及文件**:
- `AnswerRecordService.ets`

---

### 4. arkts-no-untyped-obj-literals

**错误信息**: `Object literal must correspond to some explicitly declared class or interface`

**原因**: ArkTS 要求对象字面量必须对应明确声明的类或接口，不能使用匿名对象。

**错误示例**:
```typescript
// ❌ 错误写法
await answerRecordService.saveAnswerRecord({
  questionId: question.id,
  userAnswer: userAnswer,
  isCorrect: isCorrect,
  answerTime: answerTime,
  createTime: Date.now()
});
```

**正确写法**:
```typescript
// ✅ 正确写法 - 先创建类型化的对象
const recordInput: AnswerRecordInput = {
  questionId: question.id,
  userAnswer: userAnswer,
  isCorrect: isCorrect,
  answerTime: answerTime,
  createTime: Date.now()
};
await answerRecordService.saveAnswerRecord(recordInput);
```

**涉及文件**:
- `AnswerPage.ets`
- `ExamPage.ets`
- `AnswerRecordService.ets`

---

### 5. arkts-no-structural-typing

**错误信息**: `Structural typing is not supported`

**原因**: ArkTS 不支持结构化类型（structural typing），即两个具有相同结构但不同名称的类型不能互相赋值。必须使用相同的类型定义。

**错误示例**:
```typescript
// ❌ 错误写法 - 在不同文件中定义相同结构的接口
// MainTabPage.ets
interface TodayStats {
  total: number;
  correct: number;
  accuracy: number;
}
@State todayStats: TodayStats = { total: 0, correct: 0, accuracy: 0 };

// AnswerRecordService.ets
export interface TodayStatistics {
  total: number;
  correct: number;
  accuracy: number;
}

// 赋值时会报错，因为 TodayStats 和 TodayStatistics 是不同类型
this.todayStats = await answerRecordService.getTodayStatistics();
```

**正确写法**:
```typescript
// ✅ 正确写法 - 导入并使用相同的类型
import { answerRecordService, TodayStatistics } from '../services/AnswerRecordService';

@State todayStats: TodayStatistics = { total: 0, correct: 0, accuracy: 0 };

// 现在类型一致，可以正常赋值
this.todayStats = await answerRecordService.getTodayStatistics();
```

**涉及文件**:
- `MainTabPage.ets`

---

## 最佳实践

### 1. 接口定义规范

为所有需要传递的数据结构定义明确的接口：

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

### 2. 错误处理规范

始终使用 `Error` 类型抛出异常：

```typescript
try {
  // 业务逻辑
} catch (error) {
  Logger.error('[Service] Operation failed', error as Error);
  throw new Error('Operation failed: specific reason');
}
```

### 3. 对象创建规范

创建对象时先声明类型：

```typescript
// 推荐写法
const result: TodayStatistics = {
  total: 0,
  correct: 0,
  accuracy: 0
};
return result;

// 不推荐写法
return { total: 0, correct: 0, accuracy: 0 };
```

---

## 修复文件清单

| 文件 | 修复内容 |
|------|----------|
| `DatabaseService.ets` | 修复 throw 语句 |
| `AnswerRecordService.ets` | 添加接口定义，修复 throw 语句，修复对象字面量 |
| `AnswerPage.ets` | 导入接口，使用类型化对象 |
| `ExamPage.ets` | 导入接口，使用类型化对象 |
| `MainTabPage.ets` | 导入 TodayStatistics 类型，避免结构化类型问题 |

---

### 6. Resource Pack Error - Invalid Path

**错误信息**: `Failed to scan resources: invalid path '...', not a file`

**错误码**: `11211101`

**原因**: `resources/base/profile` 目录只能存放 JSON5 配置文件，不能放置文件夹或其他类型的文件（如 HTML）。

**错误示例**:
```
resources/base/profile/
├── main_pages.json       ✅ 正确
├── backup_config.json    ✅ 正确
└── htmlcnakao/           ❌ 错误 - 不能放文件夹
    └── code.html
```

**正确做法**:
```
resources/base/profile/
├── main_pages.json       ✅ 只放 JSON5 配置文件
└── backup_config.json

# HTML 等参考文件应放在项目外部或 planningDoc 目录
planningDoc/
└── reference/
    └── code.html
```

**解决方案**:
- 删除 `profile` 目录下的非 JSON5 文件和文件夹
- 参考设计文件移至 `planningDoc` 或项目外部

---

### 7. @Builder 中不能使用变量声明

**错误信息**: `Only UI component syntax can be written here`

**错误码**: `10905209`

**原因**: ArkTS 的 `@Builder` 装饰器内部只能包含 UI 组件语法，不能使用 `const`、`let`、`var` 等变量声明语句。

**错误示例**:
```typescript
// ❌ 错误写法
@Builder
WeekDayCheckItem(label: string, dayIndex: number) {
  const isToday = dayIndex === this.getTodayWeekDay();  // 错误！
  const isTodayChecked = isToday && this.todayStats.total > 0;  // 错误！
  
  Column() {
    // ...
  }
}
```

**正确写法**:
```typescript
// ✅ 正确写法 - 将逻辑抽取到独立方法中
private isDayChecked(dayIndex: number): boolean {
  return dayIndex === this.getTodayWeekDay() && this.todayStats.total > 0;
}

@Builder
WeekDayCheckItem(label: string, dayIndex: number) {
  Column() {
    // 直接调用方法
    if (this.isDayChecked(dayIndex)) {
      Text('✓')
    }
  }
  .backgroundColor(this.isDayChecked(dayIndex) ? ThemeColors.PRIMARY : ThemeColors.GRAY_200)
}
```

**解决方案**:
- 将计算逻辑抽取到组件的普通方法中
- 在 `@Builder` 中直接调用方法获取结果
- 或者直接在表达式中写条件判断

**涉及文件**:
- `MainTabPage.ets`

---

### 8. strReplace 工具 newStr 参数丢失问题

**错误信息**: `Invalid operation - missing newStr`

**原因**: 在使用 Kiro IDE 的 `strReplace` 工具修改大文件时，如果 `newStr` 内容过长或包含特殊字符，可能导致参数传递失败。

**错误场景**:
```
- 修改超过3000行的大文件
- newStr 内容包含大量代码（如新增20+个题目对象）
- 文件内容复杂，包含多层嵌套的对象字面量
```

**解决方案**:

**方案一：拆分为独立文件（推荐）**
```typescript
// 1. 创建新的数据文件 ConcreteQuestionsData.ets
export function getConcreteExtendedQuestions(timestamp: number): Question[] {
  return [
    // 新增的题目数据
  ];
}

// 2. 在主文件中导入
import { getConcreteExtendedQuestions } from './ConcreteQuestionsData';

// 3. 合并数据
questions.push(...getConcreteExtendedQuestions(now));
```

**方案二：分批次小量修改**
- 每次只修改少量内容（10-20行）
- 多次调用 strReplace 完成整体修改

**方案三：使用 fsWrite + fsAppend**
- 先用 fsWrite 创建文件基础结构
- 再用 fsAppend 分批追加内容

**最佳实践**:
- 大型数据文件按模块拆分（如按科目拆分题库）
- 保持单个文件在1000行以内
- 使用导入/导出机制组织代码

**涉及文件**:
- `MockQuestionData.ets` → 拆分出 `ConcreteQuestionsData.ets`

---

### 9. 文件结构损坏 - 函数结束后出现孤立代码

**错误信息**: 
- `';' expected`
- `Declaration or statement expected`
- `Cannot find name 'type'`
- `Cannot find name 'subjectId'`
- `Left side of comma operator is unused and has no side effects`

**原因**: 在使用工具追加或修改大型数据文件时，可能导致函数已经正确结束（`];` 和 `}`），但后面又出现了孤立的代码块（如重复的题目对象），这些代码不在任何函数内部，导致编译器无法识别。

**错误示例**:
```typescript
// ❌ 错误结构
export function getQuestions(timestamp: number): Question[] {
  return [
    { id: 'q_001', type: QuestionType.SINGLE, ... },
    { id: 'q_002', type: QuestionType.SINGLE, ... }
  ];
}
    // 孤立代码 - 不在任何函数内！
    {
      id: 'q_003',
      type: QuestionType.SINGLE,  // 报错：Cannot find name 'type'
      subjectId: AppConstants.SUBJECT_XXX,  // 报错：Cannot find name 'subjectId'
      ...
    }
  ];
}
```

**正确结构**:
```typescript
// ✅ 正确结构
export function getQuestions(timestamp: number): Question[] {
  return [
    { id: 'q_001', type: QuestionType.SINGLE, ... },
    { id: 'q_002', type: QuestionType.SINGLE, ... },
    { id: 'q_003', type: QuestionType.SINGLE, ... }  // 所有题目都在数组内
  ];
}
// 文件结束，没有孤立代码
```

**诊断方法**:
1. 查看错误行号，通常在文件末尾附近
2. 检查函数的 `];` 和 `}` 是否提前出现
3. 查找是否有重复的题目ID

**解决方案**:
1. 定位到错误行号附近
2. 找到函数正确的结束位置（`];` 和 `}`）
3. 删除结束位置之后的所有孤立代码
4. 如果孤立代码是需要的题目，将其移动到数组内部

**预防措施**:
- 追加内容前先检查文件末尾结构
- 使用 `fsAppend` 时确保追加位置正确
- 大文件修改后立即运行诊断检查
- 保持题目ID唯一，避免重复

**涉及文件**:
- `MechanicalElectricalQuestionsData4.ets`

---

### 10. 题目ID重复导致数据显示异常

**错误现象**: 
- 题库分类页面显示某些科目题目数量为0
- 实际已添加大量题目数据，但界面不显示
- 数据库插入时部分数据被跳过

**原因**: 数据库使用题目ID作为主键，当多个数据文件中存在相同ID的题目时，后插入的数据会因主键冲突而失败，导致题目数量统计异常。

**错误示例**:
```typescript
// ❌ 错误 - ID重复

// MockQuestionData.ets 中的原始题目
function getMetalStructureQuestions(timestamp: number): Question[] {
  return [
    { id: 'metal_001', ... },  // ID: metal_001
    { id: 'metal_002', ... },
  ];
}

// MetalStructureQuestionsData.ets 中的扩展题目
export function getMetalStructureQuestions1(timestamp: number): Question[] {
  return [
    { id: 'metal_001', ... },  // ❌ ID重复！会导致插入失败
    { id: 'metal_002', ... },  // ❌ ID重复！
  ];
}
```

**正确写法**:
```typescript
// ✅ 正确 - 使用不同的ID前缀或编号

// MockQuestionData.ets - 原始少量题目（可保留或删除）
function getMetalStructureQuestions(timestamp: number): Question[] {
  return [
    { id: 'metal_base_001', ... },  // 使用 metal_base_ 前缀
    { id: 'metal_base_002', ... },
  ];
}

// MetalStructureQuestionsData.ets - 扩展题目
export function getMetalStructureQuestions1(timestamp: number): Question[] {
  return [
    { id: 'metal_001', ... },  // ✅ 不同ID
    { id: 'metal_002', ... },
  ];
}

// 或者直接删除原始少量题目，只保留扩展数据文件
```

**诊断方法**:
1. 检查界面显示的题目数量是否与预期一致
2. 搜索相同ID前缀的题目定义：`grep -r "id: 'metal_001'" --include="*.ets"`
3. 检查数据库插入日志，查看是否有主键冲突错误

**解决方案**:

**方案一：删除重复的原始数据（推荐）**
```typescript
// MockQuestionData.ets
// 删除 getMetalStructureQuestions 和 getMechanicalElectricalQuestions 函数
// 只保留对扩展数据文件的导入和调用

// 006 金属结构 - 只使用扩展数据文件
// questions.push(...getMetalStructureQuestions(now));  // 删除这行
questions.push(...getMetalStructureQuestions1(now));
questions.push(...getMetalStructureQuestions2(now));
// ...
```

**方案二：重命名ID避免冲突**
```typescript
// 将原始数据的ID改为不同前缀
{ id: 'metal_base_001', ... }  // 原始数据
{ id: 'metal_001', ... }       // 扩展数据
```

**方案三：强制重新初始化数据库**
```typescript
// 在应用启动时强制重新初始化
await initMockQuestions(true);  // forceReinit = true
```

**涉及文件**:
- `MockQuestionData.ets` - 包含原始少量题目
- `MetalStructureQuestionsData.ets` - 金属结构扩展题目（ID冲突）
- `MechanicalElectricalQuestionsData.ets` - 机械电气扩展题目

**本次问题具体情况**:
| 科目 | 原始函数 | 扩展函数 | ID冲突 |
|------|----------|----------|--------|
| 金属结构 | `getMetalStructureQuestions()` | `getMetalStructureQuestions1()` | `metal_001` ~ `metal_004` |
| 机械电气 | `getMechanicalElectricalQuestions()` | `getMechanicalElectricalQuestions1()` | `mech_001` ~ `mech_004` vs `mech_e_001`（无冲突） |
| 量测 | `getMeasurementQuestions()` | `getSurveyMeasurementQuestions()` | `measure_001` ~ `measure_003` vs `survey_001`（无冲突） |

**修复步骤**:
1. 删除 `MockQuestionData.ets` 中的 `getMetalStructureQuestions` 函数
2. 删除 `MockQuestionData.ets` 中的 `getMechanicalElectricalQuestions` 函数
3. 删除 `getMockQuestions()` 中对这两个函数的调用
4. 清除应用数据或强制重新初始化数据库
5. 重新运行应用验证题目数量

---

## 参考资料

- [ArkTS 语言规范](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-overview-0000001774279614-V3)
- [ArkTS 与 TypeScript 差异](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/typescript-to-arkts-migration-guide-0000001774119994-V3)

---

**文档版本**: v1.4
**更新时间**: 2024-12-19


---

### 10. 题库分类显示数据异常 - 题目数量为0或不正确

**问题现象**: 
- 题库分类页面显示某些科目题目数量为0（如"金属结构 共0题"、"机械电气 共0题"）
- 或者显示的题目数量与实际添加的题目数量不符

**根本原因**: 题目ID重复导致数据库插入失败

**详细分析**:

1. **ID重复场景**:
   - `MockQuestionData.ets` 中定义了基础题目函数 `getMetalStructureQuestions()` 和 `getMechanicalElectricalQuestions()`
   - 同时又导入了扩展数据文件 `MetalStructureQuestionsData.ets` 中的 `getMetalStructureQuestions1()`
   - 两个文件中都使用了相同的ID（如 `metal_001`、`metal_002` 等）

2. **数据库行为**:
   - 数据库的 `questions` 表中 `id` 字段是主键
   - 当插入重复ID的记录时，插入操作会失败
   - 由于是批量插入，后续的题目可能也受影响

**错误示例**:
```typescript
// MockQuestionData.ets 中的基础函数
function getMetalStructureQuestions(timestamp: number): Question[] {
  return [
    { id: 'metal_001', ... },  // ID: metal_001
    { id: 'metal_002', ... },
  ];
}

// MetalStructureQuestionsData.ets 中的扩展函数
export function getMetalStructureQuestions1(timestamp: number): Question[] {
  return [
    { id: 'metal_001', ... },  // ID重复！
    { id: 'metal_002', ... },  // ID重复！
  ];
}

// getMockQuestions() 中同时调用两者
questions.push(...getMetalStructureQuestions(now));      // 先插入
questions.push(...getMetalStructureQuestions1(now));     // ID重复，插入失败
```

**解决方案**:

**方案一：删除重复的基础函数（推荐）**
```typescript
// 删除 MockQuestionData.ets 中的 getMetalStructureQuestions() 和 getMechanicalElectricalQuestions()
// 只保留扩展数据文件中的函数

// getMockQuestions() 中只调用扩展函数
// questions.push(...getMetalStructureQuestions(now));  // 删除这行
questions.push(...getMetalStructureQuestions1(now));
questions.push(...getMetalStructureQuestions2(now));
// ...
```

**方案二：重命名ID避免冲突**
```typescript
// 如果需要保留基础函数，修改其中的ID
function getMetalStructureQuestions(timestamp: number): Question[] {
  return [
    { id: 'metal_base_001', ... },  // 使用不同的ID前缀
    { id: 'metal_base_002', ... },
  ];
}
```

**方案三：合并数据到单一来源**
```typescript
// 将所有题目数据统一放在扩展文件中
// 删除 MockQuestionData.ets 中的重复定义
```

**诊断方法**:
1. 搜索重复的ID定义：
   ```
   grep -r "id: 'metal_001'" entry/src/main/ets/data/
   grep -r "id: 'mech_001'" entry/src/main/ets/data/
   ```
2. 检查 `getMockQuestions()` 函数中是否同时调用了基础函数和扩展函数
3. 查看数据库日志，确认是否有插入失败的记录

**预防措施**:
- 建立ID命名规范：`{科目缩写}_{文件编号}_{序号}`，如 `metal_1_001`、`metal_2_001`
- 新增数据文件时检查ID是否与现有数据冲突
- 定期运行ID唯一性检查脚本
- 在数据初始化时添加重复ID检测日志

**涉及文件**:
- `MockQuestionData.ets` - 包含重复的基础函数定义
- `MetalStructureQuestionsData.ets` - 扩展数据文件
- `MechanicalElectricalQuestionsData.ets` - 扩展数据文件

**修复步骤**:
1. 删除 `MockQuestionData.ets` 中的 `getMetalStructureQuestions()` 函数
2. 删除 `MockQuestionData.ets` 中的 `getMechanicalElectricalQuestions()` 函数
3. 删除 `getMockQuestions()` 中对这两个函数的调用
4. 清除应用数据，重新初始化题库
5. 验证各科目题目数量显示正确

---

**文档版本**: v1.4
**更新时间**: 2024-12-19
