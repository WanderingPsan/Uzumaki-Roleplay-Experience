mob/var/Earth_Blade=0
obj/Ninjutsu/Earth_blade
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Chidori"
	Click()
		if(src in usr.contents)
			if(!usr.Earth_Blade)
				if(usr.Chakra<100)
					return
				if(usr.resting)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Raiton: Earth Blade has increased."
					skill+=1
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=300
				usr.Taijutsu *= rand(3,3.5)
				usr.Strength *= rand(3,3.5)
				usr.overlays += 'earth-Chidori.dmi'
				usr.drain=1
				usr.Chidori=1
				usr.drain()
			else
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Strength = usr.MaxStrength
				usr.overlays -= 'earth-Chidori.dmi'
				usr.overlays -= 'earth-Chidori.dmi'
				usr.Chidori=0
				usr.drain=0


mob/var/drain=0
mob/proc
	drain()
		spawn(10)
		if(usr.drain)
			usr.Chakra -= 10
			usr.drain()
		if(usr.Chakra<=0)
			usr.Taijutsu = usr.MaxTaijutsu
			usr.Strength = usr.MaxStrength
			usr.overlays -= 'Chidori.dmi'
			usr.overlays -= 'Dark-Chidori.dmi'
			usr.overlays -= 'Rasengan.dmi'
			usr.overlays -= 'earth-Chidori.dmi'
			usr.drain=0
