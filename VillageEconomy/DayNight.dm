mob/Admin1
//	verb
//		Toggle_Day_Night()
//			set category = "Admin"
//			if(Night)
//				world<<"It is now daytime."
//				Night = 0
//				for(var/area/A in world)
//					if(A.Outside)
//						A.icon_state = "day"
//					//	for(var/mob/M in world)
//					//		if(M.Vampire&&M.Vulnerable)
//					//			M.VampireDayCheck()
///				return
//			if(!Night)
//				world<<"It is now nighttime."
//				Night = 1
//				for(var/area/A in world)
//					if(A.Outside)
//						A.icon_state = "night"
//				return

area
	var/Outside = 0
	Day
		icon = 'Death Buffer.dmi'
		icon_state = "day"
		Outside = 1
		layer = MOB_LAYER+10+5+100
	//	desc="Taera; Home of the Human race and HQ of the Alliance and Team Rokuyukai."
	//	Entered(mob/O)
	//		if(!O.OnEarth)
	//			O.OnEarth=1
	//			O << desc
	//		else
	//			return


proc/DayCycle()
	//set background = 1
	world<<"It is now daytime."
	Night = 0
	for(var/area/A in world)
		if(A.Outside)
			A.icon_state = "day"
	sleep(DaySpeed)
	world<<"It is now nighttime."
	Night = 1
	for(var/area/A in world)
		if(A.Outside)
			A.icon_state = "night"
	sleep(DaySpeed)
	DayCycle()