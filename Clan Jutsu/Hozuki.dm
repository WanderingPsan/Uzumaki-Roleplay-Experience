mob/var/Suika=0
obj/Ninjutsu/Water_Transformation_Jutsu
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Suika"
	Click()
		if(!usr.Hozuki)
			return
		if(src in usr.contents)
			if(!usr.Suika)
				if(usr.Chakra<60)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Water Transformation Jutsu has increased."
					skill+=1
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=60
				usr.Agility *= 20.5
				usr.overlays += 'Suika.dmi'
				src.Active=1
				usr.Suika=1
				usr.drain8()
			else
				usr.Agility = usr.MaxAgility
				usr.overlays -= 'Suika.dmi'
				usr.Suika=0
				src.Active=0
				usr.drain8=0

mob/var/drain8=0
mob/proc
	drain8()
		spawn(10)
		if(usr.drain8)
			sleep(50)
			usr.Chakra -= 5
			usr.drain8()
		if(usr.Chakra<=0)
			viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s body return to normal as it becomes solid again.<font color = white>*)"
			usr.overlays -= 'Suika.dmi'
			usr.Agility = usr.MaxAgility
			usr.drain8=0
			usr.Suika=0

obj/Ninjutsu/Water_Style:_Great_Water_Arm
	var/Gousuiwan=0
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Gousuiwan"
	Click()
		if(!usr.Hozuki)
			return
		if(src in usr.contents)
			if(!Gousuiwan)
				if(usr.Chakra<60)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Water Release: Great Water Arm has increased."
					skill+=1
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=60
				usr.Taijutsu *= 2.5
				usr.overlays += 'Water Arm.dmi'
				src.Active=1
				Gousuiwan=1
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.overlays -= 'Water Arm.dmi'
				Gousuiwan=0
				src.Active=0

obj/Ninjutsu/Water_Style:_Water_Propelling_Jet
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Propel"
	Click()
		if(!usr.Hozuki)
			return
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<100)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Water Style: Water Propelling Jet has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=100
				var/obj/WaterAbil/A = new
				A.damage = rand(50,80)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Water Style: Water Propelling Jet!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0

obj/WaterAbil
	icon='Propel.dmi'
	icon_state="Head"
	density = 1
	var/damage
	New()
		spawn(100)
		del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				M.Health -= damage
				M.Ko()
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)
	Move()
		var/obj/WaterTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/WaterTrail
	icon='Propel.dmi'
	icon_state="Trail"
	density = 1
	var/damage
	New()
		spawn(20)
		del src




obj/Ninjutsu/Water_Style:_Water_Fang_Bullet
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Suigadan"
	Click()
		if(!usr.Hozuki)
			return
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<100)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Water Style: Water Fang Bullet has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=100
				var/obj/Suigadan/A = new
				A.damage = rand(40,80)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Water Style: Water Fang Bullet!"

				A.loc=usr.loc
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=A
				usr.controlled=A
				sleep(20*skill)
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=usr
				usr.controlled=null
				walk(A,A.dir)
				spawn(45)
				usr.firing=0
				src.Active=0
			else
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=usr
				usr.controlled=null

obj/Suigadan
	icon='Suiton.dmi'
	icon_state="Suigadan"
	density = 1
	var/damage
	New()
		spawn(100)
		del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				M.Health -= damage
				M.Ko()
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)
	Move()
		var/obj/SuigadanTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/SuigadanTrail
	icon='Suiton.dmi'
	icon_state="Suigadan2"
	density = 1
	var/damage
	New()
		spawn(20)
		del src
