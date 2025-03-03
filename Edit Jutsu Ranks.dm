/*mob/Admin3/verb
	Edit_Jutsu_Ranks()
		set category="Admin"
		if(!WritingJutsuRanks)
			WritingJutsuRanks=1
			for(var/mob/M) if(M.Admin) M<<"[usr] is editing the Jutsu Ranks..."
			Jutsu_Ranks=input(usr,"Edit","Edit Jutsu Ranks",Jutsu_Ranks) as message
			for(var/mob/F) if(F.Admin) F<<"[usr] is done editing the Jutsu Rules..."
			WritingJutsuRanks=0
			SaveJutsuRanks()
			LoadJutsuRanks() */

	Training_Fix()
		set category="Admin"
		for(var/mob/M in world)
			M.Training = 0
		world<<"[usr] has fixed the training verb for the world."