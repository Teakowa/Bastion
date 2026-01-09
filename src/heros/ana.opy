#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "ana can only sleep each bastion once per limited amount of time":
    @Event playerDealtDamage
    @Team 1
    @Hero ana
    @Condition eventAbility == Button.ABILITY_1
    @Condition victim.hasNano != true
    
    if getTotalTimeElapsed() - eventPlayer.anaSleepLimit[victim.getSlot()] > 30:
        #taking damage won't wake bastion
        victim.setStatusEffect(null, Status.INVINCIBLE, 5)
        eventPlayer.anaSleepLimit[victim.getSlot()] = getTotalTimeElapsed()
    else:
        bigMessage(eventPlayer, "{0} 我起了！ {0}时间到了！".format(iconString(Icon.WARNING)))
        wait(0.1)
        while victim.hasStatus(Status.ASLEEP):
            victim.clearStatusEffect(Status.ASLEEP)
            wait(0.1)


rule "ana's sleep limit refreshes when she spawns":
    @Event eachPlayer
    @Team 1
    @Hero ana
    @Condition eventPlayer.isAlive() == true
    
    wait(getAverageServerLoad() / 100)
    eventPlayer.anaSleepLimit = [-30 for player in bastionPosition]

rule "create ana sleep timer and instructions":
    @Condition isHeroBeingPlayed(Hero.ANA, Team.1) == true
    
    hudHeader(localPlayer if localPlayer.getHero() == Hero.ANA and localPlayer.isInSpawnRoom() else null, "{0} 麻醉镖限制: \n 每个堡垒每 {1} 秒只能被麻醉一次".format(abilityIconString(Hero.ANA, Button.ABILITY_1), 30), HudPosition.TOP, 5, Color.WHITE, HudReeval.VISIBILITY)
    wait()
    textIDs[4] = getLastCreatedText()
    textIDs[3] = [0 for player in bastionPosition]
    for I in range(len(bastionPosition)):
        createProgressBarInWorldText(localPlayer if localPlayer.getHero() == Hero.ANA and getTotalTimeElapsed() - localPlayer.anaSleepLimit[evalOnce(I)] < 30 and distance(distance(localPlayer.getEyePosition(), bastionPosition[evalOnce(I)]) * localPlayer.getFacingDirection() + localPlayer.getEyePosition(), bastionPosition[evalOnce(I)]) <= 4 else null, ((30 - (getTotalTimeElapsed() - localPlayer.anaSleepLimit[evalOnce(I)])) / 30) * 100, "麻醉限制: 剩余 {0} 秒 ".format(min(30, 30 - (floor(getTotalTimeElapsed() - localPlayer.anaSleepLimit[evalOnce(I)])))), bastionPosition[evalOnce(I)], 1, Clip.NONE, Color.BLUE, Color.WHITE, ProgressWorldTextReeval.VISIBILITY_AND_VALUES)
        textIDs[3] = [getLastCreatedText() if idx == I else i for i, idx in textIDs[3]]
    waitUntil(not isHeroBeingPlayed(Hero.ANA, Team.1), 9999)
    for I in range(len(textIDs[3])):
        destroyProgressBarInWorldText(textIDs[3][I])
    destroyHudText(textIDs[4])