mob/var
	RawBaconStore = 0
	BaconStore = 0
	CheeseStore = 0
	PotatoStore = 0
	CarrotStore = 0
	CabbageStore = 0
	TomatoStore = 0
	TurnipStore = 0
	BunStore = 0
	BeefStore = 0
	PattyStore = 0
	SFishStore = 0
	MFishStore = 0
	BFishStore = 0
	FryStore = 0
	Cookin = 0

mob/verb
	Toggle_Cooking_Tab()
		if(!usr.Cookin)
			usr.Cookin = 1
		else
			usr.Cookin = 0


obj/items/Citem/tools/Kitchen
	icon = 'Stove.dmi'
	Click()
		winshow(usr,"Stove",1)
	verb
		KoolAidMake()
			set hidden = 1
			set src in view(2)
			if(locate(/obj/items/Food/KoolAidPowder) in usr.contents)
				usr<<"You make some Purple Drank."
				usr.contents += new/obj/items/Drink/Purple_Drank
				for(var/obj/items/Food/KoolAidPowder/A in usr.contents)
					del A
		PattyCook()
			set hidden = 1
			set src in view(2)
			if(usr.BeefStore >= 1)
				usr<<"You grill up some ground beef and make a couple of patties."
				usr.contents += new/obj/items/Food/Beef_Patty
				usr.contents += new/obj/items/Food/Beef_Patty
				usr.BeefStore -= 1
		HamburgerCook()
			set hidden = 1
			set src in view(2)
			if(usr.PattyStore >= 1)
				if(usr.BunStore >= 1)
					usr<<"You grill up the beef patty before placing it between the buns and preparing it for consumption."
					usr.contents += new/obj/items/Food/Burger
					usr.PattyStore -= 1
					usr.BunStore -= 1
		CheeseBurgerCook()
			set hidden = 1
			set src in view(2)
			if(usr.PattyStore >= 1)
				if(usr.BunStore >= 1)
					if(usr.CheeseStore >= 1)
						usr<<"You grill up the beef patty before placing it on the bun and laying a slice of cheese on top."
						usr.contents += new/obj/items/Food/Cheeseburger
						usr.PattyStore -= 1
						usr.BunStore -= 1
						usr.CheeseStore -= 1
		BaconCheeseBurgerCook()
			set hidden = 1
			set src in view(2)
			if(usr.PattyStore >= 1)
				if(usr.BunStore >= 1)
					if(usr.CheeseStore >= 1)
						if(usr.BaconStore >= 1)
							usr<<"You grill up the beef patty before placing it on the bun and laying a slice of cheese on top. You fry a few pieces of bacon before adding them to the sandwich."
							usr.contents += new/obj/items/Food/Bacon_Cheeseburger
							usr.PattyStore -= 1
							usr.BunStore -= 1
							usr.CheeseStore -= 1
							usr.BaconStore -= 1
		FrenchFryCook()
			set hidden = 1
			set src in view(2)
			if(usr.FryStore >= 1)
				usr<<"You deep fry the french fries."
				usr.contents += new/obj/items/Food/Fries
				usr.FryStore -= 1
		BakedPotatoCook()
			set hidden = 1
			set src in view(2)
			if(usr.PotatoStore >= 1)
				usr<<"You bake the potato and add a bit of butter to it."
				usr.contents += new/obj/items/Food/Baked_Potato
				usr.PotatoStore -= 1
		SmallFishFry()
			set hidden = 1
			set src in view(2)
			if(usr.SFishStore >= 1)
				usr<<"You deep fry a small fish."
				usr.contents += new/obj/items/Food/Small_Fish_Fry
				usr.SFishStore -= 1
		MediumFishFry()
			set hidden = 1
			set src in view(2)
			if(usr.MFishStore >= 1)
				usr<<"You deep fry a medium fish."
				usr.contents += new/obj/items/Food/Med_Fish_Fry
				usr.SFishStore -= 1
		BigFishFry()
			set hidden = 1
			set src in view(2)
			if(usr.BFishStore >= 1)
				usr<<"You deep fry a Big fish."
				usr.contents += new/obj/items/Food/Big_Fish_Fry
				usr.SFishStore -= 1
		BaconCook()
			set hidden = 1
			set src in view(2)
			if(usr.RawBaconStore >= 1)
				usr<<"You fry up a few pieces of bacon."
				usr.contents += new/obj/items/Food/Bacon
				usr.RawBaconStore -= 1


		Store_In_Fridge()
			set hidden = 1
			set src in view(3)
			if(istype(usr.FS1,/obj/items/Food/Bacon))
				usr.BaconStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Cheese))
				usr.CheeseStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Potato))
				usr.PotatoStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Uncooked_Fries))
				usr.FryStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Buns))
				usr.BunStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Carrot))
				usr.CarrotStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Cabbage))
				usr.CabbageStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Turnip))
				usr.TurnipStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Tomato))
				usr.TomatoStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/GroundBeef))
				usr.BeefStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Small_Fish))
				usr.SFishStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Med_Fish) || istype(usr.FS1,/obj/items/Food/Med_Fish2) || istype(usr.FS1,/obj/items/Food/Med_Fish3))
				usr.MFishStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Big_Fish))
				usr.BFishStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Raw_Bacon))
				usr.RawBaconStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")
			if(istype(usr.FS1,/obj/items/Food/Beef_Patty))
				usr.PattyStore += 1
				usr.FS1 = null
				usr << output(usr.FS1,"Stove.Fridge")



////////////////////////////////////////////////////////////////////

			if(istype(usr.FS2,/obj/items/Food/Raw_Bacon))
				usr.BaconStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Cheese))
				usr.CheeseStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Potato))
				usr.PotatoStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Uncooked_Fries))
				usr.FryStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Buns))
				usr.BunStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Carrot))
				usr.CarrotStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Cabbage))
				usr.CabbageStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Turnip))
				usr.TurnipStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Tomato))
				usr.TomatoStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/GroundBeef))
				usr.BeefStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Small_Fish))
				usr.SFishStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Med_Fish) || istype(usr.FS1,/obj/items/Food/Med_Fish2) || istype(usr.FS1,/obj/items/Food/Med_Fish3))
				usr.MFishStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Big_Fish))
				usr.BFishStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Raw_Bacon))
				usr.RawBaconStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")
			if(istype(usr.FS2,/obj/items/Food/Beef_Patty))
				usr.PattyStore += 1
				usr.FS2 = null
				usr << output(usr.FS2,"Stove.Fridge2")




