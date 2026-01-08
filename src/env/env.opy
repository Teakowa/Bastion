#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "Initialize global variables":
    dlcVishkarEvent = createWorkshopSettingBool("2. DLC 扩展内容", "随机事件扩展包", true, 5)
    rebootTime = createWorkshopSettingFloat("1. 游戏", "自动重开时间间隔（小时）", 3.5, 1, 4) * 3600
    debugMode = createWorkshopSettingBool("1. 游戏", "Debug 模式", false, 5)
    hashTag = false if evalOnce(debugMode) else true
    bastionBotTargetPrefer = createWorkshopSettingEnum("1. 游戏", "AI 堡垒瞄准规则", 0, ["自动", "近距离优先", "低生命值优先"], 2)
    difficulty = createWorkshopSettingEnum("1. 游戏", "难度", 1, ["简单", "一般", "困难", "专家", "传奇", "地狱：无法跳过英雄"], 1)
    dmgReduction = createWorkshopSettingBool("1. 游戏", "全英雄威能充能", true, 4)
    bastionBotSeconFire = createWorkshopSettingBool("1. 游戏", "AI 堡垒使用榴弹（忽略难度）", false, 3)
    turnSpeedMultiplier = 4 + difficulty if difficulty < 4 else 10 * 0.8
    maxDeath = 5 * difficulty
    savedIndex = []
    savedHero = []
    savedDeaths = []
    savedIsWinner = []
    savedSkipCount = []
    savedJoinTime = []
    devList = ["他又", "别感冒"]
    devPlayer = []
    mapTitleRelation = []
    obstrucVis = []

rule "Update devPlayer from devList":
    @Event playerJoined
    @Team 1
    @Condition "{0}".format(eventPlayer) in devList == true
    @Condition "{0}".format(eventPlayer) in devPlayer == false
    
    devPlayer.append(eventPlayer)


rule "Update targetPlayer when player left":
    @Event playerLeft
    @Team 1
    
    wait(getServerLoad() / 100 * 0.032)
    targetPlayerIndex = 0
    targetPlayer = sorted(getPlayers(Team.1), lambda player: player.joinTime)[0]


rule "initialize color array":
    rgbList = [vect(255, 0, 0), vect(255, 165, 0), vect(255, 255, 0), vect(0, 255, 0), vect(0, 0, 255), vect(75, 0, 130), vect(238, 130, 238)]
    wait(getServerLoad() / 100 * 0.032)
    breathRed = [vect(238, 75, 43), vect(233, 116, 81), vect(210, 43, 43), vect(220, 20, 60), vect(255, 36, 0), vect(255, 50, 50), vect(255, 0, 0)]
    breathPurple = [vect(161, 73, 197), vect(93, 63, 211), vect(218, 112, 214), vect(112, 41, 99), vect(191, 64, 191), vect(204, 204, 255), vect(128, 0, 128)]
    breathBlue = [vect(85, 178, 204), vect(120, 200, 225), vect(160, 220, 240), vect(25, 80, 120), vect(45, 125, 165), vect(200, 235, 245), vect(230, 245, 250)]
    breathOrange = [vect(250, 121, 0), vect(255, 140, 0), vect(255, 220, 180), vect(255, 160, 50), vect(255, 200, 150), vect(255, 180, 100), vect(230, 105, 0)]
    breathGold = [vect(255, 215, 0), vect(238, 201, 0), vect(255, 223, 70), vect(255, 239, 128), vect(218, 165, 32), vect(250, 250, 210), vect(184, 134, 11)]
    heroColor = [vect(124, 62, 82), vect(214, 145, 65), vect(236, 233, 189), vect(185, 179, 137), vect(191, 115, 110), vect(148, 161, 165), vect(60, 126, 204), vect(160, 169, 186), vect(157, 105, 166), vect(124, 143, 122), vect(45, 187, 209), vect(236, 229, 128), vect(149, 239, 66), vect(179, 139, 80), vect(173, 90, 95), vect(236, 190, 82), vect(231, 130, 184), vect(109, 121, 149), vect(132, 201, 81), vect(237, 147, 199), vect(9, 171, 235), vect(118, 93, 189), vect(131, 83, 76), vect(110, 137, 177), vect(69, 139, 66), vect(139, 98, 94), vect(151, 113, 228), vect(219, 147, 66), vect(198, 28, 65), vect(105, 105, 104), vect(154, 202, 243), vect(85, 178, 204), vect(212, 135, 143), vect(142, 181, 215), vect(148, 160, 165), vect(157, 140, 208), vect(224, 182, 198), vect(220, 132, 125), vect(183, 168, 142), vect(121, 97, 78), vect(173, 143, 203), vect(114, 31, 163), vect(54, 127, 221), vect(238, 75, 43), vect(93, 63, 211), vect(196, 30, 58)]


