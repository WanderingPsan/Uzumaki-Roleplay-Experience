mob/var
	tmp/clicked=0
	Class = "Villager"
	rank2 = "Villager"
	Clan = "None"
	Village = ""
	Trait = ""
	srank = "E"
	PrimaryElement = ""
	SecondaryElement = ""
	TertiaryElement = ""
	QuadranaryElement = ""
	QuinaryElement = ""
	RPP=0
	Has3rd = 0
	Yen = 500
	displaykey = ""
	attackable = 1
	stat = 0
	Age=0
	Hunger = 0
	MaxHunger= 100
	Health = 100
	MaxHealth = 100
	HealthGain = 1.5
	Stamina = 5
	MaxStamina = 5
	StaminaGain = 0.01
	Student=0
	Calories = 150
	KumoPermission = 0
	lx
	ly
	lz
	/*MaxCL=10
	CL = 10*/
	list/WHO=new
	Chakra = 100000000000000000 //10
	MaxChakra = 100000000000000000 //10
	ChakraGain = 1.5

	Strength = 1
	MaxStrength = 1
	StrengthGain = 0.01
	Agility = 1
	MaxAgility = 1
	AgilityGain = 0.01
	Offence = 1
	MaxOffence = 1
	OffenceGain = 0.01
	Defense = 1
	MaxDefense = 1
	DefenseGain = 0.01


	Control = 1
	ControlGain = 0.01
	MaxControl = 1
	Resistance = 1
	MaxResistance = 1
	ResistanceGain = 0.01

	Taijutsu = 1
	MaxTaijutsu = 1
	TaijutsuGain = 0.01
	Ninjutsu = 1
	MaxNinjutsu = 1
	NinjutsuGain = 0.01
	Genjutsu = 1
	MaxGenjutsu = 1
	GenjutsuGain = 0.01

	Squad = ""
	SquadName = ""
	SquadLeader = 0
	SquadMember = 0
	SquadM=0

	Cap = 100000000000000000 // Acad - 100, Genin - 500, Chuunin - 2000, Jounin - 5000, Anbu - 7500, Sannin - 10000.
/*
	SeElCh = 20
	TerElCh = 10
	QuaElCh = 5
	QuiElCh = 5
*/


mob/Stat()
	usr.lx=usr.x
	usr.ly=usr.y
	usr.lz=usr.z
	if(usr.stat)
		if(Admin)
			statpanel("Players")
			for(var/mob/M)
				if(M.client)
					stat(M)
		if(Admin&&Tab)
			statpanel("Stuff")
			for(var/mob/M)
				if(M.selected)
					stat(M)
					stat(M.contents)
		statpanel("[usr.name]")
		if(Admin)
			stat("CPU","[world.cpu]%")
			stat("Year","[Year]")
			stat("Clan Probability","[ClanProb]%")
			stat("Secondary Element Probability","[SeElCh]%")
			stat("Tertiary Element Probability","[TerElCh]%")
			stat("Quadranary Element Probability","[QuaElCh]%")
			stat("Quinary Element Probability","[QuiElCh]%")
			stat("RPP Gained From Roleplaying","[RPPGaint]")
			stat("Is Auto Genin Enabled?","[AutoGeninOn]")



		stat(usr)
		stat("*Basic Information*","")
		if(usr.Clan=="None"|usr.Clan=="")
		else
			stat("Clan","You are part of the [Clan] Clan")
		if(usr.Class=="Genin"||usr.Class=="Jounin"||usr.Class=="Chuunin"||usr.Cap>=200)
			stat("Attitude","You are a [Trait]")
		if(usr.Village=="Konohagakure")
			stat("<font color=red>Village","<font color=red>You are a Shinobi of the Hidden Leaf Village")
		if(usr.Village=="Sunagakure")
			stat("<font color=green>Village","<font color=green>You are a Shinobi of the Hidden Sand Village")
		if(usr.Village=="Kirigakure")
			stat("<font color=blue>Village","<font color=blue>You are a Shinobi of the Hidden Mist Village")
		if(usr.Village=="Amegakure")
			stat("<font color=cyan>Village","<font color=cyan>You are a Shinobi of the Hidden Rain Village")
		if(usr.Village=="Kumogakure")
			stat("<font color=silver>Village","<font color=silver>You are a Shinobi of the Hidden Cloud Village")
		if(usr.Village==""||usr.Village=="None")
			stat("Village","<font color=black>You are a Missing Ninja")
		if(usr.Village=="Genji No Sato")
			stat("Village","<font color=purple>You are a shinobi of Genjigakure")
		if(usr.Village=="Shinkogakure")
			stat("Village","<font color=white>You are a shinobi of Shinkogakure")

		if(usr.Kage)
			stat("~~Village Information - Kage~~")
			if(usr.Village=="Konohagakure")
				stat("Taxes", "[KonohaTax]")
				stat("Overall Funds", "[KonohaCash]")
				stat("Standing Forces", "[KonohaArmy]")
			if(usr.Village=="Sunagakure")
				stat("Taxes", "[SunaTax]")
				stat("Overall Funds", "[SunaCash]")
				stat("Standing Forces", "[SunaArmy]")
			if(usr.Village=="Kirigakure")
				stat("Taxes", "[KiriTax]")
				stat("Overall Funds", "[KiriCash]")
				stat("Standing Forces", "[KiriArmy]")
			if(usr.Village=="Amegakure")
				stat("Taxes", "[AmeTax]")
				stat("Overall Funds", "[AmeCash]")
				stat("Standing Forces", "[AmeArmy]")
			if(usr.Village=="Kumogakure")
				stat("Taxes", "[KumoTax]")
				stat("Overall Funds", "[KumoCash]")
				stat("Standing Forces", "[KumoArmy]")
			if(usr.Village=="Genji No Sato")
				stat("Taxes", "[GenjiTax]")
				stat("Overall Funds", "[GenjiCash]")
				stat("Standing Forces", "[GenjiForces]")
			if(usr.Village=="Shinkogakure")
				stat("Taxes", "[ShinTax]")
				stat("Overall Funds", "[ShinCash]")
				stat("Standing Forces", "[ShinForces]")
		else
			stat("~~Village Information~~")
			if(usr.Village=="Konohagakure")
				stat("Taxes", "[KonohaTax]")
			if(usr.Village=="Sunagakure")
				stat("Taxes", "[SunaTax]")
			if(usr.Village=="Kirigakure")
				stat("Taxes", "[KiriTax]")
			if(usr.Village=="Amegakure")
				stat("Taxes", "[AmeTax]")
			if(usr.Village=="Kumogakure")
				stat("Taxes", "[KumoTax]")
			if(usr.Village=="Genji No Sato")
				stat("Taxes", "[GenjiTax]")
			if(usr.Village=="Shinkogakure")
				stat("Taxes", "[ShinTax]")



		stat("Ninja Rank","You are a [Class] [srank] ([rank2])")
		stat("[Age] years old")
		if(Daytime)
			stat("Time of Day","Daytime")
		if(Nighttime)
			stat("Time of Day","Nighttime")
		stat("Date","[Month]/[Day]/[Year] AGR")
		stat("*Status Information*","")
		stat("Constitution","You are at [round((JConst/maxJConst)*100)]% of your maximum health of [maxJConst]")
		stat("Chakra","You are at [round((Jchakra/maxJchakra)*100)]% of your maximum chakra of [maxJchakra]")
		stat("Stamina","You are at [round((Jstam/maxJstam)*100)]% of your maximum stamina of [maxJstam]")
		stat("*Health Status*","")
		if(usr.PuppetPoison)
			stat("<font color=purple>You are poisoned.</font>")
		if(locate(/obj/Illness/Fever/)in usr.contents)
			stat("<font color=red>You have a fever.</font>","<font color=red>Your body is hot and you feel cold despite this.")
		if(locate(/obj/Illness/Encephilitis/)in usr.contents)
			stat("<font color=red>You have Encephilitis.","<font color=red>Your brain is swelling slightly, impairing your vision and giving you massive headaches as well as forcing you to be bed-ridden.")
		if(locate(/obj/Illness/Flu/)in usr.contents)
			stat("<font color=red>You have the Flu.","<font color=red>You have a high fever, a cough, runny nose, and frequent vomiting.")
		if(locate(/obj/Illness/Common_Cold/)in usr.contents)
			stat("<font color=red>You have the Common Cold.","<font color=red>You have a low fever and a stuffy nose.")
		if(locate(/obj/Illness/Congestive_Heart_Failure/)in usr.contents)
			stat("<font color=red>You have Congestive Heart Failure.","<font color=red>Your heart does not work as it should. Whenever you put too much strain on your body you pass out from exertion and require immediate medical attention. You must take medicine daily or face death.")
		if(locate(/obj/Illness/Wasting_Syndrome/)in usr.contents)
			stat("<font color=red>You have Wasting Syndrome.","<font color=red>Your body is wasting away. You are no more than skin and bones as your muscles deteriorate.")
		if(locate(/obj/Illness/Diarrhea/)in usr.contents)
			stat("<font color=red>You have Diarrhea.","<font color=red>You have to constantly run to the restroom or find a place to let it loose, you risk dehydration.")
		if(locate(/obj/Illness/Tuberculosis/)in usr.contents)
			stat("<font color=red>You have Tuberculosis.","<font color=red>Your lungs are infected and you have a very bad cough. You're very infectious and risk death in no time.")
		if(locate(/obj/Illness/Nausea/)in usr.contents)
			stat("<font color=red>You have Nausea.","<font color=red>Your stomach feels uneasy making it hard to keep down food and drink.")
		if(locate(/obj/Illness/Fatal_Auto_Immune_Deficiency/)in usr.contents)
			stat("<font color=red>You have Fatal Auto Immune Deficiency","<font color=red>Your immune system has completely shut down and you've been infected with a deadly disease. You don't have long to live.")
		if(locate(/obj/Illness/Non_Fatal_Auto_Immune_Deficiency/)in usr.contents)
			stat("<font color=red>You have Non Fatal Auto Immune Deficiency","<font color=red>Your immune system is on its last leg and you're very susceptible to other diseases.")

		stat("*Physical Atrributes*","")
		stat("Strength","[Jstr]")
		stat("Reflex","[Jref]")
		stat("Durability","[Jdur]")
		stat("Attack Speed","[Jatkspd]")
		stat("Speed","[Jspd]")
		stat("Lockpicking Skill","[LockPickSkill]")
		stat("*Chakra Atrributes*","")
		stat("Control","[Jcon]")
		stat("Intelligence","[Jint]")
		stat("Ninjutsu Defense","[Jdef]")
		stat("Genjutsu Resistance","[Jgenres]")
		stat("*Jutsu Atrributes*","")
		stat("Taijutsu","[Jtai]")
		stat("Ninjutsu","[Jnin]")
		stat("Genjutsu","[Jgen]")
		stat("*Other Information*","")
		stat("Yen","You currently have [Yen]")
		stat("Roleplay Points","You currently have [RPP] RPP")
		stat("E-Rank Missions Completed: [usr.Eranks]")
		stat("D-Rank Missions Completed: [usr.Dranks]")
		stat("C-Rank Missions Completed: [usr.Cranks]")
		stat("B-Rank Missions Completed: [usr.Branks]")
		stat("A-Rank Missions Completed: [usr.Aranks]")
		stat("S-Rank Missions Completed: [usr.Sranks]")
		stat("Experience: [usr.exptunarank] / [usr.uprank]")
		statpanel("Inventory")
		stat("<font color=[usr.SayFont]>--------")
		for(var/obj/items/O in usr.contents)
			stat(O)
		stat("<font color=[usr.SayFont]>--------")


		if(locate(/obj/Injury/) in usr.contents)
			statpanel("Injuries")
			for(var/obj/Injury/I in usr.contents)
				stat(I)

		if(usr.SquadM)
			statpanel("[SquadName]")
			stat("<b><font size=2><center>**[SquadName]**")
			for(var/mob/M in world)
				if(M.Squad=="[usr.Squad]")
					if(M.SquadLeader)
						stat("~~[SquadName] Leader~~")
						stat(M)
					if(M.SquadMember)
						stat("--[SquadName] Members--")
						stat(M)

		if(usr.Byakugan)
			statpanel("Byakugan")
			for(var/mob/M in oview(20))
				stat(M)
				stat("Chakra:[round((M.Jchakra/M.maxJchakra)*100)]%")
				stat("Stamina:[round((M.Jstam/M.maxJstam)*100)]%")
				stat("Location:([M.x],[M.y])")
			stat("[usr]'s Location:([usr.x],[usr.y])")

		if(usr.Sharingan)
			statpanel("Sharingan")
			for(var/mob/M in oview(7))
				stat(M)
				stat("Chakra:[round((M.Jchakra/M.maxJchakra)*100)]%")

		if(usr.Viewer)
			statpanel("Health")
			for(var/mob/M in view())
				if(M.Viewed&&M.Viewet == "[usr]")
					stat(M)
					stat("[M]'s Constitution: [M.JConst] / [M.maxJConst]")
					for(var/obj/Gene/G in M.contents)
						stat(G)
					for(var/obj/Illness/D in contents)
						stat(D)
		if(usr.Checking)
			statpanel("Splicer")
			for(var/obj/O in usr.contents)
				if(O.Checkit == 1)
					stat(O)
					for(var/obj/Gene/G in O.contents)
						stat(G)
					for(var/obj/Illness/I in O.contents)
						stat(I)

		if(usr.EyeViewer)
			statpanel("Genes")
			for(var/mob/M in view())
				stat(M)
				for(var/obj/Gene/G in M.contents)
					stat(G)
				for(var/obj/Illness/D in M.contents)
					stat(D)
		if(usr.build)
			statpanel("Build")
			for(var/obj/Buildject/A in world)
				stat(A)

		if(usr.Shingan)
			statpanel("Sensing")
			for(var/mob/M in orange(usr.senserange))
				stat(M)
				stat("Chakra:[round((M.Jchakra/M.maxJchakra)*100)]%")
				stat("Location:([M.x],[M.y])")
			stat("[usr]'s Location:([usr.x],[usr.y])")
			stat("Sense Range: [usr.senserange] blocks.")



		if(usr.Cookin)
			statpanel("Cooking Panel!")
			stat("~~~~~~Stored Food~~~~~~~~~")
			stat("[usr]'s stored Cheese: [usr.CheeseStore]")
			stat("[usr]'s stored Potato: [usr.PotatoStore]")
			stat("[usr]'s stored Carrot: [usr.CarrotStore]")
			stat("[usr]'s stored Cabbage: [usr.CabbageStore]")
			stat("[usr]'s stored Tomato: [usr.TomatoStore]")
			stat("[usr]'s stored Buns: [usr.BunStore]")
			stat("[usr]'s stored Uncooked Fries: [usr.FryStore]")
			stat("[usr]'s stored Ground Beef: [usr.BeefStore]")
			stat("[usr]'s stored Beef Patties: [usr.PattyStore]")
			stat("[usr]'s stored Small Fish: [usr.SFishStore]")
			stat("[usr]'s stored Medium Fish: [usr.MFishStore]")
			stat("[usr]'s stored Large Fish: [usr.BFishStore]")
			stat("[usr]'s stored Raw Bacon: [usr.RawBaconStore]")
			stat("[usr]'s stored Bacon: [usr.BaconStore]")

			stat("~~~~~~Held Food~~~~~~~~~~~")
			for(var/obj/items/Food/F in usr.contents)
				stat(F)
			for(var/obj/items/Drink/D in usr.contents)
				stat(D)

		statpanel("Jutsu")
		stat("*Doujutsu*","")
		for(var/obj/Doujutsu/Do in contents)
			stat(Do)
		for(var/obj/Custom/D in contents)
			if(D.jut == "Doujutsu")
				stat(D)

		stat("*Genjutsu*","")
		for(var/obj/Genjutsu/Ge in contents)
			stat(Ge)
		for(var/obj/Custom/E in contents)
			if(E.jut == "Genjutsu")
				stat(E)

		stat("*Ninjutsu*","")
		for(var/obj/Ninjutsu/Ni in contents)
			stat(Ni)
		for(var/obj/SkillCard/Jutsu/O in contents)
			stat(O)
		for(var/obj/Custom/F in contents)
			if(F.jut == "Ninjutsu")
				stat(F)

		stat("*Taijutsu*","")
		for(var/obj/Taijutsu/Ta in contents)
			stat(Ta)
		for(var/obj/Custom/G in contents)
			if(G.jut == "Taijutsu")
				stat(G)

		stat("*Senjutsu*","")
		for(var/obj/Senjutsu/Se in contents)
			stat(Se)
		for(var/obj/Custom/H in contents)
			if(H.jut == "Senjutsu")
				stat(H)

		stat("*Fuuinjutsu*","")
		for(var/obj/Fuuinjutsu/Fu in contents)
			stat(Fu)
		for(var/obj/Custom/I in contents)
			if(I.jut == "Fuuinjutsu")
				stat(I)

		stat("*Kenjutsu*","")
		for(var/obj/Kenjutsu/Ke in contents)
			stat(Ke)
		for(var/obj/Custom/J in contents)
			if(J.jut == "Kenjutsu")
				stat(J)




		if(captarget&&(captarget in src)) //used for checking if the capsule, to open the tab.
			statpanel("Bag")
			stat(captarget) //shows the capsule
			stat("--Contained Item--") // seperator
			for(var/obj/x in captarget) //shows the contents of the capsule
				stat(x) // here too


		statpanel("Perks")
		stat("*------*")
		for(var/obj/Perk/E in contents)
			stat(E)
		stat("*-----*")

		if(usr.Admin)
			statpanel("Economies")
			stat("Konohagakure","")
			stat("Taxes", "[KonohaTax]")
			stat("Overall Funds", "[KonohaCash]")
			stat("Standing Forces", "[KonohaArmy]")
			stat("~~~~~")
			stat("Sunagakure","")
			stat("Taxes", "[SunaTax]")
			stat("Overall Funds", "[SunaCash]")
			stat("Standing Forces", "[SunaArmy]")
			stat("~~~~~")
			stat("Kirigakure","")
			stat("Taxes", "[KiriTax]")
			stat("Overall Funds", "[KiriCash]")
			stat("Standing Forces", "[KiriArmy]")
			stat("~~~~~")
			stat("Amegakure","")
			stat("Taxes", "[AmeTax]")
			stat("Overall Funds", "[AmeCash]")
			stat("Standing Forces", "[AmeArmy]")
			stat("~~~~~")
			stat("Kumogakure","")
			stat("Taxes", "[KumoTax]")
			stat("Overall Funds", "[KumoCash]")
			stat("Standing Forces", "[KumoArmy]")
			stat("~~~~~")
			stat("Genji No Sato","")
			stat("Taxes", "[GenjiTax]")
			stat("Overall Funds", "[GenjiCash]")
			stat("Standing Forces", "[GenjiForces]")
			stat("~~~~~")
			stat("Shinkogakure","")
			stat("Taxes", "[ShinTax]")
			stat("Overall Funds", "[ShinCash]")
			stat("Standing Forces", "[ShinForces]")



mob
	var
		captarget = null
		Cabin = 1


