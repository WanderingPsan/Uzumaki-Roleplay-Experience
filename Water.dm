mob/var
	onwater=0
	oncliff=0
	waterproc=0
	ontree=0
	onmud=0
	swim=0
turf/Terrain
	icon='Turf.dmi'
	Water
		icon_state="water"
		Entered(mob/M)
		//	usr.verbs+=/mob/swim/verb/Dive
			if(ismob(M)&&M.Convert)
				M.onwater=1
				M.Water()
			if(ismob(M)&&M.Convert==0)
				M.overlays += 'Swim.dmi'
				M.swim=1
		Exited(mob/M)
		//	usr.verbs-=/mob/swim/verb/Dive
			if(ismob(M)&&M.Convert)
				M.onwater=0
			if(ismob(M)&&M.Convert==0)
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.onwater=0
	Fishing_Spot
		Entered(mob/M)
			if(ismob(M)&&M.Convert==0)
				M.overlays += 'Swim.dmi'
				M.swim=1
				M.onwater=1
				if(prob(7))
					M.Fishing()
		Exited(mob/M)
			if(ismob(M)&&M.Convert==0)
				M.overlays -= 'Swim.dmi'
				M.swim=0
				M.onwater=0

mob/proc/Water()
	if(src.onwater&&!src.KO&&!src.waterproc&&src.Convert)
		src.waterproc=1
		if(src.Chakra > 0)
			if(src.Control >= 200||src.Resistance >= 200)

				var/random=rand(1,20)
				if(prob(45))
					usr.Exp += rand(0.0078,0.017)
				else
					if(random==3)
						usr.Exp += rand(0.0030,0.038)
			else
				src.Chakra -= rand(3,8)
				src.MaxChakra += (1 *0.018)

				var/random=rand(1,18)

				if(prob(75))
					usr.Exp += rand(0.015,0.020)
				else
					if(random==3)
						usr.Exp += rand(0.024,0.035)
		else
			src.Health -= rand(1,5)
			src.Ko()
		src.waterproc=0
		spawn(30)
		src.Water()
	else
		src.onwater=0

turf/Terrain
	icon='Turf.dmi'
	Cliff2
		icon_state="cliff2"
		density=1
turf/Terrain/Cliff
	icon='Turf.dmi'
	icon_state="cliff"
	Entered(mob/M)
		if(ismob(M)&&M.Convert)
			M.oncliff=1
			M.Cliff()

	Exited(mob/M)
		if(ismob(M)&&M.Convert)
			M.oncliff=0
turf/Sound/Wall
	icon='Turf.dmi'
	icon_state="cliff"
	density=1
	opacity=1
turf/Sound/Wall1
	icon='Turf.dmi'
	icon_state="cliff"
	density=0
	opacity=1



mob/proc/Cliff()
	if(src.oncliff&&!src.KO&&!src.waterproc&&src.Convert)
		src.waterproc=1
		if(src.Chakra > 0)
			if(src.Control >= 175||src.Resistance >= 175)

				var/random=rand(1,20)
				if(prob(45))
					usr.Exp += rand(0.0078,0.017)
				else
					if(random==3)
						usr.Exp += rand(0.0030,0.038)
			else
				src.Chakra -= rand(1,5)

				src.MaxStamina += (1 *0.018)
				var/random=rand(1,18)
				if(prob(25))
					usr.<<"Your couldn't balance your chakra properly your hands and ended up losing grip."
					step(usr,SOUTH)
					step(usr,SOUTH)
					step(usr,SOUTH)
					step(usr,SOUTH)
				if(prob(75))
					usr.Exp += rand(0.015,0.020)
				else
					if(random==3)
						usr.Exp += rand(0.024,0.035)
		else
			src.Health -= rand(1,3)
			src.Ko()
		src.waterproc=0
		spawn(30)
		src.Cliff()
	else
		src.oncliff=0


mob/proc/Mud()
	if(src.onmud&&!src.KO&&!src.waterproc)
		src.waterproc=1
		if(src.Chakra > 0)
			if(src.Control >= 75)
				src.move=0
				sleep(100)
				src.move=1
			else
				src.Stamina -= (1 *0.018)
				src.move=0
				sleep(100)
				src.move=1
		else
			src.Health -= rand(1,3)
			src.Ko()
			src.move=0
			sleep(100)
			src.move=1
		src.waterproc=0
		spawn(30)
		src.Mud()
	else
		src.onmud=0

mob/proc/Fishing()
	if(!src.onwater)
		return
	if(src.swim)
		var/random=rand(1,40)
		if(prob(40))
			var/obj/A = new/obj/items/Food/Small_Fish
			usr.contents+=A
			usr<<"You have caught a Small Fish."
		else
			if(random==11)
				var/obj/A = new/obj/items/Food/Big_Fish
				usr.contents+=A
				usr<<"You have caught a Big Fish."
			if(random==2)
				var/obj/A = new/obj/items/Food/Med_Fish
				usr.contents+=A
				usr<<"You have caught a Medium Fish."
			if(random==5)
				var/obj/A = new/obj/items/Food/Med_Fish2
				usr.contents+=A
				usr<<"You have caught a Medium Fish."
			if(random==8)
				var/obj/A = new/obj/items/Food/Med_Fish3
				usr.contents+=A
				usr<<"You have caught a Medium Fish."
			if(random==13)
				var/obj/A = new/obj/items/Food/Med_Fish
				usr.contents+=A
				usr<<"You have caught a Medium Fish."
		spawn(rand(800,1500))
		src.Fishing()