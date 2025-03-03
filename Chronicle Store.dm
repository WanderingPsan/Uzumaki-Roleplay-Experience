mob/NPC
	/*Chronicle_Clothes_Store
		icon='NPCs.dmi'
		icon_state="Shop"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What can i help you with?") in typesof(/obj/items/Clothing) + list("Cancel")
	Chronicle_Weapon_Store
		icon='NPCs.dmi'
		icon_state="Shop"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What can i help you with?") in typesof(/obj/items/Weapon) + list("Cancel")*/

	Chronicle_Store
		icon='NPCs.dmi'
		icon_state="Shop"
		attackable=0
		verb/Talk()
			set src in view(2)
			var/varItem
			var/varType=input("What can I help you with?")in list("Weapon","Clothing","Food","Cancel")
			if(varType=="Weapon") varItem=input("What do you want to make?","Buy Weapon") in typesof(/obj/items/Weapon/) + list("Cancel")
			if(varType=="Clothing") varItem=input("What do you want to make?","Buy Clothing") in typesof(/obj/items/Clothing/) + list("Cancel")
			if(varType=="Food") varItem=input("What do you want?","Buy Food") in typesof(/obj/items/Food/) + typesof(/obj/items/Drink/) + list("Cancel")
			if(varItem=="Cancel") return
			new varItem(locate(x,y-1,z))



