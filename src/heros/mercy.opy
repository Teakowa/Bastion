#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "when a mercy might rez, respawn time is increased":
    @Event playerDied
    @Team 1
    @Condition isHeroBeingPlayed(Hero.MERCY, Team.1) == true
    @Condition eventPlayer.controlPlayerRespawnPosition == null

    if evalOnce(dlcVishkarEvent) and eventPlayer.eventType == 2 and (eventPlayer.eventId == 19 or eventPlayer.eventId == 20):
        return
    
    if evalOnce(dlcVishkarEvent) and eventPlayer.eventType == 0 and eventPlayer.eventId == 8:
        return
    if any([distance(eventPlayer.getPosition(), player.getPosition()) < 40 and player.isAlive() and player.getAbilityCooldown(Button.ABILITY_2) < 8 for player in getPlayersOnHero(Hero.MERCY, Team.1)]):
        bigMessage(eventPlayer, STR_MSG_MERCY_NEARBY)
        eventPlayer.disableRespawn()
        wait(4)
        eventPlayer.enableRespawn()