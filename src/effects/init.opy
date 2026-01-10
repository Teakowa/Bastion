#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "initialize effects":
    hashTag = true
    eventId = -1
    wait(random.uniform(1, 2))
    setDifficulty()
    #player HUD
    #hudSubtext(getAllPlayers(), " \n\n                                                                                                                        ", HudPosition.LEFT, 0, null, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudText(localPlayer if localPlayer.heroNumber + 1 < len(heroList) and localPlayer.getHero() == heroList[localPlayer.heroNumber] else null, "{0}: {1}".format(STR_HUD_DEATHS, STR_HUD_DEATHS_VAL.format(localPlayer.progressionDeathCount, maxDeath if difficulty != 5 else "∞")), "", null, HudPosition.LEFT, 2, Color.WHITE, null, null, HudReeval.VISIBILITY_AND_STRING)
    hudText(localPlayer, "{0}: {1}".format(STR_HUD_HEROES, STR_HUD_HEROES_VAL.format(heroList.index(localPlayer.getHero()) + 1, len(heroList))), "", null, HudPosition.LEFT, 3, Color.WHITE, null, null, HudReeval.VISIBILITY_AND_STRING)
    if controlJumpPosition == null or portalPosition != null:
        goto lbl_0
    hudText([] if localPlayer.isWinner or localPlayer.getHero() != heroList[localPlayer.heroNumber] else localPlayer, heroIcon(heroList[localPlayer.heroNumber + 1]) if localPlayer.heroNumber + 1 < len(heroList) else iconString(Icon.FLAG), STR_HUD_NEXT_HERO, heroList[localPlayer.heroNumber + 1] if localPlayer.heroNumber + 1 < len(heroList) else STR_HUD_ESCAPED, HudPosition.LEFT, 4, rgb(36, 205, 244), Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    lbl_0:
    hudText([] if localPlayer.isWinner or localPlayer.getHero() == heroList[localPlayer.heroNumber] else localPlayer, iconString(Icon.NO), STR_HUD_NEXT_HERO, STR_HUD_UNLOCKED.format(heroIcon(heroList[localPlayer.heroNumber])), HudPosition.LEFT, 4, rgb(235, 45, 79), rgb(235, 45, 79), rgb(235, 45, 79), HudReeval.VISIBILITY_AND_STRING)
    hudText(localPlayer if localPlayer.isWinner else null, iconString(Icon.CHECKMARK), STR_HUD_NEXT_HERO, STR_HUD_CHALLENGE_COMPLETE, HudPosition.LEFT, 4, Color.GREEN, Color.GREEN, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(null if hashTag else localPlayer, STR_HUD_ACHIEVEMENT_DISABLED.format(iconString(Icon.WARNING)), HudPosition.LEFT, 4, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer if difficulty != 5 else null, STR_HUD_RUN_DEATHS.format(localPlayer.runDeathCount), HudPosition.LEFT, 5, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer, STR_HUD_RUN_SKIPS.format(localPlayer.skipCount), HudPosition.LEFT, 5, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(null if difficulty != 5 else localPlayer, STR_HUD_GRENADE_DMG.format(ceil(localPlayer.A36TGrenadeDmg)), HudPosition.LEFT, 5, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(null if difficulty != 5 else localPlayer, STR_HUD_GRENADE_HIT.format(localPlayer.A36TGrenadeHit, localPlayer.A36TGrenade), HudPosition.LEFT, 5, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer if localPlayer.A36TGrenadeAlive == true else null, STR_HUD_SURVIVOR.format(iconString(Icon.CHECKMARK) if localPlayer.A36TGrenadeAlive == true else null), HudPosition.LEFT, 100, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer if localPlayer.dlcTimeChallenge == 5 else null, STR_HUD_GAMBLER_KING.format(iconString(Icon.CHECKMARK) if localPlayer.dlcTimeChallenge == 5 else null), HudPosition.LEFT, 101, heroColor[2], HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer if localPlayer.isWinner else null, STR_HUD_TOTAL_TIME.format("{0}{1}{2}".format(STR_TIME_UNIT_HOUR.format(floor(localPlayer.winnerTime / 3600)) if localPlayer.winnerTime != null and localPlayer.winnerTime >= 3600 else "", STR_TIME_UNIT_MIN.format(floor(localPlayer.winnerTime % 3600 / 60)) if localPlayer.winnerTime != null and localPlayer.winnerTime >= 60 else "", STR_TIME_UNIT_SEC.format(floor(localPlayer.winnerTime % 60)) if localPlayer.winnerTime != null else STR_TIME_UNIT_ZERO_SEC)), HudPosition.LEFT, 51, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer if difficulty != 5 and localPlayer.progressionDeathCount == maxDeath else null, STR_HUD_SKIP_HINT.format(inputBindingString(Button.ULTIMATE)), HudPosition.LEFT, 6, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    #goal effects
    wait(0.5)
    createEffect(getPlayers(Team.1), Effect.RING, Color.TEAM_1, endPosition, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getPlayers(Team.1), Effect.LIGHT_SHAFT, Color.TEAM_1, endPosition, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createIcon(getPlayers(Team.1) if controlJumpPosition == null else [player for player in getPlayers(Team.1) if player.controlJumpIndex == evalOnce(len(controlRespawnPosition)) - 1], endPosition + vect(0, 5, 0), Icon.FLAG, IconReeval.VISIBILITY_AND_POSITION, Color.BLUE)
    if controlJumpPosition != null:
        createEffect(getPlayers(Team.1), Effect.RING, Color.YELLOW, controlJumpPosition[0], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createEffect(getPlayers(Team.1), Effect.LIGHT_SHAFT, Color.YELLOW, controlJumpPosition[0], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createIcon([player for player in getPlayers(Team.1) if player.controlJumpIndex == 0], controlJumpPosition[0] + vect(0, 5, 0), Icon.FLAG, IconReeval.VISIBILITY_AND_POSITION, Color.YELLOW)
        if controlJumpPosition[1] == null:
            goto lbl_1
        createEffect(getPlayers(Team.1), Effect.RING, Color.GREEN, controlJumpPosition[1], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createEffect(getPlayers(Team.1), Effect.LIGHT_SHAFT, Color.GREEN, controlJumpPosition[1], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createIcon([player for player in getPlayers(Team.1) if player.controlJumpIndex == 1], controlJumpPosition[1] + vect(0, 5, 0), Icon.FLAG, IconReeval.VISIBILITY_AND_POSITION, Color.GREEN)
        lbl_1:
    #mode info
    wait(0.5)
    if controlJumpPosition != null and evalOnce(portalPosition) == null:
        hudSubtext(getAllPlayers(), STR_HUD_WELCOME_MULTI.format(maxDeath) if difficulty != 5 else STR_HUD_WELCOME_MULTI_HARD, HudPosition.TOP, 0, rgb(255, 255, 255, 125), HudReeval.VISIBILITY_AND_STRING)
    else:
        hudSubtext(getAllPlayers(), STR_HUD_WELCOME_NORMAL.format(maxDeath) if difficulty != 5 else STR_HUD_WELCOME_NORMAL_HARD, HudPosition.TOP, 0, rgb(255, 255, 255, 125), HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(getAllPlayers(), f"{STR_MODE_CODE} | {STR_HUD_FOOTER_INFO}", HudPosition.TOP, 1, rgb(255, 255, 255, 125), HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(getAllPlayers(), "{0}：{1}".format(getCurrentMap() if __currentMapText___ == null else __currentMapText___, difficultyText[0]), HudPosition.RIGHT, -6, difficultyText[1], HudReeval.VISIBILITY_STRING_AND_COLOR)
    if evalOnce(dlcVishkarEvent):
        hudSubheader(null if eventId == -1 else localPlayer, STR_HUD_EVENT_GLOBAL.format(abilityIconString(Hero.SOMBRA, Button.ULTIMATE) if eventType == 1 else abilityIconString(Hero.ZENYATTA, Button.ABILITY_1), eventName, STR_TIME_UNIT_SEC.format(ceil(eventDurationHud))), HudPosition.LEFT, 68, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
        hudSubheader(null if eventId == -1 else localPlayer, "{0} {1}".format(abilityIconString(Hero.SOMBRA, Button.ULTIMATE) if eventType == 1 else abilityIconString(Hero.ZENYATTA, Button.ABILITY_1), eventDesc), HudPosition.LEFT, 69, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
        hudSubheader(localPlayer, STR_HUD_EVENT_STATS.format(localPlayer.eventCount[0], localPlayer.eventCount[1], localPlayer.eventCount[0] + localPlayer.eventCount[1] + localPlayer.eventCount[2]), HudPosition.LEFT, 5, rgb(heroColor[5].x, heroColor[5].y, heroColor[5].z), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
        hudSubheader(getAllPlayers(), STR_HUD_RANDOM_EVENTS, HudPosition.RIGHT, -5, difficultyText[1], HudReeval.VISIBILITY_STRING_AND_COLOR)
        hudSubheader(localPlayer, " \r\n\n", HudPosition.LEFT, 69, null, HudReeval.STRING, SpecVisibility.NEVER)
        hudSubheader(null if localPlayer.eventId == -1 else localPlayer, "{0} {1}（{2}）".format(abilityIconString(Hero.SOMBRA, Button.ULTIMATE) if localPlayer.eventType == 1 else abilityIconString(Hero.ZENYATTA, Button.ABILITY_1), localPlayer.eventName, "{0}秒".format(ceil(localPlayer.eventDurationHud)) if localPlayer.eventDuration > 0 else STR_MSG_DURATION_INSTANT), HudPosition.LEFT, 70, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
        hudSubheader(null if localPlayer.eventId == -1 else localPlayer, "{0} {1}".format(abilityIconString(Hero.SOMBRA, Button.ULTIMATE) if localPlayer.eventType == 1 else abilityIconString(Hero.ZENYATTA, Button.ABILITY_1), localPlayer.eventDesc), HudPosition.LEFT, 71, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(getAllPlayers(), STR_HUD_AUTO_RESTART.format("{0}{1}{2}".format(STR_TIME_UNIT_HOUR.format(floor((rebootTime - getTotalTimeElapsed()) / 3600)) if rebootTime - getTotalTimeElapsed() > 3599 else "", STR_TIME_UNIT_MIN.format(floor(((rebootTime - getTotalTimeElapsed()) % 3600) / 60)) if rebootTime - getTotalTimeElapsed() > 59 else "", STR_TIME_UNIT_SEC.format(floor((rebootTime - getTotalTimeElapsed()) % 60)))), HudPosition.RIGHT, -4, Color.YELLOW if rebootTime - getTotalTimeElapsed() <= 600 else Color.GRAY, HudReeval.VISIBILITY_STRING_AND_COLOR)
    hudSubheader(devPlayer, STR_HUD_SERVER_UPTIME.format("{0}{1}{2}".format(STR_TIME_UNIT_HOUR.format(floor(getTotalTimeElapsed() / 3600)) if getTotalTimeElapsed() >= 3600 else "", STR_TIME_UNIT_MIN.format(floor(getTotalTimeElapsed() % 3600 / 60)) if getTotalTimeElapsed() >= 60 else "", STR_TIME_UNIT_SEC.format(floor(getTotalTimeElapsed() % 60)))), HudPosition.RIGHT, -4, Color.GRAY, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(devPlayer, STR_HUD_SERVER_LOAD.format(getAverageServerLoad()), HudPosition.RIGHT, -2, Color.GRAY, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(getAllPlayers(), f"{STR_HUD_VERSION} {VERSION}", HudPosition.RIGHT, -3, Color.GRAY, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.AQUA, creditsPosition, random.uniform(1, 2), EffectReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.SKY_BLUE, creditsPosition, random.uniform(1, 2), EffectReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.WHITE, creditsPosition, random.uniform(1, 2), EffectReeval.VISIBILITY)
    wait(0.5)
    #3rd person camera
    createEffect(localPlayer, Effect.RING, Color.PURPLE, thirdPersonPosition, 1.2, EffectReeval.VISIBILITY)
    createInWorldText(localPlayer, STR_WORLD_THIRD_PERSON.format(inputBindingString(Button.JUMP), iconString(Icon.ARROW_DOWN)), thirdPersonPosition + Vector.UP * 1.3, 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    #reset progress ring
    wait(0.5)
    createEffect(localPlayer if localPlayer.heroNumber > 0 or localPlayer.runDeathCount > 0 else null, Effect.RING, Color.RED, resetPosition, 1.2, EffectReeval.VISIBILITY)
    createInWorldText(localPlayer if localPlayer.heroNumber > 0 or localPlayer.runDeathCount > 0 else null, STR_WORLD_RESET_PROGRESS.format(iconString(Icon.ARROW_DOWN)), resetPosition + Vector.UP * 1.3, 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    if springBoardPosition != null:
        createEffect(localPlayer, Effect.RING, Color.GREEN, springBoardPosition, 1.2, EffectReeval.VISIBILITY)
        createInWorldText(localPlayer, STR_WORLD_SPRINGBOARD.format(inputBindingString(Button.JUMP), iconString(Icon.ARROW_DOWN)), springBoardPosition + Vector.UP * 1.3, 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)



rule "3rd person":
    @Event eachPlayer
    @Condition distance(eventPlayer * vect(1, 0, 1), thirdPersonPosition * vect(1, 0, 1)) <= 1.2
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true
    @Condition eventPlayer.isAlive() == true
    
    wait(getServerLoad() / 100 * 0.032)
    setThirdPerson()


rule "springboard":
    @Event eachPlayer
    @Condition evalOnce(springBoardPosition) != null
    @Condition distance(eventPlayer * vect(1, 0, 1), springBoardPosition * vect(1, 0, 1)) <= 1.2
    @Condition eventPlayer.getPosition().y >= springBoardPosition.y
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true
    @Condition eventPlayer.isAlive() == true
    
    wait(getServerLoad() / 100 * 0.032, Wait.ABORT_WHEN_FALSE)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 200)
    eventPlayer.applyImpulse(Vector.UP, 14, Relativity.TO_PLAYER)
    wait(0.032)
    eventPlayer.applyImpulse(worldVector(Vector.FORWARD, eventPlayer, Transform.ROTATION), 3.5, Relativity.TO_WORLD)
    wait(5)


rule "portalPosition":
    @Event eachPlayer
    @Condition evalOnce(portalPosition) != null
    @Condition distance(eventPlayer * vect(1, 0, 1), portalPosition[0] * vect(1, 0, 1)) <= 1.2
    @Condition eventPlayer.getPosition().y >= portalPosition[0].y
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true
    @Condition eventPlayer.isAlive() == true
    
    wait(getServerLoad() / 100 * 0.032, Wait.ABORT_WHEN_FALSE)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 200)
    eventPlayer.teleport(nearestWalkablePosition(portalPosition.last()))
    wait(5)


