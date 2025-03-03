/*




*/
mob/var/mining = 0
mob/var/mined = 0
mob
	verb
		Minen()
			set hidden = 1
			set name = ".Minen"
			if(usr.mining)
				if(usr.mined < 10)
					var/rank=rand(1,6)
					if(rank==1)
						usr<<"You found a bit of iron ore."
						usr.contents += new/obj/items/ore/Iron_Ore
						usr.mined += 1
					if(rank==2)
						usr<<"You found a bit of Aeratum ore."
						usr.contents += new/obj/items/ore/Aeratum_Ore
						usr.mined += 1
					if(rank==3)
						usr<<"You find nothing sadly."
						usr.mined += 1
					if(rank==4)
						usr<<"You found a bit of iron ore."
						usr.contents += new/obj/items/ore/Iron_Ore
						usr.mined += 1
					if(rank==5)
						usr<<"You found a bit of Aeratum ore."
						usr.contents += new/obj/items/ore/Aeratum_Ore
						usr.mined += 1
					if(rank==6)
						usr<<"You find nothing sadly."
						usr.mined += 1
				else
					usr<<"You have mined all you can for now..."
					usr.mining = 0
					winshow(usr,"Bane",0)
					sleep(3000)
					usr.mined = 0
					usr<<"You may mine again!"

obj/items/ore
	Iron_Ore
		icon='Citem.dmi'
		icon_state = "ironore"

	Aeratum_Ore
		icon='Citem.dmi'
		icon_state = "aeraore"