#!mainFile "../main.opy"

#!include "./config_effects.opy"


#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

rule "initialize event array":
    @Condition vishkarEventActivated == true

    eventWeight = 2.5
    
    # ================================================
    # 全局事件 (Global Events)
    # ================================================
    globalEvent = []
    globalEventId = []
    
    globalEvent[0] = [STR_EVT_GLOBAL_0_TITLE, STR_EVT_GLOBAL_0_DESC, 120, 1.0]
    globalEventId.append(0)
    
    globalEvent[1] = [STR_EVT_GLOBAL_1_TITLE, STR_EVT_GLOBAL_1_DESC, 60, 1.0]
    globalEventId.append(1)
    
    globalEvent[2] = [STR_EVT_GLOBAL_2_TITLE, STR_EVT_GLOBAL_2_DESC, 120, 1.0]
    globalEventId.append(2)
    
    globalEvent[3] = [STR_EVT_GLOBAL_3_TITLE, STR_EVT_GLOBAL_3_DESC, 120, 1.0]
    
    globalEvent[4] = [STR_EVT_GLOBAL_4_TITLE, STR_EVT_GLOBAL_4_DESC, 600, 1.0]
    globalEventId.append(4)
    
    # ================================================
    # 增益事件 (Buff Events)
    # ================================================
    buffEvent = []
    buffEventId = []
    
    # Pack 0 - Special
    buffEvent[0] = [STR_EVT_BUFF_0_TITLE, STR_EVT_BUFF_0_DESC, 5, 2]
    buffEventId.append(0)
    
    # ================================================
    # Pack 1: Buffs
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_1_TITLE, true, 1):
        goto lbl_0
    buffEvent[1] = [STR_EVT_BUFF_1_TITLE, STR_EVT_BUFF_1_DESC.format(EVT_1_SPEED_BOOST), 25, 1.4]
    buffEventId.append(1)
    lbl_0:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_2_TITLE, true, 2):
        goto lbl_1
    buffEvent[2] = [STR_EVT_BUFF_2_TITLE, STR_EVT_BUFF_2_DESC.format(EVT_2_ARMOR_AMOUNT, EVT_2_DMG_TAKEN * -1), 25, 1.1]
    buffEventId.append(2)
    lbl_1:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_3_TITLE, true, 3):
        goto lbl_2
    buffEvent[3] = [STR_EVT_BUFF_3_TITLE, STR_EVT_BUFF_3_DESC.format(EVT_3_DMG_TAKEN * -1), 20, 1.2]
    buffEventId.append(3)
    lbl_2:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_4_TITLE, true, 4):
        goto lbl_3
    buffEvent[4] = [STR_EVT_BUFF_4_TITLE, STR_EVT_BUFF_4_DESC.format(EVT_4_HEAL_PERCENT * 100), 30, 1.1]
    buffEventId.append(4)
    lbl_3:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_5_TITLE, true, 5):
        goto lbl_4
    buffEvent[5] = [STR_EVT_BUFF_5_TITLE, STR_EVT_BUFF_5_DESC, 20, 1.6]
    buffEventId.append(5)
    lbl_4:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_6_TITLE, true, 6):
        goto lbl_5
    buffEvent[6] = [STR_EVT_BUFF_6_TITLE, STR_EVT_BUFF_6_DESC.format(EVT_6_SPEED_INC_PER_SEC), 45, 1.3]
    buffEventId.append(6)
    lbl_5:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_7_TITLE, true, 7):
        goto lbl_6
    buffEvent[7] = [STR_EVT_BUFF_7_TITLE, STR_EVT_BUFF_7_DESC.format(EVT_7_BASE_HEALTH, EVT_7_HEALTH_PERCENT * 100, EVT_7_REGEN_INTERVAL), 90, 1.1]
    buffEventId.append(7)
    lbl_6:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_8_TITLE, true, 8):
        goto lbl_7
    buffEvent[8] = [STR_EVT_BUFF_8_TITLE, STR_EVT_BUFF_8_DESC.format(EVT_8_HP_PERCENT_PER_STACK), 120, 1]
    buffEventId.append(8)
    lbl_7:
    
    # ================================================
    # Pack 2: Buffs
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_9_TITLE, true, 9):
        goto lbl_8
    buffEvent[9] = [STR_EVT_BUFF_9_TITLE, STR_EVT_BUFF_9_DESC.format(EVT_9_SPEED_BOOST, EVT_9_DMG_TAKEN * -1), 20, 1.2]
    buffEventId.append(9)
    lbl_8:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_10_TITLE, true, 10):
        goto lbl_9
    buffEvent[10] = [STR_EVT_BUFF_10_TITLE, STR_EVT_BUFF_10_DESC, 60, 0.8]
    buffEventId.append(10)
    lbl_9:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_11_TITLE, true, 11):
        goto lbl_10
    buffEvent[11] = [STR_EVT_BUFF_11_TITLE, STR_EVT_BUFF_11_DESC, 30, 0.7]
    buffEventId.append(11)
    lbl_10:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_12_TITLE, true, 12):
        goto lbl_11
    buffEvent[12] = [STR_EVT_BUFF_12_TITLE, STR_EVT_BUFF_12_DESC.format(Button.INTERACT), 120, 1.2]
    buffEventId.append(12)
    lbl_11:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_13_TITLE, true, 13):
        goto lbl_12
    buffEvent[13] = [STR_EVT_BUFF_13_TITLE, STR_EVT_BUFF_13_DESC.format(EVT_13_CHECKPOINT_INTERVAL), 120, 0.6]
    buffEventId.append(13)
    lbl_12:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_14_TITLE, true, 14):
        goto lbl_13
    buffEvent[14] = [STR_EVT_BUFF_14_TITLE, STR_EVT_BUFF_14_DESC.format(EVT_14_SHIELD_PERCENT * 100), 120, 0.9]
    buffEventId.append(14)
    lbl_13:
    
    # ================================================
    # Pack 3: Buffs
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_15_TITLE, true, 15):
        goto lbl_14
    buffEvent[15] = [STR_EVT_BUFF_15_TITLE, STR_EVT_BUFF_15_DESC, 90, 2.0]
    buffEventId.append(15)
    lbl_14:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_16_TITLE, true, 16):
        goto lbl_15
    buffEvent[16] = [STR_EVT_BUFF_16_TITLE, STR_EVT_BUFF_16_DESC.format(EVT_16_CHECK_INTERVAL, EVT_16_INVINCIBLE_DURATION), 30, 0.4]
    buffEventId.append(16)
    lbl_15:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_17_TITLE, true, 17):
        goto lbl_16
    buffEvent[17] = [STR_EVT_BUFF_17_TITLE, STR_EVT_BUFF_17_DESC, 120, 1.1]
    buffEventId.append(17)
    lbl_16:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_18_TITLE, true, 18):
        goto lbl_17
    buffEvent[18] = [STR_EVT_BUFF_18_TITLE, STR_EVT_BUFF_18_DESC.format(EVT_18_KNOCKBACK_RESISTANCE * -1, EVT_18_DMG_REDUCE_PER_STACK, EVT_18_HEAL_PERCENT * 100), 120, 0.5]
    buffEventId.append(18)
    lbl_17:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_19_TITLE, true, 19):
        goto lbl_18
    buffEvent[19] = [STR_EVT_BUFF_19_TITLE, STR_EVT_BUFF_19_DESC.format(EVT_19_TRIGGER_HP_PERCENT * 100, EVT_19_INVINCIBLE_DURATION), 30, 1.2]
    buffEventId.append(19)
    lbl_18:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_20_TITLE, true, 20):
        goto lbl_19
    buffEvent[20] = [STR_EVT_BUFF_20_TITLE, STR_EVT_BUFF_20_DESC.format(EVT_20_DISTANCE_GOAL, EVT_20_REWARD_SPEED), 45, 0.8]
    buffEventId.append(20)
    lbl_19:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_21_TITLE, true, 21):
        goto lbl_20
    buffEvent[21] = [STR_EVT_BUFF_21_TITLE, STR_EVT_BUFF_21_DESC.format(EVT_21_HP_GAIN_FLAT, EVT_21_HP_MULTIPLIER), 90, 0.9]
    buffEventId.append(21)
    lbl_20:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_22_TITLE, true, 22):
        goto lbl_21
    buffEvent[22] = [STR_EVT_BUFF_22_TITLE, STR_EVT_BUFF_22_DESC.format(EVT_22_HEAL_BOOST), 90, 0.5]
    buffEventId.append(22)
    lbl_21:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_23_TITLE, true, 23):
        goto lbl_22
    buffEvent[23] = [STR_EVT_BUFF_23_TITLE, STR_EVT_BUFF_23_DESC.format(EVT_23_DMG_REDUCTION_DURING_ULT * -1), 120, 1.2]
    buffEventId.append(23)
    lbl_22:
    
    # ================================================
    # Pack 4: Buffs
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_BUFF, STR_EVT_BUFF_24_TITLE, true, 24):
        goto lbl_23
    buffEvent[24] = [STR_EVT_BUFF_24_TITLE, STR_EVT_BUFF_24_DESC, 45, 1.2]
    buffEventId.append(24)
    lbl_23:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_BUFF, STR_EVT_BUFF_25_TITLE, true, 25):
        goto lbl_24
    buffEvent[25] = [STR_EVT_BUFF_25_TITLE, STR_EVT_BUFF_25_DESC, 60, 1.1]
    buffEventId.append(25)
    lbl_24:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_BUFF, STR_EVT_BUFF_26_TITLE, true, 26):
        goto lbl_25
    buffEvent[26] = [STR_EVT_BUFF_26_TITLE, STR_EVT_BUFF_26_DESC, 60, 1]
    buffEventId.append(26)
    lbl_25:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_BUFF, STR_EVT_BUFF_27_TITLE, true, 27):
        goto lbl_26
    buffEvent[27] = [STR_EVT_BUFF_27_TITLE, STR_EVT_BUFF_27_DESC.format(len(getPlayers(Team.2))), 120, 0.8]
    buffEventId.append(27)
    lbl_26:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_BUFF, STR_EVT_BUFF_28_TITLE, true, 28):
        goto lbl_27
    buffEvent[28] = [STR_EVT_BUFF_28_TITLE, STR_EVT_BUFF_28_DESC, 90, 0.7]
    buffEventId.append(28)
    lbl_27:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_BUFF, STR_EVT_BUFF_29_TITLE, true, 29):
        goto lbl_28
    buffEvent[29] = [STR_EVT_BUFF_29_TITLE, STR_EVT_BUFF_29_DESC, 30, 0.5]
    buffEventId.append(29)
    lbl_28:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_BUFF, STR_EVT_BUFF_30_TITLE, true, 30):
        goto lbl_29
    buffEvent[30] = [STR_EVT_BUFF_30_TITLE, STR_EVT_BUFF_30_DESC, 90, 0.4]
    buffEventId.append(30)
    lbl_29:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_BUFF, STR_EVT_BUFF_31_TITLE, true, 31):
        goto lbl_30
    buffEvent[31] = [STR_EVT_BUFF_31_TITLE, STR_EVT_BUFF_31_DESC, 30, 0.3]
    buffEventId.append(31)
    lbl_30:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_BUFF, STR_EVT_BUFF_32_TITLE, true, 32):
        goto lbl_31
    buffEvent[32] = [STR_EVT_BUFF_32_TITLE, STR_EVT_BUFF_32_DESC, 60, 0.25]
    buffEventId.append(32)
    lbl_31:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_BUFF, STR_EVT_BUFF_33_TITLE, true, 33):
        goto lbl_32
    buffEvent[33] = [STR_EVT_BUFF_33_TITLE, STR_EVT_BUFF_33_DESC, 90, 0.1]
    buffEventId.append(33)
    lbl_32:
    
    # ================================================
    # 减益事件 (Debuff Events)
    # ================================================
    debuffEvent = []
    debuffEventId = []
    
    # ================================================
    # Pack 1: Debuffs
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_DEBUFF, STR_EVT_DEBUFF_0_TITLE, true):
        goto lbl_33
    debuffEvent[0] = [STR_EVT_DEBUFF_0_TITLE, STR_EVT_DEBUFF_0_DESC, 20, 1.4]
    debuffEventId.append(0)
    lbl_33:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_DEBUFF, STR_EVT_DEBUFF_1_TITLE, true, 1):
        goto lbl_34
    debuffEvent[1] = [STR_EVT_DEBUFF_1_TITLE, STR_EVT_DEBUFF_1_DESC, 8, 1.1]
    debuffEventId.append(1)
    lbl_34:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_DEBUFF, STR_EVT_DEBUFF_2_TITLE, true, 2):
        goto lbl_35
    debuffEvent[2] = [STR_EVT_DEBUFF_2_TITLE, STR_EVT_DEBUFF_2_DESC, 30, 0.8]
    debuffEventId.append(2)
    lbl_35:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_DEBUFF, STR_EVT_DEBUFF_3_TITLE, true, 3):
        goto lbl_36
    debuffEvent[3] = [STR_EVT_DEBUFF_3_TITLE, STR_EVT_DEBUFF_3_DESC.format(EVT_DEBUFF_3_DMG_TAKEN), 25, 1.2]
    debuffEventId.append(3)
    lbl_36:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_DEBUFF, STR_EVT_DEBUFF_4_TITLE, true, 4):
        goto lbl_37
    debuffEvent[4] = [STR_EVT_DEBUFF_4_TITLE, STR_EVT_DEBUFF_4_DESC, 25, 1.1]
    debuffEventId.append(4)
    lbl_37:
    
    # ================================================
    # Pack 2: Debuffs
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_5_TITLE, true, 5):
        goto lbl_38
    debuffEvent[5] = [STR_EVT_DEBUFF_5_TITLE, STR_EVT_DEBUFF_5_DESC, 20, 1.0]
    debuffEventId.append(5)
    lbl_38:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_6_TITLE, true, 5):
        goto lbl_39
    debuffEvent[6] = [STR_EVT_DEBUFF_6_TITLE, STR_EVT_DEBUFF_6_DESC, 30, 1.3]
    debuffEventId.append(6)
    lbl_39:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_7_TITLE, true, 7):
        goto lbl_40
    debuffEvent[7] = [STR_EVT_DEBUFF_7_TITLE, STR_EVT_DEBUFF_7_DESC, 8, 1.2]
    debuffEventId.append(7)
    lbl_40:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_8_TITLE, true, 8):
        goto lbl_41
    debuffEvent[8] = [STR_EVT_DEBUFF_8_TITLE, STR_EVT_DEBUFF_8_DESC, 30, 1.1]
    debuffEventId.append(8)
    lbl_41:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_9_TITLE, true, 9):
        goto lbl_42
    debuffEvent[9] = [STR_EVT_DEBUFF_9_TITLE, STR_EVT_DEBUFF_9_DESC, 45, 1.3]
    debuffEventId.append(9)
    lbl_42:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_10_TITLE, true, 10):
        goto lbl_43
    debuffEvent[10] = [STR_EVT_DEBUFF_10_TITLE, STR_EVT_DEBUFF_10_DESC, 30, 1.2]
    debuffEventId.append(10)
    lbl_43:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_11_TITLE, true, 11):
        goto lbl_44
    debuffEvent[11] = [STR_EVT_DEBUFF_11_TITLE, STR_EVT_DEBUFF_11_DESC, 45, 0.8]
    debuffEventId.append(11)
    lbl_44:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_12_TITLE, true, 12):
        goto lbl_45
    debuffEvent[12] = [STR_EVT_DEBUFF_12_TITLE, STR_EVT_DEBUFF_12_DESC, 2, 1.0]
    debuffEventId.append(12)
    lbl_45:
    
    # ================================================
    # Pack 3: Debuffs
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_DEBUFF, STR_EVT_DEBUFF_13_TITLE, true, 13):
        goto lbl_46
    debuffEvent[13] = [STR_EVT_DEBUFF_13_TITLE, STR_EVT_DEBUFF_13_DESC.format(EVT_DEBUFF_13_HEAL_DEALT_RED * -1), 45, 1.5]
    debuffEventId.append(13)
    lbl_46:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_DEBUFF, STR_EVT_DEBUFF_14_TITLE, true, 14):
        goto lbl_47
    debuffEvent[14] = [STR_EVT_DEBUFF_14_TITLE, STR_EVT_DEBUFF_14_DESC.format(EVT_DEBUFF_14_INTERVAL, EVT_DEBUFF_14_DAMAGE_PERCENT * 100), 30, 1.2]
    debuffEventId.append(14)
    lbl_47:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_DEBUFF, STR_EVT_DEBUFF_15_TITLE, true, 15):
        goto lbl_48
    debuffEvent[15] = [STR_EVT_DEBUFF_15_TITLE, STR_EVT_DEBUFF_15_DESC, 5, 0.4]
    debuffEventId.append(15)
    lbl_48:
    
    # ================================================
    # Pack 4: Debuffs
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_DEBUFF, STR_EVT_DEBUFF_16_TITLE, true, 16):
        goto lbl_49
    debuffEvent[16] = [STR_EVT_DEBUFF_16_TITLE, STR_EVT_DEBUFF_16_DESC, 75, 1.1]
    debuffEventId.append(16)
    lbl_49:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_DEBUFF, STR_EVT_DEBUFF_17_TITLE, true, 17):
        goto lbl_50
    debuffEvent[17] = [STR_EVT_DEBUFF_17_TITLE, STR_EVT_DEBUFF_17_DESC, 25, 1.1]
    debuffEventId.append(17)
    lbl_50:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_DEBUFF, STR_EVT_DEBUFF_18_TITLE, true, 18):
        goto lbl_51
    debuffEvent[18] = [STR_EVT_DEBUFF_18_TITLE, STR_EVT_DEBUFF_18_DESC, 25, 0.85]
    debuffEventId.append(18)
    lbl_51:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_DEBUFF, STR_EVT_DEBUFF_19_TITLE, true, 19):
        goto lbl_52
    debuffEvent[19] = [STR_EVT_DEBUFF_19_TITLE, STR_EVT_DEBUFF_19_DESC, 90, 0.7]
    debuffEventId.append(19)
    lbl_52:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_DEBUFF, STR_EVT_DEBUFF_20_TITLE, true, 20):
        goto lbl_53
    debuffEvent[20] = [STR_EVT_DEBUFF_20_TITLE, STR_EVT_DEBUFF_20_DESC, 60, 0.6]
    debuffEventId.append(20)
    lbl_53:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_DEBUFF, STR_EVT_DEBUFF_21_TITLE, true, 21):
        goto lbl_54
    debuffEvent[21] = [STR_EVT_DEBUFF_21_TITLE, STR_EVT_DEBUFF_21_DESC, 30, 0.2]
    debuffEventId.append(21)
    lbl_54:
    
    # ================================================
    # 机制事件 (Mech Events)
    # ================================================
    mechEvent = []
    mechEventId = []
    
    # ================================================
    # Pack 3: Mechanics
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_MECH, STR_EVT_MECH_0_TITLE, true):
        goto lbl_55
    mechEvent[0] = [STR_EVT_MECH_0_TITLE, STR_EVT_MECH_0_DESC.format(EVT_MECH_0_DMG_TAKEN * -1, EVT_MECH_0_HP_PERCENT * 100), 60, 0.8]
    mechEventId.append(0)
    lbl_55:
    
    # ================================================
    # Pack 1: Mechanics
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_1_TITLE, true, 1):
        goto lbl_56
    mechEvent[1] = [STR_EVT_MECH_1_TITLE, STR_EVT_MECH_1_DESC.format(EVT_MECH_1_HP_MULTIPLIER * 100, EVT_MECH_1_SPEED_PENALTY * -1), 15, 1.2]
    mechEventId.append(1)
    lbl_56:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_2_TITLE, true, 2):
        goto lbl_57
    mechEvent[2] = [STR_EVT_MECH_2_TITLE, STR_EVT_MECH_2_DESC.format(Button.RELOAD), 15, 1.4]
    mechEventId.append(2)
    lbl_57:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_3_TITLE, true, 3):
        goto lbl_58
    mechEvent[3] = [STR_EVT_MECH_3_TITLE, STR_EVT_MECH_3_DESC, 45, 0]
    mechEventId.append(3)
    lbl_58:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_4_TITLE, true, 4):
        goto lbl_59
    mechEvent[4] = [STR_EVT_MECH_4_TITLE, STR_EVT_MECH_4_DESC, 60, 0.8]
    mechEventId.append(4)
    lbl_59:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_5_TITLE, true, 5):
        goto lbl_60
    mechEvent[5] = [STR_EVT_MECH_5_TITLE, STR_EVT_MECH_5_DESC, 60, 1.2]
    mechEventId.append(5)
    lbl_60:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_6_TITLE, true, 6):
        goto lbl_61
    mechEvent[6] = [STR_EVT_MECH_6_TITLE, STR_EVT_MECH_6_DESC, 30, 1.3]
    mechEventId.append(6)
    lbl_61:
    
    # ================================================
    # Pack 2: Mechanics
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_MECH, STR_EVT_MECH_7_TITLE, true, 7):
        goto lbl_62
    mechEvent[7] = [STR_EVT_MECH_7_TITLE, STR_EVT_MECH_7_DESC, 45, 1.2]
    mechEventId.append(7)
    lbl_62:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_MECH, STR_EVT_MECH_8_TITLE, true, 8):
        goto lbl_63
    mechEvent[8] = [STR_EVT_MECH_8_TITLE, STR_EVT_MECH_8_DESC, 30, 1.2]
    mechEventId.append(8)
    lbl_63:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_MECH, STR_EVT_MECH_9_TITLE, true, 9):
        goto lbl_64
    mechEvent[9] = [STR_EVT_MECH_9_TITLE, STR_EVT_MECH_9_DESC, 45, 0.9]
    mechEventId.append(9)
    lbl_64:
    
    # ================================================
    # Pack 3: Mechanics
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_MECH, STR_EVT_MECH_10_TITLE, true, 10):
        goto lbl_65
    mechEvent[10] = [STR_EVT_MECH_10_TITLE, STR_EVT_MECH_10_DESC, 90, 0.8]
    mechEventId.append(10)
    lbl_65:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_MECH, STR_EVT_MECH_11_TITLE, true, 11):
        goto lbl_66
    mechEvent[11] = [STR_EVT_MECH_11_TITLE, STR_EVT_MECH_11_DESC, 90, 1.1]
    mechEventId.append(11)
    lbl_66:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_MECH, STR_EVT_MECH_12_TITLE, true, 12):
        goto lbl_67
    mechEvent[12] = [STR_EVT_MECH_12_TITLE, STR_EVT_MECH_12_DESC.format(Button.JUMP, EVT_MECH_12_DMG_TAKEN * -1), 30, 1.0]
    mechEventId.append(12)
    lbl_67:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_MECH, STR_EVT_MECH_13_TITLE, true, 13):
        goto lbl_68
    mechEvent[13] = [STR_EVT_MECH_13_TITLE, STR_EVT_MECH_13_DESC.format(Button.RELOAD), 15, 0.8]
    mechEventId.append(13)
    lbl_68:
    
    # ================================================
    # Pack 4: Mechanics
    # ================================================
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_MECH, STR_EVT_MECH_14_TITLE, true, 14):
        goto lbl_69
    mechEvent[14] = [STR_EVT_MECH_14_TITLE, STR_EVT_MECH_14_DESC.format(Button.RELOAD), 15, 1.2]
    mechEventId.append(14)
    lbl_69:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_MECH, STR_EVT_MECH_15_TITLE, true, 15):
        goto lbl_70
    mechEvent[15] = [STR_EVT_MECH_15_TITLE, STR_EVT_MECH_15_DESC.format(Button.RELOAD), 30, 1]
    mechEventId.append(15)
    lbl_70:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_MECH, STR_EVT_MECH_16_TITLE, true, 16):
        goto lbl_71
    mechEvent[16] = [STR_EVT_MECH_16_TITLE, STR_EVT_MECH_16_DESC.format(Button.RELOAD), 15, 1.1]
    mechEventId.append(16)
    lbl_71:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_MECH, STR_EVT_MECH_17_TITLE, true, 17):
        goto lbl_72
    mechEvent[17] = [STR_EVT_MECH_17_TITLE, STR_EVT_MECH_17_DESC, 5, 0.8]
    mechEventId.append(17)
    lbl_72:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_MECH, STR_EVT_MECH_18_TITLE, true, 18):
        goto lbl_73
    mechEvent[18] = [STR_EVT_MECH_18_TITLE, STR_EVT_MECH_18_DESC.format(Button.RELOAD), 30, 0.8]
    mechEventId.append(18)
    lbl_73:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_MECH, STR_EVT_MECH_19_TITLE, true, 19):
        goto lbl_74
    mechEvent[19] = [STR_EVT_MECH_19_TITLE, STR_EVT_MECH_19_DESC, 90, 0.6]
    mechEventId.append(19)
    lbl_74:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_MECH, STR_EVT_MECH_20_TITLE, true, 20):
        goto lbl_75
    mechEvent[20] = [STR_EVT_MECH_20_TITLE, STR_EVT_MECH_20_DESC, 90, 0.6]
    mechEventId.append(20)
    lbl_75:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_MECH, STR_EVT_MECH_21_TITLE, true, 21):
        goto lbl_76
    mechEvent[21] = [STR_EVT_MECH_21_TITLE, STR_EVT_MECH_21_DESC, 15, 0.8]
    mechEventId.append(21)
    lbl_76:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_MECH, STR_EVT_MECH_22_TITLE, true, 22):
        goto lbl_77
    mechEvent[22] = [STR_EVT_MECH_22_TITLE, STR_EVT_MECH_22_DESC.format(Button.RELOAD), 15, 0.4]
    mechEventId.append(22)
    lbl_77:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_MECH, STR_EVT_MECH_23_TITLE, true, 23):
        goto lbl_78
    mechEvent[23] = [STR_EVT_MECH_23_TITLE, STR_EVT_MECH_23_DESC, 120, 0.4]
    mechEventId.append(23)
    lbl_78:
    
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_4_MECH, STR_EVT_MECH_24_TITLE, true, 24):
        goto lbl_79
    mechEvent[24] = [STR_EVT_MECH_24_TITLE, STR_EVT_MECH_24_DESC, 120, 0.2]
    mechEventId.append(24)
    lbl_79:
