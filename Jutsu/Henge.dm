mob
	var/Henge=0
	var/Oicon
	var/Oname
	var/Oprofile
obj/Genjutsu/Henge
	var/hengeskill=1
	icon='Skillcard.dmi'
	icon_state="Henge"
	Click()
		if(src in usr.contents)
			if(usr.Chakra<5)
				return
			if(!usr.move)
				return
			else
				if(!usr.Henge)
					var/list/V = new/list
					for(var/mob/A in viewers())
						V.Add(A)
					var/mob/M=input("Who would you like to transform into?") in V
					usr.MaxGenjutsu += (1 *0.001)
					viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Henge no Jutsu!"
					usr.move = 0
					src.Active=1
					usr.name=M.name
					usr.Oprofile = usr.profile
					usr.profile = M.profile
					usr.SayFont = M.SayFont
					usr.Chakra-=5
					usr.Henge=1
					usr.move = 1
					usr.overlays = null
					usr.overlays = M.overlays
					if(M)
						usr.icon = M.icon
					flick('smoke.dmi',usr)
				else
					flick('smoke.dmi',usr)
					usr.overlays = null
					for(var/obj/items/Clothing/C in usr.contents)
						if(C.worn)
							usr.overlays += C.icon
					usr.overlays += usr.hair
					usr.name = usr.Oname
					usr.SayFont = usr.OSayFont
					usr.profile = usr.Oprofile
					usr.Henge = 0
					usr.icon = usr.Oicon
					src.Active=0
					if(usr.Hyuuga)
						usr.overlays += 'Hyuuga.dmi'