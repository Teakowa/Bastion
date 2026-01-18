#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "when a player joins, load player data if they have it and initialize them":
    @Event playerJoined
    @Team 1
    
    eventPlayer.isDev = evalOnce("{0}".format(eventPlayer) in devList)
    if not evalOnce(dlcVishkarEvent):
        goto lbl_0
    eventPlayer.eventId = -1
    eventPlayer.sizeHealth = 1
    lbl_0:
    wait(getAverageServerLoad() / 200 * random.uniform(1, 3))
    if "{0}".format(eventPlayer) in savedIndex:
        eventPlayer.heroNumber = savedHero[savedIndex.index("{0}".format(eventPlayer))]
        wait(eventPlayer.getSlot() * 0.032 + random.uniform(1, 3) * 0.05)
        eventPlayer.runDeathCount = savedDeaths[savedIndex.index("{0}".format(eventPlayer))]
        eventPlayer.isWinner = savedIsWinner[savedIndex.index("{0}".format(eventPlayer))]
        eventPlayer.skipCount = savedSkipCount[savedIndex.index("{0}".format(eventPlayer))]
        eventPlayer.winnerTime = savedWinnerTime[savedIndex.index("{0}".format(eventPlayer))]
        wait(eventPlayer.getSlot() * 0.032)
        eventPlayer.A36TGrenade = savedA36TGrenade[savedIndex.index("{0}".format(eventPlayer))]
        eventPlayer.A36TGrenadeHit = savedA36TGrenadeHit[savedIndex.index("{0}".format(eventPlayer))]
        eventPlayer.A36TGrenadeDmg = savedA36TGrenadeDmg[savedIndex.index("{0}".format(eventPlayer))]
        eventPlayer.A36TGrenadeAlive = savedA36TGrenadeAlive[savedIndex.index("{0}".format(eventPlayer))]
        if eventPlayer.joinTime == null or eventPlayer.joinTime == 0:
            eventPlayer.joinTime = savedJoinTime[savedIndex.index("{0}".format(eventPlayer))]
    else:
        if eventPlayer.joinTime == null or eventPlayer.joinTime == 0:
            eventPlayer.joinTime = evalOnce(getTotalTimeElapsed())
    eventPlayer.dmgReduc = false
    eventPlayer.invincible = false
    eventPlayer.startForcingHero(heroList[eventPlayer.heroNumber])
    eventPlayer.stopForcingCurrentHero()
    eventPlayer.setAllowedHeroes(heroList.slice(0, eventPlayer.heroNumber + 1))
    wait(6)
    if "{0}".format(eventPlayer) in titlePlayer:
        eventPlayer.playerTitleRelationIndex = titlePlayer.index("{0}".format(eventPlayer))
        setPlayerTitle()
        wait(0.032)
        smallMessage(eventPlayer, "  称号已加载")
        eventPlayer.playerTitleAndColor = [eventPlayer.playerTitles.last()[0], eventPlayer.playerTitles.last().last()]
        eventPlayer.rgb_vect = eventPlayer.playerTitleAndColor[1][0] if eventPlayer.playerTitleAndColor[1] != null else rgbList[eventPlayer.info_pvar[0]]
    eventPlayer.obstrucVis = []
    if "{0}".format(eventPlayer) in savedIndex:
        smallMessage(eventPlayer, "  你的进度已成功加载")
        smallMessage(getAllPlayers().exclude(eventPlayer), "  {0} 载入 {1}{2}".format(eventPlayer, heroIcon(heroList[eventPlayer.heroNumber]), heroList[eventPlayer.heroNumber]))


