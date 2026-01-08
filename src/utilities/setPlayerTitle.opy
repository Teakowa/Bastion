#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


def setPlayerTitle():
    @Name "set player title"
    
    eventPlayer.tempIndices = playerTitleRelation[eventPlayer.playerTitleRelationIndex]
    eventPlayer.tempMapMatches = [player for player in mapTitleRelation if player[0] == eventPlayer.playerTitleRelationIndex]
    if len(eventPlayer.tempMapMatches) > 0:
        eventPlayer.tempMapIndices = [player[1] for player in eventPlayer.tempMapMatches]
        eventPlayer.tempIndices = eventPlayer.tempIndices.concat(eventPlayer.tempMapIndices)
    eventPlayer.playerTitles = [allTitle[player] for player in eventPlayer.tempIndices]
    eventPlayer.tempIndices = null
    eventPlayer.tempMapIndices = null
    eventPlayer.tempMapMatches = null