obj/Ninjutsu/Shikyaku_no_Jutsu
	var/Jibashi=0
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="All_Fours"
	Click()
		if(src in usr.contents)
			if(!Jibashi)
				if(usr.Chakra<4)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Beast Mimicking Taijutsu Style has increased."
					skill+=1
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=4
				usr.Agility *= 1.7
				usr.icon_state="2"
				src.Active=1
				Jibashi=1
			else
				usr.Agility = usr.MaxAgility
				usr.icon_state=""
				Jibashi=0
				src.Active=0

