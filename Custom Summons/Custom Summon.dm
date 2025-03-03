/*mob/Custom_Summon/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Custom_Summon/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Custom_Summon/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	if(src.displaykey==usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Custom_Summon
	var/function
	New()
		..()
	Click()
		if(displaykey==usr.key)
			var/list/Choices=new/list
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Unsummon")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon")
					usr.Taijutsu += src.experiance
					usr.Strength += src.experiance
					usr.Agility += src.experiance
					usr.Defense += src.experiance
					src.overlays = null
					flick('Smoke.dmi',src)
					del(src)
				if("Follow")
					function=1
					spawn while(function==1)
						sleep(5)
						if(prob(20)) step_rand(src)
						else step_towards(src,usr)
				if("Stay") function=2

mob/admin3/Give_Custom_Summon()

obj/Ninjutsu/Custom_Summon
	var/Kuchiyoseskill=1
	icon=''
	icon_state=""
	Click()
		if(src in usr.contents)
			for(var/mob/Summoning/Custom_Summon/E in world)
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
			usr.Jutsu_Gain()
			usr.MaxNinjutsu += (1 *0.002)
			usr.Chakra-=usr.MaxChakra*(0.80/Kuchiyoseskill)
			var/mob/Summoning/Custom_Summon/E = new()
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
			E.icon=src.icon
			E.icon_state=src.icon_state	r			*/



mob/Admin7/verb
	Give_Custom_Summon(mob/M in world)
		input("Give one?")in list("Yes","No")
		if("Yes")
			M.contents+=new /obj/SkillCard/Jutsu/
			var/P = input("Which icon?") as file
			var/emot = input("What will be the cry?") as text
			var/nam = input("What name?") as text
			for(var/obj/SkillCard/Jutsu/O in usr.contents)
				O.icon=P
				O.Jutsuicon=P
				O.JutsuType = "Mob"
				O.Emote=emot
				O.Name = nam
				O.Mob =1
				O.jut = "Ninjutsu"
				Admin_Logs+="<br>[usr]([usr.key]) uses Give Custom Summon [O.name] on [M]."
				SaveLogs()
		if("No")
			return