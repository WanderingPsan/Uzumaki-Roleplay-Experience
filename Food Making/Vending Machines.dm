obj/var
	ketchup_state = ""
	mustard_state = ""
	MKState = ""

obj/items/Drink
	Soda
		icon = 'Food.dmi'
		icon_state = "soda"
		Click()
			if(src in usr.contents)
				usr<<"You drink the soda."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 2
				usr.Calories += 10
				del src
	Water
		icon = 'Food.dmi'
		icon_state = "water"
		Click()
			if(src in usr.contents)
				usr<<"You drink the water."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 5
				usr.Calories += 5
				del src

	Purple_Drank
		icon = 'Food.dmi'
		icon_state = "KA"
		Click()
			if(src in usr.contents)
				usr<<"You drink the purple Kool-Aid."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 15
				usr.Calories += 20
				del src
	Red_Drank
		icon = 'Food.dmi'
		icon_state = "RKA"
		Click()
			if(src in usr.contents)
				usr<<"You drink the red Kool-Aid."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 15
				usr.Calories += 15
				del src

	Milk
		icon = 'Food.dmi'
		icon_state = "milk"
		Click()
			if(src in usr.contents)
				usr<<"You drink the milk."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 45
				usr.Calories += 15
				del src
	Orange_Juice
		icon = 'Food.dmi'
		icon_state = "OJ"
		Click()
			if(src in usr.contents)
				usr<<"You drink the Orange Juice."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 50
				usr.Calories += 20
				del src

obj/items/Food
	var
		Ketchupd = 0
		Mustardd = 0
	Honey_Bun
		icon = 'Food.dmi'
		icon_state = "cinnamon"
		Click()
			if(src in usr.contents)
				usr<<"You eat the soft and fluffy honey bun quickly."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 15
				usr.Calories += 60
				del src
	Chocolate_Bar
		icon = 'Food.dmi'
		icon_state = "choco"
		Click()
			if(src in usr.contents)
				usr<<"You unwrap the chocolate bar before nomming it down to nothing."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 10
				usr.Calories += 50
				del src
	Cookie
		icon = 'Food.dmi'
		icon_state = "cookie"
		Click()
			if(src in usr.contents)
				usr<<"You quickly devour the delicious cookie."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 8
				usr.Calories += 35
				del src

	Chips
		icon = 'Food.dmi'
		icon_state = "chip"
		Click()
			if(src in usr.contents)
				usr<<"You pop open the bag of chips and eat them."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 7
				usr.Calories += 50
				del src
	Fries
		icon = 'Food.dmi'
		icon_state = "fries"
		ketchup_state = "Kfries"
		mustard_state = "Mfries"
		MKState = "MKfries"
		Click()
			if(src in usr.contents)
				usr<<"You eat the fries."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 10
				usr.Calories += 120
				del src

	Burger
		icon = 'Food.dmi'
		icon_state = "burger"
		ketchup_state = "Kburger"
		mustard_state = "Mburger"
		MKState = "MKburger"
		Click()
			if(src in usr.contents)
				usr<<"You eat the burger."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 15
				usr.Calories += 300
				del src
	GroundBeef
		icon = 'Food.dmi'
		icon_state = "groundbeef"
		Click()
			if(src in usr.contents)
				usr<<"You cannot eat this. Store it in a refrigerator and cook it with a stove first."
				return
	Beef_Patty
		icon = 'Food.dmi'
		icon_state = "patty"
		Click()
			if(src in usr.contents)
				usr<<"You eat the beef patty."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 2
				usr.Calories += 80
				del src
	Raw_Bacon
		icon = 'Food.dmi'
		icon_state = "rawbacon"
		Click()
			if(src in usr.contents)
				usr<<"You cannot eat this. Store it in a fridge and cook it with a stove first."
				return
	Bacon
		icon = 'Food.dmi'
		icon_state = "bacon"
		ketchup_state = "Kbacon"
		mustard_state = "Mbacon"
		MKState = "MKbacon"
		Click()
			if(src in usr.contents)
				usr<<"You eat the bacon."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 17
				usr.Calories += 1000
				del src
	Buns
		icon = 'Food.dmi'
		icon_state = "buns"
		Click()
			if(src in usr.contents)
				usr<<"You eat the buns."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 1
				usr.Calories += 5
				del src

	Cheeseburger
		icon = 'Food.dmi'
		icon_state = "chzburger"
		ketchup_state = "Kchzburger"
		mustard_state = "Mchzburger"
		MKState = "MKchzburger"
		Click()
			if(src in usr.contents)
				usr<<"You eat the Cheeseburger."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 20
				usr.Calories += 1500
				del src

	Bacon_Cheeseburger
		icon = 'Food.dmi'
		icon_state = "bchzburger"
		ketchup_state = "Kbchzburger"
		mustard_state = "Mbchzburger"
		MKState = "MKbchzburger"
		Click()
			if(src in usr.contents)
				usr<<"You eat the Bacon Cheeseburger."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 30
				usr.Calories += 2500
				del src
	Baked_Potato
		icon = 'Food.dmi'
		icon_state = "bakedpotato"
		Click()
			if(src in usr.contents)
				usr<<"You eat the Baked Potato."
				if(usr.JConst < usr.maxJConst)
					usr.JConst += 30
				usr.Calories += 800
				del src

	Ramen
		icon='Ramen1.dmi'
		icon_state=""
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(10.0,12.5)
				icon_state="Empty"
				usr.Calories += 500
				sleep(1)
				del(src)


	Vegetable_Ramen
		icon='Ramen1.dmi'
		icon_state="1"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(10.4,15.2)
				icon_state="Empty"
				usr.Calories += 500
				sleep(1)
				del(src)
	Miso_Ramen
		icon='Ramen1.dmi'
		icon_state="2"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(10.5,17.7)
				icon_state="Empty"
				usr.Calories += 500
				sleep(1)
				del(src)

	Big_Fish
		icon='Fish.dmi'
		icon_state="26"
		Click()
			if(src in usr.contents)
				usr<<"You cannot eat this. Store it in a refrigerator and cook it with a stove first OR cook it on a campfire."
				return
	Big_Fish_Fry
		icon='Fish.dmi'
		icon_state="Fry"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst -=rand(15.7,20.7)
				icon_state="Done"
				usr.Calories += 150
				sleep(1)
				del(src)

	Med_Fish
		icon='Fish.dmi'
		icon_state="65"
		Click()
			if(src in usr.contents)
				usr<<"You cannot eat this. Store it in a refrigerator and cook it with a stove first OR cook it on a campfire."
				return
	Med_Fish_Fry
		icon='Fish.dmi'
		icon_state="Fry2"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(12.5,14.4)
				icon_state="Done"
				usr.Calories += 100
				sleep(1)
				del(src)

	Med_Fish2
		icon='Fish.dmi'
		icon_state="63"
		Click()
			if(src in usr.contents)
				usr<<"You cannot eat this. Store it in a refrigerator and cook it with a stove first OR cook it on a campfire."
				return

	Med_Fish2_Fry
		icon='Fish.dmi'
		icon_state="Fry4"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(12.5,14.4)
				icon_state="Done"
				usr.Calories += 100
				sleep(1)
				del(src)

	Med_Fish3
		icon='Fish.dmi'
		icon_state="68"
		Click()
			if(src in usr.contents)
				usr<<"You cannot eat this. Store it in a refrigerator and cook it with a stove first OR cook it on a campfire."
				return
	Med_Fish3_Fry
		icon='Fish.dmi'
		icon_state="Fry3"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(12.5,13.4)
				icon_state="Done"
				usr.Calories += 100
				sleep(1)
				del(src)

	Small_Fish
		icon='Fish.dmi'
		icon_state="54"
		Click()
			if(src in usr.contents)
				usr<<"You cannot eat this. Store it in a refrigerator and cook it with a stove first OR cook it on a campfire."
				return
	Uncooked_Fries
		icon = 'Food.dmi'
		icon_state = "ufries"
		Click()
			if(src in usr.contents)
				usr<<"You cannot eat this. Store it in a refrigerator and cook it with a stove first."
				return

	Small_Fish_Fry
		icon='Fish.dmi'
		icon_state="Fry5"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(3.9,5.7)
				icon_state="Done1"
				usr.Calories += 50
				sleep(1)
				del(src)

	Carrot_Seeds
		icon='Farm.dmi'
		icon_state="seeds"
	Turnip_Seeds
		icon='Farm.dmi'
		icon_state="Tuseeds"
	Cabbage_Seeds
		icon='Farm.dmi'
		icon_state="Cseeds"
	Tomato_Seeds
		icon='Farm.dmi'
		icon_state="Tseeds"
	Wheat
		icon='Farm.dmi'
		icon_state="wheat"

	Potato
		icon='Food.dmi'
		icon_state="potato"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(2.75,3.89)
				sleep(20)
				del(src)
		verb
			Julienne()
				usr<<"You turn the potato into fries to be cooked."
				usr.contents += new/obj/items/Food/Uncooked_Fries
				del src
	Carrot
		icon='Farm.dmi'
		icon_state="carrot2"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(2.75,3.89)
				sleep(20)
				del(src)
				if(prob(70))
					usr.contents += new/obj/items/Food/Carrot_Seeds
				if(prob(30))
					usr.contents += new/obj/items/Food/Carrot_Seeds
					usr.contents += new/obj/items/Food/Carrot_Seeds
					usr.contents += new/obj/items/Food/Carrot_Seeds

	Turnip
		icon='Farm.dmi'
		icon_state="turnip2"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(3.54,5.75)
				sleep(20)
				spawn(10) del(src)
				if(prob(60))
					usr.contents += new/obj/items/Food/Turnip_Seeds
				if(prob(25))
					usr.contents += new/obj/items/Food/Turnip_Seeds
					usr.contents += new/obj/items/Food/Turnip_Seeds

	Cabbage
		icon='Farm.dmi'
		icon_state="cabbage2"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(2.75,7.89)
				sleep(20)
				spawn(10) del(src)
				if(prob(60))
					usr.contents += new/obj/items/Food/Cabbage_Seeds
				if(prob(25))
					usr.contents += new/obj/items/Food/Cabbage_Seeds
					usr.contents += new/obj/items/Food/Cabbage_Seeds
	Tomato
		icon='Farm.dmi'
		icon_state="tomato2"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(4.89,5.29)
				sleep(20)
				spawn(10) del(src)
				if(prob(60))
					usr.contents += new/obj/items/Food/Tomato_Seeds
	KoolAidPowder
		icon = 'Food.dmi'
		icon_state = "purp"
		name = "Purple Drink Mix"

	Cheese
		icon = 'Food.dmi'
		icon_state = "chz"
		Click()
			if(src in usr.contents)
				if(usr.JConst >= usr.maxJConst)
					usr.JConst = usr.maxJConst
					return
				usr.JConst += rand(4.89,5.29)
				spawn(10)
				del(src)















	Condiment
		Ketchup
			icon = 'Food.dmi'
			icon_state = "ketchup"
			verb
				Add_To()
					var/list/L = new/list
					for(var/obj/items/Food/F in usr.contents)
						L.Add(F)
					var/obj/items/Food/A = input("Which food item do you want to add ketchup to?") in L + list("Cancel")
					if(A == null)
						return
					if(!A.Ketchupd&&!A.Mustardd)
						A.icon_state = "[A.ketchup_state]"
						A.Ketchupd = 1
						del src
					if(A.Ketchupd)
						usr<<"This already has Ketchup on it."
						return
					if(A.Mustardd)
						A.icon_state = "[A.MKState]"
						del src

		Mustard
			icon = 'Food.dmi'
			icon_state = "mustard"
			verb
				Add_To()
					var/list/L = new/list
					for(var/obj/items/Food/F in usr.contents)
						L.Add(F)
					var/obj/items/Food/A = input("Which food item do you want to add ketchup to?") in L + list("Cancel")
					if(A == null)
						return
					if(!A.Mustardd&&!A.Ketchupd)
						A.icon_state = "[A.mustard_state]"
						A.Mustardd = 1
						del src
					if(A.Mustardd)
						usr<<"This already has Mustard on it."
						return
					if(A.Ketchupd)
						A.icon_state = "[A.MKState]"
						del src

mob/NPC
	Food_Supplier
		icon='NPCs.dmi'
		icon_state="Tea"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What would you like to buy?") in list("Buns","Cheese","Water","Kool-Aid","Ground Beef","Bacon","Cancel"))
				if("Buns")
					if(usr.Yen >= 50)
						usr.contents += new/obj/items/Food/Buns
						usr.Yen -= 50
					else
						usr<<"You require 50 Yen for that."
				if("Cheese")
					if(usr.Yen >= 60)
						usr.contents += new/obj/items/Food/Cheese
						usr.Yen -= 60
					else
						usr<<"You require 60 Yen for that."
				if("Water")
					if(usr.Yen >= 45)
						usr.contents += new/obj/items/Drink/Water
						usr.Yen -= 45
					else
						usr<<"You require 45 Yen for that."
				if("Kool-Aid")
					if(usr.Yen >= 200)
						usr.contents += new/obj/items/Food/KoolAidPowder
						usr.Yen -= 200
					else
						usr<<"You require 200 Yen for that."
				if("Ground Beef")
					if(usr.Yen >= 500)
						usr.contents += new/obj/items/Food/GroundBeef
						usr.Yen -= 500
					else
						usr<<"You require 500 Yen for that."

				if("Bacon")
					if(usr.Yen >= 750)
						usr.contents += new/obj/items/Food/Raw_Bacon
						usr.Yen -= 750
					else
						usr<<"You require 750 Yen for that."


//mob/var/Thirst = 0
//mob/var/Hunger = 0