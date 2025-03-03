/*
Types:
	Regular
	Kage
	Mizu
	Suna
	Jujin
	Mushi
Commands:
	Follow
	Stay
	Attack
	Click + Drag = Move
*/
mob/Bunshin/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Bunshin/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Bunshin/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	if(src.displaykey==usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Bunshin
	var/function
	New()
		..()
	Click()
		if(displaykey==usr.key)
			var/list/Choices=new/list
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Destroy Bunshin")
			Choices.Add("Destroy Bunshins")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Destroy Bunshins")
					for(var/mob/Bunshin/A)
						if(A.displaykey==usr.key)
							usr.Taijutsu += A.experiance
							usr.Strength += A.experiance
							usr.Agility += A.experiance
							usr.Defense += A.experiance
							A.overlays = null
							spawn() flick('Smoke.dmi',A)
							del(A)
				if("Destroy Bunshin")
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

obj/Genjutsu/Bunshin
	var/bunshinskill=1
	icon='Skillcard.dmi'
	icon_state="Bunshin"
	Click()
		if(src in usr.contents)
			var/bunshins=0
			if(usr.Chakra<usr.MaxChakra*(0.5/bunshinskill))
				return
			if(!usr.move)
				return
			for(var/mob/Bunshin/Z)
				if(Z.displaykey==usr.key)
					bunshins+=1
			if(bunshins<bunshinskill)
				if(prob(10/bunshinskill/bunshinskill/bunshinskill))
					usr<<"Your understanding of the Bunshin no Jutsu has increased."
					bunshinskill+=1

				usr.MaxGenjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.5/bunshinskill)
				src.Active=1
				var/mob/A=new/mob/Bunshin
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Bunshin no Jutsu!"
				flick('Bunshin.dmi',A)
				A.Health=1
				A.MaxHealth=1
				A.Chakra=usr.Chakra/20
				A.MaxChakra=usr.MaxChakra/20
				A.Strength=usr.Strength/20
				A.Agility=usr.Agility/20
				A.Defense=usr.Defense/20
				A.Control=usr.Control/20
				A.Resistance=usr.Resistance/20
				A.Taijutsu=usr.Taijutsu/20
				A.Ninjutsu=usr.Ninjutsu/20
				A.Genjutsu=usr.Genjutsu/20
				A.displaykey = usr.key
				A.Class=usr.Class
				A.attackable=1
				A.Savable=0
				var/random=rand(1,4)
				if(random==1)
					A.loc=locate(usr.x-1,usr.y,usr.z)
				if(random==2)
					A.loc=locate(usr.x+1,usr.y,usr.z)
				if(random==3)
					A.loc=locate(usr.x,usr.y-1,usr.z)
				if(random==4)
					A.loc=locate(usr.x,usr.y+1,usr.z)
				A.name="[usr.name]"
				A.icon=usr.icon
				A.overlays.Add(usr.overlays)
				A.move=1
				if(bunshinskill>=8)

					usr.MaxGenjutsu += (1 *0.001)
					usr.Chakra-=usr.MaxChakra*(0.5/bunshinskill)
					src.Active=1
					var/mob/B=new/mob/Bunshin
					flick('Bunshin.dmi',B)
					B.Health=1
					B.MaxHealth=1
					B.Chakra=usr.Chakra/20
					B.MaxChakra=usr.MaxChakra/20
					B.Strength=usr.Strength/20
					B.Agility=usr.Agility/20
					B.Defense=usr.Defense/20
					B.Control=usr.Control/20
					B.Resistance=usr.Resistance/20
					B.Taijutsu=usr.Taijutsu/20
					B.Ninjutsu=usr.Ninjutsu/20
					B.Genjutsu=usr.Genjutsu/20
					B.displaykey = usr.key
					B.Class=usr.Class
					B.attackable=1
					B.Savable=0
					var/random1=rand(1,4)
					if(random1==1)
						B.loc=locate(usr.x-1,usr.y,usr.z)
					if(random1==2)
						B.loc=locate(usr.x+1,usr.y,usr.z)
					if(random1==3)
						B.loc=locate(usr.x,usr.y-1,usr.z)
					if(random1==4)
						B.loc=locate(usr.x,usr.y+1,usr.z)
					B.name="[usr.name]"
					B.icon=usr.icon
					B.overlays.Add(usr.overlays)
					B.move=1

				if(bunshinskill>=15)

					usr.MaxGenjutsu += (1 *0.001)
					usr.Chakra-=usr.MaxChakra*(0.5/bunshinskill)
					src.Active=1
					var/mob/B=new/mob/Bunshin
					var/mob/C=new/mob/Bunshin
					flick('Bunshin.dmi',A)
					A.Health=1
					A.MaxHealth=1
					A.Chakra=usr.Chakra/20
					A.MaxChakra=usr.MaxChakra/20
					A.Strength=usr.Strength/20
					A.Agility=usr.Agility/20
					A.Defense=usr.Defense/20
					A.Control=usr.Control/20
					A.Resistance=usr.Resistance/20
					A.Taijutsu=usr.Taijutsu/20
					A.Ninjutsu=usr.Ninjutsu/20
					A.Genjutsu=usr.Genjutsu/20
					A.displaykey = usr.key
					A.Class=usr.Class
					A.attackable=1
					A.Savable=0
					var/random1=rand(1,4)
					if(random1==1)
						A.loc=locate(usr.x-1,usr.y,usr.z)
					if(random1==2)
						A.loc=locate(usr.x+1,usr.y,usr.z)
					if(random1==3)
						A.loc=locate(usr.x,usr.y-1,usr.z)
					if(random1==4)
						A.loc=locate(usr.x,usr.y+1,usr.z)
					A.name="[usr.name]"
					A.icon=usr.icon
					A.overlays.Add(usr.overlays)
					A.move=1
					flick('Bunshin.dmi',B)
					B.Health=1
					B.MaxHealth=1
					B.Chakra=usr.Chakra/20
					B.MaxChakra=usr.MaxChakra/20
					B.Strength=usr.Strength/20
					B.Agility=usr.Agility/20
					B.Defense=usr.Defense/20
					B.Control=usr.Control/20
					B.Resistance=usr.Resistance/20
					B.Taijutsu=usr.Taijutsu/20
					B.Ninjutsu=usr.Ninjutsu/20
					B.Genjutsu=usr.Genjutsu/20
					B.displaykey = usr.key
					B.Class=usr.Class
					B.attackable=1
					B.Savable=0
					var/random2=rand(1,4)
					if(random2==1)
						B.loc=locate(usr.x-1,usr.y,usr.z)
					if(random2==2)
						B.loc=locate(usr.x+1,usr.y,usr.z)
					if(random2==3)
						B.loc=locate(usr.x,usr.y-1,usr.z)
					if(random2==4)
						B.loc=locate(usr.x,usr.y+1,usr.z)
					B.name="[usr.name]"
					B.icon=usr.icon
					B.overlays.Add(usr.overlays)
					B.move=1
					flick('Bunshin.dmi',C)
					C.Health=1
					C.MaxHealth=1
					C.Chakra=usr.Chakra/20
					C.MaxChakra=usr.MaxChakra/20
					C.Strength=usr.Strength/20
					C.Agility=usr.Agility/20
					C.Defense=usr.Defense/20
					C.Control=usr.Control/20
					C.Resistance=usr.Resistance/20
					C.Taijutsu=usr.Taijutsu/20
					C.Ninjutsu=usr.Ninjutsu/20
					C.Genjutsu=usr.Genjutsu/20
					C.displaykey = usr.key
					C.Class=usr.Class
					C.attackable=1
					C.Savable=0
					var/random3=rand(1,4)
					if(random3==1)
						C.loc=locate(usr.x-1,usr.y,usr.z)
					if(random3==2)
						C.loc=locate(usr.x+1,usr.y,usr.z)
					if(random3==3)
						C.loc=locate(usr.x,usr.y-1,usr.z)
					if(random3==4)
						C.loc=locate(usr.x,usr.y+1,usr.z)
					C.name="[usr.name]"
					C.icon=usr.icon
					C.overlays.Add(usr.overlays)
					C.move=1
				sleep(15)
				src.Active=0
			else
				usr<<"You do not have the skill to create this many bunshins."