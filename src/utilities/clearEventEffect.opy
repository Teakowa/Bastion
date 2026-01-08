#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

def clearEventEffect():
    @Name "[VishkarEvent]: clear Player event effect"
    
    if len(eventPlayer.eventEffect) > 0:
        while len(eventPlayer.eventEffect) > 0:
            destroyEffect(eventPlayer.eventEffect[0])
            eventPlayer.eventEffect.remove(eventPlayer.eventEffect[0])
    else:
        destroyEffect(eventPlayer.eventEffect)
    wait(getServerLoad() / 100 * 0.032)
    eventPlayer.eventEffect = null