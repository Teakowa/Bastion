#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


def setPlayerTitle():
    @Name "set player title"
    
    # 1. 基础称号 (从通用数据库获取)
    eventPlayer.tempIndices = playerTitleRelation[eventPlayer.playerTitleRelationIndex]
    
    # 2. 查找并合并地图称号 (一行流)
    # 逻辑：如果玩家名(titlePlayer[index]) 在 mtName 中，则把对应的 mtTitles 加进去
    # 利用 OverPy 的 Python 表达式能力
    if titlePlayer[eventPlayer.playerTitleRelationIndex] in mtName:
        eventPlayer.playerTitles.append(mtTitles[mtName.index(titlePlayer[eventPlayer.playerTitleRelationIndex])])
        
    # 3. 最终实例化 (Map ID to Object)
    # 这一步必须小心，因为我们刚刚把 playerTitles 当作了 ID 容器
    # 现在我们要把它变成 Object 容器
    eventPlayer.playerTitles = [allTitle[i] for i in eventPlayer.playerTitles]
    
    eventPlayer.tempIndices = null
    eventPlayer.tempMapIndices = null
    eventPlayer.tempMapMatches = null