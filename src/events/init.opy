#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "initialize event array":
    @Condition vishkarEventActivated == true
    
    globalEvent = []
    globalEventId = []
    globalEvent[0] = ["势不可挡", "堡垒获得控制免疫", 120]
    globalEventId.append(0)
    globalEvent[1] = ["超算进化", "堡垒发射榴弹会附带1.5秒的控制特效", 60]
    globalEventId.append(1)
    globalEvent[2] = ["任务：生存", "持续期间内玩家团队总阵亡次数不超过10次", 120]
    globalEventId.append(2)
    globalEvent[3] = ["任务：占领", "倒计时结束时目标点范围内有4名玩家", 120]
    globalEvent[4] = ["任务：竞速", "倒计时结束时有 50% 以上的玩家挑战进度过半", 600]
    globalEventId.append(4)
    buffEvent = []
    buffEventId = []
    buffEvent[0] = ["奥利维娅的礼物", "你好", 5]
    buffEventId.append(0)
    if not createWorkshopSettingBool("随机事件包 1：增益", "疾风祝福", true, 1):
        goto lbl_0
    buffEvent[1] = ["疾风祝福", "移动速度提高50%", 20]
    buffEventId.append(1)
    lbl_0:
    if not createWorkshopSettingBool("随机事件包 1：增益", "钢铁防线", true, 2):
        goto lbl_1
    buffEvent[2] = ["钢铁防线", "获得1500点临时护甲与25%伤害减免", 25]
    buffEventId.append(2)
    lbl_1:
    if not createWorkshopSettingBool("随机事件包 1：增益", "肾上腺素", true, 3):
        goto lbl_2
    buffEvent[3] = ["肾上腺素", "获得50%额外伤害减免", 20]
    buffEventId.append(3)
    lbl_2:
    if not createWorkshopSettingBool("随机事件包 1：增益", "生命源泉", true, 4):
        goto lbl_3
    buffEvent[4] = ["生命源泉", "每秒恢复15%最大生命值", 30]
    buffEventId.append(4)
    lbl_3:
    if not createWorkshopSettingBool("随机事件包 1：增益", "黑粉来袭", true, 5):
        goto lbl_4
    buffEvent[5] = ["黑粉来袭", "显示正在瞄准你的堡垒数量", 20]
    buffEventId.append(5)
    lbl_4:
    if not createWorkshopSettingBool("随机事件包 1：增益", "足力健", true, 6):
        goto lbl_5
    buffEvent[6] = ["足力健", "持续移动1秒获得3%可叠加的移动速度", 45]
    buffEventId.append(6)
    lbl_5:
    if not createWorkshopSettingBool("随机事件包 1：增益", "血肉再生", true, 7):
        goto lbl_6
    buffEvent[7] = ["血肉再生", "获得50+25%最大生命值的临时生命值，每4秒自动刷新", 90]
    buffEventId.append(7)
    lbl_6:
    if not createWorkshopSettingBool("随机事件包 1：增益", "心之钢", true, 8):
        goto lbl_7
    buffEvent[8] = ["心之钢", "阵亡后永久增加0.75%最大生命值", 120]
    buffEventId.append(8)
    lbl_7:
    if not createWorkshopSettingBool("随机事件包 2：增益", "危险感知", true, 9):
        goto lbl_8
    buffEvent[9] = ["危险感知", "被锁定时获得60%移动速度与25%伤害减免", 20]
    buffEventId.append(9)
    lbl_8:
    if not createWorkshopSettingBool("随机事件包 2：增益", "反应装甲", true, 10):
        goto lbl_9
    buffEvent[10] = ["反应装甲", "获得一个可恢复的护甲\n如果堡垒对你的伤害未能击穿护甲\n堡垒将被短暂击晕", 60]
    buffEventId.append(10)
    lbl_9:
    if not createWorkshopSettingBool("随机事件包 2：增益", "死亡延迟", true, 11):
        goto lbl_10
    buffEvent[11] = ["死亡延迟", "受到致命伤害时\n阵亡将被延迟到事件结束后", 30]
    buffEventId.append(11)
    lbl_10:
    if not createWorkshopSettingBool("随机事件包 2：增益", "有我有你", true, 12):
        goto lbl_11
    buffEvent[12] = ["有我有你", "长按{0}附身一名队友\n该队友获得你最大生命值5%伤害减免\n你获得25%治疗增益并且会治疗队友".format(Button.INTERACT), 120]
    buffEventId.append(12)
    lbl_11:
    if not createWorkshopSettingBool("随机事件包 2：增益", "↑↑↓↓←→←→BABA", true, 13):
        goto lbl_12
    buffEvent[13] = ["↑↑↓↓←→←→BABA", "如果在事件持续期间阵亡，你会在5秒前的位置复活，事件立刻结束", 120]
    buffEventId.append(13)
    lbl_12:
    if not createWorkshopSettingBool("随机事件包 2：增益", "费斯卡光子护盾", true, 14):
        goto lbl_13
    buffEvent[14] = ["费斯卡光子护盾", "所有人获得一个可恢复的护盾\n其数值为你最大生命值的 20%\n护盾持续到你阵亡或事件结束", 120]
    buffEventId.append(14)
    lbl_13:
    if not createWorkshopSettingBool("随机事件包 3：增益", "费斯卡呼吸机", true, 15):
        goto lbl_14
    buffEvent[15] = ["费斯卡呼吸机", "不受所有阻挡视线机制效果的影响", 90]
    buffEventId.append(15)
    lbl_14:
    if not createWorkshopSettingBool("随机事件包 3：增益", "向我靠拢", true, 16):
        goto lbl_15
    buffEvent[16] = ["向我靠拢", "你和你附近的队友每5秒获得2.5秒伤害免疫", 30]
    buffEventId.append(16)
    lbl_15:
    if not createWorkshopSettingBool("随机事件包 3：增益", "我独自闯关", true, 17):
        goto lbl_16
    buffEvent[17] = ["我独自闯关", "获得伤害减免、治疗增益、移速加成与击退抵抗", 120]
    buffEventId.append(17)
    lbl_16:
    if not createWorkshopSettingBool("随机事件包 3：增益", "坚定", true, 18):
        goto lbl_17
    buffEvent[18] = ["坚定", "获得95%击退抵抗\r受到击退获得5%可叠加的伤害减免并回复8%最大生命值", 120]
    buffEventId.append(18)
    lbl_17:
    if not createWorkshopSettingBool("随机事件包 3：增益", "胜利意志", true, 19):
        goto lbl_18
    buffEvent[19] = ["胜利意志", "生命值低于30%触发，获得5秒伤害免疫并清除负面状态，回复所有已损失生命值", 30]
    buffEventId.append(19)
    lbl_18:
    if not createWorkshopSettingBool("随机事件包 3：增益", "任务：菲迪皮德斯之力", true, 20):
        goto lbl_19
    buffEvent[20] = ["任务：菲迪皮德斯之力", "持续移动42.195秒后永久获得5%移速加成", 45]
    buffEventId.append(20)
    lbl_19:
    if not createWorkshopSettingBool("随机事件包 3：增益", "心之钢 Pro", true, 21):
        goto lbl_20
    buffEvent[21] = ["心之钢 Pro", "基于心之钢层数提升最大生命值，数值为心之钢层数×2", 90]
    buffEventId.append(21)
    lbl_20:
    if not createWorkshopSettingBool("随机事件包 3：增益", "数值之力", true, 22):
        goto lbl_21
    buffEvent[22] = ["数值之力", "获得 500% 治疗增益与受治疗增益", 90]
    buffEventId.append(22)
    lbl_21:
    if not createWorkshopSettingBool("随机事件包 3：增益", "我按Q辣", true, 23):
        goto lbl_22
    buffEvent[23] = ["我按Q辣", "持续移动获得终极技能充能，终极技能持续期间获得75%伤害减免", 120]
    buffEventId.append(23)
    lbl_22:
    debuffEvent = []
    debuffEventId = []
    if not createWorkshopSettingBool("随机事件包 1：减益", "重力异常", true):
        goto lbl_23
    debuffEvent[0] = ["重力异常", "移动速度降低50%，跳跃高度降低70%", 20]
    debuffEventId.append(0)
    lbl_23:
    if not createWorkshopSettingBool("随机事件包 1：减益", "电磁脉冲", true, 1):
        goto lbl_24
    debuffEvent[1] = ["电磁脉冲", "被侵入，无法使用技能", 8]
    debuffEventId.append(1)
    lbl_24:
    if not createWorkshopSettingBool("随机事件包 3：减益", "吸血鬼", true, 2):
        goto lbl_25
    debuffEvent[2] = ["吸血鬼", "队友使用技能时会消耗你 10% 最大生命值", 30]
    debuffEventId.append(2)
    lbl_25:
    if not createWorkshopSettingBool("随机事件包 1：减益", "易损", true, 3):
        goto lbl_26
    debuffEvent[3] = ["易损", "受到的所有伤害提高25%", 25]
    debuffEventId.append(3)
    lbl_26:
    if not createWorkshopSettingBool("随机事件包 1：减益", "限速40", true, 4):
        goto lbl_27
    debuffEvent[4] = ["限速40", "移动时每秒损失25+7.5%最大生命值", 25]
    debuffEventId.append(4)
    lbl_27:
    if not createWorkshopSettingBool("随机事件包 2：减益", "引力异常", true, 5):
        goto lbl_28
    debuffEvent[5] = ["引力异常", "被持续性拉向最近的堡垒，移动速度降低25%", 20]
    debuffEventId.append(5)
    lbl_28:
    if not createWorkshopSettingBool("随机事件包 2：减益", "骨质疏松", true, 5):
        goto lbl_29
    debuffEvent[6] = ["骨质疏松", "移动速度随时间降低，最多50%", 30]
    debuffEventId.append(6)
    lbl_29:
    if not createWorkshopSettingBool("随机事件包 2：减益", "电磁脉冲 ProMax", true, 7):
        goto lbl_30
    debuffEvent[7] = ["电磁脉冲 ProMax", "被侵入，无法使用技能，以你为中心扩散至75米以内的队友", 8]
    debuffEventId.append(7)
    lbl_30:
    if not createWorkshopSettingBool("随机事件包 2：减益", "能量泄漏", true, 8):
        goto lbl_31
    debuffEvent[8] = ["能量泄漏", "使用技能会消耗25%生命值", 30]
    debuffEventId.append(8)
    lbl_31:
    if not createWorkshopSettingBool("随机事件包 2：减益", "生命在于运动", true, 9):
        goto lbl_32
    debuffEvent[9] = ["生命在于运动", "每秒扣除1.5%最大生命值，移动时扣除速度翻倍", 45]
    debuffEventId.append(9)
    lbl_32:
    if not createWorkshopSettingBool("随机事件包 2：减益", "有难同当", true, 10):
        goto lbl_33
    debuffEvent[10] = ["有难同当", "受到的75%伤害会扩散给15米内的友方", 30]
    debuffEventId.append(10)
    lbl_33:
    if not createWorkshopSettingBool("随机事件包 2：减益", "狂欢盛宴", true, 11):
        goto lbl_34
    debuffEvent[11] = ["狂欢盛宴", "当你在盛宴期间内阵亡，堡垒将进入10秒狂暴状态", 45]
    debuffEventId.append(11)
    lbl_34:
    if not createWorkshopSettingBool("随机事件包 2：减益", "无能的丈夫/妻子", true, 12):
        goto lbl_35
    debuffEvent[12] = ["无能的丈夫/妻子", "附近的友方将被击倒2秒", 2]
    debuffEventId.append(12)
    lbl_35:
    if not createWorkshopSettingBool("随机事件包 3：减益", "重伤", true, 13):
        goto lbl_36
    debuffEvent[13] = ["重伤", "造成治疗与受到的治疗降低85%", 45]
    debuffEventId.append(13)
    lbl_36:
    if not createWorkshopSettingBool("随机事件包 3：减益", "减半", true, 14):
        goto lbl_37
    debuffEvent[14] = ["减半", "每5秒损失50%生命值，当生命值低于5%时立即阵亡", 45]
    debuffEventId.append(14)
    lbl_37:
    if not createWorkshopSettingBool("随机事件包 3：减益", "舍己为人", true, 15):
        goto lbl_38
    debuffEvent[15] = ["舍己为人", "基于玩家数量降低你的最大生命值，每名玩家降低1%，由其他玩家均分", 5]
    debuffEventId.append(15)
    lbl_38:
    mechEvent = []
    mechEventId = []
    if not createWorkshopSettingBool("随机事件包 3：机制", "极限挑战", true):
        goto lbl_39
    mechEvent[0] = ["极限挑战", "获得99%伤害减免，生命值被锁定在30%，无法受到任何治疗与生命恢复效果", 60]
    mechEventId.append(0)
    lbl_39:
    if not createWorkshopSettingBool("随机事件包 1：机制", "纳米战甲", true, 1):
        goto lbl_40
    mechEvent[1] = ["纳米战甲", "获得最大生命值800%的临时生命值，被减速25%", 15]
    mechEventId.append(1)
    lbl_40:
    if not createWorkshopSettingBool("随机事件包 1：机制", "赌徒", true, 2):
        goto lbl_41
    mechEvent[2] = ["赌徒", "长按{0}触发：50%概率永久损失/增加10%最大生命值".format(Button.RELOAD), 15]
    mechEventId.append(2)
    lbl_41:
    if not createWorkshopSettingBool("随机事件包 1：机制", "有点松弛", true, 3):
        goto lbl_42
    mechEvent[3] = ["有点松弛", "移动时产生阻挡友方视线的迷雾", 45]
    mechEventId.append(3)
    lbl_42:
    if not createWorkshopSettingBool("随机事件包 1：机制", "体积膨胀", true, 4):
        goto lbl_43
    mechEvent[4] = ["体积膨胀", "体积变大175%，最大生命值提高400%，获得20%伤害减免", 60]
    mechEventId.append(4)
    lbl_43:
    if not createWorkshopSettingBool("随机事件包 1：机制", "迷你形态", true, 5):
        goto lbl_44
    mechEvent[5] = ["迷你形态", "体积缩小60%，最大生命值降低50%，获得25%移速加成", 60]
    mechEventId.append(5)
    lbl_44:
    if not createWorkshopSettingBool("随机事件包 1：机制", "悄悄滴进村", true, 6):
        goto lbl_45
    mechEvent[6] = ["悄悄滴进村", "下蹲隐身，移动速度降低 25%", 30]
    mechEventId.append(6)
    lbl_45:
    if not createWorkshopSettingBool("随机事件包 2：机制", "紧急避障", true, 7):
        goto lbl_46
    mechEvent[7] = ["紧急避障", "受到伤害3秒内移动速度提高 80%", 45]
    mechEventId.append(7)
    lbl_46:
    if not createWorkshopSettingBool("随机事件包 2：机制", "逆风而行", true, 8):
        goto lbl_47
    mechEvent[8] = ["逆风而行", "移动速度提高 60%，但只能向后移动", 30]
    mechEventId.append(8)
    lbl_47:
    if not createWorkshopSettingBool("随机事件包 2：机制", "刹车失灵", true, 9):
        goto lbl_48
    mechEvent[9] = ["刹车失灵", "不受控的向前移动，移动速度会逐渐提高至 175%", 45]
    mechEventId.append(9)
    lbl_48:
    if not createWorkshopSettingBool("随机事件包 3：机制", "冲锋激励", true, 10):
        goto lbl_49
    mechEvent[10] = ["冲锋激励", "持续移动5秒获得100能量，能量充满后转化为临时护甲", 90]
    mechEventId.append(10)
    lbl_49:
    if not createWorkshopSettingBool("随机事件包 3：机制", "生命在于反击", true, 11):
        goto lbl_50
    mechEvent[11] = ["生命在于反击", "基于已损失生命值获得移速加成与伤害减免，每损失1%生命值获得1%加成（最高75%）", 90]
    mechEventId.append(11)
    lbl_50:
    if not createWorkshopSettingBool("随机事件包 3：机制", "屁动力", true, 12):
        goto lbl_51
    mechEvent[12] = ["屁动力", "长按{0}朝你的前方飞行，飞行时获得50%伤害减免".format(Button.JUMP), 30]
    mechEventId.append(12)
    lbl_51:
    if not createWorkshopSettingBool("随机事件包 3：机制", "赌徒：竞速挑战", true, 13):
        goto lbl_52
    mechEvent[13] = ["赌徒：竞速挑战", "长按{0}消耗50%生命值\n49%概率永久获得/损失5%移速加成\n2% 概率永久获得/损失 12% 移速加成".format(Button.RELOAD), 15]
    mechEventId.append(13)
    lbl_52:


