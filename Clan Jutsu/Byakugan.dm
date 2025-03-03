mob/var/Byakugan=0
mob/var/Mark=0
obj/Doujutsu/Byakugan
	icon='Skillcard.dmi'
	icon_state="Byakugan"
	var/skill=1
	Click()
		if(src in usr.contents)
			if(!usr.Hyuuga)
				return
			if(!usr.Byakugan&&usr.Hyuuga)
				if(prob(25/skill/skill/skill))
					if(skill>10)
						return
					skill+=1
				usr.Byakugan=1
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s hidden iris becomes more apparent, as veins  bulge lateral to each eye.<font color = white>*)"
				usr.overlays += 'Hyuuga.dmi'
				usr.Taijutsu *= 1.18*(skill/2)
				usr.Agility *= 1.20*(skill/2)
				usr.drain5=1
				usr.drain5()



			else
				usr.Byakugan=0
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s iris and pupil become barely discernable with both appearing a milky white in color<font color = white>*)"
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.drain5=0
				if(!usr.Hyuuga)
					usr.overlays -= 'Hyuuga.dmi'


mob/var/drain5=0
mob/proc
	drain5()
		spawn(10)
		if(usr.drain5)
			sleep(70)
			usr.Chakra -= 3
			usr.drain5()
		if(usr.Chakra<=0)
			viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s iris and pupil become barely discernable with both appearing a milky white in color<font color = white>*)"
			usr.Taijutsu = usr.MaxTaijutsu
			usr.Agility = usr.MaxAgility
			usr.Defense = usr.MaxDefense
			usr.drain5=0
			usr.Byakugan=0
			if(!usr.Hyuuga)
				usr.overlays -= 'Hyuuga.dmi'

obj/Ninjutsu/Control_Branch
	icon='Skillcard.dmi'
	icon_state="Byakugan"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Chakra<usr.MaxChakra*0.30)
					return
				usr.Chakra-=(usr.MaxChakra*0.30)
				var/list/V = new/list
				for(var/mob/M in oview())
					V.Add(M)
				var/mob/A=input("Who would you like to use the Hyuuga Secret Control on?") in V
				if(A==null)
					return
				if(A.Mark)
					A.move=0
					A.drain=1
					A.drain()
					A.icon_state="KO"
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Hyuuga Secret Control!"
					usr.MaxGenjutsu += (1 *0.01)
					sleep(200)
					A.move=1
					A.drain=0
					A.icon_state=""
				else
					usr << "[A] isn't part of the Hyuuga Branch Family!"


//obj/Ninjutsu/Hakke_Kuushou

