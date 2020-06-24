extends Chara
#覆盖的初始化
func _info():
    pass
#继承的初始化，技能描述在这里写，保留之前的技能描述
func _extInit():
    ._extInit()#保留继承的处理
    chaName = "飞蛇"
    attCoe.atkRan = 3
    attCoe.maxHp = 5
    attCoe.atk = 5
    attCoe.mgiAtk = 1
    attCoe.def = 3
    attCoe.mgiDef = 3
    lv = 3
    attCoe.dod = 0.3
    atkEff = "atk_dao"
    evos = [] #可以升级到的生物id
    addCdSkill("c+Starcraft+Zerg_4",20)
    addSkillTxt("活体武器(绑架):被攻击目标的仇恨目标强制变为自己(打不到，你打不到)")
    addSkillTxt("化学合成(蔽目毒云):每20秒将仇恨目标及其周围一格的单位全部变为近战(什么你可以打到我! 不你打不到)")
    addSkillTxt("虫族之躯(飞行结构):逃跑需要轻薄的甲壳，增加30%闪避率。(我躲，我再躲，小子有本事等我20秒)")
#进入战斗初始化，事件连接在这里初始化
func _connect():
    ._connect() #保留继承的处理
func _onAtkChara(atkInfo):
    ._onAtkChara(atkInfo)
    if atkInfo.atkType == AtkType.NORMAL && atkInfo.isMiss == true && : 
        atkInfo.hitCha.aiCha = matCha(cell)
func _onCastCdSkill(id) : 
    .-onCastCdSkill(id)
    if id == "c+Starcraft+Zerg_4" && aiCha != null:
        var chas = getCellChas(aiCha.cell,1)
        for i in chas: 
            i.attInfo.atkRan = 1