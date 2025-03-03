obj/items/Citem/
	tools
		Backpouch
			icon='Herb Bag.dmi'
			icon_state="inv"
			suffix = "Double Click to view the contents."
			Click()
				if(src in usr.contents)
					if(!src.worn)
						src.worn = 1
						src.suffix = "**Equipped**"
						usr.overlays += src.icon
					else
						src.worn = 0
						src.suffix=""
						usr.overlays -= src.icon
			DblClick() //we click the capsule to show the tab, by setting a variable.
				if(src in usr.contents)
					if(!usr.captarget)
						usr.captarget = src
					else
						usr.captarget = null
			verb
				Store_Item()
					src.Store()
				Take_Item()
					src.Take()

			proc
				Store()
					var/list/O = new
					for(var/obj/items/B in usr.contents)
						O.Add(B)
					var/obj/R = input("What will you store?") in O + "Cancel"
					src.contents += R
					if("Cancel")
						return
				Take()
					var/list/O = new
					for(var/obj/items/B in src.contents)
						O.Add(B)
					var/obj/R = input("What will you take?") in O + "Cancel"
					usr.contents += R
					if("Cancel")
						return
