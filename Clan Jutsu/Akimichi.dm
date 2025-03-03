/*obj/Baiki
	Part1
		icon_state="1"
		layer=MOB_LAYER+1
		pixel_x = -32

	Part2
		icon_state="2"
		layer=MOB_LAYER+1
		pixel_x = 32
	Part3
		icon_state="3"
		layer=MOB_LAYER+1
		pixel_x = -32
		pixel_y = -32
	Part4
		icon_state="4"
		layer=MOB_LAYER+1
		pixel_y = -32

mob/Akimichi
	Baika
		icon='Baika.dmi'
		icon_state="1"
		layer=MOB_LAYER+1
		pixel_x = -32
		New()
			src.overlays += /obj/Baiki/Part1
			src.overlays += /obj/Baiki/Part2
			src.overlays += /obj/Baiki/Part3
			src.overlays += /obj/Baiki/Part4*/


obj/Taijutsu/Human_Boulder
	var/Nikudan=0
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Nikudan"
	Click()
		if(src in usr.contents)
			if(!Nikudan)
				if(usr.Chakra<40)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Human_Boulder has increased."
					skill+=1
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=40
				usr.Taijutsu *= 2.5
				usr.overlays += 'Human Bolder.dmi'
				src.Active=1
				Nikudan=1
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.overlays -= 'Human Bolder.dmi'
				Nikudan=0
				src.Active=0

obj/Taijutsu/Butterfly_Mode
	var/Choudan=0
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Choudan"
	Click()
		if(src in usr.contents)
			if(!Choudan&&usr.Red)
				if(usr.Chakra<170)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the butter fly has increased."
					skill+=1
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=170
				usr.Taijutsu *= 8.5
				usr.overlays += 'Choudan.dmi'
				usr.overlays += 'Wings.dmi'
				src.Active=1
				Choudan=1
				sleep(rand(180,260))
				usr.Taijutsu = usr.MaxTaijutsu
				usr.overlays -= 'Choudan.dmi'
				usr.overlays -= 'Wings.dmi'
				Choudan=0
				src.Active=0

obj/Ninjutsu/Partial_Expansion_Jutsu
	var/Bubun=0
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Bubun"
	Click()
		if(src in usr.contents)
			if(!Bubun)
				if(usr.Chakra<60)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Partial Expansion Jutsu has increased."
					skill+=1
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=60
				usr.Taijutsu *= 2.5
				usr.overlays += 'Bubun.dmi'
				usr<<"Your have activated Partial Expansion Jutsu."
				src.Active=1
				Bubun=1
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.overlays -= 'Bubun.dmi'
				usr<<"Your have deactivated Partial Expansion Jutsu."
				Bubun=0
				src.Active=0



obj/Ninjutsu/Super_Expansion_Jutsu
	var/Bubun=0
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Bubun"
	Click()
		if(src in usr.contents)
			usr.overlays=new/list
			var/scale=64
			var/xtiles=(scale*0.03125)
			var/ytiles=xtiles
			var/icon/I=new(usr.icon)
			I.Scale(scale,scale)
			var/disposition=48
			while(ytiles>0)
				if(prob(20)) sleep(1)
				usr.overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
				xtiles-=1
				if(!xtiles)
					ytiles-=1
					xtiles=(scale*0.03125)
		else
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
			//usr.icon=null
			sleep(1)
			if(usr.White)
				usr.icon = 'Base_White.dmi'
			if(usr.Pale)
				usr.icon = 'Base_Pale.dmi'
			if(usr.Tan)
				usr.icon = 'Base_Tan.dmi'
			if(usr.Dark)
				usr.icon = 'Base_Black.dmi'
			if(usr.White&&usr.Female)
				usr.icon = 'Base_FemaleWhite.dmi'
			if(usr.Pale&&usr.Female)
				usr.icon = 'Base_FemalePale.dmi'
			if(usr.Tan&&usr.Female)
				usr.icon = 'Base_FemaleTan.dmi'
			if(usr.Dark&&usr.Female)
				usr.icon = 'Base_FemaleBlack.dmi'
