mob/var/list/B1= list()
mob/var/list/B2= list()
mob/var/list/B3= list()
mob/var/list/B4= list()
mob/var/list/B5= list()
mob/var/list/B6= list()
mob/var/list/B7= list()
mob/var/list/B8= list()
mob/var/list/B9= list()
mob/var
	BS1=null
	BS2=null
	BS3=null
	BS4=null
	BS5=null
	BS6=null
	BS7=null
	BS8=null
	BS9=null

obj/items/MouseDrag(over_object,src_location,over_location,src_control,over_control,params)
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


obj/items/Citem/MouseDrop(over_object=src,src_location,over_location,src_control,over_control,params)
	if(src_control == "Anvil.TL")
		if(over_control == "World.Tabz")
			usr.BS1 = null
			usr.contents += src
			usr << output(usr.BS1,"Anvil.TL")
	if(src_control== "Anvil.TC")
		if(over_control == "World.Tabz")
			usr.BS2 = null
			usr.contents += src
			usr << output(usr.BS2,"Anvil.TC")
	if(src_control=="Anvil.TR")
		if(over_control == "World.Tabz")
			usr.BS3 = null
			usr.contents += src
			usr << output(usr.BS3,"Anvil.TR")
	if(src_control=="Anvil.CL")
		if(over_control == "World.Tabz")
			usr.BS4 = null
			usr.contents += src
			usr << output(usr.BS4,"Anvil.CL")
	if(src_control=="Anvil.C")
		if(over_control == "World.Tabz")
			usr.BS5 = null
			usr.contents += src
			usr << output(usr.BS5,"Anvil.C")
	if(src_control=="Anvil.CR")
		if(over_control == "World.Tabz")
			usr.BS6 = null
			usr.contents += src
			usr << output(usr.BS6,"Anvil.CR")
	if(src_control=="Anvil.BL")
		if(over_control == "World.Tabz")
			usr.BS7 = null
			usr.contents += src
			usr << output(usr.BS7,"Anvil.BL")
	if(src_control=="Anvil.BC")
		if(over_control == "World.Tabz")
			usr.BS8 = null
			usr.contents += src
			usr << output(usr.BS8,"Anvil.BC")
	if(src_control=="Anvil.BR")
		if(over_control == "World.Tabz")
			usr.BS9 = null
			usr.contents += src
			usr << output(usr.BS9,"Anvil.BR")





	if(src in usr.contents)
		if(src_control == "World.Tabz")
			if(over_control == "Anvil.TL")
				usr.BS1 = src
				src.loc = usr.B2
				usr << output(usr.BS1,"Anvil.TL")

			if(over_control == "Anvil.TC")
				usr.BS2 = src
				src.loc = usr.B2
				usr << output(usr.BS2,"Anvil.TC")

			if(over_control == "Anvil.TR")
				usr.BS3 = src
				src.loc = usr.B3
				usr << output(usr.BS3,"Anvil.TR")

			if(over_control == "Anvil.CL")
				usr.BS4 = src
				src.loc = usr.B4
				usr << output(usr.BS4,"Anvil.CL")

			if(over_control == "Anvil.C")
				usr.BS5 = src
				src.loc = usr.B5
				usr << output(usr.BS5,"Anvil.C")

			if(over_control == "Anvil.CR")
				usr.BS6 = src
				src.loc = usr.B6
				usr << output(usr.BS6,"Anvil.CR")

			if(over_control == "Anvil.BL")
				usr.BS7 = src
				src.loc = usr.B7
				usr << output(usr.BS7,"Anvil.BL")

			if(over_control == "Anvil.BC")
				usr.BS8 = src
				src.loc = usr.B8
				usr << output(usr.BS8,"Anvil.BC")

			if(over_control == "Anvil.BR")
				usr.BS9 = src
				src.loc = usr.B9
				usr << output(usr.BS9,"Anvil.BR")



//////////////////////////////////////////////////////////////////////////////










obj/items/ore/MouseDrop(over_object=src,src_location,over_location,src_control,over_control,params)

	if(src in usr.contents)
		if(src_control == "World.Tabz")
			if(over_control == "Forge.Foga")
				if(istype(src,/obj/items/ore/Iron_Ore))
					usr.contents += new /obj/items/Citem/Iron_Bar
					usr<<"You have forged an Iron Bar"
					del src
				if(istype(src,/obj/items/ore/Aeratum_Ore))
					usr.contents += new /obj/items/Citem/Aeratum_Bar
					usr<<"You have forged an Aeratum Bar"
					del src