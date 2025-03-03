

obj/Dove/MouseDrag()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
obj/Dove/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


obj/Dove/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...

	if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
		walk_towards(src,o_l)

obj/Ninjutsu/Dove_Summoning
	var/Kuchiyoseskill=1
	icon='Dove1.dmi'
	icon_state=""
	Click()
		if(src in usr.contents)
			for(var/mob/Summoning/Dove/E in world)
				if(E.Owner==usr.key)
					usr << "You may only summon one Dove at a time."
					return
			if(usr.Chakra<usr.MaxChakra*(0.80/Kuchiyoseskill))
				return
			if(!usr.move)
				return
				if(prob(10/Kuchiyoseskill/Kuchiyoseskill/Kuchiyoseskill))
					usr<<"Your understanding of the Kuchiyose no Jutsu has increased."
					Kuchiyoseskill+=1
			var/mob/Summoning/Dove/E = new()
			E.Owner = usr.key
			E.loc = usr.loc
			E.Health=100
			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.2*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.2*rand(1.5,3)
			E.Strength=usr.Strength/1.2*rand(1.5,3)
			E.Agility=usr.Agility/2.2*rand(1.5,3)
			E.Defense=usr.Defense/1.8*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.2*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.2*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/1.8*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)
mob/Summoning/Dove
	icon='Dove1.dmi'




obj/Bee/MouseDrag()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
obj/Bee/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


obj/Bee/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...

	if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
		walk_towards(src,o_l)

obj/Ninjutsu/Bee_Summoning
	var/Kuchiyoseskill=1
	icon='bees.dmi'
	icon_state=""
	Click()
		if(src in usr.contents)
			for(var/mob/Bee/E in world)
				if(E.Owner==usr.key)
					usr << "You may only summon one Swarm at time."
					return
			if(usr.Chakra<usr.MaxChakra*(0.80/Kuchiyoseskill))
				return
			if(!usr.move)
				return
				if(prob(10/Kuchiyoseskill/Kuchiyoseskill/Kuchiyoseskill))
					usr<<"Your understanding of the Kuchiyose no Jutsu has increased."
					Kuchiyoseskill+=1
			var/mob/Bee/E = new()
			E.Owner = usr.key
			E.loc = usr.loc
			E.Health=100
			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.2*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.2*rand(1.5,3)
			E.Strength=usr.Strength/1.2*rand(1.5,3)
			E.Agility=usr.Agility/2.2*rand(1.5,3)
			E.Defense=usr.Defense/1.8*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.2*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.2*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/1.8*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)
mob/Bee
	icon='bees.dmi'
	var/function
	var/Owner = null
	New()
		..()
	Click()
		if(Owner==usr.key)
			var/list/Choices=new/list
			Choices.Add("Attack Target")
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Unsummon Bee")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Bee")
					flick('Smoke.dmi',src)
					del(src)
				if("Follow")
					function=1
					spawn while(function==1)
						sleep(5)
						if(prob(20)) step_rand(src)
						else step_towards(src,usr)
				if("Stay") function=2
				if("Attack Target")
					function=3
					var/mob/list/Targets=new/list
					for(var/mob/M in oviewers(12)) Targets.Add(M)
					var/mob/Choice=input("Attack who?") in Targets
					for(var/mob/M in oviewers(12)) if(Choice==M)
						spawn while(function==3)
							sleep(20)
							if(prob(10)) step_rand(src)
							else step_towards(src,M)
							BunshinAttack()


obj/Axolotl/MouseDrag()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
obj/Axolotl/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


obj/Axolotl/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...

	if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
		walk_towards(src,o_l)

obj/Ninjutsu/Axolotl_Summoning
	var/Kuchiyoseskill=1
	icon='Axolotl.dmi'
	icon_state="mudkip"
	Click()
		if(src in usr.contents)
			for(var/mob/Summoning/Axolotl/E in world)
				if(E.Owner==usr.key)
					usr << "You may only summon one Axolotl at a time."
					return
			if(usr.Chakra<usr.MaxChakra*(0.80/Kuchiyoseskill))
				return
			if(!usr.move)
				return
				if(prob(10/Kuchiyoseskill/Kuchiyoseskill/Kuchiyoseskill))
					usr<<"Your understanding of the Kuchiyose no Jutsu has increased."
					Kuchiyoseskill+=1

			usr.MaxNinjutsu += (1 *0.002)
			usr.Chakra-=usr.MaxChakra*(0.80/Kuchiyoseskill)
			var/mob/Summoning/Axolotl/E = new()
			E.Owner = usr.key
			E.loc = usr.loc

			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.2*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.2*rand(1.5,3)
			E.Strength=usr.Strength/1.2*rand(1.5,3)
			E.Agility=usr.Agility/2.2*rand(1.5,3)
			E.Defense=usr.Defense/1.8*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.2*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.2*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/1.8*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)

obj/Ninjutsu/Medium_Axolotl_Summoning
	var/Kuchiyoseskill=1
	icon='Axolotl.dmi'
	icon_state="marshtop"
	Click()
		if(src in usr.contents)
			for(var/mob/Summoning/Medium_Axolotl/E in world)
				if(E.Owner==usr.key)
					usr << "You may only summon one Axolotl at a time."
					return
			if(usr.Chakra<usr.MaxChakra*(0.80/Kuchiyoseskill))
				return
			if(!usr.move)
				return
				if(prob(10/Kuchiyoseskill/Kuchiyoseskill/Kuchiyoseskill))
					usr<<"Your understanding of the Kuchiyose no Jutsu has increased."
					Kuchiyoseskill+=1

			usr.MaxNinjutsu += (1 *0.002)
			usr.Chakra-=usr.MaxChakra*(0.80/Kuchiyoseskill)
			var/mob/Summoning/Medium_Axolotl/E = new()
			E.Owner = usr.key
			E.loc = usr.loc

			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.2*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.2*rand(1.5,3)
			E.Strength=usr.Strength/1.2*rand(1.5,3)
			E.Agility=usr.Agility/2.2*rand(1.5,3)
			E.Defense=usr.Defense/1.8*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.2*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.2*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/1.8*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)

obj/Ninjutsu/Large_Axolotl_Summoning
	var/Kuchiyoseskill=1
	icon='Axolotl.dmi'
	icon_state="marshtop"
	Click()
		if(src in usr.contents)
			for(var/mob/Summoning/Large_Axolotl/E in world)
				if(E.Owner==usr.key)
					usr << "You may only summon one Axolotl at a time."
					return
			if(usr.Chakra<usr.MaxChakra*(0.80/Kuchiyoseskill))
				return
			if(!usr.move)
				return
				if(prob(10/Kuchiyoseskill/Kuchiyoseskill/Kuchiyoseskill))
					usr<<"Your understanding of the Kuchiyose no Jutsu has increased."
					Kuchiyoseskill+=1

			usr.MaxNinjutsu += (1 *0.002)
			usr.Chakra-=usr.MaxChakra*(0.80/Kuchiyoseskill)
			var/mob/Summoning/Large_Axolotl/E = new()
			E.Owner = usr.key
			E.loc = usr.loc
			E.Health=100
			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.2*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.2*rand(1.5,3)
			E.Strength=usr.Strength/1.2*rand(1.5,3)
			E.Agility=usr.Agility/2.2*rand(1.5,3)
			E.Defense=usr.Defense/1.8*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.2*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.2*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/1.8*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)



mob/Summoning/Axolotl
	icon='Axolotl.dmi'
	icon_state="mudkip"
mob/Summoning/Medium_Axolotl
	icon='Axolotl.dmi'
	icon_state="marshtop"
mob/Summoning/Large_Axolotl
	icon='Axolotl.dmi'
	icon_state="swampert"