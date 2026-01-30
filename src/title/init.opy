#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "initialize player title":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.playerTitleAndColor != null
    @Condition eventPlayer.titleTextID == null
    
    wait(eventPlayer.getSlot() * 0.08)
    eventPlayer.info_pvar = 0
    createInWorldText([player for player in getAllPlayers() if isInLoS(eventPlayer, player)], "{0}{1}".format(abilityIconString(Hero.TORBJORN, Button.ABILITY_2) if eventPlayer.isDev else "", eventPlayer.playerTitleAndColor[0]), eventPlayer, 1 if eventPlayer.isDev else 0.8, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR, rgb(eventPlayer.rgb_vect.x, eventPlayer.rgb_vect.y, eventPlayer.rgb_vect.z))
    eventPlayer.titleTextID = getLastCreatedText()


rule "update title color":
    @Event eachPlayer
    @Condition eventPlayer.isDev == true
    @Condition antiCrashActivated == false
    @Condition eventPlayer.playerTitleAndColor[1] == null
    @Condition len(eventPlayer.playerTitleAndColor[1]) == 0
    
    wait(0.016, Wait.ABORT_WHEN_FALSE)
    eventPlayer.info_pvar = (eventPlayer.info_pvar + 1) % len(rgbList)
    chaseOverTime(eventPlayer.rgb_vect, rgbList[eventPlayer.info_pvar], 1.5, ChaseTimeReeval.NONE)
    waitUntil(eventPlayer.rgb_vect == rgbList[eventPlayer.info_pvar], MAX_TIME)
    if ruleCondition:
        loop()
    stopChasingVariable(eventPlayer.rgb_vect)
    eventPlayer.info_pvar = 0


rule "update title color":
    @Event eachPlayer
    @Condition antiCrashActivated == false
    @Condition eventPlayer.playerTitleAndColor[1] != null
    @Condition len(eventPlayer.playerTitleAndColor[1]) > 1
    @Condition eventPlayer.rgb_activated == true
    
    wait(0.016, Wait.ABORT_WHEN_FALSE)
    eventPlayer.info_pvar = (eventPlayer.info_pvar + 1) % len(eventPlayer.playerTitleAndColor[1])
    chaseOverTime(eventPlayer.rgb_vect, eventPlayer.playerTitleAndColor[1][eventPlayer.info_pvar], 2.5, ChaseTimeReeval.NONE)
    waitUntil(eventPlayer.rgb_vect == eventPlayer.playerTitleAndColor[1][eventPlayer.info_pvar] or not eventPlayer.rgb_activated, MAX_TIME)
    if ruleCondition:
        loop()
    wait()
    stopChasingVariable(eventPlayer.rgb_vect)
    eventPlayer.info_pvar = 0
    eventPlayer.rgb_vect = eventPlayer.playerTitleAndColor[1][0]


