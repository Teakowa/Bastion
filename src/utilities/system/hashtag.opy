#!mainFile "../../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

globalvar hashTagVerifyLibrary
globalvar hashTagRuntime
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
#!define HTAG_RT_READY                    0
#!define HTAG_RT_RISK_SCORE               1
#!define HTAG_RT_LAST_RISK_DECAY          2
#!define HTAG_RT_LAST_RISK_ADD            3
#!define HTAG_RT_LAST_CD_CHECK            4
#!define HTAG_RT_SEEN_HEROES              5
#!define HTAG_RT_HP_OBS_SUM               6
#!define HTAG_RT_HP_EXPECT_SUM            7
#!define HTAG_RT_FAILED                   8
#!define HTAG_RT_NOTIFIED                 9
#!define HTAG_RT_HERO_POOL                10

# ──────────────────────────────────────────────
# 规则1：初始化 host-only 长期校验参数
# ──────────────────────────────────────────────
rule "hashTag | Host Monitor Init":
    @Event global
    @Condition hashTag == true
    @Condition getTotalTimeElapsed() > 5
    @Condition hashTagRuntime == null

    hashTagRuntime = [true, 0, getTotalTimeElapsed(), 0, 0, [], 0, 0, false, false, [Hero.KIRIKO, Hero.TRACER, Hero.MEI, Hero.ASHE, Hero.GENJI, Hero.TORBJORN]]
    hashTagVerifyLibrary = [
        [Hero.KIRIKO, HTAG_KIRI_HP_BASE, HTAG_KIRI_CD2_MIN, HTAG_KIRI_CD2_MAX],
        [Hero.TRACER, HTAG_TRACER_HP_BASE, HTAG_TRACER_CD2_MIN, HTAG_TRACER_CD2_MAX],
        [Hero.MEI, HTAG_MEI_HP_BASE, HTAG_MEI_CD2_MIN, HTAG_MEI_CD2_MAX],
        [Hero.ASHE, HTAG_ASHE_HP_BASE, HTAG_ASHE_CD2_MIN, HTAG_ASHE_CD2_MAX],
        [Hero.GENJI, HTAG_GENJI_HP_BASE, HTAG_GENJI_CD2_MIN, HTAG_GENJI_CD2_MAX],
        [Hero.TORBJORN, HTAG_TORB_HP_BASE, HTAG_TORB_CD2_MIN, HTAG_TORB_CD2_MAX]
    ]

# ──────────────────────────────────────────────
# 规则2：Host 血量签名（长期运行）
# 仅在“非事件窗口”采样，扣除心之钢贡献后累计英雄净血量
# ──────────────────────────────────────────────
rule "hashTag | Host HP Signature":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition hashTag == true
    @Condition hashTagRuntime != null
    @Condition hashTagRuntime[HTAG_RT_READY] == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.eventId == -1
    @Condition eventId == -1
    @Condition eventPlayer.sizeHealth == 1
    @Condition eventPlayer.getHero() in hashTagRuntime[HTAG_RT_HERO_POOL] == true

    hashTagHostRule = [rule for rule in hashTagVerifyLibrary if rule[0] == eventPlayer.getHero()][0]
    hashTagHostNetHp = evalOnce(eventPlayer.getMaxHealth() - eventPlayer.heart_steel * EVT_8_HP_PERCENT_PER_STACK)

    if all([
            hashTagHostNetHp > hashTagHostRule[1] + HTAG_HOST_HP_SINGLE_TOL,
            getTotalTimeElapsed() - hashTagRuntime[HTAG_RT_LAST_RISK_ADD] >= HTAG_HOST_RISK_ADD_GAP
        ]):
        hashTagRuntime[HTAG_RT_RISK_SCORE] += 2
        hashTagRuntime[HTAG_RT_LAST_RISK_ADD] = getTotalTimeElapsed()
        logToInspector("hash host hp anomaly: {0} = {1}".format(eventPlayer.getHero(), hashTagHostNetHp))

    if eventPlayer.getHero() not in hashTagRuntime[HTAG_RT_SEEN_HEROES]:
        hashTagRuntime[HTAG_RT_SEEN_HEROES].append(eventPlayer.getHero())
        hashTagRuntime[HTAG_RT_HP_OBS_SUM] += hashTagHostNetHp
        hashTagRuntime[HTAG_RT_HP_EXPECT_SUM] += hashTagHostRule[1]

        if all([
                len(hashTagRuntime[HTAG_RT_SEEN_HEROES]) >= HTAG_HOST_HP_MIN_HERO_COUNT,
                hashTagRuntime[HTAG_RT_HP_OBS_SUM] > hashTagRuntime[HTAG_RT_HP_EXPECT_SUM] + HTAG_HOST_HP_SUM_TOL_PER_HERO * len(hashTagRuntime[HTAG_RT_SEEN_HEROES]),
                getTotalTimeElapsed() - hashTagRuntime[HTAG_RT_LAST_RISK_ADD] >= HTAG_HOST_RISK_ADD_GAP
            ]):
            hashTagRuntime[HTAG_RT_RISK_SCORE] += 2
            hashTagRuntime[HTAG_RT_LAST_RISK_ADD] = getTotalTimeElapsed()
            logToInspector("hash host hp signature anomaly: {0}/{1}".format(hashTagRuntime[HTAG_RT_HP_OBS_SUM], hashTagRuntime[HTAG_RT_HP_EXPECT_SUM]))

    wait(HTAG_HOST_SCAN_DT)

# ──────────────────────────────────────────────
# 规则3：Host 技能2冷却抽检（仅少量英雄）
# ──────────────────────────────────────────────
rule "hashTag | Host CD Sample":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer == hostPlayer
    @Condition hashTag == true
    @Condition hashTagRuntime != null
    @Condition hashTagRuntime[HTAG_RT_READY] == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.eventId == -1
    @Condition eventId == -1
    @Condition eventPlayer.sizeHealth == 1
    @Condition eventPlayer.getHero() in hashTagRuntime[HTAG_RT_HERO_POOL] == true
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 0
    @Condition getTotalTimeElapsed() - hashTagRuntime[HTAG_RT_LAST_CD_CHECK] >= HTAG_HOST_CD_SAMPLE_GAP

    hashTagRuntime[HTAG_RT_LAST_CD_CHECK] = getTotalTimeElapsed()
    hashTagHostRule = [rule for rule in hashTagVerifyLibrary if rule[0] == eventPlayer.getHero()][0]
    eventPlayer.temp = evalOnce(eventPlayer.getAbilityCooldown(Button.ABILITY_2))

    if eventPlayer.temp < hashTagHostRule[2] or eventPlayer.temp > hashTagHostRule[3]:
        if getTotalTimeElapsed() - hashTagRuntime[HTAG_RT_LAST_RISK_ADD] >= HTAG_HOST_RISK_ADD_GAP:
            hashTagRuntime[HTAG_RT_RISK_SCORE] += 2
            hashTagRuntime[HTAG_RT_LAST_RISK_ADD] = getTotalTimeElapsed()
        logToInspector("hash host cd anomaly: {0} cd2 = {1}".format(eventPlayer.getHero(), eventPlayer.temp))

rule "hashTag | Host Risk Decay":
    @Event global
    @Condition hashTag == true
    @Condition hashTagRuntime != null
    @Condition hashTagRuntime[HTAG_RT_READY] == true
    @Condition hashTagRuntime[HTAG_RT_RISK_SCORE] > 0
    @Condition getTotalTimeElapsed() - hashTagRuntime[HTAG_RT_LAST_RISK_DECAY] >= HTAG_HOST_RISK_DECAY_DT

    hashTagRuntime[HTAG_RT_RISK_SCORE] -= 1
    hashTagRuntime[HTAG_RT_LAST_RISK_DECAY] = getTotalTimeElapsed()

rule "hashTag | Host Risk Fail":
    @Event global
    @Condition hashTag == true
    @Condition hashTagRuntime != null
    @Condition hashTagRuntime[HTAG_RT_READY] == true
    @Condition hashTagRuntime[HTAG_RT_FAILED] != true
    @Condition hashTagRuntime[HTAG_RT_RISK_SCORE] >= HTAG_HOST_RISK_THRESHOLD

    hashTag = false
    hashTagRuntime[HTAG_RT_FAILED] = true
    logToInspector("hash failed by host monitor. risk={0}".format(hashTagRuntime[HTAG_RT_RISK_SCORE]))

rule "hashTag | Verify Failed Handling":
    @Event global
    @Condition hashTagRuntime != null
    @Condition hashTagRuntime[HTAG_RT_FAILED] == true
    @Condition hashTagRuntime[HTAG_RT_NOTIFIED] != true

    hashTagRuntime[HTAG_RT_NOTIFIED] = true
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
