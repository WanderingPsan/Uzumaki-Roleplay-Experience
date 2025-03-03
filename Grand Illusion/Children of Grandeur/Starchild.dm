mob/var/Starchild = 0


obj/Custom
	Blank_Buff
		Star_Gaze
			icon= 'Dojutsu.dmi'
			icon_state = "Star"
			Sensory = 1
			Gsense = 20
			GChak = 450
			GStam = 450
			Gnin = 4.59
			Ggen = 5.69
			Gtai = 4.95
			Gcon = 5.55
			Gint = 10
			Gref = 4.85
			Gspd = 5.65
			Gstr = 4.99
			Gdef = 5.19
			Gdur = 4.35
			Gatkspd = 5.42
			description = "The user's eyes turn a deep purple and bright gold stars form in the center. They float just off the ground and a dark purple aura surrounds them."
			jut = "Doujutsu"
	StarChild
		idran = "Chakra"
		skil = "New"
		jut = "Ninjutsu"
		ele = "Star"
		icon = 'Dojutsu.dmi'
		icon_state = "Star"
		Drank
			ran = "D"
			Starshine
				name = "Star Shine!"
				dran = 350
				description = "The user releases a bright purple light with healing properties from their hands."
		Crank
			ran = "C"
			Starbolt
				name = "Star Bolt!"
				dran = 445
				description = "The user releases a bolt of purple energy from their hands that deal burning, concussive damage to their target."
			Starblitz
				name = "Star Blitz!"
				dran = 375
				description = "The user covers themself in a cloak of flame-like purple chakra before dashing at their target at double their max speed."
		Brank
			ran = "B"
			Starstream
				name = "Star Stream!"
				dran = 600
				description = "The user fires off a stream of dazzling purple chakra that is capable of piercing targets. Requires both hands to fire."
		Arank
			ran = "A"
			Starstorm
				name = "Star Storm!"
				dran = 1000
				description = "The user creates a dozen medium sized orbs of purple chakra in the air above their target that hang there and fire down by the user's volition."

		Srank
			ran = "S"
			StarDevestator
				name = "Astral Destroyer!"
				dran = 1500
				description = "The user creates a vacuum around a target and causes small stars to form within the vacuum and rip through the target."




obj/Perk
	Starchild
		icon = 'Dojutsu.dmi'
		icon_state = "Star"
		description = "This character is the descendant of Starchild, Daughter of Pickles. They have attained the ability to tap into her power and activate her Dojutsu, Star Gaze."
		tier = 1
		canttier2 = 1

obj/Gene
	Starchild
		suffix = "This user is the Child of Pickles, Starchild's descendant."