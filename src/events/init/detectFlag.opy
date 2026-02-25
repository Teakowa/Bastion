#!mainFile "../../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "initialize event flag":
    @Condition dlcVishkarEvent == true
    @Condition getTotalTimeElapsed() > (20 if evalOnce(debugMode) else 120)
    @Condition vishkarEventActivated != dlcVishkarEvent
    
    vishkarEventActivated = evalOnce(dlcVishkarEvent)
    #waitUntil(getTotalTimeElapsed() > rebootTime, 999999986991104)
    return

