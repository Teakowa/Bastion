#!mainFile "../main.opy"


#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

globalvar antiCrashActivated 127

rule "anti crash":
    @Condition antiCrashActivated == false
    @Condition getAverageServerLoad() > 235
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    smallMessage(getAllPlayers(), STR_MSG_ANTI_CRASH_WORKING)
    setSlowMotion(20)
    antiCrashActivated = true


rule "disable anti crash":
    @Condition antiCrashActivated != false
    @Condition getAverageServerLoad() < 200
    
    setSlowMotion(90)
    antiCrashActivated = false
