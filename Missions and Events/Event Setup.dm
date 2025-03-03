mob/Admin3/verb
	Event_Setup(mob/M in world)
		set category = "Admin"
		set category=""
		switch(input("Would you like to set this person up as an Event Character?") in list("Yes","No"))
			if("Yes")
				input("What class of Character?") in list("Elementalist","Genjutsu","Kenjutsu","Cancel")
				if("Elementalist")
					var/typ=input("What element?") in list("Fire","Lightning","Water","Wind","Earth")
					if(typ=="Fire")
						usr<<"[M] has been set up as a C ranked Fire Elementalist. Their skillset includes: Fireball Jutsu, Fire Run, Phoenix Flower."
						usr<<"[M]'s Perks include: Elemental Training Fire 3, Reflex 1, Chakra Control 2"
						M<<"You have been set up as a C ranked Fire Elementalist."
						M.contents += new/obj/Custom/Katon/Drank/Ninja_Art_Fire_Run
						M.contents += new/obj/Custom/Katon/Crank/Fire_Style_Fireball_Jutsu
						M.contents += new/obj/Custom/Katon/Crank/Fire_Style_Phoenix_Flower_Jutsu
						M.srank = "C"
						var/obj/Perk/Elemental_Training_Fire/A = new
						M.contents += A
						A.RPPSpent = 1000
						A.RPPCheck()
						A.RPPSpent = 2500
						A.RPPCheck()
						var/obj/Perk/Reflex/B = new
						M.contents += B
						B.RPPSpent = 1000
						B.RPPCheck()
						var/obj/Perk/Chakra_Control/C = new
						M.contents += C
						C.RPPSpent = 1000
						C.RPPCheck()
						Admin_Logs+="<br>[usr]([usr.key]) has set [M] up as a Fire Elementalist Event Character."
						SaveLogs()

					if(typ=="Lightning")
						usr<<"[M] has been set up as a C+ ranked Lightning Elementalist. Their Skillset includes: Raiton Flash, Lightning Ball, Lightning Clone."
						usr<<"[M]'s perks include: Elemental Training Lightning 3, Reflex 2, Speed 1, Sight 1"
						M<<"You have been set up as a C+ Lightning Elementalist."
						M.contents += new/obj/Custom/Raiton/Drank/Ninja_Art_Raiton_Flash
						M.contents += new/obj/Custom/Raiton/Crank/Ninja_Art_Lightning_Ball
						M.contents += new/obj/Custom/Raiton/Arank/Lightning_Clone_Jutsu
						M.srank = "C+"
						var/obj/Perk/Elemental_Training_Lightning/A = new
						M.contents += A
						A.RPPSpent = 1000
						A.RPPCheck()
						A.RPPSpent = 2500
						A.RPPCheck()
						var/obj/Perk/Reflex/B = new
						M.contents += B
						B.RPPSpent = 1000
						B.RPPCheck()
						var/obj/Perk/Speed/C = new
						M.contents += C
						var/obj/Perk/Sight/D = new
						M.contents += D
						Admin_Logs+="<br>[usr]([usr.key]) has set [M] up as a Lightning Elementalist Event Character."
						SaveLogs()

					if(typ=="Water")
						usr<<"[M] has been set up as a B- ranked Water Elementalist. Their Skillset includes: Water Trumpet, Hidden Mist Jutsu, Silent Killing."
						usr<<"[M]'s perks include: Sensing 2, Reflex 3, Speed 2, Lightfoot, Mist Fighter."
						M<<"You have been set up as a B- ranked Water Elementalist."
						M.srank = "B-"
						var/obj/Perk/Innate_Sensing/A = new
						M.contents += A
						A.RPPSpent = 1000
						A.RPPCheck()
						var/obj/Perk/Light_Foot/B = new
						M.contents += B
						var/obj/Perk/Mist_Fighter/C = new
						M.contents += C
						var/obj/Perk/Reflex/D = new
						M.contents += D
						D.RPPSpent = 1000
						D.RPPCheck()
						D.RPPSpent = 2500
						D.RPPCheck()
						var/obj/Perk/Speed/E = new
						M.contents += E
						E.RPPSpent = 1000
						E.RPPCheck()
						Admin_Logs+="<br>[usr]([usr.key]) has set [M] up as a Water Elementalist Event Character."
						SaveLogs()

					if(typ=="Wind")
						usr<<"[M] has been set up as a Wind Elementalist....."
						sleep(50)
						usr<<"Okay not really...But they will be after I finish this!"

					if(typ=="Earth")
						usr<<"[M] has been set up as an Earth Elementalist."
						sleep(50)
						usr<<"Okay not really...But they will be after I finish this!"