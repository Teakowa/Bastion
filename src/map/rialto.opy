#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "map - rialto":
    @Condition __currentMap___ == Map.RIALTO
    
    startForcingSpawn(Team.1, 2)
    #图外重生点
    controlRespawnPosition = vect(-52.36, 3.83, -176.36)
    controlRespawnPosition.append(vect(53.17, 1.25, 22.99))
    bastionPosition = vect(-64.421, 5.04, -125.927)
    bastionPosition.append(vect(-16.976, 1.66, -38.459))
    bastionPosition.append(vect(-36.002, 4.75, -77.344))
    bastionPosition.append(vect(59.058, 0.07, -8.103))
    bastionPosition.append(vect(54.797, 1.74, -59.938))
    bastionPosition.append(vect(87.874, -0.37, 0.268))
    #高塔
    bastionPosition.append(vect(60.53, 50.43, 61.63))
    bastionPosition.append(vect(-13.12, 4.75, 47.31))
    bastionPosition.append(vect(27.18, 4.75, 36.89))
    bastionPosition.append(vect(20.9, 0.75, 54.61))
    bastionPosition.append(vect(-19.85, 10.75, 11.92))
    controlJumpPosition = vect(98.662, -1.5, -21.009)
    endPosition = vect(-12.27, -1.25, -14.73)
    thirdPersonPosition = vect(-54.92, 3.75, -158.32)
    resetPosition = vect(-59.05, 3.75, -158.41)
    creditsPosition = vect(-57.06, 5.25, -181.51)

    mapTitlePlayersByKey = DATA_RIALTO