#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "Init Achievement Data":
    waitUntil(len(allTitle) > 0, MAX_TIME)
    challengeTitleIds = [
        44,  # 红包收藏家 单局游戏拾取 88 个红包
        45,  # 好运来 单局游戏累计触发 50 次增益事件
        46,  # 千里独行 累计触发 20 次“一马当先”事件，并在触发该事件的对局中成功通关
        48, # 我不会放过你的酸不辣 累计拾取 18 个「红包刺客」
    ]


rule "[VishkarEvent]: Challenge 44 Track":
    @Event eachPlayer
    @Team 1
    @Condition len(challengeTitleIds) != 0
    @Condition dlcVishkarEvent == true
    @Condition eventPlayer.eventCount[0] + eventPlayer.eventCount[1] + eventPlayer.eventCount[2] >= 88
    @Condition 44 not in eventPlayer.earnedAchievements
    
    eventPlayer.unlockAchievement(44)

rule "[VishkarEvent]: Challenge 45 Track":
    @Event eachPlayer
    @Team 1
    @Condition len(challengeTitleIds) != 0
    @Condition dlcVishkarEvent == true
    @Condition eventPlayer.eventCount[0] >= 50
    @Condition 45 not in eventPlayer.earnedAchievements

    eventPlayer.unlockAchievement(45)

rule "[VishkarEvent]: Challenge 46 Track":
    @Event eachPlayer
    @Team 1
    @Condition len(challengeTitleIds) != 0
    @Condition dlcVishkarEvent == true
    @Condition eventPlayer.dlcTimeChallenge[1] >= 20
    @Condition 46 not in eventPlayer.earnedAchievements
    

    eventPlayer.unlockAchievement(46)

rule "[VishkarEvent]: Challenge 48 Track":
    @Event eachPlayer
    @Team 1
    @Condition dlcVishkarEvent == true
    @Condition len(challengeTitleIds) != 0
    @Condition eventPlayer.dlcTimeChallenge[2] >= 18
    @Condition 48 not in eventPlayer.earnedAchievements

    eventPlayer.unlockAchievement(48)
