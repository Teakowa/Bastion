#!mainFile "../../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

globalvar hashTagSentinelDone
# ──────────────────────────────────────────────
# 常量（⚠️ HTAG_RESPAWN_POS 和 HTAG_KIRI_CD2_* 须实测校准）
# ──────────────────────────────────────────────
#!define HTAG_BOT_SLOT      1
#!define HTAG_KIRI_CD2_MIN  3.75
#!define HTAG_KIRI_CD2_MAX  4.35
#!define HTAG_KIRI_HP_BASE  225
#!define HTAG_TICK          0.016

# ──────────────────────────────────────────────
# 规则1：事件初始化前，在重生室生成隐形雾子哨兵（一次性）
# ──────────────────────────────────────────────
rule "hashTag | Early Sentinel Spawn":
    @Event global
    @Condition hashTag == true
    @Condition not vishkarEventActivated
    @Condition getTotalTimeElapsed() > 5
    @Condition not hashTagSentinelDone  # 防止规则重入

    hashTagSentinelDone = true

    createDummy(Hero.KIRIKO, Team.1, HTAG_BOT_SLOT, getSpawnPoints(Team.1).getPosition(), Vector.DOWN)

# ──────────────────────────────────────────────
# 规则2：雾子哨兵执行 CD 基线校验
# 事件初始化前生成 → 无需清零任何变量
# ──────────────────────────────────────────────
rule "hashTag | Sentinel Verify":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == true
    @Condition hashTag == true
    @Condition hashTagSentinelDone == true
    

    eventPlayer.heroNumber = 13
    wait(getAverageServerLoad() / 100 * 0.5)
    eventPlayer.setAllowedHeroes(heroList.slice(0, eventPlayer.heroNumber))
    wait(getAverageServerLoad() / 100 * 0.5)

    eventPlayer.startForcingHero(Hero.KIRIKO)
    wait()
    eventPlayer.stopForcingCurrentHero()

    eventPlayer.setInvisibility(Invis.ALL)
    logToInspector("set bot to Invisibility")

    waitUntil(hostPlayer.isMoving(), 60)

    # ── 成就校验 ──────────────────────────────
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    waitUntil(not eventPlayer.isUsingAbility2(), 3)

    if evalOnce(eventPlayer.getAbilityCooldown(Button.ABILITY_2)) < HTAG_KIRI_CD2_MIN or evalOnce(eventPlayer.getAbilityCooldown(Button.ABILITY_2)) > HTAG_KIRI_CD2_MAX:
        logToInspector("bot Ability is {0}".format(eventPlayer.getAbilityCooldown(Button.ABILITY_2)))
        hashTag = false   # 校验失败
        logToInspector("hash failed")

    if evalOnce(eventPlayer.getMaxHealth()) != HTAG_KIRI_HP_BASE:
        logToInspector("bot Health is {0}".format(eventPlayer.getMaxHealth()))
        hashTag = false
        logToInspector("hash failed")

    # ── 清理 ─────────────────────────────
    destroyDummy(Team.1, HTAG_BOT_SLOT)

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
