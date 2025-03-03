obj/items/Scrolls/Fuuinjutsu_Scroll
	icon = 'scroll1.dmi'
	icon_state = "1"
	verb
		Set_Scroll_Type()
			var/I = input("What type of scroll will this be?")in list(/*"General Sealing",*/"Trap","Cancel")
			if(I=="Trap")
				new/obj/items/Scrolls/Trap_Scroll(usr)
				del src
	//		if(I=="General Sealing")
	//			new/obj/items/Citem/tools/Sealing_Scroll(usr)
	//			del src


obj/items/Scrolls/Trap_Scroll
	icon = 'scroll1.dmi'
	icon_state = "1"
	name = "Scroll"
	var/TrapType = ""
	verb
		Set_Trap()
			var/I = input("What type of trap?") in list("Explosive","Kunai","Water","Poison","Cancel")
			if(I=="Explosive")
				for(var/obj/items/Weapon/A in usr.contents)
					if(istype(A,/obj/items/Weapon/Explosive_Tag))
						usr<<"You seal your explosive tag(s) into the scroll."
						new/obj/items/Scrolls/Explosive_Trap_Scroll(usr)
						del A
						del src
			if(I=="Kunai")
				for(var/obj/items/Weapon/A in usr.contents)
					if(istype(A,/obj/items/Weapon/Kunai))
						usr<<"You seal your kunai into the scroll."
						new/obj/items/Scrolls/Kunai_Trap_Scroll(usr)
						del A
						del src
			if(I=="Water")
				if(usr.Jchakra >= 250)
					if(usr.PrimaryElement == "Water" || usr.SecondaryElement == "Water" || usr.TertiaryElement == "Water"||usr.QuadranaryElement=="Water"||usr.QuinaryElement=="Water")
						usr<<"You seal some water into the scroll."
						new/obj/items/Scrolls/Water_Trap_Scroll(usr)
						usr.Jchakra -= 250
						del src
					else
						usr<<"You have to have the water element."
				else
					usr<<"You don't have enough chakra."
			if(I=="Poison")
				for(var/obj/items/Weapon/A in usr.contents)
					if(istype(A,/obj/items/Weapon/Poison_Bomb))
						usr<<"You seal the poison bomb(s) into the scroll."
						new/obj/items/Scrolls/Poison_Trap_Scroll(usr)
						del A
						del src


obj/items/Scrolls/Explosive_Trap_Scroll
	icon = 'scroll1.dmi'
	icon_state = "1"
	name = "Scroll"
	var/TrapType = "Explosive"
	Click()
		if(src.TrapType == "Explosive")
			src.icon_state = "2"
			usr<<"You open the trapped scroll and a bundle of explosives poofs out and explodes in your face."
			if(prob(45))
				usr<<"You take a massive amount of damage and are incapacitated."
				usr.ObjKO()
				del src
				return
			if(prob(20))
				usr<<"You die in the explosion."
				usr.Health = 0
				usr.Death()
				del src
				return
			usr<<"You manage to avoid the explosion and live."
			del src

	verb
		Label_Scroll()
			var/newname = input("What will you change the name to?") as text
			if(newname==null)
				return
			src.name = newname

obj/items/Scrolls/Kunai_Trap_Scroll
	icon = 'scroll1.dmi'
	icon_state = "1"
	name = "Scroll"
	var/TrapType = "Kunai"
	Click()
		if(src.TrapType == "Kunai")
			src.icon_state = "2"
			usr<<"You open the trapped scroll and several kunai fire out towards you."
			if(prob(45))
				usr<<"You take a massive amount of damage and are incapacitated."
				usr.ObjKO()
				del src
				return
			if(prob(20))
				usr<<"You die in the explosion."
				usr.Health = 0
				usr.Death()
				del src
				return
			usr<<"You manage to avoid the kunai and live."
			del src
	verb
		Label_Scroll()
			var/newname = input("What will you change the name to?") as text
			if(newname==null)
				return
			src.name = newname

obj/items/Scrolls/Water_Trap_Scroll
	icon = 'scroll1.dmi'
	icon_state = "1"
	name = "Scroll"
	var/TrapType = "Water"
	Click()
		if(src.TrapType == "Water")
			src.icon_state = "2"
			if(prob(50))
				usr<<"You open the trapped scroll and a burst of water rushes out."
				usr.move=0
				usr.overlays += new/obj/SuirouAbil
				usr.JConst -= 150
				sleep(rand(1000,1200))
				usr.move=1
				usr.overlays -= new/obj/SuirouAbil
				del src
			else
				usr<<"You avoid the rushing water and get away scot free."
				del src
	verb
		Label_Scroll()
			var/newname = input("What will you change the name to?") as text
			if(newname==null)
				return
			src.name = newname

obj/items/Scrolls/Poison_Trap_Scroll
	icon = 'scroll1.dmi'
	icon_state = "1"
	name = "Scroll"
	var/TrapType = "Poison"
	Click()
		if(src.TrapType == "Poison")
			src.icon_state = "2"
			if(prob(50))
				usr<<"You open the trapped scroll and a poisonous cloud surrounds you, filling your lungs."
				usr.PuppetPoison = 1
				usr.Puppet_Poison()
				del src
			else
				usr<<"You barely avoid the poisonous mist."
				del src

/*
obj/items/Citem/tools/Sealing_Scroll
	icon = 'scroll1.dmi'
	icon_state = "scroll2"
	verb
		Seal()
			src.Store()

		Unseal()
			src.Take()


	proc
		Store()
			var/list/O = new
			for(var/obj/items/B in usr.contents)
				O.Add(B)
			var/obj/R = input("What will you store?") in O + "Cancel"
			src.contents += R
			src.icon_state = "read2"
			sleep(10)
			src.icon_state = "scroll2"
			if("Cancel")
				return
		Take()
			var/list/O = new
			for(var/obj/items/B in src.contents)
				O.Add(B)
			var/obj/R = input("What will you take?") in O + "Cancel"
			usr.contents += R
			src.icon_state = "read2"
			sleep(10)
			src.icon_state = "scroll2"
			if("Cancel")
				return
*/