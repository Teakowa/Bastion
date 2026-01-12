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
#!define EVT_4_HEAL_PERCENT 0.15  # 15% Max HP
#!define EVT_4_EFFECT Effect.HEAL_TARGET_ACTIVE

# --- ID 6: 足力健 ---
#!define EVT_6_SPEED_INC_PER_SEC 3
#!define EVT_6_EFFECT Effect.SOLDIER_SPRINTING

# --- ID 7: 血肉再生 ---
#!define EVT_7_HEALTH_PERCENT 0.25
#!define EVT_7_BASE_HEALTH 75
#!define EVT_7_REGEN_INTERVAL 4

# --- ID 8: 心之钢 ---
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


# --- ID 14: 费斯卡光子护盾 (团队共享盾) ---
# 给予最大生命值 20% 的护盾
#!define EVT_14_SHIELD_PERCENT 0.2
# 最小护盾值
#!define EVT_14_MIN_SHIELD 50
# 护盾池 ID 索引
#!define EVT_14_HEALTH_ID 2


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
#!define EVT_DEBUFF_0_GRAVITY 170  # 100 + 70

# --- ID 1 (Debuff): 电磁脉冲 ---
#!define EVT_DEBUFF_1_HACK_DURATION 8

# --- ID 2 (Debuff): 吸血鬼 ---
#!define EVT_DEBUFF_2_DMG_PERCENT 0.1

# --- ID 3 (Debuff): 易损 ---
#!define EVT_DEBUFF_3_DMG_TAKEN 25
