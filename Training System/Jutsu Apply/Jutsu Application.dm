var/list/Custom = list()

mob
	var
		JutsuSubmit={"<html><body><center><background color = "black"><font color ="grey" size = 2>"}

mob
	verb
		Apply_For_Custom_Jutsu()
			usr<<output("Understand that abuse of this -WILL- result in stiff penalties.","World.OOC")
			winshow(usr,"Jutsu",1)

		Jutsu_Apply()
			set hidden = 1
			set name = ".VerbalJutu"
			var/Crackers = winget(usr,"Jutsu.nombre","text")
			var/Cheese = winget(usr,"Jutsu.rank","text")
			var/Chips = winget(usr,"Jutsu.type","text")
			var/Chicken = winget(usr,"Jutsu.element","text")
			var/Chalupa = winget(usr,"Jutsu.drain","text")
			var/ChiChi = winget(usr,"Jutsu.desc","text")
			if(Crackers == "" )
				usr<<"Your Jutsu's name is blank."
				return
			if(Cheese == "")
				usr<<"Your Jutsu's Rank is blank."
			if(Chips== "")
				usr<<"Your Jutsu's type is blank."
			if(Chicken == "")
				usr<<"Your Jutsu's Element is empty."
			if(Chalupa == "")
				usr<<"Your jutsu's drain is empty."
			if(ChiChi == "")
				usr<<"Your jutsu's description is empty."
			winshow(usr,"Jutsu",0)
			JutsuSubmit+={"<html><body><center><background color = "black"><font color ="grey" size = 2><align left)<b>Jutsu Name:</b>[Crackers]<br><b>Jutsu Rank:</b>[Cheese]</align><b>Jutsu Type:</b><br><hr><br>[Chips]<br><br><b>Jutsu Element:</b>[Chicken]<br><br><b>Jutsu Drain:</b>[Chalupa]<br><br>Jutsu Description: [ChiChi]<hr><br>"}
			winset(usr,null,"Jutsu.nombre.text=null;Jutsu.rank.text=null;Jutsu.type.text=null;Jutsu.element.text=null;Jutsu.drain.text=null")
			var/list/O = new/list
			for(var/mob/M in world)
				O.Add(M)
			for(var/mob/P in O)
				if(P.Admin >= 1)
					P<<output("[src] has submitted a custom jutsu. Click <a href=?src=\ref[src];action=checkjutsu>here</a> to read!","World.OOC")
