obj/items/Citem/Seed_Bag
	icon = 'SeedBag.dmi'

	Carrot_Seeds
		icon_state = "carr"
		verb
			Open()
				usr.contents += new/obj/items/Food/Carrot_Seeds
				usr.contents += new/obj/items/Food/Carrot_Seeds
				del src
	Turnip_Seeds
		icon_state = "turn"
		verb
			Open()
				usr.contents += new/obj/items/Food/Turnip_Seeds
				usr.contents += new/obj/items/Food/Turnip_Seeds
				del src
	Cabbage_Seeds
		icon_state = "cabb"
		verb
			Open()
				usr.contents += new/obj/items/Food/Cabbage_Seeds
				usr.contents += new/obj/items/Food/Cabbage_Seeds
				del src
	Tomato_Seeds
		icon_state = "toma"
		verb
			Open()
				usr.contents += new/obj/items/Food/Tomato_Seeds
				usr.contents += new/obj/items/Food/Tomato_Seeds
				del src






