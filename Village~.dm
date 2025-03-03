obj/Village_Billboard
	icon = 'BillBoard.dmi'
	icon_state = "full"
	var/Village = ""
	Click()
		if(src.Village=="Konohagakure")
			usr<<browse("[KonohagakureNotes]","window=Village;size=300x500")
		if(src.Village=="Kirigakure")
			usr<<browse("[KirigakureNotes]","window=Village;size=300x500")
		if(src.Village=="Sunagakure")
			usr<<browse("[SunagakureNotes]","window=Village;size=300x500")
		if(src.Village=="Amegakure")
			usr<<browse("[AmegakureNotes]","window=Village;size=300x500")
		if(src.Village=="Kumogakure")
			usr<<browse("[KumogakureNotes]","window=Village;size=300x500")



