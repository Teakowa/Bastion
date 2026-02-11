#!mainFile "../../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "未经原作者许可，任何人不得将以下代码进行二次创作与发布":
    @Disabled
    @Delimiter
    
rule "[VishkarEvent]: 马到成功":
    @Event eachPlayer
    @Team 1
    @Condition all([dlcVishkarEvent, eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 34]) == true
    
    wait(getAverageServerLoad() / 100 * 0.032)
    createEffect(getAllPlayers(), Effect.SOLDIER_SPRINTING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    eventPlayer.mod_speed_event = EVT_34_SPEED_BOOST
    updatePlayerStats()
    wait(eventPlayer.eventDuration)
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()
    clearEventEffect()

rule "[VishkarEvent]: 一马当先":
    @Event eachPlayer
    @Team 1
    @Condition all([dlcVishkarEvent, eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 35]) == true
    
    wait(getAverageServerLoad() / 100 * 0.032)
    eventPlayer.dlcTimeChallenge[1]++
    if sorted(getPlayers(Team.1), lambda i: i.heroNumber)[0] == eventPlayer:
        eventPlayer.mod_dmg_perma += EVT_35_DMG_TAKEN_DELTA
        eventPlayer.mod_speed_perma += EVT_35_SPEED_DELTA
        eventPlayer.heart_steel += EVT_35_HP_LAYER
        updatePlayerStats()
    elif eventPlayer.heroNumber + 1 < len(heroList) and eventPlayer.getHero() == heroList[eventPlayer.heroNumber]:
        eventPlayer.respawn()
        eventPlayer.heroNumber = sorted(getPlayers(Team.1), lambda i: i.heroNumber)[0].heroNumber 
        progressHero()
    
rule "[VishkarEvent]: 一马当先":
    @Condition dlcVishkarEvent == true
    @Condition buffEvent[35][3] == 0

    waitUntil(getTotalTimeElapsed() >= 900, 1000)
    buffEvent[35][3] = EVT_BUFF_35_WEIGHT
    
rule "[VishkarEvent]: 龙马精神":
    @Event eachPlayer
    @Team 1
    @Condition all([dlcVishkarEvent, eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 36, eventPlayer.getHealth() <= eventPlayer.getMaxHealth() * EVT_36_TRIGGER_HP_PERCENT]) == true
    
    wait(getAverageServerLoad() / 100 * 0.032)
    eventPlayer.startHealingOverTime(eventPlayer, 1, eventPlayer.getMaxHealth() * EVT_36_HEAL_PERCENT)
    wait(2)

rule "[VishkarEvent]: 爆竹声声":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 37]) == true
    
    ([player for player in getPlayers(Team.2) if distance(eventPlayer, player) <= EVT_BUFF_37_RADIUS]).setStatusEffect(null, Status.KNOCKED_DOWN, EVT_BUFF_37_KNOCKDOWN_DURATION)
    playEffect(getAllPlayers(), DynamicEffect.DVA_SELF_DESTRUCT_EXPLOSION, Color.TEAM_2, eventPlayer, 200)
    wait(eventPlayer.eventDuration)

rule "[VishkarEvent]: 我不需要治疗":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 38]) == true
    @Condition eventPlayer.isCommunicating(Comms.NEED_HELP) or eventPlayer.isCommunicating(Comms.NEED_HEALING) == true
    
    heal(eventPlayer, eventPlayer, EVT_38_HEAL)
    wait(0.5)
    if ruleCondition:
        loop()

rule "[VishkarEvent]: 礼貌金":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 39, eventPlayer.isCommunicating(Comms.HELLO)]) == true
    
    if random.randint(0, 100) < 50:
        goto lbl_0
    sorted([player for player in getLivingPlayers(getOppositeTeam(eventPlayer.getTeam())) if eventPlayer.isInViewAngle(player, 75)], lambda i: distance(i, eventPlayer))[0].setStatusEffect(null, Status.STUNNED, 1)
    lbl_0:
    wait(0.96)

rule "[VishkarEvent]: 费斯卡时空信标":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 40, eventPlayer.isHoldingButton(Button.RELOAD), eventPlayer.controlPlayerRespawnPosition == null]) == true
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    eventPlayer.controlPlayerRespawnPosition = [eventPlayer.getPosition(), eventPlayer.getFacingDirection()]
    playEffect(getAllPlayers(), DynamicEffect.SOMBRA_TRANSLOCATING_MATERIAL, Color.TEAM_1, eventPlayer, 200)
    playEffect(eventPlayer, DynamicEffect.SOMBRA_TRANSLOCATING_SOUND, Color.WHITE, eventPlayer, 100)
    if eventPlayer.eventEffect == null:
        createEffect(eventPlayer, Effect.SPARKLES, Color.YELLOW, eventPlayer.controlPlayerRespawnPosition[0], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.eventEffect = getLastCreatedEntity()
    wait(2)

rule "[VishkarEvent]: 费斯卡时空信标":
    @Event playerDied
    @Team 1
    @Condition evalOnce(controlRespawnPosition) == null
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 40, eventPlayer.isHoldingButton(Button.RELOAD), eventPlayer.controlPlayerRespawnPosition != null]) == true

    wait(0.5, Wait.ABORT_WHEN_FALSE)
    playEffect(getAllPlayers(), DynamicEffect.TRACER_RECALL_DISAPPEAR, Color.TEAM_1, eventPlayer, 200)
    wait(0.032)
    eventPlayer.teleport(eventPlayer.controlPlayerRespawnPosition[0])
    playEffect(getAllPlayers(), DynamicEffect.TRACER_RECALL_REAPPEAR, Color.TEAM_1, eventPlayer, 200)
    wait(0.032)
    eventPlayer.controlPlayerRespawnPosition = null
    clearEventEffect()

rule "[VishkarEvent]: 红包刺客":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 22]) == true
    
    eventPlayer.setStatusEffect(eventPlayer, Status.INVINCIBLE, 0.5)
    createEffect(getAllPlayers(), Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.invincibleEffect = getLastCreatedEntity()
    wait(0.5)
    stopChasingVariable(eventPlayer.hack_timer)
    eventPlayer.setStatusEffect(getPlayersOnHero(Hero.BASTION, Team.2)[0], Status.HACKED, 8)
    playEffect(getAllPlayers(), DynamicEffect.SOMBRA_HACKED_STARTING, Color.TEAM_2, eventPlayer, 200)
    eventPlayer.hack_timer = 8
    chaseAtRate(eventPlayer.hack_timer, 0, 1, ChaseRateReeval.NONE)

rule "[VishkarEvent]: 惊吓红包":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 23]) == true
    
    eventPlayer.startFacing(directionTowards(evalOnce(Vector.BACKWARD), eventPlayer.getEyePosition()), 360)
    eventPlayer.mod_speed_event = -50
    updatePlayerStats()
    eventPlayer.startThrottleInDirection(Vector.FORWARD, 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.NONE)
    wait(eventPlayer.eventDuration)
    eventPlayer.stopThrottleInDirection()
    eventPlayer.stopFacing()
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()

rule "[VishkarEvent]: 岁岁平安":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 24]) == true
    
    wait()
    # waitUntil(eventPlayer.isAlive(), eventPlayer.eventDuration)
    eventPlayer.mod_speed_event = EVT_DEBUFF_24_SPEED_DELTA
    eventPlayer.mod_dmg_perma = EVT_DEBUFF_24_DMG_TAKEN_DELTA
    updatePlayerStats()
    wait(EVT_DEBUFF_24_DURATION)
    eventPlayer.mod_speed_event = 0
    eventPlayer.mod_dmg_perma = 0
    updatePlayerStats()

rule "[VishkarEvent]: 登月火箭":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 25]) == true

    eventPlayer.startForcingThrottle(0, 0, 0, 0, 0, 0)
    eventPlayer.setGravity(5)
    eventPlayer.applyImpulse(Vector.UP, 85, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    wait(EVT_DEBUFF_25_DURATION)
    eventPlayer.stopForcingThrottle()
    eventPlayer.setGravity(100)

rule "[VishkarEvent]: 凛冬盛宴":
    @Event playerDied
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 26, attacker.getHero() == Hero.BASTION]) == true
    
    bigMessage(getAllPlayers(), "凛冬盛宴！")
    smallMessage(getPlayers(Team.1), "  {0} {1} 阵亡触发了凛冬盛宴".format(iconString(Icon.WARNING), eventPlayer))
    getPlayers(Team.2).hasNano = true
    eventId = 2
    berserkerTime += EVT_DEBUFF_11_BERSERK_ADD
    wait(EVT_DEBUFF_11_COOLDOWN)
