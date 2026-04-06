# Event: BuffEventId.MAGIC_MASTER
# 下线规范：若下线此事件，请在本文件内将相关 rule 标记为 @Disabled（并写明日期/原因），然后同步移除 eventConfig 注册与聚合 include。

rule "[VishkarEvent]: 魔术大师":
    @Event eachPlayer
    @Team 1
    @Condition all([
        dlcVishkarEvent,
        eventPlayer.hasSpawned(),
        eventPlayer.eventType == 0,
        eventPlayer.eventId == BuffEventId.MAGIC_MASTER,
        eventPlayer.isCommunicatingEmote() == true
    ]) == true

    eventPlayer.targetSilence = true
    eventPlayer.mod_speed_event += EVT_29_SPEED_BOOST
    updatePlayerStats()
    if eventPlayer.eventEffect == null:
        createEffect(getAllPlayers(), Effect.REAPER_WRAITH_FORM, Color.TEAM_1, eventPlayer, 200, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.eventEffect = getLastCreatedEntity()
    waitUntil(eventPlayer.isCommunicatingEmote() == false, eventPlayer.eventDuration)
    eventPlayer.targetSilence = false
    eventPlayer.mod_speed_event -= EVT_29_SPEED_BOOST
    updatePlayerStats()
    clearEventEffect()
    wait(0.1)
