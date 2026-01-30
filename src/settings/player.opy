#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "initialize event array":
    @Condition vishkarEventActivated == true

    eventWeight = 2.5
    
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
    buffEvent[1] = [STR_EVT_BUFF_1_TITLE, STR_EVT_BUFF_1_DESC.format(EVT_1_SPEED_BOOST), 25, 1.4]
    buffEventId.append(1)
    
    buffEvent[2] = [STR_EVT_BUFF_2_TITLE, STR_EVT_BUFF_2_DESC.format(EVT_2_ARMOR_AMOUNT, EVT_2_DMG_TAKEN * -1), 25, 1.1]
    buffEventId.append(2)
    
    buffEvent[3] = [STR_EVT_BUFF_3_TITLE, STR_EVT_BUFF_3_DESC.format(EVT_3_DMG_TAKEN * -1), 20, 1.2]
    buffEventId.append(3)
    
    buffEvent[4] = [STR_EVT_BUFF_4_TITLE, STR_EVT_BUFF_4_DESC.format(EVT_4_HEAL_PERCENT * 100), 30, 1.1]
    buffEventId.append(4)
    
    buffEvent[5] = [STR_EVT_BUFF_5_TITLE, STR_EVT_BUFF_5_DESC, 20, 1.6]
    buffEventId.append(5)
    
    buffEvent[6] = [STR_EVT_BUFF_6_TITLE, STR_EVT_BUFF_6_DESC.format(EVT_6_SPEED_INC_PER_SEC), 45, 1.3]
    buffEventId.append(6)
    
    buffEvent[7] = [STR_EVT_BUFF_7_TITLE, STR_EVT_BUFF_7_DESC.format(EVT_7_BASE_HEALTH, EVT_7_HEALTH_PERCENT * 100, EVT_7_REGEN_INTERVAL), 90, 1.1]
    buffEventId.append(7)
    
    buffEvent[8] = [STR_EVT_BUFF_8_TITLE, STR_EVT_BUFF_8_DESC.format(EVT_8_HP_PERCENT_PER_STACK), 120, 1]
    buffEventId.append(8)

    # ================================================
    # Pack 1: Debuffs
    # ================================================
    
    debuffEvent[0] = [STR_EVT_DEBUFF_0_TITLE, STR_EVT_DEBUFF_0_DESC.format(EVT_DEBUFF_0_SPEED * -1, EVT_DEBUFF_0_GRAVITY), 20, 1.4]
    debuffEventId.append(0)
    
    debuffEvent[1] = [STR_EVT_DEBUFF_1_TITLE, STR_EVT_DEBUFF_1_DESC, 8, 1.1]
    debuffEventId.append(1)
    
    debuffEvent[2] = [STR_EVT_DEBUFF_2_TITLE, STR_EVT_DEBUFF_2_DESC.format(EVT_DEBUFF_2_DMG_PERCENT * 100), 30, 0.8]
    debuffEventId.append(2)
    
    debuffEvent[3] = [STR_EVT_DEBUFF_3_TITLE, STR_EVT_DEBUFF_3_DESC.format(EVT_DEBUFF_3_DMG_TAKEN), 25, 1.2]
    debuffEventId.append(3)
    
    debuffEvent[4] = [STR_EVT_DEBUFF_4_TITLE, STR_EVT_DEBUFF_4_DESC.format(EVT_DEBUFF_4_DMG_BASE, EVT_DEBUFF_4_DMG_PERCENT * 100), 25, 1.1]
    debuffEventId.append(4)

    # ================================================
    # Pack 1: Mechanics
    # ================================================
    
    mechEvent[1] = [STR_EVT_MECH_1_TITLE, STR_EVT_MECH_1_DESC.format(EVT_MECH_1_HP_MULTIPLIER * 100, EVT_MECH_1_SPEED_PENALTY * -1), 15, 1.2]
    mechEventId.append(1)
    
    mechEvent[2] = [STR_EVT_MECH_2_TITLE, STR_EVT_MECH_2_DESC.format(Button.RELOAD), 15, 1.4]
    mechEventId.append(2)
    
    mechEvent[3] = [STR_EVT_MECH_3_TITLE, STR_EVT_MECH_3_DESC, 45, 0]
    mechEventId.append(3)
    
    mechEvent[4] = [STR_EVT_MECH_4_TITLE, STR_EVT_MECH_4_DESC, 60, 0.8]
    mechEventId.append(4)
    
    mechEvent[5] = [STR_EVT_MECH_5_TITLE, STR_EVT_MECH_5_DESC, 60, 1.2]
    mechEventId.append(5)
    
    mechEvent[6] = [STR_EVT_MECH_6_TITLE, STR_EVT_MECH_6_DESC, 30, 1.3]
    mechEventId.append(6)
    
    lbl_0:

    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK, STR_CAT_RANDOM_PACK_2, true, 1):
        goto lbl_1

    # ================================================
    # Pack 2: Buffs
    # ================================================
    
    buffEvent[9] = [STR_EVT_BUFF_9_TITLE, STR_EVT_BUFF_9_DESC.format(EVT_9_SPEED_BOOST, EVT_9_DMG_TAKEN * -1), 20, 1.2]
    buffEventId.append(9)
    
    buffEvent[10] = [STR_EVT_BUFF_10_TITLE, STR_EVT_BUFF_10_DESC, 60, 0.8]
    buffEventId.append(10)
    buffEvent[11] = [STR_EVT_BUFF_11_TITLE, STR_EVT_BUFF_11_DESC, 30, 0.7]
    buffEventId.append(11)
   
    buffEvent[12] = [STR_EVT_BUFF_12_TITLE, STR_EVT_BUFF_12_DESC.format(Button.INTERACT), 120, 1.2]
    buffEventId.append(12)
    
    buffEvent[13] = [STR_EVT_BUFF_13_TITLE, STR_EVT_BUFF_13_DESC.format(EVT_13_CHECKPOINT_INTERVAL), 120, 0.6]
    buffEventId.append(13)
    
    buffEvent[14] = [STR_EVT_BUFF_14_TITLE, STR_EVT_BUFF_14_DESC.format(EVT_14_SHIELD_PERCENT * 100), 120, 0.9]
    buffEventId.append(14)

    # ================================================
    # Pack 2: Debuffs
    # ================================================
    
    debuffEvent[5] = [STR_EVT_DEBUFF_5_TITLE, STR_EVT_DEBUFF_5_DESC.format(EVT_DEBUFF_5_SPEED_REDUCTION), 20, 1.0]
    debuffEventId.append(5)
    
    debuffEvent[6] = [STR_EVT_DEBUFF_6_TITLE, STR_EVT_DEBUFF_6_DESC.format(EVT_DEBUFF_6_MAX_SPEED_DEC * -1), 30, 1.3]
    debuffEventId.append(6)
    
    debuffEvent[7] = [STR_EVT_DEBUFF_7_TITLE, STR_EVT_DEBUFF_7_DESC.format(EVT_DEBUFF_7_RADIUS), 8, 1.2]
    debuffEventId.append(7)
    
    debuffEvent[8] = [STR_EVT_DEBUFF_8_TITLE, STR_EVT_DEBUFF_8_DESC.format(EVT_DEBUFF_8_DMG_PERCENT * 100), 30, 1.1]
    debuffEventId.append(8)
    
    debuffEvent[9] = [STR_EVT_DEBUFF_9_TITLE, STR_EVT_DEBUFF_9_DESC.format(EVT_DEBUFF_9_DMG_STILL * 100, EVT_DEBUFF_9_DMG_MOVING * 100), 45, 1.3]
    debuffEventId.append(9)
    
    debuffEvent[10] = [STR_EVT_DEBUFF_10_TITLE, STR_EVT_DEBUFF_10_DESC.format(EVT_DEBUFF_10_DMG_FACTOR * 100, EVT_DEBUFF_10_RADIUS), 30, 1.2]
    debuffEventId.append(10)
    
    debuffEvent[11] = [STR_EVT_DEBUFF_11_TITLE, STR_EVT_DEBUFF_11_DESC.format(EVT_DEBUFF_11_BERSERK_ADD), 45, 0.8]
    debuffEventId.append(11)
    
    debuffEvent[12] = [STR_EVT_DEBUFF_12_TITLE, STR_EVT_DEBUFF_12_DESC.format(EVT_DEBUFF_12_KNOCKDOWN_DURATION), 2, 1.0]
    debuffEventId.append(12)

    # ================================================
    # Pack 2: Mechanics
    # ================================================
    
    mechEvent[7] = [STR_EVT_MECH_7_TITLE, STR_EVT_MECH_7_DESC, 45, 1.2]
    mechEventId.append(7)
    
    mechEvent[8] = [STR_EVT_MECH_8_TITLE, STR_EVT_MECH_8_DESC, 30, 1.2]
    mechEventId.append(8)
    
    mechEvent[9] = [STR_EVT_MECH_9_TITLE, STR_EVT_MECH_9_DESC, 45, 0.9]
    mechEventId.append(9)
    
    lbl_1:

    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK, STR_CAT_RANDOM_PACK_3, true, 1):
        goto lbl_2
    
    # ================================================
    # Pack 3: Buffs
    # ================================================
    
    buffEvent[15] = [STR_EVT_BUFF_15_TITLE, STR_EVT_BUFF_15_DESC, 90, 0]
    buffEventId.append(15)
    
    buffEvent[16] = [STR_EVT_BUFF_16_TITLE, STR_EVT_BUFF_16_DESC.format(EVT_16_CHECK_INTERVAL, EVT_16_INVINCIBLE_DURATION), 30, 0.4]
    buffEventId.append(16)
    
    buffEvent[17] = [STR_EVT_BUFF_17_TITLE, STR_EVT_BUFF_17_DESC, 120, 1.1]
    buffEventId.append(17)
    
    buffEvent[18] = [STR_EVT_BUFF_18_TITLE, STR_EVT_BUFF_18_DESC.format(EVT_18_KNOCKBACK_RESISTANCE * -1, EVT_18_DMG_REDUCE_PER_STACK, EVT_18_HEAL_PERCENT * 100), 120, 0.5]
    buffEventId.append(18)
    
    buffEvent[19] = [STR_EVT_BUFF_19_TITLE, STR_EVT_BUFF_19_DESC.format(EVT_19_TRIGGER_HP_PERCENT * 100, EVT_19_INVINCIBLE_DURATION), 30, 1.2]
    buffEventId.append(19)
    
    buffEvent[20] = [STR_EVT_BUFF_20_TITLE, STR_EVT_BUFF_20_DESC.format(EVT_20_DISTANCE_GOAL, EVT_20_REWARD_SPEED), 45, 0.8]
    buffEventId.append(20)
    
    buffEvent[21] = [STR_EVT_BUFF_21_TITLE, STR_EVT_BUFF_21_DESC.format(EVT_21_HP_GAIN_FLAT, EVT_21_HP_MULTIPLIER), 90, 0.9]
    buffEventId.append(21)
    
    buffEvent[22] = [STR_EVT_BUFF_22_TITLE, STR_EVT_BUFF_22_DESC.format(EVT_22_HEAL_BOOST), 90, 0.5]
    buffEventId.append(22)
    
    buffEvent[23] = [STR_EVT_BUFF_23_TITLE, STR_EVT_BUFF_23_DESC.format(EVT_23_DMG_REDUCTION_DURING_ULT * -1), 120, 1.2]
    buffEventId.append(23)
 
    # ================================================
    # Pack 3: Debuffs
    # ================================================
    
    debuffEvent[13] = [STR_EVT_DEBUFF_13_TITLE, STR_EVT_DEBUFF_13_DESC.format(EVT_DEBUFF_13_HEAL_DEALT_RED * -1), 45, 1.5]
    debuffEventId.append(13)
   
    debuffEvent[14] = [STR_EVT_DEBUFF_14_TITLE, STR_EVT_DEBUFF_14_DESC.format(EVT_DEBUFF_14_INTERVAL, EVT_DEBUFF_14_DAMAGE_PERCENT * 100), 30, 1.2]
    debuffEventId.append(14)
    
    debuffEvent[15] = [STR_EVT_DEBUFF_15_TITLE, STR_EVT_DEBUFF_15_DESC.format(EVT_DEBUFF_15_STACKS_TAKE), 5, 0.4]
    debuffEventId.append(15)

    # ================================================
    # Pack 3: Mechanics
    # ================================================
    
    mechEvent[0] = [STR_EVT_MECH_0_TITLE, STR_EVT_MECH_0_DESC.format(EVT_MECH_0_DMG_TAKEN * -1, EVT_MECH_0_HP_PERCENT * 100), 60, 0.8]
    mechEventId.append(0)
    
    # ================================================
    # Pack 3: Mechanics
    # ================================================

    mechEvent[10] = [STR_EVT_MECH_10_TITLE, STR_EVT_MECH_10_DESC, 90, 0.8]
    mechEventId.append(10)
    
    mechEvent[11] = [STR_EVT_MECH_11_TITLE, STR_EVT_MECH_11_DESC, 90, 1.1]
    mechEventId.append(11)
    
    mechEvent[12] = [STR_EVT_MECH_12_TITLE, STR_EVT_MECH_12_DESC.format(Button.JUMP, EVT_MECH_12_DMG_TAKEN * -1), 30, 1.0]
    mechEventId.append(12)
   
    mechEvent[13] = [STR_EVT_MECH_13_TITLE, STR_EVT_MECH_13_DESC.format(Button.RELOAD), 15, 0.8]
    mechEventId.append(13)
    
    lbl_2:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK, STR_CAT_RANDOM_PACK_4, true, 1):
        goto lbl_3

    # ================================================
    # Pack 4: Buffs
    # ================================================
    buffEvent[24] = [STR_EVT_BUFF_24_TITLE, STR_EVT_BUFF_24_DESC.format(EVT_24_SPEED_BOOST), 45, 1.2]
    buffEventId.append(24)

    buffEvent[25] = [STR_EVT_BUFF_25_TITLE, STR_EVT_BUFF_25_DESC, 60, 0]
    buffEventId.append(25)

    buffEvent[26] = [STR_EVT_BUFF_26_TITLE, STR_EVT_BUFF_26_DESC, 60, 1]
    buffEventId.append(26)

    buffEvent[27] = [STR_EVT_BUFF_27_TITLE, STR_EVT_BUFF_27_DESC.format(EVT_27_REWARD_DMG_PERMA), 120, 0.8]
    buffEventId.append(27)

    buffEvent[28] = [STR_EVT_BUFF_28_TITLE, STR_EVT_BUFF_28_DESC.format(EVT_28_HOT_FLAT, EVT_28_HOT_MAXHP_FACTOR * 100), 90, 0.7]
    buffEventId.append(28)

    buffEvent[29] = [STR_EVT_BUFF_29_TITLE, STR_EVT_BUFF_29_DESC, 30, 0]
    buffEventId.append(29)

    buffEvent[30] = [STR_EVT_BUFF_30_TITLE, STR_EVT_BUFF_30_DESC.format(EVT_30_HEAL_RADIUS, EVT_30_HOT_FLAT, EVT_30_HOT_MAXHP_FACTOR * 100), 60, 0.4]
    buffEventId.append(30)

    buffEvent[31] = [STR_EVT_BUFF_31_TITLE, STR_EVT_BUFF_31_DESC, 30, 0.3]
    buffEventId.append(31)

    buffEvent[32] = [STR_EVT_BUFF_32_TITLE, STR_EVT_BUFF_32_DESC, 60, 0.25]
    buffEventId.append(32)

    buffEvent[33] = [STR_EVT_BUFF_33_TITLE, STR_EVT_BUFF_33_DESC, 90, 0.1]
    buffEventId.append(33)
    
    # ================================================
    # Pack 4: Debuffs
    # ================================================
    debuffEvent[16] = [STR_EVT_DEBUFF_16_TITLE, STR_EVT_DEBUFF_16_DESC, 45, 1.1]
    debuffEventId.append(16)

    debuffEvent[17] = [STR_EVT_DEBUFF_17_TITLE, STR_EVT_DEBUFF_17_DESC, 25, 1.1]
    debuffEventId.append(17)

    debuffEvent[18] = [STR_EVT_DEBUFF_18_TITLE, STR_EVT_DEBUFF_18_DESC, 25, 0.85]
    debuffEventId.append(18)

    debuffEvent[19] = [STR_EVT_DEBUFF_19_TITLE, STR_EVT_DEBUFF_19_DESC, 45, 0.7]
    debuffEventId.append(19)

    debuffEvent[20] = [STR_EVT_DEBUFF_20_TITLE, STR_EVT_DEBUFF_20_DESC, 60, 0.6]
    debuffEventId.append(20)

    debuffEvent[21] = [STR_EVT_DEBUFF_21_TITLE, STR_EVT_DEBUFF_21_DESC, 30, 0.2]
    debuffEventId.append(21)
    

    # ================================================
    # Pack 4: Mechanics
    # ================================================
    mechEvent[14] = [STR_EVT_MECH_14_TITLE, STR_EVT_MECH_14_DESC.format(Button.RELOAD), 15, 1.2]
    mechEventId.append(14)
    
    mechEvent[15] = [STR_EVT_MECH_15_TITLE, STR_EVT_MECH_15_DESC.format(Button.RELOAD), 30, 1]
    mechEventId.append(15)
    
    mechEvent[16] = [STR_EVT_MECH_16_TITLE, STR_EVT_MECH_16_DESC.format(Button.RELOAD), 15, 1.1]
    mechEventId.append(16)
    
    mechEvent[17] = [STR_EVT_MECH_17_TITLE, STR_EVT_MECH_17_DESC, 5, 0.8]
    mechEventId.append(17)

    mechEvent[18] = [STR_EVT_MECH_18_TITLE, STR_EVT_MECH_18_DESC.format(Button.RELOAD), 30, 0.8]
    mechEventId.append(18)
    
    mechEvent[19] = [STR_EVT_MECH_19_TITLE, STR_EVT_MECH_19_DESC, 90, 0.6]
    mechEventId.append(19)

    mechEvent[20] = [STR_EVT_MECH_20_TITLE, STR_EVT_MECH_20_DESC, 90, 0.6]
    mechEventId.append(20)
  
    mechEvent[21] = [STR_EVT_MECH_21_TITLE, STR_EVT_MECH_21_DESC, 15, 0.8]
    mechEventId.append(21)

    mechEvent[22] = [STR_EVT_MECH_22_TITLE, STR_EVT_MECH_22_DESC.format(Button.RELOAD), 15, 0.4]
    mechEventId.append(22)
    
    mechEvent[23] = [STR_EVT_MECH_23_TITLE, STR_EVT_MECH_23_DESC, 120, 0.4]
    mechEventId.append(23)
    
    mechEvent[24] = [STR_EVT_MECH_24_TITLE, STR_EVT_MECH_24_DESC, 120, 0.2]
    mechEventId.append(24)

    lbl_3: