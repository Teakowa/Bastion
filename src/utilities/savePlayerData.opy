#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

def savePlayerData():
    @Name "save player data if the player has pa\ufeffssed round 2"
    
    wait(getServerLoad() / 100 * 0.5)
    if eventPlayer.heroNumber > 2:
        #We're saving data as a string, because although we can't hold entity id's, we can hold entity names as string.
        if not "{0}".format(eventPlayer) in savedIndex:
            savedIndex.append("{0}".format(eventPlayer))
        wait(getServerLoad() / 100 * 0.5)
        savedHero[savedIndex.index("{0}".format(eventPlayer))] = eventPlayer.heroNumber
        wait(getServerLoad() / 100 * 0.5)
        savedDeaths[savedIndex.index("{0}".format(eventPlayer))] = eventPlayer.runDeathCount
        wait(getServerLoad() / 100 * 0.5)
        savedIsWinner[savedIndex.index("{0}".format(eventPlayer))] = eventPlayer.isWinner
        wait(getServerLoad() / 100 * 0.5)
        savedSkipCount[savedIndex.index("{0}".format(eventPlayer))] = eventPlayer.skipCount
        wait(getServerLoad() / 100 * 0.5)
        if eventPlayer.winnerTime == null:
            goto lbl_0
        savedWinnerTime[savedIndex.index("{0}".format(eventPlayer))] = eventPlayer.winnerTime
        lbl_0:
        wait(getServerLoad() / 100 * 0.5)
        savedA36TGrenade[savedIndex.index("{0}".format(eventPlayer))] = eventPlayer.A36TGrenade
        wait(getServerLoad() / 100 * 0.5)
        savedA36TGrenadeHit[savedIndex.index("{0}".format(eventPlayer))] = eventPlayer.A36TGrenadeHit
        wait(getServerLoad() / 100 * 0.5)
        savedA36TGrenadeDmg[savedIndex.index("{0}".format(eventPlayer))] = eventPlayer.A36TGrenadeDmg
        wait(getServerLoad() / 100 * 0.5)
        savedA36TGrenadeAlive[savedIndex.index("{0}".format(eventPlayer))] = eventPlayer.A36TGrenadeAlive
        savedJoinTime[savedIndex.index("{0}".format(eventPlayer))] = eventPlayer.joinTime
        smallMessage(eventPlayer, "  你的挑战进度已保存")
        wait(2)
        if eventPlayer != hostPlayer:
            goto lbl_1
        smallMessage(hostPlayer, "  如果当前游戏重开，所有人的进度数据将被清空")
        lbl_1:
        wait(2)
        if random.randint(0, 2) == 0:
            smallMessage(eventPlayer, "  为了保证房间处于公开状态，请确保房主赞赏等级为 3 级或以上")
