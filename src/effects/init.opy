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
    hudText(localPlayer if localPlayer.heroNumber + 1 < len(heroList) and localPlayer.getHero() == heroList[localPlayer.heroNumber] else null, "{0}: {1}".format("阵亡", "{0} / {1}".format(localPlayer.progressionDeathCount, maxDeath if difficulty != 5 else "∞")), "", null, HudPosition.LEFT, 2, Color.WHITE, null, null, HudReeval.VISIBILITY_AND_STRING)
    hudText(localPlayer, "{0}: {1}".format("英雄", "{0} / {1}".format(heroList.index(localPlayer.getHero()) + 1, len(heroList))), "", null, HudPosition.LEFT, 3, Color.WHITE, null, null, HudReeval.VISIBILITY_AND_STRING)
    if controlJumpPosition == null or portalPosition != null:
        goto lbl_0
    hudText([] if localPlayer.isWinner or localPlayer.getHero() != heroList[localPlayer.heroNumber] else localPlayer, heroIcon(heroList[localPlayer.heroNumber + 1]) if localPlayer.heroNumber + 1 < len(heroList) else iconString(Icon.FLAG), "下一个英雄", heroList[localPlayer.heroNumber + 1] if localPlayer.heroNumber + 1 < len(heroList) else "逃脱成功", HudPosition.LEFT, 4, rgb(36, 205, 244), Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    lbl_0:
    hudText([] if localPlayer.isWinner or localPlayer.getHero() == heroList[localPlayer.heroNumber] else localPlayer, iconString(Icon.NO), "下一个英雄", "{0} 已解锁！".format(heroIcon(heroList[localPlayer.heroNumber])), HudPosition.LEFT, 4, rgb(235, 45, 79), rgb(235, 45, 79), rgb(235, 45, 79), HudReeval.VISIBILITY_AND_STRING)
    hudText(localPlayer if localPlayer.isWinner else null, iconString(Icon.CHECKMARK), "下一个英雄", "挑战完成", HudPosition.LEFT, 4, Color.GREEN, Color.GREEN, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(null if hashTag else localPlayer, "成就挑战已禁用 {0}".format(iconString(Icon.WARNING)), HudPosition.LEFT, 4, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer if difficulty != 5 else null, "本轮共计 {0} 次阵亡".format(localPlayer.runDeathCount), HudPosition.LEFT, 5, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer, "本轮共计 {0} 次跳过".format(localPlayer.skipCount), HudPosition.LEFT, 5, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(null if difficulty != 5 else localPlayer, "榴弹共计 {0} 点伤害".format(ceil(localPlayer.A36TGrenadeDmg)), HudPosition.LEFT, 5, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(null if difficulty != 5 else localPlayer, "榴弹共计 {0}/{1} 命中/锁定".format(localPlayer.A36TGrenadeHit, localPlayer.A36TGrenade), HudPosition.LEFT, 5, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer if localPlayer.A36TGrenadeAlive == true else null, "大难不死 {0} ".format(iconString(Icon.CHECKMARK) if localPlayer.A36TGrenadeAlive == true else null), HudPosition.LEFT, 100, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer if localPlayer.dlcTimeChallenge == 5 else null, "赌王 {0} ".format(iconString(Icon.CHECKMARK) if localPlayer.dlcTimeChallenge == 5 else null), HudPosition.LEFT, 101, heroColor[2], HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer if localPlayer.isWinner else null, "通关总计耗时 {0}".format("{0}{1}{2}".format("{0} 小时".format(floor(localPlayer.winnerTime / 3600)) if localPlayer.winnerTime != null and localPlayer.winnerTime >= 3600 else "", "{0} 分".format(floor(localPlayer.winnerTime % 3600 / 60)) if localPlayer.winnerTime != null and localPlayer.winnerTime >= 60 else "", "{0} 秒".format(floor(localPlayer.winnerTime % 60)) if localPlayer.winnerTime != null else "0 秒")), HudPosition.LEFT, 51, rgb(160, 169, 186), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(localPlayer if difficulty != 5 and localPlayer.progressionDeathCount == maxDeath else null, "[秘籍] 使用终极技能跳过({0}) ".format(inputBindingString(Button.ULTIMATE)), HudPosition.LEFT, 6, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
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
        hudSubtext(getAllPlayers(), "欢迎来到三合一大地图！你需要挑战所有小地图并到达终点！阵亡 {0} 次之后可跳过英雄".format(maxDeath) if difficulty != 5 else "欢迎来到三合一大地图！你需要挑战所有小地图并到达终点！当前难度无法跳过英雄，加油吧！", HudPosition.TOP, 0, rgb(255, 255, 255, 125), HudReeval.VISIBILITY_AND_STRING)
    else:
        hudSubtext(getAllPlayers(), "使用全部英雄通关，一旦你解锁了一个英雄就可以在后续的游戏中随时使用！当阵亡 {0} 次之后可跳过英雄".format(maxDeath) if difficulty != 5 else "使用全部英雄通关！当前难度无法跳过英雄，加油吧！", HudPosition.TOP, 0, rgb(255, 255, 255, 125), HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(getAllPlayers(), "{0}代码：SVMQK | 500强交流群：445152554 | 加群给你喜欢的事件点赞 \n".format(""), HudPosition.TOP, 1, rgb(255, 255, 255, 125), HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(getAllPlayers(), "{0}：{1}".format(getCurrentMap() if __currentMapText___ == null else __currentMapText___, difficultyText[0]), HudPosition.RIGHT, -6, difficultyText[1], HudReeval.VISIBILITY_STRING_AND_COLOR)
    if evalOnce(dlcVishkarEvent):
        hudSubheader(null if eventId == -1 else localPlayer, "全局事件：{0} {1}（{2}）".format(abilityIconString(Hero.SOMBRA, Button.ULTIMATE) if eventType == 1 else abilityIconString(Hero.ZENYATTA, Button.ABILITY_1), eventName, "{0}秒".format(ceil(eventDurationHud))), HudPosition.LEFT, 68, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
        hudSubheader(null if eventId == -1 else localPlayer, "{0} {1}".format(abilityIconString(Hero.SOMBRA, Button.ULTIMATE) if eventType == 1 else abilityIconString(Hero.ZENYATTA, Button.ABILITY_1), eventDesc), HudPosition.LEFT, 69, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
        hudSubheader(localPlayer, "{0}/{1}/{2} 增益/减益/总计".format(localPlayer.eventCount[0], localPlayer.eventCount[1], localPlayer.eventCount[0] + localPlayer.eventCount[1] + localPlayer.eventCount[2]), HudPosition.LEFT, 5, rgb(heroColor[5].x, heroColor[5].y, heroColor[5].z), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
        hudSubheader(getAllPlayers(), "［随机事件］", HudPosition.RIGHT, -5, difficultyText[1], HudReeval.VISIBILITY_STRING_AND_COLOR)
        hudSubheader(localPlayer, " \r\n\n", HudPosition.LEFT, 69, null, HudReeval.STRING, SpecVisibility.NEVER)
        hudSubheader(null if localPlayer.eventId == -1 else localPlayer, "{0} {1}（{2}）".format(abilityIconString(Hero.SOMBRA, Button.ULTIMATE) if localPlayer.eventType == 1 else abilityIconString(Hero.ZENYATTA, Button.ABILITY_1), localPlayer.eventName, "{0}秒".format(ceil(localPlayer.eventDurationHud)) if localPlayer.eventDuration > 0 else "一次性"), HudPosition.LEFT, 70, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
        hudSubheader(null if localPlayer.eventId == -1 else localPlayer, "{0} {1}".format(abilityIconString(Hero.SOMBRA, Button.ULTIMATE) if localPlayer.eventType == 1 else abilityIconString(Hero.ZENYATTA, Button.ABILITY_1), localPlayer.eventDesc), HudPosition.LEFT, 71, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(getAllPlayers(), "距自动重开 {0}".format("{0}{1}{2}".format("{0} 小时 ".format(floor((rebootTime - getTotalTimeElapsed()) / 3600)) if rebootTime - getTotalTimeElapsed() > 3599 else "", "{0} 分 ".format(floor(((rebootTime - getTotalTimeElapsed()) % 3600) / 60)) if rebootTime - getTotalTimeElapsed() > 59 else "", "{0} 秒".format(floor((rebootTime - getTotalTimeElapsed()) % 60)))), HudPosition.RIGHT, -4, Color.YELLOW if rebootTime - getTotalTimeElapsed() <= 600 else Color.GRAY, HudReeval.VISIBILITY_STRING_AND_COLOR)
    hudSubheader(devPlayer, "已运行 {0}".format("{0}{1}{2}".format("{0} 小时 ".format(floor(getTotalTimeElapsed() / 3600)) if getTotalTimeElapsed() >= 3600 else "", "{0} 分 ".format(floor(getTotalTimeElapsed() % 3600 / 60)) if getTotalTimeElapsed() >= 60 else "", "{0} 秒".format(floor(getTotalTimeElapsed() % 60)))), HudPosition.RIGHT, -4, Color.GRAY, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(devPlayer, "  服务器负载 {0}".format(getAverageServerLoad()), HudPosition.RIGHT, -2, Color.GRAY, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(getAllPlayers(), "版本 26.0109.1", HudPosition.RIGHT, -3, Color.GRAY, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.AQUA, creditsPosition, random.uniform(1, 2), EffectReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.SKY_BLUE, creditsPosition, random.uniform(1, 2), EffectReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.WHITE, creditsPosition, random.uniform(1, 2), EffectReeval.VISIBILITY)
    wait(0.5)
    #3rd person camera
    createEffect(localPlayer, Effect.RING, Color.PURPLE, thirdPersonPosition, 1.2, EffectReeval.VISIBILITY)
    createInWorldText(localPlayer, "      按{0}切换第三人称视角\n                    {1}".format(inputBindingString(Button.JUMP), iconString(Icon.ARROW_DOWN)), thirdPersonPosition + Vector.UP * 1.3, 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    #reset progress ring
    wait(0.5)
    createEffect(localPlayer if localPlayer.heroNumber > 0 or localPlayer.runDeathCount > 0 else null, Effect.RING, Color.RED, resetPosition, 1.2, EffectReeval.VISIBILITY)
    createInWorldText(localPlayer if localPlayer.heroNumber > 0 or localPlayer.runDeathCount > 0 else null, "重置进度\n                {0}".format(iconString(Icon.ARROW_DOWN)), resetPosition + Vector.UP * 1.3, 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    if springBoardPosition != null:
        createEffect(localPlayer, Effect.RING, Color.GREEN, springBoardPosition, 1.2, EffectReeval.VISIBILITY)
        createInWorldText(localPlayer, "      按{0}向上弹射\n                    {1}".format(inputBindingString(Button.JUMP), iconString(Icon.ARROW_DOWN)), springBoardPosition + Vector.UP * 1.3, 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)



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


