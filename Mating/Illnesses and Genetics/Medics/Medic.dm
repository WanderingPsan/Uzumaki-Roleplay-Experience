mob/var
	MP1
	MP2
	MP3
	MP4
	MP5
	MP6
	Medici = 0
/*
 _ _ _
|_|_|_|
|_|_|_|

H= Health Herb
C= Chakra Herb
P= Poison Herb
Y = Curry
N = Spinach
R = Red Pepper

Cold and Flu
 _ _ _
|H|_|Y|
|R|_|H|

Antidote
 _ _ _
|H|P|H|
|H|_|H|

Poison
 _ _ _
|P|H|P|
|P|_|P|

CBI
 _ _ _
|H|P|H|
|H|C|H|

Healing
 _ _ _
|_|H|_|
|_|C|_|

Akimichi Pills
 _ __ _
|C|N|C|
|Y|C|R|



*/
obj/items/Citem/tools
	MediPot
		icon = 'Medipot.dmi'
		name = "Medi-Pot"
		Click()
			if(!usr.Medici)
				usr.MS1 = null
				usr.MS2 = null
				usr.MS3 = null
				usr.MS4 = null
				usr.MS5 = null
				usr.MS6 = null
				usr.Medici = 1
				winshow(usr,"MediPot",1)
			else
				usr.Medici = 0
				usr.MS1 = null
				usr.MS2 = null
				usr.MS3 = null
				usr.MS4 = null
				usr.MS5 = null
				usr.MS6 = null
				winshow(usr,"MediPot",0)
		verb
			ColdFlu_Make()
				set src in view(2)
				set hidden = 1
				if(istype(usr.MS1,/obj/items/herb/grass/Health_Herb) && istype(usr.MS3,/obj/items/herb/grass/Curry_Herb) && istype(usr.MS4,/obj/items/herb/grass/Red_Pepper) && istype(usr.MS6,/obj/items/herb/grass/Health_Herb) && usr.MS2 == null && usr.MS5 == null)
					usr<<"Your ingredients drop in and are mixed into a singular brace of pills."
					usr.contents += new/obj/items/Medicine/Cold_And_Flu
					usr.contents += new/obj/items/Medicine/Cold_And_Flu
					usr.MS1 = null
					usr.MS2 = null
					usr.MS3 = null
					usr.MS4 = null
					usr.MS5 = null
					usr.MS6 = null
					usr << output(usr.MS1,"MediPot.TL")
					usr << output(usr.MS2,"MediPot.TC")
					usr << output(usr.MS3,"MediPot.TR")
					usr << output(usr.MS4,"MediPot.BL")
					usr << output(usr.MS5,"MediPot.BC")
					usr << output(usr.MS6,"MediPot.BR")

			Akimichi_Make()
				set src in view(2)
				set hidden = 1
				if(!usr.Akimichi)
					usr<<"Only a member of the Akimichi can make these."
					return

				if(istype(usr.MS1,/obj/items/herb/grass/Chakra_Herb) && istype(usr.MS2,/obj/items/herb/grass/Spinach) && istype(usr.MS3,/obj/items/herb/grass/Chakra_Herb) && istype(usr.MS4,/obj/items/herb/grass/Curry_Herb) && istype(usr.MS5,/obj/items/herb/grass/Chakra_Herb) && istype(usr.MS6,/obj/items/herb/grass/Red_Pepper))
					usr<<"A strange and secret mixture is created from the herbs dropped into the machine and released in a little container of three colored pills."
					usr.contents += new/obj/items/Medicine/Akimichi_Pills
					usr.MS1 = null
					usr.MS2 = null
					usr.MS3 = null
					usr.MS4 = null
					usr.MS5 = null
					usr.MS6 = null
					usr << output(usr.MS1,"MediPot.TL")
					usr << output(usr.MS2,"MediPot.TC")
					usr << output(usr.MS3,"MediPot.TR")
					usr << output(usr.MS4,"MediPot.BL")
					usr << output(usr.MS5,"MediPot.BC")
					usr << output(usr.MS6,"MediPot.BR")

			Antidote_Make()
				set src in view(2)
				set hidden = 1
				if(istype(usr.MS1,/obj/items/herb/grass/Health_Herb) && istype(usr.MS3,/obj/items/herb/grass/Health_Herb) && istype(usr.MS4,/obj/items/herb/grass/Health_Herb) && istype(usr.MS6,/obj/items/herb/grass/Health_Herb) && istype(usr.MS2,/obj/items/herb/grass/Poison_Herb) && usr.MS5 == null)
					usr<<"The herbs are dropped into a gel and break down into a paste which is mixed and dispensed."
					usr.contents += new/obj/items/Medicine/Antidote
					usr.contents += new/obj/items/Medicine/Antidote
					usr.contents += new/obj/items/Medicine/Antidote
					usr.MS1 = null
					usr.MS2 = null
					usr.MS3 = null
					usr.MS4 = null
					usr.MS6 = null
					usr << output(usr.MS1,"MediPot.TL")
					usr << output(usr.MS2,"MediPot.TC")
					usr << output(usr.MS3,"MediPot.TR")
					usr << output(usr.MS4,"MediPot.BL")
					usr << output(usr.MS6,"MediPot.BR")

			Poison_Make()
				set src in view(2)
				set hidden = 1
				if(istype(usr.MS1,/obj/items/herb/grass/Poison_Herb) && istype(usr.MS3,/obj/items/herb/grass/Poison_Herb) && istype(usr.MS4,/obj/items/herb/grass/Poison_Herb) && istype(usr.MS6,/obj/items/herb/grass/Poison_Herb) && istype(usr.MS5,/obj/items/herb/grass/Health_Herb) && usr.MS5 == null)
					usr<<"The herbs are dropped into a gel and break down into a paste which is mixed and dispensed as a bomb set to explode on impact."
					usr.contents += new/obj/items/Weapon/Poison_Bomb
					usr.contents += new/obj/items/Weapon/Poison_Bomb
					usr.MS1 = null
					usr.MS2 = null
					usr.MS3 = null
					usr.MS4 = null
					usr.MS6 = null
					usr << output(usr.MS1,"MediPot.TL")
					usr << output(usr.MS2,"MediPot.TC")
					usr << output(usr.MS3,"MediPot.TR")
					usr << output(usr.MS4,"MediPot.BL")
					usr << output(usr.MS6,"MediPot.BR")

			CBI_Make()
				set src in view(2)
				set hidden = 1
				if(istype(usr.MS1,/obj/items/herb/grass/Health_Herb) && istype(usr.MS2,/obj/items/herb/grass/Poison_Herb) && istype(usr.MS3,/obj/items/herb/grass/Health_Herb) && istype(usr.MS4,/obj/items/herb/grass/Health_Herb) && istype(usr.MS5,/obj/items/herb/grass/Chakra_Herb) && istype(usr.MS6,/obj/items/herb/grass/Health_Herb))
					usr<<"Your six herbs are dropped into the machine and crushed into a fine powder before being mixed with an aqueous solution and turned into a capsule."
					usr.contents += new/obj/items/Medicine/Chakra_Borne_Illness_Medication
					usr.contents += new/obj/items/Medicine/Chakra_Borne_Illness_Medication
					usr.MS1 = null
					usr.MS2 = null
					usr.MS3 = null
					usr.MS4 = null
					usr.MS5 = null
					usr.MS6 = null
					usr << output(usr.MS1,"MediPot.TL")
					usr << output(usr.MS2,"MediPot.TC")
					usr << output(usr.MS3,"MediPot.TR")
					usr << output(usr.MS4,"MediPot.BL")
					usr << output(usr.MS5,"MediPot.BC")
					usr << output(usr.MS6,"MediPot.BR")

			HP_Make()
				set src in view(2)
				set hidden = 1
				if(istype(usr.MS2,/obj/items/herb/grass/Health_Herb) && istype(usr.MS5,/obj/items/herb/grass/Chakra_Herb) && usr.MS1 == null && usr.MS3 == null && usr.MS4 == null && usr.MS6 == null)
					usr<<"The two herbs are dropped into the machine, crushed, and turned into a powder before being compressed in a little tablet."
					usr.contents += new/obj/items/Medicine/Healing_Pill
					usr.contents += new/obj/items/Medicine/Healing_Pill







obj/Medic
	var/Meady = 1
	verb
		Heal_Injury()
			set category = "Health Care"
			if(!src.Meady)
				usr<<"You have to prepare your tools before you can do this again."
				return
			var/list/L = new/list
			for(var/mob/M in view(2))
				L.Add(M)
			var/mob/P = input("Who would you like to heal?") in L
			if(P==null)
				return
			src.Meady = 0
			var/list/I = new/list
			for(var/obj/Injury/U in P.contents)
				I.Add(U)
			var/obj/Injury/R = input("Which injury would you like to heal?")in I+list("Cancel")
			if(R==null)
				return
			if(locate(/obj/Perk/Surgeon/) in usr.contents)
				if(prob(80))
					usr<<"You remove [P.name]'s injury: [R.name] - [R.suffix]."
					P<<"[usr] has healed your injury: [R.name] - [R.suffix]."
					del R
				else
					usr<<"You fail to fix the injury."
					P<<"Your medic has failed to fix the injury."
					return
			else
				if(prob(20))
					usr<<"You remove [P.name]'s injury: [R.name] - [R.suffix]."
					P<<"[usr] has healed your injury: [R.name] - [R.suffix]."
					del R
				else
					usr<<"You fail to fix the injury."
					P<<"Your medic has failed to fix the injury."
					return

		Basic_Care_and_Prognosis()
			set category = "Health Care"
			if(!src.Meady)
				usr<<"You have to prepare your tools before you can do this again."
				return

			var/list/L = new/list
			for(var/mob/M in view(2))
				L.Add(M)
			var/mob/P = input("Who would you like to give Basic Care to?") in L
			if(P==null)
				return
			src.Meady = 0
			viewers()<<"[usr] checks [P]'s temperature, pulse, and etc. before giving them a small dose of medicine."
			P.JConst += P.maxJConst*0.15
			if(locate(/obj/Illness/Fever/)in P.contents)
				usr<<"<font color=red>[P] has a fever."
			if(locate(/obj/Illness/Encephilitis/)in P.contents)
				usr<<"<font color=red>[P] has acute swelling of the brain."
			if(locate(/obj/Illness/Flu/))
				usr<<"<font color=red>[P] has a mid-grade fever and frequent vomiting with cold-like symptoms."
			if(locate(/obj/Illness/Common_Cold/)in P.contents)
				usr<<"<font color=red>[P] has a stuffy nose, a very low-grade fever, a chronic cough, and red, runny eyes."
			if(locate(/obj/Illness/Congestive_Heart_Failure/)in P.contents)
				usr<<"<font color=red>[P]'s heart is currently working below optimal parameters. Their blood pressure is erractic and they have a chronic cough."
			if(locate(/obj/Illness/Wasting_Syndrome/)in P.contents)
				usr<<"<font color=red>[P]'s BMI is completely out of whack. Their muscle mass is below 1% and their fat content is the same. Their overall health is dimished because of their body's wasting state."
			if(locate(/obj/Illness/Diarrhea/)in P.contents)
				usr<<"<font color=red>[P] has frequent, projectile, bowel movements."
			if(locate(/obj/Illness/Tuberculosis/)in P.contents)
				usr<<"<font color=red>[P] has an acute lung infection which is threatening their overall health."
			if(locate(/obj/Illness/Nausea/)in P.contents)
				usr<<"<font color=red>[P] has a feeling of unease in the pit of their stomach."
			if(locate(/obj/Illness/Fatal_Auto_Immune_Deficiency/)in P.contents)
				usr<<"<font color=red>[P] is on their last leg. They have contracted multiple fatal diseases. All that can be done for them is to ease their suffering."
			if(locate(/obj/Illness/Non_Fatal_Auto_Immune_Deficiency/)in P.contents)
				usr<<"<font color=red>[P]'s immune system has comepletely failed them. They are extremely susceptible to attaining a fatal illness."
			for(var/obj/Injury/O in P.contents)
				usr<<"[P] is suffering from injury [O.name] - [O.suffix]."
			sleep(300)
			src.Meady = 1

		Euthanasia()
			set category = "Health Care"
			var/list/L = new/list
			for(var/mob/M in view(2))
				L.Add(M)
			if(!src.Meady)
				usr<<"You need to prepare before you can use this again."
				return
			var/mob/P = input("Who would you like to offer euthanasia to?")in L + list("Cancel")
			if(P==null||"Cancel")
				return

			var/consent=input(P,"Would you like to accept euthanasia from [usr]?")in list("Yes","No")
			if(consent == "Yes")
				usr<<"You take out a syringe of very volatile chemicals and take a hold of [P]'s hand."
				P<<"[usr] takes a hold of your hand and pulls your arm close, placing a needle to your wrist."
				viewers(6)<<"<font color=[usr.SayFont]>[usr] says<font color = white>: Close your eyes and breathe in deeply..."
				for(var/mob/M in viewers(6))
					var/interfere=input(M,"Would you like to stop [P]'s euthanasia?")in list("Yes","No")
					if(interfere=="Yes")
						viewers(6)<<"[M] leaps forwards and stops [usr] from euthanizing [P]."
						sleep(300)
						src.Meady = 1
						return
					if(interfere=="No")
						viewers(6)<<"[usr] injects [P] with the syringe. After a short moment, [P] stops breathing and moving."
						P.Death()
						sleep(300)
						src.Meady = 1
						return
			if(consent == "No")
				usr<<"[P] respectfully declines."
				return
