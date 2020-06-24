extends Chara
#覆盖的初始化
func _info():
    pass
#继承的初始化，技能描述在这里写，保留之前的技能描述
func _extInit():
    ._extInit()#保留继承的处理
    chaName = "吞噬者"
    attCoe.atkRan = 3
    attCoe.maxHp = 6
    attCoe.atk = 5
    attCoe.mgiAtk = 1
    attCoe.def = 15
    attCoe.mgiDef = 15
    lv = 2
    atkEff = "atk_dao"
    evos = [""] #可以升级到的生物id
    addSkillTxt("活体武器(酸性):攻击时降低目标30%基础攻速")
    addSkillTxt("化学合成(腐蚀):吞噬者强化了腐化者体内的腐蚀性化学物质，拥有更强的腐蚀护甲的能力，每次攻击命中减少目标30点护甲(最低0点)")
    addSkillTxt("虫族之躯(坚韧结构):吞噬者优化了全身肌肉使其拥有超乎想象的防御能力，但是失去了回复能力")
#进入战斗初始化，事件连接在这里初始化
func _connect():
    ._connect() #保留继承的处理
func _onAtkChara(atkInfo):
    ._onAtkChara(atkInfo)
    if atkInfo.atkType == AtkType.NORMAL && atkInfo.isMiss == true && : 
        if atkInfo.hitCha.attInfo.def >= 0 :
            if atkInfo.hitCha.attInfo.def <= 30 :
                atkInfo.hitCha.attInfo.def = 0
            else 
                atkInfo.hitCha.attInfo.def -= 30
func _onPlusHp(val):
    ._onPlusHp(val)
    val = 0
