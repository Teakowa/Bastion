#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict




rule "map - 埃斯佩兰萨":
    @Condition (__currentMap___ == Map.ESPERANCA or __currentMap___ == 276) == true
    
    #Made by 他又 芋泥玛奇朵
    bastionPosition = [vect(86.815, -0.268, -54.406), vect(63.789, 1, -57.796), vect(14.121, 3.261, -42.146), vect(1.238, 7.966, 13.923), vect(0.025, -0.002, -33.787), vect(-15.8, 3.08, -39.1), vect(-45.384, -1.583, -60.618), vect(60.25, -6, -93.538), vect(-26.245, 0, -80.277), vect(-108.094, -1.002, -60.285), vect(-71.269, 1.05, -49.368), vect(0.047, -2, -69.042)]
    endPosition = vect(-117.37, -3, -45.65)
    springBoardPosition = vect(-73.72, -3, -34.19)
    thirdPersonPosition = vect(126.7, -1.64, -90.03)
    resetPosition = vect(126.7, -1.64, -81.42)
    creditsPosition = vect(116.67, -0.29, -82.29)
    startForcingSpawn(Team.1, 2)
    mapTitleRelation = [[7, 9], [7, 10], [8, 9], [8, 10], [8, 0], [9, 9], [9, 10], [9, 0], [10, 9], [10, 10], [10, 0], [13, 9], [13, 10], [18, 9], [18, 10], [18, 0], [5, 9], [5, 10], [5, 0], [6, 9], [6, 10], [6, 0], [19, 9], [19, 10], [24, 9], [24, 10], [12, 9], [12, 10], [12, 0]]


rule "map - 斗兽场":
    @Condition (__currentMap___ == Map.COLOSSEO or __currentMap___ == 2147) == true
    
    #Made by 他又 芋泥玛奇朵
    bastionPosition = vect(60.94, 12.5, -13.78)
    bastionPosition.append(vect(30.54, 5.09, 6.64))
    bastionPosition.append(vect(-7.85, 20, -29.95))
    bastionPosition.append(vect(-21.88, 7.49, -3))
    bastionPosition.append(vect(-54.52, 12.46, -10.1))
    bastionPosition.append(vect(-9.98, 5, -39.5))
    bastionPosition.append(vect(-60.93, 12.21, -11.91))
    #终点
    bastionPosition.append(vect(-88.63, 13.77, -23.49))
    endPosition = vect(-90.31, 9, -33.55)
    thirdPersonPosition = vect(117.38, 9, -38.98)
    resetPosition = vect(111.17, 9, -50.91)
    creditsPosition = vect(117.64, 13, -48.66)
    startForcingSpawn(Team.1, 2)
    mapTitleRelation = [[13, 9], [13, 10], [6, 9], [6, 10], [7, 9], [7, 10], [8, 9], [8, 10], [9, 9], [9, 10], [9, 0], [18, 9], [18, 10], [19, 9], [19, 10], [24, 9], [24, 10], [10, 10], [10, 0]]


rule "map - 鲁纳塞彼":
    @Condition (__currentMap___ == Map.RUNASAPI or __currentMap___ == 8048) == true
    
    #made by 他又
    bastionPosition = vect(70.39, 7.86, 24.73)
    bastionPosition.append(vect(40.8, 4.01, 5.96))
    bastionPosition.append(vect(61.26, 5.99, -16.04))
    bastionPosition.append(vect(0.08, 8.34, 83.49))
    bastionPosition.append(vect(-25.99, 1.21, 15.51))
    bastionPosition.append(vect(-43.32, 4, 36.5))
    bastionPosition.append(vect(-71.28, 14.62, 38.58))
    bastionPosition.append(vect(-93.05, 7.06, 18.11))
    endPosition = vect(-106.93, 7.99, 22.24)
    thirdPersonPosition = vect(113.31, 7.09, -3.5)
    resetPosition = vect(111.34, 7.09, -5.6)
    creditsPosition = vect(124.6, 8.77, -15.99)
    startForcingSpawn(Team.1, 2)
    mapTitleRelation = [[6, 9], [6, 10], [7, 9], [7, 10], [8, 9], [8, 10], [9, 9], [9, 10], [10, 9], [10, 10], [12, 9], [12, 10], [13, 9], [13, 10], [19, 9], [19, 10], [18, 9], [18, 10]]


rule "map - 新皇后街":
    @Condition __currentMap___ == Map.NEW_QUEEN_STREET
    
    #made by 他又
    bastionPosition = [vect(-74.922, 14.194, -16.661), vect(-25.688, 4, -22.819), vect(-29.72, 7.12, -6.68), vect(-7.696, 4.85, 35.246), vect(-0.035, 2.376, -11.505), vect(19.183, 1.477, -27.407), vect(15.862, 5.063, -12.591), vect(39.34, 8.1, -12.938), vect(51.915, 10, -17.308)]
    endPosition = vect(90, 11, -45.9)
    thirdPersonPosition = vect(-111.26, 11, -32.03)
    resetPosition = vect(-111.17, 11, -17)
    creditsPosition = vect(-102.08, 17.29, -24.46)
    startForcingSpawn(Team.1, 2)
    mapTitleRelation = [[9, 9], [9, 10], [8, 9], [8, 10], [8, 0], [12, 9], [12, 10], [12, 0], [13, 9], [13, 10], [7, 9], [7, 10], [7, 0], [19, 9], [19, 10], [24, 9], [24, 10], [18, 9], [18, 10], [18, 0]]


rule "map - 皇家赛道":
    @Condition __currentMap___ == Map.CIRCUIT_ROYAL
    
    #Made by 他又 芋泥玛奇朵
    bastionPosition = [vect(97.763, 15.967, 29.045), vect(64.607, 19.071, 23.437), vect(61.918, 17.956, 15.709), vect(88.977, 14.931, -25.352), vect(59.133, 29.301, -30.146), vect(13.16, 16.52, -44.31), vect(10.33, 6, 5.54), vect(-23.15, 7.58, 19.14), vect(-15.61, 13, -45.26), vect(-40.6, 4.25, -35.79), vect(-67.822, 6.067, -43.245)]
    endPosition = vect(-45.08, 10, -13.37)
    thirdPersonPosition = vect(135.08, 10, -3.31)
    resetPosition = vect(129.68, 10, 0.04)
    creditsPosition = vect(147.52, 11.5, -10.9)
    startForcingSpawn(Team.1, 2)
    mapTitleRelation = [[7, 9], [7, 10], [8, 9], [8, 10], [10, 9], [10, 10], [18, 9], [18, 10], [0, 0], [1, 0]]


rule "map - 花村":
    @Condition (__currentMap___ == Map.HANAMURA or __currentMap___ == 1848 or __currentMap___ == Map.HANAMURA_WINTER) == true
    
    #Made by 他又 芋泥玛奇朵
    bastionPosition = vect(-20.75, 9.21, -78.14)
    bastionPosition.append(vect(11.87, 7.21, -47.22))
    bastionPosition.append(vect(28.31, 10.47, 6.6))
    bastionPosition.append(vect(-6.95, 8.01, -10.86))
    bastionPosition.append(vect(49.13, 14.56, 17.96))
    bastionPosition.append(vect(52.2, -1, -0.58))
    bastionPosition.append(vect(15.61, 11.98, 17.47))
    bastionPosition.append(vect(46.87, -0.16, -15.6))
    bastionPosition.append(vect(60.13, -1.04, -15.61))
    endPosition = vect(51.7, -1.87, 25.91)
    thirdPersonPosition = vect(-33.2, 1, -115.04)
    resetPosition = vect(-46.98, 1, -101.54)
    creditsPosition = vect(-48.1, 2.5, -116.08)
    __currentMapText___ = "花村"
    __currentMapPioneerText___ = __currentMapText___
    mapTitleRelation = [[13, 9], [13, 10], [7, 9], [7, 10], [9, 9], [9, 10], [9, 0], [12, 9], [12, 0], [10, 9], [10, 10], [10, 0], [8, 9], [8, 10], [8, 0], [6, 9], [6, 10], [6, 0], [18, 9], [18, 10], [19, 9], [19, 10], [24, 9], [24, 10], [24, 9], [24, 10], [17, 9], [17, 10], [17, 0]]


rule "map - 伊利奥斯":
    @Condition __currentMap___ == Map.ILIOS
    
    startForcingSpawn(Team.1, 2)
    waitUntil(any([player.hasSpawned() for player in getPlayers(Team.1)]), 99999)
    #made by 他又
    #深井
    if len(getPlayersInRadius(vect(-152.014, -1.104, -93.12), 30, Team.1)) != 0:
        bastionPosition[0] = vect(-173.701, -0.46, -71.552)
        bastionPosition[1] = vect(-207.983, 5.46, -31.971)
        bastionPosition[2] = vect(-222.539, 0.1, -30.825)
        bastionPosition[3] = vect(-223.926, 5.56, -16.079)
        bastionPosition[4] = vect(-245.721, 5.56, 5.19)
        bastionPosition[6] = vect(-257.45, 2.85, 35.113)
        endPosition = vect(-271.14, -3.585, 33.279) - vect(0, 2, 0)
        resetPosition = vect(-160.308, -1.355, -91.403)
        thirdPersonPosition = vect(-148.168, -1.504, -88.932)
        creditsPosition = vect(-150.88, 0.2, -97.02)
        #废墟
    elif len(getPlayersInRadius(vect(131.609, 64.254, -159.135), 30, Team.1)) != 0:
        bastionPosition[0] = vect(111.31, 68.78, -183.068)
        bastionPosition[1] = vect(83.25, 67.65, -179.529)
        bastionPosition[2] = vect(28.394, 61.39, -148.333)
        bastionPosition[3] = vect(5.918, 60.37, -170.376)
        bastionPosition[4] = vect(-26.8, 67.62, -178.826)
        bastionPosition[5] = vect(-52.04, 65.39, -179.058)
        #Tower goal position
        endPosition = vect(-47.306, 60.37, -184.722) - vect(0, 2, 0)
        #Base coordinates for world game settings HUD
        resetPosition = vect(128.072, 63.254, -165.528)
        thirdPersonPosition = vect(129.56, 62.45, -153.472)
        creditsPosition = vect(137.54, 63.92, -158.9)
        #灯塔
    elif len(getPlayersInRadius(vect(322.692, -21.52, 42.832), 30, Team.1)) != 0:
        bastionPosition[0] = vect(321.799, -17.29, 26.126)
        bastionPosition[1] = vect(314.215, -16.35, -18.283)
        bastionPosition[2] = vect(358.768, -6.597, -47.48)
        bastionPosition[3] = vect(353.915, -10.86, -53.746)
        bastionPosition[4] = vect(364.601, -25.62, -54.434)
        bastionPosition[5] = vect(304.692, -15.91, -42.049)
        bastionPosition[6] = vect(319.744, -24.11, -69.502)
        #Town goal position
        endPosition = vect(321.229, -23.291, -88.556) - vect(0, 3, 0)
        thirdPersonPosition = vect(318.997, -21.52, 37.66)
        resetPosition = vect(331.08, -21.52, 41.121)
        #Base coordinates for world game settings HUD
        creditsPosition = vect(321.8, -20, 46)
    mapTitleRelation = [[13, 9], [13, 10], [12, 9], [12, 10], [7, 9], [7, 10], [8, 9], [8, 10], [9, 9], [9, 10], [10, 9], [10, 10], [6, 9], [6, 10], [18, 9], [18, 10], [19, 9], [19, 10], [16, 9], [24, 9], [24, 10], [23, 9], [23, 10]]


rule "map - 漓江塔":
    @Condition (__currentMap___ == Map.LIJIANG_TOWER or __currentMap___ == 3676) == true
    
    __currentMapText___ = "漓江塔"
    __currentMapPioneerText___ = __currentMapText___
    #0 = X轴 1 = Y轴 2 = Z轴
    controlRespawnAxis = 1
    #距离阈值
    controlRespawnAxisThreshold = 40
    startForcingSpawn(Team.1, 2)
    waitUntil(any([player.hasSpawned() for player in getPlayers(Team.1)]), 99999)
    #夜市
    bastionPosition = vect(34.55, 33.85, -36.64)
    bastionPosition.append(vect(21.25, 10, -23.95))
    bastionPosition.append(vect(0.93, 0, -9.84))
    bastionPosition.append(vect(3.65, 8.01, -52.48))
    bastionPosition.append(vect(-30.81, 25.99, -14.77))
    #夜市重生点
    controlRespawnPosition = vect(84.41, 4.52, -31.57)
    #夜市-庭院 传送点
    controlJumpPosition = vect(-58.26, 6, -5.24)
    resetPosition = vect(81.11, 4.58, -35.44)
    thirdPersonPosition = vect(74.43, 4.46, -26.34)
    creditsPosition = vect(84.29, 6.2, -29.44)
    #庭院
    bastionPosition.append(vect(41.48, 95.87, 140.62))
    bastionPosition.append(vect(-0.08, 94, 184.97))
    bastionPosition.append(vect(-16.66, 96.5, 120.91))
    bastionPosition.append(vect(-66.07, 94, 150.2))
    #庭院重生点
    controlRespawnPosition.append(vect(86.21, 96.62, 147.7))
    #庭院-控制中心 传送点
    controlJumpPosition.append(vect(-51.89, 95, 133.97))
    #控制中心
    bastionPosition.append(vect(46.34, 267, 300.86))
    bastionPosition.append(vect(-10.14, 270.12, 321.4))
    bastionPosition.append(vect(-0.2, 278.01, 290.98))
    bastionPosition.append(vect(2.79, 274.19, 301.82))
    bastionPosition.append(vect(-46.63, 267.11, 300.97))
    #控制中心重生点
    controlRespawnPosition.append(vect(62.93, 267.64, 349.53))
    endPosition = vect(-44.02, 271.64, 349.77)
    mapTitleRelation = [[13, 9], [13, 10], [15, 9], [15, 10], [10, 9], [10, 10], [2, 9], [2, 10], [9, 9], [9, 10], [7, 9], [7, 10], [6, 9], [6, 10], [3, 9], [3, 10], [8, 9], [8, 10], [17, 9], [17, 10], [18, 9], [18, 10], [19, 9], [19, 10], [28, 9], [28, 10], [26, 9], [26, 10]]


rule "map - 萨摩亚":
    @Condition (__currentMap___ == Map.SAMOA or __currentMap___ == 13628) == true
    
    #0 = X轴 1 = Y轴 2 = Z轴
    controlRespawnAxis = 0
    #距离阈值
    controlRespawnAxisThreshold = 40
    startForcingSpawn(Team.1, 2)
    waitUntil(any([player.hasSpawned() for player in getPlayers(Team.1)]), 99999)
    #海滩海滩重生点
    controlRespawnPosition = vect(-428, 10.5, -109)
    #海滩-城区 传送点
    controlJumpPosition = vect(-256.82, 14.85, -94.9)
    resetPosition = vect(-430.71, 10.3, -105.96)
    thirdPersonPosition = vect(-425.32, 10.23, -116.48)
    creditsPosition = vect(-436.16, 12.2, -111.37)
    #城区城区重生点
    controlRespawnPosition.append(vect(330.12, 14.64, -216.31))
    #城区-控制中心 传送点
    controlJumpPosition.append(vect(177.52, 12.3, -239.3))
    #火山火山重生点
    controlRespawnPosition.append(vect(107.83, 343, 415.6))
    endPosition = vect(-29.3, 340.56, 410.76)
    #堡垒点位  沙滩
    bastionPosition = vect(-408.95, 14.4, -84.76)
    bastionPosition.append(vect(-384.05, 12.05, -86.88))
    bastionPosition.append(vect(-330.08, 10.01, -98.04))
    bastionPosition.append(vect(-276.43, 11.02, -89.16))
    #堡垒点位 城区
    bastionPosition.append(vect(307.13, 18.61, -206.17))
    bastionPosition.append(vect(231.6, 16.28, -270.76))
    bastionPosition.append(vect(233.69, 9, -229.7))
    bastionPosition.append(vect(170.96, 12.56, -242.33))
    #堡垒点位 火山
    bastionPosition.append(vect(97.68, 340.63, 397.23))
    bastionPosition.append(vect(46.64, 345.49, 387.04))
    bastionPosition.append(vect(26.69, 341.63, 376.43))
    bastionPosition.append(vect(27.74, 360.5, 356.07))
    bastionPosition.append(vect(0.96, 346.65, 390.11))
    bastionPosition.append(vect(-4.4, 353.05, 407.42))
    mapTitleRelation = [[6, 9], [6, 10], [12, 9], [12, 10], [10, 9], [10, 10], [2, 9], [2, 10], [7, 9], [7, 10], [8, 9], [8, 10], [9, 9], [9, 10], [18, 9], [18, 10], [19, 9], [19, 10], [13, 9], [13, 10]]


rule "map - 釜山":
    @Condition __currentMap___ == Map.BUSAN
    
    #0 = X轴 1 = Y轴 2 = Z轴
    controlRespawnAxis = 0
    #距离阈值
    controlRespawnAxisThreshold = 40
    startForcingSpawn(Team.1, 2)
    waitUntil(any([player.hasSpawned() for player in getPlayers(Team.1)]), 99999)
    #寺庙重生点
    controlRespawnPosition = vect(-426.04, 11.11, 165.81)
    #寺庙-城区 传送点
    controlJumpPosition = vect(-248.55, 10.35, 152.77)
    resetPosition = vect(-409.71, 10.11, 165.61)
    thirdPersonPosition = vect(-410.4, 10.11, 162.37)
    creditsPosition = vect(-426.04, 13.11, 165.81)
    #城区城区重生点
    controlRespawnPosition.append(vect(-30.95, 17, -125.55))
    #城区-meka基地 传送点
    controlJumpPosition.append(vect(104.77, 17.74, -137.21))
    #meka基地重生点
    controlRespawnPosition.append(vect(291.62, 11.09, 208.25))
    endPosition = vect(158.67, 10.81, 260.91)
    #堡垒点位  寺院
    bastionPosition = vect(-327.44, 17.73, 166.8)
    bastionPosition.append(vect(-328.51, 15.08, 140.81))
    bastionPosition.append(vect(-277.4, 11.13, 144.4))
    bastionPosition.append(vect(-379.43, 11.13, 144.41))
    #堡垒点位 城区
    bastionPosition.append(vect(22.02, 13.86, -121.16))
    bastionPosition.append(vect(51.84, 13.48, -97.4))
    bastionPosition.append(vect(80.67, 20, -106.93))
    bastionPosition.append(vect(111.43, 18.54, -169.79))
    #堡垒点位  meka基地
    bastionPosition.append(vect(268.37, 15.09, 205.62))
    bastionPosition.append(vect(249.27, 14.29, 236.1))
    bastionPosition.append(vect(228.22, 10.09, 231.08))
    bastionPosition.append(vect(200.31, 19.43, 223.76))
    bastionPosition.append(vect(177.1, 9.69, 253.19))
    bastionPosition.append(vect(173.93, 12.87, 267.78))
    controlCenterPosition = [vect(-328.53, 8.17, 153.32), vect(51.89, 14.5, -114.7), vect(222.72, 9.24, 241.77)]
    mapTitleRelation = [[2, 0], [2, 9], [4, 0], [4, 9], [5, 0], [5, 9], [6, 0], [6, 9], [6, 10], [7, 0], [7, 9], [7, 10], [8, 9], [8, 10], [12, 9], [12, 10], [9, 9], [9, 10], [19, 9], [19, 10], [18, 9], [18, 10], [10, 9], [10, 10], [28, 9], [28, 10], [29, 9], [29, 10], [30, 9], [30, 10], [31, 9], [31, 10], [13, 9], [13, 10]]


rule "map - 绿洲城":
    @Condition __currentMap___ == Map.OASIS
    
    #0 = X轴 1 = Y轴 2 = Z轴
    controlRespawnAxis = 2
    #距离阈值
    controlRespawnAxisThreshold = 40
    startForcingSpawn(Team.1, 2)
    waitUntil(any([player.hasSpawned() for player in getPlayers(Team.1)]), 99999)
    #花园重生点
    controlRespawnPosition = vect(200.46, 6.42, -188.28)
    #花园-大学 传送点
    controlJumpPosition = vect(82.13, 5.49, -273.2)
    resetPosition = vect(193.61, 8.42, -197.03)
    thirdPersonPosition = vect(191.33, 8.42, -194.73)
    creditsPosition = vect(204.41, 8.42, -184.71)
    #大学重生点
    controlRespawnPosition.append(vect(-195.03, 20, 89.71))
    #大学-中心  传送点
    controlJumpPosition.append(vect(-175.4, 16, -61.35))
    #中心重生点
    controlRespawnPosition.append(vect(69.73, 1, 321.16))
    endPosition = vect(195.13, 0.85, 172.87)
    #堡垒点位  花园
    bastionPosition = vect(170.7, 13.57, -216.17)
    bastionPosition.append(vect(123.6, 12, -229.92))
    bastionPosition.append(vect(78.92, 10, -253.17))
    bastionPosition.append(vect(111.34, 13.57, -278.41))
    #堡垒点位 大学
    bastionPosition.append(vect(-196.79, 21.65, 56.69))
    bastionPosition.append(vect(-202.91, 9.12, -0.1))
    bastionPosition.append(vect(-177.5, 20.25, 0.19))
    bastionPosition.append(vect(-183.17, 20.06, -61.79))
    #堡垒点位  中心
    bastionPosition.append(vect(110.54, 2, 283.01))
    bastionPosition.append(vect(140.16, 10, 250.39))
    bastionPosition.append(vect(171.91, 4.12, 277))
    bastionPosition.append(vect(150.98, 3.85, 223.89))
    bastionPosition.append(vect(173.51, 2, 217.63))
    controlCenterPosition = [vect(129.5, 15.28, -235.74), vect(-192.08, 15, 0.26), vect(143.44, 2.15, 247.95)]
    mapTitleRelation = [[5, 9], [5, 10], [6, 9], [6, 10], [6, 0], [7, 9], [7, 10], [8, 9], [8, 10], [9, 9], [9, 10], [10, 9], [10, 10], [10, 0], [12, 9], [12, 10], [13, 9], [13, 10], [19, 9], [19, 10], [24, 9], [24, 10], [18, 9], [18, 10]]


rule "map - 新渣客城":
    @Condition (__currentMap___ == Map.NEW_JUNK_CITY or __currentMap___ == 3099) == true
    
    portalPosition = [vect(-91.45, 2, -5.21), vect(-118.06, 30.58, -2.12)]
    #0 = X轴 1 = Y轴 2 = Z轴
    controlRespawnAxis = 2
    #距离阈值
    controlRespawnAxisThreshold = 30
    startForcingSpawn(Team.1, 1)
    controlRespawnPosition = vect(-0.7, 8.02, 113.02)
    #大学重生点
    controlRespawnPosition.append(portalPosition.last())
    resetPosition = vect(5.33, 8.14, 109.05)
    thirdPersonPosition = vect(2.08, 8.02, 109.16)
    creditsPosition = vect(0.68, 11.77, 120.02)
    endPosition = vect(-43, 28.65, -39.96)
    controlJumpPosition = portalPosition[0]
    bastionPosition = [vect(-45.678, 8.298, 88.433), vect(-74.958, 6.937, 72.937), vect(-76.296, 7.756, 40.01), vect(-74.877, 6.937, 7.044), vect(-78.144, -0.941, -19.954), vect(-55.165, 8.251, -0.152), vect(-25.305, 9.706, 32.074), vect(13.116, 4.058, 87.188), vect(-15.766, 7.025, 0.028), vect(-31.324, 8.111, -39.913), vect(-85.606, 0.947, 44.387), vect(-74.415, 4.499, -63.359)]
    mapTitleRelation = [[7, 9], [7, 10], [7, 0], [8, 9], [8, 10], [8, 0], [9, 9], [9, 10], [10, 9], [10, 10], [12, 9], [12, 10], [12, 0], [13, 9], [13, 10], [19, 9], [19, 10], [24, 9], [24, 10], [28, 9], [28, 10], [18, 9], [18, 10], [18, 0]]


rule "map - 尼泊尔":
    @Condition __currentMap___ == Map.NEPAL
    
    controlRespawnAxis = 1
    #距离阈值
    controlRespawnAxisThreshold = 30
    startForcingSpawn(Team.1, 1)
    waitUntil(any([player.hasSpawned() for player in getPlayers(Team.1)]), 99999)
    controlRespawnPosition = vect(-161, -95.97, -84.17)
    #大学重生点
    controlRespawnPosition.append(vect(-39.04, 17.84, -99.75))
    controlRespawnPosition.append(vect(85.52, 132.49, -96.2))
    resetPosition = vect(-165.4, -95.85, -88.15)
    thirdPersonPosition = vect(-158.45, -95.97, -78.36)
    creditsPosition = vect(-157.98, -90.95, -89.77)
    endPosition = vect(103.15, 132, 52.57)
    controlJumpPosition = vect(-148.56, -92.25, 64.75)
    controlJumpPosition.append(vect(-21.67, 21, 81.47))
    bastionPosition = [vect(-152.68, -92.115, -64.862), vect(-193.849, -89.578, -32.592), vect(-199.313, -94.457, 41.386), vect(-146.246, -88.751, 48.509), vect(-26.436, 22, -69.808), vect(-25.182, 13, 0.688), vect(-73.662, 19.545, 0.132), vect(-42.208, 20.025, 51.77), vect(-187.057, -87.686, 7.868), vect(73.112, 129.717, -67.245), vect(94.679, 140.26, -17.696), vect(92.445, 141.37, 49.176)]
    mapTitleRelation = [[7, 9], [7, 10], [7, 0], [8, 9], [8, 10], [8, 0], [10, 9], [10, 10], [10, 0], [12, 9], [12, 10], [12, 0], [18, 9], [18, 10], [19, 9], [19, 10], [13, 9], [13, 10], [13, 0]]


rule "map - 阿努比斯王座":
    @Condition (__currentMap___ == Map.THRONE_OF_ANUBIS or __currentMap___ == 886) == true
    
    __currentMapText___ = "王座"
    __currentMapPioneerText___ = __currentMapText___
    controlRespawnAxis = 2
    #距离阈值
    controlRespawnAxisThreshold = 30
    startForcingSpawn(Team.1, 1)
    waitUntil(any([player.hasSpawned() for player in getPlayers(Team.1)]), 99999)
    controlRespawnPosition = vect(11.4, 9.25, 134.12)
    resetPosition = vect(6.28, 9.28, 130.05)
    thirdPersonPosition = vect(3.18, 9.28, 130.71)
    creditsPosition = vect(-157.98, -90.95, -89.77)
    endPosition = vect(-10.49, 8.92, -125.57)
    bastionPosition = [vect(-28.955, 6.079, 65.912), vect(23.873, 21.939, 104.507), vect(0.457, 10.482, 97.234), vect(-7.399, 7.583, 50.502), vect(-1.101, 1.051, 19.039), vect(11.358, 8.052, -15.668), vect(-25.866, 9.142, -44.072), vect(11.875, 7.904, -24.293), vect(-27.944, 5.78, -83.352), vect(-16.021, 5.815, -98.212)]
    mapTitleRelation = [[7, 9], [7, 10], [7, 0], [8, 9], [8, 10], [8, 0], [10, 9], [10, 10], [10, 0], [18, 9], [18, 10], [19, 9], [19, 10], [19, 0], [24, 9], [24, 10], [25, 9], [25, 10], [25, 0], [28, 9], [28, 10], [13, 9], [13, 10], [13, 0]]


rule "map - 花冈":
    @Condition __currentMap___ == 2601
    
    __currentMapText___ = "花冈"
    __currentMapPioneerText___ = __currentMapText___
    controlRespawnAxis = 2
    #距离阈值
    controlRespawnAxisThreshold = 30
    startForcingSpawn(Team.1, 2)
    waitUntil(any([player.hasSpawned() for player in getPlayers(Team.1)]), 99999)
    controlRespawnPosition = vect(-7.69, 44.25, -140.5)
    resetPosition = vect(-9.08, 44.05, -133.26)
    thirdPersonPosition = vect(-0.64, 44.05, -133.89)
    creditsPosition = vect(-5.02, 50.05, -142.63)
    endPosition = vect(20.36, 39.83, 112.51)
    bastionPosition = [vect(-22.263, 46.024, -89.586), vect(-5.326, 42.977, -59.814), vect(6.729, 45.55, -48.776), vect(29.532, 44.5, 7.09), vect(-2.847, 42.51, 7.305), vect(-17.813, 45.889, 63.611), vect(-21.392, 45.952, 103.426), vect(14.139, 41.045, 99.842), vect(-12.338, 40.538, 39.81), vect(-17.161, 40.545, -19.673)]
    mapTitleRelation = [[7, 9], [7, 10], [8, 9], [8, 10], [10, 9], [10, 10], [13, 9], [13, 10], [18, 9], [18, 10], [24, 9], [24, 10], [28, 9], [28, 10], [19, 9], [19, 10]]


rule "map - 苏拉瓦萨":
    @Condition __currentMap___ == Map.SURAVASA
    
    __currentMapPioneerText___ = "瓦拉纳西"
    __currentPioneerText___ = "守护者"
    #0 = X轴 1 = Y轴 2 = Z轴
    controlRespawnAxis = 2
    #距离阈值
    controlRespawnAxisThreshold = 50
    startForcingSpawn(Team.1, 1)
    controlRespawnPosition = vect(-0.36, 4, 136.68)
    bastionPosition = [vect(16.734, 10.5, 72.11), vect(-33.04, 4.174, 73.197), vect(-0.913, 5.25, 62.388), vect(24.538, 9.284, 4.699), vect(23.629, 7.986, 36.324), vect(-63.158, 8.431, 13.99), vect(-20.737, 4.005, 18.929), vect(-2.818, 3.976, -36.071), vect(-20.587, 4.008, -19.155)]
    resetPosition = vect(-4.55, 4, 124.39)
    thirdPersonPosition = vect(5.54, 4, 124.39)
    creditsPosition = vect(0.68, 11.77, 120.02)
    endPosition = vect(-2.43, 4.13, 0.75)
    mapTitleRelation = [[0, 0], [1, 0], [7, 0], [7, 9], [7, 10], [8, 0], [8, 9], [8, 10], [10, 9], [10, 10], [13, 0], [13, 9], [13, 10], [18, 0], [18, 9], [18, 10], [24, 0], [24, 9], [24, 10], [33, 9], [33, 10], [27, 0], [27, 9], [27, 10]]


rule "map - 阿育陀耶":
    @Condition (__currentMap___ == Map.AYUTTHAYA or __currentMap___ == 1826) == true
    
    rebootTime = 5400
    __currentMapPioneerText___ = "大城"
    __currentPioneerText___ = "守护者"
    bastionPosition = [vect(18.158, 1.217, -56.711), vect(17.999, 6.029, -30.873), vect(14.01, 3.189, -9.077), vect(34.905, 5.09, 4.157), vect(4.54, 6.004, 26.42), vect(10.071, 1.931, 38.699)]
    startForcingSpawn(Team.1, 1)
    resetPosition = vect(20.46, 1, -104.03)
    thirdPersonPosition = vect(15.45, 1, -103.8)
    creditsPosition = vect(17.69, 9.22, -111.87)
    endPosition = vect(16.12, 1, 66.52)
    mapTitleRelation = [[0, 0], [1, 0], [7, 9], [7, 10], [10, 9], [10, 10], [13, 9], [13, 10], [18, 9], [18, 10], [28, 9], [28, 10], [8, 9], [8, 10]]


