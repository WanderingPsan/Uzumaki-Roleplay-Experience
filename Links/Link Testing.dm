mob/Topic(href,href_list[],hsrc)
	switch(href_list["action"])
		if("start")
			usr<< "Starting the game..."
		if("checkclan")
			usr<<browse(src.ClanSubmit,"window=Clan Submit;size=450x400")
		if("checkjutsu")
			usr<<browse(src.JutsuSubmit,"window=Clan Submit;size=450x400")
		if("respond")
			var/msg = input("What is the message?") as text
			src << "[msg] - [usr.displaykey]"
			for(var/mob/M in world)
				if(M.Admin)
					M<<"To [src]([src.displaykey]): [msg] <br> From: [usr.displaykey]"
		if("readsuggestion")
			usr<<browse(Suggestions,"window=Suggestions;size=500x350")
		else
			return ..()