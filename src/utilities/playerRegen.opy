#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "SYSTEM: Core Regen Logic (Signal Based)":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.combatRegen == true
    
    eventPlayer.combatRegen = false
    stopHealingOverTime(eventPlayer.healID)
    eventPlayer.healID = 0
    wait(3, Wait.RESTART_WHEN_TRUE)
    if any([eventPlayer.isDead(), eventPlayer.getNormalizedHealth() == 1, eventPlayer.heal_recv <= -100]):
        return
    smallMessage(
        eventPlayer, 
        STR_MSG_PASSIVE_HEAL_START.format(
            abilityIconString(Hero.BAPTISTE, Button.ABILITY_1)
        )
    )
    eventPlayer.startHealingOverTime(eventPlayer, 999999986991104.000, 50 + eventPlayer.getMaxHealth() * 0.08)
    eventPlayer.healID = getLastHealingOverTimeId()


rule "Trigger: Normal Damage":
    @Event playerTookDamage
    @Team 1
    
    eventPlayer.combatRegen = true
    wait()


rule "Trigger: Grenade Alive":
    @Event playerTookDamage
    @Team 1
    @Condition eventPlayer.A36TGrenadeAlive != true
    @Condition all([eventAbility == Button.SECONDARY_FIRE, attacker.getHero() == Hero.BASTION, attacker != eventPlayer, eventPlayer.getHealth() <= 5]) == true
    
    eventPlayer.A36TGrenadeAlive = true
    return

