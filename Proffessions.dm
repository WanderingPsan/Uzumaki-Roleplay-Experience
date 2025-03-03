mob
	Admin3
		verb
			/*Give_Profession(mob/M in world)
				set category="Admin"
				switch(input("What Profession would you like to give [M]?") in list("Medic","Scout","Courier Ninja","Kenjutsu Specialist","Sensor","Manipulator","Genjutsu Specialist","Cancel"))
					if("Medic")
						M.rank2="Medic"
						M.contents+=new /obj/Ninjutsu/Healing_Jutsu
					if("Scout")
						M.rank2="Scout"
						M.contents+=new /obj/Ninjutsu/Shunshin
						var/obj/Perk/Blank_Perk/E=new(M)
						E.name="Sight"
						E.description="<hr><br>This character's sight is above average, and they can spot their enemies from a notable distance. When at medium range, as well as traps so long as they're looking for them.<hr><br>Note: +0.1 Tai Mod; +0.1 Learning Mod; +0.1 Offense Mod; +0.1 Defense Mod"
						var/obj/Perk/Blank_Perk/R=new(M)
						R.name="Primal Sensing"
						R.description="<hr><br>This character's sensory abilities are great, they are capable of sening as a second nature. They can sense without focusing, but it is general sensing.<hr><br>Note: +0.2 Taijutsu Mod"
						var/obj/Perk/Blank_Perk/T=new(M)
						T.name="Hearing"
						T.description="<hr><br>This character's ears are tuned in to hear the movements of those nearby, even when they're not focusing. Careless movements will reveal the location of a character around one with the hearing perk.<hr><br>Note: +0.15 Defense Mod."
					if("Courier Ninja")
						M.rank2="Courier Ninja"
						M.contents+=new /obj/items/Scrolls/Scroll
						M.contents+=new /obj/items/Scrolls/Scroll
						M.contents+=new /obj/items/Scrolls/Scroll
						M.contents+=new /obj/items/Scrolls/Scroll
						M.contents+=new /obj/items/Scrolls/Scroll
						var/obj/Perk/Blank_Perk/E=new(M)
						E.name="Courier"
						E.description="<hr><br>The Courier is a veteran traveler. He ferries information, weapons, anything, between lands and can traverse two maps instead of just one. Note:"
					if("Kenjutsu Specialist")
						M.rank2="Kenjutsu Spec."
						M.contents+=new /obj/items/Weapon/Samurai_Sword
						M.contents+=new /obj/Kenjutsu/Shinkuken
						var/obj/Perk/Blank_Perk/T=new(M)
						T.name="Katana Proficiency"
						T.description="This character is highly skilled with a katana, and can use it efficiently, and effectively. Note:"
					if("Sensor")
						M.rank2="Sensor"
						var/obj/Perk/Blank_Perk/E=new(M)
						E.name="Innate Sensing"
						E.description="<hr><br>This character's sensory abilities are high, and they are capable of sensing large chakra outputs without focusing. Note:"
					if("Manipulator")
						M.rank2="Manipulator"
						var/obj/Perk/Blank_Perk/E=new(M)
						E.name="Elemental Manipulation"
						E.description="<hr><br>This character manipulates a certain element or material with their chakra allowing for them the ultimate freedom with their jutsus. They also do not need to use hand seals, as their weapon bends to their will. Note:"
					if("Genjutsu Specialist")
						M.rank2="Genjutsu Spec."
						var/obj/Perk/Blank_Perk/E=new(M)
						E.name="Mind 1"
						E.description="<hr><br>This character has a fortified mind that both protects them against Genjutsu, and strengthens their own genjutsu. The character with this perk caught in a low level genjutsu can always tell they're in a genjutsu. If this character is using a low level genjutsu, they can manipulate the effects of the technique so long as it keeps to the same concept.<hr><br>Note: +0.2 Genjutsu Mod; +0.2 Resistance Mod"
*/