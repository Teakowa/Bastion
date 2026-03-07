# Title Change Templates

## 1) Append title in JSON source

Keep existing order untouched; append at the end of `data/title-source.json -> titles`.

```json
{
  "key": "NEW_TITLE_NAME",
  "label": "新称号文案",
  "category": "活动限定",
  "condition": "达成条件描述",
  "availability": "active",
  "displayExpr": "\"新称号文案\"",
  "colorExpr": "heroColor[12]"
}
```

Gradient color example:

```json
{
  "displayExpr": "\"新称号文案\"",
  "colorExpr": "[vect(255, 0, 0), vect(255, 255, 0), vect(0, 255, 255)]"
}
```

Dev rainbow example (`null` means color is driven in `title/init.opy`):

```json
{
  "displayExpr": "\"新称号文案\"",
  "colorExpr": "null"
}
```

## 2) Targeted player grant in JSON source

Append title key to `players[*].titleKeys`:

```json
{
  "name": "玩家名",
  "titleKeys": ["CHALLENGER_LEGEND", "NEW_TITLE_NAME"]
}
```

Rule: keep `players` order stable; add new players only at the end.

## 3) Map reward data snippet (.opy remains manual)

```opy
#!define DATA_MAP_NAME [ \
   playerNameToIndexDelimited(["A"], "-"), \
   playerNameToIndexDelimited(["A", "B"], "-"), \
   playerNameToIndexDelimited(["A", "B", "C"], "-") \
]
```

## 4) Sync and checks

```bash
pnpm run sync:title-data
pnpm run test:title-data-sync
rg -n "AUTO-GENERATED TITLE ENUM|AUTO-GENERATED TITLE PLAYER DATABASE|AUTO-GENERATED ALL_TITLE|DATA_" src/title/title-cn.opy
rg -n "\"key\":|\"titleKeys\":" data/title-source.json
```
