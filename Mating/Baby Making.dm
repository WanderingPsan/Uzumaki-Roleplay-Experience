mob/var
	Mother = ""
	Father = ""



obj/items
	Baby
		var/Mother = ""
		var/Father = ""
		icon='Swaddle.dmi'
		verb
			Name()
				var/newname = input("What will you name it?") as text
				src.name = newname
		Click()
			if(src in usr.contents)
				usr<<"This baby belongs to [src.Father] and [src.Mother]"
				switch(input("Would you like to become this baby?") in list ("Yes","No"))
					if("Yes")
						for(var/obj/Gene/G in src)
							G.loc=locate(usr.contents)
						if(usr.Female)
							usr<<"You are now this baby."
							usr.Oicon = 'BabyGirl.dmi'
							usr.icon = 'BabyGirl.dmi'
							usr.name = src.name
						else
							usr<<"You are now this baby."
							usr.Oicon = 'BabyBoy.dmi'
							usr.icon = 'BabyBoy.dmi'
							usr.name = src.name

mob/verb
	Mate(mob/M in view(1))
		if(!usr.Female&&M.Female || usr.Female&&!M.Female)
			var/consent = input(M,"[usr] would like to mate with you! Will you accept?")in list("Yes","No")
			if(consent == "Yes")
				view()<<"[usr] and [M] decide to get some privacy."
				var/obj/Gene/G
				var/list/O = new/list
				var/list/J = new/list

				for(G in usr.contents)
					var/obj/Gene/GLU = new G
					O.Add(GLU)
				for(G in M.contents)
					var/obj/Gene/GLUP = new G
					J.Add(GLUP)
				var/obj/items/Baby/U = new/obj/items/Baby
				M.contents += U
				for(G in O)
					U.contents += G
				for(G in J)
					U.contents += G
				if(usr.Female)
					U.Mother = "[usr]"
					U.Father = "[M]"
				if(!usr.Female)
					U.Mother = "[M]"
					U.Father = "[usr]"
			if(consent == "No")
				input("RAPE!?")in list("Yes","No")
				if("Yes")
					usr<<"You're a sick individual, I hope you know that..."
					return
				if("No")
					usr<<"Glad to hear that you're not a twisted fuck."
					return