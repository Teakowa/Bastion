# Event Template

按类型替换 `<TYPE>`、`<TYPE_NUM>`、`<TYPE_ENUM>`、`<ENUM_NAME>`、`<ID>`、`<PACK>`、`<PARAMS...>`。

先改枚举，再改 config/effects。

## 0. 枚举模板（`src/constants/event_ids_*.opy`）

```opy
enum <TYPE_ENUM>:
    ...
    <ENUM_NAME>
    # sentinel only for integrity checks (do not register as an event)
    COUNT
```

要求：

1. 新项必须插入在 `COUNT` 之前。
2. 不要改动已有枚举顺序。

## A. 常量模板（`src/constants/event_constants.opy`）

```opy
# --- <TYPE> ID <ID>: <NAME> ---
#!define EVT_<TYPE>_<ID>_DURATION 30
#!define EVT_<TYPE>_<ID>_WEIGHT 1

#!define EVT_<TYPE>_<ID>_<PARAM_1> 0
#!define EVT_<TYPE>_<ID>_<PARAM_2> 0
```

## B. 本地化模板（`src/locales/zh-CN.opy` + `src/locales/en-US.opy`）

```opy
#!define STR_EVT_<TYPE>_<ID>_TITLE "<TITLE>"
#!define STR_EVT_<TYPE>_<ID>_DESC "<DESC_WITH_{0}>"
```

## C. 事件配置模板（`src/config/eventConfig*.opy`）

```opy
# Pack <PACK>: <TYPE>
<arrayName>[<TYPE_ENUM>.<ENUM_NAME>] = [
    STR_EVT_<TYPE>_<ID>_TITLE,
    STR_EVT_<TYPE>_<ID>_DESC.format(<PARAMS...>),
    EVT_<TYPE>_<ID>_DURATION,
    EVT_<TYPE>_<ID>_WEIGHT
]
<arrayIdName>.append(<TYPE_ENUM>.<ENUM_NAME>)
```

映射：

1. Buff: `<TYPE_ENUM>=BuffEventId`, `<arrayName>=buffEvent`, `<arrayIdName>=buffEventId`
2. Debuff: `<TYPE_ENUM>=DebuffEventId`, `<arrayName>=debuffEvent`, `<arrayIdName>=debuffEventId`
3. Mech: `<TYPE_ENUM>=MechEventId`, `<arrayName>=mechEvent`, `<arrayIdName>=mechEventId`

## D. 效果规则模板（`src/events/effects/*.opy`）

```opy
rule "[VishkarEvent]: <NAME>":
    @Event eachPlayer
    @Team 1
    @Condition all([dlcVishkarEvent, eventPlayer.hasSpawned(), eventPlayer.eventType == <TYPE_NUM>, eventPlayer.eventId == <TYPE_ENUM>.<ENUM_NAME>]) == true

    # 先做轻量条件与初始化
    wait(getAverageServerLoad() / 100 * 0.032)

    # 事件主逻辑

    wait(eventPlayer.eventDuration)

    # 清理与收尾
    eventPlayer.mod_speed_event = 0
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()
    clearEventEffect()
```

## E. 类型映射

1. Buff: `<TYPE>=BUFF`, `<TYPE_NUM>=0`, `<TYPE_ENUM>=BuffEventId`
2. Debuff: `<TYPE>=DEBUFF`, `<TYPE_NUM>=1`, `<TYPE_ENUM>=DebuffEventId`
3. Mech: `<TYPE>=MECH`, `<TYPE_NUM>=2`, `<TYPE_ENUM>=MechEventId`
