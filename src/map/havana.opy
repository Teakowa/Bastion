#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "map - havana":
    @Condition __currentMap___ == Map.HAVANA
    
    bastionPosition = vect(117.332, 14.433, -58.091)
    bastionPosition.append(vect(97, 9.01, -25.51))
    bastionPosition.append(vect(62.21, 12.06, -83.3))
    bastionPosition.append(vect(11.58, 7.96, -52.71))
    bastionPosition.append(vect(10.13, 6, -100.38))
    bastionPosition.append(vect(-37.54, 8.23, -72.23))
    bastionPosition.append(vect(-77.17, 10.13, -66.78))
    endPosition = vect(-77.24, 7.22, -49.83)
    thirdPersonPosition = vect(158.256, 11, -47.739)
    resetPosition = vect(158.3, 11, -44.35)
    creditsPosition = vect(193.45, 13.25, -46.49)
    startForcingSpawn(Team.1, 2)
    mapTitleRelation = [[0, 9], [0, 10], [1, 9], [1, 10], [10, 9], [10, 10], [9, 9], [9, 10], [6, 9], [6, 10], [7, 9], [7, 10], [8, 9], [8, 10], [12, 9], [12, 10], [4, 9], [4, 10], [19, 9], [19, 10], [18, 9], [18, 10], [24, 9], [24, 10], [13, 9], [13, 10]]