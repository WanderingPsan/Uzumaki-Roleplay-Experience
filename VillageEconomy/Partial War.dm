



obj/items/citem/Unwritten_Declaration_Of_War
	icon = 'Paper.dmi'
	icon_state = ""
	var
		Attacker = ""
		Defender = ""
		Declared = 0

	verb
		Submit_Defeat()
			if(!src.Declared)
				usr<<"You must declare war first!"
				return
			var/defeat = input("Are you sure you want to admit defeat?") in list("Yes","No")
			if(defeat == "Yes")
				if(usr.Village == "Konohagakure")
					KonohaCash /= 2
					KonohaArmy /= 2
				if(usr.Village == "Kirigakure")
					KiriCash /= 2
					KiriArmy /= 2
				if(usr.Village == "Sunagakure")
					SunaCash /= 2
					SunaArmy /= 2
				if(usr.Village == "Amegakure")
					AmeCash /= 2
					AmeArmy /= 2
				if(usr.Village == "Genjigakure")
					GenjiForces /= 2
					GenjiCash /= 2
				if(usr.Village == "Kumogakure")
					KumoCash /= 2
					KumoArmy /= 2
			if(defeat == "No")
				usr<<"You decide to keep the war going!"
				return

		Declare_War()
			if(src.Declared)
				usr<<"War has already been declared!"
				usr<<"[src.Attacker] has declared war on [src.Defender]!"
				return
			var/Attacker = "[usr.Village]"
			var/Defender = input("Who would you like to declare war upon?") in list("Konohagakure","Kirigakure","Sunagakure","Genjigakure","Amegakure","Kumogakure","Cancel")
			var/consent = input("Are you sure you want to declare war upon [Defender]?") in list("Yes","No")
			if(consent == "No")
				usr<<"You decide not to go to war after all."
				return
			if(Defender == "Cancel")
				return
			if(Defender == "Konohagakure")
				src.Defender = "Konohagakure"
				src.Attacker = Attacker
				world << "[src.Attacker] has declared war on [src.Defender]!!"

			if(Defender == "Kirigakure")
				src.Defender = "Kirigakure"
				src.Attacker = Attacker
				world << "[src.Attacker] has declared war on [src.Defender]!!"

			if(Defender == "Sunagakure")
				src.Defender = "Sunagakure"
				src.Attacker = Attacker
				world << "[src.Attacker] has declared war on [src.Defender]!!"

			if(Defender == "Genjigakure")
				src.Defender = "Genjigakure"
				src.Attacker = Attacker
				world << "[src.Attacker] has declared war on [src.Defender]!!"

			if(Defender == "Amegakure")
				src.Defender = "Amegakure"
				src.Attacker = Attacker
				world << "[src.Attacker] has declared war on [src.Defender]!!"

			if(Defender == "Kumogakure")
				src.Defender = "Kumogakure"
				src.Attacker = Attacker
				world << "[src.Attacker] has declared war on [src.Defender]!!"
			src.icon_state = "w"
			src.name = "Declaration of War - [src.Attacker] vs [src.Defender]"