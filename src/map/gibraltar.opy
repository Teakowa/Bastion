#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "map - watchpoint gibraltar":
    @Condition __currentMap___ == Map.WATCHPOINT_GIBRALTAR
    
    __currentMapText___ = "直布罗陀"
    __currentMapPioneerText___ = __currentMapText___
    bastionPosition[0] = vect(70.099, 9, 26.803)
    bastionPosition[1] = vect(81.759, 6, 3.2)
    bastionPosition[2] = vect(64.465, 9.69, -32.138)
    bastionPosition[3] = vect(32.373, 3, -50.866)
    bastionPosition[4] = vect(31.113, 7.3, -89.871)
    bastionPosition[5] = vect(56.88, 9.23, -118.92)
    bastionPosition[6] = vect(19.43, 6, -131.05)
    endPosition = vect(15.7, -2, -134.65)
    thirdPersonPosition = vect(93.88, 1.06, 63.17)
    resetPosition = vect(97.55, 1.06, 60.38)
    creditsPosition = vect(112.23, 0, 73.59)
    startForcingSpawn(Team.1, 2)
    mapTitleRelation = [[6, 9], [6, 10], [8, 9], [8, 10], [10, 9], [10, 10], [7, 9], [7, 10], [9, 9], [9, 10], [12, 9], [12, 10], [18, 9], [18, 10], [19, 9], [19, 10], [13, 9], [13, 10]]