# Title Change Templates

## 1) Append enum item

Keep existing order untouched; append at the end of `enum TITLE`.

```opy
enum TITLE:
    ...
    GREEN_MOUNTAIN,     # 47
    SUAN_BU_LA,         # 48
    NEW_TITLE_NAME      # 49
```

## 2) Add `allTitle` entry at matching index

```opy
# 49: NEW_TITLE_NAME
["新称号文案", heroColor[12]]
```

Gradient color example:

```opy
["新称号文案", [vect(255, 0, 0), vect(255, 255, 0), vect(0, 255, 255)]]
```

Dev rainbow example (`null` means color is driven in `title/init.opy`):

```opy
["新称号文案", null]
```

## 3) Global vs targeted grant

Global grant (add into `TP_ALL`):

```opy
#!define TP_ALL [ ..., TITLE.NEW_TITLE_NAME ]
```

Targeted grant (do not touch `TP_ALL`):

```opy
{
    name: "玩家名",
    titles: [TITLE.CHALLENGER_LEGEND, TITLE.NEW_TITLE_NAME]
}
```

## 4) Map reward data snippet

```opy
#!define DATA_MAP_NAME [ \
   playerNameToIndexDelimited(["A"], "-"), \
   playerNameToIndexDelimited(["A", "B"], "-"), \
   playerNameToIndexDelimited(["A", "B", "C"], "-") \
]
```

## 5) Quick checks

```bash
rg -n "enum TITLE|NEW_TITLE_NAME|initialize title array|TP_ALL|player_database|DATA_" src/title/title-cn.opy
rg -n "title/title-cn\\.opy|title/init\\.opy" src/main.opy src/devMain.opy
```
