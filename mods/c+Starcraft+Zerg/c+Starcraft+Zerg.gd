extends Chara
#覆盖的初始化
func _info():
    pass
#继承的初始化，技能描述在这里写，保留之前的技能描述
func _extInit():
    ._extInit()#保留继承的处理
    chaName = "自杀蝙蝠"
    attCoe.atkRan = 1
    attCoe.maxHp = 4
    attCoe.atk = 2
    attCoe.mgiAtk = 1
    attCoe.def = 1
    attCoe.mgiDef = 1
    lv = 1
    atkEff = "atk_dao"
    evos = ["C+CStarcraft+Zerg_1","C+CStarcraft+Zerg_2"] #可以升级到的生物id
    addSkillTxt("死亡爆炸:死亡时对1格内敌方造成最大生命值100%的物理正常伤害")
#进入战斗初始化，事件连接在这里初始化
func _connect():
    ._connect() #保留继承的处理
func _onDeath(atkInfo):
    var eff:Eff = newEff("sk_shiBao")
    eff.position = position
    var chas = getCellChas(cell,1) #cell:位置 ran：随机ran格内 mTeam：队伍（0：所有 1：敌军 2：友军）	获取cell格子，ran范围内的mTeam单位
    yield(reTimer(0.05),"timeout")
    for i in chas: 
        hurtChara(i,att.maxHp,Chara.HurtType.PHY,AtkType.NORMAL)