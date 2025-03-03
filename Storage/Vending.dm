obj/items/Citem/tools/Vending_Machine
	icon = 'Vending.dmi'
	density = 1
	Click()
		winshow(usr,"Vending",1)
	verb
		VendSoda()
			set src in view(2)
			set hidden = 1
			if(usr.Yen >= 50)
				usr<<"You buy a soda."
				usr.contents += new/obj/items/Drink/Soda
				usr.Yen -= 50
			else
				usr<<"You don't have enough money. It costs 50."
		VendWater()
			set src in view(2)
			set hidden = 1
			if(usr.Yen >= 50)
				usr<<"You buy a water."
				usr.contents += new/obj/items/Drink/Water
				usr.Yen -= 50
		VendPurpleDrank()
			set src in view(2)
			set hidden = 1
			if(!usr.Yen >= 50)
				usr<<"That costs fifty Yen!"
				return
			usr<<"You buy some purple drank."
			usr.contents += new/obj/items/Drink/Purple_Drank
			usr.Yen -= 50
		VendChips()
			set src in view(2)
			set hidden = 1
			if(!usr.Yen >= 50)
				usr<<"That costs fifty Yen!"
				return
			usr<<"You buy some chips."
			usr.contents += new/obj/items/Food/Chips
			usr.Yen -= 50
		VendCookie()
			set src in view(2)
			set hidden = 1
			if(!usr.Yen >= 50)
				usr<<"That costs fifty Yen!"
				return
			usr<<"You buy a cookie."
			usr.contents += new/obj/items/Food/Cookie
			usr.Yen -= 50
		VendMilk()
			set src in view(2)
			set hidden = 1
			if(!usr.Yen >= 50)
				usr<<"That costs fifty Yen!"
				return
			usr<<"You buy some milk."
			usr.contents += new/obj/items/Drink/Milk
			usr.Yen -= 50
		VendOJ()
			set src in view(2)
			set hidden = 1
			if(!usr.Yen >= 50)
				usr<<"That costs fifty Yen!"
				return
			usr<<"You buy some Orange Juice."
			usr.contents += new/obj/items/Drink/Orange_Juice
			usr.Yen -= 50
		VendChoco()
			set src in view(2)
			set hidden = 1
			if(!usr.Yen >= 50)
				usr<<"That costs fifty Yen!"
				return
			usr<<"You buy a chocolate bar."
			usr.contents += new/obj/items/Food/Chocolate_Bar
			usr.Yen -= 50
		VendBun()
			set src in view(2)
			set hidden = 1
			if(!usr.Yen >= 50)
				usr<<"That costs fifty Yen!"
				return
			usr<<"You buy a honey bun."
			usr.contents += new/obj/items/Food/Honey_Bun
			usr.Yen -= 50
		VendRedDrank()
			set src in view(2)
			set hidden = 1
			if(!usr.Yen >= 50)
				usr<<"That costs fifty Yen!"
				return
			usr<<"You buy some red drank."
			usr.contents += new/obj/items/Drink/Red_Drank
			usr.Yen -= 50