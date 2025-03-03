var
	Daytime = 0
	Nighttime = 1
	Day = 1
	Month = 1
	Year = 405
	DayTicked = 0
	MonthTicked = 0
	YearTicked = 0

mob/verb
	Check_Time_Of_Day()
		usr<<"[world.timeofday]"

proc
	TimePassage()
	//	set background = 1
		while(world.timeofday <= 259200/6)
			Daytime = 1
			Nighttime = 0
			if(!DayTicked)
				Day += 1
				DayTicked = 1
				if(!MonthTicked)
					if(Day == 31)
						Month += 1
						MonthTicked = 1
						if(!YearTicked)
							if(Month == 13)
								Year += 1
								YearTicked=1

		while(world.timeofday > 259200/6 && world.timeofday < (259200/6)*3)
			Daytime = 0
			Nighttime = 1

		while(world.timeofday >= (259200/6)*3 && world.timeofday < (259200/6)*5)
			Daytime = 1
			Nighttime = 0
			if(!DayTicked)
				Day += 1
				DayTicked = 1
				if(!MonthTicked)
					if(Day == 31)
						Month += 1
						MonthTicked = 1
						if(!YearTicked)
							if(Month == 13)
								Year += 1
								YearTicked=1

		while(world.timeofday > (259200/6)*5 && world.timeofday < 259200)
			Nighttime = 1
			Daytime = 0







mob/Admin3/verb
	Set_Day()
		set category = "Admin"
		var/I =input("What would you like to set the day to? From 1 to 30") as num
		Day = I
	Set_Month()
		set category = "Admin"
		var/I =input("What would you like to set the month to? From 1 to 12") as num
		Month = I
	Set_Year()
		set category = "Admin"
		var/I =input("What would you like to set the Year to?") as num
		Year = I
