#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "increment death counter (progressionDeathCount) on death":
    @Event playerDied
    @Team 1
    @Condition all([eventPlayer.getHero() == heroList[eventPlayer.heroNumber], eventPlayer.progressionDeathCount < maxDeath, eventPlayer.heroNumber + 1 < len(heroList), attacker != null, attacker != eventPlayer]) == true
    
    eventPlayer.progressionDeathCount++


rule "display death progress as ult charge":
    @Event eachPlayer
    @Team 1
    @Condition difficulty != 5
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.eventType == 0, eventPlayer.eventId == 23]) == false
    @Condition eventPlayer.progressionDeathCount < maxDeath
    @Condition eventPlayer.isWinner == false
    @Condition (eventPlayer.getHero() == Hero.DVA and eventPlayer.isInAlternateForm()) == false
    @Condition round(eventPlayer.getUltCharge() / (100 / maxDeath)) != eventPlayer.progressionDeathCount
    
    wait(random.uniform(0.1, 0.5) * getAverageServerLoad() / 100, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setUltCharge(100 * eventPlayer.progressionDeathCount / maxDeath)
    if ruleCondition:
        loop()


rule "display message if hero available":
    @Event eachPlayer
    @Team 1
    @Condition difficulty != 5
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.eventType == 0, eventPlayer.eventId == 23]) != true
    @Condition eventPlayer.progressionDeathCount == maxDeath
    @Condition eventPlayer.heroNumber + 1 < len(heroList)
    @Condition (eventPlayer.getHero() == Hero.DVA and eventPlayer.isInAlternateForm()) == false
    @Condition eventPlayer.isAlive() == true
    
    wait(getServerLoad() / 100)
    if eventPlayer.getUltCharge() == 100:
        eventPlayer.setUltCharge(0)
        wait(0.2)
    bigMessage(eventPlayer, "可跳过当前英雄")
    eventPlayer.I = 0
    while eventPlayer.getUltCharge() != 100:
        eventPlayer.setUltCharge(100)
        wait(0.05)
        eventPlayer.I++
        if I == 5:
            return


rule "players can use ultimate to progress to the next hero after dying a number of times (maxDeath)":
    @Event eachPlayer
    @Team 1
    @Condition difficulty != 5
    @Condition eventPlayer.progressionDeathCount >= maxDeath
    @Condition (eventPlayer.isUsingUltimate() or eventPlayer.isDuplicatingAHero()) == true
    @Condition eventPlayer.heroNumber + 1 < len(heroList)
    @Condition eventPlayer.getHero() != Hero.BASTION
    
    wait(1)
    eventPlayer.respawn()
    eventPlayer.progressionDeathCount = 0
    eventPlayer.skipCount++
    progressHero()



rule "display instructions when a player enters the reset ring":
    @Event eachPlayer
    @Team 1
    @Condition (eventPlayer.heroNumber > 0 or eventPlayer.runDeathCount > 0) == true
    @Condition eventPlayer in getPlayersInRadius(resetPosition, 20, Team.1) == true
    @Condition distance(eventPlayer.getPosition() * vect(1, 0, 1), resetPosition * vect(1, 0, 1)) <= 1.2
    
    bigMessage(eventPlayer, "长按装填键重置")


rule "holding rel\ufeffoad while in the reset ring resets your progress":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Condition (eventPlayer.runDeathCount > 0 or eventPlayer.heroNumber > 0) == true
    @Condition distance(eventPlayer * vect(1, 0, 1), resetPosition * vect(1, 0, 1)) <= 1.2
    
    eventPlayer.preloadHero(heroList[0])
    smallMessage(eventPlayer, "  正在重置进度...")
    wait(2, Wait.ABORT_WHEN_FALSE)
    playEffect(eventPlayer, DynamicEffect.DEBUFF_IMPACT_SOUND, null, eventPlayer.getPosition(), 100)
    eventPlayer.runDeathCount = 0
    eventPlayer.progressionDeathCount = 0
    eventPlayer.isWinner = false
    eventPlayer.winnerTime = 0
    eventPlayer.heroNumber = 0
    eventPlayer.skipCount = 0
    smallMessage(getAllPlayers(), "  {0} 重置了进度".format(eventPlayer))
    wait()
    eventPlayer.startForcingHero(heroList[0])
    wait()
    eventPlayer.stopForcingCurrentHero()
    wait(getServerLoad() / 100 * 0.5)
    eventPlayer.setAllowedHeroes(heroList.slice(0, eventPlayer.heroNumber + 1))
    savePlayerData()

