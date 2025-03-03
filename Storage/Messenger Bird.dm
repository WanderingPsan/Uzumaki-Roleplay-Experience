obj/items/Citem/tools/Messenger_Bird
	icon = 'Dove1.dmi'
	density = 0
	layer = 150
	verb
		Attach_Message()
			var/list/P = new/list
			for(var/obj/items/Scrolls/Scroll/A in usr.contents)
				P.Add(A)
			var/obj/B = input("Which scroll will you attach to the bird?")in P +list("Cancel")
			src.contents += B
		Send_Message()
			var/list/P = new/list
			for(var/mob/M in world)
				if(M.client)
					P.Add(M)
			var/mob/A = input("Who will you send the message to?")in P + list("Cancel")
			walk(src,EAST)
			sleep(250)
			src.loc = locate(A.x-6,A.y,A.z)
			sleep(7)
			walk(src,0)
			A.contents += src
			A<<"[usr] has sent you a message."
			for(var/obj/items/Scrolls/Scroll/B in src.contents)
				A.contents += B



obj/BirdMessage
	icon = 'Dove1.dmi'
	New()
		walk(src,EAST)
		sleep(75)
		del src

obj/BirdMessageRecieve
	icon = 'Dove1.dmi'
	New()
		walk(src,EAST)
		sleep(5)
		del src