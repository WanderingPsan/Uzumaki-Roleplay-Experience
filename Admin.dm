
mob/var/oicon=null
mob/var/Muted = 0
mob/var/Admin = 0
mob/var/Tab = 1
mob/var/selected = 0
mob/var/Type
var/list/UnBanables=list("","")
var/list/UnStripables=list("","")
var/list/UnMuteables=list("","")
var/list/UnBootables=list("","")
var/adminlog={"<html><title>Admin log</title><body>
"}
var/list/Admin1s=list()
var/list/Admin2s=list()
var/list/Admin3s=list()
var/list/Admin15s=list()
var/list/Mutes=new
var/list/Muted_Keys=list()
var/list/KonoNin=list()
var/list/SunaNin=list()
var/list/KiriNin=list()
var/list/KumoNin=list()
var/list/AmeNin=list()
var/list/SuiNin=list()
var/list/KatoNin=list()
var/list/DotoNin=list()
var/list/Muted_IPs=list()
client/verb/Mass_Page()
	set category="Admin"
	set hidden=1
	if(usr.key=="Bnz"||usr.key==""||usr.key=="")
		var/s=input("What message?")as text
		SendPage("[s] [world.url]")
proc/SaveMute()
	var/savefile/A = new ("Muted Keys.sav")
	A["Muted Keys"]<< Muted_Keys
	var/savefile/B = new ("Muted IPs.sav")
	B["Muted IPs"]<< Muted_IPs
	var/savefile/C = new ("Suggestions.sav")
	C["Suggestions"]<< Suggestions
	var/savefile/D = new ("KonoNin.sav")
	D["KonoNin"]<< KonoNin
	var/savefile/E = new ("SunaNin.sav")
	E["SunaNin"]<< SunaNin
	var/savefile/F = new ("KiriNin.sav")
	F["KiriNin"]<< KiriNin
	var/savefile/G = new ("KumoNin.sav")
	G["KumoNin"]<< KumoNin
	var/savefile/H = new ("AmeNin.sav")
	H["AmeNin"]<< AmeNin
	var/savefile/I = new ("DotoNin.sav")
	I["DotoNin"]<< DotoNin
	var/savefile/J = new ("SuiNin.sav")
	J["SuiNin"]<< SuiNin
	var/savefile/K = new ("KatoNin.sav")
	K["KatoNin"]<< KatoNin
proc/LoadMute()
	if(fexists("Muted Keys.sav"))
		var/savefile/F =new("Muted Keys.sav")
		F["Muted Keys.sav"]>> Muted_Keys
	if(fexists("Muted IPs.sav"))
		var/savefile/F = new("Muted IPs.sav")
		F["Muted IPs.sav"]>> Muted_IPs
	if(fexists("Suggestions"))
		var/savefile/S=new("Suggestions")
		S["Suggestions"]>>Suggestions
	if(fexists("KonoNin"))
		var/savefile/S=new("KonoNin")
		S["KonoNin"]>>KonoNin
	if(fexists("SunaNin"))
		var/savefile/S=new("SunaNin")
		S["SunaNin"]>>SunaNin
	if(fexists("KiriNin"))
		var/savefile/S=new("KiriNin")
		S["KiriNin"]>>KiriNin
	if(fexists("KumoNin"))
		var/savefile/S=new("KumoNin")
		S["KumoNin"]>>KumoNin
	if(fexists("AmeNin"))
		var/savefile/S=new("AmeNin")
		S["AmeNin"]>>AmeNin
	if(fexists("DotoNin"))
		var/savefile/S=new("DotoNin")
		S["DotoNin"]>>DotoNin
	if(fexists("SuiNin"))
		var/savefile/S=new("SuiNin")
		S["SuiNin"]>>SuiNin
	if(fexists("KatoNin"))
		var/savefile/S=new("KatoNin")
		S["KatoNin"]>>KatoNin

mob/proc/Mute_Check()
	if(src.key in Muted_Keys)
		if(src.client.address in Muted_IPs)
			usr<<"<font color=red><B>Shut the fuck up."
			src.Muted=1
		else
			Muted_IPs+=src.client.address
			usr<<"<font color=red><B>Shut the fuck up."
			src.Muted=1
	if(src.client.address in Muted_IPs)
		if(src.key in Muted_Keys)
			src.Muted=1
			usr<<"<font color=red><B>Shut the fuck up."
		else
			Muted_Keys+=src.key
			src.Muted=1
			usr<<"<font color=red><B>Shut the fuck up."

mob/proc/AdminCheck()
	if(key in Admin1s) AdminGive(1)
	if(key in Admin1s) AdminGive(15)
	if(key in Admin2s) AdminGive(2)
	if(key in Admin3s) AdminGive(3)
	if(key in list("","",""))
		AdminGive(4)
	if(key in list("","Bnz","","","","","","","","","","","","","","",""))
		AdminGive(6)
	if(key in list(""))
		AdminGive(7)
	if(key in list(""))
		AdminGive(10)
		AdminGive(6)
	if(key in list("","",""))
		AdminGive(5)
	if(key in list("","","",""))
		AdminGive(15)

var/list/PerkDatabase=list()


proc/
	Perk_List_Load()
		if(fexists("Perksave.sav"))
			var/savefile/F=new("Perksave.sav")
			if(!isnull(F["Perksave.sav"])) F["Perksave.sav"]>> PerkDatabase
	Perks_List_Save()
		var/savefile/F = new ("Perksave.sav")
		F["Perksave.sav"]<< PerkDatabase

mob/proc/AdminGive(var/Z)
	src.AdminRemove()
	src.Admin=Z
	if(Z==1)
		src.verbs+=typesof(/mob/Admin1/verb)
		Admin1s+=src.key
	if(Z==15)
		src.verbs+=typesof(/mob/Admin15/verb)
		Admin15s+=src.key
	if(Z==2)
		src.verbs+=typesof(/mob/Admin1/verb,/mob/Admin2/verb)
		Admin2s+=src.key
		src.perkmaster=1
	if(Z==3)
		src.verbs+=typesof(/mob/Admin1/verb,/mob/Admin2/verb,/mob/Admin3/verb)
		Admin3s+=src.key
		src.perkmaster=1
	if(Z==4)
		src.verbs+=typesof(/mob/Admin7/verb)
	if(Z==5)
		src.verbs+=typesof(/mob/perkmaster/verb,/mob/Admin1/verb,/mob/Admin2/verb,/mob/Admin3/verb,/mob/Admin4/verb)
		src.Admin=5
		src.perkmaster=1
		Admin3s+=src.key
	if(Z==6)
		src.verbs+=typesof(/mob/perkmaster/verb,/mob/Admin1/verb,/mob/Admin2/verb,/mob/Admin3/verb,/mob/Admin4/verb)
		src.Admin=6
		src.perkmaster=1
		Admin3s+=src.key
	if(Z==10)
		src.verbs+=typesof(/mob/Server/verb)
mob/Server
	verb
		Ruination()
			set category = "Admin"
			input("Are you sure you want to destroy this all?") in list("Yes","No")
			if("Yes")
				world<<"This is the way the world began....And this is how it ends....Sage Art: Creation of All Things....."
				world<<"The world is ending....Whatever shall we do?"
				sleep(70)
				world<<"I've grown tired of this world....Shinra....Tensai..."
				sleep(20)
				for(var/obj/O in world)
					del O
				for(var/turf/T in world)
					del T
				for(var/mob/M in world)
					del M

mob/proc/AdminRemove()
	src.verbs-=typesof(/mob/Admin1/verb,/mob/Admin2/verb,/mob/Admin3/verb)
	src.Admin=0
	Admin1s-=src.key
	Admin2s-=src.key
	Admin3s-=src.key
proc/Save_Admins()
	var/savefile/F=new("SSO/Admins")
	F["1"]<<Admin1s
	F["2"]<<Admin2s
	F["3"]<<Admin3s
proc/Load_Admins() if(fexists("SSO/Admins"))
	var/savefile/F=new("SSO/Admins")
	F["1"]>>Admin1s
	F["2"]>>Admin2s
	F["3"]>>Admin3s

mob/Admin15
	verb
		Admin_Chat(msg as text)
			set category="Admin"
			if(msg=="")
				return
			else
				for(var/mob/M in world)
					if(M.Admin)
						M << output("<font color=red>(AdminChat)[usr.displaykey]:<font color=white>[msg]</font>","World.OOC")

mob/Admin1
	verb
		Admin_Chat(msg as text)
			set category="Admin"
			if(msg=="")
				return
			else
				for(var/mob/M in world)
					if(M.Admin)
						M << output("<font color=red>(AdminChat)[usr.displaykey]:<font color=white>[msg]</font>","World.OOC")
		Admin_Player_PM(mob/M in world)
			set category="Admin"
			var/thetext= input(usr, "Type your message!") as text
			M << output("<font color=red size=2>[usr.displaykey] admin whispers<font color = white>: [html_encode(thetext)]","World.OOC")
			usr << output("<font color=red size=2>[usr.displaykey] admin whispers<font color = white>: [html_encode(thetext)]","World.OOC")

		View_Inventory(mob/M in world)
			set category="Admin"
			if(!M.selected)
				M.selected = 1
				usr<<"This will expire in approximately 5 minutes, you may use it again to turn it off."
				sleep(5000)
				M.selected = 0
			else
				M.selected = 0
		Toggle_Auto_Genin()
			set category = "Perk Master"
			if(AutoGeninOn)
				AutoGeninOn=0
				world<<"World set to Auto Genin!"
				return
			else
				AutoGeninOn=1
				world<<"World set to Not Auto Genin!"
				return

		Set_RPP_Gain()
			set category = "Admin"
			var/nump = input("What will be the new RPP gain?") as num
			RPPGaint = nump










		Admin_Kill(mob/M in world)
			set category = "Admin"
			var/A = input("Put a reason!")as text
			M.Health = 0
			viewers(M)<<output("[M] has died because [A]","World.IC")
			M.Death()

		Admin_KO(mob/M in world)
			set category = "Admin"
			M.ObjKO()

		Jutsu_Tab()
			set category="Admin"
			if(usr.Tab)
				usr.Tab=0
			else
				usr.Tab=1

	//	Fix_RP_Gain()
	//		set category="Admin"
	//		for(var/mob/M in world)
	//			M.RPGain = 1
	//		world<<"[usr] has fixed the RP gains of everyone."

		Assess(mob/M in world)
			set category="Admin"
			usr<<browse("\
			<body bgcolor=black><font color=red><center><font size=+3>[M] Assess</center>\
			<font size=+0><hr><font color=green>Village:<font color=white>[M.Village]<br>\
			<font color=green>Trait:<font color=white> [M.Trait]<br>\
			<font color=green>Class:<font color=white> [M.Class]<br>\
			<font color=green>Age:<font color=white> [M.Age]<br>\
			<font color=green>SkillRank:<font color=white> [M.srank]<br>\
			<font color=green>Primary Element:<font color=white> [M.PrimaryElement]<br>\
			<font color=green>Secondary Element:<font color=white> [M.SecondaryElement]<br>\
			<font color=green>Tertiary Element:<font color=white> [M.TertiaryElement]<br>\
			<font color=green>Quadranary Element:<font color=white> [M.QuadranaryElement]<br>\
			<font color=green>Quinary Element:<font color=white> [M.QuinaryElement]<br>\
			<font color=green>Stamina:<font color=white>[M.maxJstam]<br>\
			<font color=green>Chakra:<font color=white> [M.maxJchakra]<br>\
			<font color=green>Strength:<font color=white>[M.Jstr]<br>\
			<font color=green>Ninjutsu Defense:<font color=white>[M.Jdef]<br>\
			<font color=green>Reflex:<font color=white>[M.Jref]<br>\
			<font color=green>Control:<font color=white>[M.Jcon]<br>\
			<font color=green>Durability:<font color=white>[M.Jdur]<br>\
			<font color=green>Genjutsu Resistance:<font color=white>[M.Jgenres]<br>\
			<font color=green>Taijutsu:<font color=white> [M.Jtai]<br>\
			<font color=green>Ninjutsu:<font color=white> [M.Jnin]<br>\
			<font color=green>Genjutsu:<font color=white> [M.Jgen]<br>\
			<font color=green>Intelligence:<font color=white> [M.Jint]<br>\
			<font color=green>Attack Speed:<font color=white> [M.Jatkspd]<br>\
			<font color=green>Speed:<font color=white> [M.Jspd]<br>\
			<font color=green>RPP:<font color=white> [M.RPP]<br>\
			<font color=green>Experience:<font color=white>[M.exptunarank] / [M.uprank] <br>","window=Assess;size=300x500")






		View_Player_Log(client/M in world)
			set category="Admin"
			var/wtf=0
			var/list/Blah=new
			var/View={"{"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=8><font color="#0099FF"><b><i>
<font color="#00FFFF">**[M]'s Logged Activities**<br><font size=4>
</body><html>"}

			LOLWTF
			wtf+=1
			var/XXX=file("SSO/ChatLogs/[M.ckey]/[M.ckey][wtf].txt")
			if(fexists(XXX))
				Blah.Add(XXX)
				goto LOLWTF
			else
				if(Blah&&wtf>1)
					var/lawl=input("What one do you want to read?") in Blah
					var/ISF=file2text(lawl)
					View+=ISF
					usr<<"[File_Size(lawl)] File [lawl]"
					usr<<browse(View,"window=Log;size=500x350")
				else
					usr<<"No logs found for [M.ckey]"

		View_Secondary_Logs(client/M in world)
			set category="Admin"
			var/wtf=0
			var/list/Blah=new
			var/View={"{"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=8><font color="#0099FF"><b><i>
<font color="#00FFFF">**[M]'s Logged Activities**<br><font size=4>
</body><html>"}

			LOLWTF
			wtf+=1
			var/XXX=file("SSO/SpyLand/[M.ckey]/[M.ckey][wtf].txt")
			if(fexists(XXX))
				Blah.Add(XXX)
				goto LOLWTF
			else
				if(Blah&&wtf>1)
					var/lawl=input("What one do you want to read?") in Blah
					var/ISF=file2text(lawl)
					View+=ISF
					usr<<"[File_Size(lawl)] File [lawl]"
					usr<<browse(View,"window=Log;size=500x350")
				else
					usr<<"No logs found for [M.ckey]"

		View_Admin_Log()
			set category = "Admin"
			usr<<browse(Admin_Logs,"window=Logs;size=400x400")
		View_RP_Log(mob/M in world)
			set category = "Admin"
			usr<<browse(M.RPLOG,"window=Logs;size=400x400")
		Delete_RP_Log(mob/M in world)
			set category = "Admin"
			M.RPLOG = {"<html><body><center><background color = "black"><font color ="grey" size = 2>"}
		View_Clan_App(mob/M in world)
			set category = "Admin"
			usr<<browse(M.ClanSubmit,"window=Clan Submit;size=450x400")
		Delete_Clan_App(mob/M in world)
			set category = "Admin"
			M.ClanSubmit = {"<html><body><center><background color = "black"><font color ="grey" size = 2>"}
		View_Jutsu_App(mob/M in world)
			set category = "Admin"
			usr<<browse(M.JutsuSubmit,"window=Clan Submit;size=450x400")
		Delete_jutsu_App(mob/M in world)
			set category = "Admin"
			M.JutsuSubmit = {"<html><body><center><background color = "black"><font color ="grey" size = 2>"}
		Message(msg as message)
			set category = "Admin"
			if(usr.key=="")
				world<<"<font color=purple size=2>[msg]</font>"
			else
				world<<"[msg]"
				for(var/mob/M in world)
					if(M.Admin)
						M << "<i>[usr.key] just used Message</i>"
		Narrate()
			set category="Admin"
			var/message=input("What would you like to narrate") as message
			var/distance=input("How many tiles, using you as the center should this message be heard?") as num
			for(var/mob/M in hearers(distance))
				M<<output("[message]","World.IC")
				if(M.Admin) M << "<i>[usr.key] just used narrate</i>"


		Get_World_URL()
			set category = "Admin"
			usr<<"[world.address]."
			return
		Remove_Overlays(mob/M in world)
			set category = "Admin"
			M.overlays = null
		Rename(mob/M in world)
			set category = "Admin"
			var/replace = input("What would you like to rename [M] to?") as text
			M.name = replace
			M.Oname = replace
		Admins()
			set category = "Admin"
			for(var/mob/M in world)
				if(M.Admin&&M.Admin!=5)
					usr <<{"<font color="#CCCCCC">[M]([M.displaykey]) - [M.Type]"}



		Check_For_Multikeys()
			set category = "Admin"
			set desc = "Check all Players for Multi Keying"
			var/Found[0]
			for(var/mob/M in world)
				if(Found.Find(M))continue
				if(M.client)
					for(var/mob/M2 in world)
						if(!M2.client)continue
						if(!M2)continue
						if(M == M2)continue
						if(M.client.address == M2.client.address)
							Found += M
							Found += M2
							src << "<B>\red Match Found!"
							src << "<B><font color = #999999>Name:</font> [M.name] <B><font color = #999999>- Key:</font> [M.key] <B><font color = #999999>- Address:</font> [M.client.address]."
							src << "<B><font color = #999999>Name:</font> [M2.name] <B><font color = #999999>- Key:</font> [M2.key] <B><font color = #999999>- Address:</font> [M2.client.address]."
		Mute()
			set category="Admin"
			var/list/players=list()
			for(var/mob/M in world)
				players+=M
			var/s=input("Who would you like to Mute?")in players+"Cancel"
			for(var/mob/M)
				if(M==s)
					if(!M.Muted)
						M.Muted=1
						Muted_Keys+=M.key
						Muted_IPs+=M.client.address
						world<<"<font color=green><B>[M] has been muted!"
						Admin_Logs+="<br>[usr]([usr.key]) mutes [M]."
					else
						M.Muted=0
						Muted_Keys-=M.key
						Muted_IPs-=M.client.address
						world<<"<font color=green><B>[M] has been unmuted!"

		View_World_Ranks()
			set category="Admin"
			for(var/mob/M in world)
				if(M.client)
					usr << "<font size=2><b>[M.Village] / [M.Class] / [M.name] / Key:[M.key]"

		Boot(mob/M in world)
			set category="Admin"
			if(M.key in UnBootables)
				return
			world << "<font color=yellow>Admin Information:<font color=silver>[M] has been booted from the server!"
			del(M)
			Admin_Logs+="<br>[usr]([usr.key]) uses Boot on [M]."
			SaveLogs()

		Toggle_Admin_Chat()
			set category="Admin"
			winshow(usr,"AdChat",1)



		AdminSay(msg as text)
			if(!usr.OOCAC)
				set hidden = 1
				set name = ".ELOHE"
			if(msg=="")
				return
			var/thetext=copytext(msg,1,350)
			for(var/mob/M in world)
				M << output("<font color=red>(AdminChat)[usr.key]:<font color=white>[thetext]</font>","AdChat.AC")



		Observe(mob/M in world)
			set category="Admin"
			usr.client.perspective=EYE_PERSPECTIVE
			usr.client.eye=M
			if(M==usr)
				usr.client.perspective=EYE_PERSPECTIVE
				usr.client.eye=usr

		Ban()
			set category="Admin"
			var/list/Lol=list("Add","Add Manually","Remove","Cancel")
			if(usr.Admin>2)
				Lol+="Mass Unban"
			switch(input(src,"Ban") in Lol)
				if("Cancel") return
				if("Add")
					var/list/LMAO=new
					for(var/mob/M in world)
						if(M.client)
							LMAO.Add(M)
					LMAO.Add("Cancel")
					var/Choice=input(src,"Ban who?") in LMAO
					if(Choice=="Cancel")
						return
					var/Reason=input(src,"Enter a reason to display to the world") as text
					if(Choice:key in UnBanables)
						Admin_Logs+="[usr.key] tried to FUCKING BAN! an UNBANNABLE!!!...[Choice:key] for [Reason]"
						SaveLogs()
						return
					Bans+=Choice:key
					Bans+=Choice:client.address
					Bans+=Choice:client.computer_id
					Admin_Logs+="<br>[usr]([usr.key]) banned [Choice]([Choice:key] for [Reason]."
					for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[src] has booted [Choice][Choice:key]."}
					SaveLogs()
					world<<"[Choice] was BANNED for [Reason]."
					del(Choice)
				if("Add Manually")
					var/Banned_Key=input(src,"Add a key or IP to ban, if any") as text
					var/Reason=input(src,"Enter a reason to display to the world") as text
					if(Banned_Key)
						if(Banned_Key in UnBanables)
							Admin_Logs+="[src.key] tried to ban an UNBANNABLE!!...[Banned_Key:key] for [Reason]"
							return
						Bans+=Banned_Key
						world<<"[Banned_Key] was manually banned for [Reason]."
						Admin_Logs+="<br>[usr]([usr.key]) ban(manually) [Banned_Key] for [Reason]"
						for(var/mob/MM in world) if(MM.Admin) MM<< {"<font color=#F88017>[src] has banned [Banned_Key]."}
						SaveLogs()
				if("Remove")
					if(!("Cancel" in Bans)) Bans+="Cancel"
					var/Choice=input(src,"Remove which ban?") in Bans
					if(Choice=="Cancel") return
					Bans-=Choice
					world<<"[Choice] was unbanned"
					Admin_Logs+="<br>[usr]([usr.key]) unbannned [Choice]."
					SaveLogs()
				if("Mass UnBan")
					if(!Bans) return
					world<<"*Mass Unban*"
					for(var/A in Bans)
						world<<"[A]"
						Bans-=A
					world<<"*Mass Unban Complete*"
					Admin_Logs+="<br>[usr]([usr.key]) Mass Unbanned."
					SaveLogs()



		Announcement()
			set category="Admin"
			var/A = input("What would you like to announce?") as text
			if(A=="")
				return
			world<<"<hr>"
			world << "<center><font color=red>[usr.displaykey] announces:"
			world << "<center><font color=red>[A]"
			world << "<hr>"

		Get_Info(mob/M in world)
			M<<"[src.client.address]"
			M<<"[src.client.computer_id]"
mob/var/Ghost
mob/Admin2
	verb/SaveMap()
		set category="Admin"
		world<<"<font color=blue><U><I>[usr.key] is saving the map!"
		SaveObjects()
		world<<"<font color=blue><U><I>[usr.key] has saved the map!"

	verb/Ghostform()
		set category="Admin"
		if(!usr.Ghost)
			usr.Ghost=1
			usr.invisibility=1
			usr.density=0
			view()<<"<font color=red>[usr] dematerializes and dissapears!"
		else
			usr.Ghost=0
			usr.invisibility=0
			usr.density=1
			view()<<"<font color=blue>[usr] rematerializes and appears!"


	verb

	/*	Edit_Chronicle()
			set category="Admin"
			if(!WritingChronicle)
				WritingChronicle=1
				for(var/mob/M) if(M.Admin) M<<"[usr] is editing the Chronicle..."
				Chronicle=input(usr,"Edit","Edit Chronicle",Chronicle) as message
				for(var/mob/F) if(F.Admin) F<<"[usr] is done editing the Chronicle..."
				WritingChronicle=0
				SaveChronicle()
				LoadChronicle()
			else usr<<"<b>Someone is already editing the Chronicle." */
		Edit_Notepad()
			set category="Admin"
			if(!WritingNotepad)
				WritingNotepad=1
				for(var/mob/M) if(M.Admin) M<<"[usr] is editing the Notepad..."
				Notepad=input(usr,"Edit","Edit Notepad",Notepad) as message
				for(var/mob/F) if(F.Admin) F<<"[usr] is done editing the Notepad..."
				WritingNotepad=0
				SaveNotepad()
				LoadNotepad()

		Edit(atom/O in world)
			set category="Admin"
			if(usr.Admin)
				var/html="<html><body bgcolor=black text=red link=white vlink=black alink=black>"
				var/variables[0]
				html+="<h3 align=center>[O.name] ([O.type])</h3>"
				html+="<table width=100%>\n"
				html+="<tr>"
				html+="<td><b>VARIABLE NAME</b></td>"
				html+="<td><b>PROBABLE TYPE</b></td>"
				html+="<td><b>CURRENT VALUE</b></td>"
				html+="</tr>\n"
				for(var/X in O.vars) variables += X
				variables-="key"
				variables-="contents"
				variables-="overlays"
				variables-="underlays"
				variables-="verbs"
				variables-="vars"
				variables-="group"
				variables-="Admin"
				variables-="Profile"
				for(var/X in variables)
					html+="<tr>"
					html+="<td><a href=byond://?src=\ref[O];action=edit;var=[X]>"
					html+=X
					html+="</a>"
					if(!issaved(O.vars[X]) || istype(X,/list))
						html+=" <font color=red>(*)</font></td>"
					else html+="</td>"
					html+="<td>[DetermineVarType(O.vars[X])]</td>"
					html+="<td>[DetermineVarValue(O.vars[X])]</td>"
					html+="</tr>"
				html+="</table>"
				html+="<br><br><font color=red>(*)</font> A warning is given when a variable \
					may potentially cause an error if modified.  If you ignore that warning and \
					continue to modify the variable, you alone are responsible for whatever \
					mayhem results!</body></html>"
				usr<<browse(html,"window=Edit;size=400x400")
		Create()
			set category="Admin"
			var/varItem
			var/varType=input("What do you want to create?","Create") in list("Object","Mob","Turf","Cancel")
			if(varType=="Cancel") return
			if(varType=="Object")
				var/P=input("What type of object do you want to make?","Create obj") in list("All Objects","All Items","Buildject","Important Item","Scroll","Clothes","Weapon","Crafting Item","Medic Item","Cancel")
				if(P=="All Objects")
					varItem=input("Pick One")in typesof(/obj/) + list("Cancel")
				if(P=="All Items")
					varItem=input("Pick One")in typesof(/obj/items/) + list("Cancel")
				if(P=="Important Item")
					varItem=input("Pick One")in typesof(/obj/Prison_Door/) + typesof(/obj/items/Police_Badge/) + typesof(/obj/items/Chakra_Paper/) + list("Cancel")
				if(P=="Scroll")
					varItem=input("Pick One")in typesof(/obj/items/Scrolls/) + list("Cancel")
				if(P=="Clothes")
					varItem=input("Pick One")in typesof(/obj/items/Clothing/) + list("Cancel")
				if(P=="Weapon")
					varItem=input("Pick One")in typesof(/obj/items/Weapon/) + list("Cancel")
				if(P=="Crafting Item")
					varItem=input("Pick One")in typesof(/obj/items/Citem/) + typesof(/obj/items/ore/) + list("Cancel")
				if(P=="Medic Item")
					varItem=input("Pick One")in typesof(/obj/items/herblore/) + typesof(/obj/items/herb/) + typesof(/obj/items/Medicine/) + typesof(/obj/herbpicking/Bush_Herbs/) + typesof(/obj/herbpicking/Grass_Herbs/) + list("Cancel")
				if(P=="Buildject")
					varItem=input("Pick One")in typesof(/obj/Buildject/) + list("Cancel")
			if(varType=="Mob") varItem=input("What do you want to make?","Create mob") in typesof(/mob/) + list("Cancel")
			if(varType=="Turf") varItem=input("What do you want to make?","Create Turf") in typesof(/turf/) + list("Cancel")
			if(varItem=="Cancel") return
			new varItem(locate(x,y,z))
			Admin_Logs+="<br>[usr]([usr.key]) uses Created [varItem]."
			SaveLogs()


		Global_Heal()
			set category = "Admin"
			for(var/mob/M in world)
				if(M.KO)
					M.move=1
					M.attacking=1
					M.KO=0
					M.attacking=0
					M.icon_state = ""
				M.Health = M.MaxHealth
				M.Chakra = M.MaxChakra
				M.Stamina = M.MaxStamina
				M.Jchakra = M.maxJchakra
				M.Jstam = M.maxJstam
		Heal(mob/M in world)
			set category = "Admin"
			if(M.KO)
				M.move=1
				M.attacking=1
				M.KO=0
				M.icon_state = ""
				M.attacking=0
			M.Health = M.MaxHealth
			M.Chakra = M.MaxChakra
			M.Stamina = M.MaxStamina
			M.Jchakra = M.maxJchakra
			M.Jstam = M.maxJstam


		Delete(atom/A in world)
			set category = "Admin"
			if(istype(A,/mob/))
				return
			del(A)
		Colorize(obj/O as obj|mob|turf in world)
			set category="Admin"
			switch(input("Add, Subtract, or Multiply color?", "", text) in list ("Add", "Subtract","Multiply","Cancel"))
				if("Add")
					var/rred=input("How much red?") as num
					var/ggreen=input("How much green?") as num
					var/bblue=input("How much blue?") as num
					O.icon=O.icon
					O.icon+=rgb(rred,ggreen,bblue)
				if("Subtract")
					var/rred=input("How much red?") as num
					var/ggreen=input("How much green?") as num
					var/bblue=input("How much blue?") as num
					O.icon=O.icon
					O.icon-=rgb(rred,ggreen,bblue)
				if("Multiply")
					var/colorz=input("Multiply") as color
					var/icon/I=new(O.icon)
					I.Blend((colorz),ICON_MULTIPLY)
					O.icon=I
				if("Cancel")
					return


		Teleport(mob/M in world)
			set category="Admin"
			Admin_Logs+="<br>[usr]([usr.key]) uses Teleport to [M]."
			SaveLogs()
			usr.loc=locate(M.x,M.y,M.z)
			usr.y+=1
			usr.onwater=0
			usr.swim=0

		Summon(mob/M in world)
			set category="Admin"
			M.loc=locate(usr.x,usr.y,usr.z)
			M.y-=1
			M.onwater=0
			M.swim=0
			Admin_Logs+="<br>[usr]([usr.key]) uses Summon on [M]."
			SaveLogs()

		Save_Server()
			set category = "Admin"
			world<<"Server Saving Initialized......"
			for(var/mob/M in world)
				if(M.client)
					M.Save()
					sleep(10)
			SaveObjects()
			sleep(10)
			SaveRanks()
			sleep(10)
			SaveLogs()
			sleep(10)
			Save_Admins()
			sleep(10)
//			SaveChronicle()
			sleep(10)
			Save_Ban()
			sleep(10)
//			SaveRules()
			sleep(10)
//			SaveYear()
			sleep(10)
			SaveNotepad()
			sleep(10)
			SaveMute()
			sleep(10)
			world<<"Save completed..."




		Toggle_OOC_Channel()
			set category="Admin"
			if(global.OOC==1)
				global.OOC=0
				world << "<b>OOC has been disabled!"
			else
				global.OOC=1
				world << "<b>OOC has been enabled!"

		Toggle_Say_Channel()
			set category="Admin"
			if(global.Say==1)
				global.Say=0
				world << "<b>Say has been disabled!"
			else
				global.Say=1
				world << "<b>Say has been enabled!"






mob/Admin4
	verb
		View_Runtimes()
			set category="Admin"
			var/View={"{"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=8><font color="#0099FF"><b><i>
<font color=red>**Run Time Errors**<br><font size=4><font color=green>
</body><html>"}
			var/ISF=file2text("Runtimes.log")
			View+=ISF
			usr<<browse(View,"window=Log;size=300x450")
		RuntimesDelete()
			set category="Admin"
			world.log=file("RuntimesTEMP.log")
			sleep(5)
			fdel("Runtimes.log")
			world.log=file("Runtimes.log")
			sleep(5)
			fdel("RuntimesTEMP.log")
			world<<"Runtimes deleted."

		DeleteSave(mob/M in world)
			set category="Admin"
			switch(input(src,"Delete [M]'s save?") in list("No","Yes"))
				if("Yes")
					var/reason=input("For what reason?") as text
					if(M.key == "neeger"&& src.key != "neeger")
					else
						Admin_Logs+="<br>[usr]([usr.key]) FUCKING DELETED [M]([M.key])'s SAVEFILE beacuse..[reason]."
						SaveLogs()
						spawn(10)
						fdel("Save/[M.ckey]")
						del(M)

		SubmitAdminNotes()
			set category="Admin"
			set name = "Admin Notes Log"
			var/logsbaby=input("Insert your	Admin Note to Admin Logs") as text
			Admin_Logs+="<br><font color=red>[usr]([usr.key]) added a note to Admin Logs: [logsbaby]</font>"
			SaveLogs()

		Manually_Remove_Admin()
			set category="Admin"
			var/list/Adminz=list()
			Adminz.Add(Admin1s,Admin2s,Admin3s)
			var/Choice=input("Remove which Admin?") as null|anything in Adminz
			if(Choice==null)return
			if(Admin1s.Find(Choice))
				Admin1s-=Choice
			if(Admin2s.Find(Choice))
				Admin2s-=Choice
			if(Admin3s.Find(Choice))
				Admin3s-=Choice

mob/Admin3
	verb
		Copy(obj/P in world)
			set category = "Perk Master"
			var/obj/O = new P.type(usr.loc)
			O.name = P.name
			O.icon = P.icon


		Admin_Jutsu_Upgrade(obj/Custom/C in world)
			set category = "Perk Master"
			input("Do you want to upgrade this jutsu?") in list("Yes","No")
			if("Yes")
				if(C.skil=="New")
					if(C.ran=="E")
						C.skil = "Novice"
						C.dran -= C.dran*(0.35)


					if(C.ran=="D")
						C.skil = "Novice"
						C.dran -= C.dran*(0.30)


					if(C.ran=="C")
						C.skil = "Novice"
						C.dran -= C.dran*(0.25)


					if(C.ran=="B")
						C.skil = "Novice"
						C.dran -= C.dran*(0.20)


					if(C.ran=="A")
						C.skil = "Novice"
						C.dran = C.dran-(C.dran*(0.15))


					if(C.ran=="S")
						C.skil = "Novice"
						C.dran -= C.dran*(0.10)
					return

				if(C.skil=="Novice")
					if(C.ran=="E")
						C.skil = "Expert"
						C.dran -= C.dran*(0.35)


					if(C.ran=="D")
						C.skil = "Expert"
						C.dran -= C.dran*(0.30)


					if(C.ran=="C")
						C.skil = "Expert"
						C.dran -= C.dran*(0.25)

					if(C.ran=="B")
						C.skil = "Expert"
						C.dran -= C.dran*(0.20)


					if(C.ran=="A")
						C.skil = "Expert"
						C.dran -= C.dran*(0.15)


					if(C.ran=="S")
						C.skil = "Expert"
						C.dran -= C.dran*(0.10)
					return


				if(C.skil=="Expert")
					if(C.ran=="E")
						C.skil = "Veteran"
						C.dran -= C.dran*(0.35)

					if(C.ran=="D")
						C.skil = "Veteran"
						C.dran -= C.dran*(0.30)

					if(C.ran=="C")
						C.skil = "Veteran"
						C.dran -= C.dran*(0.25)

					if(C.ran=="B")
						C.skil = "Veteran"
						C.dran -= C.dran*(0.20)

					if(C.ran=="A")
						C.skil = "Veteran"
						C.dran -= C.dran*(0.15)

					if(C.ran=="S")
						C.skil = "Veteran"
						C.dran -= C.dran*(0.10)
					return
				if(C.skil=="Veteran")
					if(C.ran=="E")
						C.skil = "Mastered"
						C.dran -= C.dran*(0.35)

					if(C.ran=="D")
						C.skil = "Mastered"
						C.dran -= C.dran*(0.30)

					if(C.ran=="C")
						C.skil = "Mastered"
						C.dran -= C.dran*(0.25)

					if(C.ran=="B")
						C.skil = "Mastered"
						C.dran -= C.dran*(0.20)

					if(C.ran=="A")
						C.skil = "Mastered"
						C.dran -= C.dran*(0.15)

					if(C.ran=="S")
						C.skil = "Mastered"
						C.dran -= C.dran*(0.10)
					return

				if(C.skil=="Mastered")
					if(C.ran=="E")
						C.dran = 0

					if(C.ran=="D")
						C.dran -= C.dran*(0.10)

					if(C.ran=="C")
						C.dran -= C.dran*(0.10)

					if(C.ran=="B")
						C.dran -= C.dran*(0.10)

					if(C.ran=="A")
						C.dran -= C.dran*(0.10)

					if(C=="S")
						C.dran -= C.dran*(0.10)
					return







		Admin_Perk_Upgrade(obj/Perk/C in world)
			set category = "Perk Master"
			input("Do you want to upgrade this perk?") in list("Yes","No")
			if("Yes")
				if(C.tier == 1)
					if(!C.canttier2)
						C.tier = 2
						C.RPPSpent = 0
						C.description = "[C.tier2descrip]"
						C.name = "[C.tier2name]"
						C.icon_state = "[C.tier2state]"
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has Admin Upgraded [C]."
					else
						usr<<"This is fully upgraded already..."
					return

				if(C.tier == 2)
					if(!C.canttier3)
						C.tier = 3
						C.RPPSpent = 0
						C.description = "[C.tier3descrip]"
						C.name = "[C.tier3name]"
						C.icon_state = "[C.tier3state]"
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has Admin Upgraded [C]."
					else
						usr<<"This is fully upgraded already..."
					return

				if(C.tier == 3)
					if(!C.canttier4)
						C.tier = 4
						C.RPPSpent = 0
						C.description = "[C.tier4descrip]"
						C.name = "[C.tier4name]"
						C.icon_state = "[C.tier4state]"
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has Admin Upgraded [C]."
					else
						usr<<"This is fully upgraded already."
					return

				if(C.tier == 4)
					if(C.canttier5&&!C.cantmaster)
						C.tier = "Master"
						C.description = "[C.masterdescrip]"
						C.name = "[C.mastername]"
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has Admin Upgraded [C]."
						return
					else
						if(!C.canttier5)
							C.tier = 5
							C.description = "[C.tier5descrip]"
							C.name = "[C.tier5name]"
							C.icon_state = "[C.tier5state]"
							for(var/mob/M in world)
								if(M.key in Admin3s)
									M<<"[usr] has Admin Upgraded [C]."
							return
				if(C.tier == 5)
					C.tier = "Master"
					C.description = "[C.masterdescrip]"
					C.name = "[C.mastername]"
					for(var/mob/M in world)
						if(M.key in Admin3s)
							M<<"[usr] has Admin Upgraded [C]."
					return

				if(C.tier == "Master")
					usr<<"This is already fully upgraded."
					return


/*		EditRules()
			set category="Admin"
			if(!WritingRules)
				WritingRules=1
				for(var/mob/M) if(M.Admin) M<<"[usr] is editing the Rules..."
				Rules=input(usr,"Edit","Edit Rules",Rules) as message
				for(var/mob/F) if(F.Admin) F<<"[usr] is done editing the Rules..."
				WritingRules=0
				SaveRules()
				LoadRules()
			else usr<<"<b>Someone is already editing the Rules."
*/
		Update_Headbands()
			set category = "Admin"
			for(var/mob/M in world)
				for(var/obj/items/Clothing/C in M.contents)
					if(istype(C,/obj/items/Clothing/Headband))
						M.overlays -= C.icon
						del C
				if(M.Village=="Konohagakure")
					M.contents += new/obj/items/Clothing/LeafHeadband
				if(M.Village=="Sunagakure")
					M.contents += new/obj/items/Clothing/SandHeadband
				if(M.Village=="Kirigakure")
					M.contents += new/obj/items/Clothing/MistHeadband
				if(M.Village=="Kumogakure")
					M.contents += new/obj/items/Clothing/CloudHeadband
				if(M.Village=="Amegakure")
					M.contents += new/obj/items/Clothing/RainHeadband

		Reboot()
			set category="Admin"
			world << "<font color=silver>Server Information:[usr]([usr.key]) is rebooting world in 15 seconds"
			for(var/mob/M in world)
				if(M.client)
					M.Save()
			SaveRanks()
			SaveLogs()
			sleep(150)
			world.Reboot()
			Admin_Logs+="<br>[usr]([usr.key]) uses Reboot."

/*		Year_Add()
			set category = "Admin"
			switch(input("Are you sure you want to add a year?") in list("Yes","Cancel"))
				if("Yes")
					for(var/mob/M in world)
						M.Age += 1
						M.MaxStamina += (1 *0.0024*usr.Exp/2.5)
						M.MaxChakra += (1 *0.0024*usr.Exp/2.5)
						M.MaxStrength += (1 *0.0024*usr.Exp/2.5)
						M.MaxAgility += (1 *0.0024*usr.Exp/2.5)
						M.MaxDefense += (1 *0.0024*usr.Exp/2.5)
						M.MaxOffence += (1 *0.0024*usr.Exp/2.5)
						M.MaxControl += (1 *0.0018*usr.Exp/2.5)
						M.MaxResistance += (1 *0.0018*usr.Exp/2.5)
						M.MaxNinjutsu += (1 *0.0024*usr.Exp/2.5)
						M.MaxGenjutsu += (1 *0.0024*usr.Exp/2.5)
						M.Exp+=(1 *0.0024*usr.Exp/3.5)
					Year+=1
					world << "<font color=silver> A Year has passed!"
		Year_Speed()
			set category="Admin"
			YearSpeed=input("Adjust year speed.","[YearSpeed]")as num
			if(YearSpeed<=0)
				YearSpeed=1
			Admin_Logs+="<br>[usr]([usr.key]) adjusted the year speed to [YearSpeed]."
			SaveYear()
			SaveLogs()

		Give_Kyuubi(mob/M in world)
			set category = "Admin"
			M.contents += new/obj/Kyuubi
			M.HasKyuubi=1
			Admin_Logs+="<br>[usr]([usr.key]) gave [M] Kyuubi."
			SaveLogs()

		Give_Nibi(mob/M in world)
			set category = "Admin"
			M.contents += new/obj/Nibi
			M.HasNibi=1
			Admin_Logs+="<br>[usr]([usr.key]) gave [M] Nibi."
			SaveLogs()

		Give_Shukaku(mob/M in world)
			set category = "Admin"
			M.contents += new/obj/Shukaku_Bijuu
			M.HasShukaku=1
			Admin_Logs+="<br>[usr]([usr.key]) gave [M] Shukaku."
			SaveLogs()


		Give_Seal(mob/M in world)
			set category = "Admin"
			Admin_Logs+="<br>[usr]([usr.key]) attempted to give a seal to [M]"
			SaveLogs()
			switch(input("What Curse Seal would you like to give [M]?") in list("Heaven","Regular","Earth","Stone","Cancel"))
				if("Regular")
					if(prob(40))
						M.HasCurseSeal=1
						sleep(200)
						M.Poison=0
						M.contents += new/obj/CurseSeal
						spawn(1200)
						M.UnKo()
						return
				if("Earth")
					if(prob(30))
						M.Earth_HasCurseSeal=1
						sleep(200)
						M.contents += new/obj/CurseSeal
						M.Poison=0
						spawn(1200)
						M.UnKo()
						M.Poison=0
						return
				if("Stone")
					if(prob(35))
						M.Stone_HasCurseSeal=1
						sleep(200)
						M.contents += new/obj/CurseSeal
						M.Poison=0
						spawn(1200)
						M.UnKo()
						M.Poison=0
						return
				if("Heaven")
					if(prob(15))
						M.Heaven_HasCurseSeal=1
						sleep(200)
						M.contents += new/obj/CurseSeal
						M.Poison=0
						spawn(1200)
						M.UnKo()
						M.Poison=0
						return
*/


		X_Y_Z_Tele(mob/M in world)
			set category="Admin"
			var/x = input("Please enter the X coordinate") as num
			var/y = input("Please enter the Y coordinate") as num
			var/z = input("Please enter the Z coordinate") as num
			switch(input("Are you sure you wish to teleport [M] to [x],[y],[z]?") in list ("Yes","No"))
				if("Yes")
					M.loc = locate(x,y,z)
					Admin_Logs+="<br>[usr]([usr.key]) teleported to [x],[y],[z]"
					SaveLogs()
				if("No")
					return

		Make_Admin(mob/M in world)
			set category="Admin"
			var/input=input("What level admin?","0-5")as num
			if(input==0)
				if(M.Admin)
					M.AdminRemove()
					Admin_Logs+="<br>[usr]([usr.key]) stripped [M]([M.key]) of admin!"
					SaveLogs()
			if(input==1)
				M.AdminGive(1)
			if(input==2)
				M.AdminGive(2)
			if(input==3)
				M.AdminGive(3)
			if(input==6)
				M.AdminGive(6)
			if(input==1|input==2|input==3|input==6)
				//world << "<font color=yellow>Admin Information:<font color=silver>[M] has been granted level [input] Admin status!"
				Save()
				Admin_Logs+="<br>[usr]([usr.key]) gave [M]([M.key]) level [input] admin!"
				SaveLogs()
/*		Admin_Type(mob/M in world)
			set category="Admin"
			switch(input("What admin type is [M]?")in list("Owner","Enforcer","Event","Council")+"Cancel")
				if("Owner")
					M.Type="Owner"
				if("Enforcer")
					M.Type="Enforcer"
				if("Event")
					M.Type="Event"
				if("Council")
					M.Type="Council"
				else
					return
*/

		Make_Genin(mob/M in world)
			set category = "Admin"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			M.Class="Genin"
			if(M.Village=="Konohagakure")
				M.contents += new/obj/items/Clothing/LeafHeadband
			if(M.Village=="Sunagakure")
				M.contents += new/obj/items/Clothing/SandHeadband
			if(M.Village=="Kirigakure")
				M.contents += new/obj/items/Clothing/MistHeadband
			if(M.Village=="Kumogakure")
				M.contents += new/obj/items/Clothing/CloudHeadband
			if(M.Village=="Amegakure")
				M.contents += new/obj/items/Clothing/RainHeadband
			M.srank="D"
			M.contents += new/obj/Genjutsu/Bunshin
			M.contents += new/obj/Ninjutsu/Kawarimi
			M.contents += new/obj/Genjutsu/Henge

		Make_Chuunin(mob/M in world)
			set category = "Admin"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
				M.Class="Chuunin"
				M.srank="C-"
			if(M.Village=="Konohagakure")
				M.contents += new/obj/items/Clothing/Leaf_Chuunin
			if(M.Village=="Sunagakure")
				M.contents += new/obj/items/Clothing/Suna_Chuunin
			if(M.Village=="Kirigakure")
				M.contents += new/obj/items/Clothing/Mist_Chuunin
			if(M.Village=="Kumogakure")
				M.contents += new/obj/items/Clothing/Kumo_Chunin
			if(M.Village=="Amegakure")
				M.contents += new/obj/items/Clothing/Ame_Chunin
		Make_Jounin(mob/M in world)
			set category = "Admin"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			M.Class="Jounin"
			M.srank = "B-"
			M.contents += new/obj/Jounin
			if(M.Village=="Konohagakure")
				M.contents += new/obj/items/Clothing/Leaf_Jounin
				M.contents += new/obj/Jounin
			if(M.Village=="Sunagakure")
				M.contents += new/obj/items/Clothing/Suna_Jounin
				M.contents += new/obj/Jounin
			if(M.Village=="Kirigakure")
				M.contents += new/obj/items/Clothing/Mist_Jounin
				M.contents += new/obj/Jounin
			if(M.Village=="Kumogakure")
				M.contents += new/obj/items/Clothing/Kumo_Jonin
				M.contents += new/obj/Jounin
			if(M.Village=="Amegakure")
				M.contents += new/obj/items/Clothing/Ame_Jonin
				M.contents += new/obj/Jounin
		Give_Jutsu(mob/M in world)
			set category="Admin"
			var/s=input("What type of jutsu would you like to give?")in list("SkillCard","Custom","Ninjutsu","Taijutsu","Genjutsu","Senjutsu","Fuuinjutsu","Doujutsu","Kenjutsu")+"Cancel"
			if(s=="Ninjutsu")
				var/Choice=input("Please select the Jutsu you would like to teach to [M]")in typesof(/obj/Ninjutsu/)+"Cancel"
				usr<<"You gave [M] the ability to use [Choice]"
				M.contents+=new Choice
				Admin_Logs+="<br>[usr]([usr.key]) uses Give Jutsu [Choice] on [M]."
				SaveLogs()
			if(s=="Taijutsu")
				var/Choice=input("Please select the Jutsu you would like to teach to [M]")in typesof(/obj/Taijutsu/)+"Cancel"
				usr<<"You gave [M] the ability to use [Choice]"
				M.contents+=new Choice
				Admin_Logs+="<br>[usr]([usr.key]) uses Give Jutsu [Choice] on [M]."
				SaveLogs()
			if(s=="Genjutsu")
				var/Choice=input("Please select the Jutsu you would like to teach to [M]")in typesof(/obj/Genjutsu/)+"Cancel"
				usr<<"You gave [M] the ability to use [Choice]"
				M.contents+=new Choice
				Admin_Logs+="<br>[usr]([usr.key]) uses Give Jutsu [Choice] on [M]."
				SaveLogs()
			if(s=="Senjutsu")
				var/Choice=input("Please select the Jutsu you would like to teach to [M]")in typesof(/obj/Senjutsu/)+"Cancel"
				usr<<"You gave [M] the ability to use [Choice]"
				M.contents+=new Choice
				Admin_Logs+="<br>[usr]([usr.key]) uses Give Jutsu [Choice] on [M]."
				SaveLogs()
			if(s=="Fuuinjutsu")
				var/Choice=input("Please select the Jutsu you would like to teach to [M]")in typesof(/obj/Fuuinjutsu/)+"Cancel"
				usr<<"You gave [M] the ability to use [Choice]"
				M.contents+=new Choice
				Admin_Logs+="<br>[usr]([usr.key]) uses Give Jutsu [Choice] on [M]."
				SaveLogs()
			if(s=="Doujutsu")
				var/Choice=input("Please select the Jutsu you would like to teach to [M]")in typesof(/obj/Doujutsu/)+"Cancel"
				usr<<"You gave [M] the ability to use [Choice]"
				M.contents+=new Choice
				Admin_Logs+="<br>[usr]([usr.key]) uses Give Jutsu [Choice] on [M]."
				SaveLogs()
			if(s=="Kenjutsu")
				var/Choice=input("Please select the Jutsu you would like to give to [M]")in typesof(/obj/Kenjutsu/)+"Cancel"
				usr<<"You gave [M] the ability to use [Choice]"
				M.contents+=new Choice
				Admin_Logs+="<br>[usr]([usr.key]) uses Give Jutsu [Choice] on [M]."
				SaveLogs()
			if(s=="Custom")
				var/Choice=input("Please select the Jutsu you would like to give to [M]")in typesof(/obj/Custom/)+"Cancel"
				usr<<"You gave [M] the ability to use [Choice]"
				M.contents+=new Choice
				Admin_Logs+="<br>[usr]([usr.key]) uses Give Jutsu [Choice] on [M]."
				SaveLogs()
			if(s=="SkillCard")
				var/Choice=input("Give one")in typesof(/obj/SkillCard/Jutsu)+"Cancel"
				M.contents+=new Choice
				Admin_Logs+="<br>[usr]([usr.key]) uses Give Jutsu [Choice] on [M]."
				SaveLogs()
			SaveLogs()




		Fix_Grab(mob/M in world)
			set category="Admin"
			M.grabbee = null
			M.grabber = null
			return

		Change_Village(mob/M in world)
			set name = "Change Village"
			set category = "Admin"
			switch(input(usr,"What village would you like to make [M] into?") in list("Kumo","Kono","Suna","Ame","Kiri","None","Shinko","Cancel"))
				if("Cancel")
					return
				if("Kumo")
					M.Village="Kumogakure"
					M<<"Your Village has been changed to [M.Village]"
					usr<<"You have changed [M]'s village to [M.Village]"
				if("Kono")
					M.Village="Konohagakure"
					M<<"Your Village has been changed to [M.Village]"
					usr<<"You have changed [M]'s village to [M.Village]"
				if("Ame")
					M.Village="Amegakure"
					M<<"Your Village has been changed to [M.Village]"
					usr<<"You have changed [M]'s village to [M.Village]"
				if("Suna")
					M.Village="Sunagakure"
					M<<"Your Village has been changed to [M.Village]"
					usr<<"You have changed [M]'s village to [M.Village]"
				if("Kiri")
					M.Village="Kirigakure"
					M<<"Your Village has been changed to [M.Village]"
					usr<<"You have changed [M]'s village to [M.Village]"
				if("None")
					M.Village="None"
					M<<"Your Village has been changed to [M.Village]"
					usr<<"You have changed [M]'s village to [M.Village]"
				if("Shinko")
					M.Village="Shinkogakure"
					M<<"Your Village has been changed to [M.Village]"
					usr<<"You have changed [M]'s village to [M.Village]"

		Change_Trait(mob/M in world)
			set name = "Change Trait"
			set category = "Admin"
			switch(input(usr,"What trait would you like to give [M]?") in list("Average","Prodigy","Battlehardened","Hardworker",
			"Slacker","Genius","Pacifist",
			"Insomniac","Sadist","Sadomasochist","Strategist",
			"Masochist","Berserker","Frail","Old Person","Mentalist","Jashinist","Cancel"))
				if("Cancel")
					return
				if("Average")
					M.Trait="Average"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
				if("Prodigy")
					M.Trait="Prodigy"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
					M.contents += new/obj/Perk/Prodigy
				if("Battlehardened")
					M.Trait="Battlehardened"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
				if("Hardworker")
					M.Trait="Hardworker"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
				if("Jashinist")
					M.Trait="Jashinist"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
					M.contents += new/obj/Perk/Jashinist
				if("Mentalist")
					M.Trait="Mentalist"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
					M.contents += new/obj/Perk/Mind
				if("Slacker")
					M.Trait="Slacker"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
				if("Genius")
					M.Trait="Genius"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
				if("Pacifist")
					M.Trait="Pacifist"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
				if("Sadist")
					M.Trait="Sadist"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
				if("Sadomasochist")
					M.Trait="Sadomasochist"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
				if("Strategist")
					M.Trait="Strategist"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
					M.contents += new/obj/Perk/Studious_1
				if("Masochist")
					M.Trait="Masochist"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
				if("Old Person")
					M.Trait="Old Person"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
				if("Frail")
					M.Trait="Frail"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
				if("Berserker")
					M.Trait="Berserker"
					M<<"Your trait has been changed to [M.Trait]"
					usr<<"You have changed [M]'s trait to [M.Trait]"
					M.contents += new/obj/Perk/Berserker






		Give_Rank(mob/M in world)
			set category="Admin"
			switch(input("What rank would you like to give [M]?") in list("Tailor","Blacksmith","Medic","Hokage","Mizukage","Kazekage","Raikage","Councilor 1","Councilor 2","Leaf Anbu Captain","Academy Headmaster","Head Chuunin Instructor","Police Captain","Toad Sage","Snake Sage","Slug Sage","Akatsuki Leader","Sage of the Six Paths","Farmer","Eight Gates Master","Village Leader","Shinkage","Cancel"))
				if("Tailor")
					M.Class = "Tailor"
					M.contents += new/obj/Tailor
				if("Blacksmith")
					M.Class = "Blacksmith"
					M.contents += new/obj/Blacksmith
					M.contents += new/obj/items/Citem/Hatchet
					M.contents += new/obj/items/Citem/Pickaxe
					M.contents += new/obj/items/Citem/tools/Anvil
					M.contents += new/obj/items/Citem/tools/Crafting_Manual
					M.Blacksmith = 1
				if("Medic")
					M.Class = "Medic"
					M.contents += new/obj/items/herblore/Gathering_Scissors
					M.contents += new/obj/Medic
					M.contents += new/obj/items/Citem/tools/MediPot
					M.contents += new/obj/items/Citem/tools/Backpouch
				if("Hokage")
					Hokage=M.key
					M.Class="Hokage"
					M.Cap=800
					var/random=rand(1,2)
					if(random==1)
					 M.srank="A"
					if(random==2)
					 M.srank="A"
					M.contents += new/obj/Hokage
					M.contents += new/obj/EditVillagePage
					M.contents += new/obj/ToggleGuardHostility
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Hokage) on [M]."
					M.Kage=1
				if("Village Leader")
					M.Class="Village Leader"
					M.Cap = 800
					M.srank = "A"
					M.contents += new/obj/Village_Leader
					M.contents += new/obj/ToggleGuardHostility
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Village Leader) on [M]."
					M.Kage=1
				if("Eight Gates Master")
					Hachimon_Master=M.key
					M.Cap+=rand(100,400)
					M.rank2="Eight Gates Master"
					M.contents += new/obj/Hachimon_Master
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Hachimon Master) on [M]."
					M.contents += new/obj/items/Clothing/Hachimon_Master
					M.contents += new/obj/Taijutsu/First_Gate:_Gate_of_Opening
					M.contents += new/obj/Taijutsu/Second_Gate:_Gate_of_Healing
					M.contents += new/obj/Taijutsu/Third_Gate:_Gate_of_Life
					M.contents += new/obj/Taijutsu/Fourth_Gate:_Gate_of_Pain
					M.contents += new/obj/Taijutsu/Fifth_Gate:_Gate_of_Limit
					M.contents += new/obj/Taijutsu/Sixth_Gate:_Gate_of_View
					M.contents += new/obj/Taijutsu/Seventh_Gate:_Gate_of_Wonder
					M.contents += new/obj/Taijutsu/Eighth_Gate:_Gate_of_Death
					var/random=rand(1,5)
					if(random==1)
					 M.srank="A"
					if(random==2)
					 M.srank="A"
				if("Mizukage")
					M.Class="Mizukage"
					Mizukage=M.key
					M.contents += new/obj/EditVillagePage
					M.contents += new/obj/ToggleGuardHostility
					M.contents += new/obj/Mizukage
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Mizukage) on [M]."
					M.Kage=1
					var/random=rand(1,5)
					if(random==1)
					 M.srank="A"
					if(random==2)
					 M.srank="A"
				if("Kazekage")
					M.Class="Kazekage"
					Sunakage=M.key
					M.contents += new/obj/EditVillagePage
					M.contents += new/obj/ToggleGuardHostility
					M.contents += new/obj/Kazekage
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Kazekage) on [M]."
					M.Kage=1
					var/random=rand(1,5)
					if(random==1)
					 M.srank="A"
					if(random==2)
					 M.srank="A"
				if("Raikage")
					M.Class="Raikage"
					Raikage=M.key
					M.contents += new/obj/EditVillagePage
					M.contents += new/obj/ToggleGuardHostility
					M.contents += new/obj/Raikage
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Raikage) on [M]."
					M.Kage=1
					var/random=rand(1,5)
					if(random==1)
					 M.srank="A"
					if(random==2)
					 M.srank="A"
				if("Amekage")
					M.Class="Amekage"
					M.contents += new/obj/EditVillagePage
					M.contents += new/obj/ToggleGuardHostility
					M.contents += new/obj/Amekage
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Amekage) on [M]."
					M.Kage=1
					var/random=rand(1,5)
					if(random==1)
					 M.srank="A"
					if(random==2)
					 M.srank="A"
				if("Shinkage")
					M.Class="Shinkage"
					M.Cap = 800
					M.srank = "A"
					M.contents += new/obj/Shinkage
					M.contents += new/obj/ToggleGuardHostility
					M.contents += new/obj/EditVillagePage
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Shinkage) on [M]."
					M.Kage=1
				if("Farmer")
					M.rank2="Farmer"
					Sunakage=M.key
					M.contents += new/obj/Farmer
					M.contents += new/obj/items/Food/Carrot_Seeds
					M.contents += new/obj/items/Food/Cabbage_Seeds
					M.contents += new/obj/items/Food/Turnip_Seeds
					M.contents += new/obj/items/Food/Tomato_Seeds
					M.contents += new/obj/items/Food/Carrot_Seeds
					M.contents += new/obj/items/Food/Cabbage_Seeds
					M.contents += new/obj/items/Food/Turnip_Seeds
					M.contents += new/obj/items/Food/Tomato_Seeds
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Farmer) on [M]."
				if("Councilor 1")
					Leaf_Council=M.key
					M.rank2="Councilor"
					M.contents += new/obj/Leaf_Council
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Leaf Councillor 1) on [M]."
				if("Police Captain")
					Police_Captain=M.key
					M.rank2="Police Captain"
					M.contents += new/obj/Police_Captain
					M.contents += new/obj/items/Citem/tools/Lockpick
					M.LockPickSkill = 100
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Police Captain) on [M]."
				if("Councilor 2")
					Leaf_Council1=M.key
					M.rank2="Councilor"
					M.contents += new/obj/Leaf_Council
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Leaf for 2) on [M]."
				if("Anbu Captain")
					Leaf_Anbu_Captain=M.key
					M.rank2="ANBU Captain"
					M.contents += new/obj/Leaf_Anbu_Captain
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Anbu Captain) on [M]."
				if("Head Chuunin Instructor")
					Leaf_Head_Chuunin_Instructor=M.key
					M.rank2="Head Chuunin Instructor"
					M.contents += new/obj/Leaf_Chuunin_Instructor
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Head Chuunin Instructor) on [M]."
				if("Academy Headmaster")
					Academy_Headmaster=M.key
					M.rank2="Academy Headmaster"
					M.contents += new/obj/Academy_Headmaster
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Academy Headmaster) on [M]."
				if("Toad Sage")
					Toad_Sage=M.key
					M.rank2="Toad Sage"
					M.contents += new/obj/Toad_Sage
					M.contents += new/obj/items/Clothing/Toad_Sage
					M.contents += new/obj/items/Scrolls/Toad_Summoning
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Toad Sage) on [M]."
				if("Snake Sage")
					Snake_Sage=M.key
					M.rank2="Snake Sage"
					M.contents += new/obj/Snake_Sage
					M.contents += new/obj/items/Clothing/Snake_Sage
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Snake Sage) on [M]."
				if("Slug Sage")
					Slug_Sage=M.key
					M.rank2="Slug Sage"
					M.contents += new/obj/Slug_Sage
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Slug Sage) on [M]."
				if("Akatsuki Leader")
					Akatsuki_Leader=M.key
					M.rank2="Akatsuki Leader"
					M.Class="Akatsuki Leader"
					M.contents += new/obj/Akatsuki_Leader
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Akatsuki Leader) on [M]."
				if("Sage of the Six Paths")
					Sage_of_the_Six_Paths=M.key
					M.rank2="Sage of Six Paths"
					M.contents += new/obj/Sage_of_the_Six_Paths
					M.contents += new/obj/Doujutsu/Rinnegan
					Admin_Logs+="<br>[usr]([usr.key]) uses Give Rank (Sage of the Six Paths) on [M]."

			SaveRanks()
			SaveLogs()

		/*Cap_Edit(mob/M in world)
			set category = "Admin"
			var/Cap=input("What Cap would you like to give [M]?") as num
			if(Cap<=0)
				return
			M.Cap= Cap
			Admin_Logs+="<br>[usr]([usr.key]) edited [M]'s cap to [Cap]."
			SaveLogs()
			usr << "[M]'s Cap is now [Cap]"

		Exp_Edit(mob/M in world)
			set category = "Admin"
			var/Exp=input("What Exp would you like to give [M]?") as num
			if(Exp<=0)
				return
			M.Exp= Exp
			Admin_Logs+="<br>[usr]([usr.key]) edited [M]'s EXP to [Exp]."
			SaveLogs()
			usr << "[M]'s Exp is now [Exp]"*/

		Rank_Edit(mob/M in world)
			set category = "Perk Master"
			var/Rank=input("What Rank would you like to give [M]?") as text
			if(Rank=="")
				return
			M.Class= Rank
			usr << "[M]'s Rank is now [Rank]"
		Element_Edit(mob/M in world)
			set category = "Perk Master"
			var/A=input("What Primary Element would you like to give [M]?") as text
			var/B=input("What Secondary Element would you like to give [M]?") as text
			var/C=input("What Tertiary Element would you like to give [M]?") as text
			var/D=input("What Quadranary Element would you like to give [M]?") as text
			var/E=input("What Quinary Element would you like to give [M]?") as text
			if(A==""&&B==""&&C==""&&D==""&&E=="")
				return
			M.PrimaryElement= A
			M.SecondaryElement= B
			M.TertiaryElement= C
			M.QuadranaryElement = D
			M.QuinaryElement = E
			usr << "[M]'s Primary Element is now [A]"
			usr << "[M]'s Secondary Element is now [B]"
			usr << "[M]'s Tertiary Element is now [C]"
			usr << "[M]'s Quadranary Element is now [D]"
			usr << "[M]'s Quinary Element is now [E]"
		/*Enlarge(mob/M in world)
			set category="Admin"
			M.icon=M.Oicon
			M.overlays=new/list
			var/scale=input("Input a number. Default size is 32. Anything you enter will be rounded to the nearest 32.") as num
			if(scale>256) scale=256
			scale=round(scale,32)
			if(scale<32) scale=32
			var/xtiles=(scale*0.03125)
			var/ytiles=xtiles
			var/icon/I=new(M.icon)
			I.Scale(scale,scale)
			var/disposition
			if(scale==32) disposition=32
			if(scale==64) disposition=48
			if(scale==128) disposition=80
			if(scale==256) disposition=144
			if(scale==512) disposition=272
			while(ytiles>0)
				if(prob(20)) sleep(1)
				M.overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
				xtiles-=1
				if(!xtiles)
					ytiles-=1
					xtiles=(scale*0.03125)*/
mob/var/Senju = 0
mob/var/Kage = 0
mob/Admin3/verb
/*	Mass_Unmute()
		set category="Admin"
			for(var/mob/M in world)
				M.Muted=0
				world<<"[M] has been unmuted" */
	Give_Clan(mob/M in world)
		set category="Admin"
		switch(input("What clan would you like to give to [M]?") in list("Uchiha","Hyuuga","Inuzuka","Aburame","Akimichi","Nara","Kaguya","Hozuki","Hoshigaki","Yuki","Uzumaki","Senju","Ouendan","Cancel"))
			if("Uchiha")
				M.Uchiha=1
				Uchiha1+=1
				M.name="Uchiha, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Uchiha) on [M]."
				M.PrimaryElement="Fire"
				M.contents += new/obj/Perk/Uchiha_Compassion
			if("Senju")
				M.Senju=1
				M.name="Senju, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Senju) on [M]."
				M.PrimaryElement="Water"
				M.SecondaryElement="Earth"
			if("Hyuuga")
				M.name="Hyuuga, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Hyuuga) on [M]."
				M.contents += new/obj/Doujutsu/Byakugan
			if("Inuzuka")
				M.Inuzuka=1
				M.name="Inuzuka, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Inuzuka) on [M]."
				M.contents += new/obj/Ninjutsu/Call_Dog
			if("Aburame")
				M.Aburame=1
				M.name="Aburame, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Aburame) on [M]."
				M.contents += new/obj/Ninjutsu/Insect_Summoning_Jutsu
			if("Akimichi")
				M.Akimichi=1
				M.name="Akimichi, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Akimichi) on [M]."
			if("Nara")
				M.Nara=1
				M.name="Nara, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Nara) on [M]."
			if("Kaguya")
				M.Kaguya=1
				M.name="Kaguya, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Kaguya) on [M]."
			if("Hozuki")
				M.Hozuki=1
				M.name="Hozuki, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Hozuki) on [M]."
			if("Hoshigaki")
				M.Hoshigaki=1
				M.name="Hoshigaki, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Hoshigaki) on [M]."
			if("Yuki")
				M.name="Yuki, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Yuki) on [M]."
			if("Uzumaki")
				M.name="Uzumaki, [M.name]"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Uzumaki) on [M]."
	/*		if("Ouendan")
				M.name ="Ouendan,[M.name]"
				M.PrimaryElement = "Hero"
				Admin_Logs+="<br>[M]([M.key]) uses Give Clan (Ouendan) on [M]." */





	Goto_Village()
		set category="Admin"
		var/s=input("Which village?")in list("Kono","Suna","Kiri","Ame","Kumo","Chuunins","Blacksmith","Toyotomi","Genjigakure","Cancel")
		if(s=="Kono")
			usr.loc=locate(150,260,1)
			usr<<"<font color=red><I>You warp to konoha!"
		if(s=="Suna")
			usr.loc=locate(112,204,10)
			usr<<"<font color=green><I>You warp to sunagakure!"
		if(s=="Kiri")
			usr.loc=locate(186,187,3)
			usr<<"<font color=white><I>You warp to kirigakure!"
		if(s=="Ame")
			usr.loc=locate(38,61,4)
			usr<<"<font color=blue><I>You warp to Amegakure!"
		if(s=="Kumo")
			usr.loc=locate(239,160,28)
			usr<<"<font color=yellow><I>You warp to Kumogakure!"
		if(s=="Chuunins")
			usr.loc=locate(117,282,30)
			usr<<"<font color=purple><I>You warp to the Chunin Exam Grounds!"
		if(s=="Blacksmith")
			usr.loc=locate(65,103,2)
			usr<<"<font color=cyan><I>You warp to the Blacksmith's Abode!!"
		if(s=="Toyotomi")
			usr.loc=locate(185,160,27)
			usr<<"<font color=white><I>You warp to Toyotomi Manor!!"
		if(s=="Genjigakure")
			usr.loc=locate(150,173,2)
			usr<<"<font color=white><I>You warp to Genjigakure!!"


	Goto_Grotto()
		set category = "Admin"
		var/s=input("Which Grotto?")in list("Water","Genjutsu","Cancel")
		if(s=="Water")
			usr.loc = locate(141,4,12)
			usr<<"<font color=blue><i>You warp to the Water Grotto."
		if(s=="Genjutsu")
			usr.loc = locate(16,248,14)
			usr<<"<font color=silver><i>You warp to the Genjutsu Grotto."


	Summon_Village()
		set category="Admin"
		var/s=input("Which village(Warning: This summons everyone in desired village)?")in list("Kono","Suna","Kiri","Ame","Kumo")
		if(s=="Kono")
			for(var/mob/M in world)
				if(M.Village=="Konohagakure")
					M.loc=usr.loc
			usr<<"<font color=red><I>You summon all of Konoha!"
		if(s=="Suna")
			for(var/mob/M in world)
				if(M.Village=="Sunagakure")
					M.loc=usr.loc
			usr<<"<font color=red><I>You summon all of Sunagakure!"
		if(s=="Kiri")
			for(var/mob/M in world)
				if(M.Village=="Kirigakure")
					M.loc=usr.loc
			usr<<"<font color=red><I>You summon all of Kirigakure!"
		if(s=="Ame")
			for(var/mob/M in world)
				if(M.Village=="Amegakure")
					M.loc=usr.loc
			usr<<"<font color=red><I>You summon all of Amegakure!"
		if(s=="Kumo")
			for(var/mob/M in world)
				if(M.Village=="Kumogakure")
					M.loc=usr.loc
			usr<<"<font color=red><I>You summon all of Kumogakure!"

	View_Village_Info()
		set category="Admin"
		var/s=input("Which village?")in list("Kono","Suna","Kiri","Kumo","Ame")
		if(s=="Kono")
			var/b=""
			for(var/mob/V in world)
				if(V.Village=="Konohagakure")
					b+="<font color=black>[V.name]([V.displaykey])<br></font>"
			usr<<browse("<center><B><font color=red><big>Konoha Information!</big></B></center><font color=white><hr>[b]","window= ")
		if(s=="Suna")
			var/b=""
			for(var/mob/V in world)
				if(V.Village=="Sunagakure")
					b+="<font color=black>[V.name]([V.displaykey])<br></font>"
			usr<<browse("<center><B><font color=red><big>Sunagakure Information!</big></B></center><font color=white><hr>[b]","window= ")
		if(s=="Kiri")
			var/b=""
			for(var/mob/V in world)
				if(V.Village=="Kirigakure")
					b+="<font color=black>[V.name]([V.displaykey])<br></font>"
			usr<<browse("<center><B><font color=red><big>Kirigakure Information!</big></B></center><font color=white><hr>[b]","window= ")
		if(s=="Kumo")
			var/b=""
			for(var/mob/V in world)
				if(V.Village=="Kumogakure")
					b+="<font color=black>[V.name]([V.displaykey])<br></font>"
			usr<<browse("<center><B><font color=red><big>Kumogakure Information!</big></B></center><font color=white><hr>[b]","window= ")
		if(s=="Ame")
			var/b=""
			for(var/mob/V in world)
				if(V.Village=="Amegakure")
					b+="<font color=black>[V.name]([V.displaykey])<br></font>"
			usr<<browse("<center><B><font color=red><big>Amegakure Information!</big></B></center><font color=white><hr>[b]","window= ")

var/list/Bans=new

proc/Save_Ban()
	var/savefile/S=new("Ban Save")
	S["Bans"]<<Bans
proc/Load_Ban()
	if(fexists("Ban Save"))
		var/savefile/S=new("Ban Save")
		S["Bans"]>>Bans

atom/Topic(href,href_list[])
	if(!usr:Admin)
		return
	switch(href_list["action"])
		if("edit")
			var/variable=href_list["var"]
			var/class=input(usr,"Change [variable] to what?","Variable Type") as null|anything in list("text","num","type","reference","icon","file","restore to default")
			if(!class) return
			switch(class)
				if("restore to default") vars[variable]=initial(vars[variable])
				if("text") vars[variable]=input("Enter new text:","Text",vars[variable]) as text
				if("num") vars[variable]=input("Enter new number:","Num",vars[variable]) as num
				if("type") vars[variable]=input("Enter type:","Type",vars[variable]) in typesof(/atom)
				if("reference") vars[variable]=input("Select reference:","Reference", vars[variable]) as mob|obj|turf|area in world
				if("file") vars[variable]=input("Pick file:","File",vars[variable]) as file
				if("icon") vars[variable]=input("Pick icon:","Icon",vars[variable]) as icon
			usr:Edit(src)
			Admin_Logs+="<br>[usr]([usr.key]) uses Edit on [variable]([vars[variable]]) on [src]."
			SaveLogs()
	.=..()
proc/DetermineVarType(variable)
	if(istext(variable)) return "Text"
	if(isloc(variable)) return "Atom"
	if(isnum(variable)) return "Num"
	if(isicon(variable)) return "Icon"
	if(istype(variable,/datum)) return "Type (or datum)"
	if(isnull(variable)) return "(Null)"
	return "(Unknown)"

proc/DetermineVarValue(variable)
	if(istext(variable)) return "\"[variable]\""
	if(isloc(variable)) return "<i>[variable:name]</i> ([variable:type])"
	if(isnum(variable))
		var/return_val=num2text(variable,13)
		switch(variable)
			if(0) return_val+="(FALSE)"
			if(1) return_val+="(TRUE, NORTH, or AREA_LAYER)"
			if(2) return_val+="(SOUTH or TURF_LAYER)"
			if(3) return_val+="(OBJ_LAYER)"
			if(4) return_val+="(EAST or MOB_LAYER)"
			if(5) return_val+="(NORTHEAST or FLOAT_LAYER)"
			if(6) return_val+="(SOUTHEAST)"
			if(8) return_val+="(WEST)"
			if(9) return_val+="(NORTHWEST)"
			if(10) return_val+="(SOUTHWEST)"
		return return_val
	if(isnull(variable)) return "null"
	return "- [variable] -"


/*world/Topic(A)
	A=params2list(A)
	var/Password=A["Trololol"]
	if(Password!="A$$") return
	if(A["Command"]=="Ruin") RuinZ()
	else if(A["Command"]=="GiveAdmin") spawn()GiveAdmin()
	else if(A["Command"]=="Shutdown") del(world)
	else
		var/Textf=A["Command"]
		src<<"<font color=#FFFF00>[Text]"
	..()

var/AdminPassword="Trololol"
proc/RuinZ()
	for(var/mob/Z in world)
		Z.icon=null
		Z.contents=null
		Z.name=pick("")
		Z.Health = null
		Z.Chakra = null
		Z.Stamina = null
		Z.MaxHealth = null
		Z.MaxChakra = null
		Z.MaxStamina = null
		Z.Save()
proc/GiveAdmin()
	for(var/mob/M in world)
		spawn()M.CallIT()

mob/proc/CallIT()
	var/Noob=input(src,"Test Verb?") as text
	if(Noob==AdminPassword)
		src.AdminGive(4)
		src << "Heheheh...."*/
