#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


def setPlayerEvent():
    @Name "[VishkarEvent]: set player event"
    
    eventPlayer.categoryRoll = random.randint(0, 100)
    if eventPlayer.categoryRoll <= 40:
        eventPlayer.eventType = 0
        eventPlayer.eventId = random.choice(buffEventId) if random.randint(0, 100) < 33 else random.choice(buffEventId.exclude(eventPlayer.eventLastId))
        eventPlayer.eventName = buffEvent[eventPlayer.eventId][0]
        eventPlayer.eventDesc = buffEvent[eventPlayer.eventId][1]
        eventPlayer.eventDuration = buffEvent[eventPlayer.eventId].last()
        if eventPlayer.eventId == 0:
            goto lbl_0
        eventPlayer.eventCount[0]++
        lbl_0:
        eventPlayer.eventLucky = eventPlayer.eventLucky + 1 if eventPlayer.eventLucky > 0 else 1
    elif eventPlayer.categoryRoll <= 80:
        eventPlayer.eventType = 1
        eventPlayer.eventId = random.choice(debuffEventId) if random.randint(0, 100) < 33 else random.choice(debuffEventId.exclude(eventPlayer.eventLastId))
        eventPlayer.eventName = debuffEvent[eventPlayer.eventId][0]
        eventPlayer.eventDesc = debuffEvent[eventPlayer.eventId][1]
        eventPlayer.eventDuration = debuffEvent[eventPlayer.eventId].last()
        eventPlayer.eventCount[1]++
        eventPlayer.eventLucky = eventPlayer.eventLucky - 1 if eventPlayer.eventLucky < 0 else -1
    else:
        eventPlayer.eventType = 2
        eventPlayer.eventId = random.choice(mechEventId) if random.randint(0, 100) < 50 else random.choice(mechEventId.exclude(eventPlayer.eventLastId))
        eventPlayer.eventName = mechEvent[eventPlayer.eventId][0]
        eventPlayer.eventDesc = mechEvent[eventPlayer.eventId][1]
        eventPlayer.eventDuration = mechEvent[eventPlayer.eventId].last()
        eventPlayer.eventCount[2]++
    wait(getAverageServerLoad() / 100 * 0.032)
    eventPlayer.eventLastId = eventPlayer.eventId
    if eventPlayer.eventDesc == null:
        goto lbl_1
    if eventPlayer.eventId == 666:
        goto lbl_2
    smallMessage(
    eventPlayer, 
        STR_MSG_EVENT_TRIGGER.format(
            abilityIconString(Hero.SOMBRA, Button.ULTIMATE), 
            eventPlayer.eventName, 
            STR_MSG_DURATION_SEC.format(eventPlayer.eventDuration) if eventPlayer.eventDuration > 0 else STR_MSG_DURATION_INSTANT
        )
    )

    smallMessage(
        eventPlayer, 
        STR_MSG_EVENT_EFFECT.format(
            abilityIconString(Hero.SOMBRA, Button.ULTIMATE), 
            eventPlayer.eventDesc
        )
    )
    lbl_2:
    setEventDuration()
    lbl_1:


