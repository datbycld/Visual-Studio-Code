extends Chara
#覆盖的初始化
func _info():
    pass
#继承的初始化，技能描述在这里写，保留之前的技能描述
func _extInit():
    ._extInit()#保留继承的处理
    chaName = "守护者"
    attCoe.atkRan = 50
    attCoe.maxHp = 4
    attCoe.atk = 5
    attCoe.mgiAtk = 1
    attCoe.def = 3
    attCoe.mgiDef = 3
    lv = 2
    atkEff = "atk_dao"
    attAdd.spd -= 0.5
    evos = [""] #可以升级到的生物id
    addSkillTxt("活体武器(聚集):攻击时聚集体内的腐蚀性物质，额外造成目标最大生命值10%的物理伤害")
    addSkillTxt("化学合成(腐蚀):守护者强化了腐化者体内的腐蚀性化学物质，拥有更强的腐蚀护甲的能力，每次攻击命中减少目标25点护甲(最低0点)")
    addSkillTxt("虫族之躯(狙击结构):守护者改造了全身肌肉使其拥有超乎想象的射程，但是基础攻击速度下降50%")
#进入战斗初始化，事件连接在这里初始化
func _connect():
    ._connect() #保留继承的处理
func _onAtkChara(atkInfo):
    ._onAtkChara(atkInfo)
    if atkInfo.atkType == AtkType.NORMAL && atkInfo.isMiss == true && : 
        atkInfo.atkVal += atkInfo.hitCha.att.maxHp*0.1
        if atkInfo.hitCha.attInfo.def > 0 :
            if atkInfo.hitCha.attInfo.def < 25 :
                atkInfo.hitCha.attInfo.def = 0
            else 
                atkInfo.hitCha.attInfo.def -= 25