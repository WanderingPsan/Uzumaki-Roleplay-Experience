obj/items/Food


obj/Farmer


obj
	Soil
		icon = 'Dirt.dmi'
		verb
			Plant()
				switch(input("What would you like to Plant?") in list ("Carrots","Turnips","Cabbages","Tomatos","Potato","Cancel"))
					if("Carrots")
						if(locate(/obj/items/Food/Carrot_Seeds,usr.contents))
							set src in oview(0)
							for(var/obj/items/Food/Carrot_Seeds/B in usr.contents)
								del(B)
							var/obj/items/Food/Carrot_Seeds/S = new/obj/items/Food/Carrot_Seeds(usr.loc)
							sleep(rand(900,1200))//time until it is fully grown!
							del(S)
							new/obj/items/Food/Carrot(src.loc)
							new/obj/items/Food/Carrot(src.loc)
							new/obj/items/Food/Carrot(src.loc)

					if("Turnips")
						if(locate(/obj/items/Food/Turnip_Seeds,usr.contents))
							set src in oview(0)
							for(var/obj/items/Food/Turnip_Seeds/B in usr.contents)
								del(B)
							var/obj/items/Food/Turnip_Seeds/S = new/obj/items/Food/Turnip_Seeds(usr.loc)
							sleep(rand(800,1000))//time until it is fully grown!
							del(S)
							new/obj/items/Food/Turnip(src.loc)
							new/obj/items/Food/Turnip(src.loc)
							new/obj/items/Food/Turnip(src.loc)

					if("Tomatos")
						if(locate(/obj/items/Food/Tomato_Seeds,usr.contents))
							set src in oview(0)
							for(var/obj/items/Food/Tomato_Seeds/B in usr.contents)
								del(B)
							var/obj/items/Food/Tomato_Seeds/S = new/obj/items/Food/Tomato_Seeds(usr.loc)
							sleep(rand(800,1000))//time until it is fully grown!
							del(S)
							new/obj/items/Food/Tomato(src.loc)
							new/obj/items/Food/Tomato(src.loc)
							new/obj/items/Food/Tomato(src.loc)

					if("Cabbages")
						if(locate(/obj/items/Food/Cabbage_Seeds,usr.contents))
							set src in oview(0)
							for(var/obj/items/Food/Cabbage_Seeds/B in usr.contents)
								del(B)
							var/obj/items/Food/Cabbage_Seeds/S = new/obj/items/Food/Cabbage_Seeds(usr.loc)
							sleep(rand(800,1000))//time until it is fully grown!
							del(S)
							new/obj/items/Food/Cabbage(src.loc)
							new/obj/items/Food/Cabbage(src.loc)
							new/obj/items/Food/Cabbage(src.loc)
					if("Potato")
						if(locate(/obj/items/Food/Potato,usr.contents))
							set src in oview(0)
							for(var/obj/items/Food/Potato/B in usr.contents)
								del(B)
							var/obj/items/Food/Potato/S = new/obj/items/Food/Potato(usr.loc)
							sleep(rand(800,1000))
							del(S)
							new/obj/items/Food/Potato(src.loc)
							new/obj/items/Food/Potato(src.loc)
							new/obj/items/Food/Potato(src.loc)

obj
	Fire
		icon = 'Turf.dmi'
		icon_state="firewood"
		verb
			Cook()
				if(locate(/obj/items/Food/Big_Fish,usr.contents))
					set src in oview(1)
					sleep(rand(150,350))
					for(var/obj/items/Food/Big_Fish/B in usr.contents)
						del(B)
					usr.contents += new/obj/items/Food/Big_Fish_Fry
				if(locate(/obj/items/Food/Med_Fish,usr.contents))
					set src in oview(1)
					sleep(rand(150,350))
					for(var/obj/items/Food/Med_Fish/B in usr.contents)
						del(B)
					usr.contents += new/obj/items/Food/Med_Fish_Fry
				if(locate(/obj/items/Food/Med_Fish2,usr.contents))
					set src in oview(1)
					sleep(rand(150,350))
					for(var/obj/items/Food/Med_Fish2/B in usr.contents)
						del(B)
					usr.contents += new/obj/items/Food/Med_Fish2_Fry
				if(locate(/obj/items/Food/Med_Fish3,usr.contents))
					set src in oview(1)
					sleep(rand(150,350))
					for(var/obj/items/Food/Med_Fish3/B in usr.contents)
						del(B)
					usr.contents += new/obj/items/Food/Med_Fish3_Fry
				if(locate(/obj/items/Food/Small_Fish,usr.contents))
					set src in oview(1)
					sleep(rand(150,350))
					for(var/obj/items/Food/Small_Fish/B in usr.contents)
						del(B)
					usr.contents += new/obj/items/Food/Small_Fish_Fry



obj
	Daisan
		icon = 'Daisan no Me.dmi'
		layer=MOB_LAYER+1






