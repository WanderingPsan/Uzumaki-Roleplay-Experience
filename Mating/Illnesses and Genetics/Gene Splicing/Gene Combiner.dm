mob/var
	GP1
	GP2

obj/items/Citem/tools/Gene_Combiner
	icon = 'Splicing.dmi'
	icon_state = "combinerOff"
	Click()
		winshow(usr,"Combiner",1)
	verb
		Bolt()
			if(!src.Bolted)
				src.Bolted = 1
				usr<<"You bolt the [src]."
			else
				if(src.Bolter == usr)
					src.Bolted = 0
					usr<<"You unbolt the [src]."
				else
					usr<<"You cannot unbolt this because you didn't bolt it."
		Splice()
			set hidden = 1
			set src in view(2)
			src.icon_state = "combinerOn"
			if(usr.GG1 == null)
				return
			if(usr.GG2 == null)
				return
			usr.G1 = null
			usr.G2 = null
			usr << output(usr.G1,"Combiner.TC")
			usr << output(usr.G2,"Combiner.BC")

			sleep(50)

			var/obj/items/Citem/tools/Gene_Splicer/C = new(usr)
			C.full = 1
			C.icon_state = "splicerF"
			for(var/obj/Gene/G in src.contents)
				C.contents += G

			usr<<"All done."

			src.icon_state = "combinerDone"
			sleep(20)
			src.icon_state = "combinerOff"





