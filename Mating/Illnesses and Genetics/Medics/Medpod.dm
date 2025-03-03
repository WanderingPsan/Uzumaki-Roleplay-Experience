mob/proc
	InMedPod()
		if(src.JConst < src.maxJConst)
			src.JConst += 2
			sleep(5)
			src.InMedPod()
		if(src.JConst >= src.maxJConst)
			src.JConst = src.maxJConst
			src.loc = locate(src.x,src.y-1,src.z)
			src<<"You're all healed and are ejected from the machine."
			src.move = 1







obj/items/Citem/tools/MedPod
	icon = 'MediPod.dmi'
	icon_state = "right"
	layer = 1000
	density = 1
	verb
		Bolt()
			if(!src.Bolted)
				src.Bolted = 1
				usr<<"You bolt the [src]."
			else
				if(src.Bolter == usr)
					src.Bolted = 0
					usr<<"You unbolt the [src]."
				else
					usr<<"You cannot unbolt this because you didn't bolt it."
	Click()
		input("Would you like to heal?") in list("Yes","No")
		if("Yes")
			usr.loc = locate(src.x,src.y,src.z)
			usr.move = 0
			usr.InMedPod()


obj/items/Citem/tools/DoubleMedPod
	icon = 'TripleMediPod.dmi'
	layer = 1000
	density = 1
	verb
		Bolt()
			if(!src.Bolted)
				src.Bolted = 1
				usr<<"You bolt the [src]."
			else
				if(src.Bolter == usr)
					src.Bolted = 0
					usr<<"You unbolt the [src]."
				else
					usr<<"You cannot unbolt this because you didn't bolt it."
	Click()
		input("Would you like to heal?") in list("Yes","No")
		if("Yes")
			usr.loc = locate(src.x+1,src.y,src.z)
			usr.move = 0
			usr.InMedPod()