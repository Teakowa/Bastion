---
name: add-workshop-title
description: 为 Bastion Overwatch Workshop 项目新增或调整称号（TITLE 枚举、allTitle 文本与颜色、玩家称号数据库、地图称号映射）的专用流程。Use when user asks to add a new title, assign a title to players, wire map title rewards, or update title-related docs in this repository while preserving enum/index stability.
---

# Add Workshop Title

按最小改动执行；禁止重排已有 `TITLE` 枚举和历史数据顺序。

## 1) 判定变更类型

1. 新增通用称号（新增可授予称号）
2. 给特定玩家授予称号（`player_database`）
3. 给地图奖励链路接入称号（`DATA_*` 宏）
4. 调整称号显示文案/颜色（`allTitle`）

## 2) 修改主数据文件（必做）

文件：`src/title/title-cn.opy`

1. 在 `enum TITLE:` 末尾追加新枚举，保持既有顺序与索引不变。
2. 在 `rule "initialize title array"` 的 `allTitle = [...]` 中新增同索引条目，确保“枚举索引 == allTitle 索引”。
3. 若称号应全局可分配，同步加入 `TP_ALL`。
4. 若称号仅定向授予，不加入 `TP_ALL`，只写入对应玩家的 `titles`。
5. 颜色策略：
- `null`：由 `title/init.opy` 的开发者彩虹逻辑接管。
- `vect(r, g, b)` 或 `heroColor[n]`：固定颜色。
- 颜色数组：渐变轮换（`title/init.opy` 已支持）。

## 3) 可选：玩家与地图授予

仍在 `src/title/title-cn.opy`：

1. 玩家授予：在目标玩家的 `titles` 数组追加 `TITLE.<NEW_NAME>`。
2. 地图授予：修改对应 `DATA_<MAP>` 宏中的 pioneer/conqueror/dominator 槽位（通常用 `playerNameToIndexDelimited(...)`）。
3. 仅在必要时改 `MapTITLEKey`；不要改已有键值映射。

## 4) 双入口一致性检查

只检查，不轻易修改：

1. `src/main.opy` 是否仍 include `title/title-cn.opy` 与 `title/init.opy`
2. `src/devMain.opy` 是否仍 include `title/title-cn.opy` 与 `title/init.opy`
3. 不重排 include 顺序

## 5) 文档同步

若新增了称号规则或授予策略，更新：

1. `docs/modules/08-player-effects-title.md`

## 6) 提交前核对清单

1. 未重排 `TITLE` 现有项。
2. 新枚举在 `allTitle` 中有且只有一个对应条目。
3. `TP_ALL` 与“全局/定向授予”策略一致。
4. 若改 `DATA_*`，三个槽位语义未错位。
5. 无无关格式化与重排。

## 7) 快速自检命令

```bash
rg -n "enum TITLE|TITLE\\.<NEW_NAME>|initialize title array|TP_ALL|player_database|DATA_" src/title/title-cn.opy
rg -n "title/title-cn\\.opy|title/init\\.opy" src/main.opy src/devMain.opy
```

样板片段见 [references/title-template.md](references/title-template.md)。
