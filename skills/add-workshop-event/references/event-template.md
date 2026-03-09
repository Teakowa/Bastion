# Event Template

按类型替换 `<TYPE>`、`<TYPE_NUM>`、`<TYPE_ENUM>`、`<ENUM_NAME>`、`<ID>`、`<PACK>`、`<PARAMS...>`。

## 1) 顺序模板（必须按序）

1. 枚举：`src/constants/event_ids_*.opy`（新增项必须在 `COUNT` 之前）
2. 常量：`src/constants/event_constants.opy`
3. 本地化：`src/locales/zh-CN.opy` + `src/locales/en-US.opy`
4. 配置：`src/config/eventConfig.opy` + `src/config/eventConfigDev.opy`
5. 规则：`src/events/effects/*.opy`

## 2) 核心片段

枚举：

```opy
enum <TYPE_ENUM>:
    ...
    <ENUM_NAME>
    # sentinel only for integrity checks (do not register as an event)
    COUNT
```

配置：

```opy
<arrayName>[<TYPE_ENUM>.<ENUM_NAME>] = [
    STR_EVT_<TYPE>_<ID>_TITLE,
    STR_EVT_<TYPE>_<ID>_DESC.format(<PARAMS...>),
    EVT_<TYPE>_<ID>_DURATION,
    EVT_<TYPE>_<ID>_WEIGHT
]
<arrayIdName>.append(<TYPE_ENUM>.<ENUM_NAME>)
```

规则条件：

```opy
@Condition all([dlcVishkarEvent, eventPlayer.hasSpawned(), eventPlayer.eventType == <TYPE_NUM>, eventPlayer.eventId == <TYPE_ENUM>.<ENUM_NAME>]) == true
```

## 3) 验证命令

```bash
rg -n '<TYPE_ENUM>\.<ENUM_NAME>|STR_EVT_(BUFF|DEBUFF|MECH)_<ID>|EVT_(BUFF|DEBUFF|MECH)_<ID>|eventType ==' src/config src/events src/locales src/constants
rg -n 'enum BuffEventId|enum DebuffEventId|enum MechEventId|COUNT' src/constants/event_ids_*.opy
rg -n 'eventConfigDev|eventConfig\.|append\(' src/config/eventConfig*.opy
```

## 4) 可检查收尾清单

1. 规则含 `eventType` + `eventId` 双条件。
2. 使用动作区判断时有显式 `wait(...)`。
3. 收尾重置玩家状态并清理事件效果。
