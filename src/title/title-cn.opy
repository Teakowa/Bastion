#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

# ------------------------------
# 1. 定义称号枚举 (Enums)
# ------------------------------
enum Title:
    PIONEER,            # 0 开拓者
    TEST_LONG,          # 1 长文本测试
    NOT_MY_MAP,         # 2 地图不是我做的
    WILD_DEV,           # 3 野生开发者
    ARCHITECT,          # 4 堡垒建筑师
    MAINTAINER,         # 5 友善的地图维护者
    THREE_IN_ONE,       # 6 三合一地图作者
    BLACK_SHEEP,        # 7 害群之马
    PURE_HARM,          # 8 纯害战士
    CONQUEROR,          # 9 征服者
    DOMINATOR,          # 10 主宰
    SURVIVOR_EXPERT,    # 11 专家幸存者
    CHALLENGER_LEGEND,  # 12 传奇挑战者
    TRAVELER_HELL,      # 13 地狱穿梭者
    DODGE_ULTIMATE,     # 14 终极闪避
    LIGHT_PACK,         # 15 轻装上阵
    FLAWLESS,           # 16 完美无缺
    NEVER_GIVE_UP,      # 17 永不言弃
    PERSEVERANCE,       # 18 坚韧不拔
    SPEEDRUN,           # 19 速通传奇
    DODGE_GOD,          # 20 闪避の神
    ZENYATTA,           # 21 智瞳开拓者
    HARD_TO_KILL,       # 22 大难不死
    WIN_HEAVEN,         # 23 胜天半子
    IDOL,               # 24 堡垒の偶像
    EGG_FIRST,          # 25 第一颗蛋
    EAT_MORE,           # 26 我还能吃
    ALL_IN_ONE,         # 27 万象归一
    TRAVELER,           # 28 守望旅行家
    SKY,                # 29 万域天穹
    FLAME,              # 30 狂暴烈焰
    PASS_EGGS,          # 31 万蛋丛中过
    CHOSEN,             # 32 天选之子
    LUCKY_STAR,         # 33 幸运星
    GAMBLE_KING,        # 34 赌王
    LUCKY_SHINE,        # 35 福星高照
    UNLUCKY,            # 36 倒霉蛋
    MANBA,              # 37 What can i say
    MY_FATE,            # 38 我命由我
    GOD_GAMBLER,        # 39 赌神
    LAO_DA,             # 40 牢 大
    V_50,               # 41 V我50
    STEEL,              # 42 钢门
    HACKING             # 43 开了

# ------------------------------
# 2. 定义玩家数据 (Database)
# 注意：Key (name, titles) 必须不加引号，否则 splitDictArray 会报错
# ------------------------------
#!define player_database [ \
    { \
        name: "他又", \
        titles: [Title.PIONEER, Title.TEST_LONG, Title.NOT_MY_MAP, Title.WILD_DEV, Title.ARCHITECT, Title.MAINTAINER, Title.THREE_IN_ONE, Title.BLACK_SHEEP, Title.PURE_HARM, Title.CONQUEROR, Title.DOMINATOR, Title.SURVIVOR_EXPERT, Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.DODGE_ULTIMATE, Title.LIGHT_PACK, Title.FLAWLESS, Title.NEVER_GIVE_UP, Title.PERSEVERANCE, Title.SPEEDRUN, Title.DODGE_GOD, Title.ZENYATTA, Title.HARD_TO_KILL, Title.WIN_HEAVEN, Title.IDOL, Title.EGG_FIRST, Title.EAT_MORE, Title.ALL_IN_ONE, Title.TRAVELER, Title.SKY, Title.FLAME, Title.PASS_EGGS, Title.CHOSEN, Title.LUCKY_STAR, Title.GAMBLE_KING, Title.LUCKY_SHINE, Title.UNLUCKY, Title.MANBA, Title.MY_FATE, Title.GOD_GAMBLER, Title.LAO_DA, Title.V_50, Title.STEEL, Title.HACKING] \
    }, \
    { \
        name: "别感冒", \
        titles: [Title.PIONEER, Title.TEST_LONG, Title.NOT_MY_MAP, Title.WILD_DEV, Title.ARCHITECT, Title.MAINTAINER, Title.THREE_IN_ONE, Title.BLACK_SHEEP, Title.PURE_HARM, Title.CONQUEROR, Title.DOMINATOR, Title.SURVIVOR_EXPERT, Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.DODGE_ULTIMATE, Title.LIGHT_PACK, Title.FLAWLESS, Title.NEVER_GIVE_UP, Title.PERSEVERANCE, Title.SPEEDRUN, Title.DODGE_GOD, Title.ZENYATTA, Title.HARD_TO_KILL, Title.WIN_HEAVEN, Title.IDOL, Title.EGG_FIRST, Title.EAT_MORE, Title.ALL_IN_ONE, Title.TRAVELER, Title.SKY, Title.FLAME, Title.PASS_EGGS, Title.CHOSEN, Title.LUCKY_STAR, Title.GAMBLE_KING, Title.LUCKY_SHINE, Title.UNLUCKY, Title.MANBA, Title.MY_FATE, Title.GOD_GAMBLER, Title.LAO_DA, Title.V_50, Title.STEEL, Title.HACKING] \
    }, \
    { \
        name: "草艮", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL] \
    }, \
    { \
        name: "烛台与南九", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.EGG_FIRST] \
    }, \
    { \
        name: "顾北酒笙", \
        titles: [Title.CHALLENGER_LEGEND, Title.FLAWLESS, Title.SPEEDRUN, Title.TRAVELER_HELL] \
    }, \
    { \
        name: "WildRage", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL, Title.EGG_FIRST] \
    }, \
    { \
        name: "尘风歌者", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.FLAWLESS, Title.PERSEVERANCE, Title.SPEEDRUN, Title.LIGHT_PACK, Title.DODGE_ULTIMATE, Title.HARD_TO_KILL, Title.EGG_FIRST, Title.PASS_EGGS] \
    }, \
    { \
        name: "吾携秋水揽星河", \
        titles: [Title.CHALLENGER_LEGEND, Title.FLAWLESS, Title.NEVER_GIVE_UP, Title.TRAVELER_HELL, Title.SPEEDRUN, Title.HARD_TO_KILL, Title.LIGHT_PACK, Title.DODGE_ULTIMATE, Title.FLAWLESS, Title.ALL_IN_ONE, Title.TRAVELER, Title.SKY, Title.CHOSEN, Title.LUCKY_STAR, Title.LUCKY_SHINE, Title.MANBA] \
    }, \
    { \
        name: "寒霜冰湮", \
        titles: [Title.CHALLENGER_LEGEND, Title.FLAWLESS, Title.NEVER_GIVE_UP, Title.TRAVELER_HELL, Title.SPEEDRUN, Title.HARD_TO_KILL, Title.LIGHT_PACK, Title.DODGE_ULTIMATE, Title.ALL_IN_ONE, Title.TRAVELER, Title.SKY, Title.LUCKY_STAR, Title.MANBA] \
    }, \
    { \
        name: "Cold", \
        titles: [Title.FLAWLESS, Title.NEVER_GIVE_UP, Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.SPEEDRUN, Title.HARD_TO_KILL, Title.LIGHT_PACK, Title.DODGE_ULTIMATE, Title.EGG_FIRST, Title.PASS_EGGS, Title.MANBA] \
    }, \
    { \
        name: "豆本豆豆奶", \
        titles: [Title.FLAWLESS, Title.CHALLENGER_LEGEND, Title.NEVER_GIVE_UP, Title.SPEEDRUN, Title.TRAVELER_HELL, Title.HARD_TO_KILL, Title.DODGE_ULTIMATE, Title.EGG_FIRST, Title.UNLUCKY] \
    }, \
    { \
        name: "神之岛風咲", \
        titles: [Title.FLAWLESS] \
    }, \
    { \
        name: "溪云初起日沉阁", \
        titles: [Title.SPEEDRUN, Title.FLAWLESS, Title.NEVER_GIVE_UP, Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL, Title.EGG_FIRST, Title.UNLUCKY] \
    }, \
    { \
        name: "卖核弹的小女孩", \
        titles: [Title.SPEEDRUN, Title.FLAWLESS, Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL, Title.ALL_IN_ONE, Title.TRAVELER, Title.SKY, Title.LUCKY_STAR, Title.MANBA] \
    }, \
    { \
        name: "挽风", \
        titles: [Title.LIGHT_PACK, Title.DODGE_ULTIMATE, Title.SPEEDRUN, Title.FLAWLESS, Title.CHALLENGER_LEGEND] \
    }, \
    { \
        name: "水濑祈", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL] \
    }, \
    { \
        name: "别打老顾我啊", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.FLAWLESS, Title.SPEEDRUN, Title.HARD_TO_KILL] \
    }, \
    { \
        name: "看啊情", \
        titles: [Title.CHALLENGER_LEGEND, Title.FLAWLESS, Title.TRAVELER_HELL, Title.HARD_TO_KILL] \
    }, \
    { \
        name: "眼镜小宅", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.DODGE_ULTIMATE, Title.LIGHT_PACK, Title.FLAWLESS, Title.SPEEDRUN, Title.HARD_TO_KILL, Title.LUCKY_STAR] \
    }, \
    { \
        name: "初一吖", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.FLAWLESS, Title.HARD_TO_KILL, Title.EGG_FIRST, Title.PASS_EGGS, Title.CHOSEN, Title.MANBA] \
    }, \
    { \
        name: "锦木千束", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.FLAWLESS] \
    }, \
    { \
        name: "她说话有股孩子气", \
        titles: [Title.CHALLENGER_LEGEND, Title.FLAWLESS, Title.SPEEDRUN] \
    }, \
    { \
        name: "白银之鹰", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.SPEEDRUN] \
    }, \
    { \
        name: "蝎子莱莱", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.FLAWLESS, Title.SPEEDRUN, Title.HARD_TO_KILL] \
    }, \
    { \
        name: "雨鸢", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL, Title.LUCKY_STAR, Title.UNLUCKY, Title.MANBA] \
    }, \
    { \
        name: "Jargon", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL] \
    }, \
    { \
        name: "我心飞扬", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL] \
    }, \
    { \
        name: "绿里奇迹", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.SPEEDRUN] \
    }, \
    { \
        name: "EruIluvatar", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.SPEEDRUN, Title.HARD_TO_KILL] \
    }, \
    { \
        name: "糯米进脑子", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.SPEEDRUN, Title.HARD_TO_KILL] \
    }, \
    { \
        name: "半夜汽笛", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL, Title.MANBA] \
    }, \
    { \
        name: "雷个大憨憨", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL] \
    }, \
    { \
        name: "一痕沙", \
        titles: [Title.CHALLENGER_LEGEND, Title.HARD_TO_KILL] \
    }, \
    { \
        name: "Augenstern", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL, Title.LUCKY_STAR] \
    }, \
    { \
        name: "明月有时", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL] \
    } \
]

# ------------------------------
# 3. 定义地图数据宏 (Map Macros)
# ------------------------------
# 称号包 (Title Packs)
#!define TP_CONQUEROR [Title.CONQUEROR]
#!define TP_9_10 [Title.CONQUEROR, Title.DOMINATOR]
#!define TP_9_10_0 [Title.CONQUEROR, Title.DOMINATOR, Title.PIONEER]
# 地图数据块 (Data Blocks)
#!define DATA_BLIZZARD_WORLD [ \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "糯米进脑子", titles: TP_9_10 }, \
    { name: "Augenstern", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
]

#!define DATA_DORADO [ \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "看啊情", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "糯米进脑子", titles: TP_9_10 }, \
    { name: "明月有时", titles: TP_9_10 }, \
    { name: "尘风歌者", titles: TP_9_10 }, \
]

#!define DATA_EICHENWALDE [ \
    { name: "尘风歌者", titles: TP_9_10_0 }, \
    { name: "顾北酒笙", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10_0 }, \
    { name: "挽风", titles: TP_CONQUEROR }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "看啊情", titles: TP_CONQUEROR }, \
    { name: "她说话有股孩子气", titles: TP_CONQUEROR }, \
    { name: "溪云初起日沉阁", titles: TP_9_10_0 }, \
    { name: "Cold", titles: TP_9_10_0 }, \
    { name: "豆本豆豆奶", titles: TP_9_10_0 }, \
    { name: "寒霜冰湮", titles: TP_9_10_0 }, \
    { name: "眼镜小宅", titles: TP_9_10_0 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10_0 }, \
    { name: "锦木千束", titles: TP_9_10_0 }, \
]

#!define DATA_WATCHPOINT_GIBRALTAR [ \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
]

#!define DATA_HAVANA [ \
    { name: "他又", titles: TP_9_10 }, \
    { name: "别感冒", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "顾北酒笙", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
]

#!define DATA_HOLLYWOOD [ \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "糯米进脑子", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
]

#!define DATA_HORIZON_LUNAR_COLONY [ \
    { name: "烛台与南九", titles: TP_9_10 }, \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "顾北酒笙", titles: TP_CONQUEROR }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
]

#!define DATA_JUNKERTOWN [ \
    { name: "WildRage", titles: TP_9_10 }, \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "看啊情", titles: TP_9_10 }, \
]

#!define DATA_KINGS_ROW [ \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "一痕沙", titles: TP_CONQUEROR }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
]

#!define DATA_MIDTOWN [ \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
]

#!define DATA_NUMBANI [ \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
]

#!define DATA_PARAISO [ \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
]

#!define DATA_PARIS [ \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "她说话有股孩子气", titles: TP_9_10 }, \
]

#!define DATA_RIALTO [ \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "草艮", titles: TP_9_10_0 }, \
    { name: "豆本豆豆奶", titles: TP_9_10_0 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "糯米进脑子", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10_0 }, \
    { name: "Cold", titles: TP_9_10_0 }, \
]

#!define DATA_ROUTE66 [ \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
]

#!define DATA_SHAMBALI_MONASTERY [ \
    { name: "他又", titles: [Title.PIONEER] }, \
    { name: "别感冒", titles: [Title.PIONEER] }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
]

#!define DATA_TEMPLE_OF_ANUBIS [ \
    { name: "豆本豆豆奶", titles: TP_9_10_0 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10_0 }, \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10_0 }, \
    { name: "Cold", titles: TP_9_10_0 }, \
    { name: "看啊情", titles: [Title.CONQUEROR, Title.PIONEER] }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
]

#!define DATA_VOLSKAYA [ \
    { name: "吾携秋水揽星河", titles: TP_9_10_0 }, \
    { name: "寒霜冰湮", titles: TP_9_10_0 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10_0 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10_0 }, \
]

#!define DATA_ESPERANCA [ \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10_0 }, \
    { name: "Cold", titles: TP_9_10_0 }, \
    { name: "豆本豆豆奶", titles: TP_9_10_0 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10_0 }, \
    { name: "WildRage", titles: TP_9_10_0 }, \
    { name: "尘风歌者", titles: TP_9_10_0 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10_0 }, \
]

#!define DATA_COLOSSEO [ \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10_0 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: [Title.DOMINATOR, Title.PIONEER] }, \
]

#!define DATA_RUNASAPI [ \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
]

#!define DATA_NEW_QUEEN_STREET [ \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10_0 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10_0 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10_0 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10_0 }, \
]

#!define DATA_CIRCUIT_ROYAL [ \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "他又", titles: [Title.PIONEER] }, \
    { name: "别感冒", titles: [Title.PIONEER] }, \
]

#!define DATA_HANAMURA [ \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10_0 }, \
    { name: "溪云初起日沉阁", titles: [Title.CONQUEROR, Title.PIONEER] }, \
    { name: "豆本豆豆奶", titles: TP_9_10_0 }, \
    { name: "寒霜冰湮", titles: TP_9_10_0 }, \
    { name: "尘风歌者", titles: TP_9_10_0 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "看啊情", titles: TP_9_10_0 }, \
]

#!define DATA_ILIOS [ \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "别打老顾我啊", titles: TP_CONQUEROR }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "蝎子莱莱", titles: TP_9_10 }, \
]

#!define DATA_LIJIANG_TOWER [ \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "水濑祈", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "草艮", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "烛台与南九", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "看啊情", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "我心飞扬", titles: TP_9_10 }, \
]

#!define DATA_SAMOA [ \
    { name: "尘风歌者", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "草艮", titles: TP_9_10 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
]

#!define DATA_BUSAN [ \
    { name: "草艮", titles: [Title.PIONEER, Title.CONQUEROR] }, \
    { name: "顾北酒笙", titles: [Title.PIONEER, Title.CONQUEROR] }, \
    { name: "WildRage", titles: [Title.PIONEER, Title.CONQUEROR] }, \
    { name: "尘风歌者", titles: TP_9_10_0 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10_0 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "糯米进脑子", titles: TP_9_10 }, \
    { name: "半夜汽笛", titles: TP_9_10 }, \
    { name: "雷个大憨憨", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
]

#!define DATA_OASIS [ \
    { name: "WildRage", titles: TP_9_10 }, \
    { name: "尘风歌者", titles: TP_9_10_0 }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10_0 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
]

#!define DATA_NEW_JUNK_CITY [ \
    { name: "吾携秋水揽星河", titles: TP_9_10_0 }, \
    { name: "寒霜冰湮", titles: TP_9_10_0 }, \
    { name: "Cold", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10_0 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10_0 }, \
]

#!define DATA_NEPAL [ \
    { name: "吾携秋水揽星河", titles: TP_9_10_0 }, \
    { name: "寒霜冰湮", titles: TP_9_10_0 }, \
    { name: "豆本豆豆奶", titles: TP_9_10_0 }, \
    { name: "溪云初起日沉阁", titles: TP_9_10_0 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10_0 }, \
]

#!define DATA_THRONE_OF_ANUBIS [ \
    { name: "吾携秋水揽星河", titles: TP_9_10_0 }, \
    { name: "寒霜冰湮", titles: TP_9_10_0 }, \
    { name: "豆本豆豆奶", titles: TP_9_10_0 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10_0 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "Jargon", titles: TP_9_10_0 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10_0 }, \
]

#!define DATA_HANAOKA [ \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "雨鸢", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "初一吖", titles: TP_9_10 }, \
]

#!define DATA_SURAVASA [ \
    { name: "他又", titles: [Title.PIONEER] }, \
    { name: "别感冒", titles: [Title.PIONEER] }, \
    { name: "吾携秋水揽星河", titles: TP_9_10_0 }, \
    { name: "寒霜冰湮", titles: TP_9_10_0 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10_0 }, \
    { name: "眼镜小宅", titles: TP_9_10_0 }, \
    { name: "雨鸢", titles: TP_9_10_0 }, \
    { name: "Augenstern", titles: TP_9_10 }, \
    { name: "绿里奇迹", titles: TP_9_10_0 }, \
]

#!define DATA_AYUTTHAYA [ \
    { name: "他又", titles: [Title.PIONEER] }, \
    { name: "别感冒", titles: [Title.PIONEER] }, \
    { name: "吾携秋水揽星河", titles: TP_9_10 }, \
    { name: "豆本豆豆奶", titles: TP_9_10 }, \
    { name: "卖核弹的小女孩", titles: TP_9_10 }, \
    { name: "眼镜小宅", titles: TP_9_10 }, \
    { name: "EruIluvatar", titles: TP_9_10 }, \
    { name: "寒霜冰湮", titles: TP_9_10 }, \
]

#!define DATA_AATLIS [ \
    { name: "他又", titles: [Title.PIONEER] }, \
    { name: "别感冒", titles: [Title.PIONEER] }, \
]


# ------------------------------
# 4. 初始化变量
# ------------------------------
# 通用称号变量
# globalvar titlePlayer
# globalvar playerTitleRelation
# globalvar allTitle

# 地图专属变量 (只存当前地图数据)
globalvar mtName
globalvar mtTitles


rule "initialize title array":
    wait(getServerLoad() / 100 * 0.5)
    waitUntil(__currentMap___ != null, 999999986991104.000)
    allTitle = [
        # 0: PIONEER
        ["{0}{1}".format(__currentMapPioneerText___ if __currentMapPioneerText___ != null else getCurrentMap(), __currentPioneerText___ if __currentPioneerText___ != null else "开拓者"), heroColor[12]],
        # 1: TEST_LONG
        ["这是一个超长的称号测试字段如果到这里还没有被截断说明确实很长你说得对但是广告位招租啊哈大OW是我的家乡", null],
        # 2: NOT_MY_MAP
        ["地图不是我做的", null],
        # 3: WILD_DEV
        ["野生开发者", null],
        # 4: ARCHITECT
        ["堡垒建筑师", null],
        # 5: MAINTAINER
        ["友善的地图维护者", null],
        # 6: THREE_IN_ONE
        ["三合一地图作者", null],
        # 7: BLACK_SHEEP
        ["害群之马", null],
        # 8: PURE_HARM
        ["纯害战士", null],
        # 9: CONQUEROR
        ["{0}征服者".format(__currentMapText___ if __currentMapText___ != null else getCurrentMap()), heroColor[43]],
        # 10: DOMINATOR
        ["{0}主宰".format(__currentMapText___ if __currentMapText___ != null else getCurrentMap()), heroColor[44]],
        # 11: SURVIVOR_EXPERT
        ["专家幸存者", vect(236, 153, 0)],
        # 12: CHALLENGER_LEGEND
        ["传奇挑战者", vect(200, 0, 19)],
        # 13: TRAVELER_HELL
        ["地狱穿梭者", vect(161, 73, 197)],
        # 14: DODGE_ULTIMATE
        ["终极闪避", heroColor[1]],
        # 15: LIGHT_PACK
        ["轻装上阵", heroColor[2]],
        # 16: FLAWLESS
        ["完美无缺", vect(0, 230, 151)],
        # 17: NEVER_GIVE_UP
        ["永不言弃", vect(0, 230, 151)],
        # 18: PERSEVERANCE
        ["坚韧不拔", vect(255, 255, 255)],
        # 19: SPEEDRUN
        ["速通传奇", vect(0, 230, 151)],
        # 20: DODGE_GOD
        ["闪避の神", heroColor[28]],
        # 21: ZENYATTA
        ["智瞳开拓者", heroColor[12]],
        # 22: HARD_TO_KILL
        ["大难不死", heroColor[45]],
        # 23: WIN_HEAVEN
        ["胜天半子", breathOrange],
        # 24: IDOL
        ["堡垒の偶像", vect(200, 0, 19)],
        # 25: EGG_FIRST
        ["第一颗蛋", vect(200, 0, 19)],
        # 26: EAT_MORE
        ["我还能吃", vect(238, 75, 43)],
        # 27: ALL_IN_ONE
        ["万象归一", breathRed],
        # 28: TRAVELER
        ["守望旅行家", heroColor[33]],
        # 29: SKY
        ["万域天穹", breathPurple],
        # 30: FLAME
        ["狂暴烈焰", heroColor[28]],
        # 31: PASS_EGGS
        ["万蛋丛中过", heroColor[28]],
        # 32: CHOSEN
        ["天选之子", heroColor[11]],
        # 33: LUCKY_STAR
        ["幸运星", heroColor[3]],
        # 34: GAMBLE_KING
        ["赌王", breathGold],
        # 35: LUCKY_SHINE
        ["福星高照", heroColor[32]],
        # 36: UNLUCKY
        ["倒霉蛋", heroColor[22]],
        # 37: MANBA
        ["What can i say", heroColor[11]],
        # 38: MY_FATE
        ["我命由我", breathBlue],
        # 39: GOD_GAMBLER
        ["赌神", breathGold],
        # 40: LAO_DA
        [" 牢 大 ", null],
        # 41: V_50
        ["V我50", heroColor[37]],
        # 42: STEEL
        ["钢门", heroColor[11]],
        # 43: HACKING
        ["开了", heroColor[20]]
    ]
    splitDictArray({
        name: titlePlayer,
        titles: playerTitleRelation
    }, player_database)

    # 5.2 初始化通用玩家数据
    splitDictArray({
        name: titlePlayer,
        titles: playerTitleRelation
    }, player_database)
    
    # 5.3 动态加载当前地图专属数据
    # 使用 switch 只加载对应地图的数据到 mtName 和 mtTitles
    switch getCurrentMap():
        case Map.BLIZZ_WORLD:
        case 1228:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_BLIZZARD_WORLD)
            break
        case Map.DORADO:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_DORADO)
            break
        case Map.EICHENWALDE:
        case 565:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_EICHENWALDE)
            break
        case Map.WATCHPOINT_GIBRALTAR:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_WATCHPOINT_GIBRALTAR)
            break
        case Map.HAVANA:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_HAVANA)
            break
        case Map.HOLLYWOOD:
        case 1505:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_HOLLYWOOD)
            break
        case Map.HORIZON_LUNAR_COLONY:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_HORIZON_LUNAR_COLONY)
            break  
        # 渣客镇
        case Map.JUNKERTOWN:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_JUNKERTOWN)
            break
            
        # 国王大道 (普通版 + 节日版 ID 742)
        case Map.KINGS_ROW:
        case 742:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_KINGS_ROW)
            break
        # 中城
        case Map.MIDTOWN:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_MIDTOWN)
            break
            
        # 努巴尼
        case Map.NUMBANI:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_NUMBANI)
            break
            
        # 帕拉伊苏
        case Map.PARAISO:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_PARAISO)
            break
        # 巴黎
        case Map.PARIS:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_PARIS)
            break
            
        # 里阿尔托
        case Map.RIALTO:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_RIALTO)
            break
            
        # 66号公路
        case Map.ROUTE66:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_ROUTE66)
            break
        # 香巴里寺院
        case Map.SHAMBALI_MONASTERY:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_SHAMBALI_MONASTERY)
            break
        # 阿努比斯神殿
        case Map.TEMPLE_OF_ANUBIS:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_TEMPLE_OF_ANUBIS)
            break
            
        # 沃斯卡娅
        case Map.VOLSKAYA:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_VOLSKAYA)
            break

        # 埃斯佩兰萨 (包含节日版 ID 276)
        case Map.ESPERANCA:
        case 276:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_ESPERANCA)
            break
            
        # 斗兽场 (包含节日版 ID 2147)
        case Map.COLOSSEO:
        case 2147:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_COLOSSEO)
            break
            
        # 鲁纳塞彼 (包含节日版 ID 8048)
        case Map.RUNASAPI:
        case 8048:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_RUNASAPI)
            break
            
        # 新皇后街
        case Map.NEW_QUEEN_STREET:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_NEW_QUEEN_STREET)
            break
            
        # 皇家赛道
        case Map.CIRCUIT_ROYAL:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_CIRCUIT_ROYAL)
            break
            
        # 花村 (包含 ID 1848 和 冬季版)
        case Map.HANAMURA:
        case 1848:
        case Map.HANAMURA_WINTER:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_HANAMURA)
            break
        # 伊利奥斯
        case Map.ILIOS:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_ILIOS)
            break
            
        # 漓江塔 (包含节日版 ID 3676)
        case Map.LIJIANG_TOWER:
        case 3676:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_LIJIANG_TOWER)
            break
            
        # 萨摩亚 (包含节日版 ID 13628)
        case Map.SAMOA:
        case 13628:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_SAMOA)
            break
            
        # 釜山
        case Map.BUSAN:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_BUSAN)
            break
            
        # 绿洲城
        case Map.OASIS:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_OASIS)
            break
            
        # 新渣客城 (包含节日版 ID 3099)
        case Map.NEW_JUNK_CITY:
        case 3099:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_NEW_JUNK_CITY)
            break
            
        # 尼泊尔
        case Map.NEPAL:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_NEPAL)
            break
            
        # 阿努比斯王座 (包含 ID 886)
        case Map.THRONE_OF_ANUBIS:
        case 886:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_THRONE_OF_ANUBIS)
            break
            
        # 花冈 (ID 2601)
        case Map.HANAOKA:
        case 2601:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_HANAOKA)
            break
            
        # 苏拉瓦萨
        case Map.SURAVASA:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_SURAVASA)
            break
            
        # 阿育陀耶 (包含 ID 1826)
        case Map.AYUTTHAYA:
        case 1826:
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_AYUTTHAYA)
            break
        case Map.AATLIS: 
            splitDictArray({ name: mtName, titles: mtTitles }, DATA_AATLIS)
            break
        default:
            # 如果是其他地图，或者没有配置称号，保持数组为空
            mtName = []
            mtTitles = []
            break