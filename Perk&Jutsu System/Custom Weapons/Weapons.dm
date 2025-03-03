obj/Custom_Equipment
	icon = 'SkillCard.dmi'
	icon_state = "Toyotomi"
	var
		Equipped = 0
		ziChakra = 0
		ziStamina = 0
		ziNin = 0
		ziTai = 0
		ziGen = 0
		ziInt = 0
		ziRef = 0
		ziSpd = 0
		ziCon = 0
		ziStr = 0
		ziDef = 0
		ziAtkspd = 0
		ziDur = 0
	Click()
		if(src.Equipped == 1)
			usr<<"You unequip your [src.name]."
			for(var/mob/M in oviewers())
				M<<"[src] unequips their [src.name]."
			src.Equipped = 0
			usr.Jnin -= src.ziNin
			usr.Jtai -= src.ziTai
			usr.Jgen -= src.ziGen
			usr.Jint -= src.ziInt
			usr.Jref -= src.ziRef
			usr.Jspd -= src.ziSpd
			usr.Jcon -= src.ziCon
			usr.Jstr -= src.ziStr
			usr.Jdef -= src.ziDef
			usr.Jatkspd -= src.ziAtkspd
			usr.Jdur -= src.ziDur
		else
			usr<<"You equip your [src.name]."
			for(var/mob/M in oviewers())
				M<<"<html>[src] equips their [src.name].<br><p>[src.description]</p>"
			src.Equipped = 1
			usr.Jnin += src.ziNin
			usr.Jtai += src.ziTai
			usr.Jgen += src.ziGen
			usr.Jint += src.ziInt
			usr.Jref += src.ziRef
			usr.Jspd += src.ziSpd
			usr.Jcon += src.ziCon
			usr.Jstr += src.ziStr
			usr.Jdef += src.ziDef
			usr.Jatkspd += src.ziAtkspd
			usr.Jdur += src.ziDur
