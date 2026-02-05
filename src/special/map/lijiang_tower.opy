#!mainFile "../../lunar.opy"



#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict



rule "map - 春节漓江塔":
    @Condition __currentMap___ == 3676

    __currentMapText___ = "漓江塔"
    __currentMapPioneerText___ = __currentMapText___

    #0 = X轴 1 = Y轴 2 = Z轴
    controlRespawnAxis = 1
    #距离阈值
    controlRespawnAxisThreshold = 40
    
    startForcingSpawn(Team.1, 2)
    waitUntil(any([player.hasSpawned() for player in getPlayers(Team.1)]), 99999)
    #made by 芋泥玛奇朵
    #夜市
    if len(getPlayersInRadius(vect(84.41, 4.52, -31.57), 30, Team.1)) != 0:

        bastionPosition = [vect(37.412, 5.024, -11.121), vect(54.537, 8.339, -31.396), vect(16.293, 8.878, -16.243), vect(21.668, 24.31, -32.327), vect(1.087, 2, -79.016), vect(-3.402, 8.006, -52.139), vect(-13.886, 16.996, -13.147), vect(-54.31, 9.892, -29.383), vect(-56.812, 9.003, -10.002), vect(-35.264, -1, -14.559)]

        redPosition = [
            vect(60.39, 6, -5.21),
            vect(30.13, 9.44, -24.75),
            vect(15.75, 13.08, -15.4),
            vect(0.96, 2, -77.64),
            vect(0.96, 9.01, -68.51),
            vect(0.86, 31.91, -58.64),
            vect(63.18, -10.98, -48.75),
            vect(36.68, 18.16, -69.4),
            vect(-13.17, 15.54, -21.38),
            vect(-30.81, 26.29, -14),
            vect(-46.14, 2, -25.06),
            vect(-66.52, 2.1, -48.74),
            vect(23.83, 0, -10.92),
            vect(49.87, 2, -32.07),
            vect(65.01, 15.87, -34.43),
            vect(-23.56, 6, -28.59),
            vect(-61.55, 6, -8.69),
            vect(-63.67, 2, -13.66),
            vect(-42.75, 1.86, -48.64),
            vect(-18.25, 6, -12.5),
            vect(-6.8, 1.42, -29.97),
            vect(10.55, 4.61, -30.08),
            vect(26.73, 4.45, -17.04),
            vect(-21.83, 0, -10.85),
            vect(0.98, 6.3, -53.79),
            vect(30.15, 6.03, -32.81),
            vect(3.24, 8.97, -21.5),
            vect(-62.34, 15.6, -33.47),
            vect(-20.77, 21.52, -24.75),
            vect(1, 34.51, -64.03),
        ]

        
        endPosition = vect(-19.89,6,-6.89)
        resetPosition = vect(81.11, 4.58, -35.44)
        thirdPersonPosition = vect(74.43, 4.46, -26.34)
        creditsPosition = vect(84.29, 6.2, -29.44)
    #庭院
    elif len(getPlayersInRadius(vect(86.21, 96.62, 147.7), 30, Team.1)) != 0:
        bastionPosition = [vect(73.918, 100.597, 162.999), vect(47.245, 97.259, 142.479), vect(26.208, 94.3, 179.645), vect(10.223, 97.279, 149.053), vect(-9.485, 97.9, 182.008), vect(16.545, 97.237, 124.272), vect(-10.755, 95.25, 110.227), vect(-36.755, 98, 162.203), vect(-54.755, 93.999, 136.121)]

        redPosition = [
            vect(72.76, 94.58, 157.76),
            vect(59.25, 98, 158.75),
            vect(70.02, 91.55, 135.21),
            vect(31.18, 93, 135.49),
            vect(-0.21, 93.37, 109.01),
            vect(-24.12, 88.56, 129.31),
            vect(-36.75, 92, 136.63),
            vect(-54.5, 91, 135.87),
            vect(-77.78, 108.25, 116.86),
            vect(48.75, 95, 142.25),
            vect(36.32, 95, 150.04),
            vect(14.13, 88.69, 131.98),
            vect(-18.93, 89.79, 162.74),
            vect(0.49, 90.86, 160.81),
            vect(24.12, 98.25, 185.25),
            vect(-0.08, 103.51, 170.75),
            vect(0.51, 131.84, 193.26),
            vect(-0.07, 123.2, 172.15),
            vect(-0.17, 147.46, 148.41),
            vect(-0.03, 96, 107.77),
            vect(-35.24, 98.01, 168.19),
            vect(-21.63, 94, 162.41),
            vect(-42.31, 98, 163.91),
            vect(-69.85, 96.23, 145.48),
            vect(-73.65, 100.63, 163.08),
            vect(-34.75, 95.1, 136.28),
            vect(-9.61, 97.79, 150.06),
            vect(21.95, 94, 162.36),
            vect(77.79, 100.34, 118.82),
            vect(87.9, 100.38, 159.44),
        ]


        #Tower goal position
        endPosition = vect(-71.43,98,161.47) - vect(0, 2, 0)
        #Base coordinates for world game settings HUD
        resetPosition = vect(76.78, 96.56, 149.93)
        thirdPersonPosition = vect(77.40, 96.56, 139.62)
        creditsPosition = vect(86.46, 99.88, 144.23)
    #控制中心
    elif len(getPlayersInRadius(vect(62.93, 267.64, 349.53), 30, Team.1)) != 0:
        bastionPosition = [vect(42.217, 271.622, 347.985), vect(29.743, 269, 282.435), vect(19.531, 269.853, 318.403), vect(-2.563, 273, 318.083), vect(-0.021, 272.5, 280.083), vect(-28.886, 268.801, 282.951), vect(-31.803, 269.295, 300.952), vect(-45.131, 266.42, 343.867), vect(-46.623, 267.107, 300.947)]

        redPosition = [
            vect(79.82, 271.35, 324.21),
            vect(29.57, 270, 359.39),
            vect(39.07, 265, 309.52),
            vect(33.98, 274.1, 315.39),
            vect(24, 289.35, 282.44),
            vect(62.53, 263.24, 326.79),
            vect(0.42, 265.28, 257.16),
            vect(-0.21, 304.87, 261.37),
            vect(-33.31, 264.83, 286.79),
            vect(-60.71, 283.91, 345.14),
            vect(-21.18, 289.89, 327.75),
            vect(-29, 266.99, 260.66),
            vect(-42.9, 266.66, 347.92),
            vect(-17.99, 304.87, 350.25),
            vect(-1.17, 267.16, 204.83),
            vect(-0.06, 278.17, 279.93),
            vect(16.77, 271.94, 292.88),
            vect(-0.01, 270, 328.52),
            vect(11.75, 269.95, 324.8),
            vect(-0.1, 270, 259.25),
            vect(-22.02, 270.95, 288.43),
            vect(-16.5, 267, 306.59),
            vect(0.24, 282.76, 307.25),
            vect(-16.93, 269.95, 343.5),
            vect(52.54, 279.72, 331.69),
            vect(43.09, 304.87, 298.18),
            vect(16.42, 270, 346.7),
            vect(-0.04, 270, 301.39),
            vect(-37.56, 265, 330.63),
            vect(-25.91, 275.04, 337.62),
        ]

        #Town goal position
        endPosition = vect(-18.05,269.95,338.16) - vect(0, 2, 0)
        thirdPersonPosition = vect(63.90, 267.70, 337.62)
        resetPosition = vect(55.21, 267.58, 343.41)
        #Base coordinates for world game settings HUD
        creditsPosition = vect(66.58, 270.88, 347.67)

rule "initialize red effects":
    @Condition __currentMap___ == 3676
    @Condition vishkarEventActivated == true
    # @Condition len(activePacket) == 0

    # waitUntil(len(activePacket) == 8, MAX_TIME)

    createEffect(localPlayer if activePacket[0] != null else null, 
        RED_PACK_EFFECT,
        RED_PACK_EFFECT_COLOR, activePacket[0],
        RED_PACK_EFFECT_ROUND, EffectReeval.VISIBILITY_POSITION_AND_RADIUS
    )

    createEffect(localPlayer if activePacket[1] != null else null, 
        RED_PACK_EFFECT,
        RED_PACK_EFFECT_COLOR, activePacket[1],
        RED_PACK_EFFECT_ROUND, EffectReeval.VISIBILITY_POSITION_AND_RADIUS
    )
    
    createEffect(localPlayer if activePacket[2] != null else null, 
        RED_PACK_EFFECT,
        RED_PACK_EFFECT_COLOR, activePacket[2],
        RED_PACK_EFFECT_ROUND, EffectReeval.VISIBILITY_POSITION_AND_RADIUS
    )

    createEffect(localPlayer if activePacket[3] != null else null, 
        RED_PACK_EFFECT,
        RED_PACK_EFFECT_COLOR, activePacket[3],
        RED_PACK_EFFECT_ROUND, EffectReeval.VISIBILITY_POSITION_AND_RADIUS
    )

    createEffect(localPlayer if activePacket[4] != null else null, 
        RED_PACK_EFFECT,
        RED_PACK_EFFECT_COLOR, activePacket[4],
        RED_PACK_EFFECT_ROUND, EffectReeval.VISIBILITY_POSITION_AND_RADIUS
    )

    createEffect(localPlayer if activePacket[5] != null else null, 
        RED_PACK_EFFECT,
        RED_PACK_EFFECT_COLOR, activePacket[5],
        RED_PACK_EFFECT_ROUND, EffectReeval.VISIBILITY_POSITION_AND_RADIUS
    )

    createEffect(localPlayer if activePacket[6] != null else null, 
        RED_PACK_EFFECT,
        RED_PACK_EFFECT_COLOR, activePacket[6],
        RED_PACK_EFFECT_ROUND, EffectReeval.VISIBILITY_POSITION_AND_RADIUS
    )

    createEffect(localPlayer if activePacket[7] != null else null, 
        RED_PACK_EFFECT,
        RED_PACK_EFFECT_COLOR, activePacket[7],
        RED_PACK_EFFECT_ROUND, EffectReeval.VISIBILITY_POSITION_AND_RADIUS
    )
    
    wait(getAverageServerLoad() / 100 * 0.032)
    # smallMessage(localPlayer, "  红包点位已创建")