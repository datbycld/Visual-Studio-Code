extends Chara
#覆盖的初始化
func _info():
    pass
#继承的初始化，技能描述在这里写，保留之前的技能描述
func _extInit():
    ._extInit()#保留继承的处理
    chaName = "腐化者"
    attCoe.atkRan = 3
    attCoe.maxHp = 4
    attCoe.atk = 5
    attCoe.mgiAtk = 1
    attCoe.def = 3
    attCoe.mgiDef = 3
    lv = 2
    atkEff = "atk_dao"
    evos = ["c+Starcraft+Zerg_5","c+Starcraft+Zerg_6"] #可以升级到的生物id
    addSkillTxt("活体武器(腐化):攻击时激射体内的腐蚀性物质，赋予目标"+lv+"层[中毒]")
    addSkillTxt("化学合成(腐蚀):腐化者改造了自杀蝙蝠体内的爆炸性化学物质，拥有腐蚀护甲的能力，每次攻击命中减少目标15点护甲(最低0点)")
#进入战斗初始化，事件连接在这里初始化
func _connect():
    ._connect() #保留继承的处理
func _onAtkChara(atkInfo):
    ._onAtkChara(atkInfo)
    if atkInfo.atkType == AtkType.NORMAL && atkInfo.isMiss == true && : 
        if atkInfo.hitCha.attInfo.def >= 0 :
            if atkInfo.hitCha.attInfo.def <= 15 :
                atkInfo.hitCha.attInfo.def = 0
            else 
                atkInfo.hitCha.attInfo.def -= 15

        atkInfo.hitCha.addBuff(b_zhonDu.new(2))