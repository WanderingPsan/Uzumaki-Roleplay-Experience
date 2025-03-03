mob/var/Log_Year=0
var/YearSpeed=144000
var/DaySpeed=100
var/Night = 0
var/Year = 0
var/Month = 1
var/Day = 1
var/Season = "Winter"




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



proc/Years()
	set background=1
	while(1)
		sleep(YearSpeed)
		Day += 1
		if(Day==31)
			Day=0
			Month+=1
			if(Month==12)
				Month=0
				Year+=1
				for(var/mob/P in world)
					P.Age_Increase()
		if(Month == 12 || 1 || 2)
			Season = "Winter"
		if(Month == 3 || 4 || 5 )
			Season = "Spring"
		if(Month == 6|| 7 || 8 )
			Season = "Summer"
		if(Month == 9 || 10 || 11)
			Season = "Fall"

		SaveYear()
		world<<"<font color=red>It is now day [Day] of month [Month] of the year [Year] AYW."

mob/proc/Age_Increase()
	Age+= 1
	Log_Year=Year
	src<<"<font color=red>You are now [Age] years old."

mob/proc/Age_Update()
	Age+=Year-Log_Year
	Log_Year=Year


proc/LoadYear()
	if(fexists("YW/Year"))
		var/savefile/F=new("YW/Year")
		F["Year"]>>Year
		F["YearSpeed"]>>YearSpeed
		F["Month"]>>Month
		F["Day"]>>Day

proc/SaveYear()
	var/savefile/F=new("YW/Year")
	F["Year"]<<Year
	F["YearSpeed"]<<YearSpeed
	F["Month"]<<Month
	F["Day"]<<Day