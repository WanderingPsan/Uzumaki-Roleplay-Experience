obj/items/Citem/tools
	Cabinet
		icon = 'Cabinet.dmi'
		verb
			Store()
				set src in view(2)
				var/list/K = new/list
				for(var/obj/items/O in usr.contents)
					K.Add(O)
				var/obj/I = input("What would you like to store?") in K + list("Cancel")
				if(I==null)
					return
				src.contents += I

			Take()
				set src in view(2)
				var/list/K = new/list
				for(var/obj/items/O in src.contents)
					K.Add(O)
				var/obj/I = input("What would you like to take?") in K + list("Cancel")
				if(I==null)
					return
				usr.contents += I

//			Check_Contents()
//				winshow(usr,"Cabinet",1)
//				var/i = 1
//				for(var/obj/items/I in src.contents)
//					usr<<output(I,"Grid:1,[++i]")