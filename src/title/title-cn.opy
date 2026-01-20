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
    }, \
    { \
        name: "旅店老板", \
        titles: [Title.CHALLENGER_LEGEND, Title.TRAVELER_HELL, Title.HARD_TO_KILL] \
    }, \
    { \
        name: "谁能体谅我的雨天", \
        titles: [Title.CHALLENGER_LEGEND, Title.HARD_TO_KILL] \
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
#!define DATA_BLIZZARD_WORLD [ [], [0,7,8,10,13, 24,28, 29,33], [0,7,8,10,13, 24,28, 29,33]]

# 多拉多
#!define DATA_DORADO [[], [6, 7, 8, 9, 10, 13, 17, 18, 19, 28, 29, 34], [6, 7, 8, 9, 10, 13, 17, 18, 19, 28, 29, 34]]


# 艾兴瓦尔德
#!define DATA_EICHENWALDE [[6, 7, 8, 9, 10, 12, 18, 19, 20], [4, 6, 7, 8, 9, 10, 12, 13, 14, 17, 18, 19, 20, 21, 28], [4, 6, 7, 8, 9, 10, 12, 13, 18, 19, 20, 28]]

# 直布罗陀
#!define DATA_WATCHPOINT_GIBRALTAR [[], [6, 7, 8, 9, 10, 12, 13, 18, 19, 28], [6, 7, 8, 9, 10, 12, 13, 18, 19, 28]]

#哈瓦那
#!define DATA_HAVANA [[], [0, 1, 4, 6, 7, 8, 9, 10, 12, 13, 18, 19, 24], [0, 1, 4, 6, 7, 8, 9, 10, 12, 13, 18, 19, 24]]

# 好莱坞
#!define DATA_HOLLYWOOD [[], [7, 8, 10, 13, 18, 19, 24, 29], [7, 8, 10, 13, 18, 19, 24, 29]]


# 月球基地
#!define DATA_HORIZON_LUNAR_COLONY [[], [3, 4, 6, 7, 8, 9, 10, 12, 13, 18, 19, 24], [3, 6, 7, 8, 9, 10, 12, 13, 18, 19, 24]]


# 渣客镇
#!define DATA_JUNKERTOWN [[], [5, 6, 7, 8, 9, 10, 12, 13, 17, 18, 19], [5, 6, 7, 8, 9, 10, 12, 13, 17, 18, 19]]

# 国王大道
#!define DATA_KINGS_ROW [[], [6, 7, 8, 9, 10, 12, 13, 18, 19, 24, 28, 32], [6, 7, 8, 9, 10, 12, 13, 18, 19, 24, 28]]


# 中城
#!define DATA_MIDTOWN [[], [7, 8, 10, 13, 18, 24, 28, 29], [7, 8, 10, 13, 18, 24, 28, 29]]


# 努巴尼
#!define DATA_NUMBANI [[], [7, 8, 10, 13, 18, 19, 24, 28, 35], [7, 8, 10, 13, 18, 19, 24, 28, 35]]


# 帕拉伊苏
#!define DATA_PARAISO [[], [6, 7, 8, 9, 10, 12, 13, 18, 19, 24, 28, 36], [6, 7, 8, 9, 10, 12, 13, 18, 19, 24, 28]]

# 巴黎
#!define DATA_PARIS [[], [6, 7, 8, 9, 10, 13, 18, 19, 21], [6, 7, 8, 9, 10, 13, 18, 19, 21]]


# 里阿尔托
#!define DATA_RIALTO [[2, 8, 9, 10], [2, 6, 7, 8, 9, 10, 12, 13, 18, 19, 24, 28, 29], [2, 6, 7, 8, 9, 10, 12, 13, 18, 19, 24, 28, 29]]


# 66号公路
#!define DATA_ROUTE66 [[], [6, 7, 8, 9, 10, 12, 13, 18, 19, 24], [6, 7, 8, 9, 10, 12, 13, 18, 19, 24]]


# 香巴里寺院
#!define DATA_SHAMBALI_MONASTERY [[0, 1], [7, 8, 10, 13, 18, 19, 24, 28], [7, 8, 10, 13, 18, 19, 24, 28]]


# 阿努比斯神殿
#!define DATA_TEMPLE_OF_ANUBIS [[7, 9, 10, 12, 17], [6, 7, 8, 9, 10, 12, 13, 17, 18, 19, 24, 28], [6, 7, 8, 9, 10, 12, 13, 18, 19, 24, 28]]


# 沃斯卡娅工业区
#!define DATA_VOLSKAYA [[7, 8, 13, 18], [7, 8, 10, 13, 18, 19], [7, 8, 10, 13, 18, 19]]


# 埃斯佩兰萨
#!define DATA_ESPERANCA [[5, 6, 8, 9, 10, 12, 18], [5, 6, 7, 8, 9, 10, 12, 13, 18, 19, 24], [5, 6, 7, 8, 9, 10, 12, 13, 18, 19, 24]]


# 斗兽场
#!define DATA_COLOSSEO [[9, 10], [6, 7, 8, 9, 13, 18, 19, 24, 28], [0, 6, 7, 8, 9, 10, 13, 18, 19, 24, 28]]


# 鲁纳塞彼
#!define DATA_RUNASAPI [[], [6, 7, 8, 9, 10, 12, 13, 18, 19], [6, 7, 8, 9, 10, 12, 13, 18, 19]]


# 新皇后街
#!define DATA_NEW_QUEEN_STREET [[7, 8, 12, 18], [7, 8, 9, 12, 13, 18, 19, 24], [7, 8, 9, 12, 13, 18, 19, 24]]


# 皇家赛道
#!define DATA_CIRCUIT_ROYAL [[0, 1], [7, 8, 10, 18, 28], [7, 8, 10, 18, 28]]


# 花村
#!define DATA_HANAMURA [[6, 8, 9, 10, 12, 17], [6, 7, 8, 9, 10, 12, 13, 17, 18, 19, 24], [6, 7, 8, 9, 10, 13, 17, 18, 19, 24]]


# 伊利奥斯
#!define DATA_ILIOS [[], [6, 7, 8, 9, 10, 12, 13, 16, 18, 19, 23, 24, 28], [6, 7, 8, 9, 10, 12, 13, 18, 19, 23, 24, 28]]


# 漓江塔
#!define DATA_LIJIANG_TOWER [[], [2, 3, 6, 7, 8, 9, 10, 13, 15, 17, 18, 19, 26, 28], [2, 3, 6, 7, 8, 9, 10, 13, 15, 17, 18, 19, 26, 28]]


# 萨摩亚
#!define DATA_SAMOA [[], [2, 6, 7, 8, 9, 10, 12, 13, 18, 19], [2, 6, 7, 8, 9, 10, 12, 13, 18, 19]]


# 釜山
#!define DATA_BUSAN [[2, 4, 5, 6, 7], [2, 4, 5, 6, 7, 8, 9, 10, 12, 13, 18, 19, 28, 29, 30, 31], [6, 7, 8, 9, 10, 12, 13, 18, 19, 28, 29, 30, 31]]


# 绿洲城
#!define DATA_OASIS [[6, 10], [5, 6, 7, 8, 9, 10, 12, 13, 18, 19, 24, 28], [5, 6, 7, 8, 9, 10, 12, 13, 18, 19, 24, 28]]


# 新渣客城
#!define DATA_NEW_JUNK_CITY [[7, 8, 12, 18], [7, 8, 9, 10, 12, 13, 18, 19, 24, 28], [7, 8, 9, 10, 12, 13, 18, 19, 24, 28]]


# 尼泊尔
#!define DATA_NEPAL [[7, 8, 10, 12, 13], [7, 8, 10, 12, 13, 18, 19], [7, 8, 10, 12, 13, 18, 19]]


# 阿努比斯王座
#!define DATA_THRONE_OF_ANUBIS [[7, 8, 10, 13, 19, 25], [7, 8, 10, 13, 18, 19, 24, 25, 28], [7, 8, 10, 13, 18, 19, 24, 25, 28]]


# 花冈
#!define DATA_HANAOKA [[], [7, 8, 10, 13, 18, 19, 24, 28], [7, 8, 10, 13, 18, 19, 24, 28]]


# 苏拉瓦萨
#!define DATA_SURAVASA [[0, 1, 7, 8, 13, 18, 24, 27], [7, 8, 10, 13, 18, 24, 27, 33], [7, 8, 10, 13, 18, 24, 27, 33]]


# 阿育陀耶
#!define DATA_AYUTTHAYA [[0, 1], [7, 8, 10, 13, 18, 28], [7, 8, 10, 13, 18, 28]]


# 阿特利斯
#!define DATA_AATLIS [[0, 1], [], []]


# ------------------------------
# 4. 初始化变量
# ------------------------------
rule "initialize title array":
    wait(getAverageServerLoad() / 100 * 0.5)
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
        ["开了", heroColor[20]],
        # 44: 红包收藏家
        ["红包收藏家", Color.ROSE],
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
