---
name: add-workshop-event
description: 为 Bastion Overwatch Workshop 项目新增或调整随机事件（Buff/Debuff/Mech）的专用流程。Use when user asks to add a new event, change event type/category, register event constants, wire eventConfig/eventConfigDev, add or update zh-CN/en-US localization keys, and implement event behavior in effects rules while preserving main/devMain structure and server-load safety.
---

# Add Workshop Event

按以下顺序执行，保持最小改动，不做无关重排。

## 1) 判定事件类型与归属

1. 先确认事件类型：`Buff=eventType 0`、`Debuff=eventType 1`、`Mech=eventType 2`。
2. 先确认事件包（Pack）与开关策略：
- 生产配置：[`src/config/eventConfig.opy`](../../src/config/eventConfig.opy)
- 开发配置：[`src/config/eventConfigDev.opy`](../../src/config/eventConfigDev.opy)
3. 在同类型下分配未占用 ID，保持数组索引与 ID 一致。

快速检查命令：

```bash
rg -n "eventType == [012]|buffEvent\[|debuffEvent\[|mechEvent\[|STR_EVT_(BUFF|DEBUFF|MECH)_<ID>" src/events src/config src/locales
```

## 2) 添加常量（必做）

在 [`src/constants/event_constants.opy`](../../src/constants/event_constants.opy) 增加该事件的常量定义，至少包含：

1. `EVT_<TYPE>_<ID>_DURATION`
2. `EVT_<TYPE>_<ID>_WEIGHT`
3. 该事件行为参数常量（如速度、伤害、半径、间隔等）
4. 可视化/音效常量（如需要）

命名规则：

1. Buff 参数前缀：`EVT_<ID>_...` 或 `EVT_BUFF_<ID>_...`（与现有风格保持一致）
2. Debuff 参数前缀：`EVT_DEBUFF_<ID>_...`
3. Mech 参数前缀：`EVT_MECH_<ID>_...`

## 3) 添加本地化文案（必做）

同步更新：

1. [`src/locales/zh-CN.opy`](../../src/locales/zh-CN.opy)
2. [`src/locales/en-US.opy`](../../src/locales/en-US.opy)

新增键：

1. `STR_EVT_<TYPE>_<ID>_TITLE`
2. `STR_EVT_<TYPE>_<ID>_DESC`

要求：

1. `DESC` 占位符顺序与 `.format(...)` 参数严格一致。
2. `zh-CN` 与 `en-US` 都必须存在对应键。
3. 避免只改一种语言导致编译期或运行期文案缺失。

## 4) 注册事件配置（必做）

在两个配置文件都注册事件，确保主线/开发行为一致：

1. [`src/config/eventConfig.opy`](../../src/config/eventConfig.opy)
2. [`src/config/eventConfigDev.opy`](../../src/config/eventConfigDev.opy)

为对应类型数组加入条目并 append ID：

1. Buff: `buffEvent[ID] = [TITLE, DESC, DURATION, WEIGHT]` + `buffEventId.append(ID)`
2. Debuff: `debuffEvent[ID] = [...]` + `debuffEventId.append(ID)`
3. Mech: `mechEvent[ID] = [...]` + `mechEventId.append(ID)`

注意：

1. `eventConfig.opy` 与 `eventConfigDev.opy` 的开关粒度不同，保持该文件原有风格，不要强行统一结构。
2. 若只改一个配置文件，必须在回复中明确原因。

## 5) 实现事件效果规则（按类型）

在对应文件新增规则（或扩展已有规则）：

1. Buff: [`src/events/effects/buffEffects.opy`](../../src/events/effects/buffEffects.opy)
2. Debuff: [`src/events/effects/debuffEffects.opy`](../../src/events/effects/debuffEffects.opy)
3. Mech: [`src/events/effects/mechEffects.opy`](../../src/events/effects/mechEffects.opy)

规则条件必须包含类型 + ID：

```opy
@Condition all([dlcVishkarEvent, eventPlayer.hasSpawned(), eventPlayer.eventType == <TYPE_NUM>, eventPlayer.eventId == <ID>]) == true
```

实现时执行以下收尾原则：

1. 结束时重置玩家修饰变量（如 `mod_speed_event`、`mod_dmg_taken`、`heal_recv` 等）。
2. 销毁已创建效果实体（常用 `clearEventEffect()` 或 `destroyEffect(...)`）。
3. 需要循环时必须有 `wait(...)`。
4. 重计算前优先快速条件短路，避免高频昂贵表达式。

## 6) 双入口一致性检查

入口文件默认已 include `eventConfig*` 和三个 `events/effects/*`，通常不需要新增 include。

只做检查：

1. [`src/main.opy`](../../src/main.opy)
2. [`src/devMain.opy`](../../src/devMain.opy)

确认没有因新增事件破坏既有 include 顺序。

## 7) 提交前核对清单

1. 常量是否已定义并命名一致。
2. `zh-CN` 与 `en-US` 是否都存在 title/desc。
3. `eventConfig.opy` 与 `eventConfigDev.opy` 是否都注册了该事件。
4. 规则是否包含正确 `eventType` 与 `eventId`。
5. 所有新增循环是否包含合理 `wait`。
6. 收尾是否清理效果/状态，避免残留。

## 8) 快速自检命令

```bash
rg -n "EVT_(BUFF|DEBUFF|MECH)_<ID>|EVT_<ID>_|STR_EVT_(BUFF|DEBUFF|MECH)_<ID>|eventId == <ID>|eventType == <TYPE_NUM>" src
rg -n "buffEvent\[<ID>\]|debuffEvent\[<ID>\]|mechEvent\[<ID>\]" src/config
```

需要样板时，读取：[`skills/add-workshop-event/references/event-template.md`](references/event-template.md)
