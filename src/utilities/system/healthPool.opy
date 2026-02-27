#!mainFile "../../main.opy"


#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "Logic: Health Pool Cleaner":
    @Event eachPlayer
    @Team 1
    @Condition len(eventPlayer.hp_data) > 0
    
    eventPlayer.hp_data = sorted([player for player in eventPlayer.hp_data if player != null], lambda i: i[0])
    while len(eventPlayer.hp_data) > 0 and eventPlayer.hp_data[0][0] <= getTotalTimeElapsed():
        removeHealthPool(eventPlayer.hp_data[0][1])
        del eventPlayer.hp_data[0]
        wait(getServerLoad() / 100 * 0.064)
    eventPlayer.hp_data = [player for player in eventPlayer.hp_data if player[0] > getTotalTimeElapsed()]
    wait(max(1, getServerLoad() / 100 * 0.032))
    if ruleCondition:
        loop()

