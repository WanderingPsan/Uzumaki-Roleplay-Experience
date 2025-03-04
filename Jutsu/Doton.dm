
//Doryudan & Doryuheki

obj/Rock
	icon = 'Doton.dmi'
	icon_state = "rock"
	New()
		spawn(100)
		del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				M.Ko()
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)

obj/DoryudanAbil
	Head
		icon = 'Doton.dmi'
		icon_state="Dragon"
		density = 1
		var/damage
		New()
			spawn(100)
			del src
		Bump(mob/M,turf/T)
			if(istype(M,/mob))
				if(M.attackable)
					M.Health -= damage
					M.Ko()
					del(src)
			if(istype(T,/turf))
				if(M.density)
					del(src)
obj/Swamp
	icon = 'Doton.dmi'
	icon_state="Swamp"
	density = 0
	var/damage
	New()
		spawn(200)
		del src
	Entered(mob/M)
		if(ismob(M))
			M.onmud=1
			M.Mud()
	Exited(mob/M)
		if(ismob(M))
			M.onmud=0

obj/Swamp1
	density = 1
	var/damage
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				M.Health -= damage
				M.move=0
				del(src)
				sleep(200)
				M.move=1
		if(istype(M,/turf))
			if(M.density)
				del(src)
	Move()
		var/obj/Swamp/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/Ninjutsu/Doryudan
	var/skill = 1
	icon='Skillcard.dmi'
	icon_state="Doryudan"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<80)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Doryudan no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=80
				var/obj/DoryudanAbil/Head/A = new
				A.damage = (usr.Ninjutsu/5)+1
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Doryudan no Jutsu!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0

obj/Ninjutsu/Shinjuu_Zanshu_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Shinjuu"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.20)
					return
				usr.Chakra-=(usr.MaxChakra*0.20)
				var/list/V = new/list
				for(var/mob/M in oview())
					V.Add(M)
				var/mob/A=input("Who would you like to use Shinjuu Zanshu no Jutsu on?") in V
				if(A==null)
					return
				if(usr.Ninjutsu >= A.Ninjutsu*1.1)
					A.move=0
					A.icon_state="Shinjuu"
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Shinjuu Zanshu no Jutsu!"
					usr.MaxNinjutsu += (1 *0.01)
					sleep(250)
					A.move=1
					A.icon_state=""
				else
					usr << "[A] resists your Shinjuu Zanshu no Jutsu!"
obj/DoryuhekiAbil
	Wall
		icon = 'Doton.dmi'
		icon_state="Wall"
		density = 1
		New()
			flick("Rise",src)
			spawn(500)
			del src
obj/Ninjutsu/Doryuheki
	var/skill = 1
	icon='Skillcard.dmi'
	icon_state="Doryuheki"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<50)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Doryuheki no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=50
				var/obj/DoryuhekiAbil/Wall/A = new
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Doryuheki no Jutsu!"

				if(usr.dir==NORTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
				if(usr.dir==EAST)
					A.loc = locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x,usr.y-1,usr.z)
				if(usr.dir==WEST)
					A.loc = locate(usr.x-1,usr.y,usr.z)
				spawn(45)
				usr.firing=0
				src.Active=0

				if(skill>=10)
					if(prob(10/skill/skill/skill))
						usr<<"Your understanding of the Doryuheki no Jutsu has increased."
						skill+=1
					usr.firing=1
					src.Active=1
					usr.MaxNinjutsu += (1 *0.001)
					usr.Chakra-=usr.MaxChakra*(0.10/skill)
					var/obj/DoryuhekiAbil/Wall/B = new
					var/obj/DoryuhekiAbil/Wall/C = new
					B.dir=usr.dir
					C.dir=usr.dir

					if(usr.dir==NORTH)
						B.loc = locate(usr.x-1,usr.y+1,usr.z)
						C.loc = locate(usr.x+1,usr.y+1,usr.z)
					if(usr.dir==EAST)
						B.loc = locate(usr.x+1,usr.y+1,usr.z)
						C.loc = locate(usr.x+1,usr.y-1,usr.z)
					if(usr.dir==SOUTH)
						B.loc = locate(usr.x-1,usr.y-1,usr.z)
						C.loc = locate(usr.x+1,usr.y-1,usr.z)
					if(usr.dir==WEST)
						B.loc = locate(usr.x-1,usr.y+1,usr.z)
						C.loc = locate(usr.x-1,usr.y-1,usr.z)
					spawn(45)
					usr.firing=0
					src.Active=0


obj/Ninjutsu/Yomi_Numa
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Yomi Numa"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<150)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Doton: Yomi Numa has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=150
				var/obj/Swamp1/A = new
				var/obj/Swamp1/B = new
				var/obj/Swamp1/C = new
				var/obj/Swamp1/D = new
				A.damage = (usr.Ninjutsu/5)+1
				B.damage = (usr.Ninjutsu/5)+1
				C.damage = (usr.Ninjutsu/5)+1
				D.damage = (usr.Ninjutsu/5)+1
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Doton: Yomi Numa!"



				if(usr.dir==NORTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
					D.loc=locate(usr.x+2,usr.y,usr.z)
				if(usr.dir==SOUTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
					D.loc=locate(usr.x+2,usr.y,usr.z)
				if(usr.dir==EAST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
					D.loc=locate(usr.x,usr.y+2,usr.z)
				if(usr.dir==WEST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
					D.loc=locate(usr.x,usr.y+2,usr.z)

				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				D.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				walk(D,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0


obj/Ninjutsu/Domu
	var/Domu=0
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Domu"
	Click()
		if(src in usr.contents)
			if(!Domu)
				if(usr.Chakra<120)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Doton: Domu no Jutsu has increased."
					skill+=1
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=120
				usr.Strength *= 1.5
				usr.Defense *= 2.5
				usr.overlays += 'Domu.dmi'
				src.Active=1
				Domu=1
			else
				usr.Strength = usr.MaxStrength
				usr.Defense = usr.MaxDefense
				usr.overlays -= 'Domu.dmi'
				Domu=0
				src.Active=0

