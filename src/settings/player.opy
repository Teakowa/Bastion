#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "initialize event array":
    @Condition vishkarEventActivated == true

    eventWeight = EVT_INIT_EVENT_WEIGHT
    
    # ================================================
    # 增益事件 (Buff Events)
    # ================================================
    buffEvent = []
    buffEventId = []

    # ================================================
    # 减益事件 (Debuff Events)
    # ================================================
    debuffEvent = []
    debuffEventId = []

    # ================================================
    # 机制事件 (Mech Events)
    # ================================================
    mechEvent = []
    mechEventId = []
    
    # Pack 0 - Special
    buffEvent[0] = [STR_EVT_BUFF_0_TITLE, STR_EVT_BUFF_0_DESC, 5, 2]
    buffEventId.append(0)
    
    # ================================================
    # Pack 1: Buffs
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK, STR_CAT_RANDOM_PACK_1, true, 1):
        goto lbl_0
    buffEvent[1] = [STR_EVT_BUFF_1_TITLE, STR_EVT_BUFF_1_DESC.format(EVT_1_SPEED_BOOST), EVT_BUFF_1_DURATION, EVT_BUFF_1_WEIGHT]
    buffEventId.append(1)
    
    buffEvent[2] = [STR_EVT_BUFF_2_TITLE, STR_EVT_BUFF_2_DESC.format(EVT_2_ARMOR_AMOUNT, negToPos(EVT_2_DMG_TAKEN)), EVT_BUFF_2_DURATION, EVT_BUFF_2_WEIGHT]
    buffEventId.append(2)
    
    buffEvent[3] = [STR_EVT_BUFF_3_TITLE, STR_EVT_BUFF_3_DESC.format(negToPos(EVT_3_DMG_TAKEN)), EVT_BUFF_3_DURATION, EVT_BUFF_3_WEIGHT]
    buffEventId.append(3)
    
    buffEvent[4] = [STR_EVT_BUFF_4_TITLE, STR_EVT_BUFF_4_DESC.format(percent(EVT_4_HEAL_PERCENT)), EVT_BUFF_4_DURATION, EVT_BUFF_4_WEIGHT]
    buffEventId.append(4)
    
    buffEvent[5] = [STR_EVT_BUFF_5_TITLE, STR_EVT_BUFF_5_DESC, EVT_BUFF_5_DURATION, EVT_BUFF_5_WEIGHT]
    buffEventId.append(5)
    
    buffEvent[6] = [STR_EVT_BUFF_6_TITLE, STR_EVT_BUFF_6_DESC.format(EVT_6_SPEED_INC_PER_SEC), EVT_BUFF_6_DURATION, EVT_BUFF_6_WEIGHT]
    buffEventId.append(6)
    
    buffEvent[7] = [STR_EVT_BUFF_7_TITLE, STR_EVT_BUFF_7_DESC.format(EVT_7_BASE_HEALTH, percent(EVT_7_HEALTH_PERCENT), EVT_7_REGEN_INTERVAL), EVT_BUFF_7_DURATION, EVT_BUFF_7_WEIGHT]
    buffEventId.append(7)
    
    buffEvent[8] = [STR_EVT_BUFF_8_TITLE, STR_EVT_BUFF_8_DESC.format(EVT_8_HP_PERCENT_PER_STACK), EVT_BUFF_8_DURATION, EVT_BUFF_8_WEIGHT]
    buffEventId.append(8)

    # ================================================
    # Pack 1: Debuffs
    # ================================================

    debuffEvent[0] = [
        STR_EVT_DEBUFF_0_TITLE,
        STR_EVT_DEBUFF_0_DESC.format(negToPos(EVT_DEBUFF_0_SPEED), EVT_DEBUFF_0_GRAVITY),
        EVT_DEBUFF_0_DURATION,
        EVT_DEBUFF_0_WEIGHT
    ]
    debuffEventId.append(0)

    debuffEvent[1] = [STR_EVT_DEBUFF_1_TITLE, STR_EVT_DEBUFF_1_DESC, EVT_DEBUFF_1_HACK_DURATION, EVT_DEBUFF_1_WEIGHT]
    debuffEventId.append(1)

    debuffEvent[2] = [
        STR_EVT_DEBUFF_2_TITLE,
        STR_EVT_DEBUFF_2_DESC.format(percent(EVT_DEBUFF_2_DMG_PERCENT)),
        EVT_DEBUFF_2_DURATION,
        EVT_DEBUFF_2_WEIGHT
    ]
    debuffEventId.append(2)

    debuffEvent[3] = [
        STR_EVT_DEBUFF_3_TITLE,
        STR_EVT_DEBUFF_3_DESC.format(EVT_DEBUFF_3_DMG_TAKEN),
        EVT_DEBUFF_3_DURATION,
        EVT_DEBUFF_3_WEIGHT
    ]
    debuffEventId.append(3)

    debuffEvent[4] = [
        STR_EVT_DEBUFF_4_TITLE,
        STR_EVT_DEBUFF_4_DESC.format(EVT_DEBUFF_4_DMG_BASE, percent(EVT_DEBUFF_4_DMG_PERCENT)),
        EVT_DEBUFF_4_DURATION,
        EVT_DEBUFF_4_WEIGHT
    ]
    debuffEventId.append(4)


    # ================================================
    # Pack 1: Mechanics
    # ================================================

    mechEvent[1] = [
        STR_EVT_MECH_1_TITLE,
        STR_EVT_MECH_1_DESC.format(percent(EVT_MECH_1_HP_MULTIPLIER), negToPos(EVT_MECH_1_SPEED_PENALTY)),
        EVT_MECH_1_DURATION,
        EVT_MECH_1_WEIGHT
    ]
    mechEventId.append(1)

    mechEvent[2] = [
        STR_EVT_MECH_2_TITLE,
        STR_EVT_MECH_2_DESC.format(Button.RELOAD),
        EVT_MECH_2_DURATION,
        EVT_MECH_2_WEIGHT
    ]
    mechEventId.append(2)

    mechEvent[3] = [
        STR_EVT_MECH_3_TITLE,
        STR_EVT_MECH_3_DESC,
        EVT_MECH_3_DURATION,
        EVT_MECH_3_WEIGHT
    ]
    mechEventId.append(3)

    mechEvent[4] = [
        STR_EVT_MECH_4_TITLE,
        STR_EVT_MECH_4_DESC,
        EVT_MECH_4_DURATION,
        EVT_MECH_4_WEIGHT
    ]
    mechEventId.append(4)

    mechEvent[5] = [
        STR_EVT_MECH_5_TITLE,
        STR_EVT_MECH_5_DESC,
        EVT_MECH_5_DURATION,
        EVT_MECH_5_WEIGHT
    ]
    mechEventId.append(5)

    mechEvent[6] = [
        STR_EVT_MECH_6_TITLE,
        STR_EVT_MECH_6_DESC,
        EVT_MECH_6_DURATION,
        EVT_MECH_6_WEIGHT
    ]
    mechEventId.append(6)

    
    lbl_0:

    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK, STR_CAT_RANDOM_PACK_2, true, 1):
        goto lbl_1

    # ================================================
    # Pack 2: Buffs
    # ================================================

    buffEvent[9] = [STR_EVT_BUFF_9_TITLE, STR_EVT_BUFF_9_DESC.format(EVT_9_SPEED_BOOST, negToPos(EVT_9_DMG_TAKEN)), EVT_BUFF_9_DURATION, EVT_BUFF_9_WEIGHT]
    buffEventId.append(9)

    buffEvent[10] = [STR_EVT_BUFF_10_TITLE, STR_EVT_BUFF_10_DESC, EVT_BUFF_10_DURATION, EVT_BUFF_10_WEIGHT]
    buffEventId.append(10)

    buffEvent[11] = [STR_EVT_BUFF_11_TITLE, STR_EVT_BUFF_11_DESC, EVT_BUFF_11_DURATION, EVT_BUFF_11_WEIGHT]
    buffEventId.append(11)

    buffEvent[12] = [STR_EVT_BUFF_12_TITLE, STR_EVT_BUFF_12_DESC.format(Button.INTERACT), EVT_BUFF_12_DURATION, EVT_BUFF_12_WEIGHT]
    buffEventId.append(12)

    buffEvent[13] = [STR_EVT_BUFF_13_TITLE, STR_EVT_BUFF_13_DESC.format(EVT_13_CHECKPOINT_INTERVAL), EVT_BUFF_13_DURATION, EVT_BUFF_13_WEIGHT]
    buffEventId.append(13)

    buffEvent[14] = [STR_EVT_BUFF_14_TITLE, STR_EVT_BUFF_14_DESC.format(percent(EVT_14_SHIELD_PERCENT)), EVT_BUFF_14_DURATION, EVT_BUFF_14_WEIGHT]
    buffEventId.append(14)


    # ================================================
    # Pack 2: Debuffs
    # ================================================

    debuffEvent[5] = [STR_EVT_DEBUFF_5_TITLE, STR_EVT_DEBUFF_5_DESC.format(EVT_DEBUFF_5_SPEED_REDUCTION), EVT_DEBUFF_5_DURATION, EVT_DEBUFF_5_WEIGHT]
    debuffEventId.append(5)

    debuffEvent[6] = [STR_EVT_DEBUFF_6_TITLE, STR_EVT_DEBUFF_6_DESC.format(negToPos(EVT_DEBUFF_6_MAX_SPEED_DEC)), EVT_DEBUFF_6_DURATION, EVT_DEBUFF_6_WEIGHT]
    debuffEventId.append(6)

    debuffEvent[7] = [STR_EVT_DEBUFF_7_TITLE, STR_EVT_DEBUFF_7_DESC.format(EVT_DEBUFF_7_RADIUS), EVT_DEBUFF_7_DURATION, EVT_DEBUFF_7_WEIGHT]
    debuffEventId.append(7)

    debuffEvent[8] = [STR_EVT_DEBUFF_8_TITLE, STR_EVT_DEBUFF_8_DESC.format(percent(EVT_DEBUFF_8_DMG_PERCENT)), EVT_DEBUFF_8_DURATION, EVT_DEBUFF_8_WEIGHT]
    debuffEventId.append(8)

    debuffEvent[9] = [STR_EVT_DEBUFF_9_TITLE, STR_EVT_DEBUFF_9_DESC.format(percent(EVT_DEBUFF_9_DMG_STILL), percent(EVT_DEBUFF_9_DMG_MOVING)), EVT_DEBUFF_9_DURATION, EVT_DEBUFF_9_WEIGHT]
    debuffEventId.append(9)

    debuffEvent[10] = [STR_EVT_DEBUFF_10_TITLE, STR_EVT_DEBUFF_10_DESC.format(percent(EVT_DEBUFF_10_DMG_FACTOR), EVT_DEBUFF_10_RADIUS), EVT_DEBUFF_10_DURATION, EVT_DEBUFF_10_WEIGHT]
    debuffEventId.append(10)

    debuffEvent[11] = [STR_EVT_DEBUFF_11_TITLE, STR_EVT_DEBUFF_11_DESC.format(EVT_DEBUFF_11_BERSERK_ADD), EVT_DEBUFF_11_DURATION, EVT_DEBUFF_11_WEIGHT]
    debuffEventId.append(11)

    debuffEvent[12] = [STR_EVT_DEBUFF_12_TITLE, STR_EVT_DEBUFF_12_DESC.format(EVT_DEBUFF_12_KNOCKDOWN_DURATION), EVT_DEBUFF_12_DURATION, EVT_DEBUFF_12_WEIGHT]
    debuffEventId.append(12)


    # ================================================
    # Pack 2: Mechanics
    # ================================================

    mechEvent[7] = [STR_EVT_MECH_7_TITLE, STR_EVT_MECH_7_DESC, EVT_MECH_7_DURATION, EVT_MECH_7_WEIGHT]
    mechEventId.append(7)

    mechEvent[8] = [STR_EVT_MECH_8_TITLE, STR_EVT_MECH_8_DESC, EVT_MECH_8_DURATION, EVT_MECH_8_WEIGHT]
    mechEventId.append(8)

    mechEvent[9] = [STR_EVT_MECH_9_TITLE, STR_EVT_MECH_9_DESC, EVT_MECH_9_DURATION, EVT_MECH_9_WEIGHT]
    mechEventId.append(9)

    
    lbl_1:

    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK, STR_CAT_RANDOM_PACK_3, true, 1):
        goto lbl_2
    
    # ================================================
    # Pack 3: Buffs
    # ================================================
    
    buffEvent[15] = [STR_EVT_BUFF_15_TITLE, STR_EVT_BUFF_15_DESC, EVT_BUFF_15_DURATION, EVT_BUFF_15_WEIGHT]
    buffEventId.append(15)
    
    buffEvent[16] = [STR_EVT_BUFF_16_TITLE, STR_EVT_BUFF_16_DESC.format(EVT_16_CHECK_INTERVAL, EVT_16_INVINCIBLE_DURATION), EVT_BUFF_16_DURATION, EVT_BUFF_16_WEIGHT]
    buffEventId.append(16)
    
    buffEvent[17] = [STR_EVT_BUFF_17_TITLE, STR_EVT_BUFF_17_DESC, EVT_BUFF_17_DURATION, EVT_BUFF_17_WEIGHT]
    buffEventId.append(17)
    
    buffEvent[18] = [STR_EVT_BUFF_18_TITLE, STR_EVT_BUFF_18_DESC.format(negToPos(EVT_18_KNOCKBACK_RESISTANCE), EVT_18_DMG_REDUCE_PER_STACK, percent(EVT_18_HEAL_PERCENT)), EVT_BUFF_18_DURATION, EVT_BUFF_18_WEIGHT]
    buffEventId.append(18)
    
    buffEvent[19] = [STR_EVT_BUFF_19_TITLE, STR_EVT_BUFF_19_DESC.format(percent(EVT_19_TRIGGER_HP_PERCENT), EVT_19_INVINCIBLE_DURATION), EVT_BUFF_19_DURATION, EVT_BUFF_19_WEIGHT]
    buffEventId.append(19)
    
    buffEvent[20] = [STR_EVT_BUFF_20_TITLE, STR_EVT_BUFF_20_DESC.format(EVT_20_DISTANCE_GOAL, EVT_20_REWARD_SPEED), EVT_BUFF_20_DURATION, EVT_BUFF_20_WEIGHT]
    buffEventId.append(20)
    
    buffEvent[21] = [STR_EVT_BUFF_21_TITLE, STR_EVT_BUFF_21_DESC.format(EVT_21_HP_GAIN_FLAT, EVT_21_HP_MULTIPLIER), EVT_BUFF_21_DURATION, EVT_BUFF_21_WEIGHT]
    buffEventId.append(21)
    
    buffEvent[22] = [STR_EVT_BUFF_22_TITLE, STR_EVT_BUFF_22_DESC.format(EVT_22_HEAL_BOOST), EVT_BUFF_22_DURATION, EVT_BUFF_22_WEIGHT]
    buffEventId.append(22)
    
    buffEvent[23] = [STR_EVT_BUFF_23_TITLE, STR_EVT_BUFF_23_DESC.format(negToPos(EVT_23_DMG_REDUCTION_DURING_ULT)), EVT_BUFF_23_DURATION, EVT_BUFF_23_WEIGHT]
    buffEventId.append(23)
 
    # ================================================
    # Pack 3: Debuffs
    # ================================================

    debuffEvent[13] = [
        STR_EVT_DEBUFF_13_TITLE,
        STR_EVT_DEBUFF_13_DESC.format(negToPos(EVT_DEBUFF_13_HEAL_DEALT_RED)),
        EVT_DEBUFF_13_DURATION,
        EVT_DEBUFF_13_WEIGHT
    ]
    debuffEventId.append(13)

    debuffEvent[14] = [
        STR_EVT_DEBUFF_14_TITLE,
        STR_EVT_DEBUFF_14_DESC.format(EVT_DEBUFF_14_INTERVAL, percent(EVT_DEBUFF_14_DAMAGE_PERCENT)),
        EVT_DEBUFF_14_DURATION,
        EVT_DEBUFF_14_WEIGHT
    ]
    debuffEventId.append(14)

    debuffEvent[15] = [
        STR_EVT_DEBUFF_15_TITLE,
        STR_EVT_DEBUFF_15_DESC.format(EVT_DEBUFF_15_STACKS_TAKE),
        EVT_DEBUFF_15_DURATION,
        EVT_DEBUFF_15_WEIGHT
    ]
    debuffEventId.append(15)


    # ================================================
    # Pack 3: Mechanics
    # ================================================

    mechEvent[0] = [
        STR_EVT_MECH_0_TITLE,
        STR_EVT_MECH_0_DESC.format(negToPos(EVT_MECH_0_DMG_TAKEN), percent(EVT_MECH_0_HP_PERCENT)),
        EVT_MECH_0_DURATION,
        EVT_MECH_0_WEIGHT
    ]
    mechEventId.append(0)

    # ================================================
    # Pack 3: Mechanics
    # ================================================

    mechEvent[10] = [STR_EVT_MECH_10_TITLE, STR_EVT_MECH_10_DESC, EVT_MECH_10_DURATION, EVT_MECH_10_WEIGHT]
    mechEventId.append(10)

    mechEvent[11] = [STR_EVT_MECH_11_TITLE, STR_EVT_MECH_11_DESC, EVT_MECH_11_DURATION, EVT_MECH_11_WEIGHT]
    mechEventId.append(11)

    mechEvent[12] = [
        STR_EVT_MECH_12_TITLE,
        STR_EVT_MECH_12_DESC.format(Button.JUMP, negToPos(EVT_MECH_12_DMG_TAKEN)),
        EVT_MECH_12_DURATION,
        EVT_MECH_12_WEIGHT
    ]
    mechEventId.append(12)

    mechEvent[13] = [
        STR_EVT_MECH_13_TITLE,
        STR_EVT_MECH_13_DESC.format(Button.RELOAD),
        EVT_MECH_13_DURATION,
        EVT_MECH_13_WEIGHT
    ]
    mechEventId.append(13)

    
    lbl_2:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK, STR_CAT_RANDOM_PACK_4, true, 1):
        goto lbl_3

    # ================================================
    # Pack 4: Buffs
    # ================================================
    buffEvent[24] = [STR_EVT_BUFF_24_TITLE, STR_EVT_BUFF_24_DESC.format(EVT_24_SPEED_BOOST), EVT_BUFF_24_DURATION, EVT_BUFF_24_WEIGHT]
    buffEventId.append(24)

    buffEvent[25] = [STR_EVT_BUFF_25_TITLE, STR_EVT_BUFF_25_DESC, EVT_BUFF_25_DURATION, EVT_BUFF_25_WEIGHT]
    buffEventId.append(25)

    buffEvent[26] = [STR_EVT_BUFF_26_TITLE, STR_EVT_BUFF_26_DESC, EVT_BUFF_26_DURATION, EVT_BUFF_26_WEIGHT]
    buffEventId.append(26)

    buffEvent[27] = [STR_EVT_BUFF_27_TITLE, STR_EVT_BUFF_27_DESC.format(EVT_27_REWARD_DMG_PERMA), EVT_BUFF_27_DURATION, EVT_BUFF_27_WEIGHT]
    buffEventId.append(27)

    buffEvent[28] = [STR_EVT_BUFF_28_TITLE, STR_EVT_BUFF_28_DESC.format(EVT_28_HOT_FLAT, percent(EVT_28_HOT_MAXHP_FACTOR)), EVT_BUFF_28_DURATION, EVT_BUFF_28_WEIGHT]
    buffEventId.append(28)

    buffEvent[29] = [STR_EVT_BUFF_29_TITLE, STR_EVT_BUFF_29_DESC, EVT_BUFF_29_DURATION, EVT_BUFF_29_WEIGHT]
    buffEventId.append(29)

    buffEvent[30] = [STR_EVT_BUFF_30_TITLE, STR_EVT_BUFF_30_DESC.format(EVT_30_HEAL_RADIUS, EVT_30_HOT_FLAT, percent(EVT_30_HOT_MAXHP_FACTOR)), EVT_BUFF_30_DURATION, EVT_BUFF_30_WEIGHT]
    buffEventId.append(30)

    buffEvent[31] = [STR_EVT_BUFF_31_TITLE, STR_EVT_BUFF_31_DESC, EVT_BUFF_31_DURATION, EVT_BUFF_31_WEIGHT]
    buffEventId.append(31)

    buffEvent[32] = [STR_EVT_BUFF_32_TITLE, STR_EVT_BUFF_32_DESC, EVT_BUFF_32_DURATION, EVT_BUFF_32_WEIGHT]
    buffEventId.append(32)

    buffEvent[33] = [STR_EVT_BUFF_33_TITLE, STR_EVT_BUFF_33_DESC, EVT_BUFF_33_DURATION, EVT_BUFF_33_WEIGHT]
    buffEventId.append(33)

    # ================================================
    # Pack 4: Debuffs
    # ================================================
    debuffEvent[16] = [STR_EVT_DEBUFF_16_TITLE, STR_EVT_DEBUFF_16_DESC, EVT_DEBUFF_16_DURATION, EVT_DEBUFF_16_WEIGHT]
    debuffEventId.append(16)

    debuffEvent[17] = [STR_EVT_DEBUFF_17_TITLE, STR_EVT_DEBUFF_17_DESC, EVT_DEBUFF_17_DURATION, EVT_DEBUFF_17_WEIGHT]
    debuffEventId.append(17)

    debuffEvent[18] = [STR_EVT_DEBUFF_18_TITLE, STR_EVT_DEBUFF_18_DESC, EVT_DEBUFF_18_DURATION, EVT_DEBUFF_18_WEIGHT]
    debuffEventId.append(18)

    debuffEvent[19] = [STR_EVT_DEBUFF_19_TITLE, STR_EVT_DEBUFF_19_DESC, EVT_DEBUFF_19_DURATION, EVT_DEBUFF_19_WEIGHT]
    debuffEventId.append(19)

    debuffEvent[20] = [STR_EVT_DEBUFF_20_TITLE, STR_EVT_DEBUFF_20_DESC, EVT_DEBUFF_20_DURATION, EVT_DEBUFF_20_WEIGHT]
    debuffEventId.append(20)

    debuffEvent[21] = [STR_EVT_DEBUFF_21_TITLE, STR_EVT_DEBUFF_21_DESC, EVT_DEBUFF_21_DURATION, EVT_DEBUFF_21_WEIGHT]
    debuffEventId.append(21)


    # ================================================
    # Pack 4: Mechanics
    # ================================================
    mechEvent[14] = [STR_EVT_MECH_14_TITLE, STR_EVT_MECH_14_DESC.format(Button.RELOAD), EVT_MECH_14_DURATION, EVT_MECH_14_WEIGHT]
    mechEventId.append(14)

    mechEvent[15] = [STR_EVT_MECH_15_TITLE, STR_EVT_MECH_15_DESC.format(Button.RELOAD), EVT_MECH_15_DURATION, EVT_MECH_15_WEIGHT]
    mechEventId.append(15)

    mechEvent[16] = [STR_EVT_MECH_16_TITLE, STR_EVT_MECH_16_DESC.format(Button.RELOAD), EVT_MECH_16_DURATION, EVT_MECH_16_WEIGHT]
    mechEventId.append(16)

    mechEvent[17] = [STR_EVT_MECH_17_TITLE, STR_EVT_MECH_17_DESC, EVT_MECH_17_DURATION, EVT_MECH_17_WEIGHT]
    mechEventId.append(17)

    mechEvent[18] = [STR_EVT_MECH_18_TITLE, STR_EVT_MECH_18_DESC.format(Button.RELOAD), EVT_MECH_18_DURATION, EVT_MECH_18_WEIGHT]
    mechEventId.append(18)

    mechEvent[19] = [STR_EVT_MECH_19_TITLE, STR_EVT_MECH_19_DESC, EVT_MECH_19_DURATION, EVT_MECH_19_WEIGHT]
    mechEventId.append(19)

    mechEvent[20] = [STR_EVT_MECH_20_TITLE, STR_EVT_MECH_20_DESC, EVT_MECH_20_DURATION, EVT_MECH_20_WEIGHT]
    mechEventId.append(20)

    mechEvent[21] = [STR_EVT_MECH_21_TITLE, STR_EVT_MECH_21_DESC, EVT_MECH_21_DURATION, EVT_MECH_21_WEIGHT]
    mechEventId.append(21)

    mechEvent[22] = [STR_EVT_MECH_22_TITLE, STR_EVT_MECH_22_DESC.format(Button.RELOAD), EVT_MECH_22_DURATION, EVT_MECH_22_WEIGHT]
    mechEventId.append(22)

    mechEvent[23] = [STR_EVT_MECH_23_TITLE, STR_EVT_MECH_23_DESC, EVT_MECH_23_DURATION, EVT_MECH_23_WEIGHT]
    mechEventId.append(23)

    mechEvent[24] = [STR_EVT_MECH_24_TITLE, STR_EVT_MECH_24_DESC, EVT_MECH_24_DURATION, EVT_MECH_24_WEIGHT]
    mechEventId.append(24)


    lbl_3: