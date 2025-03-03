mob/var
	Nibi=0
	HasNibi=0
	Nibi1=0
	HasNibi1=0

obj/Nibi
	verb
		Unleash_Bijuu()
			set category="Bijuu"
			if(!usr.Nibi&&usr.HasNibi)
				usr.overlays += 'Nibi.dmi'
				usr.Nibi=1
				sleep(150)
				usr.overlays -= 'Nibi.dmi'
				usr.overlays += 'Nibi-eyes.dmi'
				usr.Chakra *=2.5
				usr.Taijutsu *= 1.5
				usr.Agility *= 1.8
				usr.Strength *= 1.5
				return
			if(!usr.Nibi1&&usr.HasNibi1)
				usr.overlays += 'Nibi2.dmi'
				usr.overlays += 'Nibi-eyes.dmi'
				usr.Nibi1=1
				usr.Chakra *=6
				usr.Taijutsu *= 1.75
				usr.Strength *= 3
				usr.Agility *= 3
				return
		Control_Bijuu()
			set category="Bijuu"
			if(usr.Nibi1)
				usr.Nibi1_Revert()
				usr.overlays += 'Nibi.dmi'
				usr.Chakra = usr.MaxChakra
				usr.Strength = usr.MaxStrength
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				return
			if(usr.Nibi)
				usr.Nibi_Revert()
				usr.Chakra = usr.MaxChakra
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Strength = usr.MaxStrength
				usr.Agility = usr.MaxAgility
				return
mob/proc
	Nibi1_Revert()
		if(usr.Nibi1)
			src.overlays -= 'Nibi2.dmi'
			usr.overlays -= 'Nibi-eyes.dmi'
			src.Nibi1=0
	Nibi_Revert()
		if(usr.Nibi)
			src.overlays -= 'Nibi.dmi'
			usr.overlays -= 'Nibi-eyes.dmi'
			src.Nibi=0

mob/var
	Nanabi1=0
	HasNanabi1=0
	Nanabi2=0
	HasNanabi2=0
	Nanabi0=0
	HasNanabi0=0

obj/Nanabi
	verb
		Unleash_Bijuu()
			set category="Bijuu"
			if(!usr.Nanabi0&&usr.HasNanabi0)
				usr.overlays += 'Nanabi0.dmi'
				usr.Nanabi0=1
				sleep(150)
				usr.overlays -= 'Nanabi0.dmi'
				usr.overlays += 'Nibi-eyes.dmi'
				usr.Chakra *=2.5
				usr.Taijutsu *= 1.5
				usr.Agility *= 1.8
				usr.Strength *= 1.5
				return
			if(!usr.Nanabi1&&usr.HasNanabi1)
				usr.overlays += 'Nanabi1.dmi'
				usr.overlays += 'Nibi-eyes.dmi'
				usr.Nanabi1=1
				usr.Chakra *=6
				usr.Taijutsu *= 1.75
				usr.Strength *= 3
				usr.Agility *= 3
				return
			if(!usr.Nanabi2&&usr.HasNanabi2)
				usr.overlays += 'Nanabi2.dmi'
				usr.overlays += 'Nibi-eyes.dmi'
				usr.Nanabi2=1
				usr.Chakra *=6
				usr.Taijutsu *= 1.75
				usr.Strength *= 3
				usr.Agility *= 3
				return
		Control_Bijuu()
			set category="Bijuu"
			if(usr.Nanabi1)
				usr.Nanabi_Revert()
				usr.overlays += 'Nanabi1.dmi'
				usr.Chakra = usr.MaxChakra
				usr.Strength = usr.MaxStrength
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Agility = usr.MaxAgility
				return
			if(usr.Nanabi2)
				usr.Nanabi2_Revert()
				usr.Chakra = usr.MaxChakra
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Strength = usr.MaxStrength
				usr.Agility = usr.MaxAgility
				return
			if(usr.Nanabi0)
				usr.Nanabi0_Revert()
				usr.Chakra = usr.MaxChakra
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Strength = usr.MaxStrength
				usr.Agility = usr.MaxAgility
				return
mob/proc
	Nanabi_Revert()
		if(usr.Nanabi1)
			src.overlays -= 'Nanabi1.dmi'
			usr.overlays -= 'Nibi-eyes.dmi'
			src.Nanabi1=0
	Nanabi2_Revert()
		if(usr.Nanabi2)
			src.overlays -= 'Nanabi2.dmi'
			usr.overlays -= 'Nibi-eyes.dmi'
			src.Nanabi2=0
	Nanabi0_Revert()
		if(usr.Nanabi0)
			src.overlays -= 'Nanabi0.dmi'
			usr.overlays -= 'Nibi-eyes.dmi'
			src.Nanabi0=0