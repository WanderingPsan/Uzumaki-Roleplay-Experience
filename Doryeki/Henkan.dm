mob/var
	Henkand = 0
	Dressphere = null

obj/var
	Henkan = null

obj/items/Citem/Henkan
	icon = 'Henkan.dmi'
	var/TransCall = ""
	var/Survivor = 0
	verb
		Transform()
			if(!usr.Henkand)
				for(var/obj/Perk/P in src.contents)
					P.Henkan = src
					usr.contents += P
				for(var/obj/Custom/C in src.contents)
					C.Henkan = src
					usr.contents += C
				for(var/obj/items/Weapon/Henkan_Weapon/H in src.contents)
					usr.contents += H
					H.Henkan = src
					H.worn = 1
					H.suffix = "**Equipped**"
					usr.overlays += H.icon
				for(var/obj/items/Weapon/I in usr.contents)
					if(I.worn)
						I.worn = 0
						I.suffix=""
						usr.overlays -= I.icon
				for(var/obj/items/Weapon/W in src.contents)
					usr.contents += W
					W.Henkan = src
					W.worn = 1
					W.suffix="**Equipped**"
					usr.overlays += W.icon

				for(var/obj/items/Clothing/U in usr.contents)
					if(U.worn)
						U.worn = 0
						U.suffix=""
						usr.overlays -= U.icon
				for(var/obj/items/Clothing/L in src.contents)
					usr.contents += L
					L.Henkan = src
					L.worn = 1
					L.suffix="**Equipped**"
					usr.overlays += L.icon

				for(var/obj/items/Citem/Q in src.contents)
					usr.contents += Q
					Q.Henkan = src
				if(src.name == "Henkan: Suterusu")
					usr.LockPickSkill = 100
					var/obj/items/Citem/tools/Lockpick/G = new
					usr.contents += G
					G.suffix = "**Equipped**"
					G.Setti = 1
					G.name = "Pick of the Nightingale."
				viewers()<<"[usr] [src.TransCall]!"
				usr.Henkand = 1
				usr.Dressphere = src
			else
				usr<<"You're already transformed."

		Revert()
			if(usr.Henkand)
				if(usr.Dressphere == src)
					for(var/obj/Perk/P in usr.contents)
						if(P.Henkan == src)
							src.contents += P
					for(var/obj/Custom/C in usr.contents)
						if(C.Henkan == src)
							src.contents += C
					for(var/obj/items/Weapon/Henkan_Weapon/H in usr.contents)
						if(H.Henkan == src)
							src.contents += H
						if(H.worn)
							H.worn = 0
							H.suffix=""
							usr.overlays -= H.icon
					for(var/obj/items/Weapon/W in usr.contents)
						if(W.Henkan == src)
							src.contents += W
						if(W.worn)
							W.worn = 0
							W.suffix=""
							usr.overlays -= W.icon
					for(var/obj/items/Clothing/L in usr.contents)
						if(L.Henkan == src)
							src.contents += L
						if(L.worn)
							L.worn = 0
							L.suffix=""
							usr.overlays -= L.icon
					for(var/obj/items/Citem/Q in usr.contents)
						if(Q.Henkan == src)
							src.contents += Q
					for(var/obj/Ninjutsu/N in usr.contents)
						if(N.Henkan == src)
							src.contents += N
					if(src.name == "Henkan: Suterusu")
						for(var/obj/items/Citem/tools/Lockpick/G in usr.contents)
							if(G.Henkan == src)
								del G
						usr.LockPickSkill = 0

					viewers()<<"[usr] returns to their normal self."
					usr.Henkand = 0
					usr.Dressphere = null
				else
					usr<<"You cannot revert because you aren't using this Henkan."
			else
				usr<<"You aren't transformed."






	EmptyHenkan
		name = "Clear Henkan"
		icon_state = "clear"
		TransCall = ""
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(!C.Henkan == src || C.Henkan==null)
						O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)
				for(var/obj/items/Weapon/W in usr.contents)
					if(!W.Henkan == src || W.Henkan==null)
						O.Add(W)
				var/obj/I = input("What would you like to link to this orb?")in O + list("Cancel")
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."

			Name()
				var/newname = input("What would you like to name this orb?")as text
				if(newname==null)
					return
				src.name = newname

	HenkanKyoka
		name = "Henkan: Kyoka"
		icon_state = "rainbow"
		TransCall = "spins around and transforms into their Multi-Element Henkan."
		verb
			Link()
				var/list/O = new/list
	//			for(var/obj/Custom/R in usr.contents)
	//				if(!R.Henkan == src || R.Henkan==null)
	//					if(R.jut == "Fuuinjutsu")
	//						R.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.Henkan == src || C.Henkan==null)
						O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)
				for(var/obj/items/Weapon/W in usr.contents)
					if(!W.Henkan == src || W.Henkan==null)
						O.Add(W)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Blank_Buff/A = new
			A.name = "Koyka Dressphere"
			A.icon= 'Dorukyo.dmi'
			A.icon_state = "Henkan"
			A.Sensory = 0
			A.Gsense = 0
			A.GChak = 2500
			A.GStam = 0
			A.Gnin = 3.50
			A.Ggen = 0
			A.Gtai = 0
			A.Gcon = 3.50
			A.Gint = 0
			A.Gref = 0
			A.Gspd = 0
			A.Gstr = 0
			A.Gdef = 0
			A.Gdur = 0
			A.Gatkspd = 2.00
			A.description = "The user of this technique transforms inside of a 'special dressphere.' Granting them a more festival-like and traditional attire, it also grants them the ability to utilize more than one of the elements. The user must have the ability to utilize a minimum of two of the elemental dresspheres with a certain profiency."
			A.jut = "Ninjutsu"
			A.Henkan = src
			src.contents += A


	HenkanSuterusu
		name = "Henkan: Suterusu"
		icon_state = "blue"
		TransCall = "spins around and transforms into their Suterusu Henkan."
		verb
			Link()
				var/list/O = new/list
	//			for(var/obj/Custom/R in usr.contents)
	//				if(!R.Henkan == src || R.Henkan==null)
	//					if(R.jut == "Fuuinjutsu")
	//						R.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.Henkan == src || C.Henkan==null)
						O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)
				for(var/obj/items/Weapon/W in usr.contents)
					if(!W.Henkan == src || W.Henkan==null)
						O.Add(W)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Blank_Buff/A = new
			A.name = "Suterusu Dressphere"
			A.icon= 'Dorukyo.dmi'
			A.icon_state = "Henkan"
			A.Sensory = 1
			A.Gsense = 10
			A.GChak = 0
			A.GStam = 0
			A.Gnin = 0
			A.Ggen = 0
			A.Gtai = 3.75
			A.Gcon = 0
			A.Gint = 0
			A.Gref = 2.75
			A.Gspd = 2.75
			A.Gstr = 0
			A.Gdef = 0
			A.Gdur = 0
			A.Gatkspd = 2.75
			A.description = "The user of this technique transforms into a strict stealth user. This grants them an enhanced ability in stealth and further skill in blending with the shadows. They will improve as experience and knowledge is gained."
			A.jut = "Taijutsu"
			A.Henkan = src
			src.contents += A

			var/obj/Perk/Concealer/B = new
			B.Henkan = src
			src.contents += B

	HenkanSurotorru
		name = "Henkan: Surotorru"
		icon_state = "rainbow"
		TransCall = "spins around and transforms into their Surotorru Henkan."
		verb
			Link()
				var/list/O = new/list
	//			for(var/obj/Custom/R in usr.contents)
	//				if(!R.Henkan == src || R.Henkan==null)
	//					if(R.jut == "Fuuinjutsu")
	//						R.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.Henkan == src || C.Henkan==null)
						O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)
				for(var/obj/items/Weapon/W in usr.contents)
					if(!W.Henkan == src || W.Henkan==null)
						O.Add(W)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Blank_Buff/A = new
			A.name = "Dorukyo Dressphere"
			A.icon= 'Henkan.dmi'
			A.icon_state = "Henkan"
			A.Sensory = 0
			A.Gsense = 0
			A.GChak = 0
			A.GStam = 0
			A.Gnin = 0
			A.Ggen = 0
			A.Gtai = 1.50
			A.Gcon = 0
			A.Gint = 0
			A.Gref = 1.50
			A.Gspd = 0
			A.Gstr = 0
			A.Gdef = 0
			A.Gdur = 0
			A.Gatkspd = 2.00
			A.description = "The user of this technique transforms into a 'special dressphere'. Their attire turns into that of a knife, with three blades which hover around the user and gives them the ability to manipulate them. It also grants them a natural proficiency in anything Kenjutsu."
			A.jut = "Kenjutsu"
			A.Henkan = src
			src.contents += A

			var/obj/items/Weapon/Henkan_Weapon/Float_Knife/B = new
			B.Henkan = src
			src.contents += B


	HenkanMakina
		name = "Henkan: Makina"
		icon_state = "rainbow"
		TransCall = "spins around and transforms into some sort of robotic being."
		verb
			Link()
				var/list/O = new/list
	//			for(var/obj/Custom/R in usr.contents)
	//				if(!R.Henkan == src || R.Henkan==null)
	//					if(R.jut == "Fuuinjutsu")
	//						R.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.Henkan == src || C.Henkan==null)
						O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)
				for(var/obj/items/Weapon/W in usr.contents)
					if(!W.Henkan == src || W.Henkan==null)
						O.Add(W)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Blank_Buff/A = new
			A.name = "Makina Dressphere"
			A.icon= 'Dorukyo.dmi'
			A.icon_state = "Henkan"
			A.Sensory = 0
			A.Gsense = 0
			A.GChak = 1500
			A.GStam = 1500
			A.Gnin = 0
			A.Ggen = 0
			A.Gtai = 0
			A.Gcon = 0
			A.Gint = 0
			A.Gref = 0
			A.Gspd = 0
			A.Gstr = 2.00
			A.Gdef = 0
			A.Gdur = 2.00
			A.Gatkspd = 0
			A.description = "The user of this technique transforms into a 'special' dressphere which allows them to transform into a machine-like being. Although this makes them weak to Raiton, it allows them to launch projectiles and other forms of weaponry at incredible rates. They're also allowed to customize the machine, allowing them to install flamethrowers, water guns, et cetera."
			A.jut = "Ninjutsu"
			A.Henkan = src
			src.contents += A





	HenkanKugutsu
		name = "Henkan: Kugutsu"
		icon_state = "green"
		TransCall = "spins around and transforms into their Puppetry Henkan."
		verb
			Link()
				var/list/O = new/list
	//			for(var/obj/Custom/R in usr.contents)
	//				if(!R.Henkan == src || R.Henkan==null)
	//					if(R.jut == "Fuuinjutsu")
	//						R.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.Henkan == src || C.Henkan==null)
						O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)
				for(var/obj/items/Weapon/W in usr.contents)
					if(!W.Henkan == src || W.Henkan==null)
						O.Add(W)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."

		New()
			var/obj/Custom/Blank_Buff/A = new
			A.name = "Kugutsu Dressphere"
			A.icon= 'Dorukyo.dmi'
			A.icon_state = "Henkan"
			A.Sensory = 0
			A.Gsense = 0
			A.GChak = 1500
			A.GStam = 0
			A.Gnin = 2.50
			A.Ggen = 0
			A.Gtai = 0
			A.Gcon = 2.50
			A.Gint = 2.50
			A.Gref = 0
			A.Gspd = 0
			A.Gstr = 0
			A.Gdef = 0
			A.Gdur = 0
			A.Gatkspd = 0
			A.description = "The user of this technique transforms into a strict Puppet user. This grants them to utilize a wide variety of sealing techniques so long as they learn them or the information has already been processed inside of their dressphere."
			A.jut = "Ninjutsu"
			A.Henkan = src
			src.contents += A

			var/obj/Perk/Puppeteer_Tier_1/B = new
			B.Henkan = src
			src.contents += B

			var/obj/Ninjutsu/Kugutsu_no_Jutsu/C = new
			C.Henkan = src
			src.contents += C

	HenkanMippuu
		name = "Henkan: Mippuu"
		icon_state = "rainbow"
		TransCall = "spins around and transforms into their Fuuinjutsu Henkan."
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/R in usr.contents)
					if(!R.Henkan == src || R.Henkan==null)
						if(R.jut == "Fuuinjutsu")
							R.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.Henkan == src || C.Henkan==null)
						O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)
				for(var/obj/items/Weapon/W in usr.contents)
					if(!W.Henkan == src || W.Henkan==null)
						O.Add(W)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Blank_Buff/A = new
			A.name = "Mippuu Dressphere"
			A.icon= 'Dorukyo.dmi'
			A.icon_state = "Henkan"
			A.Sensory = 0
			A.Gsense = 0
			A.GChak = 1500
			A.GStam = 0
			A.Gnin = 2.50
			A.Ggen = 0
			A.Gtai = 0
			A.Gcon = 2.50
			A.Gint = 2.50
			A.Gref = 0
			A.Gspd = 0
			A.Gstr = 0
			A.Gdef = 0
			A.Gdur = 0
			A.Gatkspd = 0
			A.description = "The user of this technique transforms into a strict Fuuinjutsu user. This grants them to utilize a wide variety of sealing techniques so long as they learn them or the information has already been processed inside of their dressphere."
			A.jut = "Fuuinjutsu"
			A.Henkan = src
			src.contents += A

			var/obj/Perk/Basic_Sealing/B = new
			B.Henkan = src
			src.contents += B

			var/obj/Custom/Fuuinjutsu/Crank/Finger_Carving_Seal/C = new
			C.Henkan = src
			src.contents += C

	HenkanSeikina
		name = "Henkan: Seikina"
		icon_state = "red"
		TransCall = "spins around and transforms into their Sensing Henkan."
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(!C.Henkan == src || C.Henkan==null)
						O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)
				for(var/obj/items/Weapon/W in usr.contents)
					if(!W.Henkan == src || W.Henkan==null)
						O.Add(W)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Blank_Buff/A = new
			A.name = "Seikina Dressphere"
			A.icon= 'Dorukyo.dmi'
			A.icon_state = "Henkan"
			A.Sensory = 1
			A.Gsense = 15
			A.GChak = 0
			A.GStam = 0
			A.Gnin = 2.25
			A.Ggen = 0
			A.Gtai = 0
			A.Gcon = 0
			A.Gint = 0
			A.Gref = 0
			A.Gspd = 0
			A.Gstr = 0
			A.Gdef = 0
			A.Gdur = 0
			A.Gatkspd = 0
			A.description = "The user of this technique transforms into a strict sensor. This grants them to utilize a wide variety of sensing techniques so long as they learn them or the information has already been processed inside of their 'dressphere.'"
			A.jut = "Ninjutsu"
			A.Henkan = src
			src.contents += A

	HenkanBasaka
		name = "Henkan: Basaka"
		icon_state = "green"
		TransCall = "spins around and transforms into their Taijutsu Henkan."
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(!C.Henkan == src || C.Henkan==null)
						O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)
				for(var/obj/items/Weapon/W in usr.contents)
					if(!W.Henkan == src || W.Henkan==null)
						O.Add(W)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Blank_Buff/A = new
			A.name = "Basaka Dressphere"
			A.icon= 'Dorukyo.dmi'
			A.icon_state = "Henkan"
			A.Sensory = 0
			A.Gsense = 0
			A.GChak = 0
			A.GStam = 0
			A.Gnin = 0
			A.Ggen = 0
			A.Gtai = 2.25
			A.Gcon = 0
			A.Gint = 0
			A.Gref = 0
			A.Gspd = 0
			A.Gstr = 1.15
			A.Gdef = 0.75
			A.Gdur = 1.15
			A.Gatkspd = 0.75
			A.description = "The user of this technique transforms into a strict Taijutsu element user. This grants them to utilize a wide variety of Taijutsu techniques so long as they learn them or the information has already been processed inside of their 'dressphere.'"
			A.jut = "Taijutsu"
			A.Henkan = src
			src.contents += A

	HenkanSamurai
		name = "Henkan: Samurai"
		icon_state = "yello"
		TransCall = "spins around and transforms into their Samurai Henkan."
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(!C.Henkan == src || C.Henkan==null)
						O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)
				for(var/obj/items/Weapon/W in usr.contents)
					if(!W.Henkan == src || W.Henkan==null)
						O.Add(W)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/items/Weapon/Custom_Katana/A = new
			A.Henkan = src
			src.contents += A

			var/obj/Perk/Katana_Proficiency/B = new
			B.Henkan = src
			src.contents += B

			var/obj/items/Weapon/Custom_Mahiru_Katana/C = new
			C.Henkan = src
			src.contents += C

			var/obj/items/Clothing/Samurai_Armour/E = new
			E.Henkan = src
			src.contents += E

			var/obj/Perk/Heavy_Armor_Proficiency/D = new
			D.Henkan = src
			src.contents += D

			var/obj/Custom/Blank_Buff/F = new
			F.name = "Samurai Dressphere"
			F.icon= 'Dorukyo.dmi'
			F.icon_state = "Henkan"
			F.Sensory = 0
			F.Gsense = 0
			F.GChak = 0
			F.GStam = 1.15
			F.Gnin = 0
			F.Ggen = 0
			F.Gtai = 1.15
			F.Gcon = 0
			F.Gint = 0
			F.Gref = 1.15
			F.Gspd = 1.15
			F.Gstr = 1.15
			F.Gdef = 1.15
			F.Gdur = 1.15
			F.Gatkspd = 1.15
			F.description = "The user of this technique transforms into a strict Kenjutsu user who specializes in heavy armor and the bushido code. If the user transforms into this state, receives any kind of blade and transforms into something else, the sword is part of the 'dressphere.' They become very proficient in Kenjutsu and armor wearing, but must acquire all of their techniques and proficiency through experience."
			F.jut = "Taijutsu"
			F.Henkan = src
			src.contents += F


	ShiroiMajikku
		name = "Henkan: Shiroi Majikku"
		icon_state = "prple"
		TransCall = "spins around as they transform into their Healing Dressphere."
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(!C.jut == "Ninjutsu")
						if(!C.Henkan == src || C.Henkan==null)
							O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Blank_Buff/A = new
			A.name = "Shiroi Dressphere"
			A.icon= 'Dorukyo.dmi'
			A.icon_state = "Henkan"
			A.Sensory = 0
			A.Gsense = 0
			A.GChak = 1000
			A.GStam = 0
			A.Gnin = 1.75
			A.Ggen = 0
			A.Gtai = 0
			A.Gcon = 1.75
			A.Gint = 1.75
			A.Gref = 0
			A.Gspd = 0
			A.Gstr = 0
			A.Gdef = 0
			A.Gdur = 0
			A.Gatkspd = 0
			A.description = "The user of this technique transforms into a strict Medical Ninjutsu. This grants them to utilize a wide variety of medical techniques so long as they learn them or the information has already been processed inside of their 'dressphere.'"
			A.jut = "Ninjutsu"
			A.Henkan = src
			src.contents += A




	Masukotto
		name = "Henkan: Masukotto"
		icon_state = "prple"
		TransCall = "spins around as they transform into their Animal Dressphere."
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(!C.Henkan == src || C.Henkan==null)
						O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."

		New()
			var/obj/Custom/Blank_Buff/A = new
			A.name = "Masukotto Dressphere"
			A.icon= 'Dorukyo.dmi'
			A.icon_state = "Henkan"
			A.Sensory = 0
			A.Gsense = 0
			A.GChak = 0
			A.GStam = 0
			A.Gnin = 0
			A.Ggen = 0
			A.Gtai = 0
			A.Gcon = 0
			A.Gint = 0
			A.Gref = 0
			A.Gspd = 0
			A.Gstr = 0
			A.Gdef = 0
			A.Gdur = 0
			A.Gatkspd = 0
			A.description = "The user of this technique transforms into a strict Medical Ninjutsu. This grants them to utilize a wide variety of medical techniques so long as they learn them or the information has already been processed inside of their 'dressphereThe user of this technique transform into any animal of their choosing. This grants them to utilize a wide variety of animal abilities so long as they learn them or the information has already been processed inside of their dressphere."
			A.jut = "Ninjutsu"
			A.Henkan = src
			src.contents += A





	ShiroMajikku
		name = "Henkan: Shiro Majikku"
		icon_state = "prple"
		TransCall = "spins around as they transform into their Genjutsu Dressphere."
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(C.jut == "Genjutsu")
						if(!C.Henkan == src || C.Henkan==null)
							C.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.jut == "Genjutsu")
						if(!C.Henkan == src || C.Henkan==null)
							O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Genjutsu/Drank/Genjutsu_Kai/A = new
			A.Henkan = src
			src.contents += A

			var/obj/Custom/Genjutsu/Drank/Magen_Narakumi/B = new
			B.Henkan = src
			src.contents += B

			var/obj/Custom/Blank_Buff/C = new
			C.name = "Shiro Dressphere"
			C.icon= 'Dorukyo.dmi'
			C.icon_state = "Henkan"
			C.Sensory = 0
			C.Gsense = 0
			C.GChak = 0
			C.GStam = 0
			C.Gnin = 0
			C.Ggen = 2.50
			C.Gtai = 0
			C.Gcon = 0
			C.Gint = 2.50
			C.Gref = 0
			C.Gspd = 0
			C.Gstr = 0
			C.Gdef = 0
			C.Gdur = 0
			C.Gatkspd = 0
			C.description = "The user of this technique transforms into a strictly Genjutsu profession. This grants them to utilize a wide variety of genjutsu so long as they learn them or the information has already been processed inside of their 'dressphere.'"
			C.jut = "Ninjutsu"
			C.Henkan = src
			src.contents += C






	KazeMajikku
		name = "Henkan: Kaze Majikku"
		icon_state = "green"
		TransCall = "spins around as they transform into their Wind Dressphere."
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(C.ele == "Wind")
						if(!C.Henkan == src || C.Henkan==null)
							C.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.ele == "Wind")
						if(!C.Henkan == src || C.Henkan==null)
							O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Fuuton/Drank/Wind_Style_Divine_Wind/A = new
			A.Henkan = src
			src.contents += A


			var/obj/Custom/Fuuton/Crank/Wind_Style_Gale_Palm/B = new
			B.Henkan = src
			src.contents += B

			var/obj/Perk/Elemental_Training_Wind/C = new
			C.Henkan = src
			src.contents += C


	MizuMajikku
		name = "Henkan: Mizu no Majikku"
		icon_state = "blue"
		TransCall = "spins around as they transform into their Water Dressphere."
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(C.ele == "Water")
						if(!C.Henkan == src || C.Henkan==null)
							C.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.ele == "Water")
						if(!C.Henkan == src || C.Henkan==null)
							O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Suiton/Crank/Water_Style_Syrup_Trap/A = new
			A.Henkan = src
			src.contents += A

			var/obj/Custom/Suiton/Crank/Water_Style_Raging_Waves/B = new
			B.Henkan = src
			src.contents += B

			var/obj/Perk/Elemental_Training_Water/C = new
			C.Henkan = src
			src.contents += C



	RaitonMajikku
		name = "Henkan: Raiton Majikku"
		icon_state = "yello"
		TransCall = "spins around as they transform into their Lightning Dressphere."
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(C.ele == "Lightning")
						if(!C.Henkan == src || C.Henkan==null)
							C.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.ele == "Lightning")
						if(!C.Henkan == src || C.Henkan==null)
							O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Raiton/Crank/Lightning_Style_Earth_Flash/A = new
			A.Henkan = src
			src.contents += A

			var/obj/Perk/Elemental_Training_Lightning/B = new
			B.Henkan = src
			src.contents += B




	AsuMajikku
		name = "Henkan: Asu Majikku"
		icon_state = "green"
		TransCall = "spins around as they transform into their Earth Dressphere."
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(C.ele == "Earth")
						if(!C.Henkan == src || C.Henkan==null)
							C.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.ele == "Earth")
						if(!C.Henkan == src || C.Henkan==null)
							O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Doton/Drank/Earth_Style_Headhunter_Jutsu/A = new
			A.Henkan = src
			src.contents += A

			var/obj/Custom/Doton/Crank/Earth_Style_Hidden_Mole_Jutsu/B = new
			B.Henkan = src
			src.contents += B

			var/obj/Perk/Elemental_Training_Earth/C = new
			C.Henkan = src
			src.contents += C





	FaiaMajikku
		name = "Henkan: Faia Majikku"
		icon_state = "red"
		TransCall = "spins around as they transform into their Fire Dressphere."
		verb
			Link()
				for(var/obj/Custom/C in usr.contents)
					if(C.ele == "Fire")
						if(!C.Henkan == src || C.Henkan==null)
							C.Henkan = src
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(!C.ele == "Fire")
						if(!C.Henkan == src || C.Henkan==null)
							O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/Custom/Katon/Drank/Ninja_Art_Fire_Run/A = new
			A.Henkan = src
			src.contents += A

			var/obj/Custom/Katon/Crank/Fire_Style_Fireball_Jutsu/B = new
			B.Henkan = src
			src.contents += B

			var/obj/Perk/Elemental_Training_Fire/C = new
			C.Henkan = src
			src.contents += C






	KenNoUdemae
		name = "Henkan: Ken no Udemae"
		icon_state = "blue"
		TransCall = "spins around as they transform into their Kenjutsu Dressphere"
		verb
			Link()
				var/list/O = new/list
				for(var/obj/Custom/C in usr.contents)
					if(C.jut == "Kenjutsu")
						if(!C.Henkan == src || C.Henkan==null)
							C.Henkan = src
				for(var/obj/Custom/C in usr.contents)
					if(!C.jut == "Kenjutsu")
						if(!C.Henkan == src || C.Henkan==null)
							O.Add(C)
				for(var/obj/Perk/P in usr.contents)
					if(!P.Henkan == src || P.Henkan==null)
						O.Add(P)
				for(var/obj/items/Clothing/L in usr.contents)
					if(!L.Henkan == src || L.Henkan==null)
						O.Add(L)

				var/obj/I = input("What would you like to link to this orb?")in O
				I.Henkan = src
				usr<<"You have linked [I] to your [src] Dressphere."
		New()
			var/obj/items/Weapon/Custom_Katana/A = new
			A.Henkan = src
			src.contents += A

			var/obj/Perk/Katana_Proficiency/B = new
			B.Henkan = src
			src.contents += B

			var/obj/items/Clothing/Danzou_Suit/C = new
			C.Henkan = src
			src.contents += C

			var/obj/Custom/Blank_Buff/D = new
			D.name = "Ken no Udeme Dressphere"
			D.icon= 'Dorukyo.dmi'
			D.icon_state = "green"
			D.Sensory = 0
			D.Gsense = 0
			D.GChak = 0
			D.GStam = 0
			D.Gnin = 0
			D.Ggen = 0
			D.Gtai = 1.50
			D.Gcon = 0
			D.Gint = 0
			D.Gref = 1.50
			D.Gspd = 1.50
			D.Gstr = 0
			D.Gdef = 0
			D.Gdur = 0
			D.Gatkspd = 1.50
			D.description = "The user of this technique transforms into a strict Kenjutsu user. If the user transforms into this state, receives any kind of blade and transforms into something else, the sword is part of the 'dressphere.' They become very proficient in Kenjutsu, but must acquire all of their techniques and proficiency through experience."
			D.jut = "Kenjutsu"
			D.Henkan = src
			src.contents += D











obj/items/Weapon
	Henkan_Weapon
		Katana
			icon='Katana.dmi'
			icon_state=""
			Click()
				if(src in usr.contents)
					if(!src.worn)
						src.worn = 1
						src.suffix = "**Equipped**"
						usr.Weapon=1
						usr.overlays += src.icon
					else
						src.worn = 0
						src.suffix=""
						usr.Weapon=0
						usr.overlays -= src.icon
		Float_Knife
			icon = 'KnifeFloat.dmi'
			icon_state = "Inv"
			Click()
				if(src in usr.contents)
					if(!src.worn)
						src.worn = 1
						src.suffix = "**Equipped**"
						usr.Weapon=1
						usr.overlays += src.icon
					else
						src.worn = 0
						src.suffix=""
						usr.Weapon=0
						usr.overlays -= src.icon






obj/Notched_Cliff
	icon = '0Cliff.dmi'
	var/OrbsPlaced = 0
	var/Filled = 0
	verb
		Place()
			set src in view(2)
			var/list/L = new/list
			for(var/obj/items/Citem/Henkan/H in usr.contents)
				if(istype(H,/obj/items/Citem/Henkan/EmptyHenkan))
					if(H.Survivor)
						L.Add(H)
			var/obj/O = input("Which would you like to place?")in L+list("Cancel")
			if(O==null)
				return
			src.contents += O
			if(OrbsPlaced == 0)
				OrbsPlaced = 1
				src.icon = '1Cliff.dmi'
				return
			if(OrbsPlaced == 1)
				OrbsPlaced = 2
				src.icon = '2Cliff.dmi'
				return
			if(OrbsPlaced == 2)
				OrbsPlaced = 3
				src.icon = '3Cliff.dmi'
				return
			if(OrbsPlaced == 3)
				OrbsPlaced = 4
				src.icon = '4Cliff.dmi'
				return
			if(OrbsPlaced == 4)
				OrbsPlaced = 5
				src.icon = '5Cliff.dmi'
				return
			if(OrbsPlaced == 5)
				OrbsPlaced = 6
				src.icon = '6Cliff.dmi'
				return
			if(OrbsPlaced == 6)
				OrbsPlaced = 7
				src.icon = '7Cliff.dmi'
				return
				src.Filled = 1
			if(src.Filled)
				usr<<"All Seven of the Survivors are present...."



