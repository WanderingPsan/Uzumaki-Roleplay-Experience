mob/var/Voidchild = 0

obj/Custom
	Blank_Buff
		Void_Gaze
			icon= 'Dojutsu.dmi'
			icon_state = "Void"
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
			description = "The user's eyes darken before white 'X's appear in the center. Their physical form seems to flicker as they stand before you."
			jut = "Doujutsu"

	Voidchild
		idran = "Chakra"
		skil = "New"
		jut = "Ninjutsu"
		ele = "Void"
		icon = 'Dojutsu.dmi'
		icon_state = "Void"
		Drank
			ran = "D"
			VoidLeap
				name = "Void Leap!"
				dran = 245
				description = "The user pulses their chakra into their body, causing them to move directly to the point that they are looking at, similar to Shunshin except the user is intangible as they move with a two second stun upon landing."
		Crank
			ran = "C"
			VoidGrab
				name = "Void Grab!"
				dran = 235
				description = "The user sends out a pulsing orb of dark Void chakra, which is invisible to anyone without an occular jutsu. Whatever it hits is pulled rapidly towards the user."
			VoidPush
				name = "Void Push!"
				dran = 235
				description = "The user pulses Void chakra outwads from themselves, forcing anything within a three tile radius to be forced away."

		Brank
			ran = "B"
			VoidWalk
				name = "Void Walk!"
				dran = 375
				description = "The user cloaks themselves in Void chakra, essentially making them invisible to anyone without an occular jutsu."
			VoidSnatch
				name = "Void Snatch!"
				dran = 400
				description = "The user focuses on an object or person within view. They blink and the target is wrapped in a Void Chakra Cloak and when the user's eyes open they are moved to a position directly in front of them."

		Arank
			ran = "A"
			VoidDraw
				name = "Void Draw!"
				dran = 750
				description = "The user creates a small orb of void chakra that floats around them, drawing in and nullifying any elemental jutsu used agains them."
			VoidRelease
				name = "Void Release!"
				dran = 750
				description = "The user releases any jutsu drawn into any given Void upon their original user."

		Srank
			ran = "S"
			SpatialRend
				name = "Spatial Rend!"
				dran = 1150
				description = "The user's right arm is surrounded by a cloak of Void Chakra which becomes visible to anyone. The user then swings their arm, ripping a tear in the fabric of space and time, anyone within the area, On the Screen, is drawn into the Void and killed."


obj/Perk
	Voidchild
		icon = 'Dojutsu.dmi'
		icon_state = "Void"
		description = "This character is the descendant of Voidchild, Son of Pickles. They have attained the ability to tap into his power and activate his Dojutsu, Void Gaze."
		tier = 1
		canttier2 = 1
	Void_Chakra
		icon = 'Dojutsu.dmi'
		icon_state = "Void"
		description = "Void chakra is invisible to anyone but those users of Rinnegan, Byakugan, Sharingan, and any of the Voidchild's siblings dojutsu."
		tier = 1
		canttier2 = 1
obj/Gene
	Voidchild
		suffix = "This user is the Child of Pickles, Voidchild's descendant."