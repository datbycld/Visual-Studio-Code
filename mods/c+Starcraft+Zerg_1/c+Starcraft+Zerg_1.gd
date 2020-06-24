extends Chara
#覆盖的初始化
func _info():
    pass
#继承的初始化，技能描述在这里写，保留之前的技能描述
func _extInit():
    ._extInit()#保留继承的处理
    chaName = "异龙"
    attCoe.atkRan = 3
    attCoe.maxHp = 4
    attCoe.atk = 5
    attCoe.mgiAtk = 1
    attCoe.def = 3
    attCoe.mgiDef = 3
    lv = 2
    atkEff = "atk_dao"
    evos = ["c+Starcraft+Zerg_3","c+Starcraft+Zerg_4"] #可以升级到的生物id
    var num = 2
    addSkillTxt("活体武器(碎裂):攻击时释放半感知刃虫，对目标周围一格的敌人造成等量特效伤害(最多"+num+"个单位)")
    addSkillTxt("化学合成(回复):异龙改造了自杀蝙蝠体内的爆炸性化学物质，拥有了组织再生能力，每次受到伤害恢复"+10*lv+"点生命值")
#进入战斗初始化，事件连接在这里初始化
func _connect():
    ._connect() #保留继承的处理
func _onAtkChara(atkInfo):
    ._onAtkChara(atkInfo)
    # var eff:Eff = newEff("sk_shiBao")
    # eff.position = position
    if atkInfo.atkType == AtkType.NORMAL : 
        var chas = getCellChas(atkInfo.hitCha.cell,1) #cell:位置 ran：随机ran格内 mTeam：队伍（0：所有 1：敌军 2：友军）	获取cell格子，ran范围内的mTeam单位
        # yield(reTimer(0.05),"timeout")
        var sum = 0
        for i in chas: 
            if sum++ < num :
                break
            hurtChara(i,att.maxHp,Chara.HurtType.PHY,AtkType.EFF)
func _onHurtEnd(atkInfo):
    ._onHurtEnd(atkInfo)
    plusHp(10*lv,true)