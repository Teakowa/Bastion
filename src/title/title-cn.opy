#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

#!define playerNameToIndex(names) __script__("../tools/playerNameToIndex.js")
#!define playerNameToIndexDelimited(names, sep) __script__("../tools/playerNameToIndexDelimited.js")

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
    HACKING,             # 43 开了
    RED_PACKET,         # 44 红包收藏家
    GOOD_LUCK,          # 45 好运来
    LONE_WALKER,        # 46 千里独行
    GREEN_MOUNTAIN,     # 47 踏遍青山
    SUAN_BU_LA          # 48 我不会放过你的酸不辣

enum MapTitleKey:
  PIONEER = 0
  CONQUEROR = 1
  DOMINATOR = 2

# ------------------------------
# 2. 定义玩家数据 (Database)
# 注意：Key (name, titles) 必须不加引号，否则 splitDictArray 会报错
# ------------------------------
#!define TP_ALL [Title.PIONEER, Title.TEST_LONG, Title.NOT_MY_MAP, Title.WILD_DEV, Title.ARCHITECT, Title.MAINTAINER, Title.THREE_IN_ONE, Title.BLACK_SHEEP, Title.PURE_HARM, Title.CONQUEROR, Title.DOMINATOR, Title.SURVIVOR_EXPERT, Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.DODGE_ULTIMATE, Title.LIGHT_PACK, Title.FLAWLESS, Title.NEVER_GIVE_UP, Title.PERSEVERANCE, Title.SPEEDRUN, Title.DODGE_GOD, Title.ZENYATTA, Title.HARD_TO_KILL, Title.WIN_HEAVEN, Title.IDOL, Title.EGG_FIRST, Title.EAT_MORE, Title.ALL_IN_ONE, Title.TRAVELER, Title.SKY, Title.FLAME, Title.PASS_EGGS, Title.CHOSEN, Title.LUCKY_STAR, Title.GAMBLE_KING, Title.LUCKY_SHINE, Title.UNLUCKY, Title.MANBA, Title.MY_FATE, Title.GOD_GAMBLER, Title.LAO_DA, Title.V_50, Title.STEEL, Title.HACKING, Title.SUAN_BU_LA, Title.RED_PACKET, Title.GOOD_LUCK, Title.LONE_WALKER, Title.GREEN_MOUNTAIN ]
#!define player_database [ \
    { \
        name: "他又", \
        titles: TP_ALL \
    }, \
    { \
        name: "别感冒", \
        titles: TP_ALL \
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
        titles: [Title.CHALLENGER_LEGEND, Title.FLAWLESS, Title.NEVER_GIVE_UP, Title.TRAVELER_HELL, Title.SPEEDRUN, Title.HARD_TO_KILL, Title.LIGHT_PACK, Title.DODGE_ULTIMATE, Title.FLAWLESS, Title.ALL_IN_ONE, Title.TRAVELER, Title.SKY, Title.CHOSEN, Title.LUCKY_STAR, Title.LUCKY_SHINE, Title.HACKING, Title.MANBA] \
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
        titles: [Title.FLAWLESS, Title.CHALLENGER_LEGEND, Title.NEVER_GIVE_UP, Title.SPEEDRUN, Title.TRAVELER_HELL, Title.HARD_TO_KILL, Title.DODGE_ULTIMATE, Title.EGG_FIRST, Title.GOOD_LUCK, Title.UNLUCKY] \
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
        titles: [Title.SPEEDRUN, Title.FLAWLESS, Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL, Title.ALL_IN_ONE, Title.TRAVELER, Title.SKY, Title.LUCKY_STAR, Title.MANBA,Title.HACKING, Title.UNLUCKY,] \
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
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.SPEEDRUN, Title.HARD_TO_KILL, Title.HACKING, Title.UNLUCKY] \
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
    }, \
    { \
        name: "旅店老板", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL] \
    }, \
    { \
        name: "谁能体谅我的雨天", \
        titles: [Title.CHALLENGER_LEGEND, Title.HARD_TO_KILL] \
    }, \
    { \
        name: "锄禾日当午", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL, Title.HACKING, Title.LUCKY_STAR] \
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
# 暴雪世界
#!define DATA_BLIZZARD_WORLD [\
   [], \
   playerNameToIndexDelimited(["他又","吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","雨鸢","EruIluvatar","糯米进脑子","Augenstern"], "-"), \
   playerNameToIndexDelimited(["他又","吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","雨鸢","EruIluvatar","糯米进脑子","Augenstern"], "-")\
]

# 多拉多
#!define DATA_DORADO [ \
   [], \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","卖核弹的小女孩","看啊情","眼镜小宅","初一吖","EruIluvatar","糯米进脑子","明月有时"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","卖核弹的小女孩","看啊情","眼镜小宅","初一吖","EruIluvatar","糯米进脑子","明月有时"], "-")\
]

# 艾兴瓦尔德
#!define DATA_EICHENWALDE [ \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","眼镜小宅","初一吖","锦木千束"], "-"), \
   playerNameToIndexDelimited(["顾北酒笙","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","挽风","看啊情","眼镜小宅","初一吖","锦木千束","她说话有股孩子气","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["顾北酒笙","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","锦木千束","EruIluvatar"], "-")\
]

# 直布罗陀
#!define DATA_WATCHPOINT_GIBRALTAR [ \
   [], \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","EruIluvatar"], "-")\
]

#哈瓦那
#!define DATA_HAVANA [ \
   [], \
   playerNameToIndexDelimited(["他又","别感冒","顾北酒笙","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["他又","别感冒","顾北酒笙","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-")\
]

# 好莱坞
#!define DATA_HOLLYWOOD [ \
   [], \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","糯米进脑子","EruIluvatar","锄禾日当午"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","糯米进脑子","EruIluvatar","锄禾日当午"], "-")\
]

# 月球基地
#!define DATA_HORIZON_LUNAR_COLONY [ \
   [], \
   playerNameToIndexDelimited(["烛台与南九","顾北酒笙","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢"], "-"), \
   playerNameToIndexDelimited(["烛台与南九","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢"], "-")\
]

# 渣客镇
#!define DATA_JUNKERTOWN [ \
   [], \
   playerNameToIndexDelimited(["WildRage","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","看啊情","眼镜小宅","初一吖","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["WildRage","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","看啊情","眼镜小宅","初一吖","EruIluvatar"], "-")\
]

# 国王大道
#!define DATA_KINGS_ROW [ \
   [], \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar","一痕沙"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-")\
]

# 中城
#!define DATA_MIDTOWN [ \
   [], \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","雨鸢","EruIluvatar","糯米进脑子"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","雨鸢","EruIluvatar","糯米进脑子"], "-")\
]

# 努巴尼
#!define DATA_NUMBANI [ \
   [], \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar","旅店老板"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar","旅店老板"], "-")\
]

# 帕拉伊苏
#!define DATA_PARAISO [ \
   [], \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar","谁能体谅我的雨天"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-")\
]

# 巴黎
#!define DATA_PARIS [ \
   [], \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","她说话有股孩子气","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","她说话有股孩子气","EruIluvatar"], "-")\
]

# 里阿尔托
#!define DATA_RIALTO [ \
   playerNameToIndexDelimited(["草艮","寒霜冰湮","Cold","豆本豆豆奶"], "-"), \
   playerNameToIndexDelimited(["草艮","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar","糯米进脑子"], "-"), \
   playerNameToIndexDelimited(["草艮","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar","糯米进脑子"], "-")\
]

# 66号公路
#!define DATA_ROUTE66 [ \
   [], \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","锄禾日当午"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","锄禾日当午"], "-")\
]

# 香巴里寺院
#!define DATA_SHAMBALI_MONASTERY [ \
   playerNameToIndexDelimited(["他又","别感冒"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-")\
]

# 阿努比斯神殿
#!define DATA_TEMPLE_OF_ANUBIS [ \
   playerNameToIndexDelimited(["吾携秋水揽星河","Cold","豆本豆豆奶","溪云初起日沉阁","看啊情"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","看啊情","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-")\
]

# 沃斯卡娅工业区
#!define DATA_VOLSKAYA [ \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","卖核弹的小女孩","眼镜小宅"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖"], "-")\
]

# 埃斯佩兰萨
#!define DATA_ESPERANCA [ \
   playerNameToIndexDelimited(["WildRage","尘风歌者","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","眼镜小宅"], "-"), \
   playerNameToIndexDelimited(["WildRage","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar","锄禾日当午"], "-"), \
   playerNameToIndexDelimited(["WildRage","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar","锄禾日当午"], "-")\
]

# 斗兽场
#!define DATA_COLOSSEO [ \
   playerNameToIndexDelimited(["Cold","豆本豆豆奶"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["他又","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-")\
]

# 鲁纳塞彼
#!define DATA_RUNASAPI [ \
   [], \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","EruIluvatar"], "-")\
]

# 新皇后街
#!define DATA_NEW_QUEEN_STREET [ \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","溪云初起日沉阁","眼镜小宅"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","Cold","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","Cold","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢"], "-")\
]

# 皇家赛道
#!define DATA_CIRCUIT_ROYAL [ \
   playerNameToIndexDelimited(["他又","别感冒"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","眼镜小宅","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","眼镜小宅","EruIluvatar"], "-")\
]

# 花村
#!define DATA_HANAMURA [ \
   playerNameToIndexDelimited(["尘风歌者","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","看啊情"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","看啊情","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","卖核弹的小女孩","看啊情","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-")\
]

# 伊利奥斯
#!define DATA_ILIOS [ \
   [], \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","别打老顾我啊","眼镜小宅","初一吖","蝎子莱莱","雨鸢","EruIluvatar","锄禾日当午"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","蝎子莱莱","雨鸢","EruIluvatar","锄禾日当午"], "-")\
]

# 漓江塔
#!define DATA_LIJIANG_TOWER [ \
   [], \
   playerNameToIndexDelimited(["草艮","烛台与南九","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","卖核弹的小女孩","水濑祈","看啊情","眼镜小宅","初一吖","我心飞扬","EruIluvatar","雨鸢","锄禾日当午"], "-"), \
   playerNameToIndexDelimited(["草艮","烛台与南九","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","卖核弹的小女孩","水濑祈","看啊情","眼镜小宅","初一吖","我心飞扬","EruIluvatar","雨鸢","锄禾日当午"], "-")\
]

# 萨摩亚
#!define DATA_SAMOA [ \
   [], \
   playerNameToIndexDelimited(["草艮","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","EruIluvatar","锄禾日当午"], "-"), \
   playerNameToIndexDelimited(["草艮","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","EruIluvatar","锄禾日当午"], "-")\
]

# 釜山
#!define DATA_BUSAN [ \
   playerNameToIndexDelimited(["草艮","顾北酒笙","WildRage","尘风歌者","吾携秋水揽星河"], "-"), \
   playerNameToIndexDelimited(["草艮","顾北酒笙","WildRage","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","EruIluvatar","糯米进脑子","半夜汽笛","雷个大憨憨"], "-"), \
   playerNameToIndexDelimited(["尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","EruIluvatar","糯米进脑子","半夜汽笛","雷个大憨憨"], "-")\
]

# 绿洲城
#!define DATA_OASIS [ \
   playerNameToIndexDelimited(["尘风歌者","豆本豆豆奶"], "-"), \
   playerNameToIndexDelimited(["WildRage","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar","锄禾日当午"], "-"), \
   playerNameToIndexDelimited(["WildRage","尘风歌者","吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar","锄禾日当午"], "-")\
]

# 新渣客城
#!define DATA_NEW_JUNK_CITY [ \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","溪云初起日沉阁","眼镜小宅"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","Cold","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-")\
]

# 尼泊尔
#!define DATA_NEPAL [ \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","溪云初起日沉阁","卖核弹的小女孩","眼镜小宅","初一吖","EruIluvatar"], "-")\
]

# 阿努比斯王座
#!define DATA_THRONE_OF_ANUBIS [ \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","初一吖","Jargon"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","Jargon","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","Jargon","EruIluvatar"], "-")\
]

# 花冈
#!define DATA_HANAOKA [ \
   [], \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","初一吖","雨鸢","EruIluvatar"], "-")\
]

# 苏拉瓦萨
#!define DATA_SURAVASA [ \
   playerNameToIndexDelimited(["他又","别感冒","吾携秋水揽星河","寒霜冰湮","卖核弹的小女孩","眼镜小宅","雨鸢","我想吃烤地瓜"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","雨鸢","我想吃烤地瓜","Augenstern","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","雨鸢","我想吃烤地瓜","Augenstern","EruIluvatar"], "-")\
]

# 阿育陀耶
#!define DATA_AYUTTHAYA [ \
   playerNameToIndexDelimited(["他又","别感冒"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","EruIluvatar"], "-"), \
   playerNameToIndexDelimited(["吾携秋水揽星河","寒霜冰湮","豆本豆豆奶","卖核弹的小女孩","眼镜小宅","EruIluvatar"], "-")\
]

# 阿特利斯
#!define DATA_AATLIS [\
   playerNameToIndexDelimited(["他又", "别感冒","卖核弹的小女孩"], "-"), \
   playerNameToIndexDelimited(["卖核弹的小女孩","EruIluvatar", "吾携秋水揽星河","初一吖"], "-"), \
   playerNameToIndexDelimited(["卖核弹的小女孩","EruIluvatar", "吾携秋水揽星河","初一吖"], "-"), \
]

# ------------------------------
# 4. 初始化变量
# ------------------------------
rule "initialize title array":
    wait(getAverageServerLoad() / 100 * 0.5)
    waitUntil(__currentMap___ != null, MAX_TIME)
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
        ["开了", heroColor[20]],
        # 44: 红包收藏家
        ["红包收藏家", Color.RED],
        ["好运来", breathGold], 
        # 46: LONE_WALKER (千里独行 - 独行侠风格，推荐使用旅行家同款或冷色调)
        ["千里独行", heroColor[33]], 
        # 47: GREEN_MOUNTAIN (踏遍青山 - 这里的青山建议用源氏绿或深绿)
        ["踏遍青山", vect(0, 200, 50)],
        # 48: SUAN_BU_LA (我不会放过你的酸不辣 - 特殊梗，配个显眼的颜色，如狂鼠炸弹色)
        ["我不会放过你的酸不辣", heroColor[18]]
    ]
    splitDictArray({
        name: titlePlayer,
        titles: playerTitleRelation
    }, player_database)
