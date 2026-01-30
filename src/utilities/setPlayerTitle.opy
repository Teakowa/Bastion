#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

subroutine setPlayerTitle

def setPlayerTitle():
    @Name "set player title"
    
    # 1. 基础称号 (从通用数据库获取)
    eventPlayer.playerTitles = playerTitleRelation[eventPlayer.playerTitleRelationIndex]
    
    # 2. 查找并合并地图称号
    if eventPlayer.playerTitleRelationIndex in mapTitlePlayersByKey[MapTitleKey.PIONEER]: 
        eventPlayer.playerTitles.append(Title.PIONEER)

    if eventPlayer.playerTitleRelationIndex in mapTitlePlayersByKey[MapTitleKey.CONQUEROR]: 
        eventPlayer.playerTitles.append(Title.CONQUEROR)

    if eventPlayer.playerTitleRelationIndex in mapTitlePlayersByKey[MapTitleKey.DOMINATOR]: 
        eventPlayer.playerTitles.append(Title.DOMINATOR)
        
    # 3. 实例化 (Map ID to Object)
    eventPlayer.playerTitles = [allTitle[i] for i in eventPlayer.playerTitles]
