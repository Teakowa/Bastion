#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "map - temple of anubis":
    @Condition __currentMap___ == Map.TEMPLE_OF_ANUBIS
    
    bastionPosition = vect(-17.188, 11.237, 105.646)
    bastionPosition.append(vect(-3.47, 20.35, 97.61))
    bastionPosition.append(vect(-4.69, 22.57, 79.47))
    bastionPosition.append(vect(-37.62, 1.91, 47.85))
    bastionPosition.append(vect(-25.2, 1.07, 25.16))
    bastionPosition.append(vect(-37.5, 16.8, -4.79))
    bastionPosition.append(vect(-0.35, 17.87, -24.21))
    endPosition = vect(-7.02, -0.66, -36.43)
    springBoardPosition = vect(-47.93, 1.5, 51.33)
    thirdPersonPosition = vect(-7.969, 4.701, 137.39)
    resetPosition = vect(-17.16, 4.46, 137.76)
    creditsPosition = vect(-11.3, 7.35, 149.11)
    startForcingSpawn(Team.1, 1)
    mapTitleRelation = [[10, 0], [10, 9], [10, 10], [8, 9], [8, 10], [12, 9], [12, 10], [12, 0], [6, 9], [6, 10], [7, 0], [7, 9], [7, 10], [9, 0], [9, 9], [9, 10], [17, 9], [17, 0], [18, 9], [18, 10], [19, 9], [19, 10], [24, 9], [24, 10], [28, 9], [28, 10], [13, 9], [13, 10]]