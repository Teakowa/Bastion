---
name: grant-player-title
description: 为 Bastion Overwatch Workshop 项目发放玩家称号的专用流程，支持通用称号与地图专属称号。Use when requests involve granting TITLE.* to players and map title rewards through data/title-source.json.
---

# Grant Player Title

按顺序执行，保持最小改动，避免无关重排。

## 1) 触发条件

满足任一条件时使用：

1. 给玩家发放通用称号。
2. 给玩家发放地图专属称号（`PIONEER/CONQUEROR/DOMINATOR`）。
3. 玩家不存在，需要补入称号数据库。

## 2) 必改真源

唯一真源：`data/title-source.json`。

1. 玩家不存在时，只允许在 `players` 末尾追加。
2. 通用称号写入 `players[*].titleKeys`（去重、默认不移除历史）。
3. 地图称号写入 `mapTitles[*].holders` 对应槽位（去重）。
4. 禁止手改生成产物：`src/title/title-cn.opy`、`web/title-query/public/data/titles.json`。

关键约束：

1. 玩家顺序具索引语义，禁止重排。
2. `DOMINATOR` 高于 `CONQUEROR`：加入 `DOMINATOR` 时，必须确保同图同玩家已在 `CONQUEROR`。

## 3) 地图精通自动补发（地图专属发放后必做）

对本次涉及的玩家，基于 `data/title-source.json -> mapTitles[*].holders` 做条件检查并自动补发到 `players[*].titleKeys`：

1. 若玩家在全部地图都属于 `CONQUEROR`，补发 `ALL_IN_ONE`。
2. 若玩家在全部地图都属于 `DOMINATOR`，补发 `SKY`。
3. 仅在满足条件时补发，保持去重，不移除历史称号。

## 4) 生成/同步

必跑：

```bash
pnpm run sync:title-data
```

## 5) 验证

执行 [references/grant-template.md](references/grant-template.md) 中的检查命令，至少确认：

1. `test:title-data-sync` 通过。
2. 目标玩家、称号、地图槽位已同步到生成产物。
3. 自动生成区块标记完整。
4. 若本次发放了地图专属称号，已执行地图精通条件检查，并按条件补发 `ALL_IN_ONE` / `SKY`。

失败处理：

1. 若玩家未写入或写错槽位，回到 `data/title-source.json` 修正后重跑同步。
2. 若出现 `DOMINATOR` 子集约束失败，先补 `CONQUEROR` 再同步。

## 6) 交付说明

回复时必须列明：

1. 新增玩家（如有）。
2. 每个玩家新增通用称号。
3. 每张地图新增专属称号（含槽位）。
4. 地图精通称号自动补发结果（是否补发 `ALL_IN_ONE` / `SKY` 及依据）。
5. 已执行命令与结果。
