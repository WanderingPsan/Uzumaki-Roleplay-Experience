mob/var/list/G1= list()
mob/var/list/G2= list()
mob/var/list/G3= list()


mob/var
	GG1=null
	GG2=null






obj/items/MouseDrag(over_object,src_location,over_location,src_control,over_control,params)
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


obj/items/Citem/tools/Gene_Splicer/MouseDrop(over_object=src,src_location,over_location,src_control,over_control,params)
	if(src_control == "Combiner.TC")
		if(over_control == "World.Tabz")
			usr.GG1 = null
			usr.contents += src
			usr << output(usr.GG1,"Combiner.TC")
	if(src_control== "Combiner.BC")
		if(over_control == "World.Tabz")
			usr.GG2 = null
			usr.contents += src
			usr << output(usr.GG2,"Combiner.BC")




	if(src in usr.contents)
		if(src_control == "World.Tabz")
			if(over_control == "Combiner.TC")
				for(var/obj/Gene/G in src.contents)
					var/obj/E = locate(/obj/items/Citem/tools/Gene_Combiner/) in usr.contents
					if(E)
						for(var/obj/items/Citem/tools/Gene_Combiner/Z in usr.contents)
							Z.contents += G
							src.icon_state = "splicerE"
							src.full = 0
							usr<<"The genes held in the splicer are absorbed by the machine."
					else
						for(var/obj/items/Citem/tools/Gene_Combiner/Z in view(10))
							Z.contents += G
							src.icon_state = "splicerE"
							src.full = 0
							usr<<"The genes held in the splicer are absorbed by the machine."
				usr.GG1 = src
				src.loc = usr.G1
				usr << output(usr.GG1,"Combiner.TC")

			if(over_control == "Combiner.BC")
				for(var/obj/Gene/G in src.contents)
					var/obj/E = locate(/obj/items/Citem/tools/Gene_Combiner/) in usr.contents
					if(E)
						for(var/obj/items/Citem/tools/Gene_Combiner/Z in usr.contents)
							Z.contents += G
							src.icon_state = "splicerE"
							src.full = 0
							usr<<"The genes held in the splicer are absorbed by the machine."
					else
						for(var/obj/items/Citem/tools/Gene_Combiner/Z in view(10))
							Z.contents += G
							src.icon_state = "splicerE"
							src.full = 0
							usr<<"The genes held in the splicer are absorbed by the machine."
				usr.GG2 = src
				src.loc = usr.G2
				usr << output(usr.GG2,"Combiner.BC")

