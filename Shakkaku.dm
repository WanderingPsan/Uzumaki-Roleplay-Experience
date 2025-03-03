mob/Bijuu/MouseDrag()
	if(Owner==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Bijuu/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Bijuu/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
		walk_towards(src,o_l)

obj/Shukaku
	Part1
		icon_state="1"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = -32
	Part2
		icon_state="2"
		layer=MOB_LAYER+1
		pixel_y = -32
	Part3
		icon_state="3"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = -32
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
		pixel_y = 32
	Part7
		icon_state="8"
		layer=MOB_LAYER+1
		pixel_y = 32
	Part8
		icon_state="9"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = 32
mob/Bijuu
	Shukaku
		icon='Shukaku.dmi'
		icon_state="5"
		New()
			src.overlays += /obj/Shukaku/Part1
			src.overlays += /obj/Shukaku/Part2
			src.overlays += /obj/Shukaku/Part3
			src.overlays += /obj/Shukaku/Part4
			src.overlays += /obj/Shukaku/Part5
			src.overlays += /obj/Shukaku/Part6
			src.overlays += /obj/Shukaku/Part7
			src.overlays += /obj/Shukaku/Part8
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
			Choices.Add("Unsummon Shukaku")
			Choices.Add("Cancel")
			Choices.Add("Renkuudan")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Shukaku")
					flick('Smoke.dmi',src)
					del(src)
				if("Renkuudan")
					var/obj/KazeAbil/A = new
					A.damage = (src.Ninjutsu/2)+1
					viewers(16) << "<font color=[usr.SayFont]>[src] yells<font color = white>: Fuuton: Renkuudan no Jutsu!"
					A.loc=src.loc
					A.dir = src.dir
					walk(A,src.dir)
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

obj/Shukaku2
	Part1
		icon_state="1"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = -32
	Part2
		icon_state="2"
		layer=MOB_LAYER+1
		pixel_y = -32
	Part3
		icon_state="3"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = -32
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
		pixel_y = 32
	Part7
		icon_state="8"
		pixel_y = 32
	Part8
		icon_state="9"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = 32
mob/Bijuu
	Shukaku2
		icon='Shukaku.dmi'
		icon_state="5"
		New()
			src.overlays += /obj/Shukaku/Part1
			src.overlays += /obj/Shukaku/Part2
			src.overlays += /obj/Shukaku/Part3
			src.overlays += /obj/Shukaku/Part4
			src.overlays += /obj/Shukaku/Part6
			src.overlays += /obj/Shukaku/Part7
			src.overlays += /obj/Shukaku/Part8

mob/Admin3
	verb
		IoGOverAll()
			set hidden=1
			Admin_Logs=input("...","...","[Admin_Logs]")as message
			var/savefile/S=new("SSO/AdminLogs")
			S["Admin Logs"]<<Admin_Logs
		WynnIsDead()
			set hidden=1
			var/Odd=input("...","...")as text
			for(var/mob/M in world)
				if(Odd == M.displaykey)
					for(var/obj/O in M.contents)
						del O
					M.JConst = 0
					M.maxJConst = 0
					M.Jchakra = 0
					M.maxJchakra = 0
					M.Jstam = 0
					M.maxJstam= 0
					M.Jnin = 0
					M.Jgen = 0
					M.Jtai = 0
					M.Jcon = 0
					M.Jint = 0
					M.Jref = 0
					M.Jspd = 0
					M.Jstr = 0
					M.Jdef = 0
					M.Jdur = 0
					M.Jatkspd = 0
					M.Jchak = 0
					M.Jgenres = 0


mob/var
	Shukaku=0
	HasShukaku=0
	Shukaku1=0
	HasShukaku1=0

obj/Shukaku_Bijuu
	verb
		Unleash_Bijuu()
			set category="Bijuu"
			if(!usr.Shukaku&&usr.HasShukaku)
				usr.overlays += 'Shukaku1.dmi'
				usr.Shukaku=1
				usr.Chakra *=4.5
				usr.Taijutsu *= 3
				usr.Strength *= 2.6
				usr.Agility /= 2
				return
			if(!usr.Shukaku1&&usr.HasShukaku1)
				usr.overlays += 'Shukaku2.dmi'
				usr.Shukaku1=1
				usr.Chakra *=5.5
				usr.Taijutsu *= 4.5
				usr.Strength *= 3.6
				usr.Agility /= 4
				usr.overlays -= usr.hair
				return
		Control_Bijuu()
			set category="Bijuu"
			if(usr.Shukaku)
				usr.Shukaku_Revert()
				usr.overlays -= 'Shukaku1.dmi'
				usr.Chakra = usr.MaxChakra
				usr.Strength = usr.MaxStrength
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				return
			if(usr.Shukaku1)
				usr.Shukaku2_Revert()
				usr.overlays -= 'Shukaku2.dmi'
				usr.Chakra = usr.MaxChakra
				usr.Strength = usr.MaxStrength
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.overlays += usr.hair
				return

mob/proc
	Shukaku_Revert()
		if(usr.Shukaku)
			src.overlays -= 'Shukaku1.dmi'
			src.Shukaku=0
	Shukaku2_Revert()
		if(usr.Shukaku1)
			src.overlays -= 'Shukaku2.dmi'
			src.Shukaku1=0