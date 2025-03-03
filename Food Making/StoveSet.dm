mob/var/list/F1= list()
mob/var/list/F2= list()


mob/var
	FS1=null
	FS2=null



obj/items/MouseDrag(over_object,src_location,over_location,src_control,over_control,params)
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)




obj/items/Food/MouseDrop(over_object=src,src_location,over_location,src_control,over_control,params)
	if(src_control == "Stove.Fridge")
		if(over_control == "World.Tabz")
			usr.FS1 = null
			usr.contents += src
			usr << output(usr.FS1,"Stove.Fridge")
	if(src_control == "Stove.Fridge2")
		if(over_control == "World.Tabz")
			usr.FS2 = null
			usr.contents += src
			usr << output(usr.FS2,"Stove.Fridge2")





	if(src_control == "World.Tabz")
		if(over_control == "Stove.Fridge")
			usr.FS1 = src
			src.loc = usr.F1
			usr << output(usr.FS1,"Stove.Fridge")
		if(over_control == "Stove.Fridge2")
			usr.FS2 = src
			src.loc = usr.F2
			usr << output(usr.FS2,"Stove.Fridge2")