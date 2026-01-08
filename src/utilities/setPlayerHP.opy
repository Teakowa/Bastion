#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


def setPlayerHP():
    @Name "[VishkarEvent]: set player HP"
    
    eventPlayer.setMaxHealth(100 * eventPlayer.sizeHealth + eventPlayer.heart_steel)
    wait(getServerLoad() / 100 * 0.032)
    if eventPlayer.getNormalizedHealth() == 1:
        goto lbl_0
    eventPlayer.setHealth(eventPlayer.getMaxHealth())
    lbl_0: