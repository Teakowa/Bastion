#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "map - paraiso":
    @Condition __currentMap___ == Map.PARAISO
    
    bastionPosition = vect(-47.03, 6.86, -141.73)
    bastionPosition.append(vect(5.22, 12, -122))
    bastionPosition.append(vect(-5.81, 10, -88.75))
    bastionPosition.append(vect(10.08, 3.9, -56.92))
    bastionPosition.append(vect(-13.62, 8.22, -44.11))
    bastionPosition.append(vect(11.42, 5.1, -24.26))
    bastionPosition.append(vect(-6.88, 0.5, 26.09))
    bastionPosition.append(vect(-40.63, 3, 40.01))
    endPosition = vect(-39.54, -2, 62.86)
    thirdPersonPosition = vect(-78.25, 6.33, -167.96)
    resetPosition = vect(-78.3, 5.03, -170.8)
    creditsPosition = vect(-70.2, 7.75, -183.14)
    startForcingSpawn(Team.1, 2)
    mapTitleRelation = [[10, 9], [10, 10], [9, 9], [9, 10], [6, 9], [6, 10], [8, 9], [8, 10], [7, 9], [7, 10], [12, 9], [12, 10], [18, 9], [18, 10], [19, 9], [19, 10], [24, 9], [24, 10], [28, 9], [28, 10], [13, 9], [13, 10]]
