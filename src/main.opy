#!include "env/env.opy"
settings {
    "main": {
        "description": "随机事件 3.0 已上线\n!!!使用全英雄逃出生天!!!\n————————————————\n代码【SVMQK】  | 最近更新：26.0108.1\n\nowmod.net/2650\n\n企鹅聊天群：445152554\n\n原作［OW2 PASTION ESCAPE］",
        "modeName": "躲避堡垒3"
    },
    "lobby": {
        "mapRotation": "afterGame",
        "enableMatchVoiceChat": true,
        "team1Slots": 8,
        "team2Slots": 0,
        "spectatorSlots": 12,
        "returnToLobby": "never",
        "allowPlayersInQueue": true
    },
    "gamemodes": {
        "ctf": {
            "enabledMaps": [
                "ayutthaya"
            ],
            "flagScoreRespawnTime": 15,
            "flagReturnTime": 4,
            "flagDroppedLockTime": 5
        },
        "skirmish": {
            "disabledMaps": [
                "kingsRow",
                "workshopChamber",
                "workshopIsland",
                "workshopIslandNight",
                "workshopExpanse",
                "workshopExpanseNight",
                "workshopGreenScreen",
                "blizzWorld"
            ]
        },
        "general": {
            "enablePerks": true,
            "perkGeneration%": 500,
            "respawnTime%": 10,
            "healthPackRespawnTime%": 20,
            "enableEnemyHealthBars": false,
            "gamemodeStartTrigger": "manual",
            "heroLimit": "off",
            "enableKillCam": false
        }
    },
    "heroes": {
        "team1": {
            "bastion": {
                "health%": 150
            },
            "general": {
                "abilityCooldown%": 40
            }
        },
        "team2": {
            "bastion": {
                "secondaryFireCooldown%": 0,
                "secondaryFireKb%": 150,
                "projectileSpeed%": 175,
                "enableInfiniteAmmo": true,
                "health%": 500
            },
            "general": {
                "damageReceived%": 25,
                "abilityCooldown%": 0,
                "health%": 500
            }
        },
        "allTeams": {
            "dva": {
                "ability1Cooldown%": 125
            },
            "hanzo": {
                "ability3Cooldown%": 60,
                "ability1Cooldown%": 0
            },
            "cassidy": {
                "ability1Cooldown%": 50
            },
            "echo": {
                "ability1Cooldown%": 33
            },
            "mercy": {
                "ability1Cooldown%": 67
            },
            "orisa": {
                "ability1Cooldown%": 50,
                "ability2Cooldown%": 70
            },
            "ana": {
                "ability1Cooldown%": 67
            },
            "baptiste": {
                "healingReceived%": 50,
                "projectileSpeed%": 500,
                "projectileGravity%": 0,
                "health%": 50,
                "ability2Cooldown%": 20
            },
            "brigitte": {
                "secondaryFireRechargeRate%": 500,
                "shieldBashCooldown%": 80
            },
            "torbjorn": {
                "weaponsEnabled": "hammer",
                "ability2Cooldown%": 20,
                "ability2Duration%": 40,
                "enableAbility1": false
            },
            "doomfist": {
                "ability1Cooldown%": 50,
                "secondaryFireCooldown%": 80,
                "ability2Cooldown%": 80
            },
            "juno": {
                "ability1Cooldown%": 67
            },
            "zarya": {
                "jumpVerticalSpeed%": 140,
                "ability2Cooldown%": 56,
                "ability1Cooldown%": 46,
                "secondaryFireKb%": 200
            },
            "reaper": {
                "ability1Cooldown%": 75,
                "ability2Cooldown%": 300
            },
            "mauga": {
                "ability1Cooldown%": 80
            },
            "winston": {
                "ability1Cooldown%": 80,
                "ability2Cooldown%": 83
            },
            "genji": {
                "ability2Cooldown%": 75
            },
            "junkrat": {
                "ability1Cooldown%": 100,
                "ability1Kb%": 100
            },
            "tracer": {
                "ability2Cooldown%": 50,
                "ability1Cooldown%": 50
            },
            "lifeweaver": {
                "ability2Cooldown%": 84,
                "primaryFireRange%": 200,
                "secondaryFireCooldown%": 84
            },
            "wreckingBall": {
                "enableRollOnly": false
            },
            "zenyatta": {
                "healingDealt%": 200,
                "health%": 150
            },
            "symmetra": {
                "ability2Cooldown%": 66,
                "enableAbility1": false
            },
            "mei": {
                "ability2Cooldown%": 67
            },
            "ashe": {
                "ability2Cooldown%": 50,
                "ability1Cooldown%": 40
            },
            "moira": {
                "ability1Cooldown%": 50,
                "ability2MaxHealing%": 500
            },
            "reinhardt": {
                "ability1Cooldown%": 75
            },
            "sigma": {
                "ability1Cooldown%": 75,
                "secondaryFireCooldown%": 50,
                "ability2Cooldown%": 50
            },
            "roadhog": {
                "secondaryFireCooldown%": 100
            },
            "kiriko": {
                "ability1Distance%": 143,
                "ability2Cooldown%": 43
            },
            "hazard": {
                "ability2Cooldown%": 92
            },
            "sombra": {
                "ability2Cooldown%": 0
            },
            "widowmaker": {
                "enableInfiniteUlt": true
            },
            "general": {
                "combatUltGen%": 0,
                "enableInfiniteAmmo": true,
                "passiveUltGen%": 0
            }
        }
    },
    "workshop": {
        "自动重开时间间隔（小时）": 2,
        "难度": [
            4
        ]
    }
}

#Global variables

globalvar bastionPosition 0
globalvar resetPosition 2
globalvar creditsPosition 3
globalvar endPosition 4
globalvar heroList 5
globalvar missingHeroes 6
globalvar maxDeath 7
globalvar kills 9
globalvar bastionBotTargetPrefer 10
globalvar difficulty 11
globalvar scoreboardArray 12
globalvar firstPlace 13
globalvar secondPlace 14
globalvar thirdPlace 15
globalvar textIDs 16
globalvar savedIndex 17
globalvar savedHero 18
globalvar savedDeaths 19
globalvar savedIsWinner 20
globalvar savedSkipCount 21
globalvar savedJoinTime 22
globalvar devList 23
globalvar __currentMap___ 24
globalvar dmgReduction 25
globalvar blackList 26
globalvar rebootTime 27
globalvar targetPlayer 28
globalvar targetPlayerIndex 29
globalvar thirdPersonPosition 30
globalvar debugMode 31
globalvar debugInfo 32
globalvar devPlayer 33
globalvar bastionBotSeconFire 34
globalvar difficultyText 35
globalvar controlCenterPosition 36
globalvar controlJumpPosition 37
globalvar controlRespawnPosition 38
globalvar controlRespawnAxis 39
globalvar controlRespawnAxisThreshold 40
globalvar mapTitleRelation 43
globalvar allTitle 44
globalvar titlePlayer 45
globalvar playerTitleRelation 47
globalvar rgbList 48
globalvar savedWinnerTime 49
globalvar savedA36TGrenade 51
globalvar savedA36TGrenadeHit 52
globalvar savedA36TGrenadeDmg 53
globalvar savedA36TGrenadeAlive 54
globalvar turnSpeedMultiplier 55
globalvar berserkerTime 56
globalvar eventId 57
globalvar eventDuration 58
globalvar eventName 59
globalvar eventDesc 60
globalvar eventCount 61
globalvar eventType 63
globalvar eventDurationHud 64
globalvar hashTag 69
globalvar dlcVishkarEvent 71
globalvar vishkarEventActivated 72
globalvar globalEvent 79
globalvar globalEventId 80
globalvar buffEvent 81
globalvar buffEventId 82
globalvar debuffEvent 83
globalvar debuffEventId 84
globalvar mechEvent 85
globalvar mechEventId 86
globalvar obstrucVis 89
globalvar heroColor 90
globalvar breathRed 91
globalvar breathPurple 92
globalvar breathBlue 93
globalvar breathOrange 94
globalvar breathGold 95
globalvar springBoardPosition 100
globalvar portalPosition 101
globalvar heroGender 102
globalvar __currentMapText___ 105
globalvar __currentPioneerText___ 106
globalvar __currentMapPioneerText___ 107
globalvar antiCrashActivated 127


#Player variables

playervar heroNumber 0
playervar progressionDeathCount 1
playervar skipCount 2
playervar isWinner 3
playervar dmgReduc 4
playervar anaSleepLimit 5
playervar temp 6
playervar attacker 7
playervar target 9
playervar aimPosition 10
playervar turnSpeed 11
playervar tempAimPosition 12
playervar nearestTargetOutOfLoS 13
playervar dvaStart 14
playervar healID 15
playervar isInPosition 16
playervar rainbowOff 17
playervar runDeathCount 18
playervar joinTime 19
playervar menu 20
playervar menuTextID 21
playervar isDev 22
playervar debugInfo 23
playervar third 24
playervar hasNano 25
playervar nanoEffect 26
playervar invincible 27
playervar invincibleEffect 28
playervar isAirWalkEnabled 29
playervar isPortalEnabled 30
playervar controlCenterIndex 31
playervar controlJumpIndex 32
playervar controlPlayerRespawnPosition 33
playervar playerTitleAndColor 37
playervar titleTextID 38
playervar rgb_vect 39
playervar info_pvar 40
playervar rgb_activated 41
playervar winnerTime 42
playervar playerTitles 43
playervar playerTitleIndex 44
playervar playerTitleRelationIndex 45
playervar A36TGrenade 50
playervar A36TGrenadeHit 51
playervar A36TGrenadeDmg 52
playervar A36TGrenadeAlive 53
playervar ignoreObstrucVis 57
playervar eventMission 58
playervar eventEffectPlayers 59
playervar eventId 60
playervar eventLastId 61
playervar eventType 62
playervar eventDuration 63
playervar eventName 64
playervar eventDesc 65
playervar eventCount 66
playervar eventLucky 67
playervar eventEffect 68
playervar categoryRoll 69
playervar combatRegen 70
playervar mod_speed_event 71
playervar mod_speed_perma 72
playervar mod_heal_event 74
playervar heal_recv 75
playervar mod_dmg_taken 80
playervar mod_dmg_perma 81
playervar healthId 84
playervar hack_timer 85
playervar targetWeight 86
playervar targetSilence 87
playervar hudTextId 88
playervar heart_steel 89
playervar obstrucVis 90
playervar sizeHealth 91
playervar eventDurationHud 92
playervar possess 93
playervar possessed 94
playervar empProMax 95
playervar setPlayerHP 96
playervar dlcTimeChallenge 97
playervar knockback 99
playervar tempIndices 110
playervar tempMapIndices 111
playervar tempMapMatches 112


#Subroutine names

subroutine savePlayerData 0
subroutine progressHero 1
subroutine setDifficulty 2
subroutine setThirdPerson 3
subroutine setPlayerTitle 4
subroutine setPlayerEvent 5
subroutine clearPlayerEvent 6
subroutine updatePlayerStats 7
subroutine stopCombatRegen 8
subroutine setPlayerHP 9
subroutine setEventDuration 10
subroutine resetPlayerCD 12
subroutine clearEventEffect 14
subroutine createBastionBot 17


#Activated extensions

#!extension buffStatusEffects
#!extension debuffStatusEffects
#!extension buffAndDebuffSounds
#!extension energyExplosionEffects
#!extension spawnMoreDummyBots

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "声明：本模式代码不得用于商业用途":
    @Disabled
    @Delimiter

rule "在模式描述中保留原作者署名与原模式代码的前提下，你可基于本模式及其代码进行二次创作与发布":
    @Disabled
    @Delimiter

#!include "blacklist/init.opy"

#!include "utilities/removeFromBlacklist.opy"
    
#!include "env/game.opy"

#!include "title/title-cn.opy"

#!include "events/check-flag.opy"

#!include "events/init.opy"

#!include "utilities/setPlayerEvent.opy"

#!include "utilities/clearPlayerEvent.opy"

#!include "utilities/setPlayerHP.opy"

#!include "utilities/setEventDuration.opy"

#!include "utilities/resetPlayerCD.opy"

#!include "utilities/updatePlayerStats.opy"

#!include "utilities/stopCombatRegen.opy"

#!include "utilities/createBastionBot.opy"

#!include "utilities/setPlayerTitle.opy"

#!include "utilities/anticrash.opy"

#!include "events/get_player_event.opy"

# Maps
#!include "map/setup_all_map.opy"

#!include "bastion/init.opy"

#!include "utilities/playerRegen.opy"

rule "players pick up speed while not targeted for 3 seconds":
    @Event eachPlayer
    @Team 1
    @Condition all([evalOnce(dlcVishkarEvent) == false, getPlayersInRadius(eventPlayer, 60, Team.2, LosCheck.SURFACES)[0] == false, eventPlayer.isMoving()]) == true
    
    wait(3, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setMoveSpeed(160)
    waitUntil(getPlayersInRadius(eventPlayer, 60, Team.2, LosCheck.SURFACES)[0] or not eventPlayer.isMoving(), MAX_TIME)
    eventPlayer.setMoveSpeed(100)


rule "player deaths are counted manually rather than relying on in-game statistics":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.isWinner == false
    
    wait(0.5 * getServerLoad() / 100)
    eventPlayer.runDeathCount++
    if eventPlayer in savedIndex:
        wait(0.032)
        savedDeaths[savedIndex.index("{0}".format(eventPlayer))] = eventPlayer.runDeathCount
    eventPlayer.setFacing(directionTowards(eventPlayer.getEyePosition(), endPosition.getPosition() if evalOnce(controlRespawnPosition) == null else controlJumpPosition[0].getPosition()), Relativity.TO_WORLD)


rule "when a mercy might rez, respawn time is increased":
    @Event playerDied
    @Team 1
    @Condition isHeroBeingPlayed(Hero.MERCY, Team.1) == true
    @Condition eventPlayer.controlPlayerRespawnPosition == null
    
    if evalOnce(dlcVishkarEvent) and eventPlayer.eventType == 0 and eventPlayer.eventId == 8:
        return
    if any([distance(eventPlayer.getPosition(), player.getPosition()) < 40 and player.isAlive() and player.getAbilityCooldown(Button.ABILITY_2) < 8 for player in getPlayersOnHero(Hero.MERCY, Team.1)]):
        bigMessage(eventPlayer, "附近有 天使 等待复活...")
        eventPlayer.disableRespawn()
        wait(4)
        eventPlayer.enableRespawn()

#!include "heros/all_hero.opy"

#!include "utilities/hashtag.opy"

rule "when players reaches the end and not respawn at first respawn point, they move to the first respawn point.":
    @Event eachPlayer
    @Team 1
    @Condition evalOnce(controlRespawnPosition) != null
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isInSpawnRoom() == true
    @Condition (any([controlRespawnAxis == 0 and distance(vect(eventPlayer.getPosition().x, 0, 0), vect(controlRespawnPosition[eventPlayer.controlJumpIndex].x, 0, 0)) >= controlRespawnAxisThreshold, controlRespawnAxis == 1 and distance(vect(0, eventPlayer.getPosition().y, 0), vect(0, controlRespawnPosition[eventPlayer.controlJumpIndex].y, 0)) >= controlRespawnAxisThreshold, controlRespawnAxis == 2 and distance(vect(0, 0, eventPlayer.getPosition().z), vect(0, 0, controlRespawnPosition[eventPlayer.controlJumpIndex].z)) >= controlRespawnAxisThreshold])) == true
    
    eventPlayer.teleport(controlRespawnPosition[eventPlayer.controlJumpIndex])
    eventPlayer.setFacing(directionTowards(eventPlayer.getEyePosition(), controlJumpPosition[eventPlayer.controlJumpIndex].getPosition()), Relativity.TO_WORLD)
    wait(0.032)


rule "when a player reaches the control jump point, they move on to the next map":
    @Event eachPlayer
    @Team 1
    @Condition evalOnce(controlRespawnPosition) != null
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isInSpawnRoom() != true
    @Condition eventPlayer.isMoving() == true
    #@Condition eventPlayer.getPosition().y >= controlJumpPosition[eventPlayer.controlJumpIndex].y
    #@Condition distance(eventPlayer.getPosition() * vect(1, 0, 1), controlJumpPosition[eventPlayer.controlJumpIndex] * vect(1, 0, 1)) <= 4
    
    wait(0.032, Wait.ABORT_WHEN_FALSE)
    wait(0.2)
    if all([eventPlayer.getPosition().y >= controlJumpPosition[eventPlayer.controlJumpIndex].y, distance(eventPlayer.getPosition() * vect(1, 0, 1), controlJumpPosition[eventPlayer.controlJumpIndex] * vect(1, 0, 1)) <= 4]):
        if controlJumpPosition[eventPlayer.controlJumpIndex] == null:
            goto lbl_0
        eventPlayer.controlJumpIndex++
        wait()
        if any([eventPlayer.hasStatus(Status.PHASED_OUT), eventPlayer.hasStatus(Status.INVINCIBLE)]):
            goto lbl_1
        eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 0.5)
        eventPlayer.setStatusEffect(null, Status.INVINCIBLE, 0.5)
        lbl_1:
        eventPlayer.teleport(controlRespawnPosition[eventPlayer.controlJumpIndex])
        eventPlayer.setFacing(directionTowards(eventPlayer.getEyePosition(), controlJumpPosition[eventPlayer.controlJumpIndex].getPosition()), Relativity.TO_WORLD)
        wait(2.16)
    lbl_0:
    loop()

rule "when a player reaches the end, they move on to the next hero or win if they're bastion":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.getPosition().y >= endPosition.y
    @Condition distance(eventPlayer.getPosition() * vect(1, 0, 1), endPosition * vect(1, 0, 1)) <= 4
    
    eventPlayer.respawn()
    wait(0.032)
    if controlRespawnPosition == null:
        goto lbl_0
    eventPlayer.controlJumpIndex = 0
    eventPlayer.teleport(controlRespawnPosition[0])
    wait(0.032)
    eventPlayer.setFacing(directionTowards(eventPlayer.getEyePosition(), controlJumpPosition[0].getPosition()), Relativity.TO_WORLD)
    lbl_0:
    if eventPlayer.heroNumber + 1 < len(heroList) and eventPlayer.getHero() == heroList[eventPlayer.heroNumber]:
        progressHero()
    elif eventPlayer.getHero() == heroList.last() and not eventPlayer.isWinner:
        eventPlayer.isWinner = true
        eventPlayer.winnerTime = evalOnce(getTotalTimeElapsed()) - eventPlayer.joinTime
        if any([eventPlayer.dmgReduc, eventPlayer.invincible, eventPlayer.isPortalEnabled, eventPlayer.isAirWalkEnabled]):
            goto lbl_1
        bigMessage(getPlayers(Team.1), "祝贺 {0} 以 {1} 耗时 {2} 通关!".format(eventPlayer, "{0} 次阵亡 & {1} 次跳过".format(eventPlayer.runDeathCount, eventPlayer.skipCount), "{0}{1}{2}".format("{0}小时".format(floor(eventPlayer.winnerTime / 3600)) if eventPlayer.winnerTime != null and eventPlayer.winnerTime >= 3600 else "", "{0}分".format(floor(eventPlayer.winnerTime % 3600 / 60)) if eventPlayer.winnerTime != null and eventPlayer.winnerTime >= 60 else "", "{0}秒".format(floor(eventPlayer.winnerTime % 60)) if eventPlayer.winnerTime != null else "0秒")))
        lbl_1:
        smallMessage(eventPlayer, "  {0} 你已通关，可以加入聊天群 发送截图 获取通关称号".format(iconString(Icon.CHECKMARK)))
        savePlayerData()


rule "winners earn their ult once per minute":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isWinner != false
    @Condition eventPlayer.getUltCharge() < 100
    @Condition eventPlayer.isUsingUltimate() == false
    
    eventPlayer.setUltCharge(eventPlayer.getUltCharge() + 5)
    wait(3)
    if ruleCondition:
        loop()

rule "update scoreboard every few seconds":
    @Condition getPlayers(Team.1)[0] != false
    @Disabled
    
    scoreboardArray = sorted([player for player in getPlayers(Team.1) if not player.isWinner], lambda i: 0 - i.heroNumber)
    firstPlace = scoreboardArray[0]
    secondPlace = scoreboardArray[1]
    thirdPlace = scoreboardArray[2]
    wait(getAverageServerLoad() / 50)
    if ruleCondition:
        loop()

#!include "effects/init.opy"
#!include "effects/nano.opy"
#!include "effects/player.opy"

#!include "player/status.opy"
#!include "player/init.opy"
#!include "title/init.opy"


rule "auto reboot":
    @Condition getTotalTimeElapsed() >= rebootTime - 60
    
    bigMessage(getAllPlayers(), "游戏将在 1 分钟后自动重开")
    wait(60)
    restartMatch()

#!include "utilities/devTool.opy"

#!include "events/effect.opy"