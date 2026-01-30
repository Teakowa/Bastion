#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

subroutine setDifficulty

def setDifficulty():
    @Name "initialize difficulty effects text"
    
    wait(getAverageServerLoad() / 100)
    if true:
        goto loc+[18, 0, 3, 6, 9, 12, 15][1 + [0, 1, 2, 3, 4, 5].index(difficulty)]
        difficultyText[0] = "简单"
        difficultyText[1] = Color.GREEN
    else:
        difficultyText[0] = "一般"
        difficultyText[1] = Color.LIME_GREEN
    else:
        difficultyText[0] = "困难"
        difficultyText[1] = Color.YELLOW
    else:
        difficultyText[0] = "专家"
        difficultyText[1] = Color.ORANGE
    else:
        difficultyText[0] = "传奇"
        difficultyText[1] = Color.RED
    else:
        difficultyText[0] = "地狱"
        difficultyText[1] = rgb(118, 93, 189)
    else: