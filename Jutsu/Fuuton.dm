//Renkuudan and Kaze Dangan
obj/Ninjutsu/Kaze
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Kaze"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Fuuton: Kaze Dangan no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.60/skill)
				var/obj/KazeAbil/A = new
				A.damage = rand(60,120)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Fuuton: Kaze Dangan no Jutsu!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0


obj/KazeAbil
	icon='Fuuton.dmi'
	icon_state="KazeDangan"
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

obj/Ninjutsu/Renkuudan
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Renkuudan"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Fuuton: Renkuudan no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.60/skill)
				var/obj/RenkuudanAbil/A = new
				A.damage = rand(60,120)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Fuuton: Renkuudan no Jutsu!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0
			if(usr.Fan)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.40/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Fuuton: Renkuudan no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.40/skill)
				flick("Attack",usr)
				var/obj/RenkuudanAbil/A = new
				A.damage = rand(100,150)/4+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Fuuton: Renkuudan no Jutsu!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0


obj/RenkuudanAbil
	icon='Fuuton.dmi'
	icon_state="Renkuudan"
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


obj/Ninjutsu/Kazekiri
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Kazekiri"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Fuuton: Kazekiri no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.70/skill)
				var/obj/Kazekiri/A = new
				A.damage = rand(80,120)/3+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Fuuton: Kazekiri no Jutsu!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0
			if(usr.Fan)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.45/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Fuuton: Kazekiri no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.45/skill)
				flick("Attack",usr)
				var/obj/Kazekiri/A = new
				A.damage = rand(80,130)/3+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Fuuton: Kazekiri no Jutsu!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0



obj/Kazekiri
	icon='Fuuton.dmi'
	icon_state="Wind Cutter"
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

obj/Ninjutsu/Kaze_no_Yaiba
	icon='Skillcard.dmi'
	icon_state="Yaiba"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.80)
					return
				usr.Chakra-=(usr.MaxChakra*0.80)
				var/list/V = new/list
				for(var/mob/M in oview(2))
					V.Add(M)
				var/mob/A=input("Who would you like to use Kaze no Yaiba on?") in V
				if(A==null)
					return
				if(usr.Control >= A.Resistance*1.7)
					A.overlays += 'Yaiba.dmi'
					sleep(5)
					A.overlays -= 'Yaiba.dmi'
					A.Death()
					A.move=1
					A.Dead=1
				if(usr.Ninjutsu >= A.Ninjutsu*1.1)
					A.overlays += 'Yaiba.dmi'
					A.move=0
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Kaze no Yaiba no Jutsu!"
					usr.MaxGenjutsu += (1 *0.01)
					sleep(15)
					A.overlays -= 'Yaiba.dmi'
					A.move=1
					A.Health -= (usr.Ninjutsu/4)+1
				else
					usr << "[A] resists your Ninjutsu!"




obj/Ninjutsu/Reppushou
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Reppushou"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.30/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Fuuton: Reppushou no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.30/skill)
				var/obj/Reppushou/A = new
				A.damage = rand(50,80)/4+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Fuuton: Reppushou no Jutsu!"

				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0


obj/Reppushou
	icon='Fuuton.dmi'
	icon_state="Reppushou"
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
				step(M,usr.dir)
		if(istype(M,/turf))
			if(M.density)
				del(src)