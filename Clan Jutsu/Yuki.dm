obj/Demon_Mirror
	Wall
		icon = 'Yuki1.dmi'
		icon_state="mirror"
		density = 1
		var/damage
		New()
			flick("Appear",src)
			spawn(200)
			del src










obj/Ninjutsu/Demonic_Ice_Mirrors
	var/skill = 1
	icon='Skillcard.dmi'
	icon_state="mirror"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<150)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Demonic Ice Mirrors has increased."
					skill+=0.5
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *3.000)
				usr.Chakra-=150
				for(var/mob/M in oview(5,usr))
					var/damage=round(usr.Ninjutsu*skill/M.Defense)
					M.Health -= damage
					M.Ko()
				var/obj/Demon_Mirror/Wall/A = new
				var/obj/Demon_Mirror/Wall/B = new
				var/obj/Demon_Mirror/Wall/C = new
				var/obj/Demon_Mirror/Wall/D = new
				var/obj/Demon_Mirror/Wall/E = new
				var/obj/Demon_Mirror/Wall/F = new
				var/obj/Demon_Mirror/Wall/G = new
				var/obj/Demon_Mirror/Wall/H = new
				var/obj/Demon_Mirror/Wall/I = new
				var/obj/Demon_Mirror/Wall/J = new
				var/obj/Demon_Mirror/Wall/K = new
				var/obj/Demon_Mirror/Wall/L = new
				var/obj/Demon_Mirror/Wall/M = new
				var/obj/Demon_Mirror/Wall/N = new
				var/obj/Demon_Mirror/Wall/O = new
				var/obj/Demon_Mirror/Wall/P = new
				var/obj/Demon_Mirror/Wall/Q = new
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Demonic Ice Mirrors!!"

				if(usr.dir==NORTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				if(usr.dir==EAST)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				if(usr.dir==WEST)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				spawn(45)
				usr.firing=0
				src.Active=0



obj/Ninjutsu/Thousand_Needles_Of_Death
	var/skill=1
	icon='Yuki1.dmi'
	icon_state="Inv"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the 1000 Needles Of Death has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.60/skill)
				var/obj/NeedleAbil/A = new
				A.damage = rand(60,120)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: 1000 Needles Of Death!!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0

obj/NeedleAbil
	icon='Yuki1.dmi'
	icon_state="needle"
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
				step(M,usr.dir)
		if(istype(M,/turf))
			if(M.density)
				del(src)