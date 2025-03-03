//Dragonfire and Housenka
//Goryuka - Dragon
//Gokakyu  - Fire ball
//Hibashiri - Circle of Fire
mob/var/firing=0
mob/var
	infire=0
	fireproc=0

mob/proc/Fire()
	if(src.infire&&!src.KO&&!src.fireproc)
		src.fireproc=1
		src.Health -= rand(1,3)
		src.Ko()
		src.fireproc=0
		spawn(30)
		src.Fire()
	else
		src.infire=0


obj/Endan
	icon = 'Katon.dmi'
	icon_state="Endan"
	density = 1
	layer = MOB_LAYER+1
	New()
		spawn(70)
		del src
obj/HibashiriAbil
	Wall
		icon = 'Katon.dmi'
		icon_state="flame2"
		density = 1
		New()
			spawn(500)
			del src

	Start
		icon = 'Katon.dmi'
		icon_state="flame1"
		density = 1
		New()
			spawn(500)
			del src
	End
		icon = 'Katon.dmi'
		icon_state="flame3"
		density = 1
		New()
			spawn(500)
			del src


obj/Goukakyuu
	Center
		icon = 'Goukakyuu.dmi'
		icon_state="flame"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
			del src


	Left
		icon = 'Goukakyuu.dmi'
		icon_state="flame3"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
			del src
	Right
		icon = 'Goukakyuu.dmi'
		icon_state="flame4"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
			del src
	BottomLeft
		icon = 'Goukakyuu.dmi'
		icon_state="flame5"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
			del src
	BottomRight
		icon = 'Goukakyuu.dmi'
		icon_state="flame6"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
			del src
	Trail
		icon = 'Goukakyuu.dmi'
		icon_state="trail"
		layer = MOB_LAYER+1
		Entered(mob/M)
			if(ismob(M))
				M.infire=1
				M.Fire()
		Exited(mob/M)
			if(ismob(M))
				M.infire=0
		New()
			spawn(100)
			del src



obj/Ninjutsu/Hibashiri
	var/skill = 1
	icon='Skillcard.dmi'
	icon_state="Hibashiri"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<40)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Hibashiri no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=40
				var/obj/HibashiriAbil/Wall/A = new
				A.dir=usr.dir
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Katon: Hibashiri no Jutsu!"

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

				if(skill>=5)
					if(prob(10/skill/skill/skill))
						usr<<"Your understanding of the Hibashiri no Jutsu has increased."
						skill+=1
					usr.firing=1
					src.Active=1
					usr.MaxNinjutsu += (1 *0.001)
					usr.Chakra-=usr.MaxChakra*(0.10/skill)
					var/obj/HibashiriAbil/Start/B = new
					var/obj/HibashiriAbil/End/C = new
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




obj/Ninjutsu/Goukakyuu
	var/skill = 1
	icon='Skillcard.dmi'
	icon_state="Goukakyuu"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<100)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Goukakyuu no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=100
				var/obj/Goukakyuu/Center/A = new
				var/obj/Goukakyuu/Left/B = new
				var/obj/Goukakyuu/Right/C = new
				var/obj/Goukakyuu/BottomLeft/D = new
				var/obj/Goukakyuu/BottomRight/E = new
				var/obj/Goukakyuu/Center/F = new
				var/obj/Goukakyuu/Center/G = new
				var/obj/Goukakyuu/Center/H = new
				var/obj/Goukakyuu/Center/I = new
				var/obj/Goukakyuu/Trail/J = new
				A.dir=usr.dir
				B.dir=usr.dir
				C.dir=usr.dir
				D.dir=usr.dir
				E.dir=usr.dir
				F.dir=usr.dir
				G.dir=usr.dir
				H.dir=usr.dir
				I.dir=usr.dir
				J.dir=usr.dir
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Katon: Goukakyuu no Jutsu!"

				usr.move=0
				if(usr.dir==NORTH)
					A.loc = locate(usr.x,usr.y+2,usr.z)
					B.loc = locate(usr.x-1,usr.y+4,usr.z)
					C.loc = locate(usr.x+1,usr.y+4,usr.z)
					D.loc = locate(usr.x-1,usr.y+2,usr.z)
					E.loc = locate(usr.x+1,usr.y+2,usr.z)
					F.loc = locate(usr.x,usr.y+3,usr.z)
					G.loc = locate(usr.x,usr.y+4,usr.z)
					H.loc = locate(usr.x-1,usr.y+3,usr.z)
					I.loc = locate(usr.x+1,usr.y+3,usr.z)
					J.loc = locate(usr.x,usr.y+1,usr.z)
				if(usr.dir==EAST)
					A.loc = locate(usr.x+2,usr.y,usr.z)
					B.loc = locate(usr.x+2,usr.y+1,usr.z)
					C.loc = locate(usr.x+4,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+4,usr.y-1,usr.z)
					F.loc = locate(usr.x+3,usr.y,usr.z)
					G.loc = locate(usr.x+4,usr.y,usr.z)
					H.loc = locate(usr.x+3,usr.y-1,usr.z)
					I.loc = locate(usr.x+3,usr.y+1,usr.z)
					J.loc = locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x,usr.y-2,usr.z)
					B.loc = locate(usr.x-1,usr.y-2,usr.z)
					C.loc = locate(usr.x+1,usr.y-2,usr.z)
					D.loc = locate(usr.x-1,usr.y-4,usr.z)
					E.loc = locate(usr.x+1,usr.y-4,usr.z)
					F.loc = locate(usr.x,usr.y-3,usr.z)
					G.loc = locate(usr.x,usr.y-4,usr.z)
					H.loc = locate(usr.x-1,usr.y-3,usr.z)
					I.loc = locate(usr.x+1,usr.y-3,usr.z)
					J.loc = locate(usr.x,usr.y-1,usr.z)
				if(usr.dir==WEST)
					A.loc = locate(usr.x-2,usr.y,usr.z)
					B.loc = locate(usr.x-4,usr.y+1,usr.z)
					C.loc = locate(usr.x-2,usr.y+1,usr.z)
					D.loc = locate(usr.x-4,usr.y-1,usr.z)
					E.loc = locate(usr.x-2,usr.y-1,usr.z)
					F.loc = locate(usr.x-3,usr.y,usr.z)
					G.loc = locate(usr.x-4,usr.y,usr.z)
					H.loc = locate(usr.x-3,usr.y-1,usr.z)
					I.loc = locate(usr.x-3,usr.y+1,usr.z)
					J.loc = locate(usr.x-1,usr.y,usr.z)
				for(var/mob/M in oview(4,usr))
					if(A)
						if(M.loc==A.loc)
							var/damage= rand(60,120)/5+skill
							M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,usr))
					if(B)
						if(M.loc==B.loc)
							var/damage= rand(60,120)/5+skill
							M.Health -= damage
							M.Ko()

				for(var/mob/M in oview(4,usr))
					if(C)
						if(M.loc==C.loc)
							var/damage= rand(60,120)/5+skill
							M.Health -= damage
							M.Ko()

				for(var/mob/M in oview(4,usr))
					if(D)
						if(M.loc==D.loc)
							var/damage= rand(60,120)/5+skill
							M.Health -= damage
							M.Ko()

				for(var/mob/M in oview(4,usr))
					if(E)
						if(M.loc==E.loc)
							var/damage= rand(60,120)/5+skill
							M.Health -= damage
							M.Ko()

				for(var/mob/M in oview(4,usr))
					if(F)
						if(M.loc==F.loc)
							var/damage= rand(60,120)/5+skill
							M.Health -= damage
							M.Ko()

				for(var/mob/M in oview(4,usr))
					if(G)
						if(M.loc==G.loc)
							var/damage= rand(60,120)/5+skill
							M.Health -= damage
							M.Ko()

				for(var/mob/M in oview(4,usr))
					if(H)
						if(M.loc==H.loc)
							var/damage= rand(60,120)/5+skill
							M.Health -= damage
							M.Ko()

				for(var/mob/M in oview(4,usr))
					if(I)
						if(M.loc==I.loc)
							var/damage= rand(60,120)/5+skill
							M.Health -= damage
							M.Ko()

				for(var/mob/M in oview(4,usr))
					if(J)
						if(M.loc==J.loc)
							var/damage= rand(60,120)/5+skill
							M.Health -= damage
							M.Ko()


				spawn(100)
				usr.firing=0
				src.Active=0
				sleep(90)
				usr.move=1

obj/Ninjutsu/Housenka
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Housenka"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Katon: Housenka no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.60/skill)
				var/obj/HousenkaAbil/A = new
				var/obj/HousenkaAbil/B = new
				var/obj/HousenkaAbil/C = new
				A.damage = rand(50,100)/5+skill
				B.damage = rand(50,100)/5+skill
				C.damage = rand(50,100)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Katon: Housenka no Jutsu!"



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

				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0

obj/Ninjutsu/Endan
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Endan"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Katon: Endan no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.60/skill)
				var/obj/Endan/A = new
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Katon: Endan no Jutsu!"

				if(usr.dir==NORTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					A.dir = usr.dir
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x,usr.y-1,usr.z)
					A.dir = usr.dir
				if(usr.dir==EAST)
					A.loc = locate(usr.x+1,usr.y,usr.z)
					A.dir = usr.dir
				if(usr.dir==WEST)
					A.loc = locate(usr.x-1,usr.y,usr.z)
					A.dir = usr.dir
				for(var/mob/M in oview(2,usr))
					if(A)
						if(M.loc==A.loc)
							var/damage= rand(60,100)/5+skill
							M.Health -= damage
							M.Ko()

				spawn(45)
				usr.firing=0
				src.Active=0
				usr.move=0
				sleep(60)
				usr.move=1
obj/Medium_Endan
	/*Part1
		icon_state="1"
		layer=MOB_LAYER+1
		pixel_x = -32*/
	Part2
		icon_state="2"
		layer=MOB_LAYER+1
		pixel_x = 32
	Part3
		icon_state="3"
		pixel_y = 32
	Part4
		icon_state="4"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = 32
obj/Medium_Endan
	icon='Katon.dmi'
	icon_state="1"
	layer=MOB_LAYER+1
	New()
		/*src.overlays += /obj/Medium_Endan/Part1*/
		src.overlays += /obj/Medium_Endan/Part2
		src.overlays += /obj/Medium_Endan/Part3
		src.overlays += /obj/Medium_Endan/Part4

obj/Ninjutsu/Dai_Endan
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Endan"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.80/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Katon:Dai Endan no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.80/skill)
				var/obj/Medium_Endan/A = new
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Katon:Dai Endan no Jutsu!"

				if(usr.dir==NORTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					A.dir = usr.dir
					sleep(10)
					A.loc = locate(usr.x-1,usr.y+1,usr.z)
					A.dir = usr.dir
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x,usr.y-2,usr.z)
					A.dir = usr.dir
					sleep(10)
					A.loc = locate(usr.x-1,usr.y-2,usr.z)
					A.dir = usr.dir
				if(usr.dir==EAST)
					A.loc = locate(usr.x+2,usr.y,usr.z)
					A.dir = usr.dir
				if(usr.dir==WEST)
					A.loc = locate(usr.x-2,usr.y,usr.z)
					A.dir = usr.dir
				for(var/mob/M in oview(3,usr))
					if(A)
						if(M.loc==A.loc)
							var/damage= rand(70,140)/5+skill
							M.Health -= damage
							M.Ko()

				spawn(45)
				usr.firing=0
				src.Active=0
				usr.move=0
				sleep(60)
				usr.move=1
				sleep(30)
				del(A)



obj/Ninjutsu/Kage_Shuriken
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Kage Shuriken"
	Click()
		if(src in usr.contents)
			if(locate(/obj/items/Weapon/Shuriken,usr.contents))
				if(!usr.move)
					return
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Kage Shuriken no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.60/skill)
				var/obj/Shuriken/A = new
				var/obj/Shuriken/B = new
				var/obj/Shuriken/C = new
				A.damage = rand(25,50)/5+skill
				B.damage = rand(25,50)/5+skill
				C.damage = rand(25,50)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Kage Shuriken no Jutsu!"



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


				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0

				if(skill>=10)
					if(prob(10/skill/skill/skill))
						usr<<"Your understanding of the Kage Shuriken no Jutsu has increased."
						skill+=1
					usr.firing=1
					src.Active=1
					usr.MaxNinjutsu += (1 *0.001)
					usr.Chakra-=usr.MaxChakra*(0.10/skill)
					var/obj/Shuriken/D = new
					var/obj/Shuriken/E = new
					var/obj/Shuriken/F = new
					D.damage = rand(25,50)/5+skill
					E.damage = rand(25,50)/5+skill
					F.damage = rand(25,50)/5+skill



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



obj/Ninjutsu/Kage_Kunai
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Kage Kunai"
	Click()
		if(src in usr.contents)
			if(locate(/obj/items/Weapon/Kunai,usr.contents))
				if(!usr.move)
					return
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Kage Kunai no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.60/skill)
				var/obj/Kunai/A = new
				var/obj/Kunai/B = new
				var/obj/Kunai/C = new
				A.damage = rand(25,50)/5+skill
				B.damage = rand(25,50)/5+skill
				C.damage = rand(25,50)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Kage Kunai no Jutsu!"


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


				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0

				if(skill>=10)
					if(prob(10/skill/skill/skill))
						usr<<"Your understanding of the Kage Kunai no Jutsu has increased."
						skill+=1
					usr.firing=1
					src.Active=1
					usr.MaxNinjutsu += (1 *0.001)
					usr.Chakra-=usr.MaxChakra*(0.10/skill)
					var/obj/Kunai/D = new
					var/obj/Kunai/E = new
					var/obj/Kunai/F = new
					D.damage = rand(25,50)/5+skill
					E.damage = rand(25,50)/5+skill
					F.damage = rand(25,50)/5+skill


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


obj/AmaterasuAbil
	icon='Katon.dmi'
	icon_state="Ama"
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

obj/HousenkaAbil
	icon='Katon.dmi'
	icon_state="housenka"
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
obj/Ninjutsu/Dragonfire
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Dragonfire"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Katon: Ryuka no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.60/skill)
				var/obj/DragonfireAbil/A = new
				A.damage = rand(80,160)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Katon: Ryuka no Jutsu!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0

obj/DragonfireAbil
	icon='Katon.dmi'
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
		var/obj/DragonfireTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/DragonfireTrail
	icon='Katon.dmi'
	icon_state="Trail"
	density = 1
	var/damage
	New()
		spawn(20)
		del src