#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "map - 阿特利斯":
    @Condition (__currentMap___ == Map.AATLIS or __currentMap___ == 1826) == true
    
    __currentMapPioneerText___ = "织金"
    __currentPioneerText___ = "门徒"
    #0 = X轴 1 = Y轴 2 = Z轴
    controlRespawnAxis = 2
    #距离阈值
    controlRespawnAxisThreshold = 30
    startForcingSpawn(Team.1, 1)
    # made by 芋泥玛奇朵
    bastionPosition = [vect(-27.310, 30.462, 99.799), vect(-45.351, 15.454, 79.671), vect(-23.956, 16.004, 43.016), vect(-29.999, 17.009,17.751), vect(-87.158, 14.004, -21.012), vect(-70.585, 13.295, 39.948), vect(-21.061, 13.813, -64.931), vect(-45.813, 14.934, -79.517),vect(4.542, 17.737, 61.038), vect(-4.835, 12.464, -0.137), vect(4.440, 17.737, -60.620), vect(-90.802, 14.002, -60.156)]
    controlRespawnPosition = vect(4.85, 15.5, 104.6)
    resetPosition = vect(16.37, 15, 104.47)
    thirdPersonPosition = vect(-6.21, 15, 104.33)
    creditsPosition = vect(5.1, 19.5, 105.79)
    endPosition = vect(-78.02, 9.19, -39.93)

    mapTitlePlayersByKey = [
        DATA_AATLIS[0].split("-"),
        DATA_AATLIS[1].split("-"),
        DATA_AATLIS[2].split("-")
    ]
