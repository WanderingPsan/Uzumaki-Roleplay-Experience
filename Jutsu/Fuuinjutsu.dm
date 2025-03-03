mob/var/Shiki=0
mob/var/Mujin=0
mob/var/Fuuin=0
/*obj/Fuuinjutsu/Genryuu_Kyuu_Fuujin
	icon='Skillcard.dmi'
	icon_state="Genryuu"
	Click()*/


obj/Fuuinjutsu/Gogyou_Fuuin
	icon='Skillcard.dmi'
	icon_state="Gogyou Fuuin"
	var/curseskill=1
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<(350/curseskill))
				return
			for(var/mob/M in get_step(usr,usr.dir))
				if(M.Fuuin)
					return
				usr.firing=1
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Gogyou Fuuin no Jutsu!"
				M.UnKo()
				M.MaxChakra-=(M.MaxChakra/3)
				M << "You have been hit in the stomach by [usr]"
				usr.Chakra-=(350/curseskill)
				M.Fuuin=1
				curseskill+=(0.01*2)
				sleep(50)
				usr.firing=0

obj/Fuuinjutsu/Gogyou_Kaiin
	icon='Skillcard.dmi'
	icon_state="Gogyou Kaiin"
	var/curseskill=1
	Click()
		if(src in usr.contents)
			if(usr.firing)
				return
			if(usr.Chakra<(350/curseskill))
				return
			for(var/mob/M in get_step(usr,usr.dir))
				if(!M.Fuuin)
					return
				usr.firing=1
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Gogyou Kaiin no Jutsu!"
				M.UnKo()
				M.MaxChakra+=(M.MaxChakra*2)
				M << "You have been hit in the stomach by [usr]"
				usr.Chakra-=(350/curseskill)
				M.Fuuin=0
				curseskill+=(0.01*2)
				sleep(50)
				usr.firing=0


obj/Fuuinjutsu/Shikoku_Mujin
	icon='Skillcard.dmi'
	icon_state="Shikoku Mujin"
	Click()
		if(src in usr.contents)
			if(usr.Mujin)
				return
			if(usr.Chakra<100)
				return
			usr.Chakra-=100
			usr.Mujin=1
			viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Shikoku Mujin no Jutsu!"
			sleep(5)
			var/obj/items/Clothing/Curse_Seal_Container/D = new()
			D.loc = usr.loc



obj/Fuuinjutsu/Shiki_Fuujin
	icon='Skillcard.dmi'
	icon_state="Shiki"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<500)
				return
			for(var/mob/Shiki/Shinigami/D in world)
				if(D.Owner==usr.key)
					usr << "You have already summoned Shinigami the Death God."
					return
			usr.Chakra-=500
			var/mob/Shiki/Shinigami/D = new()
			D.Owner = usr.key
			D.loc = usr.loc
			D.Chakra=usr.Chakra/2
			D.MaxChakra=usr.MaxChakra/2
			D.Strength=usr.Strength/2
			D.Agility=usr.Agility/3
			D.Defense=usr.Defense/2
			D.Control=usr.Control/3
			D.Resistance=usr.Resistance/3
			D.Ninjutsu=usr.Ninjutsu/2
			D.Genjutsu=usr.Genjutsu/3
			D.Taijutsu = usr.Taijutsu/2
			D.attackable=0
			D.Health=100
			D.MaxHealth=100


obj/Shinigami
	Part1
		icon_state="1"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = 32
	Part2
		icon_state="2"
		layer=MOB_LAYER+1
		pixel_y = 32
	Part3
		icon_state="3"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = 32
	Part4
		icon_state="4"
		layer=MOB_LAYER+1
		pixel_x = -32
	Part5
		icon_state="6"
		layer=MOB_LAYER+1
		pixel_x = 32
	Part6
		icon_state="7"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = -32
	Part7
		icon_state="8"
		layer=MOB_LAYER+1
		pixel_y = -32
	Part8
		icon_state="9"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = -32
mob/Shiki
	var/function
	var/Owner = null
	New()
		..()
	Click()
		if(Owner==usr.key)
			var/list/Choices=new/list
			Choices.Add("Remove Soul")
			Choices.Add("Unsummon Shinigami")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Shinigami")
					flick('Smoke.dmi',src)
					del(src)
				if("Remove Soul")
					if(usr.Chakra<usr.MaxChakra*0.80)
						return
					if(usr.Health<usr.MaxHealth*0.30)
						usr.Shiki=1
					usr.Chakra-=(usr.MaxChakra*0.80)
					usr.Health-=(usr.MaxHealth*0.30)
					var/list/V = new/list
					for(var/mob/M in oview(2))
						V.Add(M)
					var/mob/A=input("Who would you like to use Shiki Fuujin on?","Cancel") in V
					if(A==null)
						return
					if(usr.Shiki)
						viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Shiki Fuujin no Jutsu!"
						A.Health-=40
						A.MaxHealth-=40
						usr << "the Death God wasn't able to remove [A]'s Soul fully because you are near death."
						sleep(5)
						usr.loc=locate(289,11,20)
						flick('Smoke.dmi',src)
						del(src)
						return
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Shiki Fuujin no Jutsu!"
					sleep(5)
					A.loc=locate(289,11,20)
					A.move=1
					usr.loc=locate(289,11,20)
					flick('Smoke.dmi',src)
					del(src)



	Shinigami
		icon='Shiki.dmi'
		icon_state="5"
		New()
			src.overlays += /obj/Shinigami/Part1
			src.overlays += /obj/Shinigami/Part2
			src.overlays += /obj/Shinigami/Part3
			src.overlays += /obj/Shinigami/Part4
			src.overlays += /obj/Shinigami/Part5
			src.overlays += /obj/Shinigami/Part6
			src.overlays += /obj/Shinigami/Part7
			src.overlays += /obj/Shinigami/Part8

