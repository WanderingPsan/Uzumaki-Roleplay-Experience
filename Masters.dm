mob/Admin3/verb
	Make_Master(mob/M in world)
		set category="Perk Master"
		var/Master = input("Which type of master?") in list(/*"Genjutsu","Medical","Doton","Fuuton","Katon","Raiton","Suiton",*/"Blacksmith")
		if(Master == "Genjutsu")
			M.contents += new/obj/Genjutsu_Master
			M.Class = "Genjutsu Master"
			M.rank2 = "Master"
			M.srank = "B-"
		if(Master == "Medical")
			M.contents += new/obj/Medical_Master
			M.Class = "Master Medic"
			M.rank2 = "Master"
			M.srank = "B-"
		if(Master == "Doton")
			M.contents += new/obj/Doton_Master
			M.Class = "Doton Master"
			M.rank2 = "Master"
			M.srank = "B-"
		if(Master == "Fuuton")
			M.contents += new/obj/Fuuton_Master
			M.Class = "Fuuton Master"
			M.rank2 = "Master"
			M.srank = "B-"
		if(Master == "Katon")
			M.contents += new/obj/Katon_Master
			M.Class = "Katon Master"
			M.rank2 = "Master"
			M.srank = "B-"
		if(Master == "Raiton")
			M.contents += new/obj/Raiton_Master
			M.Class = "Raiton Master"
			M.rank2 = "Master"
			M.srank = "B-"
		if(Master == "Suiton")
			M.contents += new/obj/Suiton_Master
			M.Class = "Suiton Master"
			M.rank2 = "Master"
			M.srank = "B-"
		if(Master == "Blacksmith")
			M.Blacksmith = 1
			M.contents += new/obj/Master_Blacksmith
			M.contents += new/obj/items/Citem/Hatchet
			M.contents += new/obj/items/Citem/Pickaxe
			M.contents += new/obj/items/Citem/tools/Anvil
			M.contents += new/obj/items/Citem/tools/Crafting_Manual
		Admin_Logs+="<br>[usr]([usr.key]) has made [M] a Master Blacksmith."
		SaveLogs()

obj/Master_Blacksmith
	verb
		Make_Student()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
			var/mob/M=input("Who would you like to make a Blacksmith Trainee?") in V
			M.Student=1
			M.Cap+=rand(10,100)
		Create_Katana_Hilt_And_Sheathe()
			set category = "Rank"
			usr.contents += new/obj/items/Citem/Katana_Hilt
			usr.contents += new/obj/items/Citem/Katana_Sheathe
			usr<<"You create a hilt and sheathe for a new Katana."
		Create_Chakra_Orb()
			set category = "Rank"
			usr.contents += new/obj/items/Citem/Chakra_Orb
			usr<<"You create an orb of chakra used to create exploding tags."
		Create_Paper()
			set category = "Rank"
			usr.contents += new/obj/items/Citem/Paper
			usr<<"You prepare a sheet of paper."

obj/Blacksmith
	verb
		Create_Katana_Hilt_And_Sheathe()
			set category = "Rank"
			usr.contents += new/obj/items/Citem/Katana_Hilt
			usr.contents += new/obj/items/Citem/Katana_Sheathe
			usr<<"You create a hilt and sheathe for a new Katana."
		Create_Chakra_Orb()
			set category = "Rank"
			usr.contents += new/obj/items/Citem/Chakra_Orb
			usr<<"You create an orb of chakra used to create exploding tags."
		Create_Paper()
			set category = "Rank"
			usr.contents += new/obj/items/Citem/Paper
			usr<<"You prepare a sheet of paper."
		Create_Lockpick()
			set category = "Rank"
			usr.contents += new/obj/items/Citem/

obj/Genjutsu_Master
	verb
		Make_Student()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
			var/mob/M=input("Who would you like to make a Genjutsu Style: Student?") in V
			M.Student=1
			M.Cap+=rand(10,100)


obj/Medical_Master
	verb
		Make_Student()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
			var/mob/M=input("Who would you like to make a Medical Style: Student?") in V
			M.Student=1
			M.Cap+=rand(10,100)

obj/Doton_Master
	verb
		Make_Student()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
			var/mob/M=input("Who would you like to make a Doton Style: Student?") in V
			M.Student=1
			M.Cap+=rand(10,100)

obj/Fuuton_Master
	verb
		Make_Student()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
			var/mob/M=input("Who would you like to make a Fuuton Style: Student?") in V
			M.Student=1
			M.Cap+=rand(10,100)

obj/Raiton_Master
	verb
		Make_Student()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
			var/mob/M=input("Who would you like to make a Raiton Style: Student?") in V
			M.Student=1
			M.Cap+=rand(10,100)

obj/Suiton_Master
	verb
		Make_Student()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
			var/mob/M=input("Who would you like to make a Suiton Style: Student?") in V
			M.Student=1
			M.Cap+=rand(10,100)

obj/Katon_Master
	verb
		Make_Student()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
			var/mob/M=input("Who would you like to make a Katon Style: Student?") in V
			M.Student=1
			M.Cap+=rand(10,100)