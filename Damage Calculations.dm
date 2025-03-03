mob
	verb
		Compare_Stats()
			var/list/O = new
			for(var/mob/M in view(7))
				O.Add(M)
