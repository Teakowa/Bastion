#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "Hashtag":
    @Event eachPlayer
    @Hero freja
    @Condition (len([player for player in getPlayers(Team.1) if player.isWinner and not player.isDev])) == 0
    @Condition isHeroBeingPlayed(Hero.KIRIKO, Team.1) != true
    @Condition eventPlayer.hasStatus(Status.PHASED_OUT) != true
    @Condition eventPlayer.hasStatus(Status.INVINCIBLE) != true
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition hashTag == true
    
    waitUntil(not eventPlayer.isUsingAbility2(), 0.16)
    hashTag = evalOnce(false if eventPlayer.getAbilityCooldown(Button.ABILITY_2) < 3 else true)
    wait(60)


rule "Hashtag":
    @Condition hashTag == true
    @Condition vishkarEventActivated == true
    @Condition getTotalTimeElapsed() > 125
    
    waitUntil(any([len(buffEventId) != 24, len(debuffEventId) != 16, len(mechEventId != 14)]), MAX_TIME)
    hashTag = false
    wait(60)


rule "Hashtag":
    @Event eachPlayer
    @Hero reaper
    @Condition isHeroBeingPlayed(Hero.KIRIKO, Team.1) != true
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition hashTag == true
    @Disabled
    
    waitUntil(not eventPlayer.isUsingAbility2(), 0.16)
    hashTag = evalOnce(false if eventPlayer.getAbilityCooldown(Button.ABILITY_2) < 30 else true)
    wait(60)


rule "Hashtag":
    @Event eachPlayer
    @Hero juno
    @Condition isHeroBeingPlayed(Hero.KIRIKO, Team.1) != true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition hashTag == true
    
    waitUntil(not eventPlayer.isUsingAbility1(), 3)
    hashTag = evalOnce(false if eventPlayer.getAbilityCooldown(Button.ABILITY_1) < 3.8 else true)
    wait(60)


rule "Hashtag":
    @Event eachPlayer
    @Hero mauga
    @Condition hashTag == true
    @Condition all([isHeroBeingPlayed(Hero.KIRIKO, Team.1) != true, eventPlayer.isUsingAbility1()]) == true
    
    waitUntil(not eventPlayer.isUsingAbility1(), 4)
    hashTag = evalOnce(false if eventPlayer.getAbilityCooldown(Button.ABILITY_1) < 3.8 else true)
    wait(60)


