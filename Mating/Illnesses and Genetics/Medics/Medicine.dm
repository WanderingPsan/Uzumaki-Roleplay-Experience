
mob/var
	CBIMedicated = 0
	FirstCBILogin = 1



mob/proc/CBICheck()
	if(locate(/obj/Gene/Chakra_Borne_Illness) in src.contents)
		if(src.FirstCBILogin)
			src.contents += new/obj/items/Medicine/Chakra_Borne_Illness_Medication
			src.contents += new/obj/items/Medicine/Chakra_Borne_Illness_Medication
			src.contents += new/obj/items/Medicine/Chakra_Borne_Illness_Medication
			src.FirstCBILogin = 0
			src<<"<font size=6 color=red>This is your first log-in with your Chakra Borne Illness so you are being gifted with four doses of medicine."
			src.CBIMedicated = 1
		if(src.CBIMedicated == 0)
			src<<"You are in need of medicine badly!"
			src<<"You have only about sixty ooc minutes * 10 to find medicine!"
			sleep(60000)
			if(src.CBIMedicated)
				return
			src.Health=0
			src.Death()
			viewers()<<"<font color=red><i>[src] has succumb to their Chakra Borne Illness and died!</i></font>"
		if(src.CBIMedicated == 1)
			src<<"You are currently medicated for your Chakra Borne Illness. You have about one-hundred and twenty ooc minutes * 10 before you have to find medicine!"
			sleep(120000)
			src.CBIMedicated = 0
			src.CBICheck()


mob/proc
	CFCheck()
		if(locate(/obj/Illness/Fever) in src.contents)
			sleep(500)
			for(var/obj/Illness/Fever/A in src.contents)
				del A
		if(locate(/obj/Illness/Common_Cold) in src.contents)
			sleep(1000)
			for(var/obj/Illness/Common_Cold/A in src.contents)
				del A
		if(locate(/obj/Illness/Flu) in src.contents)
			sleep(1500)
			for(var/obj/Illness/Flu/A in src.contents)
				del A




obj/items/Medicine
	Cold_And_Flu
		icon = 'Meds.dmi'
		icon_state = "C+F"
		Click()
			usr<<"You take the Cold and Flu medicine and begin to feel better slowly."
			spawn(10) del src
			usr.CFCheck()


	Antidote
		icon = 'Meds.dmi'
		icon_state = "Anti"
		Click()
			usr.PuppetPoison = 0
			usr.Poison = 0
			usr.JConst = usr.maxJConst*0.5
			del src

	Chakra_Borne_Illness_Medication
		icon = 'Meds.dmi'
		icon_state = "CBI"
		Click()
			if(locate(/obj/Gene/Chakra_Borne_Illness) in usr.contents)
				if(!usr.CBIMedicated)
					usr.CBIMedicated = 1
					spawn(10) del src
					usr.CBICheck()

				else
					usr<<"That'd be a waste, you're already medicated."
			else
				usr<<"You cannot take this medicine as you don't have the illness."

	Akimichi_Pills
		icon='Pills.dmi'
		verb/Open()
			set src in usr.contents
			var/obj/items/Medicine/Green/A = new()
			var/obj/items/Medicine/Yellow/B = new()
			var/obj/items/Medicine/Red/C = new()
			usr.contents += A
			usr.contents += B
			usr.contents += C
			del(src)

	Soldier_Pill
		icon='Pills.dmi'
		icon_state="4"
		Click()
			if(src in usr.contents)
				if(usr.Health<10)
					return
				if(usr.Soldier)
					return
				usr.JConst -=(usr.maxJConst*0.20)
				usr.Jstam -=(usr.maxJstam*0.50)
				usr.Jtai += 2.3
				usr.Jdur += 2.1
				usr.Jdef += 3.0
				usr.Jchakra *= 1.7
				usr.Soldier=1
				del(src)
				sleep(1200)
				usr.Jtai -= 2.3
				usr.Jdur -= 2.1
				usr.Jdef -= 3.0
				usr.Jchakra = usr.maxJchakra /2
				usr.Soldier=0
				usr.Constitution_Check()

	Healing_Pill
		icon='Pills.dmi'
		icon_state = "4"
		Click()
			if(src in usr.contents)
				spawn(10) del src
				usr.Healing_Pill()



	Seishingan_drug
		icon='CS.dmi'
		icon_state="Seishingan drug"
		Click()
			if(src in usr.contents)
				if(usr.Seishingan)
					return
				usr.Poison=1
				usr.Seishingan=1
				spawn(30)
				usr.Poison()
				sleep(800)
				usr.Poison=0
				del(src)

	Green
		icon='Pills.dmi'
		icon_state="1"
		Click()
			if(src in usr.contents)
				if(usr.JConst<200)
					return
				if(usr.Yellow)
					return
				if(usr.Red)
					return
				usr.JConst -= 200
				usr.Jtai += 4
				usr.Jdur += 3.7
				usr.Jdef += 2.98
				usr.Green=1
				del(src)
				sleep(1200)
				usr.Jtai -= 4
				usr.Jdur -= 3.7
				usr.Jdef -= 2.98
				usr.Green=0
				usr.Constitution_Check()
	Yellow
		icon='Pills.dmi'
		icon_state="2"
		Click()
			if(src in usr.contents)
				if(usr.JConst<500)
					return
				if(usr.Green)
					return
				if(usr.Red)
					return
				usr.JConst -= 500
				usr.Jtai += 6
				usr.Jdur += 5.7
				usr.Jdef += 4.98
				usr.Yellow=1
				del(src)
				sleep(1200)
				usr.Jtai -= 6
				usr.Jdur -= 5.7
				usr.Jdef -= 4.98
				usr.Yellow=0
				usr.Constitution_Check()
	Red
		icon='Pills.dmi'
		icon_state="3"
		Click()
			if(src in usr.contents)
				if(usr.JConst<750)
					return
				if(usr.Yellow)
					return
				if(usr.Green)
					return
				usr.JConst -= 750
				usr.Jtai += 10
				usr.Jdur += 12.7
				usr.Jdef += 11.98
				usr.overlays += 'Wings.dmi'
				usr.Red=1
				del(src)
				sleep(1200)
				usr.overlays -= 'Wings.dmi'
				usr.Jtai -= 10
				usr.Jdur -= 12.7
				usr.Jdef -= 11.98
				usr.Red=0
				usr.Constitution_Check()



