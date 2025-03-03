mob/var/Kyuu=0

obj/Ninjutsu/Summoning_Jutsu:_Shukaku
	icon='Skillcard.dmi'
	icon_state="Tanukineiri"
	var/Kuchiyoseskill=1
	Click()
		if(src in usr.contents)
			for(var/mob/Bijuu/Shukaku/E in world)
				if(E.Owner==usr.key)
					usr << "You already summoned Shukaku."
					return
			if(usr.Chakra<usr.MaxChakra*(0.80/Kuchiyoseskill))
				return
			if(!usr.move)
				return
				if(prob(10/Kuchiyoseskill/Kuchiyoseskill/Kuchiyoseskill))
					usr<<"Your understanding of the Summoning_Jutsu:_Shukaku has increased."
					Kuchiyoseskill+=1

			usr.MaxNinjutsu += (1 *0.002)
			usr.Chakra-=usr.MaxChakra*(0.80/Kuchiyoseskill)
			var/mob/Bijuu/Shukaku/E = new()
			E.Owner = usr.key
			E.loc = usr.loc
			E.Health=100
			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.5*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.5*rand(1.5,3)
			E.Strength=usr.Strength/1.5*rand(1.5,3)
			E.Agility=usr.Agility/2.5*rand(1.5,3)
			E.Defense=usr.Defense/2*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.5*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.5*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/2*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)

obj/Ninjutsu/Sand_Coffin
	icon='Skillcard.dmi'
	icon_state="Kyuu"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.30)
					return
				usr.Chakra-=(usr.MaxChakra*0.30)
				var/list/V = new/list
				for(var/mob/M in oview())
					V.Add(M)
				var/mob/A=input("Who would you like to use the Sand Coffin on?") in V
				if(A==null)
					return
				if(A.Kyuu)
					return
				if(usr.Ninjutsu >= A.Resistance*1.1)
					A.overlays += 'Sabaku.dmi'
					sleep(10)
					A.overlays -= 'Sabaku.dmi'
					A.overlays += 'Kyuu.dmi'
					A.Kyuu=1
					A.move=0
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Sand Coffin!"
					usr.MaxNinjutsu += (1 *0.01)
					sleep(250)
					A.overlays -= 'Kyuu.dmi'
					A.Kyuu=0
					A.move=1
				else
					usr << "[A] resists your Sand Coffin!"

obj/Ninjutsu/Sand_Burial
	icon='Skillcard.dmi'
	icon_state="Sousou"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.10)
					return
				usr.Chakra-=(usr.MaxChakra*0.10)
				var/list/V = new/list
				for(var/mob/M in oview())
					V.Add(M)
				var/mob/A=input("Who would you like to use the Sand Burial on?") in V
				if(A==null)
					return
				if(!A.Kyuu)
					return
				if(A.move)
					return
				if(usr.Control >= A.Resistance*1.9)
					A.overlays += 'Sousou.dmi'
					sleep(5)
					A.overlays -= 'Sousou.dmi'
					A.overlays -= 'Kyuu.dmi'
					A.Kyuu=0
					A.loc=locate(289,11,20)
					A.move=1
					A.Dead=1
				if(usr.Ninjutsu >= A.Resistance*1.1)
					A.overlays += 'Sousou.dmi'
					sleep(5)
					A.overlays -= 'Sousou.dmi'
					A.overlays -= 'Kyuu.dmi'
					A.Health -= (usr.Ninjutsu/3)+1
					A.Kyuu=0
					A.move=1
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Sand Burial!"
					usr.MaxNinjutsu += (1 *0.01)
				else
					usr << "[A] resists your Sand Burial!"


obj/Ninjutsu/Sand_Shield
	var/Mayu=0
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Mayu"
	Click()
		if(src in usr.contents)
			if(!Mayu)
				if(usr.Chakra<60)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of Sand_Shield has increased."
					skill+=1
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=60
				usr.move=0
				usr.Defense *= 10.5
				usr.overlays += 'Suna no Mayu.dmi'
				sleep(10)
				usr.overlays -= 'Suna no Mayu.dmi'
				usr.overlays += 'Mayu.dmi'
				sleep(2)
				usr.overlays -= 'Suna no Mayu.dmi'
				src.Active=1
				Mayu=1
			else
				usr.Defense = usr.MaxDefense
				usr.overlays -= 'Suna no Mayu.dmi'
				usr.overlays -= 'Mayu.dmi'
				usr.move=1
				Mayu=0
				src.Active=0

obj/Ninjutsu/Sand_Armour
	var/Yoroi=0
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Yoroi"
	Click()
		if(src in usr.contents)
			if(!Yoroi)
				if(usr.Chakra<usr.MaxChakra*0.10)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of Sand Armour has increased."
					skill+=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=(usr.MaxChakra*0.30)
				usr.Defense *= 2.5*(skill/1.8)
				usr.overlays += 'Suna no Yoroi.dmi'
				src.Active=1
				Yoroi=1
				sleep(10)
				usr.overlays -='Suna no Yoroi.dmi'
				usr << "You have activated Sand Armour ans a thin layer of sand begins to cover you."
			else
				usr.Defense = usr.MaxDefense
				usr.overlays -= 'Suna no Yoroi.dmi'
				Yoroi=0
				src.Active=0
				usr << "You have deactivated Sand Armour"

obj/Ninjutsu/Third_Eye
	var/skill = 1
	icon='Daisan no Me.dmi'
	icon_state=""
	Click()
		if(src in usr.contents)
			if(!usr.Daisan)
				if(usr.firing)
					return
				if(usr.Chakra<usr.MaxChakra*(0.10/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of The Third Eye has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.10/skill)
				var/obj/Daisan/A = new
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Let me see all Third Eye!"

				A.loc=usr.loc
				A.dir = usr.dir
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=A
				usr.controlled=A
				usr.Daisan=1
				sleep(50*skill)
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=usr
				usr.controlled=null
				usr.Daisan=0
				spawn(15)
				usr.firing=0
				src.Active=0
				del(A)
			else
				usr.move=1
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=usr
				usr.controlled=null
				usr.firing=0
				src.Active=0
				usr.Daisan=0
				for(var/obj/Daisan/A in world)
					del(A)

mob/var/Daisan=0

/*obj/Ninjutsu/Daisan_no_Me
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Daisan no Me"
	Click()
		if(src in usr.contents)
			if(!usr.Daisan)
				if(usr.Chakra<usr.MaxChakra*0.05)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of Daisan no Me has increased."
					skill+=1
				usr.Chakra-=(usr.MaxChakra*0.05)
				var/obj/Daisan/S = new()
				S.loc = usr.loc
				usr.Daisan=1
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=S
				usr.controlled=S
				usr<<"You created a eye of sand out of one of your own eye."
				sleep(skill*200)
				usr.Daisan=0
				usr<<"The sand disperse and your eye returns to normal."
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=usr
				usr.controlled=usr
				del(S)
			else
				if(usr.Daisan)
					for(var/obj/Daisan/S in oviewers())
						usr.Daisan=0
						usr<<"The sand disperse and your eye returns to normal."
						usr.client.perspective=EYE_PERSPECTIVE
						usr.client.eye=usr
						usr.controlled=usr
						del(S)*/