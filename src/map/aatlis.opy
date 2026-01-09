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
    controlRespawnAxisThreshold = 60
    startForcingSpawn(Team.1, 1)
    controlRespawnPosition = vect(4.85, 15.5, 104.6)
    resetPosition = vect(16.37, 15, 104.47)
    thirdPersonPosition = vect(-6.21, 15, 104.33)
    creditsPosition = vect(5.1, 19.5, 105.79)
    endPosition = vect(-78.02, 9.19, -39.93)