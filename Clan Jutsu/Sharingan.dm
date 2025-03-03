mob/var/Sharingan=0
mob/var/Kyouten=0
mob/var/SharinganCopy=0
obj/Doujutsu/Sharingan1
	icon='Skillcard.dmi'
	icon_state="Sharingan1"
	var/skill=1
	Click()
		if(src in usr.contents)
			if(!usr.Uchiha)
				return
			if(!usr.Sharingan)
				if(prob(25/skill/skill/skill))
					if(skill>5)
						return
					skill+=1
				usr.SC()
				usr.SharinganCopy=1
				usr.Sharingan=1
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s pupils begin turn red as they develop one of the wheel swirls<font color = white>*)"
				usr.overlays += 'Sharingan.dmi'
				usr.Taijutsu += 20
				usr.Agility += 20
				usr.drain4=1
				usr.drain4()
			else
				usr.Sharingan=0
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s eyes return to normal as the red fades and the pupils retuns to normal<font color = white>*)"
				usr.overlays -= 'Sharingan.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.drain4=0
				usr.SharinganCopy=0

obj/Doujutsu/Sharingan2
	icon='Skillcard.dmi'
	icon_state="Sharingan2"
	var/skill=1
	Click()
		if(src in usr.contents)
			if(!usr.Uchiha)
				return
			if(!usr.Sharingan)
				if(prob(20/skill/skill/skill))
					if(skill>10)
						return
					skill+=1
				usr.SC()
				usr.SharinganCopy=1
				usr.Sharingan=1
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s pupils begin turn red as they develop two of the wheel swirls<font color = white>*)"
				usr.overlays += 'Sharingan.dmi'
				usr.Taijutsu += 40
				usr.Agility += 40
				usr.Defense += 40
				usr.drain4=1
				usr.drain4()
				for(var/obj/Doujutsu/Sharingan1/A in usr.contents)
					del(A)
			else
				usr.Sharingan=0
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s eyes return to normal as the red fades and the pupils retuns to normal<font color = white>*)"
				usr.overlays -= 'Sharingan.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Defense = usr.MaxDefense
				usr.drain4=0
				usr.SharinganCopy=0

mob/var/Mastered=0
obj/Doujutsu/Sharingan3
	icon='Skillcard.dmi'
	icon_state="Sharingan3"
	var/skill=1
	Click()
		if(src in usr.contents)
			if(!usr.Uchiha)
				return
			if(!usr.Sharingan)
				if(prob(15/skill/skill/skill))
					if(skill>15)
						return
					skill+=1
				usr.SC()
				usr.SharinganCopy=1
				usr.Sharingan=1
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s pupils begin turn red as they develop three of the wheel swirls<font color = white>*)"
				usr.overlays += 'Sharingan.dmi'
				usr.Taijutsu += 80
				usr.Agility += 80
				usr.Defense += 80
				usr.drain4=1
				usr.drain4()
				if(skill>15)
					usr.Mastered=1
				if(skill>5)
					usr.contents += new/obj/Doujutsu/Kyouten_Chiten
				if(skill>10)
					usr.contents += new/obj/Doujutsu/Kasegui_no_Jutsu
				for(var/obj/Doujutsu/Sharingan2/A in usr.contents)
					del(A)
			else
				usr.SharinganCopy=0
				usr.Sharingan=0
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s eyes return to normal as the red fades and the pupils retuns to normal<font color = white>*)"
				usr.overlays -= 'Sharingan.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Defense = usr.MaxDefense
				usr.drain4=0
				for(var/obj/Doujutsu/Kyouten_Chiten/A in usr.contents)
					del(A)
				for(var/obj/Doujutsu/Kasegui_no_Jutsu/B in usr.contents)
					del(B)
obj/Doujutsu/Mangekyou_Sharingan
	icon='Skillcard.dmi'
	icon_state= "Itachi"
	var/skill=1
	Click()
		if(src in usr.contents)
			if(!usr.Uchiha)
				return
			if(!usr.Sharingan)
				if(prob(15/skill/skill/skill))
					if(skill>20)
						return
					skill+=1
				usr.SharinganCopy=1
				usr.Sharingan=1
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s pupils begin turn red as they develop into the Legendary Mangekyou Sharingan<font color = white>*)"
				usr.overlays += 'Sharingan.dmi'
				usr.SC()
				usr.Taijutsu += 120
				usr.Agility += 120
				usr.Defense += 120
				usr.Genjutsu += 120
				usr.drain4=1
				usr.drain_4()
				usr.contents += new/obj/Doujutsu/Tsukuyomi
				if(skill>5)
					usr.contents += new/obj/Doujutsu/Amaterasu
				if(skill>6)
					usr.contents += new/obj/Doujutsu/Close_Amaterasu
				if(skill>10)
					usr.contents += new/obj/Doujutsu/Susanoo
			else
				usr.Sharingan=0
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s eyes return to normal as the red fades and the pupils retuns to normal<font color = white>*)"
				usr.overlays -= 'Sharingan.dmi'
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				usr.Defense = usr.MaxDefense
				usr.Genjutsu = usr.MaxGenjutsu
				usr.drain4=0
				usr.SharinganCopy=0
				for(var/obj/Doujutsu/Tsukuyomi/E in usr.contents)
					del(E)
				for(var/obj/Doujutsu/Amaterasu/A in usr.contents)
					del(A)
				for(var/obj/Doujutsu/Susanoo/B in usr.contents)
					del(B)
				for(var/obj/Doujutsu/Close_Amaterasu/D in usr.contents)
					del(D)

mob/var/drain4=0
mob/proc
	drain4()
		spawn(10)
		if(usr.drain4)
			sleep(50)
			usr.Chakra -= 5
			usr.drain4()
		if(usr.Chakra<=0)
			viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s eyes return to normal as the red fades and the pupils retuns to normal<font color = white>*)"
			usr.overlays -= 'Sharingan.dmi'
			usr.Taijutsu = usr.MaxTaijutsu
			usr.Agility = usr.MaxAgility
			usr.Defense = usr.MaxDefense
			usr.drain4=0
			usr.Sharingan=0
			for(var/obj/Doujutsu/Kyouten_Chiten/A in usr.contents)
				del(A)
			for(var/obj/Doujutsu/Kasegui_no_Jutsu/B in usr.contents)
				del(B)
			for(var/obj/Doujutsu/Tsukuyomi/F in usr.contents)
				del(F)
			for(var/obj/Doujutsu/Amaterasu/C in usr.contents)
				del(C)
			for(var/obj/Doujutsu/Close_Amaterasu/D in usr.contents)
				del(D)
			for(var/obj/Doujutsu/Susanoo/E in usr.contents)
				del(E)


mob/proc
	drain_4()
		spawn(10)
		if(usr.drain4)
			sleep(50)
			usr.Chakra -= 10
			usr.drain_4()
		if(usr.Chakra<=0)
			viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s eyes return to normal as the red fades and the pupils retuns to normal<font color = white>*)"
			usr.overlays -= 'Sharingan.dmi'
			usr.Taijutsu = usr.MaxTaijutsu
			usr.Agility = usr.MaxAgility
			usr.Defense = usr.MaxDefense
			usr.Genjutsu = usr.MaxGenjutsu
			usr.drain4=0
			usr.Sharingan=0
			for(var/obj/Doujutsu/Tsukuyomi/F in usr.contents)
				del(F)
			for(var/obj/Doujutsu/Amaterasu/A in usr.contents)
				del(A)
			for(var/obj/Doujutsu/Susanoo/B in usr.contents)
				del(B)
			for(var/obj/Doujutsu/Close_Amaterasu/D in usr.contents)
				del(D)



obj/Doujutsu/Kasegui_no_Jutsu
	icon='Skillcard.dmi'
	icon_state="Kasegui"
	Click()
		if(src in usr.contents)
			if(!usr.Uchiha)
				return
			if(usr.Sharingan)
				if(usr.move)
					if(usr.Chakra<usr.MaxChakra*0.30)
						return
					usr.Chakra-=(usr.MaxChakra*0.30)
					var/list/V = new/list
					for(var/mob/M in oview())
						V.Add(M)
					var/mob/A=input("Who would you like to use the Genjutsu on?") in V
					if(A==null)
						return
					if(usr.Genjutsu >= A.Genjutsu*1.1)
						A.move=0
						A.icon_state=""
						A.overlays += 'Kasegui.dmi'
						sleep(5)
						A.overlays -= 'Kasegui.dmi'
						A.overlays += 'Kasegui2.dmi'
						viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Kasegui no Jutsu!"
						usr.MaxGenjutsu += (1 *0.01)
						sleep(150*usr.Genjutsu/A.Resistance*1.5)
						A.overlays -= 'Kasegui2.dmi'
						A.move=1
						A.icon_state=""
					else
						usr << "[A] resists your Genjutsu!"
obj/Doujutsu/Kyouten_Chiten
	icon='Skillcard.dmi'
	icon_state="Sharingan3"
	Click()
		if(src in usr.contents)
			if(!usr.Uchiha)
				return
			if(usr.Kyouten)
				return
			if(usr.Sharingan)
				usr.Kyouten=1
				usr << "You have activated Magen Kyouten Chiten,you will be able to reverse the effect of any Genjutsu back towards the user."
				sleep (rand(200,500))
				usr << "You have deactivated Magen Kyouten Chiten."
				usr.Kyouten=0


/*obj/Ninjutsu/Ayatsuito_no_Jutsu
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Ayatsuito"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<10)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Ayatsuito no Jutsu has increased."
					skill+=1
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=10
				var/obj/Wire/A = new
				A.damage = (usr.Ninjutsu/4)+1
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Ayatsuito no Jutsu!"
				usr.Jutsu_Gain()
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				spawn(45)
				usr.firing=0
				src.Active=0
				sleep(100)


mob/var/Wire=0
mob/proc
	Wire()
		if(!src.Wire)
			src.move=1
			src.overlays -='Wire_1.dmi'

obj/Wire
	icon='Wire.dmi'
	icon_state="Head"
	density = 1
	var/damage
	New()
		spawn(100)
		del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				M.move=0
				M.overlays +='Wire_1.dmi'
				M.Wire=1
				M.Wire()
				sleep(500/rand(1.5,2.5))
				M.Wire=0
		if(istype(M,/turf))
			if(M.density)
				del(src)
	Move()
		var/obj/WireTrail/A = new
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/WireTrail
	icon='Wire.dmi'
	icon_state="Trail"
	density =0
	var/damage
	New()
		spawn(70)
		del src*/




/*mob/Bunshin_Bakuha/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Bunshin_Bakuha/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Bunshin_Bakuha/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	if(src.displaykey==usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)
mob/Bunshin_Bakuha
	var/function
	/*Bump(mob/M)
		..()
		if(istype(M,/mob/))
			if(displaykey==M.key)
				return
			else
				var/damage = src.Taijutsu-M.Defense*rand(1.5,3)
				M.Health -= damage
				src.attacking = 1
				sleep(5)
				src.attacking = 0*/
	New()
		..()
	Click()
		if(displaykey==usr.key)
			var/list/Choices=new/list
			Choices.Add("Attack Target")
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Destroy Bunshin")
			Choices.Add("Destroy Bunshins")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Destroy Bunshins")
					for(var/mob/Bunshin_Bakuha/A)
						if(A.displaykey==usr.key)
							for(var/mob/M in oview(4,usr))
								if(A)
									if(M.loc==A.loc)
										var/damage=round((usr.Ninjutsu/2)*2.5/2)
										M.Health -= damage
										M.Ko()
							usr.Taijutsu += A.experiance
							usr.Strength += A.experiance
							usr.Agility += A.experiance
							usr.Defense += A.experiance
							A.overlays = null
							spawn() flick('Smoke.dmi',A)
							del(A)
				if("Destroy Bunshin")
					for(var/mob/M in oview(4,src))
						if(src)
							if(M.loc==src.loc)
								var/damage=round((usr.Ninjutsu/2)*2.5/2)
								M.Health -= damage
								M.Ko()
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
							sleep(10)
							if(prob(10)) step_rand(src)
							else step_towards(src,M)
							BunshinAttack()

obj/Ninjutsu/Bunshin_Bakuha
	var/bunshinskill=1
	icon='Skillcard.dmi'
	icon_state="KageBunshin"
	Click()
		if(src in usr.contents)
			var/bunshins=0
			if(usr.Chakra<70)
				return
			if(!usr.move)
				return
			for(var/mob/Bunshin_Bakuha/Z)
				if(Z.displaykey==usr.key)
					bunshins+=1
			if(bunshins<bunshinskill)
				if(prob(10/bunshinskill/bunshinskill/bunshinskill))
					usr<<"Your understanding of the Bunshin Bakuha no Jutsu has increased."
					bunshinskill+=1
				usr.Jutsu_Gain()
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=70
				src.Active=1
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Bunshin Bakuha no Jutsu!"
				var/mob/A=new/mob/Bunshin_Bakuha
				var/mob/B=new/mob/Bunshin_Bakuha
				var/mob/C=new/mob/Bunshin_Bakuha
				flick('Smoke.dmi',A)
				A.Health=1
				A.MaxHealth=1
				A.Chakra=usr.Chakra/10
				A.MaxChakra=usr.MaxChakra/10
				A.Strength=usr.Strength/10
				A.Agility=usr.Agility/10
				A.Defense=usr.Defense/10
				A.Control=usr.Control/10
				A.Resistance=usr.Resistance/10
				A.Taijutsu=usr.Taijutsu/10
				A.Ninjutsu=usr.Ninjutsu/10
				A.Genjutsu=usr.Genjutsu/10
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
				flick('Smoke.dmi',B)
				B.Health=1
				B.MaxHealth=1
				B.Chakra=usr.Chakra/10
				B.MaxChakra=usr.MaxChakra/10
				B.Strength=usr.Strength/10
				B.Agility=usr.Agility/10
				B.Defense=usr.Defense/10
				B.Control=usr.Control/10
				B.Resistance=usr.Resistance/10
				B.Taijutsu=usr.Taijutsu/10
				B.Ninjutsu=usr.Ninjutsu/10
				B.Genjutsu=usr.Genjutsu/10
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
				flick('Smoke.dmi',C)
				C.Health=1
				C.MaxHealth=1
				C.Chakra=usr.Chakra/10
				C.MaxChakra=usr.MaxChakra/10
				C.Strength=usr.Strength/10
				C.Agility=usr.Agility/10
				C.Defense=usr.Defense/10
				C.Control=usr.Control/10
				C.Resistance=usr.Resistance/10
				C.Taijutsu=usr.Taijutsu/10
				C.Ninjutsu=usr.Ninjutsu/10
				C.Genjutsu=usr.Genjutsu/10
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
				C.move=1*/


mob/Susanoo/MouseDrag()
	if(Owner==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/Susanoo/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/Susanoo/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
		walk_towards(src,o_l)


obj/Susanoo
	Part1
		icon_state="12"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = 32
	Part2
		icon_state="13"
		layer=MOB_LAYER+1
		pixel_y = 32
	Part3
		icon_state="14"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = 32
	Part4
		icon_state="20"
		layer=MOB_LAYER+1
		pixel_x = -32
	Part5
		icon_state="22"
		layer=MOB_LAYER+1
		pixel_x = 32
	Part6
		icon_state="28"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = -32
	Part7
		icon_state="29"
		layer=MOB_LAYER+1
		pixel_y = -32
	Part8
		icon_state="30"
		layer=MOB_LAYER+1
		pixel_x = 32
		pixel_y = -32

mob/var/Mirror=0
mob/Susanoo
	var/function
	var/Owner = null
	New()
		..()
	Click()
		if(Owner==usr.key)
			var/list/Choices=new/list
			Choices.Add("Yata's Mirror")
			Choices.Add("Totsuka's Sword")
			Choices.Add("Unsummon Susanoo")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon Susanoo")
					flick('Smoke.dmi',src)
					del(src)
				if("Totsuka's Sword")
					var/skill=1
					if(usr.move)
						if(usr.firing)
							return
						if(usr.Chakra<usr.MaxChakra*(0.20/skill))
							return
						if(prob(10/skill/skill/skill))
							usr<<"Your understanding of Totsuka's Sword has increased."
							skill+=1
						usr.firing=1
						usr.MaxNinjutsu += (1 *0.001)
						usr.Chakra-=usr.MaxChakra*(0.60/skill)
						var/obj/Totsuka_Sword/A = new
						var/obj/Sake_Sword/B = new
						viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Totsuka's Sword!"

						if(usr.dir==NORTH)
							A.loc = locate(usr.x,usr.y+1,usr.z)
							A.dir = usr.dir
							B.loc = locate(usr.x,usr.y+2,usr.z)
							B.dir = usr.dir
						if(usr.dir==SOUTH)
							A.loc = locate(usr.x,usr.y-1,usr.z)
							A.dir = usr.dir
							B.loc = locate(usr.x,usr.y-2,usr.z)
							B.dir = usr.dir
						if(usr.dir==EAST)
							A.loc = locate(usr.x+1,usr.y,usr.z)
							A.dir = usr.dir
							B.loc = locate(usr.x+2,usr.y,usr.z)
							B.dir = usr.dir
						if(usr.dir==WEST)
							A.loc = locate(usr.x-1,usr.y,usr.z)
							A.dir = usr.dir
							B.loc = locate(usr.x-2,usr.y,usr.z)
							B.dir = usr.dir
						for(var/mob/M in oview(2,usr))
							if(A)
								if(M.loc==A.loc)
									var/damage=(usr.Ninjutsu/M.Defense+M.Resistance)*rand(4,6)
									M.Health -= damage
									M.Ko()
						spawn(45)
						usr.firing=0
				if("Yata's Mirror")
					var/skill = 1
					if(usr.move)
						if(usr.firing)
							return
						if(usr.Mirror)
							usr<<"Your already have Yata's Mirror out."
							return
						if(usr.Chakra<400)
							return
						if(prob(10/skill/skill/skill))
							usr<<"Your understanding of Yata's Mirror has increased."
							skill+=1
						usr.firing=1
						usr.Mirror=1
						usr.MaxNinjutsu += (1 *0.001)
						usr.Chakra-=400
						var/obj/Yata_Mirror/Shield/A = new
						viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Yata's Mirror!"

						if(usr.dir==NORTH)
							A.loc = locate(usr.x,usr.y+1,usr.z)
						if(usr.dir==EAST)
							A.loc = locate(usr.x+1,usr.y,usr.z)
						if(usr.dir==SOUTH)
							A.loc = locate(usr.x,usr.y-1,usr.z)
						if(usr.dir==WEST)
							A.loc = locate(usr.x-1,usr.y,usr.z)
						spawn(45)
						usr.firing=0
						sleep(150)
						usr.Mirror=0




	Susanoo
		icon='Susanoo.dmi'
		icon_state="21"
		layer=MOB_LAYER+1
		New()
			src.overlays += /obj/Susanoo/Part1
			src.overlays += /obj/Susanoo/Part2
			src.overlays += /obj/Susanoo/Part3
			src.overlays += /obj/Susanoo/Part4
			src.overlays += /obj/Susanoo/Part5
			src.overlays += /obj/Susanoo/Part6
			src.overlays += /obj/Susanoo/Part7
			src.overlays += /obj/Susanoo/Part8


obj/Doujutsu/Susanoo
	icon='Skillcard.dmi'
	icon_state="Susanoo"
	var/Kuchiyoseskill=1
	Click()
		if(src in usr.contents)
			for(var/mob/Susanoo/Susanoo/E in world)
				if(E.Owner==usr.key)
					usr << "You already summoned Susanoo."
					return
			if(usr.Chakra<usr.MaxChakra*(0.80/Kuchiyoseskill))
				return
			if(!usr.move)
				return
				if(prob(10/Kuchiyoseskill/Kuchiyoseskill/Kuchiyoseskill))
					usr<<"Your understanding of Susanoo has increased."
					Kuchiyoseskill+=1

			usr.MaxNinjutsu += (1 *0.002)
			usr.Chakra-=usr.MaxChakra*(0.80/Kuchiyoseskill)
			usr.Health-=usr.MaxHealth*(0.50/Kuchiyoseskill)
			var/mob/Susanoo/Susanoo/E = new()
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

obj/Yata_Mirror
	Shield
		icon = 'Susanoo.dmi'
		icon_state="Shield"
		density = 1
		New()
			spawn(150)
			del src


obj/Doujutsu/Susanoo_Skeleton
	var/Skeleton=0
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Skeleton"
	Click()
		if(src in usr.contents)
			if(!Skeleton)
				if(usr.Chakra<150)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of Susanoo has increased."
					skill+=1
				usr.MaxDefense += (1 *0.001)
				usr.Chakra-=150
				usr.Defense *= 10.5
				usr.overlays += 'Skeleton.dmi'
				src.Active=1
				Skeleton=1
			else
				usr.Defense = usr.MaxDefense
				usr.overlays -= 'Skeleton.dmi'
				Skeleton=0
				src.Active=0
mob/var/Ama=0
obj/Doujutsu/Amaterasu
	var/skill = 1
	icon='Skillcard.dmi'
	icon_state="Ama"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.firing)
					return
				if(usr.Chakra<400)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of Amateratsu has increased."
					skill+=0.5
				usr.firing=1
				src.Active=1
				usr.MaxNinjutsu += (1 *0.001)
				usr.Chakra-=usr.MaxChakra*(0.40/skill)
				usr.Health-=10
				usr.Ama=1
				usr.overlays+='Bleed.dmi'
				var/obj/AmaterasuAbil/Z = new
				Z.damage = rand(100,175)/5+skill
				Z.loc=usr.loc
				Z.dir = usr.dir
				walk(Z,usr.dir)
				for(var/mob/M in oview(8,usr))
					var/damage = rand(100,225)/5+skill
					M.Health -= damage
					M.Burn=1
					M.Burn()
					M.Ko()
				var/obj/Amaterasu/Burn/A = new
				var/obj/Amaterasu/Burn/B = new
				var/obj/Amaterasu/Burn/C = new
				var/obj/Amaterasu/Burn/D = new
				var/obj/Amaterasu/Burn/E = new
				var/obj/Amaterasu/Burn/F = new
				var/obj/Amaterasu/Burn/G = new
				var/obj/Amaterasu/Burn/H = new
				var/obj/Amaterasu/Burn/I = new
				var/obj/Amaterasu/Burn/J = new
				var/obj/Amaterasu/Burn/K = new
				var/obj/Amaterasu/Burn/L = new
				var/obj/Amaterasu/Burn/M = new
				var/obj/Amaterasu/Burn/N = new
				var/obj/Amaterasu/Burn/O = new
				var/obj/Amaterasu/Burn/P = new
				var/obj/Amaterasu/Burn/Q = new
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Amaterasu!"

				if(usr.dir==NORTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				if(usr.dir==EAST)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				if(usr.dir==SOUTH)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				if(usr.dir==WEST)
					A.loc = locate(usr.x,usr.y+1,usr.z)
					B.loc = locate(usr.x-1,usr.y+2,usr.z)
					C.loc = locate(usr.x-1,usr.y+1,usr.z)
					D.loc = locate(usr.x+2,usr.y-1,usr.z)
					E.loc = locate(usr.x+2,usr.y+1,usr.z)
					F.loc = locate(usr.x+3,usr.y+2,usr.z)
					G.loc = locate(usr.x-1,usr.y+3,usr.z)
					H.loc = locate(usr.x,usr.y+2,usr.z)
					I.loc = locate(usr.x+4,usr.y-1,usr.z)
					J.loc = locate(usr.x-3,usr.y-1,usr.z)
					K.loc = locate(usr.x-4,usr.y+4,usr.z)
					L.loc = locate(usr.x,usr.y-4,usr.z)
					M.loc = locate(usr.x-4,usr.y+1,usr.z)
					N.loc = locate(usr.x-2,usr.y+1,usr.z)
					O.loc = locate(usr.x-1,usr.y-1,usr.z)
					P.loc = locate(usr.x-2,usr.y-3,usr.z)
					Q.loc = locate(usr.x-2,usr.y-4,usr.z)
				spawn(45)
				usr.firing=0
				src.Active=0
				sleep(150)
				usr.overlays-='Bleed.dmi'
				sleep(950)
				usr.Ama=0

obj/Amaterasu
	Burn
		icon = 'Katon.dmi'
		icon_state="Burn"
		layer=MOB_LAYER+1
		var/damage
		New()
			spawn(1000)
			del src
mob/var/Burn=0
mob/proc
	Burn()
		if(src.Burn)
			src.Health -= rand(1,5)
			src.Ko()
			spawn(rand(80,100))
			src.Burn()
			if(src.Health==0)
				sleep(rand(1000,2000))
				src.Death()



obj/Doujutsu/Close_Amaterasu
	icon='Skillcard.dmi'
	icon_state="Close"
	Click()
		if(src in usr.contents)
			if(usr.Health<10)
				return
			if(usr.Chakra<100)
				usr << "Your Chakra is to low to take out the flames of Amaterasu."
				return
			if(!usr.Ama)
				return
			usr.Ama=0
			usr.Health-=5
			usr.overlays+='Bleed.dmi'
			usr << "You took out the flames of Amaterasu."
			for(var/obj/Amaterasu/Burn/A)
				del(A)
			sleep(150)
			usr.overlays-='Bleed.dmi'
			for(var/mob/M in oview(10))
				if(!M.Burn)
					return
				if(M.Burn)
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Amaterasu!"
					M.MaxGenjutsu += (1 *0.01)
					usr << "The black flames around [M] has disappeared!"
					M.Burn=0
					M << "The black flames around you has disappeared!"

obj/Totsuka_Sword
	icon = 'Susanoo.dmi'
	icon_state="Sake"
	density = 1
	New()
		var/obj/Sake_Sword/A = new
		A.loc = src.loc
		A.dir = src.dir
		spawn(70)
		del src

obj/Sake_Sword
	icon = 'Susanoo.dmi'
	icon_state="Sword"
	layer=MOB_LAYER+1
	New()
		spawn(70)
		del src



mob/var/Tsukuyomi=0
obj/Doujutsu/Tsukuyomi
	icon='Skillcard.dmi'
	icon_state="Tsukuyomi"
	Click()
		if(src in usr.contents)
			if(usr.move)
				if(usr.Tsukuyomi)
					return
				if(usr.Health<10)
					return
				if(usr.Chakra<usr.MaxChakra*0.20)
					return
				usr.Chakra-=(usr.MaxChakra*0.20)
				var/list/V = new/list
				for(var/mob/M in oview())
					V.Add(M)
				var/mob/A=input("Who would you like to use Tsukuyomi on?") in V
				if(A==null)
					return
				if(A.Mastered)
					usr.Tsukuyomi=1
					A.move=0
					A.icon_state="KO"
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Tsukuyomi!"
					A.MaxGenjutsu += (1 *0.01)
					sleep(50)
					A.move=1
					A.icon_state=""
					A << "[A] countered your Genjutsu!"
					usr.Health-=10
					usr.Tsukuyomi=0
					return
		/*		if(!A.meditate)
					usr.Tsukuyomi=1
					A.move=0
					A.icon_state="KO"
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Tsukuyomi!"
					usr.MaxGenjutsu += (1 *0.01)
					A.client.perspective=EYE_PERSPECTIVE
					A.client.eye=locate(7,295,20)
					usr.Health-=5
					sleep(1000)
					A.move=1
					A.icon_state=""
					A.client.perspective=EYE_PERSPECTIVE
					A.client.eye=A
					usr.Tsukuyomi=0 */
mob/var
	copyable = 1
mob
	proc
		SC()
			if(usr.SharinganCopy)
				for(var/mob/M in oviewers(16))
					if(M.copyable==1)
						if(usr.Exp<=100)
							for(var/obj/Ninjutsu/Dragonfire/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Dragonfire,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Dragonfire
										viewers(16) << "[usr] has learned Katon: Ryuuka No Jutsu from [M]."

							for(var/obj/Ninjutsu/Dai_Endan/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Dai_Endan,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Dai_Endan
										viewers(16) << "[usr] has learned Katon: Dai Endan No Jutsu from [M]."

							for(var/obj/Ninjutsu/Endan/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Endan,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Endan
										viewers(16) << "[usr] has learned Katon: Endan No Jutsu from [M]."

							for(var/obj/Ninjutsu/Goukakyuu/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Goukakyuu,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Goukakyuu
										viewers(16) << "[usr] has learned Katon: Goukakyuu No Jutsu from [M]."



							for(var/obj/Ninjutsu/Housenka/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Housenka,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Housenka
										viewers(16) << "[usr] has learned Katon: Housenka No Jutsu from [M]."

							for(var/obj/Ninjutsu/Hibashiri/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Hibashiri,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Hibashiri
										viewers(16) << "[usr] has learned Katon: Hibashiri No Jutsu from [M]."

							for(var/obj/Ninjutsu/KatonBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/KatonBunshin,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/KatonBunshin
										viewers(16) << "[usr] has learned Katon Bunshin No Jutsu from [M]."

						if(usr.Exp>=101)
							for(var/obj/Ninjutsu/Dragonfire/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Dragonfire,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Dragonfire
										viewers(16) << "[usr] has learned Katon: Ryuuka No Jutsu from [M]."

							for(var/obj/Ninjutsu/Dai_Endan/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Dai_Endan,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Dai_Endan
										viewers(16) << "[usr] has learned Katon: Dai Endan No Jutsu from [M]."

							for(var/obj/Ninjutsu/Endan/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Endan,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Endan
										viewers(16) << "[usr] has learned Katon: Endan No Jutsu from [M]."

							for(var/obj/Ninjutsu/Goukakyuu/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Goukakyuu,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Goukakyuu
										viewers(16) << "[usr] has learned Katon: Goukakyuu No Jutsu from [M]."



							for(var/obj/Ninjutsu/Housenka/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Housenka,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Housenka
										viewers(16) << "[usr] has learned Katon: Housenka No Jutsu from [M]."

							for(var/obj/Ninjutsu/Hibashiri/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Hibashiri,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Hibashiri
										viewers(16) << "[usr] has learned Katon: Hibashiri No Jutsu from [M]."

							for(var/obj/Ninjutsu/KatonBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/KatonBunshin,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/KatonBunshin
										viewers(16) << "[usr] has learned Katon Bunshin No Jutsu from [M]."

						if(usr.Exp<=300)
							for(var/obj/Ninjutsu/Dragonfire/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Dragonfire,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Dragonfire
										viewers(16) << "[usr] has learned Katon: Ryuuka No Jutsu from [M]."

							for(var/obj/Ninjutsu/Dai_Endan/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Dai_Endan,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Dai_Endan
										viewers(16) << "[usr] has learned Katon: Dai Endan No Jutsu from [M]."

							for(var/obj/Ninjutsu/Endan/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Endan,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Endan
										viewers(16) << "[usr] has learned Katon: Endan No Jutsu from [M]."

							for(var/obj/Ninjutsu/Goukakyuu/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Goukakyuu,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Goukakyuu
										viewers(16) << "[usr] has learned Katon: Goukakyuu No Jutsu from [M]."



							for(var/obj/Ninjutsu/Housenka/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Housenka,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Housenka
										viewers(16) << "[usr] has learned Katon: Housenka No Jutsu from [M]."

							for(var/obj/Ninjutsu/Hibashiri/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Hibashiri,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Hibashiri
										viewers(16) << "[usr] has learned Katon: Hibashiri No Jutsu from [M]."

							for(var/obj/Ninjutsu/KatonBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/KatonBunshin,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/KatonBunshin
										viewers(16) << "[usr] has learned Katon Bunshin No Jutsu from [M]."










						if(usr.Exp<=100)
							for(var/obj/Ninjutsu/Suirou/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Suirou,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Suirou
										viewers(16) << "[usr] has learned Suirou No Jutsu from [M]."

							for(var/obj/Ninjutsu/Suiryuudan/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Suiryuudan,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Suiryuudan
										viewers(16) << "[usr] has learned Suiryuudan No Jutsu from [M]."

							for(var/obj/Ninjutsu/Daibakufu_no_Jutsu/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Daibakufu_no_Jutsu,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Daibakufu_no_Jutsu
										viewers(16) << "[usr] has learned Daibakufu No Jutsu from [M]."

							for(var/obj/Ninjutsu/Baku_Suishouha/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Baku_Suishouha,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Baku_Suishouha
										viewers(16) << "[usr] has learned Baku Suishouha No Jutsu from [M]."

						//	for(var/obj/Ninjutsu/Water_Propell_Jet/B in M.contents)
						//		if(B.Active)
						//			if(locate(/obj/Ninjutsu/Water_Propell_Jet,usr.contents))
						//				return
						//			if(prob(50))
						//				usr.contents += new/obj/Ninjutsu/Water_Propell_Jet
						//				viewers(16) << "[usr] has learned Suiton: Propell Jet No Jutsu from [M]."


							for(var/obj/Ninjutsu/MizuBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/MizuBunshin,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/MizuBunshin
										viewers(16) << "[usr] has learned Mizu Bunshin No Jutsu from [M]."

						if(usr.Exp>=101)
							for(var/obj/Ninjutsu/Suirou/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Suirou,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Suirou
										viewers(16) << "[usr] has learned Suirou No Jutsu from [M]."

							for(var/obj/Ninjutsu/Suiryuudan/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Suiryuudan,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Suiryuudan
										viewers(16) << "[usr] has learned Suiryuudan No Jutsu from [M]."

							for(var/obj/Ninjutsu/Baku_Suishouha/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Baku_Suishouha,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Baku_Suishouha
										viewers(16) << "[usr] has learned Baku Suishouha No Jutsu from [M]."

							for(var/obj/Ninjutsu/Daibakufu_no_Jutsu/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Daibakufu_no_Jutsu,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Daibakufu_no_Jutsu
										viewers(16) << "[usr] has learned Daibakufu No Jutsu from [M]."

					//		for(var/obj/Ninjutsu/Water_Propell_Jet/B in M.contents)
					//			if(B.Active)
					//				if(locate(/obj/Ninjutsu/Water_Propell_Jet,usr.contents))
					//					return
					//				if(prob(60))
					//					usr.contents += new/obj/Ninjutsu/Water_Propell_Jet
					//					viewers(16) << "[usr] has learned Suiton: Propell Jet No Jutsu from [M]."



							for(var/obj/Ninjutsu/MizuBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/MizuBunshin,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/MizuBunshin
										viewers(16) << "[usr] has learned Mizu Bunshin No Jutsu from [M]."
						if(usr.Exp>=300)
							for(var/obj/Ninjutsu/Suirou/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Suirou,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Suirou
										viewers(16) << "[usr] has learned Suirou No Jutsu from [M]."

							for(var/obj/Ninjutsu/Suiryuudan/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Suiryuudan,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Suiryuudan
										viewers(16) << "[usr] has learned Suiryuudan No Jutsu from [M]."

							for(var/obj/Ninjutsu/MizuBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/MizuBunshin,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Ninjutsu/MizuBunshin
										viewers(16) << "[usr] has learned Mizu Bunshin No Jutsu from [M]."

							for(var/obj/Ninjutsu/Baku_Suishouha/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Baku_Suishouha,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Ninjutsu/Baku_Suishouha
										viewers(16) << "[usr] has learned Baku Suishouha No Jutsu from [M]."

							for(var/obj/Ninjutsu/Daibakufu_no_Jutsu/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Daibakufu_no_Jutsu,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Ninjutsu/Daibakufu_no_Jutsu
										viewers(16) << "[usr] has learned Daibakufu No Jutsu from [M]."

//							for(var/obj/Ninjutsu/Water_Propell_Jet/B in M.contents)
//								if(B.Active)
//									if(locate(/obj/Ninjutsu/Water_Propell_Jet,usr.contents))
//										return
//									if(prob(80))
//										usr.contents += new/obj/Ninjutsu/Water_Propell_Jet
//										viewers(16) << "[usr] has learned Suiton: Propell Jet No Jutsu from [M]."





						if(usr.Exp<=100)
							for(var/obj/Ninjutsu/Kaze/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Kaze,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Kaze
										viewers(16) << "[usr] has learned Kaze No Jutsu from [M]."

							for(var/obj/Ninjutsu/Kaze_no_Yaiba/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Kaze_no_Yaiba,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Kaze_no_Yaiba
										viewers(16) << "[usr] has learned Kaze no Yaiba No Jutsu from [M]."

							for(var/obj/Ninjutsu/Kazekiri/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Kazekiri,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Kazekiri
										viewers(16) << "[usr] has learned Kazekiri No Jutsu from [M]."


							for(var/obj/Ninjutsu/Renkuudan/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Renkuudan,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Renkuudan
										viewers(16) << "[usr] has learned Renkuudan No Jutsu from [M]."

							for(var/obj/Ninjutsu/OboroBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/OboroBunshin,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/OboroBunshin
										viewers(16) << "[usr] has learned Oboro Bunshin No Jutsu from [M]."

						if(usr.Exp>=101)
							for(var/obj/Ninjutsu/Kaze/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Kaze,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Kaze
										viewers(16) << "[usr] has learned Kaze No Jutsu from [M]."

							for(var/obj/Ninjutsu/Renkuudan/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Renkuudan,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Renkuudan
										viewers(16) << "[usr] has learned Renkuudan No Jutsu from [M]."

							for(var/obj/Ninjutsu/OboroBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/OboroBunshin,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/OboroBunshin
										viewers(16) << "[usr] has learned Oboro Bunshin No Jutsu from [M]."

							for(var/obj/Ninjutsu/Reppushou/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Reppushou,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Ninjutsu/Reppushou
										viewers(16) << "[usr] has learned Reppushou No Jutsu from [M]."

							for(var/obj/Ninjutsu/Kaze_no_Yaiba/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Kaze_no_Yaiba,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Kaze_no_Yaiba
										viewers(16) << "[usr] has learned Kaze no Yaiba No Jutsu from [M]."

							for(var/obj/Ninjutsu/Kazekiri/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Kazekiri,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Ninjutsu/Kazekiri
										viewers(16) << "[usr] has learned Kazekiri No Jutsu from [M]."



						if(usr.Exp>=300)
							for(var/obj/Ninjutsu/Kaze/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Kaze,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Ninjutsu/Kaze
										viewers(16) << "[usr] has learned Kaze No Jutsu from [M]."

							for(var/obj/Ninjutsu/Renkuudan/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Renkuudan,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Ninjutsu/Renkuudan
										viewers(16) << "[usr] has learned Renkuudan No Jutsu from [M]."

							for(var/obj/Ninjutsu/OboroBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/OboroBunshin,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Ninjutsu/OboroBunshin
										viewers(16) << "[usr] has learned Oboro Bunshin No Jutsu from [M]."

							for(var/obj/Ninjutsu/Kaze_no_Yaiba/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Kaze_no_Yaiba,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Kaze_no_Yaiba
										viewers(16) << "[usr] has learned Kaze no Yaiba No Jutsu from [M]."

							for(var/obj/Ninjutsu/Reppushou/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Reppushou,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Reppushou
										viewers(16) << "[usr] has learned Reppushou No Jutsu from [M]."


							for(var/obj/Ninjutsu/Kazekiri/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Kazekiri,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Kazekiri
										viewers(16) << "[usr] has learned Kazekiri No Jutsu from [M]."




						if(usr.Exp<=100)
							for(var/obj/Ninjutsu/Doryudan/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Doryudan,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Doryudan
										viewers(16) << "[usr] has learned Doryudan No Jutsu from [M]."

							for(var/obj/Ninjutsu/Doryuheki/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Doryuheki,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Doryuheki
										viewers(16) << "[usr] has learned Doryuheki No Jutsu from [M]."

							for(var/obj/Ninjutsu/Domu/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Domu,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Domu
										viewers(16) << "[usr] has learned Domu No Jutsu from [M]."

							for(var/obj/Ninjutsu/TsuchiBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/TsuchiBunshin,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/TsuchiBunshin
										viewers(16) << "[usr] has learned Tsuchi Bunshin No Jutsu from [M]."

						if(usr.Exp>=101)
							for(var/obj/Ninjutsu/Doryudan/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Doryudan,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Doryudan
										viewers(16) << "[usr] has learned Doryudan No Jutsu from [M]."

							for(var/obj/Ninjutsu/Doryuheki/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Doryuheki,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Doryuheki
										viewers(16) << "[usr] has learned Doryuheki No Jutsu from [M]."

							for(var/obj/Ninjutsu/Domu/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Domu,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Domu
										viewers(16) << "[usr] has learned Domu No Jutsu from [M]."


							for(var/obj/Ninjutsu/TsuchiBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/TsuchiBunshin,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/TsuchiBunshin
										viewers(16) << "[usr] has learned Tsuchi Bunshin No Jutsu from [M]."

						if(usr.Exp>=300)
							for(var/obj/Ninjutsu/Doryudan/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Doryudan,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Doryudan
										viewers(16) << "[usr] has learned Doryudan No Jutsu from [M]."

							for(var/obj/Ninjutsu/Doryuheki/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Doryuheki,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Ninjutsu/Doryuheki
										viewers(16) << "[usr] has learned Doryuheki No Jutsu from [M]."

							for(var/obj/Ninjutsu/Domu/B in M.contents)
								if(B.Active)
									if(locate(/obj/Ninjutsu/Domu,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Domu
										viewers(16) << "[usr] has learned Domu No Jutsu from [M]."

							for(var/obj/Ninjutsu/TsuchiBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/TsuchiBunshin,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Ninjutsu/TsuchiBunshin
										viewers(16) << "[usr] has learned Tsuchi Bunshin No Jutsu from [M]."

						if(usr.Exp<=100)
							for(var/obj/Ninjutsu/Ikazuchi/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Ikazuchi,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Ikazuchi
										viewers(16) << "[usr] has learned Ikazuchi No Jutsu from [M]."

							for(var/obj/Taijutsu/Jibashi/B in M.contents)
								if(B.Active)
									if(locate(/obj/Taijutsu/Jibashi,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Taijutsu/Jibashi
										viewers(16) << "[usr] has learned Jibashi No Jutsu from [M]."

							for(var/obj/Ninjutsu/RaitonBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/RaitonBunshin,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/RaitonBunshin
										viewers(16) << "[usr] has learned Ration Bunshin No Jutsu from [M]."

						if(usr.Exp>=101)
							for(var/obj/Ninjutsu/Ikazuchi/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Ikazuchi,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Ikazuchi
										viewers(16) << "[usr] has learned Ikazuchi No Jutsu from [M]."

							for(var/obj/Ninjutsu/Ikadzuchi_no_Kiba/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Ikadzuchi_no_Kiba,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Ikadzuchi_no_Kiba
										viewers(16) << "[usr] has learned Ikadzuchi_no_Kiba from [M]."

							for(var/obj/Ninjutsu/Raikyuu/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Raikyuu,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Raikyuu
										viewers(16) << "[usr] has learned Raikyuu no Jutsu from [M]."

							for(var/obj/Ninjutsu/Raiton_no_Yoroi/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Raiton_no_Yoroi,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Ninjutsu/Raiton_no_Yoroi
										viewers(16) << "[usr] has learned Raiton no Yoroi from [M]."


							for(var/obj/Taijutsu/Jibashi/B in M.contents)
								if(B.Active)
									if(locate(/obj/Taijutsu/Jibashi,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Taijutsu/Jibashi
										viewers(16) << "[usr] has learned Jibashi No Jutsu from [M]."

							for(var/obj/Ninjutsu/RaitonBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/RaitonBunshin,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/RaitonBunshin
										viewers(16) << "[usr] has learned Ration Bunshin No Jutsu from [M]."

						if(usr.Exp>=300)
							for(var/obj/Ninjutsu/Ikazuchi/A in M.contents)
								if(A.Active)
									if(locate(/obj/Ninjutsu/Ikazuchi,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Ikazuchi
										viewers(16) << "[usr] has learned Ikazuchi No Jutsu from [M]."


							for(var/obj/Taijutsu/Jibashi/B in M.contents)
								if(B.Active)
									if(locate(/obj/Taijutsu/Jibashi,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Taijutsu/Jibashi
										viewers(16) << "[usr] has learned Jibashi No Jutsu from [M]."

							for(var/obj/Ninjutsu/RaitonBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/RaitonBunshin,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/RaitonBunshin
										viewers(16) << "[usr] has learned Ration Bunshin No Jutsu from [M]."

						if(usr.Exp<=100)
							for(var/obj/Genjutsu/Bunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Genjutsu/Bunshin,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Genjutsu/Bunshin
										viewers(16) << "[usr] has learned Bunshin No Jutsu from [M]."


							for(var/obj/Genjutsu/Henge/C in M.contents)
								if(C.Active)
									if(locate(/obj/Genjutsu/Henge,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Genjutsu/Henge
										viewers(16) << "[usr] has learned Henge No Jutsu from [M]."

							for(var/obj/Genjutsu/Toton/C in M.contents)
								if(C.Active)
									if(locate(/obj/Genjutsu/Toton,usr.contents))
										return
									if(prob(20))
										usr.contents += new/obj/Genjutsu/Toton
										viewers(16) << "[usr] has learned Toton No Jutsu from [M]."

							for(var/obj/Genjutsu/Nehan_Shoja/C in M.contents)
								if(C.Active)
									if(locate(/obj/Genjutsu/Nehan_Shoja,usr.contents))
										return
									if(prob(20))
										usr.contents += new/obj/Genjutsu/Nehan_Shoja
										viewers(16) << "[usr] has learned Nehan Shoja No Jutsu from [M]."


							for(var/obj/Ninjutsu/Kawarimi/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Kawarimi,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Kawarimi
										viewers(16) << "[usr] has learned Kawarimi No Jutsu from [M]."
							for(var/obj/Ninjutsu/Suimen_Hokou_no_Waza/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Suimen_Hokou_no_Waza,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Suimen_Hokou_no_Waza
										viewers(16) << "[usr] has learned Suimen Hokou no Waza from [M]."

							for(var/obj/Ninjutsu/KageBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/KageBunshin,usr.contents))
										return
									if(prob(11))
										usr.contents += new/obj/Ninjutsu/KageBunshin
										viewers(16) << "[usr] has learned Kage Bunshin no Jutsu from [M]."

							for(var/obj/Ninjutsu/Shunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Shunshin,usr.contents))
										return
									if(prob(18))
										usr.contents += new/obj/Ninjutsu/Shunshin
										viewers(16) << "[usr] has learned Shunshin No Jutsu from [M]."
						if(usr.Exp>=101)
							for(var/obj/Genjutsu/Bunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Genjutsu/Bunshin,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Genjutsu/Bunshin
										viewers(16) << "[usr] has learned Bunshin No Jutsu from [M]."

							for(var/obj/Genjutsu/Kai/C in M.contents)
								if(C.Active)
									if(locate(/obj/Genjutsu/Kai,usr.contents))
										return
									if(prob(50))
										usr.contents += new/obj/Genjutsu/Kai
										viewers(16) << "[usr] has learned Kai No Jutsu from [M]."

							for(var/obj/Genjutsu/Nehan_Shoja/C in M.contents)
								if(C.Active)
									if(locate(/obj/Genjutsu/Nehan_Shoja,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Genjutsu/Nehan_Shoja
										viewers(16) << "[usr] has learned Nehan Shoja No Jutsu from [M]."

							for(var/obj/Genjutsu/Toton/C in M.contents)
								if(C.Active)
									if(locate(/obj/Genjutsu/Toton,usr.contents))
										return
									if(prob(20))
										usr.contents += new/obj/Genjutsu/Toton
										viewers(16) << "[usr] has learned Toton No Jutsu from [M]."

							for(var/obj/Genjutsu/Henge/C in M.contents)
								if(C.Active)
									if(locate(/obj/Genjutsu/Henge,usr.contents))
										return
									if(prob(80))
										usr.contents += new/obj/Genjutsu/Henge
										viewers(16) << "[usr] has learned Henge No Jutsu from [M]."

							for(var/obj/Ninjutsu/Kawarimi/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Kawarimi,usr.contents))
										return
									if(prob(70))
										usr.contents += new/obj/Ninjutsu/Kawarimi
										viewers(16) << "[usr] has learned Kawarimi No Jutsu from [M]."

							for(var/obj/Ninjutsu/Shunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Shunshin,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Ninjutsu/Shunshin
										viewers(16) << "[usr] has learned Shunshin No Jutsu from [M]."

							for(var/obj/Ninjutsu/Suimen_Hokou_no_Waza/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Suimen_Hokou_no_Waza,usr.contents))
										return
									if(prob(40))
										usr.contents += new/obj/Ninjutsu/Suimen_Hokou_no_Waza
										viewers(16) << "[usr] has learned Suimen Hokou no Waza from [M]."
							for(var/obj/Ninjutsu/KageBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/KageBunshin,usr.contents))
										return
									if(prob(15))
										usr.contents += new/obj/Ninjutsu/KageBunshin
										viewers(16) << "[usr] has learned Kage Bunshin no Jutsu from [M]."

							for(var/obj/Taijutsu/Oukashou/C in M.contents)
								if(C.Active)
									if(locate(/obj/Taijutsu/Oukashou,usr.contents))
										return
									if(prob(60))
										usr.contents += new/obj/Taijutsu/Oukashou
										viewers(16) << "[usr] has learned Oukashou from [M]."


						if(usr.Exp>=300)
							for(var/obj/Genjutsu/Bunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Genjutsu/Bunshin,usr.contents))
										return
									if(prob(99))
										usr.contents += new/obj/Genjutsu/Bunshin
										viewers(16) << "[usr] has learned Bunshin No Jutsu from [M]."


							for(var/obj/Genjutsu/Henge/C in M.contents)
								if(C.Active)
									if(locate(/obj/Genjutsu/Henge,usr.contents))
										return
									if(prob(99))
										usr.contents += new/obj/Genjutsu/Henge
										viewers(16) << "[usr] has learned Henge No Jutsu from [M]."

							for(var/obj/Ninjutsu/Kawarimi/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Kawarimi,usr.contents))
										return
									if(prob(90))
										usr.contents += new/obj/Ninjutsu/Kawarimi
										viewers(16) << "[usr] has learned Kawarimi No Jutsu from [M]."

							for(var/obj/Ninjutsu/Suimen_Hokou_no_Waza/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Suimen_Hokou_no_Waza,usr.contents))
										return
									if(prob(90))
										usr.contents += new/obj/Ninjutsu/Suimen_Hokou_no_Waza
										viewers(16) << "[usr] has learned Suimen Hokou no Waza from [M]."
							for(var/obj/Ninjutsu/KageBunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/KageBunshin,usr.contents))
										return
									if(prob(55))
										usr.contents += new/obj/Ninjutsu/KageBunshin
										viewers(16) << "[usr] has learned Kage Bunshin no Jutsu from [M]."

							for(var/obj/Ninjutsu/Kage_Shuriken/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Kage_Shuriken,usr.contents))
										return
									if(prob(65))
										usr.contents += new/obj/Ninjutsu/Kage_Shuriken
										viewers(16) << "[usr] has learned Kage Shuriken no Jutsu from [M]."

							for(var/obj/Taijutsu/Oukashou/C in M.contents)
								if(C.Active)
									if(locate(/obj/Taijutsu/Oukashou,usr.contents))
										return
									if(prob(85))
										usr.contents += new/obj/Taijutsu/Oukashou
										viewers(16) << "[usr] has learned Oukashou from [M]."

							for(var/obj/Ninjutsu/Shunshin/C in M.contents)
								if(C.Active)
									if(locate(/obj/Ninjutsu/Shunshin,usr.contents))
										return
									if(prob(95))
										usr.contents += new/obj/Ninjutsu/Shunshin
										viewers(16) << "[usr] has learned Shunshin No Jutsu from [M]."






			spawn(50)
			SC()