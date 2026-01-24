#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "Decay Overhealth":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.overhealthDecay == true
    # @Condition eventPlayer.getMaxHealth() - eventPlayer.getMaxHealthOfType(Health.NORMAL) - eventPlayer.getMaxHealthOfType(Health.ARMOR) - eventPlayer.getMaxHealthOfType(Health.SHIELDS) > 0
    @Disabled
    
    wait(4, Wait.RESTART_WHEN_TRUE)
    StoreOverhealth()
    #While has OH
    while eventPlayer.getMaxHealth() - eventPlayer.getMaxHealthOfType(Health.NORMAL) - eventPlayer.getMaxHealthOfType(Health.ARMOR) - eventPlayer.getMaxHealthOfType(Health.SHIELDS) > 0:
        #If OH gained, delay again
        if eventPlayer.getMaxHealth() - eventPlayer.getMaxHealthOfType(Health.NORMAL) - eventPlayer.getMaxHealthOfType(Health.ARMOR) - eventPlayer.getMaxHealthOfType(Health.SHIELDS) > eventPlayer.storedOverhealth[0]:
            loop()
        #If not full HP, replace current OH with current OH - 1
        if eventPlayer.getHealth() < eventPlayer.getMaxHealth():
            eventPlayer.storedOverhealth[1] = eventPlayer.getHealth() - eventPlayer.storedOverhealth[0]
            while eventPlayer.getHealth() > eventPlayer.storedOverhealth[1]:
                eventPlayer.setHealth(eventPlayer.storedOverhealth[1])
            eventPlayer.storedOverhealth[0] -= 10
            if eventPlayer.storedOverhealth[0] < 1:
                return
            eventPlayer.addHealthPool(Health.NORMAL, eventPlayer.storedOverhealth[0], false, false)
            #Else just subtract 1 from health
        else:
            eventPlayer.setHealth(eventPlayer.getHealth() - 10)
            StoreOverhealth()
        wait(0.12)
    eventPlayer.overhealthDecay = false


def StoreOverhealth():
    @Name "Store Overhealth"
    
    eventPlayer.storedOverhealth[0] = eventPlayer.getMaxHealth() - eventPlayer.getMaxHealthOfType(Health.NORMAL) - eventPlayer.getMaxHealthOfType(Health.ARMOR) - eventPlayer.getMaxHealthOfType(Health.SHIELDS)