mob/proc
	Age()
		var/Age=input("Please enter your Age from 1-90.") as num
		if(Age<=1)
			usr.Age()
			return

		if(Age<=12)
			src.contents += new/obj/Gene/Child
			src<<"So young.~"

		if(Age>=90)
			usr.Age()
			return
		usr.Age=(Age)
		usr.Age_Death()

mob/proc
	Age_Death()
		if(usr.Dead)
			return
		if(usr.Age>=90)
			if(prob(35))
				viewers(16) << "<font color=silver>[usr] Died of old Age!"
				usr.Death()
		if(usr.Age>=100)
			if(prob(50))
				viewers(16) << "<font color=silver>[usr] Died of old Age!"
				usr.Death()
		if(usr.Age>=120)
			if(prob(60))
				viewers(16) << "<font color=silver>[usr] Died of old Age!"
				usr.Death()
		spawn(rand(2000,3000))
		Age_Death()

