#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


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