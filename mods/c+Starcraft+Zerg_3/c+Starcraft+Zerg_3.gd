extends ../c+Starcraft+Zerg_1/c+Starcraft+Zerg_1.gd
#覆盖的初始化
func _info():
    pass
#继承的初始化，技能描述在这里写，保留之前的技能描述
func _extInit():
    ._extInit()#保留继承的处理
    chaName = "巢虫领主"
    attAdd.def += 3
    attAdd.mgiDef += 3
    lv = 3
    num +=1
    attAdd.spd -= 0.2
    atkEff = "atk_dao"
    evos = [] #可以升级到的生物id
    addSkillTxt("虫族之躯(重甲结构):减少20%的全部伤害，但基础攻速减少20%")
#进入战斗初始化，事件连接在这里初始化
func _connect():
    ._connect() #保留继承的处理
func onHurt(atkInfo:AtkInfo):
    .onHurt(atkInfo)
    atkInfo.hurtVal *= 0.8