#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "map - 绿洲城":
    @Condition __currentMap___ == Map.OASIS
    
    #0 = X轴 1 = Y轴 2 = Z轴
    controlRespawnAxis = 2
    #距离阈值
    controlRespawnAxisThreshold = 40
    startForcingSpawn(Team.1, 2)
    waitUntil(any([player.hasSpawned() for player in getPlayers(Team.1)]), 99999)
    #花园重生点 / 大学重生点 / 中心重生点
    controlRespawnPosition = [
        vect(200.46, 6.42, -188.28),
        vect(-195.03, 20, 89.71),
        vect(69.73, 1, 321.16),
    ]

    #花园-大学 传送点 / 大学-中心 传送点
    controlJumpPosition = [
        vect(82.13, 5.49, -273.2),
        vect(-175.4, 16, -61.35),
    ]

    #堡垒点位：花园 -> 大学 -> 中心（
    bastionPosition = [
        #花园
        vect(170.7, 13.57, -216.17),
        vect(123.6, 12, -229.92),
        vect(78.92, 10, -253.17),
        vect(111.34, 13.57, -278.41),
        #大学
        vect(-196.79, 21.65, 56.69),
        vect(-202.91, 9.12, -0.1),
        vect(-177.5, 20.25, 0.19),
        vect(-183.17, 20.06, -61.79),
        #中心
        vect(110.54, 2, 283.01),
        vect(140.16, 10, 250.39),
        vect(171.91, 4.12, 277),
        vect(150.98, 3.85, 223.89),
        vect(173.51, 2, 217.63),
    ]

    controlCenterPosition = [vect(129.5, 15.28, -235.74), vect(-192.08, 15, 0.26), vect(143.44, 2.15, 247.95)]

    resetPosition = vect(193.61, 8.42, -197.03)
    thirdPersonPosition = vect(191.33, 8.42, -194.73)
    creditsPosition = vect(204.41, 8.42, -184.71)

    mapTitlePlayersByKey = DATA_OASIS