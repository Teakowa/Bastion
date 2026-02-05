#!mainFile "../lunar.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

subroutine getRedPacket

def getRedPacket():
    if eventPlayer.eventForceRoll != null:
        eventPlayer.categoryRoll = eventPlayer.eventForceRoll
        if eventPlayer.eventForceCount > 0:
            eventPlayer.eventForceCount--
        else:
            eventPlayer.eventForceRoll = null
    else:
        eventPlayer.categoryRoll = random.randint(0, 100)

    if eventPlayer.categoryRoll <= 70:
        eventPlayer.eventType = 0
        playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 200)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.YELLOW, eventPlayer, 200)
        smallMessage(eventPlayer, "  {0} 好运降临！你拾取到了一个幸运红包！".format(abilityIconString(Hero.ZENYATTA, Button.ABILITY_1)))
    elif eventPlayer.categoryRoll <= 80:
        eventPlayer.eventType = 1
        playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 200)
        playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.PURPLE, eventPlayer, 200)
        smallMessage(eventPlayer, "  {0} Aloha ~ 黑影的恶作剧".format(abilityIconString(Hero.SOMBRA, Button.ULTIMATE)))
    else:
        eventPlayer.eventType = 2
        playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 200)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.YELLOW, eventPlayer, 200)
        smallMessage(eventPlayer, "  {0} 你拾取到了一个机制红包！".format(abilityIconString(Hero.ZENYATTA, Button.ABILITY_1)))
    
    activePacket[activePacket.index(eventPlayer.packetFxId.frist())] = null
    
    wait(max(1, getAverageServerLoad() / 100 * 0.032))

    