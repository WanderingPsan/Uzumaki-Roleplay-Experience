mob/var/Checking = 0
obj/var/Checkit = 0
obj/items/Citem/tools
	Gene_Splicer
		var/full = 0
		icon = 'Splicing.dmi'
		icon_state = "splicerE"
		verb
			Label()
				set src in usr.contents
				var/newname = input("What will you label it?") as text
				if(newname==null)
					return
				src.name = newname


			Draw()
				set src in usr.contents
				if(src.full)
					usr<<"This Splicer is already full."
					return
				var/list/L = new/list
				var/obj/Gene/G
				var/obj/Illness/I
				for(var/mob/M in view(3))
					L.Add(M)
				var/mob/N = input("Who would you like to draw a sample from?") in L
				if(N == null)
					return
				src.icon_state = "splicerF"
				src.full = 1
				viewers()<<"[usr] takes some sort of small implement and draws something from [N]."
				N.JConst -= 70
				for(G in N.contents)
					var/obj/O = new G.type(usr)
					src.contents += O
				for(I in N.contents)
					var/obj/O = new I.type(usr)
					src.contents += O


			Inject()
				set src in usr.contents
				if(!src.full)
					usr<<"There's nothing in this."
					return
				var/list/L = new/list
				for(var/mob/M in view(3))
					L.Add(M)
				var/mob/N = input("Who would you like to inject this sample into?") in L
				if(N == null)
					return
				viewers()<<"[usr] takes some sort of small implement and injects something into [N]."
				N.JConst -= 70
				var/obj/Gene/G
				var/obj/Illness/I
				for(G in src.contents)
					var/obj/O = new G.type(src)
					N.contents += O
				for(I in src.contents)
					var/obj/O = new G.type(src)
					N.contents += O

			Check()
				usr.Checking = 1
				src.Checkit = 1
				sleep(500)
				usr.Checking = 0
				src.Checkit = 0