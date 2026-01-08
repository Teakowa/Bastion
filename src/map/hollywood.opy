#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "map - hollywood":
    @Condition (__currentMap___ == Map.HOLLYWOOD or __currentMap___ == 1505) == true
    
    bastionPosition = [vect(-20.813, 9.795, -128.879), vect(-6.517, 15.305, -105.981), vect(-14.73, 6.027, -67.67), vect(4.162, 11.155, -39.796), vect(-15.818, 5.751, -7.412), vect(-1.715, 2.332, 10.867), vect(-31.241, 4.84, 49.397), vect(25.884, 7.646, -68.66)]
    endPosition = vect(-48.89, -0.15, 53.12)
    thirdPersonPosition = vect(-27.291, 3.92, -156.654)
    resetPosition = vect(-23.64, 3.92, -157.44)
    creditsPosition = vect(-31.65, 8.96, -175.05)
    startForcingSpawn(Team.1, 2)
    __currentMapText___ = "好莱坞"
    __currentMapPioneerText___ = __currentMapText___
    mapTitleRelation = [[7, 9], [7, 10], [8, 9], [8, 10], [10, 9], [10, 10], [18, 9], [18, 10], [19, 9], [19, 10], [24, 9], [24, 10], [29, 9], [29, 10], [13, 9], [13, 10]]
