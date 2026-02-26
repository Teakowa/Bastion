# 03. 事件系统（Vishkar Event）

## 模块组成

- 初始化：`src/events/init/detectFlag.opy`
- 配置：`src/config/eventConfig.opy`, `src/config/eventConfigDev.opy`
- 分配：`src/events/allocation/assignPlayerEvent.opy`
- 抽样：`src/events/allocation/rejectSampling.opy`
- 效果：`src/events/effects/buffEffects.opy`, `debuffEffects.opy`, `mechEffects.opy`
- 玩家态子程序：`utilities/setPlayerEvent.opy`, `clearPlayerEvent.opy`, `setEventDuration.opy`

## 生命周期

1. `detectFlag` 在开局一段时间后激活事件系统（debug 与正式阈值不同）
2. `initialize event array` 构建事件池数组与可抽取 ID 列表
3. `assignPlayerEvent` 对符合条件玩家按周期触发抽取
4. `setPlayerEvent` 决定类别并填充当前玩家事件数据
5. `rejectSampling` 在类别池内按权重抽样（最多 8 轮）
6. 事件效果规则在 `events/effects/*` 中执行
7. 到期后 `clearPlayerEvent` 清理状态与特效

## 事件数据结构

事件条目统一形态：

- `[title, desc, duration, weight]`

全局池：

- `buffEvent`, `debuffEvent`, `mechEvent`
- `buffEventId`, `debuffEventId`, `mechEventId`

玩家态：

- `eventId`, `eventLastId`, `eventType`, `eventDuration`, `eventDurationHud`
- `eventCount[3]`（各类别计数）
- `eventLucky`（幸运倾向累计）
- `eventForceRoll/eventForceCount`（强制类别调试与作弊链）

## 配置文件差异

### `eventConfig.opy`（生产）

- 偏向按「事件包」做开关
- 配置块结构清晰，批量启用/禁用更方便

### `eventConfigDev.opy`（开发）

- 对单个事件做更细粒度开关
- 调试/验证某个事件更高效

## 类别概率与抽样

在 `setPlayerEvent` 中：

- `0~45`：Buff
- `46~80`：Debuff
- `81~100`：Mech

`rejectSampling` 通过 `random.uniform(0, eventWeight) < 当前事件权重` 决策是否命中，高权重更易命中。

## 事件效果层设计

- `buffEffects.opy`：增益、任务、共生、回血/护甲/位移增强等
- `debuffEffects.opy`：减速、易伤、禁疗、技能连锁、共享伤害等
- `mechEffects.opy`：机制类变体（体型、反向移动、赌徒、作弊链等）

## 性能与稳定性点

- 大量 `eachPlayer` 规则中采用 `wait(...)`、`waitUntil(...)`、短路条件。
- 清理逻辑统一走 `clearPlayerEvent()`，减少状态泄漏。
- 数值更新统一走 `updatePlayerStats()`，避免重复写 setXxx。

## 扩展步骤（推荐）

1. 在 `event_constants.opy` 新增参数
2. 在 `locales/*.opy` 增加标题/描述
3. 在 `config/eventConfig*.opy` 注入条目与开关
4. 在 `events/effects/*` 增加规则实现
5. 在 `clearPlayerEvent` 核对是否有新状态需回收
6. 在 `devMain.opy` 用单事件开关做回归验证
