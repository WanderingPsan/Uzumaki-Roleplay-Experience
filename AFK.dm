mob/var/AFK=0
mob/verb
	AFK()
		if(usr.AFK==0)
			usr.overlays+='Rain.dmi'
			usr.AFK=1
			world<<"[usr] has gone AFK!"
			return
		if(usr.AFK==1)
			usr<<"You are already AFK!!"
			return
		else
	UnAFK()
		if(usr.AFK==1)
			usr.overlays-='Rain.dmi'
			usr.AFK=0
			world<<"[usr] has come back from AFK!"
			return
		if(usr.AFK==0)
			usr<<"You aren't AFK!"
			return