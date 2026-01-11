#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "Phase: Dash Detector - 启动监听":
    @Event eachPlayer
    @Team 1
    @Condition vishkarEventActivated == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.phase_trigger != true
    @Condition any([all([eventPlayer.getHero() in phaseHero[0], eventPlayer.isUsingAbility1()]), all([eventPlayer.getHero() in phaseHero[1], eventPlayer.isUsingAbility2()]), all([eventPlayer.getHero() in phaseHero[2], eventPlayer.isFiringSecondaryFire()]), all([eventPlayer.getHero() in phaseHero[3], eventPlayer.isHoldingButton(Button.JUMP)]), all([eventPlayer.getHero() == Hero.BRIGITTE, eventPlayer.isFiringSecondaryFire(), eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)])]) == true
    
    eventPlayer.phase_trigger = true


rule "Phase: Dash Detector - 结束监听":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.phase_trigger == true
    @Condition any([all([eventPlayer.getHero() in phaseHero[0], eventPlayer.isUsingAbility1()]), all([eventPlayer.getHero() in phaseHero[1], eventPlayer.isUsingAbility2()]), all([eventPlayer.getHero() in phaseHero[2], eventPlayer.isFiringSecondaryFire()]), all([eventPlayer.getHero() in phaseHero[3], eventPlayer.isHoldingButton(Button.JUMP)]), all([eventPlayer.getHero() == Hero.BRIGITTE, eventPlayer.isFiringSecondaryFire(), eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)])]) != true
    
    eventPlayer.phase_trigger = false


def updatePlayerPhase():
    @Name "子程序：初始化英雄位移键位"
    
    eventPlayer.phase_trigger = []
    if eventPlayer.getHero() in phaseHero[0]:
        eventPlayer.phase_trigger.append(Button.ABILITY_1)
    if eventPlayer.getHero() in phaseHero[1]:
        eventPlayer.phase_trigger.append(Button.ABILITY_2)
    if eventPlayer.getHero() in phaseHero[2]:
        eventPlayer.phase_trigger.append(Button.SECONDARY_FIRE)
    if eventPlayer.getHero() in phaseHero[3]:
        eventPlayer.phase_trigger.append(Button.JUMP)