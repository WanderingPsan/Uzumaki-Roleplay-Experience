mob/var/Gem = 0
var
	KumoOnline = 0
	KonoOnline = 0
	KiriOnline = 0
	SunaOnline = 0
	AmeOnline = 0
obj/Teleport_Pad
	var/NotNatural = 0
	icon = 'Teleport Pad.dmi'
	var/Online = 0
	Click()
		if(usr.Gem == 0)
			usr<<"You are not apart of the Houseki Clan, you cannot use this pad."
			return
		if(!src.Online&&usr.Gem)
			usr<<"This pad is offline. You release a portion of your energy into it, activating it for further use."
			if(src.name=="Konoha Pad")
				src.Online = 1
				KonoOnline = 1
			if(src.name=="Kiri Pad")
				src.Online = 1
				KiriOnline = 1
			if(src.name=="Kumo Pad")
				src.Online = 1
				KumoOnline = 1
			if(src.name=="Ame Pad")
				src.Online = 1
				KonoOnline = 1
			if(src.name=="Suna Pad")
				src.Online = 1
				SunaOnline = 1
		else
			if(usr.Gem)
				var/location = input("Where would you like to go?") in list("Konoha","Kumogakure","Kirigakure","Sunagakure","Amegakure","Other","Cancel")
				if(location == "Konoha")
					if(!KonoOnline)
						usr<<"That pad is offline. You must go to it and activate it."
						return
					else
						usr.loc = locate(143,61,1)
				if(location == "Kumogakure")
					if(!KumoOnline)
						usr<<"That pad is offline. You must go to it and activate it."
						return
					else
						usr.loc = locate(132,227,38)
				if(location == "Kirigakure")
					if(!KiriOnline)
						usr<<"That pad is offline. You must go to it and activate it."
						return
					else
						usr.loc = locate(26,203,3)
				if(location == "Sunagakure")
					if(!SunaOnline)
						usr<<"That pad is offline. You must go to it and activate it."
						return
					else
						usr.loc = locate(146,185,10)
				if(location == "Amegakure")
					if(!AmeOnline)
						usr<<"That pad is offline. You must go to activate it."
						return
					else
						usr.loc = locate(100,179,7)
				if(location == "Other")
					var/list/T = new/list
					for(var/obj/Teleport_Pad/TP in world)
						if(TP.NotNatural)
							T.Add(TP)
						//if(!TP.name== "Kono Pad" || !TP.name== "Kiri Pad" || !TP.name== "Suna Pad" || !TP.name== "Ame Pad" || !TP.name== "Kumo Pad")
					var/obj/Which = input("Which other pad would you like to go to?") in T+list("Cancel")
					if(Which == null)
						return
					usr.loc = Which.loc