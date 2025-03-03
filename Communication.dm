

mob
	proc
		RPGainCheck()
			if(!usr.RPGain)
				sleep(600)
				usr.RPGain=1



mob
	verb
		View_Own_RP_Log()
			usr<<browse(usr.RPLOG,"window=Logs;size=400x400")


var/RPing=0
var/OOC=1
var/Say=1

mob/var
	OOCFont = "purple"
	SayFont = "cyan"
	OSayFont = "cyan"
	OOCon=1
	Atton=1
	OOCAC = 1
	OOCAH = 1
	height = 25
	width =25
	RPGain = 1

obj/RPing
	icon='Bubble.dmi'
	pixel_x=18
	pixel_y=22
	layer=99

mob/proc/File_Size(file)
	var/size=length(file)
	if(!size||!isnum(size)) return
	var/ending="Byte"
	if(size>=1024)
		size/=1024
		ending="KB"
		if(size>=1024)
			size/=1024
			ending="MB"
			if(size>=1024)
				size/=1024
				ending="GB"
	var/end=round(size)
	return "[Commas(end)] [ending]\s"

proc/Commas(A)
	var/Number=num2text(round(A,1),20)
	for(var/i=lentext(Number)-2,i>1,i-=3) Number="[copytext(Number,1,i)],[copytext(Number,i)]"
	return Number




mob/proc/ChatLog(Info)
	var/wtf=0
	if(src.client)
		var/date = time2text(world.realtime)
		Loggit
		wtf+=1
		var/XXX=file("SSO/ChatLogs/[src.ckey]/[src.ckey][wtf].txt")
		if(fexists(XXX))
			var/size=length(XXX)
			if(size>(1024*100))
				goto Loggit
			else
				XXX<<"<br><br>[Info] - [date]"
		else
			XXX<<"<br>[Info] - [date]"
	return

mob/proc/SpyLand(Info)
	var/wtf=0
	if(src.client)
		var/date = time2text(world.realtime)
		Loggit
		wtf+=1
		var/XXX=file("SSO/SpyLand/[src.ckey]/[src.ckey][wtf].txt")
		if(fexists(XXX))
			var/size=length(XXX)
			if(size>(1024*100))
				goto Loggit
			else
				XXX<<"<br><br>[Info] - [date]"
		else
			XXX<<"<br>[Info] - [date]"
	return


mob/verb
	Options()
		if(usr.Admin)
			switch(input("What would you like to do?") in list ("Change Chat Color","Toggle NIC","Edit Profile","Screen size","Toggle OOC","Toggle Admin Help in OOC","Toggle Admin Chat in OOC"))
				if("Toggle Admin Help in OOC")
					if(usr.OOCAH)
						usr<<"You will no longer see Admin Help in OOC"
						usr.OOCAH = 0
					else
						usr<<"You will now see Admin Helps in OOC."
						usr.OOCAH = 1
				if("Toggle Admin Chat in OOC")
					if(usr.OOCAC)
						usr<<"You will no longer see Admin Chat in OOC"
						usr.OOCAC = 0
					else
						usr<<"YOu will now see Admin Chat in OOC."
						usr.OOCAC = 1
				if("Toggle NIC")
					var/NICOn = input("Do you want your Profile shown or your NiC?")in list("Profile","NIC")
					if(NICOn == "Profile")
						usr.NiCOn = 0
					if(NICOn == "NIC")
						usr.NiCOn = 1
				if("Change Chat Color")
					switch(input("Which would you like to change?") in list ("OOC","IC"))
						if("OOC")
							var/c = input ("Select a color to change your Out of Character Character chat to") as color
							OOCFont="[c]"
						if("IC")
							var/c = input ("Select a color to change your In Character chat to") as color
							SayFont="[c]"
							OSayFont="[c]"
				if("Edit Profile")
					profile=input(usr,"Edit","Edit Profile",profile) as message
				if("Toggle OOC")
					if(OOCon)
						usr << "Your OOC has been disabled"
						OOCon=0
					else
						usr << "Your OOC has been enabled"
						OOCon=1

				if("Screen size")
					var/width=input("Enter the width of the screen, max is 50.") as num
					var/height=input("Enter the height of the screen, max is 50.") as num
					if(width>50)
						usr.width=50
					if(width<1)
						usr.width=1
					if(height>50)
						usr.height=50
					if(height<1)
						usr.height=1
					usr.width = width
					usr.height = height
					client.view="[usr.width]x[usr.height]"

		if(!usr.Admin)
			switch(input("What would you like to do?") in list ("Change Chat Color","Edit Profile","Screen size","Toggle OOC","Toggle NIC"))
				if("Change Chat Color")
					switch(input("Which would you like to change?") in list ("OOC","IC"))
						if("OOC")
							var/c = input ("Select a color to change your Out of Character Character chat to") as color
							OOCFont="[c]"
						if("IC")
							var/c = input ("Select a color to change your In Character chat to") as color
							SayFont="[c]"
							OSayFont="[c]"
				if("Edit Profile")
					profile=input(usr,"Edit","Edit Profile",profile) as message
				if("Toggle NIC")
					var/NICOn = input("Do you want your Profile shown or your NiC?")in list("Profile","NIC")
					if(NICOn == "Profile")
						usr.NiCOn = 0
					if(NICOn == "NIC")
						usr.NiCOn = 1
				if("Toggle OOC")
					if(OOCon)
						usr << "Your OOC has been disabled"
						OOCon=0
					else
						usr << "Your OOC has been enabled"
						OOCon=1

				if("Screen size")
					var/width=input("Enter the width of the screen, max is 50.") as num
					var/height=input("Enter the height of the screen, max is 50.") as num
					if(width>50)
						usr.width=50
					if(width<1)
						usr.width=1
					if(height>50)
						usr.height=50
					if(height<1)
						usr.height=1
					usr.width = width
					usr.height = height
					client.view="[usr.width]x[usr.height]"

	Village_Say(msg as text)
		usr.Mute_Check()
		if(msg==""||!global.OOC)
			return
		if(usr.Muted)
			usr<<"Shut the fuck up."
			return
		var/thetext=copytext(msg,1,250)
		for(var/mob/M in world)
			if(M.Village==Village)
				if(get_dist(usr,M) <= 50)
					if(Class=="Hokage"||Class=="Kazekage"||Class=="Mizukage"||Class=="Leader"||Class=="Raikage"||Class=="Amekage")M<<output("<b><font color=[usr.OOCFont]>([Village]): ([Class] [srank])([rank2])[usr]: [html_encode(thetext)]")
					else M<<output("<font color=[usr.OOCFont]>([Village]): ([Class] [srank])([rank2])[usr]: [html_encode(thetext)]","World.OOC")

	OOC(msg as text)
		usr.Mute_Check()
		if(msg==""||!global.OOC)
			return
		if(usr.Muted)
			usr<<"Shut the fuck up."
			return
		var/thetext=copytext(msg,1,500)
		for(var/mob/M in world)
			if(M.OOCon&&!M.perkmaster==1)
				M << output("<font color=[usr.OOCFont]>(<font color = white>World<font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>([displaykey])<font color=white>: [html_encode(thetext)]","World.OOC")
			if(M.OOCon&&M.perkmaster==1)
				M << output("<font color=[usr.OOCFont]>(<font color = white>World<font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>([usr])([displaykey])<font color=white>: [html_encode(thetext)]","World.OOC")






	Shout(msg as text)
		if(msg==""||!global.Say)
			return
		var/thetext=copytext(msg,1,1000)
		for(var/mob/M in viewers(18))
			if(!findtext(thetext,")")&&!findtext(thetext,"(")&&!findtext(thetext,"\[")&&!findtext(thetext,"\]")&&!findtext(thetext,"{")&&!findtext(thetext,"}"))
				M << output("<font color=[usr.SayFont]>[usr] shouts,<font color = white> [html_encode(thetext)]","World.IC")
			//	M.ChatLog("<font color=teal>*[src.name]([src.key]) whispers, '[msg]'")
				M.SpyLand("<font color=teal>*[src.name]([src.key]) whispers, '[msg]'")
			else
				M << output("<font color=[usr.SayFont]>[usr] OOCly shouts,<font color = white> [html_encode(thetext)]","World.OOC")
				M.SpyLand("<font color=red>*[src.name]([src.key]) OOCly shouts, '[msg]'")


	Whisper(msg as text)
		if(msg==""||!global.Say)
			return
		var/thetext=copytext(msg,1,1000)
		for(var/mob/M in viewers(2))
			if(!M in viewers(5))
				M << output("<font color=[usr.SayFont]>[usr] whispers something.")
			if(!findtext(thetext,")")&&!findtext(thetext,"(")&&!findtext(thetext,"\[")&&!findtext(thetext,"\]")&&!findtext(thetext,"{")&&!findtext(thetext,"}"))
				M << output("<font color=[usr.SayFont]>[usr] whispers,<font color = white> [html_encode(thetext)]","World.IC")
			//	M.ChatLog("<font color=teal>*[src.name]([src.key]) whispers, '[msg]'")
				M.SpyLand("<font color=teal>*[src.name]([src.key]) whispers, '[msg]'")
			else
				M << output("<font color=[usr.SayFont]>[usr] OOCly whispers,<font color = white> [html_encode(thetext)]","World.OOC")
				M.SpyLand("<font color=red>*[src.name]([src.key]) OOCly whispers, '[msg]'")


	Say(msg as text)
		if(msg==""||!global.Say)
			return
		var/thetext=copytext(msg,1,1000)
		for(var/mob/M in viewers(10))
			if(!findtext(thetext,")")&&!findtext(thetext,"(")&&!findtext(thetext,"\[")&&!findtext(thetext,"\]")&&!findtext(thetext,"{")&&!findtext(thetext,"}"))
				M << output("<font color=[usr.SayFont]>[usr] says,<font color = white> [html_encode(thetext)]","World.IC")
			//	M.ChatLog("<font color=teal>*[src.name]([src.key]) whispers, '[msg]'")
				M.SpyLand("<font color=teal>*[src.name]([src.key]) says, '[msg]'")
			else
				M << output("<font color=[usr.SayFont]>[usr] OOCly says,<font color = white> [html_encode(thetext)]","World.OOC")
				M.SpyLand("<font color=red>*[src.name]([src.key]) OOCly says, '[msg]'")


	Think(msg as text)
		if(msg==""||!global.Say)
			return
		var/thetext=copytext(msg,1,1000)
		for(var/mob/M in viewers(10))
			if(!findtext(thetext,")")&&!findtext(thetext,"(")&&!findtext(thetext,"\[")&&!findtext(thetext,"\]")&&!findtext(thetext,"{")&&!findtext(thetext,"}"))
				M << output("<font color=[usr.SayFont]>[usr] thinks,<font color = white><i> [html_encode(thetext)]</i>","World.IC")
			//	M.ChatLog("<font color=teal>*[src.name]([src.key]) whispers, '[msg]'")
				M.SpyLand("<font color=teal>*[src.name]([src.key]) thinks, '[msg]'")
			else
				M << output("<font color=[usr.SayFont]>[usr] OOCly thinks,<font color = white><i> [html_encode(thetext)]</i>","World.OOC")
				M.SpyLand("<font color=red>*[src.name]([src.key]) OOCly thinks, '[msg]'")




	Roleplay()
		usr.overlays += /obj/RPing
		var/msg = input(usr, "Type your message!","Roleplay") as null|message
		if("Cancel")
			usr.overlays -= /obj/RPing
		if(msg)
			viewers(18) << output("<font color = white><font color=[usr.SayFont]>[usr] [html_encode(msg)]<font color = white>","World.IC")
			usr.ChatLog("<font color=yellow>*[src.name]([src.key]) [msg]*")
			usr.SpyLand("<font color=yellow>*[src.name]([src.key]) [msg]*")
			usr.JConst -= 2
			usr.Constitution_Check()
			usr.SicknessDrain()
			usr.Illness_Obtain()
			if(usr.weighted&&usr.RPGain)
				if(prob(45))
					usr.RPP += 0.1*usr.weightson
			if(usr.RPGain)
				if(prob(90))
					usr.RPP += RPPGaint
					usr.RPGain=0
					if(length(msg) > 2000)
						usr.RPP += RPPGaint*2
					usr.RPGainCheck()
			if(usr.Buffed)
				for(var/obj/Custom/Blank_Buff/O in usr.contents)
					if(O.Activo)
						if(O.GChak < 0)
							usr.Jchakra += O.GChak
						if(O.GStam < 0)
							usr.Jstam += O.GStam

			usr.overlays -= /obj/RPing



	TurnEAST()
		set hidden= 1
		usr.dir=EAST
		return
	TurnSOUTH()
		set hidden= 1
		usr.dir=SOUTH
		return
	TurnWEST()
		set hidden= 1
		usr.dir=WEST
		return
	TurnNORTH()
		set hidden= 1
		usr.dir=NORTH
		return

	Roll()
		var/dice=rand(1,6)
		view()<<"<font color=[usr.OOCFont]>*[usr] starts to shake their dice*"
		sleep(30)
		view()<<"<font color=[usr.OOCFont]>[usr] has rolled a [dice]!"

	Give_Money(mob/M in oviewers())
		if(M.client.address==usr.client.address)
			world<<"[usr] has tried to give yen to their alt!"
			return
		var/amount = input("How much Yen would you like to give [M]?") as num
		if(amount > usr.Yen)
			return
		if(amount < 0)
			return
		M.Yen += amount
		usr.Yen -= amount



mob/verb/Who()
	var/amount=0
	var/Who={"<html><center>
<head><title>Who's Online</title><body>
<body bgcolor="black"><font family='Comic Sans MS'><font size=2><font color="#0099FF"><b>
</body><html>"}
	for(var/mob/M)
		if(M.client&&M.Admin!=5)
			amount+=1
			Who+={"<html><center>
<head><title>Who's Online</title><body>
<body bgcolor="black" background="WHOBACK.png"><font family='Comic Sans MS'><font size=2><font color="#0099FF"><b>
<br><font color=white>(<font color=[M.OOCFont]>[M.displaykey]</font>)
</body><html>"}
	Who+={"<html>
	<head><title></head></title><body>
	<body bgcolor="black"><font family='Comic Sans MS'><font size=2><font color=red><b>
	<br><br><u>[amount] player(s) online</u>
	</body><html>"}
	usr<<browse(Who,"window=Who;size=200x400;can_resize=0")
	Who={"<html><center>
<head><title>Who's Online</title><body>
<body bgcolor="black" background="WHOBACK.png"><font family='Comic Sans MS'><font size=2><font color="#0099FF"><b>
</body><html>"}