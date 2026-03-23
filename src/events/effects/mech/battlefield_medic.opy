# Event: MechEventId.BATTLEFIELD_MEDIC
# 下线规范：若下线此事件，请在本文件内将相关 rule 标记为 @Disabled（并写明日期/原因），然后同步移除 eventConfig 注册与聚合 include。

rule "[VishkarEvent]: 任务：战地医生 (初始化)":
    @Event eachPlayer
    @Team 1
    @Condition all([dlcVishkarEvent, eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == MechEventId.BATTLEFIELD_MEDIC]) == true
    
    eventPlayer.eventMissionGoal = EVT_MECH_15_GOAL_BASE + round(eventPlayer.getMaxHealth() * EVT_MECH_15_GOAL_MAX_HP_FACTOR)
    eventPlayer.healing_global = 0
    eventPlayer.hudText = "{0}/{1}".format(eventPlayer.healing_global, eventPlayer.eventMissionGoal)
    wait(eventPlayer.eventDuration)

rule "[VishkarEvent]: 任务：战地医生 (治疗累计)":
    @Event playerDealtHealing
    @Team 1
    @Condition all([dlcVishkarEvent, eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == MechEventId.BATTLEFIELD_MEDIC, eventPlayer.healing_global < eventPlayer.eventMissionGoal]) == true
    @Condition healee.getTeam() == Team.1
    @Condition eventPlayer != healee
    @Condition eventHealing > 0
    
    eventPlayer.healing_global += eventHealing
    eventPlayer.hudText = "{0}/{1}".format(min(eventPlayer.healing_global, eventPlayer.eventMissionGoal), eventPlayer.eventMissionGoal)
    if eventPlayer.healing_global >= eventPlayer.eventMissionGoal:
        bigMessage(eventPlayer, "任务：战地医生 完成！")
        smallMessage(eventPlayer, "  {0}  任务奖励：永久获得 {1}% 治疗增益、{2}% 伤害减免与 {3}% 移速".format(abilityIconString(Hero.MERCY, Button.PRIMARY_FIRE), EVT_MECH_15_REWARD_HEAL, EVT_MECH_15_REWARD_DMG_REDUCTION, EVT_MECH_15_REWARD_SPEED))
        eventPlayer.mod_heal_event += EVT_MECH_15_REWARD_HEAL
        eventPlayer.mod_dmg_perma += EVT_MECH_15_REWARD_DMG_REDUCTION
        eventPlayer.mod_speed_perma += EVT_MECH_15_REWARD_SPEED
        updatePlayerStats()
        eventPlayer.eventDuration = 0

rule "[VishkarEvent]: 任务：战地医生 (收尾)":
    @Event eachPlayer
    @Team 1
    @Condition all([dlcVishkarEvent, eventPlayer.hasSpawned(), eventPlayer.eventType == 2, eventPlayer.eventId == MechEventId.BATTLEFIELD_MEDIC]) == true
    
    waitUntil(eventPlayer.eventDuration <= 0 or eventPlayer.eventId == null, eventPlayer.eventDuration + 1.5)
    eventPlayer.hudText = ""
    eventPlayer.eventMission = 0
    eventPlayer.eventMissionGoal = 0
    eventPlayer.healing_global = 0
