#!mainFile "../main.opy"


#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "未经原作者许可，任何人不得将以下代码进行二次创作与发布":
    @Disabled
    @Delimiter
    


rule "[VishkarEvent]: 疾风祝福":
    @Event eachPlayer
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 1]) == true
    
    wait(getAverageServerLoad() / 100 * 0.032)
    createEffect(getAllPlayers(), Effect.SOLDIER_SPRINTING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    eventPlayer.mod_speed_event = 50
    updatePlayerStats()
    wait(eventPlayer.eventDuration)
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 钢铁防线":
    @Event eachPlayer
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 2]) == true
    
    wait(0.032)
    if eventPlayer.healthId[1] == null:
        goto lbl_0
    removeHealthPool(eventPlayer.healthId[1])
    lbl_0:
    eventPlayer.addHealthPool(Health.ARMOR, 1500, false, false)
    eventPlayer.healthId[1] = getLastCreatedHealthPool()
    playEffect(getAllPlayers(), DynamicEffect.BRIGITTE_REPAIR_PACK_ARMOR, Color.WHITE, eventPlayer, 200)
    eventPlayer.mod_dmg_taken = -25
    updatePlayerStats()
    waitUntil(eventPlayer.eventId == null, eventPlayer.eventDuration)
    removeHealthPool(eventPlayer.healthId[1])
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()
    wait(getAverageServerLoad() / 100 * 0.032)
    eventPlayer.healthId[1] = null


rule "[VishkarEvent]: 肾上腺素":
    @Event eachPlayer
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 3]) == true
    
    createEffect(getAllPlayers(), Effect.ANA_NANO_BOOSTED, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect[0] = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.ANA_NANO_BOOSTED_SOUND, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect[1] = getLastCreatedEntity()
    eventPlayer.mod_dmg_taken = -50
    wait(getAverageServerLoad() / 100 * 0.032)
    updatePlayerStats()
    wait(eventPlayer.eventDuration)
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 生命源泉":
    @Event eachPlayer
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 4]) == true
    
    wait(0.032)
    createEffect(getAllPlayers(), Effect.HEAL_TARGET_ACTIVE, Color.YELLOW, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    eventPlayer.startHealingOverTime(eventPlayer, 20, eventPlayer.getMaxHealth() * 0.15)
    wait(eventPlayer.eventDuration)
    clearEventEffect()


rule "[VishkarEvent]: 黑粉来袭":
    @Event eachPlayer
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 5]) == true
    
    wait(getAverageServerLoad() / 100 * 0.032)
    hudText(eventPlayer, null, "\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r", "{0}/{1}".format(len([player for player in getPlayers(Team.2) if player.target == eventPlayer]), len(bastionPosition)), HudPosition.TOP, 9, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.hudTextId = getLastCreatedText()
    waitUntil(eventPlayer.eventId != 5, eventPlayer.eventDuration)
    wait(getAverageServerLoad() / 100 * 0.032)
    destroyHudText(eventPlayer.hudTextId)


rule "[VishkarEvent]: 足力健":
    @Event eachPlayer
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 6, eventPlayer.isMoving(), eventPlayer.getSpeed() != 0]) == true
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    if eventPlayer.eventEffect != null:
        goto lbl_0
    createEffect(getAllPlayers(), Effect.SOLDIER_SPRINTING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    lbl_0:
    eventPlayer.mod_speed_event += 3
    updatePlayerStats()
    if ruleCondition:
        loop()
    wait(0.032)
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 血肉再生":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 7]) == true
    
    wait(0.032)
    removeHealthPool(eventPlayer.healthId[0])
    eventPlayer.addHealthPool(Health.NORMAL, round(75 + eventPlayer.getMaxHealth() * 0.25), false, false)
    eventPlayer.healthId[0] = getLastCreatedHealthPool()
    wait(4)
    if ruleCondition:
        loop()
    removeHealthPool(eventPlayer.healthId[0])
    eventPlayer.healthId[0] = null


rule "[VishkarEvent]: 心之钢 Effect":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 8]) == true
    
    wait()
    if eventPlayer.eventEffect != null:
        goto lbl_0
    createEffect(getAllPlayers(), Effect.WINSTON_PRIMAL_RAGE, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    lbl_0:
    waitUntil(eventPlayer.eventId == null, eventPlayer.eventDuration)
    clearEventEffect()


rule "[VishkarEvent]: 心之钢":
    @Event playerDied
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 8]) == true
    @Condition attacker.getHero() == Hero.BASTION
    
    eventPlayer.heart_steel += 0.75
    smallMessage(eventPlayer, "  {0}  已获得 0.75% 额外最大生命值".format(abilityIconString(Hero.MAUGA, Button.ABILITY_2)))
    wait(0.032)
    waitUntil(eventPlayer.isAlive(), 0.5)
    setPlayerHP()
    wait(0.032)


rule "[VishkarEvent]: 危险感知":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 9]) == true
    @Condition len([player for player in getPlayers(Team.2) if player.target == eventPlayer]) > 0
    
    eventPlayer.mod_speed_event = 60
    eventPlayer.mod_dmg_taken = -25
    updatePlayerStats()
    waitUntil(len([player for player in getPlayers(Team.2) if player.target == eventPlayer]) == 0, eventPlayer.eventDuration)
    wait(1)
    if ruleCondition:
        loop()
    eventPlayer.mod_speed_event = 0
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()


rule "[VishkarEvent]: 反应装甲":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 10]) == true
    
    wait(0.032)
    if eventPlayer.healthId[1] == null:
        goto lbl_0
    removeHealthPool(eventPlayer.healthId[1])
    lbl_0:
    eventPlayer.addHealthPool(Health.ARMOR, 150, true, false)
    eventPlayer.healthId[1] = getLastCreatedHealthPool()
    playEffect(getAllPlayers(), DynamicEffect.BRIGITTE_REPAIR_PACK_ARMOR, Color.WHITE, eventPlayer, 200)
    wait(eventPlayer.eventDuration)
    removeHealthPool(eventPlayer.healthId[1])
    wait(getAverageServerLoad() / 100 * 0.032)
    eventPlayer.healthId[1] = null


rule "[VishkarEvent]: 反应装甲":
    @Event playerTookDamage
    @Team 1
    @Condition attacker != victim
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 10]) == true
    @Condition eventPlayer.getHealthOfType(Health.ARMOR) > 0
    
    wait(0.032, Wait.ABORT_WHEN_FALSE)
    if attacker.hasStatus(Status.STUNNED):
        goto lbl_0
    attacker.setStatusEffect(victim, Status.STUNNED, 1)
    lbl_0:
    wait(1)


rule "[VishkarEvent]: 死亡延迟":
    @Event playerTookDamage
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 11]) == true
    @Condition (any([eventDamage >= eventPlayer.getHealth(), eventPlayer.getHealth() <= eventPlayer.getMaxHealth() * 0.15, eventAbility == Button.SECONDARY_FIRE and attacker.getHero() == Hero.BASTION and eventPlayer.getMaxHealth() <= 500])) == true
    
    wait(0.016, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setStatusEffect(eventPlayer, Status.UNKILLABLE, eventPlayer.eventDuration)
    createEffect(getAllPlayers(), Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.invincibleEffect = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED_SOUND, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    smallMessage(eventPlayer, "  {0}  已触发死亡延迟".format(abilityIconString(Hero.BAPTISTE, Button.ABILITY_2)))
    waitUntil(eventPlayer.eventId == null, eventPlayer.eventDuration)
    eventPlayer.clearStatusEffect(Status.UNKILLABLE)
    destroyEffect(eventPlayer.invincibleEffect)
    clearEventEffect()
    wait()
    if any([eventPlayer.hasStatus(Status.PHASED_OUT), eventPlayer.hasStatus(Status.INVINCIBLE), eventPlayer.hasStatus(Status.UNKILLABLE)]):
        goto lbl_0
    damage(eventPlayer, attacker, 9999999999)
    lbl_0:


rule "[VishkarEvent]: 有我有你":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 12]) == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    wait(0.032, Wait.ABORT_WHEN_FALSE)
    eventPlayer.possess = sorted([player for player in getLivingPlayers(Team.1) if player != eventPlayer and player.isWinner != true and player.possessed != true and distance(eventPlayer, player) < 40], lambda i: distance(eventPlayer, i))
    wait(0.032)
    smallMessage(eventPlayer, "  {0}".format("附近未找到可附身目标" if len(eventPlayer.possess) == 0 else "附身目标：{0}".format(eventPlayer.possess[0])))
    wait(0.032)
    if len(eventPlayer.possess) == 0:
        goto lbl_0
    eventPlayer.mod_heal_event += 25
    updatePlayerStats()
    eventPlayer.teleport(eventPlayer.possess[0].getPosition())
    eventPlayer.attachTo(eventPlayer.possess[0], vect(0, 1, -1))
    eventPlayer.possess[0].possessed = true
    smallMessage(eventPlayer.possess[0], "  你已被 {0} 附身".format(eventPlayer))
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    lbl_0:
    eventPlayer.setStatusEffect(null, Status.INVINCIBLE, 9999)
    waitUntil(eventPlayer.possess[0].isDead() or eventPlayer.isHoldingButton(Button.CROUCH) or not entityExists(eventPlayer.possess[0]) or eventPlayer.eventDuration == 0, eventPlayer.eventDuration)
    eventPlayer.detach()
    if eventPlayer.possess[0].getPosition() == null or len(eventPlayer.possess) == 0:
        goto lbl_1
    eventPlayer.teleport(nearestWalkablePosition(eventPlayer.possess[0].getPosition() + vect(random.randint(-1, 1), 0.5, random.randint(-1, 1))))
    lbl_1:
    eventPlayer.possess[0].possessed = false
    eventPlayer.clearStatusEffect(Status.PHASED_OUT)
    eventPlayer.clearStatusEffect(Status.INVINCIBLE)
    eventPlayer.possess = null


rule "[VishkarEvent]: ↑↑↓↓←→←→BABA":
    @Event eachPlayer
    @Team 1
    @Condition evalOnce(controlRespawnPosition) == null
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.isAlive(), eventPlayer.eventType == 0, eventPlayer.eventId == 13]) == true
    
    if evalOnce(controlRespawnPosition) != null:
        eventPlayer.eventDuration = 0
    eventPlayer.controlPlayerRespawnPosition = [eventPlayer.getPosition(), eventPlayer.getFacingDirection(), eventPlayer.getHero()]
    playEffect(eventPlayer, DynamicEffect.SOMBRA_TRANSLOCATING_SOUND, Color.WHITE, eventPlayer, 100)
    if eventPlayer.eventEffect == null:
        createEffect(eventPlayer, Effect.SPARKLES, Color.YELLOW, eventPlayer.controlPlayerRespawnPosition[0], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.eventEffect = getLastCreatedEntity()
    wait(5)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: ↑↑↓↓←→←→BABA":
    @Event playerDied
    @Team 1
    @Condition evalOnce(controlRespawnPosition) == null
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 13]) == true
    @Condition eventPlayer.isWinner != true
    @Condition eventPlayer.controlPlayerRespawnPosition != []
    
    bigMessage(eventPlayer, "↑↑↓↓←→←→BABA")
    playEffect(getAllPlayers(), DynamicEffect.TRACER_RECALL_DISAPPEAR, Color.TEAM_1, eventPlayer, 200)
    eventPlayer.disableRespawn()
    wait(3)
    eventPlayer.enableRespawn()
    eventPlayer.resurrect()
    eventPlayer.teleport(eventPlayer.controlPlayerRespawnPosition[0])
    eventPlayer.setFacing(eventPlayer.controlPlayerRespawnPosition[1], Relativity.TO_WORLD)
    playEffect(getAllPlayers(), DynamicEffect.TRACER_RECALL_REAPPEAR, Color.TEAM_1, eventPlayer, 200)
    wait(0.5)
    eventPlayer.controlPlayerRespawnPosition = null
    clearEventEffect()
    eventPlayer.eventDuration = 0


rule "[VishkarEvent]: 费斯卡光子护盾":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 14]) == true
    
    wait()
    getPlayers(Team.1).target = eventPlayer
    waitUntil(eventPlayer.isDead(), eventPlayer.eventDuration)
    eventPlayer.eventDuration = 0
    getPlayers(Team.1).target = null


rule "[VishkarEvent]: 费斯卡光子护盾":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.isAlive(), eventPlayer.target != null]) == true
    
    wait()
    eventPlayer.addHealthPool(Health.SHIELDS, eventPlayer.target.getMaxHealth() * 0.2 if eventPlayer.target.getMaxHealth() * 0.2 > 50 else 50, true, false)
    eventPlayer.healthId[2] = getLastCreatedHealthPool()
    waitUntil(not eventPlayer.target.isAlive() or eventPlayer.target == null, eventPlayer.target.eventDuration)
    removeHealthPool(eventPlayer.healthId[2])
    eventPlayer.healthId[2] = null


rule "[VishkarEvent]: 费斯卡呼吸机":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 15]) == true
    
    eventPlayer.ignoreObstrucVis = true
    wait(eventPlayer.eventDuration)
    eventPlayer.ignoreObstrucVis = false


rule "[VishkarEvent]: 向我靠拢":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 16]) == true
    
    wait(5)
    eventPlayer.eventEffectPlayers = [player for player in getLivingPlayers(Team.1) if distance(eventPlayer, player) <= 15 and isInLoS(eventPlayer, player) == true and not player.hasStatus(Status.INVINCIBLE)]
    eventPlayer.eventEffectPlayers.invincible = [true, eventPlayer, 2.5]
    wait(0.5)
    eventPlayer.eventEffectPlayers = null
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 向我靠拢":
    @Event eachPlayer
    @Team 1
    @Condition (all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), not eventPlayer.hasStatus(Status.INVINCIBLE), len(eventPlayer.invincible) >= 3])) == true
    
    eventPlayer.setStatusEffect(eventPlayer.invincible[1], Status.INVINCIBLE, eventPlayer.invincible[2])
    createEffect(getAllPlayers(), Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.invincibleEffect = getLastCreatedEntity()
    smallMessage(eventPlayer, "  {0}  {1}（{2}） 为你提供 2.5秒无敌效果".format(abilityIconString(Hero.BAPTISTE, Button.ABILITY_2), eventPlayer.invincible[1], eventPlayer.invincible[1].getHero()))
    wait(2.5)
    eventPlayer.clearStatusEffect(Status.INVINCIBLE)
    destroyEffect(eventPlayer.invincibleEffect)
    eventPlayer.invincibleEffect = null
    eventPlayer.invincible = null


rule "[VishkarEvent]: 我独自闯关":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 17]) == true
    
    wait(0.05)
    if len(getPlayersInRadius(eventPlayer, 8, Team.1, LosCheck.SURFACES)) > 0:
        eventPlayer.mod_dmg_taken = -15
        eventPlayer.mod_heal_event = 30
        eventPlayer.mod_speed_event = 12.5
        eventPlayer.setKnockbackReceived(75)
        smallMessage(eventPlayer, "  {0}  已获得 15% 伤害减免".format(iconString(Icon.DIAMOND)))
        smallMessage(eventPlayer, "  {0}  已获得 30% 治疗增益".format(iconString(Icon.DIAMOND)))
        smallMessage(eventPlayer, "  {0}  已获得 12.5% 移速加成".format(iconString(Icon.DIAMOND)))
        smallMessage(eventPlayer, "  {0}  已获得 25% 击退抵抗".format(iconString(Icon.DIAMOND)))
    else:
        bigMessage(eventPlayer, "我独自闯关！")
        eventPlayer.mod_dmg_taken = -30
        eventPlayer.mod_heal_event = 60
        eventPlayer.mod_speed_event = 25
        eventPlayer.setKnockbackReceived(50)
        smallMessage(eventPlayer, "  {0}  已获得 30% 伤害减免".format(iconString(Icon.CLUB)))
        smallMessage(eventPlayer, "  {0}  已获得 60% 治疗增益".format(iconString(Icon.CLUB)))
        smallMessage(eventPlayer, "  {0}  已获得 25% 移速加成".format(iconString(Icon.CLUB)))
        smallMessage(eventPlayer, "  {0}  已获得 50% 击退抵抗".format(iconString(Icon.CLUB)))
    updatePlayerStats()
    wait(eventPlayer.eventDuration)
    eventPlayer.setKnockbackReceived(100)
    eventPlayer.mod_dmg_taken = 0
    eventPlayer.mod_heal_event = 0
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()


rule "[VishkarEvent]: 坚定":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 18]) == true
    
    eventPlayer.knockback = -95
    updatePlayerStats()
    wait(eventPlayer.eventDuration)
    eventPlayer.knockback = 0
    updatePlayerStats()


rule "[VishkarEvent]: 坚定":
    @Event playerReceivedKnockback
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 18]) == true
    
    if eventPlayer.mod_dmg_taken == -75:
        goto lbl_0
    eventPlayer.mod_dmg_taken -= 5
    updatePlayerStats()
    lbl_0:
    heal(eventPlayer, eventPlayer, eventPlayer.getMaxHealth() * 0.08)


rule "[VishkarEvent]: 胜利意志":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 19, eventPlayer.getHealth() <= eventPlayer.getMaxHealth() * 0.3]) == true
    
    waitUntil(eventPlayer.isAlive(), MAX_TIME)
    eventPlayer.setStatusEffect(eventPlayer, Status.PHASED_OUT, 0.016)
    wait()
    eventPlayer.clearStatusEffect(Status.INVINCIBLE)
    destroyEffect(eventPlayer.invincibleEffect)
    wait()
    if not eventPlayer.isAlive():
        return
    eventPlayer.setStatusEffect(eventPlayer, Status.INVINCIBLE, 5)
    createEffect(getAllPlayers(), Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.invincibleEffect = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED_SOUND, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    bigMessage(eventPlayer, "胜利意志！")
    resetPlayerCD()
    heal(eventPlayer, eventPlayer, 99999)
    waitUntil(eventPlayer.isDead(), 5)
    eventPlayer.eventDuration = 0
    eventPlayer.clearStatusEffect(Status.INVINCIBLE)
    destroyEffect(eventPlayer.invincibleEffect)
    eventPlayer.invincibleEffect = null
    clearEventEffect()


rule "[VishkarEvent]: 任务：菲迪皮德斯之力":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 20, eventPlayer.getSpeed() != 0, eventPlayer.eventMission <= 42.195]) == true
    
    if eventPlayer.hudTextId != null:
        goto lbl_0
    hudText(eventPlayer, null, "\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r", "{0}/42.195".format(eventPlayer.eventMission), HudPosition.TOP, 9, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.hudTextId = getLastCreatedText()
    lbl_0:
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    eventPlayer.eventMission += 0.5
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 任务：菲迪皮德斯之力":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 20]) == true
    
    waitUntil(eventPlayer.eventMission >= 42.195 or eventPlayer.eventId == null, eventPlayer.eventDuration + 1.5)
    wait()
    if eventPlayer.eventMission >= 42.195:
        bigMessage(eventPlayer, "任务：菲迪皮德斯之力 成功！")
        smallMessage(eventPlayer, "  {0}  任务奖励：永久获得 {1}% 移动速度加成".format(abilityIconString(Hero.SOLDIER, Button.ABILITY_1), 5))
        eventPlayer.mod_speed_perma += 5
        updatePlayerStats()
    else:
        bigMessage(eventPlayer, "任务：菲迪皮德斯之力 失败")
    eventPlayer.eventMission = 0
    destroyHudText(eventPlayer.hudTextId)
    eventPlayer.hudTextId = null
    eventPlayer.eventDuration = 0


rule "[VishkarEvent]: 心之钢 Pro":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 21]) == true
    
    eventPlayer.heart_steel += 6
    if eventPlayer.heart_steel > 0:
        eventPlayer.setMaxHealth(100 + eventPlayer.heart_steel * 2)
        wait(eventPlayer.eventDuration)
        setPlayerHP()
    else:
        eventPlayer.eventDuration = 0


rule "[VishkarEvent]: 数值之力":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 22]) == true
    
    eventPlayer.mod_heal_event = 400
    eventPlayer.heal_recv = 400
    updatePlayerStats()
    createEffect(getAllPlayers(), Effect.ANA_BIOTIC_GRENADE_INCREASED_HEALING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    playEffect(eventPlayer, DynamicEffect.ANA_BIOTIC_GRENADE_INCREASED_HEALING_SOUND, Color.WHITE, eventPlayer, 200)
    wait(eventPlayer.eventDuration)
    eventPlayer.mod_heal_event = 0
    eventPlayer.heal_recv = 0
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 我按Q辣":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 23, eventPlayer.isMoving(), eventPlayer.getSpeed() != 0]) == true
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setUltCharge(eventPlayer.getUltCharge() + 10)
    if ruleCondition:
        loop()
    if eventPlayer.isWinner:
        goto lbl_0
    eventPlayer.setUltCharge(0)
    lbl_0:


rule "[VishkarEvent]: 我按Q辣":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 23, eventPlayer.isUsingUltimate()]) == true
    
    resetPlayerCD()
    eventPlayer.mod_dmg_taken = -75
    updatePlayerStats()
    waitUntil(not eventPlayer.isUsingUltimate(), eventPlayer.eventDuration)
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()


rule "[VishkarEvent]: 重力异常":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 0]) == true
    
    wait(getAverageServerLoad() / 100 * 0.032)
    eventPlayer.mod_speed_event = -40
    updatePlayerStats()
    eventPlayer.setGravity(100 + 70)
    createEffect(getAllPlayers(), Effect.SIGMA_GRAVITIC_FLUX_TARGET, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect[0] = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.SIGMA_GRAVITIC_FLUX_TARGET_SOUND, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect[1] = getLastCreatedEntity()
    wait(eventPlayer.eventDuration)
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()
    clearEventEffect()
    eventPlayer.setGravity(100)


rule "[VishkarEvent]: 电磁脉冲":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 1]) == true
    
    stopChasingVariable(eventPlayer.hack_timer)
    eventPlayer.setStatusEffect(getPlayersOnHero(Hero.BASTION, Team.2)[0], Status.HACKED, 8)
    playEffect(getAllPlayers(), DynamicEffect.SOMBRA_HACKED_STARTING, Color.TEAM_2, eventPlayer, 200)
    eventPlayer.hack_timer = 8
    chaseAtRate(eventPlayer.hack_timer, 0, 1, ChaseRateReeval.NONE)


rule "[VishkarEvent]: 吸血鬼":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 2]) == true
    @Condition any([[player for player in getLivingPlayers(Team.1) if player.isUsingAbility1()] > 0, [player for player in getLivingPlayers(Team.1) if player.isUsingAbility2()] > 0]) == true
    
    stopCombatRegen()
    playEffect(getAllPlayers(), DynamicEffect.MOIRA_FADE_REAPPEAR, Color.TEAM_2, eventPlayer, 200)
    damage(eventPlayer, (sorted([player for player in getLivingPlayers(Team.1) if player.isUsingAbility1() or player.isUsingAbility2()], lambda i: distance(eventPlayer, i)))[0], eventPlayer.getMaxHealth() * 0.1)
    wait(max(0.5, getAverageServerLoad() / 100 * 0.032))
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 易损":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 3]) == true
    
    createEffect(getAllPlayers(), Effect.ZENYATTA_ORB_OF_DISCORD_TARGET, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect[0] = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.ZENYATTA_ORB_OF_DISCORD_TARGET_SOUND, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect[1] = getLastCreatedEntity()
    eventPlayer.mod_dmg_taken = 25
    wait(getAverageServerLoad() / 100 * 0.032)
    updatePlayerStats()
    wait(eventPlayer.eventDuration)
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 限速40":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 4, eventPlayer.isMoving(), eventPlayer.getSpeed() != 0]) == true
    
    stopCombatRegen()
    wait(1, Wait.ABORT_WHEN_FALSE)
    if eventPlayer.hasStatus(Status.BURNING):
        goto lbl_0
    eventPlayer.setStatusEffect(null, Status.BURNING, 3)
    lbl_0:
    eventPlayer.startDamageOverTime(null, 1, 25 + round(eventPlayer.getMaxHealth() * 0.075))
    wait(0.032)
    if ruleCondition:
        loop()
    eventPlayer.clearStatusEffect(Status.BURNING)


rule "[VishkarEvent]: 引力异常":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.isAlive(), eventPlayer.eventType == 1, eventPlayer.eventId == 5]) == true
    
    if eventPlayer.mod_speed_event != 0:
        goto lbl_0
    eventPlayer.mod_speed_event -= 25
    updatePlayerStats()
    lbl_0:
    if eventPlayer.eventEffect != null:
        goto lbl_1
    createEffect(getAllPlayers(), Effect.SIGMA_GRAVITIC_FLUX_TARGET, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect[0] = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.SIGMA_GRAVITIC_FLUX_TARGET_SOUND, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect[1] = getLastCreatedEntity()
    lbl_1:
    eventPlayer.applyImpulse(directionTowards(eventPlayer, sorted(getPlayers(Team.2), lambda player: distance(eventPlayer, player))[0]), 0.425 if eventPlayer.isInAir() else 0.825, Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)
    wait()
    if ruleCondition:
        loop()
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 骨质疏松 Effect":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 6, eventPlayer.eventEffect == null]) == true

    createEffect(getAllPlayers(), Effect.MEI_FROZEN, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    wait(eventPlayer.eventDuration, Wait.IGNORE_CONDITION)
    clearEventEffect()


rule "[VishkarEvent]: 骨质疏松":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 6]) == true
    
    while eventPlayer.mod_speed_event != -50:
        eventPlayer.mod_speed_event -= 5
        updatePlayerStats()
        wait(1)
    updatePlayerStats()


rule "[VishkarEvent]: 电磁脉冲 ProMax":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 7]) == true
    
    ([player for player in getPlayers(Team.1) if distance(eventPlayer, player) <= 75]).empProMax = eventPlayer
    playEffect(getAllPlayers(), DynamicEffect.SOMBRA_EMP_EXPLOSION_EFFECT, Color.TEAM_2, eventPlayer, 200)
    wait(eventPlayer.eventDuration - 1)
    getPlayers(Team.1).empProMax = null


rule "[VishkarEvent]: 电磁脉冲 ProMax":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.hasStatus(Status.HACKED) != true, eventPlayer.empProMax != null, eventPlayer.hack_timer == 0]) == true
    
    stopChasingVariable(eventPlayer.hack_timer)
    eventPlayer.hack_timer = max(0, 8 if eventPlayer.empProMax == eventPlayer else 8 - distance(eventPlayer, eventPlayer.empProMax) * 0.08)
    if eventPlayer.hack_timer <= 0.9:
        goto lbl_0
    playEffect(getAllPlayers(), DynamicEffect.SOMBRA_HACKED_STARTING, Color.TEAM_2, eventPlayer, 200)
    lbl_0:
    eventPlayer.setStatusEffect(eventPlayer.empProMax, Status.HACKED, eventPlayer.hack_timer)
    chaseAtRate(eventPlayer.hack_timer, 0, 1, ChaseRateReeval.NONE)
    wait(eventPlayer.hack_timer)
    eventPlayer.hack_timer = 0
    eventPlayer.empProMax = null


rule "[VishkarEvent]: 能量泄漏":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 8]) == true
    @Condition any([eventPlayer.isUsingAbility1(), eventPlayer.isUsingAbility2()]) == true
    
    stopCombatRegen()
    wait()
    playEffect(getAllPlayers(), DynamicEffect.ECHO_STICKY_BOMB_EXPLOSION, Color.TEAM_2, eventPlayer, 200)
    damage(eventPlayer, null, eventPlayer.getMaxHealth() * 0.25)
    wait(1)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 生命在于运动":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.isAlive(), eventPlayer.eventType == 1, eventPlayer.eventId == 9]) == true
    
    stopCombatRegen()
    wait()
    damage(eventPlayer, null, ceil(0.03 if eventPlayer.getMaxHealth() * eventPlayer.isMoving() else 0.015))
    eventPlayer.setStatusEffect(null, Status.BURNING, 1)
    wait(0.96)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 有难同当":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 10]) == true
    
    wait(getAverageServerLoad() / 100 * 0.032)
    createEffect(getAllPlayers(), Effect.TORBJORN_OVERLOADING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    wait(eventPlayer.eventDuration)
    clearEventEffect()


rule "[VishkarEvent]: 有难同当":
    @Event playerTookDamage
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 10]) == true
    @Condition attacker.getHero() == Hero.BASTION
    @Condition eventAbility != null
    
    wait()
    damage([player for player in getLivingPlayers(Team.1) if not player.hasStatus(Status.PHASED_OUT) and not player.hasStatus(Status.INVINCIBLE) and distance(eventPlayer, player) <= 15 and eventPlayer != player], attacker, eventDamage * 0.75)
    wait()


rule "[VishkarEvent]: 狂欢盛宴":
    @Event playerDied
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 11, attacker.getHero() == Hero.BASTION]) == true
    
    bigMessage(getAllPlayers(), "盛宴！")
    smallMessage(getPlayers(Team.1), "  {0} {1} 阵亡触发了狂欢盛宴".format(iconString(Icon.WARNING), eventPlayer))
    getPlayers(Team.2).hasNano = true
    berserkerTime += 10
    wait(5)


rule "[VishkarEvent]: 狂欢盛宴计时器":
    @Condition berserkerTime != 0
    
    wait(2)
    berserkerTime -= 2
    if ruleCondition:
        loop()
    getPlayers(Team.2).hasNano = false


rule "[VishkarEvent]: 无能的丈夫/妻子":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 12]) == true
    
    ([player for player in getLivingPlayers(Team.1) if distance(eventPlayer, player) <= 45 and eventPlayer != player]).setStatusEffect(null, Status.KNOCKED_DOWN, 2)
    wait(2)


rule "[VishkarEvent]: 重伤":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 13]) == true
    
    eventPlayer.mod_heal_event = -85
    eventPlayer.heal_recv = -85
    updatePlayerStats()
    createEffect(getAllPlayers(), Effect.ANA_BIOTIC_GRENADE_NO_HEALING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    playEffect(eventPlayer, DynamicEffect.ANA_BIOTIC_GRENAGE_NO_HEALING_SOUND, Color.WHITE, eventPlayer, 200)
    wait(eventPlayer.eventDuration)
    clearEventEffect()
    eventPlayer.mod_heal_event = 0
    eventPlayer.heal_recv = 0
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 减半":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.eventType == 1, eventPlayer.eventId == 14, eventPlayer.getHealth() != 0]) == true
    
    stopCombatRegen()
    if eventPlayer.getHealth() <= eventPlayer.getMaxHealth() * 0.05:
        kill(eventPlayer, eventPlayer)
        playEffect(getAllPlayers(), DynamicEffect.DVA_SELF_DESTRUCT_EXPLOSION, Color.TEAM_2, eventPlayer, 200)
    else:
        wait(5)
        eventPlayer.startDamageOverTime(null, 1, eventPlayer.getHealth() * 0.5)
        playEffect(getAllPlayers(), DynamicEffect.ZARYA_PARTICLE_CANNON_EXPLOSION, Color.TEAM_2, eventPlayer, 3)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 舍己为人":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 15]) == true
    
    if eventPlayer.getMaxHealth() <= 125:
        eventPlayer.eventDuration = 0
    else:
        getPlayers(Team.1).exclude(eventPlayer).heart_steel++
        getPlayers(Team.1).exclude(eventPlayer).setPlayerHP = true
        eventPlayer.heart_steel -= 1 * len(getPlayers(Team.1).exclude(eventPlayer))
        setPlayerHP()
    playEffect(getAllPlayers(), DynamicEffect.ORISA_HALT_IMPLOSION, Color.TEAM_1, eventPlayer, 200)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.GREEN, eventPlayer, 100)
    wait(eventPlayer.eventDuration)


rule "[VishkarEvent]: 舍己为人":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.setPlayerHP]) == true
    
    setPlayerHP()
    eventPlayer.setPlayerHP = false


rule "[VishkarEvent]: 极限挑战":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 0]) == true
    
    waitUntil(eventPlayer.isAlive(), MAX_TIME)
    eventPlayer.mod_heal_event = -1000
    eventPlayer.heal_recv = -1000
    createEffect(getAllPlayers(), Effect.ANA_BIOTIC_GRENADE_NO_HEALING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    playEffect(eventPlayer, DynamicEffect.ANA_BIOTIC_GRENAGE_NO_HEALING_SOUND, Color.WHITE, eventPlayer, 200)
    eventPlayer.setHealth(eventPlayer.getMaxHealth() * 0.3)
    eventPlayer.mod_dmg_taken = -99
    updatePlayerStats()
    waitUntil(eventPlayer.isDead(), eventPlayer.eventDuration)
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()
    clearEventEffect()
    eventPlayer.mod_heal_event = 0
    eventPlayer.heal_recv = 0
    updatePlayerStats()
    eventPlayer.eventDuration = 0


rule "[VishkarEvent]: 极限挑战":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 0]) == true
    @Condition eventPlayer.getHealth() > eventPlayer.getMaxHealth() * 0.3 == true
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setHealth(eventPlayer.getMaxHealth() * 0.3)
    wait(5)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 纳米战甲":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 1]) == true
    
    wait()
    waitUntil(eventPlayer.isAlive(), eventPlayer.eventDuration)
    eventPlayer.addHealthPool(Health.NORMAL, eventPlayer.getMaxHealth() * 8, false, false)
    eventPlayer.healthId[0] = getLastCreatedHealthPool()
    # eventPlayer.mod_speed_event = -25
    eventPlayer.overhealthDecay = true
    updatePlayerStats()
    wait(eventPlayer.eventDuration)
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()
    removeHealthPool(eventPlayer.healthId[0])
    eventPlayer.healthId[0] = null


rule "[VishkarEvent]: 赌徒":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 2, eventPlayer.isHoldingButton(Button.RELOAD)]) == true
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    if random.randint(0, 100) <= 50:
        eventPlayer.heart_steel -= 5
        eventPlayer.dlcTimeChallenge = 0 if eventPlayer.dlcTimeChallenge > 0 else eventPlayer.dlcTimeChallenge - 1
        smallMessage(eventPlayer, "  {0}  输！失去 5% 最大生命值".format(iconString(Icon.DIAMOND)))
    else:
        eventPlayer.heart_steel += 5
        eventPlayer.dlcTimeChallenge++
        smallMessage(eventPlayer, "  {0}  赢！获得 5% 最大生命值".format(iconString(Icon.CLUB)))
    wait()
    setPlayerHP()
    wait()
    eventPlayer.eventDuration = 0


rule "[VishkarEvent]: 有点松弛":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 3, eventPlayer.isMoving(), eventPlayer.getSpeed() != 0]) == true
    
    wait()
    if eventPlayer.eventEffect != null:
        goto lbl_0
    createEffect(getAllPlayers(), Effect.WRECKING_BALL_PILEDRIVER_FIRE, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    lbl_0:
    createEffect([player for player in getPlayers(Team.1) if not player.ignoreObstrucVis], Effect.CLOUD, random.choice([Color.YELLOW, Color.GREEN, Color.ORANGE, Color.LIME_GREEN, Color.VIOLET]), evalOnce(eventPlayer.getPosition()), 12, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    wait()
    eventPlayer.obstrucVis.append(getLastCreatedEntity())
    wait(1)
    if ruleCondition:
        loop()
    clearEventEffect()


rule "[VishkarEvent]: 有点松弛":
    @Event eachPlayer
    @Team 1
    @Condition evalOnce(dlcVishkarEvent) == true
    @Condition eventPlayer.obstrucVis != []
    @Condition len(eventPlayer.obstrucVis) > 0
    
    wait(20, Wait.ABORT_WHEN_FALSE)
    destroyEffect(eventPlayer.obstrucVis[0])
    eventPlayer.obstrucVis.remove(eventPlayer.obstrucVis[0])
    wait(0.5)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 体积膨胀":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 4]) == true
    
    wait(getAverageServerLoad() / 100 * 0.032)
    eventPlayer.sizeHealth = 4
    eventPlayer.startScalingSize(1.75, false)
    eventPlayer.startScalingBarriers(1.75, false)
    eventPlayer.startModifyingVoicelinePitch(0.5, false)
    eventPlayer.mod_dmg_taken = -20
    updatePlayerStats()
    setPlayerHP()
    waitUntil(eventPlayer.eventId == -1, eventPlayer.eventDuration)
    eventPlayer.sizeHealth = 1
    setPlayerHP()
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()
    eventPlayer.stopScalingSize()
    eventPlayer.stopScalingBarriers()
    eventPlayer.stopModifyingVoicelinePitch()


rule "[VishkarEvent]: 迷你形态":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 5]) == true
    
    wait(getAverageServerLoad() / 100 * 0.032)
    eventPlayer.sizeHealth = 0.5
    eventPlayer.startScalingSize(0.4, false)
    eventPlayer.startScalingBarriers(0.4, false)
    eventPlayer.startModifyingVoicelinePitch(1.5, false)
    eventPlayer.mod_speed_event = 25
    updatePlayerStats()
    setPlayerHP()
    waitUntil(eventPlayer.eventId == -1, eventPlayer.eventDuration)
    eventPlayer.sizeHealth = 1
    setPlayerHP()
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()
    eventPlayer.stopScalingSize()
    eventPlayer.stopScalingBarriers()
    eventPlayer.stopModifyingVoicelinePitch()


rule "[VishkarEvent]: 悄悄地进村":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 6]) == true
    @Condition eventPlayer.isHoldingButton(Button.CROUCH) == true
    
    createEffect(getAllPlayers(), Effect.REAPER_WRAITH_FORM, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    eventPlayer.targetSilence = true
    eventPlayer.mod_speed_event -= 25
    updatePlayerStats()
    waitUntil(eventPlayer.isHoldingButton(Button.CROUCH) == false, eventPlayer.eventDuration)
    eventPlayer.targetSilence = false
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()
    clearEventEffect()
    wait(0.25)


rule "[VishkarEvent]: 紧急避障":
    @Event playerTookDamage
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 7]) == true
    
    wait(0.032, Wait.ABORT_WHEN_FALSE)
    eventPlayer.mod_speed_event += 30
    updatePlayerStats()
    createEffect(getAllPlayers(), Effect.SOLDIER_SPRINTING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    wait(3)
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 逆风而行":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 8]) == true
    
    wait(0.032, Wait.ABORT_WHEN_FALSE)
    eventPlayer.stopForcingThrottle()
    eventPlayer.startForcingThrottle(0, 0, 0, 1, 0, eventPlayer.eventDuration)
    eventPlayer.mod_speed_event += 60
    eventPlayer.mod_dmg_taken = -60
    updatePlayerStats()
    createEffect(getAllPlayers(), Effect.SOLDIER_SPRINTING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    wait(eventPlayer.eventDuration)
    eventPlayer.stopForcingThrottle()
    eventPlayer.mod_speed_event = 0
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 刹车失灵":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 9]) == true
    
    eventPlayer.startThrottleInDirection(Vector.FORWARD, 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.NONE)
    wait(eventPlayer.eventDuration)
    eventPlayer.stopThrottleInDirection()


rule "[VishkarEvent]: 刹车失灵":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 9]) == true
    
    while eventPlayer.mod_speed_event < 75:
        eventPlayer.mod_speed_event += 5
        if eventPlayer.mod_dmg_taken == 50:
            goto lbl_0
        eventPlayer.mod_dmg_taken += 5
        lbl_0:
        updatePlayerStats()
        wait(1)


rule "[VishkarEvent]: 冲锋激励":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 10, eventPlayer.isMoving(), eventPlayer.getSpeed() != 0, eventPlayer.healthId[1] == null]) == true
    
    if eventPlayer.hudTextId != null:
        goto lbl_0
    hudText(eventPlayer, null, "\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r", "{0}/300".format(eventPlayer.eventMission), HudPosition.TOP, 9, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.hudTextId = getLastCreatedText()
    lbl_0:
    wait(5, Wait.ABORT_WHEN_FALSE)
    if eventPlayer.eventMission >= 300:
        goto lbl_1
    eventPlayer.eventMission += 100
    wait()
    lbl_1:
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 冲锋激励":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 10, eventPlayer.eventMission == 300]) == true
    
    if eventPlayer.healthId[1] == null:
        goto lbl_0
    removeHealthPool(eventPlayer.healthId[1])
    lbl_0:
    eventPlayer.addHealthPool(Health.ARMOR, eventPlayer.eventMission, false, false)
    eventPlayer.healthId[1] = getLastCreatedHealthPool()
    eventPlayer.eventMission = 0
    wait(15)
    removeHealthPool(eventPlayer.healthId[1])
    eventPlayer.healthId[1] = null


rule "[VishkarEvent]: 生命在于反击":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 11, eventPlayer.getNormalizedHealth() != 1]) == true
    
    # 修复点 1: 速度计算 (保持 < 75 则原值，否则 75)
    eventPlayer.mod_speed_event = ((eventPlayer.getMaxHealth() - eventPlayer.getHealth()) / eventPlayer.getMaxHealth() * 100) if ((eventPlayer.getMaxHealth() - eventPlayer.getHealth()) / eventPlayer.getMaxHealth() * 100) < 75 else 75
    
    # 修复点 2: 修正 NaN 错误
    # 源代码逻辑是: 如果已损生命百分比 < 75，则取百分比值；否则取 50
    eventPlayer.mod_dmg_taken = ((eventPlayer.getMaxHealth() - eventPlayer.getHealth()) / eventPlayer.getMaxHealth() * 100) if ((eventPlayer.getMaxHealth() - eventPlayer.getHealth()) / eventPlayer.getMaxHealth() * 100) < 75 else 50
    
    updatePlayerStats()
    wait(1)
    if ruleCondition:
        loop()
    eventPlayer.mod_speed_event = 0
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()


rule "[VishkarEvent]: 屁动力":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 12, eventPlayer.isHoldingButton(Button.JUMP)]) == true
    
    if eventPlayer.nanoEffect != null:
        goto lbl_0
    eventPlayer.mod_dmg_taken = -50
    updatePlayerStats()
    createEffect(getAllPlayers(), Effect.ANA_NANO_BOOSTED, Color.TEAM_2, eventPlayer, 200, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.nanoEffect = getLastCreatedEntity()
    lbl_0:
    eventPlayer.applyImpulse(eventPlayer.getFacingDirection(), 15, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    wait()
    if ruleCondition:
        loop()
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()
    destroyEffect(eventPlayer.nanoEffect)
    eventPlayer.nanoEffect = null


rule "[VishkarEvent]: 赌徒：竞速挑战":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 13, eventPlayer.isHoldingButton(Button.RELOAD)]) == true
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setHealth(eventPlayer.getMaxHealth() * 0.5)
    eventPlayer.categoryRoll = random.uniform(0, 100)
    if eventPlayer.categoryRoll <= 49:
        eventPlayer.mod_speed_perma += 5
        eventPlayer.dlcTimeChallenge++
        smallMessage(eventPlayer, "  {0}  赢！永久获得 5% 移动速度加成".format(iconString(Icon.CLUB)))
    elif eventPlayer.categoryRoll <= 98:
        eventPlayer.mod_speed_perma -= 5
        eventPlayer.dlcTimeChallenge = 0 if eventPlayer.dlcTimeChallenge > 0 else eventPlayer.dlcTimeChallenge - 1
        smallMessage(eventPlayer, "  {0}  输！永久失去 5% 移动速度加成".format(iconString(Icon.DIAMOND)))
    elif eventPlayer.categoryRoll <= 99:
        eventPlayer.mod_speed_perma += 12
        eventPlayer.dlcTimeChallenge++
        smallMessage(eventPlayer, "  {0}  赢！永久获得 12% 移动速度加成".format(iconString(Icon.CLUB)))
    else:
        eventPlayer.mod_speed_perma -= 12
        eventPlayer.dlcTimeChallenge = 0 if eventPlayer.dlcTimeChallenge > 0 else eventPlayer.dlcTimeChallenge - 1
        smallMessage(eventPlayer, "  {0}  输！永久失去 12% 移动速度加成".format(iconString(Icon.DIAMOND)))
    eventPlayer.categoryRoll = 0
    updatePlayerStats()
    eventPlayer.eventDuration = 0


rule "[VishkarEvent]: 4.0":
    @Disabled
    @Delimiter
    


rule "[VishkarEvent]: 三位一体 (SSR)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 24]) == true
    
    eventPlayer.mod_dmg_taken = min(85, eventPlayer.getMaxHealth() / 40) * -1
    eventPlayer.mod_speed_event = eventPlayer.mod_dmg_taken * -2
    updatePlayerStats()
    eventPlayer.heart_steel += 0.5
    setPlayerHP()
    smallMessage(eventPlayer, "  {0}  {1}".format(abilityIconString(Hero.MAUGA, Button.ABILITY_2), "当前减伤：{0}% ，移速加成：{1}%，心之钢：{2}层".format(eventPlayer.mod_dmg_taken * -1, eventPlayer.mod_speed_event, round(eventPlayer.heart_steel))))
    wait(1)
    if ruleCondition:
        loop()
    eventPlayer.mod_dmg_taken = 0
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()

rule "[VishkarEvent]: 相位猛冲 (智能检测版)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 24, eventPlayer.phase_trigger == true, eventPlayer.mod_speed_event == 0]) == true
    
    createEffect(getAllPlayers(), Effect.SOLDIER_SPRINTING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    eventPlayer.mod_speed_event += 300
    updatePlayerStats()
    wait(2)
    eventPlayer.mod_speed_event -= 300
    updatePlayerStats()
    clearEventEffect()
    wait(0.5)


rule "[VishkarEvent]: 操盘手 (伤害+状态检测)":
    @Event playerTookDamage
    @Team 2
    @Condition all([evalOnce(dlcVishkarEvent), attacker.hasSpawned(), attacker.eventType == 0, attacker.eventId == 25]) == true
    @Condition any([victim.hasStatus(Status.STUNNED), victim.hasStatus(Status.ASLEEP), victim.hasStatus(Status.KNOCKED_DOWN)]) == true
    
    if eventAbility == Button.ABILITY_1 and attacker.getAbilityCooldown(Button.ABILITY_1) > 0:
        attacker.setAbilityCooldown(Button.ABILITY_1, attacker.getAbilityCooldown(Button.ABILITY_1) * 0.5)
    if eventAbility == Button.ABILITY_2 and attacker.getAbilityCooldown(Button.ABILITY_2) > 0:
        attacker.setAbilityCooldown(Button.ABILITY_2, attacker.getAbilityCooldown(Button.ABILITY_2) * 0.5)
    if eventAbility == Button.SECONDARY_FIRE and attacker.getAbilityCooldown(Button.SECONDARY_FIRE) > 0:
        attacker.setAbilityCooldown(Button.SECONDARY_FIRE, attacker.getAbilityCooldown(Button.SECONDARY_FIRE) * 0.5)
    wait(1)

rule "[VishkarEvent]: 保镖 (Bodyguard)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 26, eventPlayer.phase_trigger == true]) == true
    
    eventPlayer.target = getPlayersInRadius(eventPlayer, 12, Team.1, LosCheck.SURFACES).exclude(eventPlayer)
    eventPlayer.addHealthPool(Health.ARMOR, round(25 + eventPlayer.getMaxHealth() * 0.5), false, false)
    eventPlayer.hp_data.append([[getTotalTimeElapsed() + 5, getLastCreatedHealthPool()]])
    playEffect(getAllPlayers(), DynamicEffect.BRIGITTE_REPAIR_PACK_ARMOR, Color.WHITE, eventPlayer, 200)
    wait()
    if len(eventPlayer.target) > 0:
        playEffect(getAllPlayers(), DynamicEffect.BRIGITTE_REPAIR_PACK_ARMOR, Color.WHITE, eventPlayer.target[0], 200)
        eventPlayer.target[0].addHealthPool(Health.ARMOR, round(25 + eventPlayer.getMaxHealth() * 0.5), false, false)
        eventPlayer.target[0].hp_data.append([[getTotalTimeElapsed() + 5, getLastCreatedHealthPool()]])
    wait(3)

rule "[VishkarEvent]: 任务：殉道者 (初始化)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 27]) == true
    
    if eventPlayer.hudTextId != null:
        goto lbl_0
    hudText(eventPlayer, null, "\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r", "{0}/{1}".format(len(eventPlayer.eventMission), len(getPlayers(Team.2))), HudPosition.TOP, 9, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.hudTextId = getLastCreatedText()
    lbl_0:
    wait(eventPlayer.eventDuration)


rule "[VishkarEvent]: 任务：殉道者 (进度检测)":
    @Event playerDied
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 27]) == true
    @Condition attacker.getTeam() == Team.2
    @Condition (not attacker in eventPlayer.eventMission) == true
    
    eventPlayer.eventMission.append(attacker)
    if len(eventPlayer.eventMission) == len(getPlayers(Team.2)):
        waitUntil(eventPlayer.isAlive(), 3)
        bigMessage(eventPlayer, "任务：殉道者 完成！")
        smallMessage(eventPlayer, "  {0}  任务奖励：永久获得 {1}% 伤害减免".format(abilityIconString(Hero.HAZARD, Button.SECONDARY_FIRE), 5))
        eventPlayer.mod_dmg_perma += 5
        updatePlayerStats()

        
rule "[VishkarEvent]: 多动症 (触发回血)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 28, eventPlayer.phase_trigger == true]) == true
    
    if eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 1:
        eventPlayer.setAbilityCooldown(Button.ABILITY_1, eventPlayer.getAbilityCooldown(Button.ABILITY_1) * 0.5)
    if eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 1:
        eventPlayer.setAbilityCooldown(Button.ABILITY_2, eventPlayer.getAbilityCooldown(Button.ABILITY_2) * 0.5)
    eventPlayer.startHealingOverTime(eventPlayer, 2, (round(50 + eventPlayer.getMaxHealth() * 0.25)) / 2)
    wait(2.5)


rule "[VishkarEvent]: 操盘手 (伤害+状态检测)":
    @Event playerTookDamage
    @Team 2
    @Condition all([evalOnce(dlcVishkarEvent), attacker.hasSpawned(), attacker.eventType == 0, attacker.eventId == 29]) == true
    @Condition any([victim.hasStatus(Status.STUNNED), victim.hasStatus(Status.ASLEEP), victim.hasStatus(Status.KNOCKED_DOWN)]) == true
    
    if eventAbility == Button.ABILITY_1 and attacker.getAbilityCooldown(Button.ABILITY_1) > 0:
        attacker.setAbilityCooldown(Button.ABILITY_1, attacker.getAbilityCooldown(Button.ABILITY_1) * 0.25)
    if eventAbility == Button.ABILITY_2 and attacker.getAbilityCooldown(Button.ABILITY_2) > 0:
        attacker.setAbilityCooldown(Button.ABILITY_2, attacker.getAbilityCooldown(Button.ABILITY_2) * 0.25)
    if eventAbility == Button.SECONDARY_FIRE and attacker.getAbilityCooldown(Button.SECONDARY_FIRE) > 0:
        attacker.setAbilityCooldown(Button.SECONDARY_FIRE, attacker.getAbilityCooldown(Button.SECONDARY_FIRE) * 0.25)
    if victim.hasStatus(Status.STUNNED):
        sorted(getPlayers(Team.2), lambda player: distance(attacker, player)).setStatusEffect(null, Status.STUNNED, 5)
    elif victim.hasStatus(Status.ASLEEP):
        sorted(getPlayers(Team.2), lambda player: distance(attacker, player)).setStatusEffect(null, Status.ASLEEP, 5)
    elif victim.hasStatus(Status.KNOCKED_DOWN):
        sorted(getPlayers(Team.2), lambda player: distance(attacker, player)).setStatusEffect(null, Status.KNOCKED_DOWN, 5)
    waitUntil(any([victim.hasStatus(Status.STUNNED), victim.hasStatus(Status.ASLEEP), victim.hasStatus(Status.KNOCKED_DOWN)]) == false, 10)
    sorted(getPlayers(Team.2), lambda player: distance(attacker, player)).clearStatusEffect(Status.STUNNED)
    sorted(getPlayers(Team.2), lambda player: distance(attacker, player)).clearStatusEffect(Status.ASLEEP)
    sorted(getPlayers(Team.2), lambda player: distance(attacker, player)).clearStatusEffect(Status.KNOCKED_DOWN)
    wait(2)


rule "[VishkarEvent]: 鼓舞士气 ProMax - 触发器":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 30]) == true
    
    playEffect(getAllPlayers(), DynamicEffect.BRIGITTE_WHIP_SHOT_HEAL_AREA, Color.TEAM_1, eventPlayer, 200)
    getPlayersInRadius(eventPlayer, 5, Team.1, LosCheck.SURFACES).startHealingOverTime(eventPlayer, 1, 50 + eventPlayer.getMaxHealth() * 0.5)
    wait(1)
    if ruleCondition:
        loop()
    clearEventEffect()


rule "[VishkarEvent]: 成吨的增益 (初始化与属性)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 31]) == true
    
    eventPlayer.mod_speed_event += 50
    eventPlayer.mod_dmg_taken -= 50
    eventPlayer.mod_heal_event += 50
    eventPlayer.heal_recv += 50
    updatePlayerStats()
    eventPlayer.sizeHealth = 1.5
    setPlayerHP()
    wait(eventPlayer.eventDuration)
    eventPlayer.mod_speed_event -= 50
    eventPlayer.mod_dmg_taken -= 50
    eventPlayer.mod_heal_event -= 50
    eventPlayer.heal_recv -= 50
    updatePlayerStats()
    eventPlayer.sizeHealth = 1
    setPlayerHP()
    clearEventEffect()


rule "[VishkarEvent]: 成吨的增益 (冷却缩减循环)":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.eventType == 0
    @Condition eventPlayer.eventId == 31
    @Condition any([eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 0, eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 0, eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) > 0]) == true
    
    if eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 0:
        eventPlayer.setAbilityCooldown(Button.ABILITY_1, eventPlayer.getAbilityCooldown(Button.ABILITY_1) * 0.5)
    if eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 0:
        eventPlayer.setAbilityCooldown(Button.ABILITY_2, eventPlayer.getAbilityCooldown(Button.ABILITY_2) * 0.5)
    if eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) > 0:
        eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) * 0.5)
    wait(1)


rule "[VishkarEvent]: F5 (循环刷新)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 32]) == true
    
    resetPlayerCD()
    wait(5)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 治疗光塔 ProMax (全图奶)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 33]) == true
    
    smallMessage(getPlayers(Team.1).exclude(eventPlayer), "  {0}  受到来自 {1}（{2}） 治疗光塔 ProMax 的治疗效果".format(abilityIconString(Hero.ILLARI, Button.ABILITY_2), eventPlayer, eventPlayer.getHero()))
    getPlayers(Team.1).startHealingOverTime(eventPlayer, 1, round(25 + eventPlayer.getMaxHealth() * 1.25))
    wait(1)
    if ruleCondition:
        loop()
    clearEventEffect()


rule "[VishkarEvent]: 保持距离 (易伤光环)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 16]) == true
    
    eventPlayer.target = sorted(getPlayersInRadius(eventPlayer, 25, Team.1, LosCheck.SURFACES).exclude(eventPlayer), lambda i: distance(eventPlayer, i))[0]
    if eventPlayer.target != null:
        eventPlayer.mod_dmg_taken = min(50, max(0, (25 - distance(eventPlayer, eventPlayer.target)) * 2))
    else:
        eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()
    wait(1)
    if ruleCondition:
        loop()
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 404 (随机禁用技能)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 17]) == true
    
    if eventPlayer.getHero() == Hero.LIFEWEAVER:
        eventPlayer.eventMission = 1
    elif eventPlayer.getHero() == Hero.TORBJORN or eventPlayer.getHero() == Hero.SYMMETRA:
        eventPlayer.eventMission = 2
    else:
        eventPlayer.eventMission = random.randint(1, 3)
    if eventPlayer.eventMission == 1:
        eventPlayer.disallowButton(Button.ABILITY_1)
        eventPlayer.setAbility1Enabled(false)
        smallMessage(eventPlayer, "  {0}  你的技能 1 已被禁用".format(iconString(Icon.WARNING)))
    elif eventPlayer.eventMission == 2:
        eventPlayer.disallowButton(Button.ABILITY_2)
        eventPlayer.setAbility2Enabled(false)
        smallMessage(eventPlayer, "  {0}  你的技能 2 已被禁用".format(iconString(Icon.WARNING)))
    else:
        eventPlayer.disallowButton(Button.SECONDARY_FIRE)
        eventPlayer.setSecondaryFireEnabled(false)
        smallMessage(eventPlayer, "  {0}  你的辅助攻击 已被禁用".format(iconString(Icon.WARNING)))
    wait(eventPlayer.eventDuration)
    if eventPlayer.eventMission == 1:
        eventPlayer.allowButton(Button.ABILITY_1)
        eventPlayer.setAbility1Enabled(true)
    elif eventPlayer.eventMission == 2:
        eventPlayer.allowButton(Button.ABILITY_2)
        eventPlayer.setAbility2Enabled(true)
    else:
        eventPlayer.allowButton(Button.SECONDARY_FIRE)
        eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.eventMission = 0
    clearEventEffect()


rule "[VishkarEvent]: 连锁过载 (扁平循环版)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 18]) == true
    
    if any([eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 0, eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 0, eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) > 0, eventPlayer.getAbilityCooldown(Button.PRIMARY_FIRE) > 0, eventPlayer.getAbilityCooldown(Button.RELOAD) > 0, eventPlayer.getAbilityCooldown(Button.JUMP) > 0]) == true:
        eventPlayer.setAbilityCooldown(Button.ABILITY_1, max(eventPlayer.getAbilityCooldown(Button.ABILITY_1), random.randint(15, 30)))
        eventPlayer.setAbilityCooldown(Button.ABILITY_2, max(eventPlayer.getAbilityCooldown(Button.ABILITY_2), random.randint(15, 30)))
        eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, max(eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE), random.randint(15, 30)))
        eventPlayer.setAbilityCooldown(Button.PRIMARY_FIRE, max(eventPlayer.getAbilityCooldown(Button.PRIMARY_FIRE), random.randint(15, 30)))
        eventPlayer.setAbilityCooldown(Button.RELOAD, max(eventPlayer.getAbilityCooldown(Button.RELOAD), random.randint(15, 30)))
        eventPlayer.setAbilityCooldown(Button.JUMP, max(eventPlayer.getAbilityCooldown(Button.JUMP), random.randint(15, 30)))
    wait(2)
    if ruleCondition:
        loop()
    clearEventEffect()


rule "[VishkarEvent]: 我和你 (生命同步)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 19]) == true
    
    stopCombatRegen()
    eventPlayer.target = (sorted(getLivingPlayers(Team.1).exclude(eventPlayer), lambda i: i.getHealth() / i.getMaxHealth()))[0]

    if eventPlayer.target != null:
        if eventPlayer.getHealth() / eventPlayer.getMaxHealth() > eventPlayer.target.getHealth() / eventPlayer.target.getMaxHealth():
        eventPlayer.setHealth(eventPlayer.getMaxHealth() * (eventPlayer.target.getHealth() / eventPlayer.target.getMaxHealth()))
    wait(1)
    if ruleCondition:
        loop()
    clearEventEffect()
    eventPlayer.target = null


rule "[VishkarEvent]: 吸血鬼 ProMax (按需吸血)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 20, eventPlayer.getNormalizedHealth() != 1]) == true
    
    stopCombatRegen()
    eventPlayer.target = [i for i in getPlayersInRadius(eventPlayer, 45, Team.1, LosCheck.SURFACES).exclude(eventPlayer) if i.isAlive()]
    if len(eventPlayer.target) > 0:
        damage(eventPlayer.target, eventPlayer, 25)
        heal(eventPlayer, eventPlayer.target, len(eventPlayer.target) * 25)
        playEffect(getAllPlayers(), DynamicEffect.MOIRA_FADE_REAPPEAR, Color.RED, eventPlayer.target, 200)
    wait(1)
    if ruleCondition:
        loop()
    clearEventEffect()
    eventPlayer.target = null


rule "[VishkarEvent]: 成吨的减益 (全属性削弱)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 21]) == true
    
    eventPlayer.mod_speed_event -= 50
    eventPlayer.mod_dmg_taken += 50
    eventPlayer.mod_heal_event -= 50
    eventPlayer.heal_recv -= 50
    updatePlayerStats()
    eventPlayer.sizeHealth = 0.5
    setPlayerHP()
    wait(eventPlayer.eventDuration)
    eventPlayer.mod_speed_event += 50
    eventPlayer.mod_dmg_taken -= 50
    eventPlayer.mod_heal_event += 50
    eventPlayer.heal_recv += 50
    eventPlayer.sizeHealth = 1
    setPlayerHP()
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 作弊：我要验牌 (触发)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 14, eventPlayer.isHoldingButton(Button.RELOAD)]) == true
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    eventPlayer.heart_steel -= 10
    setPlayerHP()
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.TEAM_1, eventPlayer, 100)
    eventPlayer.eventForceRoll = 20
    smallMessage(eventPlayer, "  {0}  已扣除 10% 最大生命值".format(abilityIconString(Hero.MAUGA, Button.ABILITY_2)))
    wait(0.2)
    smallMessage(eventPlayer, "  {0}  下一个事件必然是增益，祝你好运".format(iconString(Icon.CLUB)))
    eventPlayer.eventDuration = 0


rule "[VishkarEvent]: 作弊：回溯 (记录位置 - 0.5秒心跳)":
    @Event eachPlayer
    @Team 1
    @Condition evalOnce(controlRespawnPosition) == null
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 15]) == true
    
    if evalOnce(controlRespawnPosition) != null:
        eventPlayer.eventDuration = 0
    eventPlayer.controlPlayerRespawnPosition = [eventPlayer.getPosition(), eventPlayer.getFacingDirection(), eventPlayer.getHero()]
    wait(3)
    if ruleCondition:
        loop()
    eventPlayer.controlPlayerRespawnPosition = null


rule "[VishkarEvent]: 作弊：回溯 (按键触发)":
    @Event eachPlayer
    @Team 1
    @Condition evalOnce(controlRespawnPosition) == null
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 15, eventPlayer.isHoldingButton(Button.RELOAD)]) == true
    
    damage(eventPlayer, null, eventPlayer.getMaxHealth() * 0.1)
    playEffect(getAllPlayers(), DynamicEffect.TRACER_RECALL_DISAPPEAR, Color.TEAM_1, eventPlayer, 200)
    wait(0.032)
    eventPlayer.teleport(eventPlayer.controlPlayerRespawnPosition[0])
    playEffect(getAllPlayers(), DynamicEffect.TRACER_RECALL_REAPPEAR, Color.TEAM_1, eventPlayer, 200)
    wait(3)


rule "[VishkarEvent]: 赌徒：短期投资 (交易)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 16, eventPlayer.isHoldingButton(Button.RELOAD)]) == true
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    if random.randint(0, 99) < 75:
        eventPlayer.heart_steel += 4
        smallMessage(eventPlayer, "  {0}  赢！获得 4 层心之钢".format(iconString(Icon.CLUB)))
    else:
        smallMessage(eventPlayer, "  {0}  输！祝你好运".format(iconString(Icon.DIAMOND)))
    eventPlayer.eventForceRoll = 50
    eventPlayer.eventForceCount = 2
    smallMessage(eventPlayer, "  {0}  合约已生效：未来 3 个事件为 减益".format(iconString(Icon.DIAMOND)))
    clearPlayerEvent()


rule "[VishkarEvent]: 赌徒：长期投资 (豪赌)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 22, eventPlayer.isHoldingButton(Button.RELOAD)]) == true
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    if random.randint(0, 99) < 33:
        eventPlayer.heart_steel += 20
        smallMessage(eventPlayer, "  {0}  赢！获得 5% 最大生命值".format(iconString(Icon.CLUB)))
    else:
        smallMessage(eventPlayer, "  {0}  输！祝你好运".format(iconString(Icon.DIAMOND)))
    eventPlayer.eventForceRoll = 50
    eventPlayer.eventForceCount = 4
    smallMessage(eventPlayer, "  {0}  合约已生效：未来 5 个事件为 减益".format(iconString(Icon.DIAMOND)))
    clearPlayerEvent()


rule "[VishkarEvent]: 命运共同体 (事件复制)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 17]) == true
    
    eventPlayer.target = [player for player in getLivingPlayers(Team.1) if player != eventPlayer and player.eventId != -1 and player.eventId != 17]
    if len(eventPlayer.target) > 0:
        eventPlayer.target = random.choice(eventPlayer.target)
        eventPlayer.eventType = eventPlayer.target.eventType
        eventPlayer.eventId = eventPlayer.target.eventId
        if eventPlayer.eventType == 0:
            eventPlayer.eventDuration = buffEvent[eventPlayer.eventId].last()
            eventPlayer.eventName = buffEvent[eventPlayer.eventId][0]
            eventPlayer.eventDesc = buffEvent[eventPlayer.eventId][1]
        elif eventPlayer.eventType == 1:
            eventPlayer.eventDuration = debuffEvent[eventPlayer.eventId].last()
            eventPlayer.eventName = debuffEvent[eventPlayer.eventId][0]
            eventPlayer.eventDesc = debuffEvent[eventPlayer.eventId][1]
        else:
            eventPlayer.eventDuration = mechEvent[eventPlayer.eventId].last()
            eventPlayer.eventName = mechEvent[eventPlayer.eventId][0]
            eventPlayer.eventDesc = mechEvent[eventPlayer.eventId][1]
        smallMessage(getAllPlayers(), "  {0} 与 {1} 命运相连！共同承担：{2}".format(eventPlayer, eventPlayer.target, eventPlayer.eventName))
    else:
        eventPlayer.eventDuration = 0
        clearPlayerEvent()


rule "[VishkarEvent]: 作弊：跳过 (更换英雄)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 18, eventPlayer.isHoldingButton(Button.RELOAD)]) == true
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    progressHero()
    eventPlayer.eventDuration = 0
    clearPlayerEvent()


rule "[VishkarEvent]: 俄罗斯方块 (变大复活)":
    @Event playerDied
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 19]) == true
    
    eventPlayer.disableRespawn()
    wait(2)
    eventPlayer.enableRespawn()
    eventPlayer.resurrect()
    eventPlayer.eventSize++
    eventPlayer.startScalingSize(1 + 0.05 * eventPlayer.eventSize, false)
    eventPlayer.startModifyingVoicelinePitch(max(0.2, 1 - 0.05 * eventPlayer.eventSize), false)
    eventPlayer.sizeHealth += 0.05
    setPlayerHP()


rule "[VishkarEvent]: 俄罗斯套娃 (变小复活)":
    @Event playerDied
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 20]) == true
    
    eventPlayer.disableRespawn()
    wait(2)
    eventPlayer.enableRespawn()
    eventPlayer.resurrect()
    eventPlayer.eventSize++
    eventPlayer.startScalingSize(max(0.2, 1 - 0.05 * eventPlayer.eventSize), false)
    eventPlayer.startModifyingVoicelinePitch(max(1.8, 1 + 0.05 * eventPlayer.eventSize), false)
    eventPlayer.mod_speed_event += 5
    updatePlayerStats()


rule "[VishkarEvent]: 作弊：0CD (血量换CD)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 21]) == true
    @Condition any([eventPlayer.isUsingAbility1(), eventPlayer.isUsingAbility2(), eventPlayer.isFiringSecondaryFire()]) == true
    
    waitUntil(any([eventPlayer.isUsingAbility1(), eventPlayer.isUsingAbility2(), eventPlayer.isFiringSecondaryFire()]) == false, 2)
    damage(eventPlayer, null, eventPlayer.getMaxHealth() * 0.25)
    resetPlayerCD()
    playEffect(getAllPlayers(), DynamicEffect.ZARYA_PARTICLE_CANNON_EXPLOSION, Color.TEAM_2, eventPlayer, 3)
    wait(0.25)
    if ruleCondition:
        loop()
    clearEventEffect()


rule "[VishkarEvent]: 瓦尔基里降临":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 23]) == true
    
    eventPlayer.sizeHealth = 10
    setPlayerHP()
    eventPlayer.heal_recv = -100
    eventPlayer.mod_heal_event = -100
    updatePlayerStats()
    eventPlayer.eventMission = eventPlayer.getMaxHealth()
    wait(eventPlayer.eventDuration)
    eventPlayer.sizeHealth = 1
    setPlayerHP()
    eventPlayer.heal_recv = 0
    eventPlayer.mod_heal_event = 0
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 瓦尔基里降临 大招充能":
    @Event playerTookDamage
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 23]) == true
    @Condition attacker != eventPlayer
    
    eventPlayer.setUltCharge(eventPlayer.getUltCharge() + 10)
    wait(0.5)


rule "[VishkarEvent]: 瓦尔基里降临 (大招持续回血)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 23, eventPlayer.isUsingUltimate()]) == true
    
    if eventPlayer.eventTargetHP == 0:
        eventPlayer.eventTargetHP = eventPlayer.getMaxHealth()
    eventPlayer.eventTargetHP = eventPlayer.getHealth() + ((eventPlayer.eventTargetHP - eventPlayer.getHealth()) * 0.85)
    while all([eventPlayer.isUsingUltimate(), eventPlayer.getHealth() < eventPlayer.eventTargetHP]):
        eventPlayer.setHealth(min(eventPlayer.eventTargetHP, eventPlayer.getHealth() + eventPlayer.getMaxHealth() * 0.04))
        playEffect(getAllPlayers(), DynamicEffect.HEAL_TARGET_ACTIVE, Color.YELLOW, eventPlayer, 60)
        wait(0.2)


rule "[VishkarEvent]: Global event - 势不可挡":
    @Event eachPlayer
    @Team 2
    @Condition all([evalOnce(dlcVishkarEvent), eventId == 1]) == true
    
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, eventDuration)
    waitUntil(eventId == null, eventDuration)
    eventPlayer.clearStatusEffect(Status.PHASED_OUT)


rule "[VishkarEvent]: Global event - 任务：生存":
    @Condition all([evalOnce(dlcVishkarEvent), eventId == 3]) == true
    
    waitUntil(eventId == null or eventCount > 10, eventDuration)
    if eventCount > 10:
        bigMessage(getPlayers(Team.1), "任务：生存 失败")
    else:
        bigMessage(getPlayers(Team.1), "任务：生存 成功！")
        smallMessage(getPlayers(Team.1), "  {0}  任务奖励：永久增加 {1}% 最大生命值".format(iconString(Icon.PLUS), 15))


rule "[VishkarEvent]: Global event - 任务：占领":
    @Condition all([evalOnce(dlcVishkarEvent), eventId == 4, len(getPlayers(Team.1)) >= 4]) == true
    @Delimiter
    


rule "[VishkarEvent]: Global event - 任务：竞速":
    @Condition all([evalOnce(dlcVishkarEvent), eventId == 5]) == true
    
    waitUntil(eventId == null, eventDuration)
    if len([player for player in getPlayers(Team.1) if player.heroNumber >= 22]) < len(getPlayers(Team.1)) / 2:
        bigMessage(getPlayers(Team.1), "任务：竞速 失败")
    else:
        bigMessage(getPlayers(Team.1), "任务：竞速 成功！")
        smallMessage(getPlayers(Team.1), "  {0}  任务奖励：永久获得 {1}% 移动速度加成".format(abilityIconString(Hero.SOLDIER, Button.ABILITY_1), 5))
        smallMessage(getPlayers(Team.1), "  {0}  任务奖励：永久获得 {1}% 伤害减免".format(abilityIconString(Hero.MAUGA, Button.ABILITY_2), 10))


