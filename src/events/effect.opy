#!mainFile "../main.opy"

#!include "./config_effects.opy"


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
    eventPlayer.mod_speed_event = EVT_1_SPEED_BOOST
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
    eventPlayer.addHealthPool(Health.ARMOR, EVT_2_ARMOR_AMOUNT, false, false)
    eventPlayer.healthId[1] = getLastCreatedHealthPool()
    playEffect(getAllPlayers(), DynamicEffect.BRIGITTE_REPAIR_PACK_ARMOR, Color.WHITE, eventPlayer, 200)
    eventPlayer.mod_dmg_taken = EVT_2_DMG_TAKEN
    updatePlayerStats()
    waitUntil(eventPlayer.eventId == -1, eventPlayer.eventDuration)
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
    eventPlayer.mod_dmg_taken = EVT_3_DMG_TAKEN
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
    eventPlayer.startHealingOverTime(eventPlayer, 20, eventPlayer.getMaxHealth() * EVT_4_HEAL_PERCENT)
    wait(eventPlayer.eventDuration)
    clearEventEffect()


rule "[VishkarEvent]: 黑粉来袭":
    @Event eachPlayer
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 5]) == true
    
   
    eventPlayer.hudText = "{0}/{1}".format(len([player for player in getPlayers(Team.2) if player.target == eventPlayer]), len(bastionPosition))
    wait(getAverageServerLoad() / 100 * 0.032)
    if ruleCondition:
        loop()
    eventPlayer.hudText = ""


rule "[VishkarEvent]: 足力健":
    @Event eachPlayer
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 6, eventPlayer.isMoving(), eventPlayer.getSpeed() != 0]) == true
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    if eventPlayer.eventEffect != null:
        goto lbl_0
    createEffect(getAllPlayers(), Effect.SOLDIER_SPRINTING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    lbl_0:
    eventPlayer.mod_speed_event += EVT_6_SPEED_INC_PER_SEC
    eventPlayer.hudText = "移速+{0}%".format(eventPlayer.mod_speed_event)
    updatePlayerStats()
    if ruleCondition:
        loop()
    wait(0.032)
    eventPlayer.mod_speed_event = 0
    eventPlayer.hudText = ""
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 血肉再生":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 7]) == true
    
    wait(0.032)
    removeHealthPool(eventPlayer.healthId[0])
    eventPlayer.addHealthPool(Health.NORMAL, round(EVT_7_BASE_HEALTH + eventPlayer.getMaxHealth() * EVT_7_HEALTH_PERCENT), false, false)
    eventPlayer.healthId[0] = getLastCreatedHealthPool()
    wait(EVT_7_REGEN_INTERVAL)
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
    waitUntil(eventPlayer.eventId == -1, eventPlayer.eventDuration)
    clearEventEffect()


rule "[VishkarEvent]: 心之钢":
    @Event playerDied
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 8]) == true
    @Condition attacker.getHero() == Hero.BASTION
    
    eventPlayer.heart_steel += EVT_8_HP_LAYER_PER_DEATH
    smallMessage(eventPlayer, "  {0}  已获得 {1} 层（{2}%）心之钢".format(abilityIconString(Hero.MAUGA, Button.ABILITY_2), EVT_8_HP_LAYER_PER_DEATH, EVT_8_HP_LAYER_PER_DEATH * EVT_8_HP_PERCENT_PER_STACK))
    wait(0.032)
    waitUntil(eventPlayer.isAlive(), 0.5)
    setPlayerHP()
    wait(0.032)


rule "[VishkarEvent]: 危险感知":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 9]) == true
    @Condition len([player for player in getPlayers(Team.2) if player.target == eventPlayer]) > 0
    
    eventPlayer.mod_speed_event = EVT_9_SPEED_BOOST
    eventPlayer.mod_dmg_taken = EVT_9_DMG_TAKEN
    updatePlayerStats()
    waitUntil(len([player for player in getPlayers(Team.2) if player.target == eventPlayer]) == 0, eventPlayer.eventDuration)
    wait(EVT_9_LINGER_TIME)
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
    eventPlayer.addHealthPool(Health.ARMOR, EVT_10_ARMOR_AMOUNT, true, false)
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
    attacker.setStatusEffect(victim, Status.STUNNED, EVT_10_STUN_DURATION)
    lbl_0:
    wait(EVT_10_STUN_COOLDOWN)


rule "[VishkarEvent]: 死亡延迟":
    @Event playerTookDamage
    @Team 1
    @Condition all([dlcVishkarEvent, eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 11, attacker.getHero() != eventPlayer.getHero()]) == true
    @Condition (any([eventDamage >= eventPlayer.getHealth(), eventPlayer.getHealth() <= eventPlayer.getMaxHealth() * EVT_11_TRIGGER_HP_PERCENT, eventAbility == Button.SECONDARY_FIRE and attacker.getHero() == Hero.BASTION and eventPlayer.getMaxHealth() <= EVT_11_BASTION_EXECUTE_HP])) == true
    
    wait(0.016, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setStatusEffect(eventPlayer, Status.UNKILLABLE, eventPlayer.eventDuration)
    createEffect(getAllPlayers(), Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.invincibleEffect = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED_SOUND, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    smallMessage(eventPlayer, "  {0}  已触发死亡延迟，致命伤害已延后".format(abilityIconString(Hero.BAPTISTE, Button.ABILITY_2)))
    waitUntil(eventPlayer.eventId == -1, eventPlayer.eventDuration)
    eventPlayer.clearStatusEffect(Status.UNKILLABLE)
    destroyEffect(eventPlayer.invincibleEffect)
    clearEventEffect()
    wait()
    if any([eventPlayer.hasStatus(Status.PHASED_OUT), eventPlayer.hasStatus(Status.INVINCIBLE), eventPlayer.hasStatus(Status.UNKILLABLE)]):
        goto lbl_0
    smallMessage(eventPlayer, "  {0} 死亡延迟：致命伤害已施加".format(
    iconString(Icon.SKULL)))
    damage(eventPlayer, attacker, EVT_11_EXECUTE_DAMAGE)
    lbl_0:


# ==============================================================================
# Rule 1: 主动方 - 寻找目标、发起连接与控制
# ==============================================================================
rule "[VishkarEvent]: 有我有你 (Initiator - Control Logic)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 12]) == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    # 1. 寻找目标 (排除自己、已获胜、已从属于他人、已被附身的玩家)
    wait(0.032, Wait.ABORT_WHEN_FALSE)
    # 这里把 possessed 视为数组判断，len(p.possessed) == 0 代表未被附身
    eventPlayer.possess = sorted([player for player in getLivingPlayers(Team.1) if player != eventPlayer and player.isWinner != true and len(player.possessed) == 0 and distance(eventPlayer, player) < 40], lambda i: distance(eventPlayer, i))
    
    wait(0.032)
    smallMessage(eventPlayer, "  {0}".format("附近未找到可附身目标" if len(eventPlayer.possess) == 0 else "附身目标：{0}".format(eventPlayer.possess[0])))
    
    if len(eventPlayer.possess) == 0:
        goto lbl_0

    # 2. 发起附身 (写入数据)
    # 目标变量 possessed 结构: [0:来源玩家, 1:治疗增益, 2:减伤, 3:移速, 4:血池ID(预留), 5:最大生命值]
    # 先写入除 ID 外的数据，ID 由目标生成后填入
    eventPlayer.possess[0].possessed[0] = eventPlayer
    eventPlayer.possess[0].possessed[1] = eventPlayer.mod_heal_event
    eventPlayer.possess[0].possessed[2] = eventPlayer.mod_dmg_taken
    eventPlayer.possess[0].possessed[3] = eventPlayer.mod_speed_event
    eventPlayer.possess[0].possessed[5] = eventPlayer.getMaxHealth()
    
    # 3. 附身连接
    eventPlayer.teleport(eventPlayer.possess[0].getPosition())
    eventPlayer.attachTo(eventPlayer.possess[0], vect(0, 1, -1))

    if eventPlayer.getHero() in phaseHero[0]:
        eventPlayer.disallowButton(Button.ABILITY_1)
        eventPlayer.setAbility1Enabled(false)

    if eventPlayer.getHero() in phaseHero[1]:
        eventPlayer.disallowButton(Button.ABILITY_2)
        eventPlayer.setAbility2Enabled(false)
    
    smallMessage(eventPlayer.possess[0], "  {0}  你已被 {1}（{2}） 附身".format(abilityIconString(Hero.MERCY, Button.ULTIMATE), eventPlayer, eventPlayer.getHero()))
    
    # 自身状态：消散 (不可选取/受到伤害)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
     # 自身状态：无敌 (双重保险)
    eventPlayer.setStatusEffect(null, Status.INVINCIBLE, 9999)

    lbl_0:
    # 4. 维持阶段
    # 等待直到：目标死亡、自身按蹲、目标掉线、时间结束、或者目标被意外清除了附身状态
    waitUntil(eventPlayer.possess[0].isDead() or eventPlayer.isHoldingButton(Button.CROUCH) or not entityExists(eventPlayer.possess[0]) or eventPlayer.isDead() or len(eventPlayer.possess[0].possessed) == 0 or eventPlayer.eventDuration == 0, eventPlayer.eventDuration)

    removeHealthPool(eventPlayer.possess[0].healthId[4])
    
    # 5. 清理阶段
    eventPlayer.detach()
    
    # 清除目标状态
    if entityExists(eventPlayer.possess[0]):
        # removeHealthPool(eventPlayer.possess[0].possessed[4])
        
        eventPlayer.possess[0].possessed = []
    
    # 寻找安全落脚点
    if eventPlayer.possess[0].getPosition() != null:
        eventPlayer.teleport(nearestWalkablePosition(eventPlayer.possess[0].getPosition() + vect(random.randint(-1, 1), 0.5, random.randint(-1, 1))))
    
    # 自身重置
    eventPlayer.clearStatusEffect(Status.PHASED_OUT)
    eventPlayer.clearStatusEffect(Status.INVINCIBLE)
    if eventPlayer.getHero() in phaseHero[0] and eventPlayer.getHero() not in [Hero.TORBJORN, Hero.SYMMETRA]:
        eventPlayer.allowButton(Button.ABILITY_1)
        eventPlayer.setAbility1Enabled(true)

    if eventPlayer.getHero() in phaseHero[1] and eventPlayer.getHero() not Hero.LIFEWEAVER:
        eventPlayer.allowButton(Button.ABILITY_2)
        eventPlayer.setAbility2Enabled(true)
    eventPlayer.possess = null
    wait(2)


# ==============================================================================
# Rule 2: 被动方 - 属性同步与加成 (Receiver Logic)
# ==============================================================================
rule "[VishkarEvent]: 有我有你 (Receiver - Stats Sync)":
    @Event eachPlayer
    @Team 1
    # 触发条件：possessed 数组非空 (有人附身)
    @Condition len(eventPlayer.possessed) > 0
    @Condition eventPlayer.possessed[0] != null
    
    # 1. 应用属性叠加 (读取数据)
    eventPlayer.mod_heal_event += eventPlayer.possessed[1]
    eventPlayer.mod_dmg_taken += eventPlayer.possessed[2]
    eventPlayer.mod_speed_event += eventPlayer.possessed[3]
    
    # 刷新自身属性
    updatePlayerStats()
    
    # 2. 添加额外生命值 (数值来自 possessed[5])
    # 将生成的 Health Pool ID 存回 possessed[4] 以便后续删除
    removeHealthPool(eventPlayer.healthId[4])
    eventPlayer.addHealthPool(Health.NORMAL, eventPlayer.possessed[5], true, false)
    eventPlayer.healthId[4] = getLastCreatedHealthPool()
    
    
    # 3. 等待附身结束 (监听数组是否被置空)
    # 同时监控来源玩家状态，如果来源玩家中途退游戏，也需要自动清理
    waitUntil(eventPlayer.possessed[0].eventDuration <= 2 or len(eventPlayer.possessed) == 0 or not entityExists(eventPlayer.possessed[0]), 9999)
    
    # 4. 移除属性 (减去快照数据)
    eventPlayer.mod_heal_event -= eventPlayer.possessed[1]
    eventPlayer.mod_dmg_taken -= eventPlayer.possessed[2]
    eventPlayer.mod_speed_event -= eventPlayer.possessed[3]
    
    # 移除额外生命值
    # if eventPlayer.possessed[4] != null:
    removeHealthPool(eventPlayer.healthId[4])
    
    # 刷新并清理
    updatePlayerStats()
    
    # 最终确保置空 (如果是因来源玩家掉线触发的，需要自己清空数组)
    eventPlayer.possessed = []

rule "[VishkarEvent]: ↑↑↓↓←→←→BABA":
    @Event eachPlayer
    @Team 1
    @Condition evalOnce(controlRespawnPosition) == null
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.isAlive(), eventPlayer.eventType == 0, eventPlayer.eventId == 13]) == true
    
    if evalOnce(controlRespawnPosition) != null:
        eventPlayer.eventDuration = 0
    eventPlayer.controlPlayerRespawnPosition = [eventPlayer.getPosition(), eventPlayer.getFacingDirection(), eventPlayer.getHero()]
    playEffect(getAllPlayers(), DynamicEffect.SOMBRA_TRANSLOCATING_MATERIAL, Color.TEAM_1, eventPlayer, 200)
    playEffect(eventPlayer, DynamicEffect.SOMBRA_TRANSLOCATING_SOUND, Color.WHITE, eventPlayer, 100)
    if eventPlayer.eventEffect == null:
        createEffect(eventPlayer, Effect.SPARKLES, Color.YELLOW, eventPlayer.controlPlayerRespawnPosition[0], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.eventEffect = getLastCreatedEntity()
    wait(EVT_13_CHECKPOINT_INTERVAL)
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
    wait(EVT_13_RESPAWN_DELAY)
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
    eventPlayer.addHealthPool(Health.SHIELDS, eventPlayer.target.getMaxHealth() * EVT_14_SHIELD_PERCENT if eventPlayer.target.getMaxHealth() * EVT_14_SHIELD_PERCENT > EVT_14_MIN_SHIELD else EVT_14_MIN_SHIELD, true, false)
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
    
    wait(EVT_16_CHECK_INTERVAL)
    eventPlayer.eventEffectPlayers = [player for player in getLivingPlayers(Team.1) if distance(eventPlayer, player) <= EVT_16_RADIUS and isInLoS(eventPlayer, player) == true and not player.hasStatus(Status.INVINCIBLE)]
    eventPlayer.eventEffectPlayers.invincible = [true, eventPlayer, EVT_16_INVINCIBLE_DURATION]
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
    smallMessage(eventPlayer, "  {0}  {1}（{2}） 为你提供 {3}秒无敌效果".format(abilityIconString(Hero.BAPTISTE, Button.ABILITY_2), eventPlayer.invincible[1], eventPlayer.invincible[1].getHero(), EVT_16_INVINCIBLE_DURATION))
    wait(EVT_16_INVINCIBLE_DURATION)
    eventPlayer.clearStatusEffect(Status.INVINCIBLE)
    destroyEffect(eventPlayer.invincibleEffect)
    eventPlayer.invincibleEffect = null
    eventPlayer.invincible = null


rule "[VishkarEvent]: 我独自闯关":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 17]) == true
    
    wait(0.05)
    if len([player for player in getPlayersInRadius(eventPlayer, EVT_17_CHECK_RADIUS, Team.1, LosCheck.SURFACES) if player != eventPlayer]) > 0:
        eventPlayer.mod_dmg_taken = EVT_17_MODE1_DMG_TAKEN
        eventPlayer.mod_heal_event = EVT_17_MODE1_HEAL_BOOST
        eventPlayer.mod_speed_event = EVT_17_MODE1_SPEED
        eventPlayer.setKnockbackReceived(EVT_17_MODE1_KNOCKBACK)
        smallMessage(eventPlayer, "  {0}  已获得 {1}% 伤害减免".format(iconString(Icon.DIAMOND), EVT_17_MODE1_DMG_TAKEN * -1))
        smallMessage(eventPlayer, "  {0}  已获得 {1}% 治疗增益".format(iconString(Icon.DIAMOND), EVT_17_MODE1_HEAL_BOOST))
        smallMessage(eventPlayer, "  {0}  已获得 {1}% 移速加成".format(iconString(Icon.DIAMOND), EVT_17_MODE1_SPEED))
        smallMessage(eventPlayer, "  {0}  已获得 {1}% 击退抵抗".format(iconString(Icon.DIAMOND), 100 - EVT_17_MODE1_KNOCKBACK))
    else:
        bigMessage(eventPlayer, "我独自闯关！")
        eventPlayer.mod_dmg_taken = EVT_17_MODE2_DMG_TAKEN
        eventPlayer.mod_heal_event = EVT_17_MODE2_HEAL_BOOST
        eventPlayer.mod_speed_event = EVT_17_MODE2_SPEED
        eventPlayer.setKnockbackReceived(EVT_17_MODE2_KNOCKBACK)
        smallMessage(eventPlayer, "  {0}  已获得 {1}% 伤害减免".format(iconString(Icon.DIAMOND), EVT_17_MODE2_DMG_TAKEN * -1))
        smallMessage(eventPlayer, "  {0}  已获得 {1}% 治疗增益".format(iconString(Icon.DIAMOND), EVT_17_MODE2_HEAL_BOOST))
        smallMessage(eventPlayer, "  {0}  已获得 {1}% 移速加成".format(iconString(Icon.DIAMOND), EVT_17_MODE2_SPEED))
        smallMessage(eventPlayer, "  {0}  已获得 {1}% 击退抵抗".format(iconString(Icon.DIAMOND), 100 - EVT_17_MODE2_KNOCKBACK))
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
    
    eventPlayer.knockback = EVT_18_KNOCKBACK_RESISTANCE
    updatePlayerStats()
    wait(eventPlayer.eventDuration)
    eventPlayer.knockback = 0
    updatePlayerStats()


rule "[VishkarEvent]: 坚定":
    @Event playerReceivedKnockback
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 18]) == true
    
    if eventPlayer.mod_dmg_taken == EVT_18_MAX_DMG_REDUCE:
        goto lbl_0
    eventPlayer.mod_dmg_taken -= EVT_18_DMG_REDUCE_PER_STACK
    eventPlayer.hudText = "伤害减免：{0}%".format(eventPlayer.mod_dmg_taken * -1)
    updatePlayerStats()
    lbl_0:
    heal(eventPlayer, eventPlayer, eventPlayer.getMaxHealth() * EVT_18_HEAL_PERCENT)


rule "[VishkarEvent]: 胜利意志":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 19, eventPlayer.getHealth() <= eventPlayer.getMaxHealth() * EVT_19_TRIGGER_HP_PERCENT]) == true
    
    waitUntil(eventPlayer.isAlive(), MAX_TIME)
    eventPlayer.setStatusEffect(eventPlayer, Status.PHASED_OUT, 0.016)
    wait()
    eventPlayer.clearStatusEffect(Status.INVINCIBLE)
    destroyEffect(eventPlayer.invincibleEffect)
    wait()
    if not eventPlayer.isAlive():
        return
    eventPlayer.setStatusEffect(eventPlayer, Status.INVINCIBLE, EVT_19_INVINCIBLE_DURATION)
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
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 20, eventPlayer.getSpeed() != 0, eventPlayer.eventMission <= EVT_20_DISTANCE_GOAL]) == true
    
    wait(EVT_20_DISTANCE_INC, Wait.ABORT_WHEN_FALSE)
    eventPlayer.eventMission += 0.5
    eventPlayer.hudText = "{0}/{1}".format(eventPlayer.eventMission, EVT_20_DISTANCE_GOAL)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 任务：菲迪皮德斯之力":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 20]) == true
    
    waitUntil(eventPlayer.eventMission >= EVT_20_DISTANCE_GOAL or eventPlayer.eventId == null, eventPlayer.eventDuration + 1.5)
    wait()
    if eventPlayer.eventMission >= EVT_20_DISTANCE_GOAL:
        bigMessage(eventPlayer, "任务：菲迪皮德斯之力 成功！")
        smallMessage(eventPlayer, "  {0}  任务奖励：永久获得 {1}% 移动速度加成".format(abilityIconString(Hero.SOLDIER, Button.ABILITY_1), EVT_20_REWARD_SPEED))
        eventPlayer.mod_speed_perma += EVT_20_REWARD_SPEED
        updatePlayerStats()
    else:
        bigMessage(eventPlayer, "任务：菲迪皮德斯之力 失败")
    eventPlayer.eventMission = 0
    eventPlayer.eventDuration = 0


rule "[VishkarEvent]: 心之钢 Pro":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 21]) == true
    
    eventPlayer.heart_steel += EVT_21_HP_GAIN_FLAT
    smallMessage(eventPlayer, "  {0}  已获得 {1} 层（{2}%）心之钢".format(abilityIconString(Hero.MAUGA, Button.ABILITY_2), EVT_21_HP_GAIN_FLAT, EVT_21_HP_GAIN_FLAT * EVT_8_HP_PERCENT_PER_STACK))
    if eventPlayer.heart_steel > 0:
        eventPlayer.setMaxHealth(100 + eventPlayer.heart_steel * EVT_21_HP_MULTIPLIER)
        wait(eventPlayer.eventDuration)
        setPlayerHP()
    else:
        eventPlayer.eventDuration = 0


rule "[VishkarEvent]: 数值之力":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 22]) == true
    
    eventPlayer.mod_heal_event = EVT_22_HEAL_BOOST
    eventPlayer.heal_recv = EVT_22_HEAL_BOOST
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
    eventPlayer.setUltCharge(eventPlayer.getUltCharge() + EVT_23_ULT_CHARGE_PER_SEC)
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
    if eventPlayer.nanoEffect != null:
        goto lbl_0

    createEffect(getAllPlayers(), Effect.ANA_NANO_BOOSTED, Color.TEAM_2, eventPlayer, 200, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.nanoEffect = getLastCreatedEntity()
    lbl_0:
    eventPlayer.mod_dmg_taken = EVT_23_DMG_REDUCTION_DURING_ULT
    updatePlayerStats()
    waitUntil(not eventPlayer.isUsingUltimate(), eventPlayer.eventDuration)
    destroyEffect(eventPlayer.nanoEffect)
    eventPlayer.mod_dmg_taken = 0
    updatePlayerStats()


rule "[VishkarEvent]: 重力异常":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 0]) == true
    
    wait(getAverageServerLoad() / 100 * 0.032)
    eventPlayer.mod_speed_event = EVT_DEBUFF_0_SPEED
    updatePlayerStats()
    eventPlayer.setGravity(100 + EVT_DEBUFF_0_GRAVITY)
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
    eventPlayer.setStatusEffect(getPlayersOnHero(Hero.BASTION, Team.2)[0], Status.HACKED, EVT_DEBUFF_1_HACK_DURATION)
    playEffect(getAllPlayers(), DynamicEffect.SOMBRA_HACKED_STARTING, Color.TEAM_2, eventPlayer, 200)
    eventPlayer.hack_timer = EVT_DEBUFF_1_HACK_DURATION
    chaseAtRate(eventPlayer.hack_timer, 0, 1, ChaseRateReeval.NONE)


rule "[VishkarEvent]: 献祭":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 2]) == true
    @Condition any([[player for player in getLivingPlayers(Team.1) if player.isUsingAbility1()] > 0, [player for player in getLivingPlayers(Team.1) if player.isUsingAbility2()] > 0]) == true
    
    stopCombatRegen()
    playEffect(getAllPlayers(), DynamicEffect.MOIRA_FADE_REAPPEAR, Color.TEAM_2, eventPlayer, 200)
    damage(eventPlayer, (sorted([player for player in getLivingPlayers(Team.1) if player.isUsingAbility1() or player.isUsingAbility2()], lambda i: distance(eventPlayer, i)))[0], eventPlayer.getMaxHealth() * EVT_DEBUFF_2_DMG_PERCENT)
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
    eventPlayer.mod_dmg_taken = EVT_DEBUFF_3_DMG_TAKEN
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
    wait(EVT_DEBUFF_4_CHECK_INTERVAL, Wait.ABORT_WHEN_FALSE)
    if eventPlayer.hasStatus(Status.BURNING):
        goto lbl_0
    eventPlayer.setStatusEffect(null, Status.BURNING, EVT_DEBUFF_4_BURN_DURATION)
    lbl_0:
    eventPlayer.startDamageOverTime(null, EVT_DEBUFF_4_CHECK_INTERVAL, EVT_DEBUFF_4_DMG_BASE + round(eventPlayer.getMaxHealth() * EVT_DEBUFF_4_DMG_PERCENT))
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
    eventPlayer.mod_speed_event -= EVT_DEBUFF_5_SPEED_REDUCTION
    updatePlayerStats()
    lbl_0:
    if eventPlayer.eventEffect != null:
        goto lbl_1
    createEffect(getAllPlayers(), Effect.SIGMA_GRAVITIC_FLUX_TARGET, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect[0] = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.SIGMA_GRAVITIC_FLUX_TARGET_SOUND, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect[1] = getLastCreatedEntity()
    lbl_1:
    eventPlayer.applyImpulse(directionTowards(eventPlayer, sorted(getPlayers(Team.2), lambda player: distance(eventPlayer, player))[0]), EVT_DEBUFF_5_PULL_AIR if eventPlayer.isInAir() else EVT_DEBUFF_5_PULL_GROUND, Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)
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
    eventPlayer.hudText = ""


rule "[VishkarEvent]: 骨质疏松":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 6]) == true
    
    while eventPlayer.mod_speed_event != EVT_DEBUFF_6_MAX_SPEED_DEC:
        eventPlayer.mod_speed_event -= EVT_DEBUFF_6_SPEED_DEC_PER_SEC
        eventPlayer.hudText = "移速{0}%".format(eventPlayer.mod_speed_event)
        updatePlayerStats()
        wait(1)
    updatePlayerStats()


rule "[VishkarEvent]: 电磁脉冲 ProMax":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 7]) == true
    
    ([player for player in getPlayers(Team.1) if distance(eventPlayer, player) <= EVT_DEBUFF_7_RADIUS]).empProMax = eventPlayer
    playEffect(getAllPlayers(), DynamicEffect.SOMBRA_EMP_EXPLOSION_EFFECT, Color.TEAM_2, eventPlayer, 200)
    wait(eventPlayer.eventDuration - 1)
    getPlayers(Team.1).empProMax = null


rule "[VishkarEvent]: 电磁脉冲 ProMax":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.hasStatus(Status.HACKED) != true, eventPlayer.empProMax != null, eventPlayer.hack_timer == 0]) == true
    
    stopChasingVariable(eventPlayer.hack_timer)
    eventPlayer.hack_timer = max(0, EVT_DEBUFF_7_HACK_BASE_DURATION if eventPlayer.empProMax == eventPlayer else EVT_DEBUFF_7_HACK_BASE_DURATION - distance(eventPlayer, eventPlayer.empProMax) * EVT_DEBUFF_7_DIST_FACTOR)
    if eventPlayer.hack_timer <= EVT_DEBUFF_7_MIN_HACK_THRESHOLD:
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
    damage(eventPlayer, null, eventPlayer.getMaxHealth() * EVT_DEBUFF_8_DMG_PERCENT)
    wait(EVT_DEBUFF_8_COOLDOWN)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 生命在于静止":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.isAlive(), eventPlayer.eventType == 1, eventPlayer.eventId == 9]) == true
    
    stopCombatRegen()
    wait()
    damage(eventPlayer, null, ceil(eventPlayer.getMaxHealth() * (EVT_DEBUFF_9_DMG_MOVING if eventPlayer.isMoving() else EVT_DEBUFF_9_DMG_STILL)))
    eventPlayer.setStatusEffect(null, Status.BURNING, EVT_DEBUFF_9_BURN_DURATION)
    wait(EVT_DEBUFF_9_TICK_RATE)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 有难同当 Effect":
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
    damage([player for player in getLivingPlayers(Team.1) if not player.hasStatus(Status.PHASED_OUT) and not player.hasStatus(Status.INVINCIBLE) and distance(eventPlayer, player) <= EVT_DEBUFF_10_RADIUS and eventPlayer != player], attacker, eventDamage * EVT_DEBUFF_10_DMG_FACTOR)
    wait()


rule "[VishkarEvent]: 狂欢盛宴":
    @Event playerDied
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 11, attacker.getHero() == Hero.BASTION]) == true
    
    bigMessage(getAllPlayers(), "盛宴！")
    smallMessage(getPlayers(Team.1), "  {0} {1} 阵亡触发了狂欢盛宴".format(iconString(Icon.WARNING), eventPlayer))
    getPlayers(Team.2).hasNano = true
    berserkerTime += EVT_DEBUFF_11_BERSERK_ADD
    wait(EVT_DEBUFF_11_COOLDOWN)


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
    
    ([player for player in getLivingPlayers(Team.1) if distance(eventPlayer, player) <= EVT_DEBUFF_12_RADIUS and eventPlayer != player]).setStatusEffect(null, Status.KNOCKED_DOWN, EVT_DEBUFF_12_KNOCKDOWN_DURATION)
    wait(2)


rule "[VishkarEvent]: 重伤":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 13]) == true
    
    eventPlayer.mod_heal_event = EVT_DEBUFF_13_HEAL_DEALT_RED
    eventPlayer.heal_recv = EVT_DEBUFF_13_HEAL_RECV_RED
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
    if eventPlayer.getHealth() <= eventPlayer.getMaxHealth() * EVT_DEBUFF_14_EXECUTE_THRESHOLD:
        kill(eventPlayer, eventPlayer)
        playEffect(getAllPlayers(), DynamicEffect.DVA_SELF_DESTRUCT_EXPLOSION, Color.TEAM_2, eventPlayer, 200)
    else:
        wait(EVT_DEBUFF_14_INTERVAL)
        eventPlayer.startDamageOverTime(null, 1, eventPlayer.getHealth() * EVT_DEBUFF_14_DAMAGE_PERCENT)
        playEffect(getAllPlayers(), DynamicEffect.ZARYA_PARTICLE_CANNON_EXPLOSION, Color.TEAM_2, eventPlayer, 3)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 舍己为人":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 15]) == true
    
    if eventPlayer.getMaxHealth() <= EVT_DEBUFF_15_MIN_MAX_HP:
        eventPlayer.eventDuration = 0
    else:
        getPlayers(Team.1).exclude(eventPlayer).heart_steel += EVT_DEBUFF_15_STACKS_GIVE
        getPlayers(Team.1).exclude(eventPlayer).setPlayerHP = true
        eventPlayer.heart_steel -= EVT_DEBUFF_15_STACKS_TAKE * len(getPlayers(Team.1).exclude(eventPlayer))
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
    eventPlayer.mod_heal_event = EVT_MECH_0_HEAL_BAN
    eventPlayer.heal_recv = EVT_MECH_0_HEAL_BAN
    createEffect(getAllPlayers(), Effect.ANA_BIOTIC_GRENADE_NO_HEALING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    playEffect(eventPlayer, DynamicEffect.ANA_BIOTIC_GRENAGE_NO_HEALING_SOUND, Color.WHITE, eventPlayer, 200)
    eventPlayer.setHealth(eventPlayer.getMaxHealth() * EVT_MECH_0_HP_PERCENT)
    eventPlayer.mod_dmg_taken = EVT_MECH_0_DMG_TAKEN
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
    @Condition eventPlayer.getHealth() > eventPlayer.getMaxHealth() * EVT_MECH_0_HP_PERCENT == true
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setHealth(eventPlayer.getMaxHealth() * EVT_MECH_0_HP_PERCENT)
    wait(5)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 纳米战甲":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 1]) == true
    
    wait()
    waitUntil(eventPlayer.isAlive(), eventPlayer.eventDuration)
    eventPlayer.addHealthPool(Health.NORMAL, eventPlayer.getMaxHealth() * EVT_MECH_1_HP_MULTIPLIER, false, false)
    eventPlayer.healthId[0] = getLastCreatedHealthPool()
    eventPlayer.mod_speed_event = EVT_MECH_1_SPEED_PENALTY
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
    if random.randint(0, 100) <= EVT_MECH_2_WIN_RATE:
        eventPlayer.heart_steel -= EVT_MECH_2_STAKE
        eventPlayer.dlcTimeChallenge[0] = 0 if eventPlayer.dlcTimeChallenge[0] > 0 else eventPlayer.dlcTimeChallenge[0] - 1
        smallMessage(eventPlayer, "  {0}  输！失去 {1} 层心之钢层数（{2}%）".format(iconString(Icon.DIAMOND), EVT_MECH_2_STAKE, EVT_MECH_2_STAKE * EVT_8_HP_PERCENT_PER_STACK))
        if [36, 37] in eventPlayer.earnedAchievements and 40 not in eventPlayer.earnedAchievements:
            eventPlayer.dlcTimeChallenge[2]++
    else:
        eventPlayer.heart_steel += EVT_MECH_2_STAKE
        eventPlayer.dlcTimeChallenge[0]++
        smallMessage(eventPlayer, "  {0}  赢！获得 {1} 层心之钢层数（{2}%）".format(iconString(Icon.CLUB), EVT_MECH_2_STAKE, EVT_MECH_2_STAKE * EVT_8_HP_PERCENT_PER_STACK))
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
    createEffect([player for player in getPlayers(Team.1) if not player.ignoreObstrucVis], Effect.CLOUD, random.choice([Color.YELLOW, Color.GREEN, Color.ORANGE, Color.LIME_GREEN, Color.VIOLET]), evalOnce(eventPlayer.getPosition()), EVT_MECH_3_CLOUD_RADIUS, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    wait()
    eventPlayer.obstrucVis.append(getLastCreatedEntity())
    wait(EVT_MECH_3_SPAWN_INTERVAL)
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
    eventPlayer.sizeHealth = EVT_MECH_4_HP_SCALE
    eventPlayer.startScalingSize(EVT_MECH_4_MODEL_SCALE, false)
    eventPlayer.startScalingBarriers(EVT_MECH_4_MODEL_SCALE, false)
    eventPlayer.startModifyingVoicelinePitch(EVT_MECH_4_VOICE_PITCH, false)
    eventPlayer.mod_dmg_taken = EVT_MECH_4_DMG_TAKEN
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
    eventPlayer.sizeHealth = EVT_MECH_5_HP_SCALE
    eventPlayer.startScalingSize(EVT_MECH_5_MODEL_SCALE, false)
    eventPlayer.startScalingBarriers(EVT_MECH_5_MODEL_SCALE, false)
    eventPlayer.startModifyingVoicelinePitch(EVT_MECH_5_VOICE_PITCH, false)
    eventPlayer.mod_speed_event = EVT_MECH_5_SPEED_BOOST
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
    eventPlayer.mod_speed_event -= EVT_MECH_6_SPEED_PENALTY
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
    eventPlayer.mod_speed_event += EVT_MECH_7_SPEED_BOOST
    updatePlayerStats()
    createEffect(getAllPlayers(), Effect.SOLDIER_SPRINTING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    wait(EVT_MECH_7_DURATION)
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
    eventPlayer.mod_speed_event += EVT_MECH_8_SPEED_BOOST
    eventPlayer.mod_dmg_taken = EVT_MECH_8_DMG_TAKEN
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
    eventPlayer.hudText = ""


rule "[VishkarEvent]: 刹车失灵":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 9]) == true
    
    while eventPlayer.mod_speed_event < EVT_MECH_9_MAX_SPEED:
        eventPlayer.mod_speed_event += 5
        if eventPlayer.mod_dmg_taken == EVT_MECH_9_MAX_DMG_TAKEN:
            goto lbl_0
        eventPlayer.mod_dmg_taken -= EVT_MECH_9_DMG_TAKEN_INC
        lbl_0:
        eventPlayer.hudText = "移速+{0}% / 伤害减免 {1}%".format(eventPlayer.mod_speed_event, eventPlayer.mod_dmg_taken * -1)
        updatePlayerStats()
        wait(EVT_MECH_9_INTERVAL)


rule "[VishkarEvent]: 冲锋激励":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 10, eventPlayer.isMoving(), eventPlayer.getSpeed() != 0, eventPlayer.healthId[1] == null]) == true
    
    eventPlayer.hudText = "{0}/{1}".format(eventPlayer.eventMission, EVT_MECH_10_MISSION_GOAL)
    wait(EVT_MECH_10_CHECK_INTERVAL, Wait.ABORT_WHEN_FALSE)
    if eventPlayer.eventMission >= EVT_MECH_10_MISSION_GOAL:
        eventPlayer.hudText = "{0}/{1}".format(EVT_MECH_10_MISSION_GOAL, EVT_MECH_10_MISSION_GOAL)
        goto lbl_1
    eventPlayer.eventMission += EVT_MECH_10_MISSION_INC
    eventPlayer.hudText = "{0}/{1}".format(eventPlayer.eventMission, EVT_MECH_10_MISSION_GOAL)
    wait()
    lbl_1:
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 冲锋激励":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 10, eventPlayer.eventMission == EVT_MECH_10_MISSION_GOAL]) == true
    
    if eventPlayer.healthId[1] == null:
        goto lbl_0
    removeHealthPool(eventPlayer.healthId[1])
    lbl_0:
    eventPlayer.addHealthPool(Health.ARMOR, eventPlayer.eventMission, false, false)
    eventPlayer.healthId[1] = getLastCreatedHealthPool()
    eventPlayer.eventMission = 0
    wait(EVT_MECH_10_REWARD_DURATION)
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
    wait(EVT_MECH_11_INTERVAL)
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
    eventPlayer.mod_dmg_taken = EVT_MECH_12_DMG_TAKEN
    updatePlayerStats()
    createEffect(getAllPlayers(), Effect.ANA_NANO_BOOSTED, Color.TEAM_2, eventPlayer, 200, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.nanoEffect = getLastCreatedEntity()
    lbl_0:
    eventPlayer.applyImpulse(eventPlayer.getFacingDirection(), EVT_MECH_12_IMPULSE, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
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
    eventPlayer.setHealth(eventPlayer.getMaxHealth() * EVT_MECH_13_HP_PENALTY)
    eventPlayer.categoryRoll = random.uniform(0, 100)
    if eventPlayer.categoryRoll <= EVT_MECH_13_PROB_WIN_NORMAL:
        eventPlayer.mod_speed_perma += EVT_MECH_13_VAL_NORMAL
        eventPlayer.dlcTimeChallenge[0]++
        smallMessage(eventPlayer, "  {0}  赢！永久获得 {1}% 移动速度加成".format(iconString(Icon.CLUB), EVT_MECH_13_VAL_NORMAL))
    elif eventPlayer.categoryRoll <= EVT_MECH_13_PROB_LOSE_NORMAL:
        eventPlayer.mod_speed_perma -= EVT_MECH_13_VAL_NORMAL
        eventPlayer.dlcTimeChallenge[0] = 0 if eventPlayer.dlcTimeChallenge[0] > 0 else eventPlayer.dlcTimeChallenge[0] - 1
        smallMessage(eventPlayer, "  {0}  输！永久失去 {1}% 移动速度加成".format(iconString(Icon.DIAMOND), EVT_MECH_13_VAL_NORMAL))
        if [36, 37] in eventPlayer.earnedAchievements and 40 not in eventPlayer.earnedAchievements:
            eventPlayer.dlcTimeChallenge[2]++
    elif eventPlayer.categoryRoll <= EVT_MECH_13_PROB_WIN_RARE:
        eventPlayer.mod_speed_perma += EVT_MECH_13_VAL_RARE
        eventPlayer.dlcTimeChallenge[0]++
        smallMessage(eventPlayer, "  {0}  赢！永久获得 {1}% 移动速度加成".format(iconString(Icon.CLUB), EVT_MECH_13_VAL_RARE))
    else:
        eventPlayer.mod_speed_perma -= EVT_MECH_13_VAL_RARE
        eventPlayer.dlcTimeChallenge[0] = 0 if eventPlayer.dlcTimeChallenge[0] > 0 else eventPlayer.dlcTimeChallenge[0] - 1
        smallMessage(eventPlayer, "  {0}  输！永久失去 {1}% 移动速度加成".format(iconString(Icon.DIAMOND), EVT_MECH_13_VAL_RARE))
        if [36, 37] in eventPlayer.earnedAchievements and 40 not in eventPlayer.earnedAchievements:
            eventPlayer.dlcTimeChallenge[2]++
    eventPlayer.categoryRoll = 0
    updatePlayerStats()
    eventPlayer.eventDuration = 0


rule "[VishkarEvent]: 4.0":
    @Disabled
    @Delimiter
    

rule "[VishkarEvent]: 相位猛冲 (智能检测版)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 24, eventPlayer.phase_trigger == true, eventPlayer.mod_speed_event == 0]) == true
    
    createEffect(getAllPlayers(), Effect.SOLDIER_SPRINTING, Color.TEAM_1, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.eventEffect = getLastCreatedEntity()
    eventPlayer.mod_speed_event += EVT_24_SPEED_BOOST
    updatePlayerStats()
    wait(EVT_24_DURATION)
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()
    clearEventEffect()
    wait(0.5)

rule "[VishkarEvent]: 保镖 (Bodyguard)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 26, eventPlayer.phase_trigger == true]) == true
    
    eventPlayer.target = getPlayersInRadius(eventPlayer, EVT_26_ALLY_RADIUS, Team.1, LosCheck.SURFACES).exclude(eventPlayer)
    eventPlayer.addHealthPool(EVT_26_HEALTH_TYPE, round(EVT_26_ARMOR_FLAT + eventPlayer.getMaxHealth() * EVT_26_ARMOR_MAXHP_FACTOR), false, false)
    eventPlayer.hp_data.append([[getTotalTimeElapsed() + EVT_26_ARMOR_DURATION, getLastCreatedHealthPool()]])
    playEffect(getAllPlayers(), DynamicEffect.BRIGITTE_REPAIR_PACK_ARMOR, Color.WHITE, eventPlayer, EVT_26_VFX_RADIUS)
    wait()
    if len(eventPlayer.target) > 0:
        playEffect(getAllPlayers(), DynamicEffect.BRIGITTE_REPAIR_PACK_ARMOR, Color.WHITE, eventPlayer.target[0], EVT_26_VFX_RADIUS)
        eventPlayer.target[0].addHealthPool(EVT_26_HEALTH_TYPE, round(EVT_26_ARMOR_FLAT + eventPlayer.getMaxHealth() * EVT_26_ARMOR_MAXHP_FACTOR), false, false)
        eventPlayer.target[0].hp_data.append([[getTotalTimeElapsed() + EVT_26_ARMOR_DURATION, getLastCreatedHealthPool()]])
    wait(EVT_26_POST_WAIT)

#!define MARTYR_GOAL_MAX max(EVT_27_GOAL_MIN, round(len(bastionPosition) * EVT_27_GOAL_MAX_FACTOR))

rule "[VishkarEvent]: 任务：殉道者 (初始化)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 27]) == true
    
    eventPlayer.eventMissionGoal = max(
        EVT_27_GOAL_MIN,
        min(
            round(
                EVT_27_GOAL_MIN
                + ((random.uniform(0, 1) + random.uniform(0, 1)) / 2)
                * (MARTYR_GOAL_MAX - EVT_27_GOAL_MIN)
            ),
            MARTYR_GOAL_MAX
        )
    )

    eventPlayer.hudText = "{0}/{1}".format(
        len(eventPlayer.eventMission),
        eventPlayer.eventMissionGoal
    )
    wait(eventPlayer.eventDuration)

rule "[VishkarEvent]: 任务：殉道者 (进度检测)":
    @Event playerDied
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 27]) == true
    @Condition attacker.getTeam() == Team.2
    @Condition (not attacker in eventPlayer.eventMission) == true
    
    eventPlayer.eventMission.append(attacker)
    eventPlayer.hudText = "{0}/{1}".format(
        len(eventPlayer.eventMission),
        eventPlayer.eventMissionGoal
    )
    if len(eventPlayer.eventMission) == eventPlayer.eventMissionGoal:
        waitUntil(eventPlayer.isAlive(), EVT_27_WAITUNTIL_TIMEOUT)
        bigMessage(eventPlayer, "任务：殉道者 完成！")
        smallMessage(eventPlayer, "  {0}  任务奖励：永久获得 {1}% 伤害减免".format(abilityIconString(Hero.HAZARD, Button.SECONDARY_FIRE), 5))
        eventPlayer.mod_dmg_perma += EVT_27_REWARD_DMG_PERMA
        updatePlayerStats()

        
rule "[VishkarEvent]: 多动症 (触发回血)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 28, eventPlayer.phase_trigger == true]) == true
    
    if eventPlayer.getAbilityCooldown(Button.ABILITY_1) > EVT_28_CD_THRESHOLD:
        eventPlayer.setAbilityCooldown(Button.ABILITY_1, eventPlayer.getAbilityCooldown(Button.ABILITY_1) * 0.5)
    if eventPlayer.getAbilityCooldown(Button.ABILITY_2) > EVT_28_CD_THRESHOLD:
        eventPlayer.setAbilityCooldown(Button.ABILITY_2, eventPlayer.getAbilityCooldown(Button.ABILITY_2) * 0.5)
    eventPlayer.startHealingOverTime(eventPlayer, 2, (round(50 + eventPlayer.getMaxHealth() * EVT_28_HOT_MAXHP_FACTOR)) / EVT_28_HOT_DIVISOR)
    wait(EVT_28_POST_WAIT)

rule "[VishkarEvent]: 鼓舞士气 ProMax - 触发器":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 30]) == true
    
    playEffect(getAllPlayers(), DynamicEffect.BRIGITTE_WHIP_SHOT_HEAL_AREA, Color.TEAM_1, eventPlayer, 200)
    getPlayersInRadius(eventPlayer, EVT_30_HEAL_RADIUS, Team.1, LosCheck.SURFACES).startHealingOverTime(eventPlayer, EVT_30_HOT_DURATION, EVT_30_HOT_FLAT + eventPlayer.getMaxHealth() * EVT_30_HOT_MAXHP_FACTOR)
    wait(EVT_30_TICK_INTERVAL)
    if ruleCondition:
        loop()
    clearEventEffect()


rule "[VishkarEvent]: 成吨的增益 (初始化与属性)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 31]) == true
    
    eventPlayer.mod_speed_event += EVT_31_SPEED_DELTA
    eventPlayer.mod_dmg_taken -= EVT_31_DMG_TAKEN_DELTA
    eventPlayer.mod_heal_event += EVT_31_HEAL_DEALT_DELTA
    eventPlayer.heal_recv += EVT_31_HEAL_RECV_DELTA
    updatePlayerStats()
    eventPlayer.sizeHealth = EVT_31_SIZE_HEALTH_SCALE
    setPlayerHP()
    wait(eventPlayer.eventDuration)
    eventPlayer.mod_speed_event -= EVT_31_SPEED_DELTA
    eventPlayer.mod_dmg_taken -= EVT_31_DMG_TAKEN_DELTA
    eventPlayer.mod_heal_event -= EVT_31_HEAL_DEALT_DELTA
    eventPlayer.heal_recv -= EVT_31_HEAL_RECV_DELTA
    updatePlayerStats()
    eventPlayer.sizeHealth = 1
    setPlayerHP()
    clearEventEffect()

rule "[VishkarEvent]: F5 (循环刷新)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 32]) == true
    
    resetPlayerCD()
    wait(EVT_32_REFRESH_INTERVAL)
    if ruleCondition:
        loop()


rule "[VishkarEvent]: 治疗光塔 ProMax (全图奶)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 0, eventPlayer.eventId == 33]) == true
    
    if eventPlayer.getNormalizedHealth() == 1:
        goto lbl_0
        smallMessage(getPlayers(Team.1).exclude(eventPlayer), "  {0}  受到来自 {1}（{2}） 治疗光塔 ProMax 的治疗效果".format(abilityIconString(Hero.ILLARI, Button.ABILITY_2), eventPlayer, eventPlayer.getHero()))
    lbl_0:
    getPlayers(Team.1).startHealingOverTime(eventPlayer, EVT_33_HOT_DURATION, round(EVT_33_HEAL_FLAT + eventPlayer.getMaxHealth() * EVT_33_HEAL_MAXHP_FACTOR))
    wait(EVT_33_HOT_DURATION)
    if ruleCondition:
        loop()
    clearEventEffect()


rule "[VishkarEvent]: 保持距离 (易伤光环)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 16]) == true
    
    eventPlayer.target = sorted(getPlayersInRadius(eventPlayer, EVT_DEBUFF_16_RADIUS, Team.1, LosCheck.SURFACES).exclude(eventPlayer), lambda i: distance(eventPlayer, i))[0]
    if eventPlayer.target != null:
        eventPlayer.mod_dmg_taken = min(EVT_DEBUFF_16_MAX, max(0, (EVT_DEBUFF_16_RADIUS - distance(eventPlayer, eventPlayer.target)) * EVT_DEBUFF_16_FACTOR))
        eventPlayer.hudText = "受到伤害 +{0}%".format(eventPlayer.mod_dmg_taken)
    else:
        eventPlayer.mod_dmg_taken = 0
        eventPlayer.hudText = ""
    updatePlayerStats()
    wait(1)
    if ruleCondition:
        loop()
    eventPlayer.mod_dmg_taken = 0
    eventPlayer.hudText = ""
    updatePlayerStats()
    clearEventEffect()


rule "[VishkarEvent]: 404 (随机禁用技能)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 17]) == true
    
    if eventPlayer.getHero() != Hero.LIFEWEAVER or eventPlayer.getHero() != Hero.TORBJORN or eventPlayer.getHero() != Hero.SYMMETRA:
        goto lbl_0
    eventPlayer.eventMission = 0
    eventPlayer.eventDuration = 0
    clearEventEffect()
        
    lbl_0:
    eventPlayer.eventMission = random.randint(1, 3)
    wait()

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
    waitUntil(eventPlayer.eventId == -1, eventPlayer.eventDuration)
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
    wait(eventPlayer.eventDuration)
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


rule "[VishkarEvent]: 吸血鬼 (按需吸血)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 1, eventPlayer.eventId == 20, eventPlayer.getNormalizedHealth() != 1]) == true
    
    stopCombatRegen()
    eventPlayer.target = [i for i in getPlayersInRadius(eventPlayer, EVT_DEBUFF_20_RADIUS, Team.1, LosCheck.SURFACES).exclude(eventPlayer) if i.isAlive()]
    if len(eventPlayer.target) > 0:
        damage(eventPlayer.target, eventPlayer, EVT_DEBUFF_20_DAMAGE_PER_TARGET)
        heal(eventPlayer, eventPlayer.target, len(eventPlayer.target) * EVT_DEBUFF_20_HEAL_PER_TARGET)
        eventPlayer.dlcTimeChallenge[4] += len(eventPlayer.target) * EVT_DEBUFF_20_DAMAGE_PER_TARGET
        playEffect(getAllPlayers(), DynamicEffect.MOIRA_FADE_REAPPEAR, Color.RED, eventPlayer.target, 200)
    wait(EVT_DEBUFF_20_INTERVAL)
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
    # createEffect(getAllPlayers(), Effect.ZENYATTA_ORB_OF_DISCORD_TARGET, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    # eventPlayer.eventEffect.append(getLastCreatedEntity())
    # createEffect(getAllPlayers(), Effect.ZENYATTA_ORB_OF_DISCORD_TARGET_SOUND, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    # eventPlayer.eventEffect.append(getLastCreatedEntity())
    # createEffect(getAllPlayers(), Effect.ANA_BIOTIC_GRENADE_NO_HEALING, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    # eventPlayer.eventEffect.append(getLastCreatedEntity())
    playEffect(eventPlayer, DynamicEffect.ANA_BIOTIC_GRENAGE_NO_HEALING_SOUND, Color.WHITE, eventPlayer, 200)
    # createEffect(getAllPlayers(), Effect.SIGMA_GRAVITIC_FLUX_TARGET, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    # eventPlayer.eventEffect.append(getLastCreatedEntity())
    # createEffect(getAllPlayers(), Effect.SIGMA_GRAVITIC_FLUX_TARGET_SOUND, Color.TEAM_2, eventPlayer, 200, EffectReeval.POSITION_AND_RADIUS)
    # eventPlayer.eventEffect.append(getLastCreatedEntity())
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
    eventPlayer.heart_steel -= EVT_MECH_14_HEART_STEEL_COST
    setPlayerHP()
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.TEAM_1, eventPlayer, 100)
    eventPlayer.eventForceRoll = EVT_MECH_14_FORCE_ROLL
    smallMessage(eventPlayer, "  {0}  已扣除 {1} 层心之钢（{2}% 最大生命值）".format(abilityIconString(Hero.MAUGA, Button.ABILITY_2), EVT_MECH_14_HEART_STEEL_COST, EVT_MECH_14_HEART_STEEL_COST * EVT_8_HP_PERCENT_PER_STACK))
    wait(0.2)
    smallMessage(eventPlayer, "  {0}  下一个事件必然是增益，祝你好运".format(iconString(Icon.CLUB)))
    eventPlayer.eventDuration = 0
    if eventPlayer.eventId not in eventPlayer.dlcTimeChallenge[5] and 43 not in eventPlayer.earnedAchievements:
        eventPlayer.dlcTimeChallenge[5].append(eventPlayer.eventId)

rule "[VishkarEvent]: 作弊：回溯 (记录位置 - 3秒心跳)":
    @Event eachPlayer
    @Team 1
    @Condition evalOnce(controlRespawnPosition) == null
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 15]) == true
    
    if evalOnce(controlRespawnPosition) != null:
        eventPlayer.eventDuration = 0
        return
    if eventPlayer.eventId not in  eventPlayer.dlcTimeChallenge[5] and 43 not in eventPlayer.earnedAchievements:
        eventPlayer.dlcTimeChallenge[5].append(eventPlayer.eventId)
    eventPlayer.controlPlayerRespawnPosition = [eventPlayer.getPosition(), eventPlayer.getFacingDirection(), eventPlayer.getHero()]
    wait(EVT_MECH_15_RECORD_INTERVAL)
    if ruleCondition:
        loop()
    eventPlayer.controlPlayerRespawnPosition = null


rule "[VishkarEvent]: 作弊：回溯 (按键触发)":
    @Event eachPlayer
    @Team 1
    @Condition evalOnce(controlRespawnPosition) == null
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 15, eventPlayer.isHoldingButton(Button.RELOAD)]) == true
    
    damage(eventPlayer, null, eventPlayer.getMaxHealth() * EVT_MECH_15_TRIGGER_HP_COST)
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
    if random.randint(0, 99) < EVT_MECH_16_WIN_CHANCE:
        eventPlayer.heart_steel += EVT_MECH_16_REWARD_STACKS
        smallMessage(eventPlayer, "  {0}  赢！获得 {1} 层心之钢（{2}% 最大生命值）".format(iconString(Icon.CLUB), EVT_MECH_16_REWARD_STACKS, EVT_MECH_16_REWARD_STACKS * EVT_8_HP_PERCENT_PER_STACK))
        setPlayerHP()
        if all([33 in eventPlayer.earnedAchievements, 41 in eventPlayer.earnedAchievements, 39 not in eventPlayer.earnedAchievements]):
            eventPlayer.dlcTimeChallenge[1]++
    else:
        smallMessage(eventPlayer, "  {0}  输！祝你好运".format(iconString(Icon.DIAMOND)))
        if all([36 in eventPlayer.earnedAchievements, 37 in eventPlayer.earnedAchievements, 40 not in eventPlayer.earnedAchievements]):
            eventPlayer.dlcTimeChallenge[2]++
    eventPlayer.eventForceRoll = EVT_MECH_16_FORCE_ROLL
    eventPlayer.eventForceCount = EVT_MECH_16_FORCE_COUNT
    smallMessage(eventPlayer, "  {0}  合约已生效：未来 3 个事件为 减益".format(iconString(Icon.DIAMOND)))   
    clearPlayerEvent()


rule "[VishkarEvent]: 赌徒：长期投资 (豪赌)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 22, eventPlayer.isHoldingButton(Button.RELOAD)]) == true
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    if random.randint(0, 99) < EVT_MECH_22_WIN_CHANCE:
        eventPlayer.heart_steel += 20
        smallMessage(eventPlayer, "  {0}  赢！获得 {1} 层心之钢（{2}% 最大生命值）".format(iconString(Icon.CLUB), EVT_MECH_22_REWARD_STACKS, EVT_MECH_22_REWARD_STACKS * EVT_8_HP_PERCENT_PER_STACK))
        setPlayerHP()
    else:
        smallMessage(eventPlayer, "  {0}  输！祝你好运".format(iconString(Icon.DIAMOND)))
        if [36, 37] in eventPlayer.earnedAchievements and 40 not in eventPlayer.earnedAchievements:
            eventPlayer.dlcTimeChallenge[2]++
    eventPlayer.eventForceRoll = EVT_MECH_22_FORCE_ROLL
    eventPlayer.eventForceCount = EVT_MECH_22_FORCE_COUNT
    smallMessage(eventPlayer, "  {0}  合约已生效：未来 5 个事件为 减益".format(iconString(Icon.DIAMOND)))
    clearPlayerEvent()


rule "[VishkarEvent]: 命运共同体 (概率同步)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 17]) == true
    
    eventPlayer.target = [player for player in getLivingPlayers(Team.1) if player != eventPlayer and player.eventId == -1]
    if len(eventPlayer.target) > 0:
        eventPlayer.eventForceRoll = random.randint(0, 80)
        eventPlayer.target.eventForceRoll = eventPlayer.eventForceRoll
        smallMessage(getAllPlayers(), "  {0}  {1} 与 {2} 命运相连！下一次事件类别相同".format(abilityIconString(Hero.MAUGA, Button.ULTIMATE), eventPlayer, eventPlayer.target, eventPlayer.eventName))
    wait(0.032) 
    eventPlayer.eventDuration = 0
    clearPlayerEvent()


rule "[VishkarEvent]: 作弊：跳过 (更换英雄)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 18, eventPlayer.isHoldingButton(Button.RELOAD)]) == true
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    # todo：传送回重生室
    progressHero()
    if eventPlayer.eventId not in  eventPlayer.dlcTimeChallenge[5] and 43 not in eventPlayer.earnedAchievements:
        eventPlayer.dlcTimeChallenge[5].append(eventPlayer.eventId)
    eventPlayer.eventDuration = 0
    clearPlayerEvent()


rule "[VishkarEvent]: 俄罗斯方块 (变大复活)":
    @Event playerDied
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 19]) == true
    
    eventPlayer.disableRespawn()
    wait(EVT_MECH_19_RESURRECT_DELAY)
    eventPlayer.enableRespawn()
    eventPlayer.resurrect()
    eventPlayer.eventSize++
    eventPlayer.startScalingSize(1 + EVT_MECH_19_SIZE_STEP * eventPlayer.eventSize, false)
    eventPlayer.startModifyingVoicelinePitch(max(EVT_MECH_19_PITCH_MIN, 1 - EVT_MECH_19_PITCH_STEP * eventPlayer.eventSize), false)
    eventPlayer.sizeHealth += EVT_MECH_19_SIZE_HEALTH_STEP
    setPlayerHP()


rule "[VishkarEvent]: 俄罗斯套娃 (变小复活)":
    @Event playerDied
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 20]) == true
    
    eventPlayer.disableRespawn()
    wait(EVT_MECH_20_RESURRECT_DELAY)
    eventPlayer.enableRespawn()
    eventPlayer.resurrect()
    eventPlayer.eventSize++
    eventPlayer.startScalingSize(max(EVT_MECH_20_SIZE_MIN, 1 - EVT_MECH_20_SIZE_STEP * eventPlayer.eventSize), false)
    eventPlayer.startModifyingVoicelinePitch(max(EVT_MECH_20_PITCH_MIN, 1 + EVT_MECH_20_PITCH_STEP * eventPlayer.eventSize), false)
    eventPlayer.mod_speed_event += EVT_MECH_20_SPEED_STEP
    updatePlayerStats()


rule "[VishkarEvent]: 作弊：0CD (血量换CD)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 21]) == true
    @Condition any([eventPlayer.isUsingAbility1(), eventPlayer.isUsingAbility2(), eventPlayer.isFiringSecondaryFire()]) == true
    
    if eventPlayer.eventId not in  eventPlayer.dlcTimeChallenge[5] and 43 not in eventPlayer.earnedAchievements:
        eventPlayer.dlcTimeChallenge[5].append(eventPlayer.eventId)
    waitUntil(any([eventPlayer.isUsingAbility1(), eventPlayer.isUsingAbility2(), eventPlayer.isFiringSecondaryFire()]) == false, EVT_MECH_21_WAITUNTIL_TIMEOUT)
    damage(eventPlayer, null, eventPlayer.getMaxHealth() * EVT_MECH_21_HP_COST_PERCENT)
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
    
    eventPlayer.sizeHealth = EVT_MECH_23_SIZE_HEALTH
    setPlayerHP()
    eventPlayer.heal_recv = EVT_MECH_0_HEAL_BAN
    eventPlayer.mod_heal_event = EVT_MECH_0_HEAL_BAN
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
    
    eventPlayer.setUltCharge(eventPlayer.getUltCharge() + EVT_MECH_23_ULT_CHARGE_GAIN)
    wait(EVT_MECH_23_ULT_CHARGE_INTERVAL)


rule "[VishkarEvent]: 瓦尔基里降临 (大招持续回血)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 23, eventPlayer.isUsingUltimate()]) == true
    
    if eventPlayer.eventTargetHP == 0:
        eventPlayer.eventTargetHP = eventPlayer.getMaxHealth()
    eventPlayer.eventTargetHP = eventPlayer.getHealth() + ((eventPlayer.eventTargetHP - eventPlayer.getHealth()) * EVT_MECH_23_HEAL_SMOOTHING)
    while all([eventPlayer.isUsingUltimate(), eventPlayer.getHealth() < eventPlayer.eventTargetHP]):
        eventPlayer.setHealth(min(eventPlayer.eventTargetHP, eventPlayer.getHealth() + eventPlayer.getMaxHealth() * EVT_MECH_23_HEAL_TICK_PERCENT))
        playEffect(getAllPlayers(), DynamicEffect.HEAL_TARGET_ACTIVE, Color.YELLOW, eventPlayer, 60)
        wait(EVT_MECH_23_HEAL_TICK_INTERVAL)

rule "[VishkarEvent]: 三位一体 (SSR)":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == 24]) == true
    
    eventPlayer.mod_dmg_taken = min(EVT_MECH_24_DMG_REDUCE_CAP, eventPlayer.getMaxHealth() / EVT_MECH_24_DMG_REDUCE_DIVISOR) * -1
    eventPlayer.mod_speed_event = eventPlayer.mod_dmg_taken * -EVT_MECH_24_SPEED_FACTOR
    updatePlayerStats()
    eventPlayer.heart_steel += EVT_MECH_24_HEART_STEEL_PER_TICK
    setPlayerHP()
    eventPlayer.hudText = "伤害减免：{0}% / 移速加成：{1}% / 心之钢：{2}层".format(eventPlayer.mod_dmg_taken * -1, eventPlayer.mod_speed_event, round(eventPlayer.heart_steel))
    wait(EVT_MECH_24_INTERVAL)
    if ruleCondition:
        loop()
    eventPlayer.mod_dmg_taken = 0
    eventPlayer.mod_speed_event = 0
    updatePlayerStats()

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


