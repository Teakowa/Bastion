#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

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