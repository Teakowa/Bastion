---
name: grant-player-title
description: 为 Bastion Overwatch Workshop 项目发放玩家称号的专用流程，支持通用称号与地图专属称号。Use when requests involve granting TITLE.* to players through data/title-source.json and updating map title datasets (DATA_* with PIONEER/CONQUEROR/DOMINATOR).
---

# Grant Player Title

按顺序执行，保持最小改动，避免无关重排。

## 1) 收集输入

1. 玩家名（一个或多个）
2. 通用称号列表（`TITLE.*`）
3. 地图专属称号列表：地图数据宏（`DATA_*`）+ 键位（`PIONEER`/`CONQUEROR`/`DOMINATOR`）

## 2) 读取并确认现状

1. 读取 `data/title-source.json`，确认：
- `titles[*].key`
- `players[*].name`
- `players[*].titleKeys`
2. 读取 `src/title/title-cn.opy`，仅确认以下区块存在自动生成标记：
- `# BEGIN/END AUTO-GENERATED TITLE ENUM`
- `# BEGIN/END AUTO-GENERATED TITLE PLAYER DATABASE`
- `# BEGIN/END AUTO-GENERATED ALL_TITLE`
3. 读取 `src/utilities/system/setPlayerTitle.opy`，确认地图称号合并逻辑：
- `MapTITLEKey.PIONEER = 0`
- `MapTITLEKey.CONQUEROR = 1`
- `MapTITLEKey.DOMINATOR = 2`

## 3) 处理玩家不存在场景（必做）

1. 如果玩家名不在 `data/title-source.json` 的 `players` 中：
- 仅在 `players` 数组末尾追加新玩家对象。
- 新玩家默认 `titleKeys` 放入本次请求中的通用称号 key；如果没有通用称号，使用空数组 `[]`。
2. 玩家顺序即索引语义，禁止重排既有玩家。
3. 不直接编辑 `src/title/title-cn.opy` 的受管区块。

## 4) 发放通用称号

1. 在 `data/title-source.json` 目标玩家的 `titleKeys` 中追加请求称号 key（不带 `TITLE.` 前缀）。
2. 保持唯一性，避免重复 key。
3. 不移除历史称号，除非用户明确要求。

## 5) 发放地图专属称号

1. 在 `src/title/title-cn.opy` 的对应 `DATA_<MAP>` 宏里更新对应索引列表：
- 索引 `0` -> `PIONEER`
- 索引 `1` -> `CONQUEROR`
- 索引 `2` -> `DOMINATOR`
2. 使用 `playerNameToIndexDelimited([...], "-")` 维护玩家名列表。
3. 保持列表唯一；若玩家已存在则不重复添加。
4. 等级约束（必做）：
- `DOMINATOR` 高于 `CONQUEROR`：当玩家被加入索引 `2`（`DOMINATOR`）时，必须确保同一玩家也在索引 `1`（`CONQUEROR`）。
- 反向不成立：加入 `CONQUEROR` 时，不应自动加入 `DOMINATOR`，除非用户明确要求。

## 6) 同步生成（必做）

修改 `data/title-source.json` 或 `src/title/title-cn.opy` 的地图宏后，执行：

```bash
pnpm run sync:title-data
```

## 7) 校验

运行：

```bash
pnpm run test:title-data-sync
rg -n "name: \"<PLAYER>\"|DATA_<MAP>|MapTITLEKey" src/title/title-cn.opy src/utilities/system/setPlayerTitle.opy
rg -n "\"name\": \"<PLAYER>\"|\"titleKeys\"" data/title-source.json
```

再做人工校验：

1. 新增玩家是否只追加在 `data/title-source.json` 的 `players` 末尾。
2. `src/title/title-cn.opy` 受管区块是否仍由自动生成标记包裹。
3. 地图专属称号是否落在正确的 `DATA_*` 索引位置。
4. 若本次新增了 `DOMINATOR`，对应玩家是否也已出现在同图的 `CONQUEROR` 列表中。

## 8) 交付说明

回复时明确：

1. 新增了哪些玩家。
2. 每个玩家新增了哪些通用称号。
3. 每张地图新增了哪些地图专属称号（含 `PIONEER`/`CONQUEROR`/`DOMINATOR`）。
4. 是否已执行 `pnpm run sync:title-data` 与 `pnpm run test:title-data-sync`。
