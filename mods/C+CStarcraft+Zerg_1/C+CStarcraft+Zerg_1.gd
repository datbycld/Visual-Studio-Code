extends ../C+CStarcraft+Zerg/C+CStarcraft+Zerg.gd
#覆盖的初始化
func _info():
    pass
#继承的初始化，技能描述在这里写，保留之前的技能描述
func _extInit():
    ._extInit()#保留继承的处理
    chaName = "异龙"
    attCoe.atkRan += 2
    attCoe.atk += 2
    attCoe.def += 1
    attCoe.mgiDef += 1
    lv = 1
    atkEff = "atk_dao"
    evos = ["C+CStarcraft+Zerg_3","C+CStarcraft+Zerg_4"] #可以升级到的生物id
    var num = 2
    addSkillTxt("活体武器(碎裂):攻击时释放半感知刃虫，对目标周围一格的敌人造成等量特效伤害(最多两个单位)")
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