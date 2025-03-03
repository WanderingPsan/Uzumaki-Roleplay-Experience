obj/Ninjutsu/Rasenshuriken
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Rasengan"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(!usr.Rasengan)
					return
				if(usr.Chakra<usr.MaxChakra*(0.45/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Rasenshuriken no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.45/skill)
				var/obj/Shriken_Rasengan/A = new
				var/obj/Shriken_Rasengan/B = new
				var/obj/Shriken_Rasengan/C = new
				var/obj/Shriken_Rasengan/D = new
				var/obj/Shriken_Rasengan/E = new
				var/obj/Shriken_Rasengan/F = new
				A.damage = rand(25,70)/5+skill
				B.damage = rand(25,70)/5+skill
				C.damage = rand(25,70)/5+skill
				D.damage = rand(25,70)/5+skill
				E.damage = rand(25,70)/5+skill
				F.damage = rand(25,70)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Rasenshuriken!"
				usr.Jutsu_Gain()


				if(usr.dir==NORTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==SOUTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==EAST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
				if(usr.dir==WEST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
				if(usr.dir==NORTH)
					D.loc=usr.loc
					E.loc=locate(usr.x-1,usr.y,usr.z)
					F.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==SOUTH)
					D.loc=usr.loc
					E.loc=locate(usr.x-1,usr.y,usr.z)
					F.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==EAST)
					D.loc=locate(usr.x,usr.y+1,usr.z)
					E.loc=usr.loc
					F.loc=locate(usr.x,usr.y-1,usr.z)
				if(usr.dir==WEST)
					D.loc=locate(usr.x,usr.y+1,usr.z)
					E.loc=usr.loc
					F.loc=locate(usr.x,usr.y-1,usr.z)


				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				sleep(8)
				D.dir = usr.dir
				E.dir = usr.dir
				F.dir = usr.dir
				walk(D,usr.dir)
				walk(E,usr.dir)
				walk(F,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0

obj/Shriken_Rasengan
	icon='Rasengan.dmi'
	icon_state="1"
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
