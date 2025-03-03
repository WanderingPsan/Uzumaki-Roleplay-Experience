/*	Caravan Code: Very Simple, follow what's there and it'll work just fine. You can place the NPC wherever you'd like on the map.
	Kirigakure_Caravan
		icon = 'NPCs.dmi'
		icon_state="Shop"
		verb/Talk()
			set src in view(2)
			switch(input("Where would you like to go today?")in list("Konoha","Sunagakure","Kumogakure","Amegakure","Genjigakure","Cancel"))
				if("Konoha")
					if(usr.Yen >= *Insert Dollar Amount*)
						usr.Yen -= DollarAmount
						usr.loc = locate(x,y,z)
						return
				if("Insert Village Name From List Above")
					if(usr.Yen >= *Insert Dollar Amount*)
						usr.Yen -= DollarAmount
						usr.loc = locate(x,y,z)
						return

	Konoha_Caravan
		icon = 'NPCs.dmi'
		icon_state="Shop"

	Sunagakure_Caravan
		icon = 'NPCs.dmi'
		icon_state="Shop"



/////////////////////////////////////////////////////////////

This file is also for you to place and test various things which may not find compatibility elsewhere.





*/


