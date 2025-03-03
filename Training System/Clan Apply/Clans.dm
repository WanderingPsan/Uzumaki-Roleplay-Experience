

mob
	var
		ClanSubmit={"<html><body><center><background color = "black"><font color ="grey" size = 2>"}

mob
	verb
		Apply_For_Custom_Clan()
			usr<<output("Understand that abuse of this -WILL- result in stiff penalties.","World.OOC")
			winshow(usr,"Clan",1)

		Verb_Apply()
			set hidden = 1
			set name = ".VerbalPlay"
			var/Crackers = winget(usr,"Clan.Hist","text")
			var/Cheese = winget(usr,"Clan.Kek","text")
			var/Ham = winget(usr,"Clan.Jut","text")
			var/Lettuce = winget(usr,"Clan.Nam","text")
			var/Tomato = winget(usr,"Clan.Vill","text")
			if(Crackers == "" )
				usr<<"Your clan's History is blank."
				return
			if(Cheese == "")
				usr<<"Your Clan's Abilities are blank."
			if(Ham == "")
				usr<<"Your Clans Jutsu is blank."
			if(Lettuce == "")
				usr<<"Your clan's Name is empty."
			if(Tomato == "")
				usr<<"Your clan's Village is empty."
			winshow(usr,"Clan",0)
			ClanSubmit+={"<html><body><center><background color = "black"><font color ="grey" size = 2><align left)<b>Clan Name:</b>[Lettuce]<br><b>Clan Village:</b>[Tomato]</align><b>Clan History:</b><br><hr><br>[Crackers]<br><br><b>Clan Kekkei Genkai:</b>[Cheese]<br><br><b>Example Jutsu:</b>[Ham]<br><hr><br>"}
			winset(usr,null,"Clan.Hist.text=null;Clan.Jut.text=null;Clan.Nam.text=null;Clan.Vill.text=null")
			var/list/O = new/list
			for(var/mob/M in world)
				O.Add(M)
			for(var/mob/P in O)
				if(P.Admin >= 1)
					P<<output("[src] has submitted a custom clan. Click <a href=?src=\ref[src];action=checkclan>here</a> to read!","World.OOC")
