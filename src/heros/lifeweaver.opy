#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "Lifeweaver disable Life Grip if no winners":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.getHero() == Hero.LIFEWEAVER
    @Condition eventPlayer.isWinner != true
    
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.setAbility2Enabled(false)
    waitUntil(eventPlayer.isWinner == true or eventPlayer.getHero() != Hero.LIFEWEAVER, MAX_TIME)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.setAbility2Enabled(true)


rule "Lifeweaver auto-breaks Petal Platform after time limit":
    @Event eachPlayer
    @Team 1
    @Hero lifeweaver
    @Condition any([eventPlayer.isUsingAbility1(), eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 0]) == true
    
    wait(3, Wait.ABORT_WHEN_FALSE)
    while eventPlayer.isUsingAbility1():
        #if eventPlayer.isInSpawnRoom():
        #            return
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(0.25)