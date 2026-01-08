#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "map - eichenwalde":
    @Condition (__currentMap___ == Map.EICHENWALDE or __currentMap___ == 565) == true
    
    bastionPosition = vect(115.78, 14.732, -29.038)
    bastionPosition.append(vect(119.48, 18.855, -43.12))
    bastionPosition.append(vect(54.429, 23.32, -102.936))
    bastionPosition.append(vect(75.164, 12.66, -71.852))
    bastionPosition.append(vect(36.49, 8.938, -71.14))
    bastionPosition.append(vect(2.584, 8.026, -63.687))
    bastionPosition.append(vect(-12.503, 3.514, -31.548))
    bastionPosition.append(vect(0.632, 6.073, -2.154))
    bastionPosition.append(vect(-32.381, -1.334, 0.005))
    bastionPosition.append(vect(70.234, 18.381, -65.979))
    bastionPosition.append(vect(8.544, 10.396, -42.598))
    endPosition = vect(-26.72, 1.97, -34.09)
    thirdPersonPosition = vect(131.335, 10.72, 1.098)
    resetPosition = vect(128.06, 10.72, 1.84)
    creditsPosition = vect(132.82, 13.72, 9.04)
    startForcingSpawn(Team.1, 2)
    __currentMapText___ = "阿德勒斯布鲁恩" if __currentMap___ == 565 else getCurrentMap()
    __currentMapPioneerText___ = __currentMapText___
    mapTitleRelation = [[6, 9], [6, 10], [6, 0], [4, 9], [4, 10], [7, 9], [7, 10], [7, 0], [14, 9], [13, 9], [13, 10], [17, 9], [21, 9], [12, 9], [12, 10], [12, 0], [9, 9], [9, 10], [9, 0], [10, 9], [10, 10], [10, 0], [8, 9], [8, 10], [8, 0], [18, 9], [18, 10], [18, 0], [28, 9], [28, 10], [19, 9], [19, 10], [19, 0], [20, 9], [20, 10], [20, 0]]