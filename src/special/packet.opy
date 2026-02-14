
#!mainFile "../lunar.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

#!define RED_PACK_EFFECT Effect.SPARKLES if DEBUG else Effect.SPARKLES
#!define RED_PACK_EFFECT_ROUND 0.25 if DEBUG else 0.1
#!define RED_PACK_EFFECT_COLOR Color.RED

rule "dev to test reset Red packet":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isCommunicating(Comms.HELLO) == true
    @Condition eventPlayer.isDev == true
    @Disabled

    rollActivePacket()
    smallMessage(localPlayer, "  红包点位已更新")

rule "set red packet postion loop":
    @Condition vishkarEventActivated == true
    @Condition len(activePacket) == 0

    rollActivePacket()
    wait(60, Wait.IGNORE_CONDITION)
    smallMessage(getAllPlayers(), "  {0}  红包即将刷新……".format(iconString(Icon.RECYCLE)))
    wait(random.randint(5, 15), Wait.IGNORE_CONDITION)
    activePacket = []
    if ruleCondition:
        loop()

playervar hudRedPackId
playervar hudRedPackText

rule "red packet HUD":
    @Event eachPlayer
    @Team 1
    @Condition vishkarEventActivated == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition (eventPlayer.hudRedPackId or eventPlayer.hudTextId) == null

    eventPlayer.hudText = ""
    hudText(eventPlayer, null, "{0}".format(HUD_PAD_BOTTOM), eventPlayer.hudText, HudPosition.TOP, 9, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.hudTextId = getLastCreatedText()

    eventPlayer.hudRedPackText = ""
    hudText(eventPlayer, null, "{0}".format(HUD_PAD_BOTTOM), eventPlayer.hudRedPackText, HudPosition.TOP, 8, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.hudRedPackId = getLastCreatedText()

rule "get red packet":
    @Event eachPlayer
    @Team 1
    @Condition getNumberOfPlayers(Team.2) == len(bastionPosition)
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition all([vishkarEventActivated, eventPlayer.hasSpawned(), eventPlayer.isAlive(), eventPlayer.eventId == -1]) == true

    wait(0.25, Wait.ABORT_WHEN_FALSE)

    eventPlayer.packetFxId = sorted([player for player in activePacket if eventPlayer.isInViewAngle(player, 180)], lambda i: distance(eventPlayer.getEyePosition(), i))
    if eventPlayer.packetFxId != null:
        eventPlayer.hudRedPackText = "  附近红包：{0} / 相距距离：{1}".format(len(eventPlayer.packetFxId) if DEBUG != true else eventPlayer.packetFxId, distance(eventPlayer.packetFxId.frist(), eventPlayer))
        # smallMessage(eventPlayer, "  附近红包：{0} / 相距距离：{1}".format(len(eventPlayer.packetFxId) if DEBUG != true else eventPlayer.packetFxId, distance(eventPlayer.packetFxId.frist(), eventPlayer)))

    wait()
    if eventPlayer.packetFxId != null and distance(eventPlayer.packetFxId.frist(), eventPlayer.getEyePosition()) <= 2.5:
        getRedPacket()
        setPlayerEvent()
        wait()
        waitUntil(eventPlayer.eventDuration == 0, eventPlayer.eventDuration)
        wait(getAverageServerLoad() / 100 * 0.032)
        clearPlayerEvent()
        eventPlayer.packetFxId = null
