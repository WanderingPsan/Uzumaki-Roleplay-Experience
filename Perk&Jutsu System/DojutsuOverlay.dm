mob/proc
	ByakuganNetwork()
		if(src.Byakugan)
			for(var/mob/M in oviewers())
				if(!istype(M,/mob/Bunshin/))
					for(var/I in src.client.images)
						del(I)
					var/image/I = new('ChakraNetwork.dmi',M,"[M.icon_state]",FLY_LAYER)
					client.images += I
			spawn(50)
			src.ByakuganNetwork()
		else
			for(var/I in src.client.images)
				del(I)
