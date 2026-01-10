#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


def setPlayerTitle():
    @Name "set player title"
    
    # 1. 基础称号 (从通用数据库获取)
    eventPlayer.tempIndices = playerTitleRelation[eventPlayer.playerTitleRelationIndex]
    
    # 2. 查找并合并地图称号 (一行流)

    if titlePlayer[eventPlayer.playerTitleRelationIndex] in mtName:
        eventPlayer.playerTitles.append(mtTitles[mtName.index(titlePlayer[eventPlayer.playerTitleRelationIndex])])
        
    # 3. 最终实例化 (Map ID to Object)
    eventPlayer.playerTitles = [allTitle[i] for i in eventPlayer.playerTitles]
    
    eventPlayer.tempIndices = null
    eventPlayer.tempMapIndices = null
    eventPlayer.tempMapMatches = null