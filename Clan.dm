var/KonohagakureNotes={"html><head><title>Konohagukure Village Notes</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}
var/KirigakureNotes={"html><head><title>Kirigakure Village Notes</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}
var/SunagakureNotes={"html><head><title>Sunagakure Village Notes</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}
var/AmegakureNotes={"html><head><title>Amegakure Village Notes</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}
var/KumogakureNotes={"html><head><title>Kumogakure Village Notes</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}


var/KonohagakureBingo={"html><head><title>Konohagukure Village Bingo Book</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}
var/KirigakureBingo={"html><head><title>Kirigakure Village Bingo Book</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}
var/SunagakureBingo={"html><head><title>Sunagakure Village Bingo Book</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}
var/AmegakureBingo={"html><head><title>Amegakure Village Bingo Book</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}
var/KumogakureBingo={"html><head><title>Kumogakure Village Bingo Book</title><body><body bgcolor="#000000">
<font color=green><font size=3>"}

mob
	verb
		View_Village_Page()
			set category="Commands"
			if(usr.Village=="Konohagakure")
				usr<<browse("[KonohagakureNotes]","window=Village;size=300x500")
			if(usr.Village=="Kirigakure")
				usr<<browse("[KirigakureNotes]","window=Village;size=300x500")
			if(usr.Village=="Sunagakure")
				usr<<browse("[SunagakureNotes]","window=Village;size=300x500")
			if(usr.Village=="Amegakure")
				usr<<browse("[AmegakureNotes]","window=Village;size=300x500")
			if(usr.Village=="Kumogakure")
				usr<<browse("[KumogakureNotes]","window=Village;size=300x500")

obj
	items
		Citem/tools
			Bingo_Book
				icon = 'Bingo Book.dmi'
				var/Village = ""
				verb
					Read_Book()
						if(src.Village=="Konohagakure")
							usr<<browse("[KonohagakureBingo]","window=Village;size=300x500")
						if(src.Village=="Kirigakure")
							usr<<browse("[KirigakureBingo]","window=Village;size=300x500")
						if(src.Village=="Sunagakure")
							usr<<browse("[SunagakureBingo]","window=Village;size=300x500")
						if(src.Village=="Amegakure")
							usr<<browse("[AmegakureBingo]","window=Village;size=300x500")
						if(src.Village=="Kumogakure")
							usr<<browse("[KumogakureBingo]","window=Village;size=300x500")

obj/ToggleGuardHostility
	verb/ToggleGuardHostility()
		set category="Rank"
		switch(alert(usr,"Toggle hostility of all the guards.","What?","Hostile","Peaceful"))
			if("Hostile")
				world<<"<font color=red>Village Information:<font color=white> [usr.Village] is attacking all outsiders!"
				for(var/mob/Guard/M in world)
					if(M.Village == usr.Village)
						M.hostile=1
			if("Peaceful")
				world<<"<font color=red>Village Information:<font color=white> [usr.Village] is no longer attacking all outsiders!"
				for(var/mob/Guard/M in world)
					if(M.Village == usr.Village)
						M.hostile=0
obj/EditVillagePage
	verb
		Create_Bingo_Book()
			set category ="Rank"
			var/obj/items/Citem/tools/Bingo_Book/B = new(usr)
			B.Village = usr.Village

		Edit_Page()
			set category="Rank"
			if(usr.Village=="Konohagakure")
				KonohagakureNotes=input("Edit the Village Notes!","Konohagakure","[KonohagakureNotes]")as message
				var/savefile/F = new ("SSO/KonohagakureNotes.sav")
				F["Notes"]<< KonohagakureNotes
			if(usr.Village=="Kirigakure")
				KirigakureNotes=input("Edit the Village Notes!","Kirigakure","[KirigakureNotes]")as message
				var/savefile/F = new ("SSO/KirigakureNotes.sav")
				F["Notes"]<< KirigakureNotes
			if(usr.Village=="Sunagakure")
				SunagakureNotes=input("Edit the Village Notes!","Sunagakure","[SunagakureNotes]")as message
				var/savefile/F = new ("SSO/SunagakureNotes.sav")
				F["Notes"]<< SunagakureNotes
			if(usr.Village=="Amegakure")
				AmegakureNotes=input("Edit the Village Notes!","Amegakure","[AmegakureNotes]")as message
				var/savefile/F = new ("SSO/AmegakureNotes.sav")
				F["Notes"]<< AmegakureNotes
			if(usr.Village=="Kumogakure")
				KumogakureNotes=input("Edit the Village Notes!","Kumogakure","[KumogakureNotes]")as message
				var/savefile/F = new ("SSO/KumogakureNotes.sav")
				F["Notes"]<< KumogakureNotes

		Edit_Bingo_Book()
			set category="Rank"
			if(usr.Village=="Konohagakure")
				KonohagakureBingo=input("Edit the Bingo Book!","Konohagakure","[KonohagakureBingo]")as message
				var/savefile/F = new("SSO/KonohagakureBingo.sav")
				F["Bingo"]<< KonohagakureBingo
			if(usr.Village=="Kirigakure")
				KirigakureBingo=input("Edit the Bingo Book!","Kirigakure","[KirigakureBingo]")as message
				var/savefile/F = new("SSO/KirigakureBingo.sav")
				F["Bingo"]<< KirigakureBingo
			if(usr.Village=="Sunagakure")
				SunagakureBingo=input("Edit the Bingo Book!","Sunagakure","[SunagakureBingo]")as message
				var/savefile/F = new("SSO/SunagakureBingo.sav")
				F["Bingo"]<< SunagakureBingo
			if(usr.Village=="Amegakure")
				AmegakureBingo=input("Edit the Bingo Book!","Amegakure","[AmegakureBingo]")as message
				var/savefile/F = new("SSO/AmegakureBingo.sav")
				F["Bingo"]<< AmegakureBingo
			if(usr.Village=="Kumogakure")
				KumogakureBingo=input("Edit the Bingo Book!","Kumogakure","[KumogakureBingo]")as message
				var/savefile/F = new("SSO/KumogakureBingo.sav")
				F["Bingo"]<< KumogakureBingo

proc/LoadVillageNotes()
	if(fexists("SSO/KonohagakureNotes.sav"))
		var/savefile/F = new ("SSO/KonohagakureNotes.sav")
		F["Notes"]>> KonohagakureNotes
	if(fexists("SSO/KirigakureNotes.sav"))
		var/savefile/F = new("SSO/KirigakureNotes.sav")
		F["Notes"]>> KirigakureNotes
	if(fexists("SSO/SunagakureNotes.sav"))
		var/savefile/F = new("SSO/SunagakureNotes.sav")
		F["Notes"]>> SunagakureNotes
	if(fexists("SSO/AmegakureNotes.sav"))
		var/savefile/F = new("SSO/AmegakureNotes.sav")
		F["Notes"]>> AmegakureNotes
	if(fexists("SSO/KumogakureNotes.sav"))
		var/savefile/F = new("SSO/KumogakureNotes.sav")
		F["Notes"]>> KumogakureNotes

obj/Clan
	verb
		Recruit()
			set category = "Clan"
			var/list/V = new/list
			for(var/mob/M in oviewers())
				if(M.client)
					if(M.Clan ==""|M.Clan=="None")
						V.Add(M)
			var/mob/A=input("Who would you like to ask to join your clan?") in V
			if(A==null)
				return
			switch(alert(A,"[usr] has invited you to their clan, [usr.Clan]","","Accept","Deny"))
				if("Accept")
					A.Clan = "[usr.Clan]"
					A.verbs += /obj/Clan/verb/Leave_Clan
					for(var/mob/B in world)
						if(B.Clan=="[usr.Clan]")
							B << "[A] has joined [usr.Clan]"

		Rename()
			set category = "Clan"
			var/list/V = new/list
			for(var/mob/M in oviewers())
				if(M.client)
					if(M.Clan == usr.Clan)
						V.Add(M)
			var/mob/A=input("Who would you like to rename?") in V
			if(A==null)
				return
			var/newname = input(A,"Please choose a first name, your last name will be your new clan name") as text
			A.name = "[A.Clan],[newname]"
			A.Oname = "[A.Clan],[newname]"

		Exile()
			set category = "Clan"
			var/list/V = new/list
			for(var/mob/M in oviewers())
				if(M.client)
					if(M.Clan == usr.Clan)
						V.Add(M)
			var/mob/A=input("Who would you like to exile from [usr.Clan]?") in V
			if(A==null)
				return
			A.Clan="None"
			A.verbs -= /obj/Clan/verb/Leave_Clan
			for(var/obj/Clan/B in usr.contents)
				del(B)

		Announce(msg as text)
			set category = "Clan"
			if(msg=="")
				return
			for(var/mob/M in world)
				if(M.Clan==usr.Clan)
					M << "<center>---Clan Announcement---"
					M << "<center>[msg]"
					M << "<center>--[usr]--"

		Make_Clan_Leader()
			set category = "Clan"
			var/list/V = new/list
			for(var/mob/M in oviewers())
				if(M.client)
					if(M.Clan == usr.Clan)
						V.Add(M)
			var/mob/A=input("Who would you like to make the leader of [usr.Clan]?") in V
			if(A==null)
				return
			usr.contents -= /obj/Clan
			for(var/obj/Clan/B in usr.contents)
				del(B)
			usr.verbs += /obj/Clan/verb/Leave_Clan
			A.verbs -= /obj/Clan/verb/Leave_Clan
			A.contents += /obj/Clan

		Leave_Clan()
			set category = "Clan"
			switch(input("Are you sure you wish to leave your group?") in list("Yes","No"))
				if("Yes")
					usr.Clan = "None"
					usr.verbs -= /obj/Clan
					for(var/obj/Clan/B in usr.contents)
						del(B)