# 随机事件抽取重构实施计划（统一事件池 + 玩家临时事件组）

## Summary
- 目标是把“先抽类别再抽事件”重构为“统一事件池一次抽取”。
- 保持现有宏观类别占比（Buff/Debuff/Mech 约 45/35/20）。
- 新增玩家级临时可抽事件白名单，且仅对下一次抽取生效。
- 保持效果层契约不变，继续对外输出 `eventType + eventId`，避免大规模回归。

## Current Mechanism Baseline
- 抽取入口：`src/events/allocation/assignPlayerEvent.opy` 调用 `setPlayerEvent()`。
- 类别抽取：`src/utilities/event_core/setPlayerEvent.opy` 用 `categoryRoll` 划分 0~45 / 46~80 / 81~100。
- 类内抽样：`src/events/allocation/rejectSampling.opy` 最多 8 轮拒绝采样，条件 `uniform(0,eventWeight) < weight`。
- 效果执行：`src/events/effects/buffEffects.opy`、`debuffEffects.opy`、`mechEffects.opy` 强依赖 `eventType`。
- 隐性问题：`eventLastId` 仅按 ID 去重，跨类别可能误排除相同数字 ID。

## Public Interfaces / Data Changes
- 新增全局统一池：`allEventKey`（key 编码：`type * 100 + id`）。
- 新增玩家变量：
- `eventLastKey`：记录上次事件唯一键，替代仅 `eventLastId` 去重。
- `eventTempPoolKeys`：玩家临时白名单事件键列表。
- `eventTempPoolActive`：临时白名单启用标记。
- 保留现有字段与对外行为：
- `eventType`、`eventId`、`eventName`、`eventDesc`、`eventDuration` 不改契约。
- `eventForceRoll` / `eventForceCount` 保留兼容作弊链。

## Detailed Implementation
1. 统一池构建
- 在 `src/config/eventConfig.opy` 与 `src/config/eventConfigDev.opy` 末尾新增 `allEventKey` 构建。
- 继续保留并维护 `buffEvent/debuffEvent/mechEvent` 与各自 `*EventId` 列表，避免影响现有效果层与调试工具。

2. 候选池计算
- 基础候选来自 `allEventKey`，过滤条件为“配置存在且权重 > 0”。
- 排除 `eventLastKey`，实现跨类别正确去重。
- 若 `eventForceRoll` 有效，先映射为类别过滤（Buff 或 Debuff 或 Mech）。
- 若 `eventTempPoolActive`，将候选池与 `eventTempPoolKeys` 取交集。

3. 候选为空兜底顺序
- 第一步：放宽临时白名单过滤。
- 第二步：放宽强制类别过滤。
- 第三步：放宽 lastKey 过滤，确保永不卡死。

4. 一次抽取算法（统一池）
- 对候选按类型汇总 `sumW[type]`。
- 目标类别占比固定：
- Buff: `46/101`
- Debuff: `35/101`
- Mech: `20/101`
- 计算每个候选的有效权重：`w_eff = rawW * targetShare[type] / sumW[type]`。
- 使用累计权重随机一次抽中 `eventKey`。
- 解析 `type/id` 后回填玩家事件字段，并进入现有效果执行链。

5. 状态更新与一次性临时池
- 抽取成功后写入 `eventLastKey` 与原 `eventLastId`（兼容显示）。
- `eventCount` 与 `eventLucky` 继续按 `eventType` 更新，保持成就逻辑稳定。
- `eventTempPoolActive` 与 `eventTempPoolKeys` 在本次抽取后立即清空（仅下一次生效）。
- `clearPlayerEvent()` 增加兜底清理，防止异常中断后的临时状态泄漏。

6. 关联修补
- 调整 `src/utilities/dev_support/devTool.opy` 中“上一个事件”显示，不再固定从 `buffEvent[eventLastId]` 读取。
- 更新 `docs/modules/03-events-system.md` 中“类别概率与抽样”与“玩家态数据结构”描述。

## Test Cases
- 运行 `./tools/check_locale_keys.sh`，确认 locale 引用完整性。
- 运行 `pnpm run build`，确保 `main` 与 `devMain` 同时通过。
- 抽样统计验证：长样本下类别分布接近 46/35/20。
- 功能验证：
- 连续抽样去重不再出现跨类别误排除异常。
- `eventForceRoll` 行为与现版本一致。
- 玩家临时白名单仅影响一次抽取。
- 多玩家并发时白名单互不影响。
- 回归验证：
- 三类效果规则触发不变。
- `eventCount/eventLucky` 驱动的成就（33/36/37）不回归。
- 作弊链成就（43）不回归。

## Assumptions
- 本次只重构抽取层，不改效果规则层业务逻辑。
- 统一池仅作为抽样内部实现，不改变玩法层读取方式。
- `eventForceRoll/eventForceCount` 保留，后续可单独迭代为更语义化字段。
