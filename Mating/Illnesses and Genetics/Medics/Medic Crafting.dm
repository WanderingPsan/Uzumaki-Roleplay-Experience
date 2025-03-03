mob/var/list/M1= list()
mob/var/list/M2= list()
mob/var/list/M3= list()
mob/var/list/M4= list()
mob/var/list/M5= list()
mob/var/list/M6= list()

mob/var
	MS1=null
	MS2=null
	MS3=null
	MS4=null
	MS5=null
	MS6=null


obj/items/MouseDrag(over_object,src_location,over_location,src_control,over_control,params)
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


obj/items/herb/MouseDrop(over_object=src,src_location,over_location,src_control,over_control,params)
	if(src_control == "MediPot.TL")
		if(over_control == "World.Tabz")
			usr.MS1 = null
			usr.contents += src
			usr << output(usr.MS1,"MediPot.TL")
	if(src_control== "MediPot.TC")
		if(over_control == "World.Tabz")
			usr.MS2 = null
			usr.contents += src
			usr << output(usr.MS2,"MediPot.TC")
	if(src_control=="MediPot.TR")
		if(over_control == "World.Tabz")
			usr.MS3 = null
			usr.contents += src
			usr << output(usr.MS3,"MediPot.TR")
	if(src_control=="MediPot.BL")
		if(over_control == "World.Tabz")
			usr.MS4 = null
			usr.contents += src
			usr << output(usr.MS4,"MediPot.BL")
	if(src_control=="MediPot.BC")
		if(over_control == "World.Tabz")
			usr.MS5 = null
			usr.contents += src
			usr << output(usr.MS5,"MediPot.BC")
	if(src_control=="MediPot.BR")
		if(over_control == "World.Tabz")
			usr.MS6 = null
			usr.contents += src
			usr << output(usr.MS6,"MediPot.BR")





	if(src in usr.contents)
		if(src_control == "World.Tabz")
			if(over_control == "MediPot.TL")
				usr.MS1 = src
				src.loc = usr.M2
				usr << output(usr.MS1,"MediPot.TL")

			if(over_control == "MediPot.TC")
				usr.MS2 = src
				src.loc = usr.M2
				usr << output(usr.MS2,"MediPot.TC")

			if(over_control == "MediPot.TR")
				usr.MS3 = src
				src.loc = usr.M3
				usr << output(usr.MS3,"MediPot.TR")

			if(over_control == "MediPot.BL")
				usr.MS4 = src
				src.loc = usr.M4
				usr << output(usr.MS4,"MediPot.BL")

			if(over_control == "MediPot.BC")
				usr.MS5 = src
				src.loc = usr.M5
				usr << output(usr.MS5,"MediPot.BC")

			if(over_control == "MediPot.BR")
				usr.MS6 = src
				src.loc = usr.M6
				usr << output(usr.MS6,"MediPot.BR")


