#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

subroutine unlockAchievement

macro Player.unlockAchievement(titleId):
    eventPlayer.tempUnlockId = titleId
    unlockAchievement()

def unlockAchievement():
    @Name "Subroutine: UnlockAchievement"

    if eventPlayer.tempUnlockId == null or eventPlayer.tempUnlockId in eventPlayer.earnedAchievements:
        return

    eventPlayer.earnedAchievements.append(eventPlayer.tempUnlockId)

    playEffect(eventPlayer, DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer, 10)
    
    smallMessage(eventPlayer, "  解锁成就：{0}".format(allTitle[eventPlayer.tempUnlockId]))
