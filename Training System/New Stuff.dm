obj/Ninjutsu/Chiton/Tensou_Jinse
	var/skill=1
	icon='EXSkillcard.dmi'
	icon_state="Tensou"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<30)
					return
				if(prob(30))
					usr<<"Your understanding of the Chiton: Chibi Tensou Jinse no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				for(var/mob/X in oview(usr,3))
					missile(src,X.loc,usr.loc)
					var/transfer = X.Health/5
					X.Health-=transfer
					usr.Health+=transfer
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = red>: Chiton:Tensou Jinse no Jutsu!"

				spawn(10)
				usr.firing=0
				src.Active=0

obj/Ninjutsu/Chiton/Namichi
	var/skill=1
	icon='EXSkillcard.dmi'
	icon_state="Namichi"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<30)
					return
				if(prob(30))
					usr<<"Your understanding of the Chiton: Namichi no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=30
				var/obj/NamichiAbil/A = new
				var/obj/NamichiAbil/B = new
				var/obj/NamichiAbil/C = new
				A.damage = (rand(50,100)/(5/skill))*(sqrt(usr.Control))
				B.damage = (rand(50,100)/(5/skill))*(sqrt(usr.Control))
				C.damage = (rand(50,100)/(5/skill))*(sqrt(usr.Control))
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = red>: Chiton: Namichi no Jutsu!"

				if(usr.dir==NORTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==SOUTH)
					A.loc=usr.loc
					B.loc=locate(usr.x-1,usr.y,usr.z)
					C.loc=locate(usr.x+1,usr.y,usr.z)
				if(usr.dir==EAST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)
				if(usr.dir==WEST)
					A.loc=locate(usr.x,usr.y+1,usr.z)
					B.loc=usr.loc
					C.loc=locate(usr.x,usr.y-1,usr.z)

				A.dir = usr.dir
				B.dir = usr.dir
				C.dir = usr.dir
				walk(A,usr.dir)
				walk(B,usr.dir)
				walk(C,usr.dir)
				spawn(5)
				usr.firing=0
				src.Active=0

obj/NamichiAbil
	icon='Chiton.dmi'
	icon_state="Namichi"
	density = 1
	var/damage
	New()
		spawn(100)
		del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				M.Health -= damage/sqrt(M.Resistance)
				M.Ko()
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)

obj/Ninjutsu/Chiton/Ketsueki_Gouben
	var/skill=1
	icon='EXSkillcard.dmi'
	icon_state="Ketsueki"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<150)
					return
				if(prob(30))
					usr<<"Your understanding of the Chiton: Ketsueki Gouben no Jutsu has increased."
					skill+=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=300
				var/endhp = (usr.Health/5)*4
				usr.Health = 1000000000
				var/tmpicon = usr.icon
				usr.overlays = null
				src.overlays = usr.overlays
				usr.icon = 'BloodPool.dmi'
				spawn(50)
					usr.icon = tmpicon
					usr.overlays = src.overlays
					usr.Health = endhp
					src.Active=0
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = red>: Chiton: Ketsueki Gouben no Jutsu!"



mob/Chiton_Bunshin/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Chiton_Bunshin/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Chiton_Bunshin/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	if(src.displaykey==usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/Chiton_Bunshin
	var/function
	New()
		..()
	Click()
		if(displaykey==usr.key)
			var/list/Choices=new/list
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Destroy Chiton Bunshin")
			Choices.Add("Destroy Chiton Bunshins")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Destroy Chiton Bunshins")
					for(var/mob/Chiton_Bunshin/A)
						if(A.displaykey==usr.key)
							usr.Taijutsu += A.experiance
							usr.Strength += A.experiance
							usr.Agility += A.experiance
							usr.Defense += A.experiance
							A.overlays = null
							spawn() flick('Smoke.dmi',A)
							del(A)
				if("Destroy Chiton Bunshin")
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

obj/Genjutsu/Chiton/Chiton_Bunshin
	var/Chiton_Bunshinskill=1
	icon='EXSkillcard.dmi'
	icon_state="Chiton_Bunshin"
	Click()
		if(src in usr.contents)
			var/Chiton_Bunshins=0
			if(usr.Chakra<usr.MaxChakra*(0.5/Chiton_Bunshinskill))
				return
			if(!usr.move)
				return
			for(var/mob/Chiton_Bunshin/Z)
				if(Z.displaykey==usr.key)
					Chiton_Bunshins+=1
			if(Chiton_Bunshins<Chiton_Bunshinskill)
				if(prob(30))
					usr<<"Your understanding of the Chiton Bunshin no Jutsu has increased."
					Chiton_Bunshinskill+=1

				usr.MaxGenjutsu += (1 *0.005)
				usr.Chakra-=10*(0.5/Chiton_Bunshinskill)
				src.Active=1
				var/mob/A=new/mob/Chiton_Bunshin
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = red>: Chiton Bunshin no Jutsu!"
				flick('Chiton_Bunshin.dmi',A)
				A.Health=100
				A.MaxHealth=100
				A.Chakra=usr.Chakra/5
				A.MaxChakra=usr.MaxChakra/5
				A.Strength=usr.Strength/5
				A.Agility=usr.Agility/5
				A.Defense=usr.Defense/5
				A.Control=usr.Control/5
				A.Resistance=usr.Resistance/5
				A.Taijutsu=usr.Taijutsu/5
				A.Ninjutsu=usr.Ninjutsu/5
				A.Genjutsu=usr.Genjutsu/5
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
				if(Chiton_Bunshinskill>=8)

					usr.MaxGenjutsu += (1 *0.001)
					usr.Chakra-=usr.MaxChakra*(0.5/Chiton_Bunshinskill)
					src.Active=1
					var/mob/B=new/mob/Chiton_Bunshin
					flick('Chiton_Bunshin.dmi',B)
					B.Health=100
					B.MaxHealth=100
					B.Chakra=usr.Chakra/5
					B.MaxChakra=usr.MaxChakra/5
					B.Strength=usr.Strength/5
					B.Agility=usr.Agility/5
					B.Defense=usr.Defense/5
					B.Control=usr.Control/5
					B.Resistance=usr.Resistance/5
					B.Taijutsu=usr.Taijutsu/5
					B.Ninjutsu=usr.Ninjutsu/5
					B.Genjutsu=usr.Genjutsu/5
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

				if(Chiton_Bunshinskill>=15)

					usr.MaxGenjutsu += (1 *0.001)
					usr.Chakra-=usr.MaxChakra*(0.5/Chiton_Bunshinskill)
					src.Active=1
					var/mob/B=new/mob/Chiton_Bunshin
					var/mob/C=new/mob/Chiton_Bunshin
					flick('Chiton_Bunshin.dmi',A)
					A.Health=100
					A.MaxHealth=100
					A.Chakra=usr.Chakra/5
					A.MaxChakra=usr.MaxChakra/5
					A.Strength=usr.Strength/5
					A.Agility=usr.Agility/5
					A.Defense=usr.Defense/5
					A.Control=usr.Control/5
					A.Resistance=usr.Resistance/5
					A.Taijutsu=usr.Taijutsu/5
					A.Ninjutsu=usr.Ninjutsu/5
					A.Genjutsu=usr.Genjutsu/5
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
					flick('Chiton_Bunshin.dmi',B)
					B.Health=100
					B.MaxHealth=100
					B.Chakra=usr.Chakra/5
					B.MaxChakra=usr.MaxChakra/5
					B.Strength=usr.Strength/5
					B.Agility=usr.Agility/5
					B.Defense=usr.Defense/5
					B.Control=usr.Control/5
					B.Resistance=usr.Resistance/5
					B.Taijutsu=usr.Taijutsu/5
					B.Ninjutsu=usr.Ninjutsu/5
					B.Genjutsu=usr.Genjutsu/5
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
					flick('Chiton_Bunshin.dmi',C)
					C.Health=100
					C.MaxHealth=100
					C.Chakra=usr.Chakra/5
					C.MaxChakra=usr.MaxChakra/5
					C.Strength=usr.Strength/5
					C.Agility=usr.Agility/5
					C.Defense=usr.Defense/5
					C.Control=usr.Control/5
					C.Resistance=usr.Resistance/5
					C.Taijutsu=usr.Taijutsu/5
					C.Ninjutsu=usr.Ninjutsu/5
					C.Genjutsu=usr.Genjutsu/5
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
				usr<<"You do not have the skill to create this many Chiton Bunshins."

/*obj/Taijutsu/Chiton/Tsuchi_Seppuku_no_Jutsu
	var/skill = 1
	icon='EXSkillcard.dmi'
	icon_state="Tsuchi"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<150)
					return
				if(prob(30))
					usr<<"Your understanding of Tsuchi Seppuku no Jutsu has increased."
					skill+=0.5
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=150
				for(var/mob/M in oview(5,usr))
					var/damage=round(usr.Taijutsu*skill/M.Defense)*2
					M.Health -= damage
					M.Ko()
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = red>: Chiton: Tsuchi Seppuku no Jutsu!"
				usr.Jutsu_Gain()
				for(var/turf/X in getsquare(usr,5))
					if(!locate(usr) in X)
						new/obj/Tsuchi/Wall(locate(X.x,X.y,X.z))
				spawn(5)
				for(var/mob/X in getsquare(usr,5))
					if(X!=usr)
						X.Health -= 25
						X.Ko(usr)
				spawn(45)
				usr.firing=0
				src.Active=0*/

obj/Tsuchi
	Wall
		icon = 'EXSkillCard.dmi'
		icon_state="Tsuchi"
		density = 1
		New()
			..()
			flick("Rise",src)
			spawn(200)
			del src


mob
	var
		lefteye = 1
		righteye = 1

//obj/Ninjutsu/Shosen

/*obj/Doujutsu
	Eye_Transplant
		icon='Skillcard.dmi'
		icon_state="Shosen"
		Click()
			if(src in usr.contents)
				if(usr.firing)
					return
				for(var/mob/M in get_step(usr,usr.dir))
					if(M&&M.client)
						if(!M.KO)
							switch(input(M,"[usr] wishes to extract one of your eyes for transplant.") in list("Yes","No"))
								if("No")
									return
								if("Yes")

									var/list/V
									if(locate(/obj/Doujutsu) in M)
										for(var/obj/Doujutsu/X in M)
											if(X.type != text2path("/obj/Doujutsu/Eye_Transplant"))
												V += M
										V+="Cancel"
										var/steal=input(usr,"Which eye do you want to steal?") in V
											if(steal=="Cancel")
											return
										else
											if(!locate( /obj/Ninjutsu/Healing_Jutsu in usr))
												usr << alert("Warning: Attempting an eye transplant without medical training carries very high risks.")
												switch(input(usr,"Do you wish to proceed with the extraction?") in list("Yes","No"))
													if("Yes")
														if(prob(40))
															del steal
															usr << "You rendered the eye unusable."
															return
													if("No")
														return
								var/neweye
								if(prob(50))
									if(M.lefteye)
										M.lefteye=0
										neweye="left"
										usr << "You removed the left eye."
										M << "Your left eye was removed."
									else
										if(M.righteye)
											M.righteye=0
											neweye="right"
											usr <<" You removed the right eye."
											M << "Your right eye was removed."
								else
									if(M.righteye)
										M.righteye=0
										neweye="right"
										usr <<" You removed the right eye."
										M << "Your right eye was removed."
									else
										if(M.lefteye)
											M.lefteye=0
											neweye="left"
											usr << "You removed the left eye."
											M << "Your left eye was removed."
								var/list/W = new
								for(var/mob/T in range(1,usr))
									W+= T
								W+= "Cancel"
								var/give=input(usr,"Who do you want to give the eye too?") in W
								if(give=="Cancel") return
								else
									if(!locate( /obj/Ninjutsu/Healing_Jutsu in usr))
										usr << alert("Warning: Attempting an eye transplant without medical training carries very high risks.")
										switch(input(usr,"Do you wish to proceed with the extraction?") in list("Yes","No"))
											if("Yes")
												var/mob/D = give
												switch(input(D,"Do you give consent to allow the eye transplant without medical training?") in list("Yes","No"))
													if("Yes")
														if(prob(30))
															usr << "You ruptured an vein in [give]'s eye socket, causing them to die of internal bleeding."
															D << "[usr] slips and ruptures a vein in your eye socket, causing you to die of internal bleeding."
															D.Health = 0
															D.Ko(usr)
															usr.InstaKill(D)
															return
													if("No")
														return
											if("No")
												return
									var/mob/C = give
									switch(neweye)
										if("right")
											if(C.righteye)
												C.righteye = 0
												C.contents += steal
												M.contents -= steal
											else
												if(C.lefteye)
													C.lefteye = 0
													C.contents += steal
													M.contents -= steal
										if("left")
											if(C.lefteye)
												C.lefteye = 0
												C.contents += steal
												M.contents -= steal
											else
												if(C.righteye)
													C.righteye = 0
													C.contents += steal
													M.contents -= steal
									viewers(16)<<"[usr] has transplanted [M]'s [steal] into [C]!"
									for(var/mob/L in viewers(16))
										L.ChatLog("<font color=red>*[usr.name]([usr.key]) has transplanted [M]'s [steal] into [C]!")





*/
mob/var/LStore = 0


obj/items/Scrolls
	Jutsu_Scroll
		var/ele = ""
		var
			lrncost = 0
			nan = ""
			Kekkei
			IsStored = 0
		icon='Scrolls.dmi'
		icon_state="5"
		verb/Read_Scroll()
			if(usr.Jchakra>300)
				if(IsStored)
					if(src.ele == usr.PrimaryElement || src.ele == usr.SecondaryElement || src.ele == usr.SecondaryElement || src.ele == usr.TertiaryElement|| src.ele == usr.QuadranaryElement || src.ele==usr.QuinaryElement || src.ele == "Elementless")
						if(usr.Trait == "Genius")
							if(prob(95))
								usr.LStore += 9
								usr<<"Genius Kicked In!"
						if(usr.Trait == "Hardworker")
							if(prob(95))
								usr.LStore += 6.5
								usr<<"Your Hard Work Reading Has Paid Off!"
						for(var/obj/Perk/A in usr.contents)
							if(A.name == "Mastery")
								if(prob(99))
									usr.LStore += 2
									usr<<"You have gotten closer to learning this jutsu."
									usr<<"Mastery Perk Kicked In!"

								else
									usr.LStore += 1
									usr<<"You've gotten a bit closer to learning the jutsu."
									usr<<"Mastery Perk Kicked In!"
							if(A.name == "Prodigy")
								if(prob(90))
									usr.LStore += 1.9
									usr<<"You've gotten closer to learning this jutsu."
									usr<<"Prodigy Perk Kicked in!"
								else
									usr.LStore += 1
									usr<<"You've gotten closer to learning this jutsu."
									usr<<"Prodigy Perk Kicked in!"
							if(A.name == "Studious 1")
								if(prob(90))
									usr.LStore += 5
									usr<<"Studious 1 kicked in!"
							if(A.name == "Studious 2")
								if(prob(90))
									usr.LStore += 10
									usr<<"Studious 2 kicked in!"
							if(A.name == "Studious 3")
								if(prob(90))
									usr.LStore += 12
									usr<<"Studious 3 kicked in!"
							if(A.name == "Studious 4")
								if(prob(90))
									usr.LStore += 15
									usr<<"Studious 4 kicked in!"
							if(findtext(A.name,"Elemental Training [src.ele]"))
								if(prob(95))
									usr.LStore += src.lrncost*0.125
									usr<<"Elemental Training [src.ele] kicked in!"
							if(findtext(A.name,"Elemental Mastery [src.ele]"))
								if(prob(95))
									usr.LStore += src.lrncost*0.25
									usr<<"Elemental Mastery [src.ele] kicked in!"
							if(usr.LStore >= src.lrncost)
								usr << "You have learned [src.nan]."
								var/obj/Custom/Blank_Jutsu/E = new(usr)
								E.name=src.nan
								E.description=src.description
								E.dran=src.dran*2.25
								E.skil= "New"
								E.jut=src.jut
								E.ran=src.ran
								E.ele=src.ele
								E.Kekkei = src.Kekkei
								usr.LStore = 0
								return

						usr.LStore += 0.5
						usr<<"You've read through the scroll, practicing and memorizing information. Amount of Info To Learn:[src.lrncost] | Amount Gained:[usr.LStore]"


					else
						usr << "You cannot learn a jutsu of this element."
				else
					usr << "This doesn't contain a jutsu."
			else
				usr << "You don't have the chakra to do this."
		verb/Seal_Jutsu()
			if(usr.Jchakra>300)
				if(!IsStored)
					var/list/V = new
					for(var/obj/Custom/X in usr.contents)
						V.Add(X)
					var/obj/Custom/P = input(usr,"What jutsu do you want to store in this scroll?") in V + list("Cancel")
					src.ele = P.ele
					src.nan = P.name
					src.description = P.description
					src.skil = "New"
					src.jut = P.jut
					src.ran = P.ran
					src.dran = P.dran
					src.Kekkei = P.Kekkei
					src.CostCheck()
					src.IsStored = 1
					if(P=="Cancel")
						return

				else
					usr << "This already contains a jutsu."

		verb/Label_Scroll()
			var/oldname = src.name
			src.name=input(usr,"What do you want to label this scroll as?") as text
			if(!src.name) src.name=oldname


		proc
			CostCheck()
				if(src.ran=="E")
					if(src.ele=="Elementless")
						src.lrncost = 5
					if(src.ele=="Fire")
						src.lrncost = 10
					if(src.ele=="Lightning")
						src.lrncost = 10
					if(src.ele=="Water")
						src.lrncost = 10
					if(src.ele=="Wind")
						src.lrncost = 10
					if(src.ele=="Earth")
						src.lrncost = 10
					if(src.ele=="Ice")
						src.lrncost = 20
					if(src.ele=="Boil")
						src.lrncost = 20
					if(src.ele=="Storm")
						src.lrncost = 20
					if(src.ele=="Magnetism")
						src.lrncost = 20
					if(src.ele=="Steam")
						src.lrncost = 20
					if(src.ele=="Wood")
						src.lrncost = 30
					if(src.ele=="Lava")
						src.lrncost = 20
					if(src.ele=="Crystal")
						src.lrncost = 30
					if(src.ele=="Blaze")
						src.lrncost = 30
					if(src.ele=="Dust")
						src.lrncost = 50
					if(src.ele=="Dark")
						src.lrncost = 50
					if(src.ele=="Steel")
						src.lrncost = 20
					if(src.ele=="Swift")
						src.lrncost = 40
					if(src.ele=="Explosion")
						src.lrncost = 30
					if(src.ele=="Scorch")
						src.lrncost = 40
				if(src.ran=="D")
					if(src.ele=="Elementless")
						src.lrncost = 10
					if(src.ele=="Fire")
						src.lrncost = 20
					if(src.ele=="Lightning")
						src.lrncost = 20
					if(src.ele=="Water")
						src.lrncost = 20
					if(src.ele=="Wind")
						src.lrncost = 20
					if(src.ele=="Earth")
						src.lrncost = 20
					if(src.ele=="Ice")
						src.lrncost = 30
					if(src.ele=="Boil")
						src.lrncost = 30
					if(src.ele=="Storm")
						src.lrncost = 30
					if(src.ele=="Magnetism")
						src.lrncost = 30
					if(src.ele=="Steam")
						src.lrncost = 30
					if(src.ele=="Wood")
						src.lrncost = 40
					if(src.ele=="Lava")
						src.lrncost = 30
					if(src.ele=="Crystal")
						src.lrncost = 40
					if(src.ele=="Blaze")
						src.lrncost = 40
					if(src.ele=="Dust")
						src.lrncost = 60
					if(src.ele=="Dark")
						src.lrncost = 60
					if(src.ele=="Steel")
						src.lrncost = 30
					if(src.ele=="Swift")
						src.lrncost = 40
					if(src.ele=="Explosion")
						src.lrncost = 40
					if(src.ele=="Scorch")
						src.lrncost = 50
				if(src.ran=="C")
					if(src.ele=="Elementless")
						src.lrncost = 20
					if(src.ele=="Fire")
						src.lrncost = 30
					if(src.ele=="Lightning")
						src.lrncost = 30
					if(src.ele=="Water")
						src.lrncost = 30
					if(src.ele=="Wind")
						src.lrncost = 30
					if(src.ele=="Earth")
						src.lrncost = 30
					if(src.ele=="Ice")
						src.lrncost = 40
					if(src.ele=="Boil")
						src.lrncost = 40
					if(src.ele=="Storm")
						src.lrncost = 40
					if(src.ele=="Magnetism")
						src.lrncost = 40
					if(src.ele=="Steam")
						src.lrncost = 40
					if(src.ele=="Wood")
						src.lrncost = 50
					if(src.ele=="Lava")
						src.lrncost = 40
					if(src.ele=="Crystal")
						src.lrncost = 50
					if(src.ele=="Blaze")
						src.lrncost = 50
					if(src.ele=="Dust")
						src.lrncost = 70
					if(src.ele=="Dark")
						src.lrncost = 70
					if(src.ele=="Steel")
						src.lrncost = 40
					if(src.ele=="Swift")
						src.lrncost = 50
					if(src.ele=="Explosion")
						src.lrncost = 50
					if(src.ele=="Scorch")
						src.lrncost = 60
				if(src.ran=="B")
					if(src.ele=="Elementless")
						src.lrncost = 30
					if(src.ele=="Fire")
						src.lrncost = 40
					if(src.ele=="Lightning")
						src.lrncost = 40
					if(src.ele=="Water")
						src.lrncost = 40
					if(src.ele=="Wind")
						src.lrncost = 40
					if(src.ele=="Earth")
						src.lrncost = 40
					if(src.ele=="Ice")
						src.lrncost = 50
					if(src.ele=="Boil")
						src.lrncost = 50
					if(src.ele=="Storm")
						src.lrncost = 50
					if(src.ele=="Magnetism")
						src.lrncost = 50
					if(src.ele=="Steam")
						src.lrncost = 50
					if(src.ele=="Wood")
						src.lrncost = 60
					if(src.ele=="Lava")
						src.lrncost = 50
					if(src.ele=="Crystal")
						src.lrncost = 60
					if(src.ele=="Blaze")
						src.lrncost = 60
					if(src.ele=="Dust")
						src.lrncost = 80
					if(src.ele=="Dark")
						src.lrncost = 80
					if(src.ele=="Steel")
						src.lrncost = 50
					if(src.ele=="Swift")
						src.lrncost = 60
					if(src.ele=="Explosion")
						src.lrncost = 60
					if(src.ele=="Scorch")
						src.lrncost = 70
				if(src.ran=="A")
					if(src.ele=="Elementless")
						src.lrncost = 40
					if(src.ele=="Fire")
						src.lrncost = 50
					if(src.ele=="Lightning")
						src.lrncost = 50
					if(src.ele=="Water")
						src.lrncost = 50
					if(src.ele=="Wind")
						src.lrncost = 50
					if(src.ele=="Earth")
						src.lrncost = 50
					if(src.ele=="Ice")
						src.lrncost = 60
					if(src.ele=="Boil")
						src.lrncost = 60
					if(src.ele=="Storm")
						src.lrncost = 60
					if(src.ele=="Magnetism")
						src.lrncost = 60
					if(src.ele=="Steam")
						src.lrncost = 60
					if(src.ele=="Wood")
						src.lrncost = 70
					if(src.ele=="Lava")
						src.lrncost = 60
					if(src.ele=="Crystal")
						src.lrncost = 70
					if(src.ele=="Blaze")
						src.lrncost = 70
					if(src.ele=="Dust")
						src.lrncost = 90
					if(src.ele=="Dark")
						src.lrncost = 90
					if(src.ele=="Steel")
						src.lrncost = 60
					if(src.ele=="Swift")
						src.lrncost = 70
					if(src.ele=="Explosion")
						src.lrncost = 70
					if(src.ele=="Scorch")
						src.lrncost = 80
				if(src.ran=="S")
					if(src.ele=="Elementless")
						src.lrncost = 300
					if(src.ele=="Fire")
						src.lrncost = 400
					if(src.ele=="Lightning")
						src.lrncost = 400
					if(src.ele=="Water")
						src.lrncost = 400
					if(src.ele=="Wind")
						src.lrncost = 400
					if(src.ele=="Earth")
						src.lrncost = 400
					if(src.ele=="Ice")
						src.lrncost = 500
					if(src.ele=="Boil")
						src.lrncost = 500
					if(src.ele=="Storm")
						src.lrncost = 500
					if(src.ele=="Magnetism")
						src.lrncost = 500
					if(src.ele=="Steam")
						src.lrncost = 500
					if(src.ele=="Wood")
						src.lrncost = 600
					if(src.ele=="Lava")
						src.lrncost = 500
					if(src.ele=="Crystal")
						src.lrncost = 600
					if(src.ele=="Blaze")
						src.lrncost = 600
					if(src.ele=="Dust")
						src.lrncost = 800
					if(src.ele=="Dark")
						src.lrncost = 800
					if(src.ele=="Steel")
						src.lrncost = 500
					if(src.ele=="Swift")
						src.lrncost = 600
					if(src.ele=="Explosion")
						src.lrncost = 600
					if(src.ele=="Scorch")
						src.lrncost = 700











mob/proc
	InstaKill(mob/M)
		for(var/obj/items/A in M.contents)
			A.loc = M.loc
		for(var/mob/L in viewers(20))
			L<<"<font color=red><i>[M] was just KILLED by [usr]!"
			L.ChatLog("<font color=red>*[usr.name]([usr.key]) just <i>KILLED</i> [M]([M.key])")
			L.SpyLand("<font color=red>*[usr.name]([usr.key]) just <i>KILLED</i> [M]([M.key])")
		M.Death()

