#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


# rule "Hashtag":
#     @Event eachPlayer
#     @Hero freja
#     @Condition hashTag == true
#     @Condition (len([player for player in getPlayers(Team.1) if player.isWinner and not player.isDev])) == 0
#     @Condition isHeroBeingPlayed(Hero.KIRIKO, Team.1) != true
#     @Condition eventPlayer.hasStatus(Status.PHASED_OUT) != true
#     @Condition eventPlayer.hasStatus(Status.INVINCIBLE) != true
#     @Condition eventPlayer.isUsingAbility2() == true
    
#     waitUntil(not eventPlayer.isUsingAbility2(), 3)
#     if eventPlayer.getAbilityCooldown(Button.ABILITY_2) < 3:
#         hashTag = false


rule "Hashtag":
    @Condition hashTag == true
    @Condition vishkarEventActivated == true
    @Condition getTotalTimeElapsed() > 125
    
    waitUntil(
        any([
            len(buffEventId) < 34, 
            len(debuffEventId) < 22, 
            len(mechEventId) < 25
        ]), 
    MAX_TIME)
    hashTag = false

# rule "Hashtag":
#     @Event eachPlayer
#     @Hero juno
#     @Condition hashTag == true
#     @Condition isHeroBeingPlayed(Hero.KIRIKO, Team.1) != true
#     @Condition eventPlayer.isUsingAbility1() == true
#     @Condition eventPlayer.eventId == -1
    
#     waitUntil(not eventPlayer.isUsingAbility1(), 3)
#     if eventPlayer.getAbilityCooldown(Button.ABILITY_1) < 3.8:
#         hashTag = false


# rule "Hashtag":
#     @Event eachPlayer
#     @Hero mauga
#     @Condition hashTag == true
#     @Condition isHeroBeingPlayed(Hero.KIRIKO, Team.1) != true
#     @Condition eventPlayer.isUsingAbility1() == true
#     @Condition eventPlayer.eventId == -1
    
#     waitUntil(not eventPlayer.isUsingAbility1(), 4)
#     if eventPlayer.getAbilityCooldown(Button.ABILITY_1) < 3.8:
#         hashTag = false
