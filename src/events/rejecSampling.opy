#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

def rejecSampling():
    @Name "[VishkarEvent]: set player event"
    
    eventPlayer.eventLoopCount = 0
    eventPlayer.eventIsSelected = false
    if eventPlayer.eventType == 0:
        while eventPlayer.eventIsSelected == false and eventPlayer.eventLoopCount < 8:
            eventPlayer.eventTempId = random.choice(buffEventId) if random.randint(0, 100) < 33 else random.choice(buffEventId.exclude(eventPlayer.eventLastId))
            eventPlayer.eventTempWeight = buffEvent[eventPlayer.eventTempId][3] if len(buffEvent[eventPlayer.eventTempId]) > 3 else 1
            if random.uniform(0, eventWeight) < eventPlayer.eventTempWeight:
                eventPlayer.eventId = eventPlayer.eventTempId
                eventPlayer.eventIsSelected = true
                break
            eventPlayer.eventLoopCount++
        if eventPlayer.eventIsSelected == false:
            eventPlayer.eventId = eventPlayer.eventTempId
    elif eventPlayer.eventType == 1:
        while eventPlayer.eventIsSelected == false and eventPlayer.eventLoopCount < 8:
            eventPlayer.eventTempId = random.choice(debuffEventId) if random.randint(0, 100) < 33 else random.choice(debuffEventId.exclude(eventPlayer.eventLastId))
            eventPlayer.eventTempWeight = debuffEvent[eventPlayer.eventTempId][3] if len(debuffEvent[eventPlayer.eventTempId]) > 3 else 1
            if random.uniform(0, eventWeight) < eventPlayer.eventTempWeight:
                eventPlayer.eventId = eventPlayer.eventTempId
                eventPlayer.eventIsSelected = true
                break
            eventPlayer.eventLoopCount++
        if eventPlayer.eventIsSelected == false:
            eventPlayer.eventId = eventPlayer.eventTempId
    else:
        while eventPlayer.eventIsSelected == false and eventPlayer.eventLoopCount < 8:
            eventPlayer.eventTempId = random.choice(mechEventId) if random.randint(0, 100) < 33 else random.choice(mechEventId.exclude(eventPlayer.eventLastId))
            eventPlayer.eventTempWeight = mechEvent[eventPlayer.eventTempId][3] if len(mechEvent[eventPlayer.eventTempId]) > 3 else 1
            if random.uniform(0, eventWeight) < eventPlayer.eventTempWeight:
                eventPlayer.eventId = eventPlayer.eventTempId
                eventPlayer.eventIsSelected = true
                break
            eventPlayer.eventLoopCount++
        if eventPlayer.eventIsSelected == false:
            eventPlayer.eventId = eventPlayer.eventTempId
