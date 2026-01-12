# ==============================================================================
# 事件效果参数配置 (Event Effect Configuration)
# ==============================================================================

# --- ID 1: 疾风祝福 ---
#!define EVT_1_SPEED_BOOST 50
#!define EVT_1_EFFECT Effect.SOLDIER_SPRINTING

# --- ID 2: 钢铁防线 ---
#!define EVT_2_ARMOR_AMOUNT 1500
#!define EVT_2_DMG_TAKEN -25
#!define EVT_2_EFFECT DynamicEffect.BRIGITTE_REPAIR_PACK_ARMOR

# --- ID 3: 肾上腺素 ---
#!define EVT_3_DMG_TAKEN -50
#!define EVT_3_EFFECT Effect.ANA_NANO_BOOSTED

# --- ID 4: 生命源泉 ---
#!define EVT_4_HEAL_INTERVAL 20
# 15% Max HP
#!define EVT_4_HEAL_PERCENT 0.15
#!define EVT_4_EFFECT Effect.HEAL_TARGET_ACTIVE

# --- ID 6: 足力健 ---
#!define EVT_6_SPEED_INC_PER_SEC 3
#!define EVT_6_EFFECT Effect.SOLDIER_SPRINTING

# --- ID 7: 血肉再生 ---
#!define EVT_7_HEALTH_PERCENT 0.25
#!define EVT_7_BASE_HEALTH 75
#!define EVT_7_REGEN_INTERVAL 4

# --- ID 8: 心之钢 ---
#!define EVT_8_HP_PERCENT_PER_STACK 0.75
#!define EVT_8_HP_LAYER_PER_DEATH 1
#!define EVT_8_VISUAL_EFFECT Effect.WINSTON_PRIMAL_RAGE

# --- ID 9: 危险感知 ---
#!define EVT_9_SPEED_BOOST 60
#!define EVT_9_DMG_TAKEN -25
#!define EVT_9_LINGER_TIME 1

# --- ID 10: 反应装甲 ---
#!define EVT_10_ARMOR_AMOUNT 150
# --- ID 10: 反应装甲 (反伤晕眩逻辑) ---
#!define EVT_10_STUN_DURATION 1
#!define EVT_10_STUN_COOLDOWN 1

# --- ID 11: 死亡延迟 ---
# 15% 血量触发
#!define EVT_11_TRIGGER_HP_PERCENT 0.15
# 处决伤害
#!define EVT_11_EXECUTE_DAMAGE 9999999999
# 堡垒右键处决阈值
#!define EVT_11_BASTION_EXECUTE_HP 500
#!define EVT_11_EFFECT Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED
#!define EVT_11_SOUND Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED_SOUND

# --- ID 13: ↑↑↓↓←→←→BABA (魂斗罗/动态存档) ---
# 存档更新频率 (秒)
#!define EVT_13_CHECKPOINT_INTERVAL 5
# 死亡后复活延迟
#!define EVT_13_RESPAWN_DELAY 3
#!define EVT_13_EFFECT_SAVE Effect.SPARKLES
#!define EVT_13_EFFECT_DIE DynamicEffect.TRACER_RECALL_DISAPPEAR
#!define EVT_13_EFFECT_RESURRECT DynamicEffect.TRACER_RECALL_REAPPEAR

# --- ID 14: 费斯卡光子护盾 (团队共享盾) ---
# 给予最大生命值 20% 的护盾
#!define EVT_14_SHIELD_PERCENT 0.2
# 最小护盾值
#!define EVT_14_MIN_SHIELD 50
# 护盾池 ID 索引
#!define EVT_14_HEALTH_ID 2

# --- ID 16: 向我靠拢 (无敌光环) ---
# 检测间隔 (秒)
#!define EVT_16_CHECK_INTERVAL 5

# 光环生效半径 (米)
#!define EVT_16_RADIUS 15

# 获得的无敌持续时间 (秒)
#!define EVT_16_INVINCIBLE_DURATION 2.5

# 无敌视觉特效
#!define EVT_16_EFFECT Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED

# 变量数组索引定义
# invincible[0] = 是否激活 (bool)
# invincible[1] = 来源玩家 (Entity)
# invincible[2] = 持续时间 (Number)

# --- ID 17: 我独自闯关 ---
# 检测半径
#!define EVT_17_CHECK_RADIUS 8

# 状态 1：有队友时的数值 (普通)
#!define EVT_17_MODE1_DMG_TAKEN -15
#!define EVT_17_MODE1_HEAL_BOOST 30
#!define EVT_17_MODE1_SPEED 12.5
# 受到75%击退 = 25% 抵抗
#!define EVT_17_MODE1_KNOCKBACK 75

# 状态 2：独自一人时的数值 (强力)
#!define EVT_17_MODE2_DMG_TAKEN -30
#!define EVT_17_MODE2_HEAL_BOOST 60
#!define EVT_17_MODE2_SPEED 25
# 受到50%击退 = 50% 抵抗
#!define EVT_17_MODE2_KNOCKBACK 50

# --- ID 18: 坚定 ---
# 基础属性
# 95% 击退抵抗 (mod 值，不是 setKnockbackReceived)
#!define EVT_18_KNOCKBACK_RESISTANCE -95

# 受击触发属性
# 每次受到击退增加 5% 减伤
#!define EVT_18_DMG_REDUCE_PER_STACK 5
# 最大减伤上限 (负数表示减伤)
#!define EVT_18_MAX_DMG_REDUCE -75
# 每次受到击退回复 8% 最大生命
#!define EVT_18_HEAL_PERCENT 0.08

# --- ID 19: 胜利意志 ---
# 触发阈值 (血量百分比)
#!define EVT_19_TRIGGER_HP_PERCENT 0.3

# 无敌持续时间 (秒)
#!define EVT_19_INVINCIBLE_DURATION 5

# 视觉与音效
#!define EVT_19_EFFECT Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED
#!define EVT_19_SOUND Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED_SOUND

# --- ID 20: 菲迪皮德斯之力 ---
#!define EVT_20_DISTANCE_GOAL 42.195
#!define EVT_20_DISTANCE_INC 0.5
#!define EVT_20_REWARD_SPEED 5

# --- ID 21: 心之钢 Pro ---
#!define EVT_21_HP_GAIN_FLAT 6
#!define EVT_21_HP_MULTIPLIER 2

# --- ID 22: 数值之力 ---
#!define EVT_22_HEAL_BOOST 400
#!define EVT_22_RADIUS 200

# --- ID 23: 我按Q辣 ---
#!define EVT_23_ULT_CHARGE_PER_SEC 10
#!define EVT_23_DMG_REDUCTION_DURING_ULT -75

# --- ID 0 (Debuff): 重力异常 ---
#!define EVT_DEBUFF_0_SPEED -40
# 100 + 70
#!define EVT_DEBUFF_0_GRAVITY 70

# --- ID 1 (Debuff): 电磁脉冲 ---
#!define EVT_DEBUFF_1_HACK_DURATION 8

# --- ID 2 (Debuff): 吸血鬼 ---
#!define EVT_DEBUFF_2_DMG_PERCENT 0.1

# --- ID 3 (Debuff): 易损 ---
#!define EVT_DEBUFF_3_DMG_TAKEN 25

# --- ID 4 (Debuff): 限速40 ---
# 燃烧状态持续时间
#!define EVT_DEBUFF_4_BURN_DURATION 3

# DOT 伤害基数
#!define EVT_DEBUFF_4_DMG_BASE 25

# DOT 伤害百分比系数 (最大生命值)
#!define EVT_DEBUFF_4_DMG_PERCENT 0.075

# 检测周期 (秒)
#!define EVT_DEBUFF_4_CHECK_INTERVAL 1

# --- ID 5 (Debuff): 引力异常 ---
# 减速数值
#!define EVT_DEBUFF_5_SPEED_REDUCTION 25

# 牵引力度 (空中)
#!define EVT_DEBUFF_5_PULL_AIR 0.425

# 牵引力度 (地面)
#!define EVT_DEBUFF_5_PULL_GROUND 0.825

# 视觉特效
#!define EVT_DEBUFF_5_EFFECT Effect.SIGMA_GRAVITIC_FLUX_TARGET
#!define EVT_DEBUFF_5_SOUND Effect.SIGMA_GRAVITIC_FLUX_TARGET_SOUND

# --- ID 6 (Debuff): 骨质疏松 ---
# 每秒减少的速度 (%)
#!define EVT_DEBUFF_6_SPEED_DEC_PER_SEC 5

# 最大减速上限 (%)
#!define EVT_DEBUFF_6_MAX_SPEED_DEC -50

# --- ID 7 (Debuff): 电磁脉冲 ProMax ---
# 爆炸半径 (米)
#!define EVT_DEBUFF_7_RADIUS 75

# 基础黑客入侵持续时间 (秒)
#!define EVT_DEBUFF_7_HACK_BASE_DURATION 8

# 距离衰减系数 (每米减少的黑客时间)
#!define EVT_DEBUFF_7_DIST_FACTOR 0.08

# 黑客生效的最小阈值 (秒，低于此值不显示特效)
#!define EVT_DEBUFF_7_MIN_HACK_THRESHOLD 0.9

# EMP 视觉特效
#!define EVT_DEBUFF_7_EXPLOSION_EFFECT DynamicEffect.SOMBRA_EMP_EXPLOSION_EFFECT
#!define EVT_DEBUFF_7_HACK_EFFECT DynamicEffect.SOMBRA_HACKED_STARTING

# --- ID 8 (Debuff): 能量泄漏 ---
# 每次使用技能扣除的最大生命值百分比
#!define EVT_DEBUFF_8_DMG_PERCENT 0.25

# 触发间隔 (防止瞬发技能多次触发)
#!define EVT_DEBUFF_8_COOLDOWN 1

# --- ID 9 (Debuff): 生命在于运动 ---
# 移动时的伤害系数 (最大生命值百分比)
#!define EVT_DEBUFF_9_DMG_MOVING 0.03

# 静止时的伤害系数 (最大生命值百分比)
#!define EVT_DEBUFF_9_DMG_STILL 0.015

# 燃烧状态时长
#!define EVT_DEBUFF_9_BURN_DURATION 1

# 循环间隔 (秒)
#!define EVT_DEBUFF_9_TICK_RATE 0.96

# --- ID 10 (Debuff): 有难同当 (伤害分摊) ---
# 伤害扩散半径 (米)
#!define EVT_DEBUFF_10_RADIUS 15

# 扩散伤害系数 (承受原始伤害的百分比)
#!define EVT_DEBUFF_10_DMG_FACTOR 0.75

# 视觉特效
#!define EVT_DEBUFF_10_EFFECT Effect.TORBJORN_OVERLOADING

# --- ID 11 (Debuff): 狂欢盛宴 (阵亡惩罚) ---
# 增加的狂暴时间 (秒)
#!define EVT_DEBUFF_11_BERSERK_ADD 10

# 冷却时间/触发间隔 (秒)
#!define EVT_DEBUFF_11_COOLDOWN 5

# --- ID 12 (Debuff): 无能的丈夫/妻子 ---
# 影响半径
#!define EVT_DEBUFF_12_RADIUS 45

# 击倒持续时间
#!define EVT_DEBUFF_12_KNOCKDOWN_DURATION 2

# --- ID 13 (Debuff): 重伤 ---
# 治疗输出减少量 (%)
#!define EVT_DEBUFF_13_HEAL_DEALT_RED -85

# 治疗接收减少量 (%)
#!define EVT_DEBUFF_13_HEAL_RECV_RED -85

# 视觉特效
#!define EVT_DEBUFF_13_EFFECT Effect.ANA_BIOTIC_GRENADE_NO_HEALING
#!define EVT_DEBUFF_13_SOUND DynamicEffect.ANA_BIOTIC_GRENAGE_NO_HEALING_SOUND

# --- ID 14 (Debuff): 减半 ---
# 斩杀阈值 (5%)
#!define EVT_DEBUFF_14_EXECUTE_THRESHOLD 0.05

# 扣血比例 (当前血量的 50%)
#!define EVT_DEBUFF_14_DAMAGE_PERCENT 0.5

# 触发间隔 (秒)
#!define EVT_DEBUFF_14_INTERVAL 5

# 斩杀特效
#!define EVT_DEBUFF_14_EXECUTE_EFFECT DynamicEffect.DVA_SELF_DESTRUCT_EXPLOSION

# 扣血特效
#!define EVT_DEBUFF_14_DAMAGE_EFFECT DynamicEffect.ZARYA_PARTICLE_CANNON_EXPLOSION

# --- ID 15 (Debuff): 舍己为人 ---
# 触发事件所需的最低最大生命值 (避免脆皮触发后直接暴毙)
#!define EVT_DEBUFF_15_MIN_MAX_HP 125

# 转移给每个队友的心之钢层数
#!define EVT_DEBUFF_15_STACKS_GIVE 1

# 自身扣除的心之钢层数系数 (每有一个队友扣除多少层)
#!define EVT_DEBUFF_15_STACKS_TAKE 1

# 视觉特效
#!define EVT_DEBUFF_15_EFFECT_TAKE DynamicEffect.ORISA_HALT_IMPLOSION
#!define EVT_DEBUFF_15_EFFECT_GIVE DynamicEffect.GOOD_PICKUP_EFFECT

# --- ID 0 (Mech/Special): 极限挑战 ---
# 锁定的生命值比例 (30%)
#!define EVT_MECH_0_HP_PERCENT 0.3

# 获得的伤害减免 (%) -99% 几乎无敌
#!define EVT_MECH_0_DMG_TAKEN -99

# 禁疗数值 (绝对禁止)
#!define EVT_MECH_0_HEAL_BAN -1000

# 视觉特效
#!define EVT_MECH_0_EFFECT Effect.ANA_BIOTIC_GRENADE_NO_HEALING
#!define EVT_MECH_0_SOUND DynamicEffect.ANA_BIOTIC_GRENAGE_NO_HEALING_SOUND

# --- ID 1 (Mech): 纳米战甲 ---
# 额外生命值倍率 (8倍)
#!define EVT_MECH_1_HP_MULTIPLIER 8

# 速度惩罚 (%)
#!define EVT_MECH_1_SPEED_PENALTY -25

# 生命池索引
#!define EVT_MECH_1_POOL_IDX 0

# --- ID 2 (Mech): 赌徒 ---
# 获胜概率 (%)
#!define EVT_MECH_2_WIN_RATE 50

# 单次赌注 (心之钢层数 / HP百分比)
#!define EVT_MECH_2_STAKE 5

# 赌徒连胜计数上限 (用于HUD显示赌王称号等)
#!define EVT_MECH_2_WIN_STREAK_CAP 5

# --- ID 3 (Mech): 有点松弛 ---
# 烟雾/云雾效果半径
#!define EVT_MECH_3_CLOUD_RADIUS 12

# 烟雾生成间隔 (秒)
#!define EVT_MECH_3_SPAWN_INTERVAL 1

# 视觉特效 (自身火焰)
#!define EVT_MECH_3_SELF_EFFECT Effect.WRECKING_BALL_PILEDRIVER_FIRE

# 视觉特效 (干扰烟雾)
#!define EVT_MECH_3_CLOUD_EFFECT Effect.CLOUD

# --- ID 4 (Mech): 体积膨胀 ---
# 生命倍率 (用于 setPlayerHP 计算)
#!define EVT_MECH_4_HP_SCALE 4

# 模型缩放比例
#!define EVT_MECH_4_MODEL_SCALE 1.75

# 语音语调 (低沉)
#!define EVT_MECH_4_VOICE_PITCH 0.5

# 伤害减免 (%)
#!define EVT_MECH_4_DMG_TAKEN -20

# --- ID 5 (Mech): 迷你形态 ---
# 生命倍率 (用于 setPlayerHP 计算)
#!define EVT_MECH_5_HP_SCALE 0.5

# 模型缩放比例
#!define EVT_MECH_5_MODEL_SCALE 0.4

# 语音语调 (尖细)
#!define EVT_MECH_5_VOICE_PITCH 1.5

# 移动速度加成 (%)
#!define EVT_MECH_5_SPEED_BOOST 25

# --- ID 6 (Mech): 悄悄地进村 ---
# 蹲下时的移速惩罚 (%)
#!define EVT_MECH_6_SPEED_PENALTY 25

# --- ID 7 (Mech): 紧急避障 ---
# 受伤触发的加速 (%)
#!define EVT_MECH_7_SPEED_BOOST 30

# 加速持续时间 (秒)
#!define EVT_MECH_7_DURATION 3

# --- ID 8 (Mech): 逆风而行 ---
# 移速加成 (%)
#!define EVT_MECH_8_SPEED_BOOST 60

# 伤害减免 (%)
#!define EVT_MECH_8_DMG_TAKEN -60

# --- ID 9 (Mech): 刹车失灵 ---
# 最大加速上限 (%)
#!define EVT_MECH_9_MAX_SPEED 75

# 加速步长 (%)
#!define EVT_MECH_9_SPEED_INC 5

# 最大减伤上限 (%)
#!define EVT_MECH_9_MAX_DMG_TAKEN -50

# 减伤步长 (%)
#!define EVT_MECH_9_DMG_TAKEN_INC 5

# 更新间隔 (秒)
#!define EVT_MECH_9_INTERVAL 1

# --- ID 10 (Mech): 冲锋激励 ---
# 任务目标数值
#!define EVT_MECH_10_MISSION_GOAL 300

# 每次触发增加的进度
#!define EVT_MECH_10_MISSION_INC 100

# 触发间隔 (秒) - 原代码 wait(5)
#!define EVT_MECH_10_CHECK_INTERVAL 5

# 奖励护甲数值
#!define EVT_MECH_10_ARMOR_REWARD 300

# 奖励持续时间 (秒)
#!define EVT_MECH_10_REWARD_DURATION 15

# --- ID 11 (Mech): 生命在于反击 ---
# 属性上限阈值 (%)
#!define EVT_MECH_11_CAP_THRESHOLD 75

# 速度最大加成 (%)
#!define EVT_MECH_11_MAX_SPEED 75

# 易伤最大上限 (%) - 注意原代码逻辑：如果 > 75 则变为 50？
#!define EVT_MECH_11_MAX_DMG_TAKEN 50

# 更新间隔 (秒)
#!define EVT_MECH_11_INTERVAL 1

# --- ID 12 (Mech): 屁动力 ---
# 喷射造成的减伤 (%)
#!define EVT_MECH_12_DMG_TAKEN -50

# 喷射力度
#!define EVT_MECH_12_IMPULSE 15

# 视觉特效
#!define EVT_MECH_12_EFFECT Effect.ANA_NANO_BOOSTED

# --- ID 13 (Mech): 赌徒：竞速挑战 ---
# 触发赌博的血量惩罚 (当前生命值变为 50% 最大生命值)
#!define EVT_MECH_13_HP_PENALTY 0.5

# 普通胜利概率阈值 (0-49) => 50%
#!define EVT_MECH_13_PROB_WIN_NORMAL 49

# 普通失败概率阈值 (50-98) => 49%
#!define EVT_MECH_13_PROB_LOSE_NORMAL 98

# 稀有胜利概率阈值 (99) => 1%
#!define EVT_MECH_13_PROB_WIN_RARE 99
# (剩余 100 就是稀有失败)

# 普通奖励/惩罚数值 (移速 %)
#!define EVT_MECH_13_VAL_NORMAL 5

# 稀有奖励/惩罚数值 (移速 %)
#!define EVT_MECH_13_VAL_RARE 12
