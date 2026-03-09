# Grant Template

## 1) 输入模板

```md
玩家:
- <PLAYER_A>
- <PLAYER_B>

通用称号:
- TITLE.<TITLE_KEY_1>
- TITLE.<TITLE_KEY_2>

地图称号:
- map: <DATA_MAP_KEY>
  PIONEER: [<PLAYER_A>]
  CONQUEROR: [<PLAYER_A>, <PLAYER_B>]
  DOMINATOR: [<PLAYER_A>]
```

规则：

1. `TITLE.` 前缀仅用于请求文本，写入 JSON 时使用裸 key。
2. `DOMINATOR` 必须是同图 `CONQUEROR` 子集。

## 2) 验证命令

```bash
pnpm run sync:title-data
pnpm run test:title-data-sync
rg -n 'AUTO-GENERATED TITLE ENUM|AUTO-GENERATED TITLE PLAYER DATABASE|AUTO-GENERATED MAP_TITLE_DATA|AUTO-GENERATED ALL_TITLE' src/title/title-cn.opy
rg -n '"players"|"titleKeys"|"mapTitles"|"holders"' data/title-source.json web/title-query/public/data/titles.json
```

## 3) 失败排查

1. 玩家未生效：检查 `data/title-source.json -> players[*].name` 是否精确匹配。
2. 地图槽位异常：检查 `mapKey` 是否正确且槽位名必须为 `PIONEER/CONQUEROR/DOMINATOR`。
3. 同步后仍不一致：回到真源修复后重跑 `sync:title-data`，不要手改生成产物。
