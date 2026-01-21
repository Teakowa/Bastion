#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "map - 釜山":
    @Condition __currentMap___ == Map.BUSAN
    
    #0 = X轴 1 = Y轴 2 = Z轴
    controlRespawnAxis = 0
    #距离阈值
    controlRespawnAxisThreshold = 40
    startForcingSpawn(Team.1, 2)
    waitUntil(any([player.hasSpawned() for player in getPlayers(Team.1)]), 99999)

    # 寺庙/城区/MEKA 重生点
    controlRespawnPosition = [
        vect(-426.04, 11.11, 165.81),   # 寺庙重生点
        vect(-30.95, 17, -125.55),      # 城区重生点
        vect(291.62, 11.09, 208.25),    # MEKA基地重生点
    ]
    # 寺庙->城区 / 城区->MEKA 传送点
    controlJumpPosition = [
        vect(-248.55, 10.35, 152.77),   # 寺庙-城区 传送点
        vect(104.77, 17.74, -137.21),   # 城区-MEKA基地 传送点
    ]
    
    # 堡垒点位
    bastionPosition = [
        # 寺院
        vect(-327.44, 17.73, 166.8),
        vect(-328.51, 15.08, 140.81),
        vect(-277.4, 11.13, 144.4),
        vect(-379.43, 11.13, 144.41),

        # 城区
        vect(22.02, 13.86, -121.16),
        vect(51.84, 13.48, -97.4),
        vect(80.67, 20, -106.93),
        vect(111.43, 18.54, -169.79),

        # MEKA基地
        vect(268.37, 15.09, 205.62),
        vect(249.27, 14.29, 236.1),
        vect(228.22, 10.09, 231.08),
        vect(200.31, 19.43, 223.76),
        vect(177.1, 9.69, 253.19),
        vect(173.93, 12.87, 267.78),
    ]
    controlCenterPosition = [vect(-328.53, 8.17, 153.32), vect(51.89, 14.5, -114.7), vect(222.72, 9.24, 241.77)]
    resetPosition = vect(-409.71, 10.11, 165.61)
    thirdPersonPosition = vect(-410.4, 10.11, 162.37)
    creditsPosition = vect(-426.04, 13.11, 165.81)
    endPosition = vect(158.67, 10.81, 260.91)

    mapTitlePlayersByKey = DATA_BUSAN