mob/var
	RPLOG={"<html><body><center><background color = "black"><font color ="grey" size = 2>"}


mob/verb/LogClose()
	set hidden = 1
	set name = ".LoggieClose"
	var/Crackers = winget(src,"Tit","text")
	var/Cheese = winget(src,"Inp","text")
	var/date = time2text(world.realtime)
	if(findtext("[Crackers]",".",1,3))
		Crackers = "This RP isn't titled, therefore it doesn't count towards anything."
		src<<"Your RP wasn't titled so the Admin will simply ignore it...Or they may come and tell you..Either way..You need to resubmit."
	RPLOG += {""<html><body><center><background color = "black"><font color ="grey" size = 2>"<br><hr><br><font size = 3><b>[Crackers] - [date]</b><font><hr><br>[Cheese]<br>"}
	winshow(usr,"RPLog",0)
	winset(src,"Tit","text=null")
	winset(src,"Inp","text=null")
	var/list/O = new/list
	for(var/mob/M in world)
		O.Add(M)
	for(var/mob/P in O)
		if(P.Admin >= 1)
			P<<"[src] has submitted an RP!"





mob
	verb
		RP_Train()
			var/V = input("Would you like to submit an RP for Training reasons?","Warning: Abusing this in any form will result in your RPs being ignored.") in list("Yes","No")
			alert(usr,"Please be sure to submit one massive post at a time. If you no listen, your logs have a higher chance of being wiped when too much RPies are submitted. Also keep in mind that you must submit these RPies via Roleplay Verb as well. Number your RPies too. IE: Every 4-5 sentence, put {number paragraph}.")
			if(V=="Yes")
				winshow(usr,"RPLog",1)
			if(V=="No")
				return