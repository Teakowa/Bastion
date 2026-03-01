#!mainFile "../../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

globalvar hashTagHostMonitorReady
globalvar hashTagVerifyLibrary
globalvar hashTagVerifyHeroPool
globalvar hashTagVerifyFailed
globalvar hashTagVerifyNotifyDone
globalvar hashTagHostSeenHeroes
globalvar hashTagHostHpObservedSum
globalvar hashTagHostHpExpectedSum
globalvar hashTagHostRiskScore
globalvar hashTagHostLastRiskDecayAt
globalvar hashTagHostLastRiskAddAt
globalvar hashTagHostLastCdCheckAt
# ──────────────────────────────────────────────
# 常量（若 hero settings 变更，需同步调整阈值）
# ──────────────────────────────────────────────
#!define HTAG_HOST_SCAN_DT                0.25
#!define HTAG_HOST_CD_SAMPLE_GAP          1.25
#!define HTAG_HOST_RISK_THRESHOLD         6
#!define HTAG_HOST_RISK_DECAY_DT          1.50
#!define HTAG_HOST_RISK_ADD_GAP           0.75
#!define HTAG_HOST_HP_SINGLE_TOL          30
#!define HTAG_HOST_HP_SUM_TOL_PER_HERO    20
#!define HTAG_HOST_HP_MIN_HERO_COUNT      2
#!define HTAG_KIRI_HP_BASE                225
#!define HTAG_KIRI_CD2_MIN                3.75
#!define HTAG_KIRI_CD2_MAX                4.50
#!define HTAG_TRACER_HP_BASE              175
#!define HTAG_TRACER_CD2_MIN              5.30
#!define HTAG_TRACER_CD2_MAX              6.40
#!define HTAG_MEI_HP_BASE                 300
#!define HTAG_MEI_CD2_MIN                 7.20
#!define HTAG_MEI_CD2_MAX                 8.70
#!define HTAG_ASHE_HP_BASE                250
#!define HTAG_ASHE_CD2_MIN                4.40
#!define HTAG_ASHE_CD2_MAX                5.40
#!define HTAG_GENJI_HP_BASE               250
#!define HTAG_GENJI_CD2_MIN               5.30
#!define HTAG_GENJI_CD2_MAX               6.40
#!define HTAG_TORB_HP_BASE                250
#!define HTAG_TORB_CD2_MIN                1.70
#!define HTAG_TORB_CD2_MAX                2.40

# ──────────────────────────────────────────────
# 规则1：初始化 host-only 长期校验参数
# ──────────────────────────────────────────────
rule "hashTag | Host Monitor Init":
    @Event global
    @Condition hashTag == true
    @Condition getTotalTimeElapsed() > 5
    @Condition hashTagHostMonitorReady != true

    hashTagHostMonitorReady = true
    hashTagVerifyFailed = false
    hashTagVerifyNotifyDone = false
    hashTagHostSeenHeroes = []
    hashTagHostHpObservedSum = 0
    hashTagHostHpExpectedSum = 0
    hashTagHostRiskScore = 0
    hashTagHostLastRiskDecayAt = getTotalTimeElapsed()
    hashTagHostLastRiskAddAt = 0
    hashTagHostLastCdCheckAt = 0
    hashTagVerifyLibrary = [
        [Hero.KIRIKO, HTAG_KIRI_HP_BASE, HTAG_KIRI_CD2_MIN, HTAG_KIRI_CD2_MAX],
        [Hero.TRACER, HTAG_TRACER_HP_BASE, HTAG_TRACER_CD2_MIN, HTAG_TRACER_CD2_MAX],
        [Hero.MEI, HTAG_MEI_HP_BASE, HTAG_MEI_CD2_MIN, HTAG_MEI_CD2_MAX],
        [Hero.ASHE, HTAG_ASHE_HP_BASE, HTAG_ASHE_CD2_MIN, HTAG_ASHE_CD2_MAX],
        [Hero.GENJI, HTAG_GENJI_HP_BASE, HTAG_GENJI_CD2_MIN, HTAG_GENJI_CD2_MAX],
        [Hero.TORBJORN, HTAG_TORB_HP_BASE, HTAG_TORB_CD2_MIN, HTAG_TORB_CD2_MAX]
    ]
    hashTagVerifyHeroPool = [Hero.KIRIKO, Hero.TRACER, Hero.MEI, Hero.ASHE, Hero.GENJI, Hero.TORBJORN]

# ──────────────────────────────────────────────
# 规则2：Host 血量签名（长期运行）
# 仅在“非事件窗口”采样，扣除心之钢贡献后累计英雄净血量
# ──────────────────────────────────────────────
rule "hashTag | Host HP Signature":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition hashTag == true
    @Condition hashTagHostMonitorReady == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.eventId == -1
    @Condition eventId == -1
    @Condition eventPlayer.sizeHealth == 1
    @Condition eventPlayer.getHero() in hashTagVerifyHeroPool == true

    hashTagHostRule = [rule for rule in hashTagVerifyLibrary if rule[0] == eventPlayer.getHero()][0]
    hashTagHostNetHp = evalOnce(eventPlayer.getMaxHealth() - eventPlayer.heart_steel * EVT_8_HP_PERCENT_PER_STACK)

    if all([
            hashTagHostNetHp > hashTagHostRule[1] + HTAG_HOST_HP_SINGLE_TOL,
            getTotalTimeElapsed() - hashTagHostLastRiskAddAt >= HTAG_HOST_RISK_ADD_GAP
        ]):
        hashTagHostRiskScore += 2
        hashTagHostLastRiskAddAt = getTotalTimeElapsed()
        logToInspector("hash host hp anomaly: {0} = {1}".format(eventPlayer.getHero(), hashTagHostNetHp))

    if eventPlayer.getHero() not in hashTagHostSeenHeroes:
        hashTagHostSeenHeroes.append(eventPlayer.getHero())
        hashTagHostHpObservedSum += hashTagHostNetHp
        hashTagHostHpExpectedSum += hashTagHostRule[1]

        if all([
                len(hashTagHostSeenHeroes) >= HTAG_HOST_HP_MIN_HERO_COUNT,
                hashTagHostHpObservedSum > hashTagHostHpExpectedSum + HTAG_HOST_HP_SUM_TOL_PER_HERO * len(hashTagHostSeenHeroes),
                getTotalTimeElapsed() - hashTagHostLastRiskAddAt >= HTAG_HOST_RISK_ADD_GAP
            ]):
            hashTagHostRiskScore += 2
            hashTagHostLastRiskAddAt = getTotalTimeElapsed()
            logToInspector("hash host hp signature anomaly: {0}/{1}".format(hashTagHostHpObservedSum, hashTagHostHpExpectedSum))

    wait(HTAG_HOST_SCAN_DT)

# ──────────────────────────────────────────────
# 规则3：Host 技能2冷却抽检（仅少量英雄）
# ──────────────────────────────────────────────
rule "hashTag | Host CD Sample":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition hashTag == true
    @Condition hashTagHostMonitorReady == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.eventId == -1
    @Condition eventId == -1
    @Condition eventPlayer.sizeHealth == 1
    @Condition eventPlayer.getHero() in hashTagVerifyHeroPool == true
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 0
    @Condition getTotalTimeElapsed() - hashTagHostLastCdCheckAt >= HTAG_HOST_CD_SAMPLE_GAP

    hashTagHostLastCdCheckAt = getTotalTimeElapsed()
    hashTagHostRule = [rule for rule in hashTagVerifyLibrary if rule[0] == eventPlayer.getHero()][0]
    eventPlayer.temp = evalOnce(eventPlayer.getAbilityCooldown(Button.ABILITY_2))

    if eventPlayer.temp < hashTagHostRule[2] or eventPlayer.temp > hashTagHostRule[3]:
        if getTotalTimeElapsed() - hashTagHostLastRiskAddAt >= HTAG_HOST_RISK_ADD_GAP:
            hashTagHostRiskScore += 2
            hashTagHostLastRiskAddAt = getTotalTimeElapsed()
        logToInspector("hash host cd anomaly: {0} cd2 = {1}".format(eventPlayer.getHero(), eventPlayer.temp))

rule "hashTag | Host Risk Decay":
    @Event global
    @Condition hashTag == true
    @Condition hashTagHostMonitorReady == true
    @Condition hashTagHostRiskScore > 0
    @Condition getTotalTimeElapsed() - hashTagHostLastRiskDecayAt >= HTAG_HOST_RISK_DECAY_DT

    hashTagHostRiskScore -= 1
    hashTagHostLastRiskDecayAt = getTotalTimeElapsed()

rule "hashTag | Host Risk Fail":
    @Event global
    @Condition hashTag == true
    @Condition hashTagHostMonitorReady == true
    @Condition hashTagVerifyFailed != true
    @Condition hashTagHostRiskScore >= HTAG_HOST_RISK_THRESHOLD

    hashTag = false
    hashTagVerifyFailed = true
    logToInspector("hash failed by host monitor. risk={0}".format(hashTagHostRiskScore))

rule "hashTag | Verify Failed Handling":
    @Event global
    @Condition hashTagVerifyFailed == true
    @Condition hashTagVerifyNotifyDone != true

    hashTagVerifyNotifyDone = true
    bigMessage(getAllPlayers(), STR_MSG_HASHTAG_VERIFY_FAILED_BIG.format(iconString(Icon.WARNING)))
    smallMessage(getAllPlayers(), STR_MSG_HASHTAG_VERIFY_FAILED_HINT.format(iconString(Icon.WARNING)))
    wait(8)
    restartMatch()

rule "Hashtag":
    @Condition hashTag == true
    @Condition vishkarEventActivated == true
    @Condition getTotalTimeElapsed() > 125
    @Condition any([
            len(buffEventId) < BUFF_EVENT_ID_COUNT, 
            len(debuffEventId) < DEBUFF_EVENT_ID_COUNT, 
            len(mechEventId) < MECH_EVENT_ID_COUNT
        ]) == true
    
    wait()
    hashTag = false
