mob/var/Hiraishin=0

obj/Ninjutsu/Edo_Tensei
	icon='Edo.dmi'
	icon_state=""
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.80)
					return
				usr.Chakra-=(usr.MaxChakra*0.80)
				usr.Health-=(usr.MaxHealth*0.30)
				var/list/V = new/list
				for(var/mob/M in oview())
					V.Add(M)
				var/mob/A=input("Who would you like to use Edo Tensei on?","Cancel") in V
				if(A==null)
					return
				if(usr.Ninjutsu >= A.Ninjutsu*1.1)
					A.move=0
					A.loc=locate(289,11,20)
					A.move=1
				for(var/mob/M in world)
					if(M.Dead)
						V.Add(M)
				var/mob/B=input("Who would you like to Ressurect while using Edo Tensei?","Cancel") in V
				if(B==null)
					return
				if(B.Dead)
					B << "[usr] has revived you with Edo Tensei No Jutsu!"
					B.loc=locate(usr.x,usr.y,usr.z)
					B.y-=1
					B.onwater=0
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Edo Tensei no Jutsu!"
					usr.MaxNinjutsu += (1 *0.01)
					B.overlays += 'Edo.dmi'
					sleep(5)
					B.overlays -= 'Edo.dmi'
				else
					usr << "[A] resists your Edo Tensei!"

obj/Ninjutsu/Hiraishin_no_Jutsu
	icon='Skillcard.dmi'
	var/skill=1
	icon_state="Hiraishin"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.60/skill)
					return
				if(usr.Chakra<usr.MaxChakra*(0.60/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Hiraishin no Jutsu has increased."
					skill+=1
				usr.Chakra-=(usr.MaxChakra*0.60/skill)
				var/list/V = new/list
				for(var/mob/M in oview(2))
					V.Add(M)
				var/mob/A=input("Who would you like to use Hiraishin no Jutsu on?","Cancel") in V
				if(A==null)
					return
				viewers(6) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Hiraishin no Jutsu!"
				usr.MaxNinjutsu += (1 *0.01)
				A.Hiraishin=1
				sleep(300*skill)
				A.Hiraishin=0
	verb/Activate_Hiraishin()
		if(src in usr.contents)
			var/list/V = new/list
			for(var/mob/M in world)
				if(M.Hiraishin)
					V.Add(M)
			var/mob/A=input("Who would you like to use the Hiraishin no Jutsu to?","Cancel") in V
			viewers(6) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Hiraishin no Jutsu!"
			usr.MaxNinjutsu += (1 *0.001)
			flick('smoke.dmi',usr)
			usr.loc=locate(A.x,A.y,A.z)
			usr.y+=1


obj/Ninjutsu/Toomegane_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Toomegane"
	Click()
		if(src in usr.contents)
			var/list/V = new/list
			for(var/mob/M in world)
				if(M.Village==usr.Village)
					V.Add(M)
			var/mob/A=input("Who would you like to use the Toomegane no Jutsu on?","Cancel") in V
			usr.move=0
			usr.client.perspective=EYE_PERSPECTIVE
			usr.client.eye=A
			viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Toomegane no Jutsu!"
			usr.MaxNinjutsu += (1 *0.001)
		else
			usr.client.perspective=EYE_PERSPECTIVE
			usr.client.eye=usr
			usr.move=1


//obj/Ninjutsu/Souja_Sousai_no_Jutsu



obj/Ninjutsu/Kusanagi_no_Tsurugi
	var/skill = 1
	icon='Kusanagi.dmi'
	icon_state=""
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<usr.MaxChakra*(0.35/skill))
				return
			if(prob(10/skill/skill/skill))
				usr<<"Your understanding of Kusanagi no Tsurugi: Kuu no Tachi has increased."
				skill+=1
			usr.firing=1
			src.Active=1
			usr.MaxNinjutsu += (1 *0.001)
			usr.Chakra-=usr.MaxChakra*(0.35/skill)
			var/obj/Kusanagi/A = new
			A.damage = (usr.Ninjutsu/3)+skill
			viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Kusanagi no Tsurugi: Kuu no Tachi!"

			A.loc=usr.loc
			A.dir = usr.dir
			usr.client.perspective=EYE_PERSPECTIVE
			usr.client.eye=A
			usr.controlled=A
			sleep(50*skill)
			usr.client.perspective=EYE_PERSPECTIVE
			usr.client.eye=usr
			usr.controlled=null
			walk(A,usr.dir)
			spawn(15)
			usr.firing=0
			src.Active=0
		else
			usr.move=1
			usr.client.perspective=EYE_PERSPECTIVE
			usr.client.eye=usr
			usr.controlled=null
			usr.firing=0
			src.Active=0


obj/Kusanagi
	icon='Kusanagi.dmi'
	icon_state=""
	density = 1
	var/damage
	New()
		spawn(200)
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


mob/var/Shingan=0
obj/Ninjutsu/Kagura_Shingan
	var/skill = 1
	icon='Skillcard.dmi'
	icon_state="Shingan"
	Click()
		if(src in usr.contents)
			if(!usr.Shingan)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.35/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of Kagura Shingan has increased."
					skill+=1
				usr.Shingan=1
				usr << "You activate Kagura Shingan, you can see peoples Chakra."
			else
				usr.Shingan=0
				usr << "You deactivate Kagura Shingan, you can no longer see peoples Chakra."



obj/Ninjutsu/Kaeru_Kaeru_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Kaeru"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.15)
					return
				usr.Chakra-=(usr.MaxChakra*0.15)
				var/list/V = new/list
				for(var/mob/M in oview(1))
					V.Add(M)
				var/mob/A=input("Who would you like to use Kaeru Kaeru no Jutsu on?") in V
				if(A==null)
					return
				if(usr.Ninjutsu >= A.Ninjutsu*1.1)
					A.overlays = null
					A.move=0
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Kaeru Kaeru no Jutsu!"
					usr.MaxGenjutsu += (1 *0.01)
					A.icon = 'Frog.dmi'
					flick('smoke.dmi',A)
					A.move=1
				else
					usr << "[A] resists your Ninjutsu!"
