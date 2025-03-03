obj
	Tailor
		var
			rate = 500
		verb
			Create_Item()
				if(usr.Yen >= src.rate)
					var/list/B = new/list()
					for(var/obj/items/Clothing/P in usr.contents)
						B.Add(P)
					for(var/obj/items/Weapon/Q in usr.contents)
						B.Add(Q)
					var/obj/items/Clothing/chiz = input("Which item will you change?") in B
					var/icon/A = input("Change icon to what?") as icon
					var/C = input("New Name is?") as text
					chiz.name = C
					chiz.icon = A
					usr.Yen -= src.rate
			Set_Price()
				var/price = input("What will your going rate be?") as num
				src.rate = price



