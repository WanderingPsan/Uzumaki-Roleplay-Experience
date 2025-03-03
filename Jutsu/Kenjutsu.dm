obj/Kenjutsu/Cloud_Style:_Crescent_Moon_Slice
	var/skill=1
	icon='Kenjutsu.dmi'
	icon_state="5"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Cloud-Style Crescent Moon Beheading has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.60/skill)
				var/obj/cmbabil/A = new
				A.damage = rand(60,120)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Cloud Style: Crescent Moon Beheading!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0


obj/cmbabil
	icon='Kenjutsu.dmi'
	icon_state="5"
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
				step(M,usr.dir)
		if(istype(M,/turf))
			if(M.density)
				del(src)

obj/Kenjutsu/Cloud_Style:_Flame_Beheading
	var/skill=1
	icon='Kenjutsu.dmi'
	icon_state="5"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Cloud-Style: Flame Beheading has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.60/skill)
				var/obj/fbabil/A = new
				A.damage = rand(60,120)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Cloud-Style: Flame Beheading!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0


obj/fbabil
	icon='Kenjutsu.dmi'
	icon_state="3"
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
				step(M,usr.dir)
		if(istype(M,/turf))
			if(M.density)
				del(src)


obj/Kenjutsu/Shinkuken
	var/skill=1
	icon='Kenjutsu.dmi'
	icon_state="2"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Vacuum Sword Skill has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.60/skill)
				var/obj/ShiAbil/A = new
				A.damage = rand(60,120)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Shinkuken!!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0


obj/ShiAbil
	icon='Kenjutsu.dmi'
	icon_state="3"
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
				step(M,usr.dir)
		if(istype(M,/turf))
			if(M.density)
				del(src)