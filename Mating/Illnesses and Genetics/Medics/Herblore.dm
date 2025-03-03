

obj/items/herblore
	Gathering_Scissors
		icon='Scissors.dmi'
		suffix = "You must have these in order to pick berries and herbs from the various bushes around the world."

obj/items/herb/grass
	Health_Herb
		icon = 'Herbs.dmi'
		icon_state="healthflower"
	Poison_Herb
		icon = 'Herbs.dmi'
		icon_state ="manaflower"
	Chakra_Herb
		icon = 'Herbs.dmi'
		icon_state = "staminaflower"
	Spinach
		icon = 'Herbs.dmi'
		icon_state = "Spinach"
	Red_Pepper
		icon = 'Herbs.dmi'
		icon_state = "Chili"
	Curry_Herb
		icon = 'Herbs.dmi'
		icon_state = "Curry"

obj/herbpicking
	Bush_Herbs
		var/Inven = 10
		icon = 'Herbs.dmi'
		icon_state = "bush2"
		verb
			Pick()
				set src in oview(1)
				var/obj/gathering_scissors = locate(/obj/items/herblore/Gathering_Scissors) in usr.contents
				if(gathering_scissors)
					if(src.Inven>0)
						usr << "<b>You begin to search for any herbs."
						sleep(10)
						var/Rang = rand(1,4)
						if(Rang==1)
							usr<<"You've found some Spinach."
							usr.contents += new/obj/items/herb/grass/Spinach
							src.Inven-=1
						if(Rang==2)
							usr<<"You've found a Red Pepper."
							usr.contents += new/obj/items/herb/grass/Red_Pepper
							src.Inven-=1
						if(Rang==3)
							usr<<"You've found a Curry Herb."
							usr.contents += new/obj/items/herb/grass/Curry_Herb
							src.Inven-=1
						if(Rang==4)
							usr<<"You fail to find anything sadly..."
					else
						usr<<"This plant is empty. Check Back later."
						sleep(5000)
						src.Inven+=5
						sleep(5000)
						src.Inven+=5
				else
					usr << "<b>You need a pair of gathering scissors in order to gather herbs."
	Grass_Herbs
		var/Inven=10
		icon = 'Herbs.dmi'
		icon_state = "bush"
		verb
			Pick()
				set src in oview(1)
				var/obj/gathering_scissors = locate(/obj/items/herblore/Gathering_Scissors) in usr.contents
				if(gathering_scissors)
					if(src.Inven>0)
						usr << "<b>You begin to search for any herbs."
						sleep(10)
						var/Rang = rand(1,4)
						if(Rang==1)
							usr<<"You've found a Health Herb."
							usr.contents += new/obj/items/herb/grass/Health_Herb
							src.Inven-=1
						if(Rang==2)
							usr<<"You've found a Poison Herb."
							usr.contents += new/obj/items/herb/grass/Poison_Herb
							src.Inven-=1
						if(Rang==3)
							usr<<"You've found a Chakra Herb."
							usr.contents += new/obj/items/herb/grass/Chakra_Herb
							src.Inven-=1
						if(Rang==4)
							usr<<"You fail to find anything sadly..."
					else
						usr<<"This plant is empty. Check Back later."
						sleep(5000)
						src.Inven+=5
						sleep(5000)
						src.Inven+=5
				else
					usr << "<b>You need a pair of gathering scissors in order to gather herbs."