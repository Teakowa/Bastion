#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "initialize event array":
    @Condition vishkarEventActivated == true
    
    globalEvent = []
    globalEventId = []
    globalEventId = []
    globalEvent[0] = [STR_EVT_GLOBAL_0_TITLE, STR_EVT_GLOBAL_0_DESC, 120]
    globalEventId.append(0)
    globalEvent[1] = [STR_EVT_GLOBAL_1_TITLE, STR_EVT_GLOBAL_1_DESC, 60]
    globalEventId.append(1)
    globalEvent[2] = [STR_EVT_GLOBAL_2_TITLE, STR_EVT_GLOBAL_2_DESC, 120]
    globalEventId.append(2)
    globalEvent[3] = [STR_EVT_GLOBAL_3_TITLE, STR_EVT_GLOBAL_3_DESC, 120]
    globalEvent[4] = [STR_EVT_GLOBAL_4_TITLE, STR_EVT_GLOBAL_4_DESC, 600]
    globalEventId.append(4)
    buffEvent = []
    buffEventId = []
    buffEvent[0] = [STR_EVT_BUFF_0_TITLE, STR_EVT_BUFF_0_DESC, 5]
    buffEventId.append(0)
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_1_TITLE, true, 1):
        goto lbl_0
    buffEvent[1] = [STR_EVT_BUFF_1_TITLE, STR_EVT_BUFF_1_DESC, 20]
    buffEventId.append(1)
    lbl_0:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_2_TITLE, true, 2):
        goto lbl_1
    buffEvent[2] = [STR_EVT_BUFF_2_TITLE, STR_EVT_BUFF_2_DESC, 25]
    buffEventId.append(2)
    lbl_1:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_3_TITLE, true, 3):
        goto lbl_2
    buffEvent[3] = [STR_EVT_BUFF_3_TITLE, STR_EVT_BUFF_3_DESC, 20]
    buffEventId.append(3)
    lbl_2:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_4_TITLE, true, 4):
        goto lbl_3
    buffEvent[4] = [STR_EVT_BUFF_4_TITLE, STR_EVT_BUFF_4_DESC, 30]
    buffEventId.append(4)
    lbl_3:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_5_TITLE, true, 5):
        goto lbl_4
    buffEvent[5] = [STR_EVT_BUFF_5_TITLE, STR_EVT_BUFF_5_DESC, 20]
    buffEventId.append(5)
    lbl_4:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_6_TITLE, true, 6):
        goto lbl_5
    buffEvent[6] = [STR_EVT_BUFF_6_TITLE, STR_EVT_BUFF_6_DESC, 45]
    buffEventId.append(6)
    lbl_5:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_7_TITLE, true, 7):
        goto lbl_6
    buffEvent[7] = [STR_EVT_BUFF_7_TITLE, STR_EVT_BUFF_7_DESC, 90]
    buffEventId.append(7)
    lbl_6:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_BUFF, STR_EVT_BUFF_8_TITLE, true, 8):
        goto lbl_7
    buffEvent[8] = [STR_EVT_BUFF_8_TITLE, STR_EVT_BUFF_8_DESC, 120]
    buffEventId.append(8)
    lbl_7:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_9_TITLE, true, 9):
        goto lbl_8
    buffEvent[9] = [STR_EVT_BUFF_9_TITLE, STR_EVT_BUFF_9_DESC, 20]
    buffEventId.append(9)
    lbl_8:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_10_TITLE, true, 10):
        goto lbl_9
    buffEvent[10] = [STR_EVT_BUFF_10_TITLE, STR_EVT_BUFF_10_DESC, 60]
    buffEventId.append(10)
    lbl_9:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_11_TITLE, true, 11):
        goto lbl_10
    buffEvent[11] = [STR_EVT_BUFF_11_TITLE, STR_EVT_BUFF_11_DESC, 30]
    buffEventId.append(11)
    lbl_10:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_12_TITLE, true, 12):
        goto lbl_11
    buffEvent[12] = [STR_EVT_BUFF_12_TITLE, STR_EVT_BUFF_12_DESC.format(Button.INTERACT), 120]
    buffEventId.append(12)
    lbl_11:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_13_TITLE, true, 13):
        goto lbl_12
    buffEvent[13] = [STR_EVT_BUFF_13_TITLE, STR_EVT_BUFF_13_DESC, 120]
    buffEventId.append(13)
    lbl_12:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_BUFF, STR_EVT_BUFF_14_TITLE, true, 14):
        goto lbl_13
    buffEvent[14] = [STR_EVT_BUFF_14_TITLE, STR_EVT_BUFF_14_DESC, 120]
    buffEventId.append(14)
    lbl_13:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_15_TITLE, true, 15):
        goto lbl_14
    buffEvent[15] = [STR_EVT_BUFF_15_TITLE, STR_EVT_BUFF_15_DESC, 90]
    buffEventId.append(15)
    lbl_14:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_16_TITLE, true, 16):
        goto lbl_15
    buffEvent[16] = [STR_EVT_BUFF_16_TITLE, STR_EVT_BUFF_16_DESC, 30]
    buffEventId.append(16)
    lbl_15:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_17_TITLE, true, 17):
        goto lbl_16
    buffEvent[17] = [STR_EVT_BUFF_17_TITLE, STR_EVT_BUFF_17_DESC, 120]
    buffEventId.append(17)
    lbl_16:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_18_TITLE, true, 18):
        goto lbl_17
    buffEvent[18] = [STR_EVT_BUFF_18_TITLE, STR_EVT_BUFF_18_DESC, 120]
    buffEventId.append(18)
    lbl_17:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_19_TITLE, true, 19):
        goto lbl_18
    buffEvent[19] = [STR_EVT_BUFF_19_TITLE, STR_EVT_BUFF_19_DESC, 30]
    buffEventId.append(19)
    lbl_18:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_20_TITLE, true, 20):
        goto lbl_19
    buffEvent[20] = [STR_EVT_BUFF_20_TITLE, STR_EVT_BUFF_20_DESC, 45]
    buffEventId.append(20)
    lbl_19:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_21_TITLE, true, 21):
        goto lbl_20
    buffEvent[21] = [STR_EVT_BUFF_21_TITLE, STR_EVT_BUFF_21_DESC, 90]
    buffEventId.append(21)
    lbl_20:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_22_TITLE, true, 22):
        goto lbl_21
    buffEvent[22] = [STR_EVT_BUFF_22_TITLE, STR_EVT_BUFF_22_DESC, 90]
    buffEventId.append(22)
    lbl_21:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_BUFF, STR_EVT_BUFF_23_TITLE, true, 23):
        goto lbl_22
    buffEvent[23] = [STR_EVT_BUFF_23_TITLE, STR_EVT_BUFF_23_DESC, 120]
    buffEventId.append(23)
    lbl_22:

    debuffEvent = []
    debuffEventId = []
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_DEBUFF, STR_EVT_DEBUFF_0_TITLE, true):
        goto lbl_23
    debuffEvent[0] = [STR_EVT_DEBUFF_0_TITLE, STR_EVT_DEBUFF_0_DESC, 20]
    debuffEventId.append(0)
    lbl_23:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_DEBUFF, STR_EVT_DEBUFF_1_TITLE, true, 1):
        goto lbl_24
    debuffEvent[1] = [STR_EVT_DEBUFF_1_TITLE, STR_EVT_DEBUFF_1_DESC, 8]
    debuffEventId.append(1)
    lbl_24:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_DEBUFF, STR_EVT_DEBUFF_2_TITLE, true, 2):
        goto lbl_25
    debuffEvent[2] = [STR_EVT_DEBUFF_2_TITLE, STR_EVT_DEBUFF_2_DESC, 30]
    debuffEventId.append(2)
    lbl_25:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_DEBUFF, STR_EVT_DEBUFF_3_TITLE, true, 3):
        goto lbl_26
    debuffEvent[3] = [STR_EVT_DEBUFF_3_TITLE, STR_EVT_DEBUFF_3_DESC, 25]
    debuffEventId.append(3)
    lbl_26:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_DEBUFF, STR_EVT_DEBUFF_4_TITLE, true, 4):
        goto lbl_27
    debuffEvent[4] = [STR_EVT_DEBUFF_4_TITLE, STR_EVT_DEBUFF_4_DESC, 25]
    debuffEventId.append(4)
    lbl_27:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_5_TITLE, true, 5):
        goto lbl_28
    debuffEvent[5] = [STR_EVT_DEBUFF_5_TITLE, STR_EVT_DEBUFF_5_DESC, 20]
    debuffEventId.append(5)
    lbl_28:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_6_TITLE, true, 6):
        goto lbl_29
    debuffEvent[6] = [STR_EVT_DEBUFF_6_TITLE, STR_EVT_DEBUFF_6_DESC, 30]
    debuffEventId.append(6)
    lbl_29:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_7_TITLE, true, 7):
        goto lbl_30
    debuffEvent[7] = [STR_EVT_DEBUFF_7_TITLE, STR_EVT_DEBUFF_7_DESC, 8]
    debuffEventId.append(7)
    lbl_30:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_8_TITLE, true, 8):
        goto lbl_31
    debuffEvent[8] = [STR_EVT_DEBUFF_8_TITLE, STR_EVT_DEBUFF_8_DESC, 30]
    debuffEventId.append(8)
    lbl_31:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_9_TITLE, true, 9):
        goto lbl_32
    debuffEvent[9] = [STR_EVT_DEBUFF_9_TITLE, STR_EVT_DEBUFF_9_DESC, 45]
    debuffEventId.append(9)
    lbl_32:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_10_TITLE, true, 10):
        goto lbl_33
    debuffEvent[10] = [STR_EVT_DEBUFF_10_TITLE, STR_EVT_DEBUFF_10_DESC, 30]
    debuffEventId.append(10)
    lbl_33:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_11_TITLE, true, 11):
        goto lbl_34
    debuffEvent[11] = [STR_EVT_DEBUFF_11_TITLE, STR_EVT_DEBUFF_11_DESC, 45]
    debuffEventId.append(11)
    lbl_34:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_DEBUFF, STR_EVT_DEBUFF_12_TITLE, true, 12):
        goto lbl_35
    debuffEvent[12] = [STR_EVT_DEBUFF_12_TITLE, STR_EVT_DEBUFF_12_DESC, 2]
    debuffEventId.append(12)
    lbl_35:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_DEBUFF, STR_EVT_DEBUFF_13_TITLE, true, 13):
        goto lbl_36
    debuffEvent[13] = [STR_EVT_DEBUFF_13_TITLE, STR_EVT_DEBUFF_13_DESC, 45]
    debuffEventId.append(13)
    lbl_36:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_DEBUFF, STR_EVT_DEBUFF_14_TITLE, true, 14):
        goto lbl_37
    debuffEvent[14] = [STR_EVT_DEBUFF_14_TITLE, STR_EVT_DEBUFF_14_DESC, 45]
    debuffEventId.append(14)
    lbl_37:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_DEBUFF, STR_EVT_DEBUFF_15_TITLE, true, 15):
        goto lbl_38
    debuffEvent[15] = [STR_EVT_DEBUFF_15_TITLE, STR_EVT_DEBUFF_15_DESC, 5]
    debuffEventId.append(15)
    lbl_38:

    mechEvent = []
    mechEventId = []
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_MECH, STR_EVT_MECH_0_TITLE, true):
        goto lbl_39
    mechEvent[0] = [STR_EVT_MECH_0_TITLE, STR_EVT_MECH_0_DESC, 60]
    mechEventId.append(0)
    lbl_39:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_1_TITLE, true, 1):
        goto lbl_40
    mechEvent[1] = [STR_EVT_MECH_1_TITLE, STR_EVT_MECH_1_DESC, 15]
    mechEventId.append(1)
    lbl_40:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_2_TITLE, true, 2):
        goto lbl_41
    mechEvent[2] = [STR_EVT_MECH_2_TITLE, STR_EVT_MECH_2_DESC.format(Button.INTERACT), 15]
    mechEventId.append(2)
    lbl_41:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_3_TITLE, true, 3):
        goto lbl_42
    mechEvent[3] = [STR_EVT_MECH_3_TITLE, STR_EVT_MECH_3_DESC, 45]
    mechEventId.append(3)
    lbl_42:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_4_TITLE, true, 4):
        goto lbl_43
    mechEvent[4] = [STR_EVT_MECH_4_TITLE, STR_EVT_MECH_4_DESC, 60]
    mechEventId.append(4)
    lbl_43:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_5_TITLE, true, 5):
        goto lbl_44
    mechEvent[5] = [STR_EVT_MECH_5_TITLE, STR_EVT_MECH_5_DESC, 60]
    mechEventId.append(5)
    lbl_44:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_1_MECH, STR_EVT_MECH_6_TITLE, true, 6):
        goto lbl_45
    mechEvent[6] = [STR_EVT_MECH_6_TITLE, STR_EVT_MECH_6_DESC, 30]
    mechEventId.append(6)
    lbl_45:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_MECH, STR_EVT_MECH_7_TITLE, true, 7):
        goto lbl_46
    mechEvent[7] = [STR_EVT_MECH_7_TITLE, STR_EVT_MECH_7_DESC, 45]
    mechEventId.append(7)
    lbl_46:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_MECH, STR_EVT_MECH_8_TITLE, true, 8):
        goto lbl_47
    mechEvent[8] = [STR_EVT_MECH_8_TITLE, STR_EVT_MECH_8_DESC, 30]
    mechEventId.append(8)
    lbl_47:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_2_MECH, STR_EVT_MECH_9_TITLE, true, 9):
        goto lbl_48
    mechEvent[9] = [STR_EVT_MECH_9_TITLE, STR_EVT_MECH_9_DESC, 45]
    mechEventId.append(9)
    lbl_48:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_MECH, STR_EVT_MECH_10_TITLE, true, 10):
        goto lbl_49
    mechEvent[10] = [STR_EVT_MECH_10_TITLE, STR_EVT_MECH_10_DESC, 90]
    mechEventId.append(10)
    lbl_49:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_MECH, STR_EVT_MECH_11_TITLE, true, 11):
        goto lbl_50
    mechEvent[11] = [STR_EVT_MECH_11_TITLE, STR_EVT_MECH_11_DESC, 90]
    mechEventId.append(11)
    lbl_50:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_MECH, STR_EVT_MECH_12_TITLE, true, 12):
        goto lbl_51
    mechEvent[12] = [STR_EVT_MECH_12_TITLE, STR_EVT_MECH_12_DESC.format(Button.INTERACT), 30]
    mechEventId.append(12)
    lbl_51:
    if not createWorkshopSettingBool(STR_CAT_RANDOM_PACK_3_MECH, STR_EVT_MECH_13_TITLE, true, 13):
        goto lbl_52
    mechEvent[13] = [STR_EVT_MECH_13_TITLE, STR_EVT_MECH_13_DESC.format(Button.INTERACT), 15]
    mechEventId.append(13)
    lbl_52:
