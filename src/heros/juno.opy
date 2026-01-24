#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "Juno disable Ability 1 if possess":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent), eventPlayer.hasSpawned(), eventPlayer.getHero() == Hero.JUNO, eventPlayer.eventType == 0, eventPlayer.eventId == 12, eventPlayer.possess[0].possessed == true]) == true
    
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.setAbility1Enabled(false)
    waitUntil(eventPlayer.eventId != 12 or eventPlayer.possess[0].possessed != true or eventPlayer.getHero() != Hero.JUNO, MAX_TIME)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.setAbility1Enabled(true)
