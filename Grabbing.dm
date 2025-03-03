mob/var
	grabbee //who you are grabbing.
	grabber //who is grabbing you

	grabberSTR //the strength of the person grabbing you.

mob/verb
	Grab()
		set category="Combat"
		for(var/mob/M in get_step(src,dir))
			//if(M.client)
			if(!grabbee && !attacking && !grabber)
				usr << "You grab [M]."
				usr.grabbee=M.name
				M.grabber=usr.name
				M.grabberSTR=usr.Strength
				usr.attacking=1
				usr.grab()

	Release()
		set category="Combat"
		for(var/mob/M in oviewers(1))
			if(usr.grabbee==M.name && M.grabber==usr.name)
				usr << "You release [usr.grabbee]."
				M.grabber=null
				usr.grabbee=null
				usr.attacking=0

mob/proc/grab()
	if(grabbee)
		if(!grabber)
			var/foundgrabbee=0
			for(var/mob/M in world)
				if(M.name==grabbee && M.grabber==usr.name)
					foundgrabbee=1
					M.loc=locate(usr.x,usr.y,usr.z)
			if(foundgrabbee)
				spawn(5)
				usr.grab()
			else
				for(var/mob/M in world)
					if(M.name==grabbee | M.grabber==usr.name)
						viewers(9) << "[usr] loses his grip on [grabbee]."
						M.grabber=null
						usr.grabbee=null
						usr.attacking=0
		else
			for(var/mob/M in oviewers(3))
				if(M.name==grabbee | M.grabber==usr.name)
					viewers(9) << "[usr] is force to release [grabbee]!"
					M.grabber=null
					usr.grabbee=null
					usr.attacking=0

mob/var/escaping=0 //belongs to the Escape_Chance() proc
mob/proc/Escape_Chance()
	if(!usr.escaping)
		usr.escaping=1
		var/holdstr=((usr.Strength/usr.grabberSTR)*rand(1,125))
		//if equal str then about 25% chance to break free.

		//this block provides the small chance to boost escape chance.
		var/random=rand(1,10)
		if(random==5)
			holdstr*=rand(2,5)

		//this block decides if you have beaten the odds to escape.
		if(holdstr>100)
			usr.grabber=null
		else
			viewers(9) << "[usr] struggles against [usr.grabber]'s hold!"
		sleep(15)
		usr.escaping=0