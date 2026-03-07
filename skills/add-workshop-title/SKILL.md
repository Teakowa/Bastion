---
name: add-workshop-title
description: 为 Bastion Overwatch Workshop 项目新增或调整称号（TITLE 枚举、allTitle 文本与颜色、玩家称号数据库、地图称号映射）的专用流程。Use when user asks to add a new title, assign a title to players, wire map title rewards, or update title-related docs while preserving enum/index stability via data/title-source.json.
---

# Add Workshop Title

按最小改动执行；禁止重排已有称号与玩家顺序。

## 1) 判定变更类型

1. 新增通用称号（新增可授予称号）
2. 给特定玩家授予称号（`data/title-source.json` 的 `players/titleKeys`）
3. 给地图奖励链路接入称号（`data/title-source.json` 的 `mapTitles`）
4. 调整称号显示文案/颜色（`data/title-source.json` 的 `displayExpr/colorExpr`）

## 2) 修改真源文件（必做）

文件：`data/title-source.json`

1. 新增称号：在 `titles` 末尾追加对象，保证既有顺序不变。
2. 必填字段：`key`、`label`、`category`、`condition`、`availability`、`displayExpr`、`colorExpr`。
3. 若称号需要定向发放：在目标玩家 `titleKeys` 里追加对应 `key`。
4. 若包含地图奖励：修改目标 `mapTitles[*].holders` 对应槽位。
5. 玩家顺序即索引语义：新增玩家只允许追加到 `players` 末尾，禁止重排。

颜色策略（写入 `colorExpr`）：
- `null`：由 `title/init.opy` 的开发者彩虹逻辑接管
- `vect(r, g, b)` 或 `heroColor[n]`：固定颜色
- 颜色数组：渐变轮换（`title/init.opy` 已支持）

## 3) 同步生成（必做）

```bash
pnpm run sync:title-data
```

## 4) 双入口一致性检查

只检查，不轻易修改：

1. `src/main.opy` 是否仍 include `title/title-cn.opy` 与 `title/init.opy`
2. `src/devMain.opy` 是否仍 include `title/title-cn.opy` 与 `title/init.opy`
3. 不重排 include 顺序

## 5) 文档同步

若新增了称号规则或授予策略，更新：

1. `docs/modules/08-player-effects-title.md`

## 6) 提交前核对清单

1. `data/title-source.json` 中旧 `titles/players/mapTitles` 顺序未被重排。
2. 新称号字段完整，`key` 唯一。
3. 若改地图奖励，`DOMINATOR` 持有者均在同图 `CONQUEROR` 槽位内。
4. `src/title/title-cn.opy` 受管区块存在自动生成标记（含 MAP_TITLE_DATA）。
5. 无无关格式化与重排。

## 7) 快速自检命令

```bash
pnpm run sync:title-data
pnpm run test:title-data-sync
rg -n "AUTO-GENERATED TITLE ENUM|AUTO-GENERATED TITLE PLAYER DATABASE|AUTO-GENERATED MAP_TITLE_DATA|AUTO-GENERATED ALL_TITLE|DATA_" src/title/title-cn.opy
rg -n "\"key\":|\"players\":|\"titleKeys\":|\"mapTitles\":|\"holders\":" data/title-source.json
rg -n "title/title-cn\.opy|title/init\.opy" src/main.opy src/devMain.opy
```

样板片段见 [references/title-template.md](references/title-template.md)。
