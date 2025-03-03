var
	Hokage //Select Anbu Captain, Select Chuunin Intructor, Select Sannin, Select Jounin, Select Chuunin, Village Taxes?
	Mizukage
	Sunakage
	Tsuchikage
	Raikage
	Village_Leader
	Village_Head
	Leaf_Council //Select Jounin, Select Chuunin, Villages Taxes,
	Leaf_Council1 //Select Jounin, Select Chuunin, Villages Taxes,
	Leaf_Anbu_Captain //Select Anbu
	Leaf_Head_Chuunin_Instructor //Select Chuunin
	Toad_Sage //Sage Mode, Summon Toads
	Snake_Sage //Snake Body? Summon Snakes
	Slug_Sage //Creation Rebirth, Summon Slugs
	Akatsuki_Leader //Choose Member(Comes With Ring), Create Outfit Scroll (Scroll for Akatsuki Outfit)
	Sage_of_the_Six_Paths //Rinnengan,
	Police_Captain
	Academy_Headmaster
	Hachimon_Master
	Katon_Master
	Fuuton_Master
	Raiton_Master
	Doton_Master
	Suiton_Master
	Medical_Master
	Genjutsu_Master
	/*
	rei - Pein
	sei - Deidara
	bta - Konan
	shu - Itachi
	gai - Zetsu
	kuu - Orchimaru
	nan - Kisame
	hoku - Kakuzu
	san - Hidan
	gyoku - Tobi
	*/
/*

`proc/SaveRanks()
	var/savefile/S=new("Ranks")
	S["A"]<<Hokage
	S["B"]<<Mizukage
	S["C"]<<Leaf_Council
	S["C1"]<<Leaf_Council1
	S["D"]<<Leaf_Anbu_Captain
	S["E"]<<Leaf_Head_Chuunin_Instructor
	S["F"]<<Toad_Sage
	S["G"]<<Snake_Sage
	S["H"]<<Slug_Sage
	S["I"]<<Akatsuki_Leader
	S["J"]<<Sage_of_the_Six_Paths
	S["K"]<<Police_Captain
	S["L"]<<Academy_Headmaster

proc/LoadRanks()
	var/savefile/S=new("Ranks")
	S["A"]>>Hokage
	S["B"]<<Mizukage
	S["C"]>>Leaf_Council
	S["C1"]>>Leaf_Council1
	S["D"]>>Leaf_Anbu_Captain
	S["E"]>>Leaf_Head_Chuunin_Instructor
	S["F"]>>Toad_Sage
	S["G"]>>Snake_Sage
	S["H"]>>Slug_Sage
	S["I"]>>Akatsuki_Leader
	S["J"]>>Sage_of_the_Six_Paths
	S["K"]>>Police_Captain
	S["L"]>>Academy_Headmaster*/

var/Rank={"<html><body><head><center><title>Ranks</title></center></head></body>
<center><body bgcolor="Black"><font size=6><font color="red"><b>
Village Ranks</center></font></font><font color="white">
<br>
<hr>
<b>Konohakagure</b>
<br>
Hokage: None<br>
<br>
<b>Kirigakure</b>
<br>
Mizukage: Aji<br>
Jonin: Murasaki<br>
<br>
<b>Sunagakure</b>
<br>
Kazekage: Seishin, Tenmei<br>
Jonin: Unknown<br>
<br>
<b>Amegakure</b>
<br>
Village Leader: Unknown<br>
Jonin: Unknown<br>
<br>
<b>Kumogakure</b>
<br>
Raikage: Katsia, Serris<br>
Jonin: Ainz<br>
<br>
<b>Genjigakure</b>
<br>
Village Leader: Unknown<br>
Jonin: Unknown<br>
<br>
<b>Shinkogakure</b>
<br>
Village Leader: Unknown<br>
Jonin: Unknown<br>
</body><html>"}
var/WritingRank=0
mob/verb/Ranks()
	usr<<browse(Rank,"window=Rank;size=500x350")
mob/Admin3/verb/EditRank()
	set category="Admin"
	if(!WritingRank)
		WritingRank=1
		for(var/mob/M) if(M.Admin) M<<"[usr] is editing the Ranks..."
		Rank=input(usr,"Edit","Edit Rank",Rank) as message
		for(var/mob/F) if(F.Admin) F<<"[usr] is done editing the Ranks..."
		WritingRank=0
		SaveRanks()
		LoadRanks()
	else usr<<"<b>Someone is already editing the Ranks."
proc/SaveRanks()
	var/savefile/S= new("Ranks.sav")
	S["Ranks.sav"]<<Rank
proc/LoadRanks() if(fexists("Ranks.sav"))
	var/savefile/L = new("Ranks.sav")
	L["Ranks.sav"]>>Rank






obj/Hokage // Make Sannin, Make Genin, Make Chuunin, Make Jounin, Make Anbu, Make Anbu Captain, Host Academy Exam, Host Chuunin, Host Jounin, Village Exile, Invite to Village , Make Squad(Player Squads are chosen by the Kage)
	verb
		Set_Taxes()
			set category = "Rank"
			var/numb = input("What will you set the village's tax rate to, between 25 and 30.")as num
			if(numb < 25)
				numb = 25
			if(numb > 30)
				numb = 30
			KonohaTax = numb*0.01

	/*	Take_Money_From_Coffers()
			set category = "Rank"
			var/numb = input("How much will you take from the village's coffers?")as num
			if(numb > KonohaCash)
				numb = KonohaCash
			usr.Yen += numb
			KonohaCash -= numb */

		Take_Money_From_Coffers()
			set category = "Rank"
			var/numb = input("How much will you take from the village's coffers?")as num
			if(numb < KonohaCash)
				usr.Yen += numb
				KonohaCash -= numb
			if(numb > KonohaCash)
				return



		Mission_Reward_Experience()
			set category ="Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/P=input("Who would you like to reward for a successful mission?")in V + list("Cancel")
			var/H = input("What rank of mission did they complete?")in list("E","D","C","B","A","S","Cancel")
			if(H=="E")
				P.Eranks += 1
				P.exptunarank += 0.5
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="D")
				P.Dranks += 1
				P.exptunarank += 1.0
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="C")
				P.Cranks += 1
				P.exptunarank += 2
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="B")
				P.Branks += 1
				P.exptunarank += 3
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="A")
				P.Aranks += 1
				P.exptunarank += 4
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="S")
				P.Sranks += 1
				P.exptunarank += 5
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"

		Mission_Reward(mob/M in oview(2))
			set category = "Rank"
			var/reward=input("How much would you like to reward them?") as num
			if(reward>=usr.Yen)
				return
			if(reward<=0)
				return
			M.Yen += reward
		Make_Clothing_Scroll()
			set category = "Rank"
			var/obj/items/Scrolls/Kage_Clothing/A = new()
			A.loc = usr.loc
		Make_Sannin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Sannin?") in V
			M.Class="Sannin"
			var/random=rand(1,5)
			if(random==1)
			 M.srank="A"
			if(random==2)
			 M.srank="A+"
			if(random==3)
			 M.srank="S-"
			if(random==4)
			 M.srank="A-"
			if(random==5)
			 M.srank="S"

		Make_Genin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Genin?") in V
			M.Class="Genin"
			M.contents += new/obj/items/Clothing/LeafHeadband
			M.srank="D+"

		Make_Chuunin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Chuunin?") in V
			M.Class="Chuunin"
			var/random=rand(1,3)
			if(random==1)
			 M.srank="C-"
			if(random==2)
			 M.srank="C"
			if(random==3)
			 M.srank="C+"
			M.contents += new/obj/items/Clothing/Leaf_Chuunin

		Make_Jounin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Jounin?") in V
			M.Class="Jounin"
			var/random=rand(1,3)
			if(random==1)
			 M.srank="B-"
			if(random==2)
			 M.srank="B"
			if(random==3)
			 M.srank="B+"
			M.contents += new/obj/items/Clothing/Leaf_Jounin
			M.contents += new/obj/Jounin

		Make_Anbu()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Anbu?") in V
			M.Class="Anbu"
			M.srank="B+"
			if(prob(50))
				var/obj/items/Clothing/Anbu_Mask_Red/A = new()
				A.loc=M.contents
			else
				var/obj/items/Clothing/Anbu_Mask_Blue/A = new()
				A.loc=M.contents

		Make_Anbu_Captain()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					if(A.Class=="Anbu")
						V.Add(A)
			var/mob/M=input("Who would you like to make the Anbu Captain?") in V
			M.Class="Anbu Captain"
			var/random=rand(1,2)
			if(random==1)
			 M.srank="B+"
			if(random==2)
			 M.srank="A-"

		Village_Announce(msg as text)
			set category = "Rank"
			if(msg=="")
				return
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "<center>---Village Announcement---"
					A << "<center>[msg]"
					A << "<center>--[usr]--"

		Host_Academy_Exam()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Genin exam shortly, please make your way to the academy for further instructions."

		Host_Chuunin()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Chuunin exam shortly, please make your way to the academy for further instructions."

		Host_Jounin()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Jounin exam shortly, please make your way to the academy for further instructions."

		Exile_From_Village()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to exile from the Village?") in V
			M.Village = "None"
			M.Class = "Missing"

		Invite_To_Village()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village=="None")
					V.Add(A)
			var/mob/M=input("Who would you like to invite to the Village?") in V
			M.Village = usr.Village

		CreateMissionScroll()
			set category = "Rank"
			var/Q = input("Which rank of scroll would you like?") in list("E Rank","D Rank","B Rank","Custom")
			if(Q=="E Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/ERankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="D Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/DRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="C Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/CRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="B Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/BRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="A Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/ARankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="S Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/SRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="Custom")
				var/obj/items/Scrolls/Mission_Scroll/CustomMission/A = new
				usr.contents += A
				var/C = input("What type of mission will it be?") in list("Escort","Assassination","Rogue Hunt")
				if(C=="Escort")
					A.rank = rand(1,4)
					if(A.rank == 1)
						A.rank = "S"
					if(A.rank == 2)
						A.rank = "A"
					if(A.rank == 3)
						A.rank = "B"
					if(A.rank == 4)
						A.rank = "C"
					A.typ = "Escort"
					A.reward = 1500
					A.Vreward = 15000
					var/D = input("Who will they escort?")in list("Blacksmith","Architect","Hurt Shinobi","Prisoner","Peddler")
					if(D=="Blacksmith")
						var/A1 =input("Name the Blacksmith") as text
						A.clie = "[A1] The Blacksmith"
					if(D=="Architect")
						var/A2 =input("Name the Architect") as text
						A.clie = "[A2] The Architect"
					if(D=="Hurt Shinobi")
						var/A3 =input("Name the Hurt Shinobi") as text
						A.clie = "[A3] The Injured Ninja"
					if(D=="Prisoner")
						var/A4 =input("Name the Prisoner") as text
						A.clie = "[A4] The Prisoner"
					if(D=="Peddler")
						var/A1 =input("Name the Peddler") as text
						A.clie = "[A1] The Peddler"
					var/E = input("Where will you escort them?") in list("Kumo","Kiri","Konoha","Ame","Suna")
					if(E=="Kumo")
						A.targ = "Kumogakure"
					if(E=="Kiri")
						A.targ = "Kirigakure"
					if(E=="Konoha")
						A.targ = "Konohagakure"
					if(E=="Ame")
						A.targ = "Amegakure"
					if(E=="Suna")
						A.targ = "Sunagakure"
				A.mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]</font></b><br><hr><br>You must [A.typ] [A.clie] to [A.targ]<br><hr><br>RP Requirements:<hr><br>Either 2 RPs per map, walk to the target as you RP. OR call an admin and RP with them to complete the mission.</center>"
				A.name = "[A.rank] Mission: [A.typ] [A.clie] to [A.targ]!"
				if(C=="Assassination")
					A.typ = "Assassinate"
					var/D = input("Who will they assassinate?")in list("Retired Rogue","Government Official","Enemy Shinobi","Enemy Shinobi Leader")
					if(D=="Retired Rogue")
						var/A1 = input("Name the Rogue") as text
						A.clie = "Rogue Shinobi [A1]"
						var/P = input("Where is your target?") in list("Kumo","Kiri","Konoha","Ame","Suna")
						if(P=="Kumo")
							A.targ = "Kumogakure"
						if(P=="Kiri")
							A.targ = "Kirigakure"
						if(P=="Konoha")
							A.targ = "Konohagakure"
						if(P=="Ame")
							A.targ = "Amegakure"
						if(P=="Suna")
							A.targ = "Sunagakure"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] the [A.clie]</font></b><br><hr><br>You must [A.typ] the [A.clie] in [A.targ]<br><hr><br>RP Requirements:<hr><br>Either 2 RPs per map, 10 minutes per map, walk to the target village as you RP.</center>"
						A.name = "[A.rank] Mission: [A.typ] the [A.clie] in [A.targ]!"
						A.reward = 2500
						A.Vreward = 25000
						return
					if(D=="Government Official")
						var/A1 =input("Name the Government Official") as text
						A.clie = "[A1] Esq."
						var/P = input("Where is your target?") in list("Kumo","Kiri","Konoha","Ame","Suna")
						if(P=="Kumo")
							A.targ = "Kumogakure"
						if(P=="Kiri")
							A.targ = "Kirigakure"
						if(P=="Konoha")
							A.targ = "Konohagakure"
						if(P=="Ame")
							A.targ = "Amegakure"
						if(P=="Suna")
							A.targ = "Sunagakure"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.name = "Assassinate! Kill [A1] in [A.targ]!"
						A.mission = "<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]</font></b><br><hr><br>You must [A.typ] [A.clie] in [A.targ]!<br><hr><br>RP Requirements:<hr><br>Travel Rules: 3 RPs per map, 12 minutes per map. If the target is actual player, then the mission will only be complete if they are successfully killed. If it is an NPC. 7~15 RPs are required based on Letter Rank of mission. The higher the rank the more paragraphs."
						A.reward = 1500
						A.Vreward = 15000
						return
					if(D=="Enemy Shinobi")
						var/list/G = new/list
						for(var/mob/M in world)
							if(!M.Village==usr.Village)
								G.Add(M)
						var/mob/A3 =input("Pick the Shinobi","This must be an actual shinobi from another village.") in G
						var/A1 = "[A3.name]"
						A.clie = "[A1] the Shinobi"
						A.targ = "[A3.Village]"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.mission = "<html><body bgcolor = purple><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]!</font></b><br><hr><br>You must [A.typ] [A.clie], they must be [A.typ]d. Their village is [A.targ], look there first.<br><hr><br>RP Requirements:<hr><br>Find the target. Kill them.</center>"
						A.name = "Kill Them! Kill [A1] the shinobi of [A3.Village]."
						A.reward = 1500
						A.Vreward = 15000
						return
					if(D=="Enemy Shinobi Leader")
						var/A1 =input("Which of the Kage is the Target?")in list("Hokage","Mizukage","Kazekage","Amekage","Raikage")
						if(A1=="Hokage")
							A.clie = "Hokage"
						if(A1=="Mizukage")
							A.clie = "Mizukage"
						if(A1=="Kazekage")
							A.clie = "Kazekage"
						if(A1=="Amekage")
							A.clie = "Amekage"
						if(A1=="Raikage")
							A.clie = "Raikage"
						A.rank = "S"
						A.name = "Hunt! Kill the [A.clie]!"
						A.mission = "<html><body bgcolor = purple><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] the [A.clie]</font></b><br><hr><br>You must [A.typ] the [A.clie], they have reigned long enough..<br><hr><br>RP Requirements:<hr><br>It's simple. Go to the target Kage's village and kill them by any means neccessary.</center>"
						return
				if(C=="Rogue Hunt")
					var/list/O = new/list
					for(var/mob/M in world)
						if(M.Village=="None"||M.Village=="")
							O.Add(M)
					var/mob/k = input("Which shinobi shall you issue a warrant for?") in O
					A.typ = "Hunt"
					A.name = "S-Ranked Mission: Hunt The Rogue!"
					A.mission = "<html><body bgcolor = red><center><b><hr><font size = 5>S-Ranked Mission: Hunt The Rogue Shinobi [k.name]!</font></b><br><hr><br>You must locate and kill the rouge shinobi [k.name]. They have gone unpunished for long enough.<br><hr><br>RP Requirements:<hr><br>It's simple. Gather information and locate your target, following all travel rules. This mission will be complete when you murdder your target.</center>"
					A.reward = 3000
					A.Vreward = 30000
					return


obj/Tsuchikage // Make Sannin, Make Genin, Make Chuunin, Make Jounin, Make Anbu, Make Anbu Captain, Host Academy Exam, Host Chuunin, Host Jounin, Village Exile, Invite to Village , Make Squad(Player Squads are chosen by the Kage)
	verb
		Mission_Reward_Experience()
			set category ="Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/P=input("Who would you like to reward for a successful mission?")in V + list("Cancel")
			var/H = input("What rank of mission did they complete?")in list("E","D","C","B","A","S","Cancel")
			if(H=="E")
				P.Eranks += 1
				P.exptunarank += 0.5
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="D")
				P.Dranks += 1
				P.exptunarank += 1.0
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="C")
				P.Cranks += 1
				P.exptunarank += 2
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="B")
				P.Branks += 1
				P.exptunarank += 3
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="A")
				P.Aranks += 1
				P.exptunarank += 4
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="S")
				P.Sranks += 1
				P.exptunarank += 5
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
		Mission_Reward(mob/M in oview(2))
			set category = "Rank"
			var/reward=input("How much would you like to reward them?") as num
			if(reward>=usr.Yen)
				return
			if(reward<=0)
				return
			M.Yen += reward
		Make_Sannin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Sannin?") in V
			M.Class="Sannin"
			var/random=rand(1,5)
			if(random==1)
			 M.srank="A+"
			if(random==2)
			 M.srank="S-"
			if(random==3)
			 M.srank="S"
			if(random==4)
			 M.srank="A-"
			if(random==5)
			 M.srank="A"

		Make_Genin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Genin?") in V
			M.Class="Genin"
			M.contents += new/obj/items/Clothing/MistHeadband
			M.srank="D+"

		Make_Chuunin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Chuunin?") in V
			M.Class="Chuunin"
			var/random=rand(1,3)
			if(random==1)
			 M.srank="C-"
			if(random==2)
			 M.srank="C"
			if(random==3)
			 M.srank="C+"
			//M.contents += new/obj/items/Clothing/Leaf_Chuunin

		Make_Jounin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Jounin?") in V
			M.Class="Jounin"
			var/random=rand(1,3)
			if(random==1)
			 M.srank="B-"
			if(random==2)
			 M.srank="B"
			if(random==3)
			 M.srank="B+"
			//M.contents += new/obj/items/Clothing/Leaf_Jounin
			M.contents += new/obj/Jounin

		Make_Anbu()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Anbu?") in V
			M.Class="Anbu"
			M.srank="B+"
			if(prob(50))
				var/obj/items/Clothing/Anbu_Mask_Red/A = new()
				A.loc=M.contents
			else
				var/obj/items/Clothing/Anbu_Mask_Blue/A = new()
				A.loc=M.contents

		Make_Anbu_Captain()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					if(A.Class=="Anbu")
						V.Add(A)
			var/mob/M=input("Who would you like to make the Anbu Captain?") in V
			M.Class="Anbu Captain"
			var/random=rand(1,3)
			if(random==1)
			 M.srank="B+"
			if(random==2)
			 M.srank="A-"
			if(random==3)
			 M.srank="A"

		Village_Announce(msg as text)
			set category = "Rank"
			if(msg=="")
				return
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "<center>---Village Announcement---"
					A << "<center>[msg]"
					A << "<center>--[usr]--"

		Host_Academy_Exam()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Genin exam shortly, please make your way to the academy for further instructions."

		Host_Chuunin()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Chuunin exam shortly, please make your way to the academy for further instructions."

		Host_Jounin()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Jounin exam shortly, please make your way to the academy for further instructions."

		Exile_From_Village()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to exile from the Village?") in V
			M.Village = "None"
			M.Class = "Missing"

		Invite_To_Village()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village=="None")
					V.Add(A)
			var/mob/M=input("Who would you like to invite to the Village?") in V
			M.Village = usr.Village
		/*Create_Mission()
			var/Missionz = input("Select the Mission Rank", "A","B","C","D","Cancel")
			switch(Missionz)
				if("D")
				var/random=rand(1,15)
					if(random=1)
						Mob in View << "A lady has lost her cat, please recover it."*/

		CreateMissionScroll()
			set category = "Rank"
			var/Q = input("Which rank of scroll would you like?") in list("E Rank","Custom")
			if(Q=="E Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/ERankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="D Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/DRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="C Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/CRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="B Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/BRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="A Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/ARankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="S Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/SRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="Custom")
				var/obj/items/Scrolls/Mission_Scroll/CustomMission/A = new
				usr.contents += A
				var/C = input("What type of mission will it be?") in list("Escort","Assassination","Rogue Hunt")
				if(C=="Escort")
					A.rank = rand(1,4)
					if(A.rank == 1)
						A.rank = "S"
					if(A.rank == 2)
						A.rank = "A"
					if(A.rank == 3)
						A.rank = "B"
					if(A.rank == 4)
						A.rank = "C"
					A.typ = "Escort"
					A.reward = 1500
					A.Vreward = 15000
					var/D = input("Who will they escort?")in list("Blacksmith","Architect","Hurt Shinobi","Prisoner","Peddler")
					if(D=="Blacksmith")
						var/A1 =input("Name the Blacksmith") as text
						A.clie = "[A1] The Blacksmith"
					if(D=="Architect")
						var/A2 =input("Name the Architect") as text
						A.clie = "[A2] The Architect"
					if(D=="Hurt Shinobi")
						var/A3 =input("Name the Hurt Shinobi") as text
						A.clie = "[A3] The Injured Ninja"
					if(D=="Prisoner")
						var/A4 =input("Name the Prisoner") as text
						A.clie = "[A4] The Prisoner"
					if(D=="Peddler")
						var/A1 =input("Name the Peddler") as text
						A.clie = "[A1] The Peddler"
					var/E = input("Where will you escort them?") in list("Kumo","Kiri","Konoha","Ame","Suna")
					if(E=="Kumo")
						A.targ = "Kumogakure"
					if(E=="Kiri")
						A.targ = "Kirigakure"
					if(E=="Konoha")
						A.targ = "Konohagakure"
					if(E=="Ame")
						A.targ = "Amegakure"
					if(E=="Suna")
						A.targ = "Sunagakure"
				A.mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]</font></b><br><hr><br>You must [A.typ] [A.clie] to [A.targ]<br><hr><br>RP Requirements:<hr><br>Either 2 RPs per map, walk to the target as you RP. OR call an admin and RP with them to complete the mission.</center>"
				A.name = "[A.rank] Mission: [A.typ] [A.clie] to [A.targ]!"
				if(C=="Assassination")
					A.typ = "Assassinate"
					var/D = input("Who will they assassinate?")in list("Retired Rogue","Government Official","Enemy Shinobi","Enemy Shinobi Leader")
					if(D=="Retired Rogue")
						var/A1 = input("Name the Rogue") as text
						A.clie = "Rogue Shinobi [A1]"
						var/P = input("Where is your target?") in list("Kumo","Kiri","Konoha","Ame","Suna")
						if(P=="Kumo")
							A.targ = "Kumogakure"
						if(P=="Kiri")
							A.targ = "Kirigakure"
						if(P=="Konoha")
							A.targ = "Konohagakure"
						if(P=="Ame")
							A.targ = "Amegakure"
						if(P=="Suna")
							A.targ = "Sunagakure"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] the [A.clie]</font></b><br><hr><br>You must [A.typ] the [A.clie] in [A.targ]<br><hr><br>RP Requirements:<hr><br>Either 2 RPs per map, 10 minutes per map, walk to the target village as you RP.</center>"
						A.name = "[A.rank] Mission: [A.typ] the [A.clie] in [A.targ]!"
						A.reward = 2500
						A.Vreward = 25000
						return
					if(D=="Government Official")
						var/A1 =input("Name the Government Official") as text
						A.clie = "[A1] Esq."
						var/P = input("Where is your target?") in list("Kumo","Kiri","Konoha","Ame","Suna")
						if(P=="Kumo")
							A.targ = "Kumogakure"
						if(P=="Kiri")
							A.targ = "Kirigakure"
						if(P=="Konoha")
							A.targ = "Konohagakure"
						if(P=="Ame")
							A.targ = "Amegakure"
						if(P=="Suna")
							A.targ = "Sunagakure"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.name = "Assassinate! Kill [A1] in [A.targ]!"
						A.mission = "<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]</font></b><br><hr><br>You must [A.typ] [A.clie] in [A.targ]!<br><hr><br>RP Requirements:<hr><br>Travel Rules: 3 RPs per map, 12 minutes per map. If the target is actual player, then the mission will only be complete if they are successfully killed. If it is an NPC. 7~15 RPs are required based on Letter Rank of mission. The higher the rank the more paragraphs."
						A.reward = 1500
						A.Vreward = 15000
						return
					if(D=="Enemy Shinobi")
						var/list/G = new/list
						for(var/mob/M in world)
							if(!M.Village==usr.Village)
								G.Add(M)
						var/mob/A3 =input("Pick the Shinobi","This must be an actual shinobi from another village.") in G
						var/A1 = "[A3.name]"
						A.clie = "[A1] the Shinobi"
						A.targ = "[A3.Village]"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.mission = "<html><body bgcolor = purple><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]!</font></b><br><hr><br>You must [A.typ] [A.clie], they must be [A.typ]d. Their village is [A.targ], look there first.<br><hr><br>RP Requirements:<hr><br>Find the target. Kill them.</center>"
						A.name = "Kill Them! Kill [A1] the shinobi of [A3.Village]."
						A.reward = 1500
						A.Vreward = 15000
						return
					if(D=="Enemy Shinobi Leader")
						var/A1 =input("Which of the Kage is the Target?")in list("Hokage","Mizukage","Kazekage","Amekage","Raikage")
						if(A1=="Hokage")
							A.clie = "Hokage"
						if(A1=="Mizukage")
							A.clie = "Mizukage"
						if(A1=="Kazekage")
							A.clie = "Kazekage"
						if(A1=="Amekage")
							A.clie = "Amekage"
						if(A1=="Raikage")
							A.clie = "Raikage"
						A.rank = "S"
						A.name = "Hunt! Kill the [A.clie]!"
						A.mission = "<html><body bgcolor = purple><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] the [A.clie]</font></b><br><hr><br>You must [A.typ] the [A.clie], they have reigned long enough..<br><hr><br>RP Requirements:<hr><br>It's simple. Go to the target Kage's village and kill them by any means neccessary.</center>"
						return
				if(C=="Rogue Hunt")
					var/list/O = new/list
					for(var/mob/M in world)
						if(M.Village=="None"||M.Village=="")
							O.Add(M)
					var/mob/k = input("Which shinobi shall you issue a warrant for?") in O
					A.typ = "Hunt"
					A.name = "S-Ranked Mission: Hunt The Rogue!"
					A.mission = "<html><body bgcolor = red><center><b><hr><font size = 5>S-Ranked Mission: Hunt The Rogue Shinobi [k.name]!</font></b><br><hr><br>You must locate and kill the rouge shinobi [k.name]. They have gone unpunished for long enough.<br><hr><br>RP Requirements:<hr><br>It's simple. Gather information and locate your target, following all travel rules. This mission will be complete when you murdder your target.</center>"
					A.reward = 3000
					A.Vreward = 30000
					return
obj/Hachimon_Master
	verb
		Make_Training_Log()
			set category = "Rank"
			if(usr.Yen>=2500)
				usr.Yen-=2500
				var/obj/A = new/obj/items/Weapon/Log
				usr.contents+=A
			else
				usr << "You don't have enough to make a Log!"

		Make_Student()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
			var/mob/M=input("Who would you like to make a Hachimon Student?") in V
			M.Student=1
			M.Cap+=rand(10,100)



obj/Mizukage // Make Sannin, Make Genin, Make Chuunin, Make Jounin, Make Anbu, Make Anbu Captain, Host Academy Exam, Host Chuunin, Host Jounin, Village Exile, Invite to Village , Make Squad(Player Squads are chosen by the Kage)
	verb
		Set_Taxes()
			set category = "Rank"
			var/numb = input("What will you set the village's tax rate to, between 25 and 30.")as num
			if(numb < 25)
				numb = 25
			if(numb > 30)
				numb = 30
			KiriTax = numb*0.01

	/*	Take_Money_From_Coffers()
			set category = "Rank"
			var/numb = input("How much will you take from the village's coffers?")as num
			if(numb > KiriCash)
				numb = KiriCash
			usr.Yen += numb
			KiriCash -= numb */

		Take_Money_From_Coffers()
			set category = "Rank"
			var/numb = input("How much will you take from the village's coffers?")as num
			if(numb < KiriCash)
				usr.Yen += numb
				KiriCash -= numb
			if(numb > KiriCash)
				return

		Mission_Reward_Experience()
			set category ="Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/P=input("Who would you like to reward for a successful mission?")in V + list("Cancel")
			var/H = input("What rank of mission did they complete?")in list("E","D","C","B","A","S","Cancel")
			if(H=="E")
				P.Eranks += 1
				P.exptunarank += 0.5
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="D")
				P.Dranks += 1
				P.exptunarank += 1.0
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="C")
				P.Cranks += 1
				P.exptunarank += 2
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="B")
				P.Branks += 1
				P.exptunarank += 3
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="A")
				P.Aranks += 1
				P.exptunarank += 4
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="S")
				P.Sranks += 1
				P.exptunarank += 5
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
		Mission_Reward(mob/M in oview())
			set category = "Rank"
			var/reward=input("How much would you like to reward them?") as num
			if(reward>=usr.Yen)
				return
			if(reward<=0)
				return
			M.Yen += reward
		Make_Clothing_Scroll()
			set category = "Rank"
			var/obj/items/Scrolls/MizuKage_Clothing/A = new()
			A.loc = usr.loc
		Make_Sannin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Sannin?") in V
			M.Class="Sannin"
			var/random=rand(1,4)
			if(random==1)
			 M.srank="A+"
			if(random==2)
			 M.srank="S-"
			if(random==3)
			 M.srank="S"
			if(random==4)
			 M.srank="S+"

		Make_Genin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Genin?") in V
			M.Class="Genin"
			M.contents += new/obj/items/Clothing/MistHeadband

		Make_Chuunin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Chuunin?") in V
			M.Class="Chuunin"
			var/random=rand(1,5)
			if(random==1)
			 M.srank="D+"
			if(random==2)
			 M.srank="C-"
			if(random==3)
			 M.srank="C"
			if(random==4)
			 M.srank="C+"
			if(random==5)
			 M.srank="B-"
			M.contents += new/obj/items/Clothing/Mist_Chuunin

		Make_Jounin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Jounin?") in V
			M.Class="Jounin"
			var/random=rand(1,5)
			if(random==1)
			 M.srank="C+"
			if(random==2)
			 M.srank="B-"
			if(random==3)
			 M.srank="B"
			if(random==4)
			 M.srank="B+"
			if(random==5)
			 M.srank="A-"
			M.contents += new/obj/items/Clothing/Mist_Jounin
			M.contents += new/obj/Jounin

		Make_Anbu()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Anbu?") in V
			M.Class="Anbu"
			var/random=rand(1,4)
			if(random==1)
			 M.srank="B+"
			if(random==2)
			 M.srank="A-"
			if(random==3)
			 M.srank="A"
			if(random==4)
			 M.srank="A+"
			if(prob(50))
				var/obj/items/Clothing/Anbu_Mask_Red/A = new()
				A.loc=M.contents
			else
				var/obj/items/Clothing/Anbu_Mask_Blue/A = new()
				A.loc=M.contents

		Make_Anbu_Captain()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					if(A.Class=="Anbu")
						V.Add(A)
			var/mob/M=input("Who would you like to make the Anbu Captain?") in V
			M.Class="Anbu Captain"
			var/random=rand(1,5)
			if(random==1)
			 M.srank="B+"
			if(random==2)
			 M.srank="A-"
			if(random==3)
			 M.srank="A"
			if(random==4)
			 M.srank="A+"
			if(random==5)
			 M.srank="S-"

		Village_Announce(msg as text)
			set category = "Rank"
			if(msg=="")
				return
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "<center>---Village Announcement---"
					A << "<center>[msg]"
					A << "<center>--[usr]--"

		Host_Academy_Exam()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Genin exam shortly, please make your way to the academy for further instructions."

		Host_Chuunin()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Chuunin exam shortly, please make your way to the academy for further instructions."

		Host_Jounin()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Jounin exam shortly, please make your way to the academy for further instructions."

		Exile_From_Village()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to exile from the Village?") in V
			M.Village = "None"
			M.Class = "Missing"

		Invite_To_Village()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village=="None")
					V.Add(A)
			var/mob/M=input("Who would you like to invite to the Village?") in V
			M.Village = usr.Village

		Create_Mission_Scroll()
			set category = "Rank"
			var/Q = input("Which rank of scroll would you like?") in list("E Rank","C Rank","D Rank","B Rank","A Rank","Custom")
			if(Q=="E Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/ERankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="D Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/DRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="C Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/CRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="B Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/BRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="A Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/ARankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="S Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/SRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="Custom")
				var/obj/items/Scrolls/Mission_Scroll/CustomMission/A = new
				usr.contents += A
				var/C = input("What type of mission will it be?") in list("Escort","Assassination","Rogue Hunt")
				if(C=="Escort")
					A.rank = rand(1,4)
					if(A.rank == 1)
						A.rank = "S"
					if(A.rank == 2)
						A.rank = "A"
					if(A.rank == 3)
						A.rank = "B"
					if(A.rank == 4)
						A.rank = "C"
					A.typ = "Escort"
					A.reward = 1500
					A.Vreward = 15000
					var/D = input("Who will they escort?")in list("Blacksmith","Architect","Hurt Shinobi","Prisoner","Peddler")
					if(D=="Blacksmith")
						var/A1 =input("Name the Blacksmith") as text
						A.clie = "[A1] The Blacksmith"
					if(D=="Architect")
						var/A2 =input("Name the Architect") as text
						A.clie = "[A2] The Architect"
					if(D=="Hurt Shinobi")
						var/A3 =input("Name the Hurt Shinobi") as text
						A.clie = "[A3] The Injured Ninja"
					if(D=="Prisoner")
						var/A4 =input("Name the Prisoner") as text
						A.clie = "[A4] The Prisoner"
					if(D=="Peddler")
						var/A1 =input("Name the Peddler") as text
						A.clie = "[A1] The Peddler"
					var/E = input("Where will you escort them?") in list("Kumo","Kiri","Konoha","Ame","Suna")
					if(E=="Kumo")
						A.targ = "Kumogakure"
					if(E=="Kiri")
						A.targ = "Kirigakure"
					if(E=="Konoha")
						A.targ = "Konohagakure"
					if(E=="Ame")
						A.targ = "Amegakure"
					if(E=="Suna")
						A.targ = "Sunagakure"
				A.mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]</font></b><br><hr><br>You must [A.typ] [A.clie] to [A.targ]<br><hr><br>RP Requirements:<hr><br>Either 2 RPs per map, walk to the target as you RP. OR call an admin and RP with them to complete the mission.</center>"
				A.name = "[A.rank] Mission: [A.typ] [A.clie] to [A.targ]!"
				if(C=="Assassination")
					A.typ = "Assassinate"
					var/D = input("Who will they assassinate?")in list("Retired Rogue","Government Official","Enemy Shinobi","Enemy Shinobi Leader")
					if(D=="Retired Rogue")
						var/A1 = input("Name the Rogue") as text
						A.clie = "Rogue Shinobi [A1]"
						var/P = input("Where is your target?") in list("Kumo","Kiri","Konoha","Ame","Suna")
						if(P=="Kumo")
							A.targ = "Kumogakure"
						if(P=="Kiri")
							A.targ = "Kirigakure"
						if(P=="Konoha")
							A.targ = "Konohagakure"
						if(P=="Ame")
							A.targ = "Amegakure"
						if(P=="Suna")
							A.targ = "Sunagakure"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] the [A.clie]</font></b><br><hr><br>You must [A.typ] the [A.clie] in [A.targ]<br><hr><br>RP Requirements:<hr><br>Either 2 RPs per map, 10 minutes per map, walk to the target village as you RP.</center>"
						A.name = "[A.rank] Mission: [A.typ] the [A.clie] in [A.targ]!"
						A.reward = 2500
						A.Vreward = 25000
						return
					if(D=="Government Official")
						var/A1 =input("Name the Government Official") as text
						A.clie = "[A1] Esq."
						var/P = input("Where is your target?") in list("Kumo","Kiri","Konoha","Ame","Suna")
						if(P=="Kumo")
							A.targ = "Kumogakure"
						if(P=="Kiri")
							A.targ = "Kirigakure"
						if(P=="Konoha")
							A.targ = "Konohagakure"
						if(P=="Ame")
							A.targ = "Amegakure"
						if(P=="Suna")
							A.targ = "Sunagakure"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.name = "Assassinate! Kill [A1] in [A.targ]!"
						A.mission = "<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]</font></b><br><hr><br>You must [A.typ] [A.clie] in [A.targ]!<br><hr><br>RP Requirements:<hr><br>Travel Rules: 3 RPs per map, 12 minutes per map. If the target is actual player, then the mission will only be complete if they are successfully killed. If it is an NPC. 7~15 RPs are required based on Letter Rank of mission. The higher the rank the more paragraphs."
						A.reward = 1500
						A.Vreward = 15000
						return
					if(D=="Enemy Shinobi")
						var/list/G = new/list
						for(var/mob/M in world)
							if(!M.Village==usr.Village)
								G.Add(M)
						var/mob/A3 =input("Pick the Shinobi","This must be an actual shinobi from another village.") in G
						var/A1 = "[A3.name]"
						A.clie = "[A1] the Shinobi"
						A.targ = "[A3.Village]"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.mission = "<html><body bgcolor = purple><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]!</font></b><br><hr><br>You must [A.typ] [A.clie], they must be [A.typ]d. Their village is [A.targ], look there first.<br><hr><br>RP Requirements:<hr><br>Find the target. Kill them.</center>"
						A.name = "Kill Them! Kill [A1] the shinobi of [A3.Village]."
						A.reward = 1500
						A.Vreward = 15000
						return
					if(D=="Enemy Shinobi Leader")
						var/A1 =input("Which of the Kage is the Target?")in list("Hokage","Mizukage","Kazekage","Amekage","Raikage")
						if(A1=="Hokage")
							A.clie = "Hokage"
						if(A1=="Mizukage")
							A.clie = "Mizukage"
						if(A1=="Kazekage")
							A.clie = "Kazekage"
						if(A1=="Amekage")
							A.clie = "Amekage"
						if(A1=="Raikage")
							A.clie = "Raikage"
						A.rank = "S"
						A.name = "Hunt! Kill the [A.clie]!"
						A.mission = "<html><body bgcolor = purple><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] the [A.clie]</font></b><br><hr><br>You must [A.typ] the [A.clie], they have reigned long enough..<br><hr><br>RP Requirements:<hr><br>It's simple. Go to the target Kage's village and kill them by any means neccessary.</center>"
						return
				if(C=="Rogue Hunt")
					var/list/O = new/list
					for(var/mob/M in world)
						if(M.Village=="None"||M.Village=="")
							O.Add(M)
					var/mob/k = input("Which shinobi shall you issue a warrant for?") in O
					A.typ = "Hunt"
					A.name = "S-Ranked Mission: Hunt The Rogue!"
					A.mission = "<html><body bgcolor = red><center><b><hr><font size = 5>S-Ranked Mission: Hunt The Rogue Shinobi [k.name]!</font></b><br><hr><br>You must locate and kill the rouge shinobi [k.name]. They have gone unpunished for long enough.<br><hr><br>RP Requirements:<hr><br>It's simple. Gather information and locate your target, following all travel rules. This mission will be complete when you murdder your target.</center>"
					A.reward = 3000
					A.Vreward = 30000
					return


obj/Kazekage // Make Sannin, Make Genin, Make Chuunin, Make Jounin, Make Anbu, Make Anbu Captain, Host Academy Exam, Host Chuunin, Host Jounin, Village Exile, Invite to Village , Make Squad(Player Squads are chosen by the Kage)
	verb
		Set_Taxes()
			set category = "Rank"
			var/numb = input("What will you set the village's tax rate to, between 25 and 30.")as num
			if(numb < 25)
				numb = 25
			if(numb > 30)
				numb = 30
			SunaTax = numb*0.01

	/*	Take_Money_From_Coffers()
			set category = "Rank"
			var/numb = input("How much will you take from the village's coffers?")as num
			if(numb > SunaCash)
				numb = SunaCash
			usr.Yen += numb
			SunaCash -= numb */

		Take_Money_From_Coffers()
			set category = "Rank"
			var/numb = input("How much will you take from the village's coffers?")as num
			if(numb < SunaCash)
				usr.Yen += numb
				SunaCash -= numb
			if(numb > SunaCash)
				return

		Mission_Reward_Experience()
			set category ="Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/P=input("Who would you like to reward for a successful mission?")in V + list("Cancel")
			var/H = input("What rank of mission did they complete?")in list("E","D","C","B","A","S","Cancel")
			if(H=="E")
				P.Eranks += 1
				P.exptunarank += 0.5
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="D")
				P.Dranks += 1
				P.exptunarank += 1.0
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="C")
				P.Cranks += 1
				P.exptunarank += 2
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="B")
				P.Branks += 1
				P.exptunarank += 3
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="A")
				P.Aranks += 1
				P.exptunarank += 4
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="S")
				P.Sranks += 1
				P.exptunarank += 5
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
		Mission_Reward(mob/M in oview(2))
			set category = "Rank"
			var/reward=input("How much would you like to reward them?") as num
			if(reward>=usr.Yen)
				return
			if(reward<=0)
				return
			M.Yen += reward
		Make_Clothing_Scroll()
			set category = "Rank"
			var/obj/items/Scrolls/KazeKage_Clothing/A = new()
			A.loc = usr.loc

		Make_Sannin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Sannin?") in V
			M.Class="Sannin"
			var/random=rand(1,5)
			if(random==1)
			 M.srank="A+"
			if(random==2)
			 M.srank="S-"
			if(random==3)
			 M.srank="S"
			if(random==4)
			 M.srank="A-"
			if(random==5)
			 M.srank="A"

		Make_Genin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Genin?") in V
			M.Class="Genin"
			M.contents += new/obj/items/Clothing/SandHeadband
			M.srank="D+"

		Make_Chuunin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Chuunin?") in V
			M.Class="Chuunin"
			var/random=rand(1,3)
			if(random==1)
			 M.srank="C-"
			if(random==2)
			 M.srank="C"
			if(random==3)
			 M.srank="C+"
			M.contents += new/obj/items/Clothing/Suna_Chuunin

		Make_Jounin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Jounin?") in V
			M.Class="Jounin"
			var/random=rand(1,3)
			if(random==1)
			 M.srank="B-"
			if(random==2)
			 M.srank="B"
			if(random==3)
			 M.srank="B+"
			M.contents += new/obj/items/Clothing/Suna_Jounin
			M.contents += new/obj/Jounin

		Make_Anbu()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Anbu?") in V
			M.Class="Anbu"
			M.srank="B+"
			if(prob(50))
				var/obj/items/Clothing/Anbu_Mask_Red/A = new()
				A.loc=M.contents
			else
				var/obj/items/Clothing/Anbu_Mask_Blue/A = new()
				A.loc=M.contents

		Make_Anbu_Captain()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					if(A.Class=="Anbu")
						V.Add(A)
			var/mob/M=input("Who would you like to make the Anbu Captain?") in V
			M.Class="Anbu Captain"
			var/random=rand(1,2)
			if(random==1)
			 M.srank="B+"
			if(random==2)
			 M.srank="A-"

		Village_Announce(msg as text)
			set category = "Rank"
			if(msg=="")
				return
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "<center>---Village Announcement---"
					A << "<center>[msg]"
					A << "<center>--[usr]--"

		Host_Academy_Exam()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Genin exam shortly, please make your way to the academy for further instructions."

		Host_Chuunin()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Chuunin exam shortly, please make your way to the academy for further instructions."

		Host_Jounin()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Jounin exam shortly, please make your way to the academy for further instructions."

		Exile_From_Village()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to exile from the Village?") in V
			M.Village = "None"
			M.Class = "Missing"

		Invite_To_Village()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village=="None")
					V.Add(A)
			var/mob/M=input("Who would you like to invite to the Village?") in V
			M.Village = usr.Village



		Create_Mission_Scroll()
			set category = "Rank"
			var/Q = input("Which rank of scroll would you like?") in list("E Rank","C Rank","D Rank","B Rank","A Rank","Custom")
			if(Q=="E Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/ERankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="D Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/DRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="C Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/CRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="B Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/BRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="A Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/ARankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="S Rank")
				var/obj/P = input("Which would you like to make?","Order Mission") in typesof(/obj/items/Scrolls/Mission_Scroll/SRankMission) + list("Cancel")
				usr.contents += new P
			if(Q=="Custom")
				var/obj/items/Scrolls/Mission_Scroll/CustomMission/A = new
				usr.contents += A
				var/C = input("What type of mission will it be?") in list("Escort","Assassination","Rogue Hunt")
				if(C=="Escort")
					A.rank = rand(1,4)
					if(A.rank == 1)
						A.rank = "S"
					if(A.rank == 2)
						A.rank = "A"
					if(A.rank == 3)
						A.rank = "B"
					if(A.rank == 4)
						A.rank = "C"
					A.typ = "Escort"
					A.reward = 1500
					A.Vreward = 15000
					var/D = input("Who will they escort?")in list("Blacksmith","Architect","Hurt Shinobi","Prisoner","Peddler")
					if(D=="Blacksmith")
						var/A1 =input("Name the Blacksmith") as text
						A.clie = "[A1] The Blacksmith"
					if(D=="Architect")
						var/A2 =input("Name the Architect") as text
						A.clie = "[A2] The Architect"
					if(D=="Hurt Shinobi")
						var/A3 =input("Name the Hurt Shinobi") as text
						A.clie = "[A3] The Injured Ninja"
					if(D=="Prisoner")
						var/A4 =input("Name the Prisoner") as text
						A.clie = "[A4] The Prisoner"
					if(D=="Peddler")
						var/A1 =input("Name the Peddler") as text
						A.clie = "[A1] The Peddler"
					var/E = input("Where will you escort them?") in list("Kumo","Kiri","Konoha","Ame","Suna")
					if(E=="Kumo")
						A.targ = "Kumogakure"
					if(E=="Kiri")
						A.targ = "Kirigakure"
					if(E=="Konoha")
						A.targ = "Konohagakure"
					if(E=="Ame")
						A.targ = "Amegakure"
					if(E=="Suna")
						A.targ = "Sunagakure"
				A.mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]</font></b><br><hr><br>You must [A.typ] [A.clie] to [A.targ]<br><hr><br>RP Requirements:<hr><br>Either 2 RPs per map, walk to the target as you RP. OR call an admin and RP with them to complete the mission.</center>"
				A.name = "[A.rank] Mission: [A.typ] [A.clie] to [A.targ]!"
				if(C=="Assassination")
					A.typ = "Assassinate"
					var/D = input("Who will they assassinate?")in list("Retired Rogue","Government Official","Enemy Shinobi","Enemy Shinobi Leader")
					if(D=="Retired Rogue")
						var/A1 = input("Name the Rogue") as text
						A.clie = "Rogue Shinobi [A1]"
						var/P = input("Where is your target?") in list("Kumo","Kiri","Konoha","Ame","Suna")
						if(P=="Kumo")
							A.targ = "Kumogakure"
						if(P=="Kiri")
							A.targ = "Kirigakure"
						if(P=="Konoha")
							A.targ = "Konohagakure"
						if(P=="Ame")
							A.targ = "Amegakure"
						if(P=="Suna")
							A.targ = "Sunagakure"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] the [A.clie]</font></b><br><hr><br>You must [A.typ] the [A.clie] in [A.targ]<br><hr><br>RP Requirements:<hr><br>Either 2 RPs per map, 10 minutes per map, walk to the target village as you RP.</center>"
						A.name = "[A.rank] Mission: [A.typ] the [A.clie] in [A.targ]!"
						A.reward = 2500
						A.Vreward = 25000
						return
					if(D=="Government Official")
						var/A1 =input("Name the Government Official") as text
						A.clie = "[A1] Esq."
						var/P = input("Where is your target?") in list("Kumo","Kiri","Konoha","Ame","Suna")
						if(P=="Kumo")
							A.targ = "Kumogakure"
						if(P=="Kiri")
							A.targ = "Kirigakure"
						if(P=="Konoha")
							A.targ = "Konohagakure"
						if(P=="Ame")
							A.targ = "Amegakure"
						if(P=="Suna")
							A.targ = "Sunagakure"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.name = "Assassinate! Kill [A1] in [A.targ]!"
						A.mission = "<html><body bgcolor = grey><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]</font></b><br><hr><br>You must [A.typ] [A.clie] in [A.targ]!<br><hr><br>RP Requirements:<hr><br>Travel Rules: 3 RPs per map, 12 minutes per map. If the target is actual player, then the mission will only be complete if they are successfully killed. If it is an NPC. 7~15 RPs are required based on Letter Rank of mission. The higher the rank the more paragraphs."
						A.reward = 1500
						A.Vreward = 15000
						return
					if(D=="Enemy Shinobi")
						var/list/G = new/list
						for(var/mob/M in world)
							if(!M.Village==usr.Village)
								G.Add(M)
						var/mob/A3 =input("Pick the Shinobi","This must be an actual shinobi from another village.") in G
						var/A1 = "[A3.name]"
						A.clie = "[A1] the Shinobi"
						A.targ = "[A3.Village]"
						A.rank = rand(1,3)
						if(A.rank == 1)
							A.rank = "S"
						if(A.rank == 2)
							A.rank = "A"
						if(A.rank == 3)
							A.rank = "B"
						A.mission = "<html><body bgcolor = purple><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] [A.clie]!</font></b><br><hr><br>You must [A.typ] [A.clie], they must be [A.typ]d. Their village is [A.targ], look there first.<br><hr><br>RP Requirements:<hr><br>Find the target. Kill them.</center>"
						A.name = "Kill Them! Kill [A1] the shinobi of [A3.Village]."
						A.reward = 1500
						A.Vreward = 15000
						return
					if(D=="Enemy Shinobi Leader")
						var/A1 =input("Which of the Kage is the Target?")in list("Hokage","Mizukage","Kazekage","Amekage","Raikage")
						if(A1=="Hokage")
							A.clie = "Hokage"
						if(A1=="Mizukage")
							A.clie = "Mizukage"
						if(A1=="Kazekage")
							A.clie = "Kazekage"
						if(A1=="Amekage")
							A.clie = "Amekage"
						if(A1=="Raikage")
							A.clie = "Raikage"
						A.rank = "S"
						A.name = "Hunt! Kill the [A.clie]!"
						A.mission = "<html><body bgcolor = purple><center><b><hr><font size = 5>[A.rank]-Rank Mission: [A.typ] the [A.clie]</font></b><br><hr><br>You must [A.typ] the [A.clie], they have reigned long enough..<br><hr><br>RP Requirements:<hr><br>It's simple. Go to the target Kage's village and kill them by any means neccessary.</center>"
						return
				if(C=="Rogue Hunt")
					var/list/O = new/list
					for(var/mob/M in world)
						if(M.Village=="None"||M.Village=="")
							O.Add(M)
					var/mob/k = input("Which shinobi shall you issue a warrant for?") in O
					A.typ = "Hunt"
					A.name = "S-Ranked Mission: Hunt The Rogue!"
					A.mission = "<html><body bgcolor = red><center><b><hr><font size = 5>S-Ranked Mission: Hunt The Rogue Shinobi [k.name]!</font></b><br><hr><br>You must locate and kill the rouge shinobi [k.name]. They have gone unpunished for long enough.<br><hr><br>RP Requirements:<hr><br>It's simple. Gather information and locate your target, following all travel rules. This mission will be complete when you murdder your target.</center>"
					A.reward = 3000
					A.Vreward = 30000
					return

obj/Leaf_Council // Make Sannin, Make Genin, Make Chuunin, Make Jounin, Village Exile, Invite to Village , Make Squad(Player Squads are chosen by the Kage)
	verb
		Mission_Reward(mob/M in oview())
			set category = "Rank"
			var/reward=input("How much would you like to reward them?") as num
			if(reward>=1000)
				return
			if(reward<=0)
				return
			M.Yen += reward

		Make_Genin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Genin?") in V
			M.Class="Genin"
			M.contents += new/obj/items/Clothing/LeafHeadband

		Make_Chuunin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Chuunin?") in V
			M.Class="Chuunin"
			M.Cap=450
			if(M.Village=="Konohagakure")
				M.contents += new/obj/items/Clothing/Leaf_Chuunin
			if(M.Village=="Sunagakure")
				M.contents += new/obj/items/Clothing/Suna_Chuunin
			if(M.Village=="Kirigakure")
				M.contents += new/obj/items/Clothing/Mist_Chuunin
			var/random=rand(1,3)
			if(random==1)
			 M.srank="C-"
			if(random==2)
			 M.srank="C"
			if(random==3)
			 M.srank="C+"


		Make_Jounin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Jounin?") in V
			M.Class="Jounin"
			M.Cap=600
			if(M.Village=="Konohagakure")
				M.contents += new/obj/items/Clothing/Leaf_Jounin
				M.contents += new/obj/Jounin
			if(M.Village=="Sunagakure")
				M.contents += new/obj/items/Clothing/Suna_Jounin
				M.contents += new/obj/Jounin
			if(M.Village=="Kirigakure")
				M.contents += new/obj/items/Clothing/Mist_Jounin
				M.contents += new/obj/Jounin
			var/random=rand(1,3)
			if(random==1)
			 M.srank="B-"
			if(random==2)
			 M.srank="B"
			if(random==3)
			 M.srank="B+"

		Exile_From_Village()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to exile from the Village?") in V
			M.Village = "None"
			M.Class = "Missing"

		Invite_To_Village()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village=="None")
					V.Add(A)
			var/mob/M=input("Who would you like to invite to the Village?") in V
			M.Village = usr.Village

obj/Leaf_Anbu_Captain //Make Anbu, Make Squad
	verb
		Mission_Reward(mob/M in oview())
			set category = "Rank"
			var/reward=input("How much would you like to reward them?") as num
			if(reward>=1000)
				return
			if(reward<=0)
				return
			M.Yen += reward
		Make_Anbu()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Anbu?") in V
			M.Class="Anbu"
			M.srank="B+"

			if(prob(50))
				var/obj/items/Clothing/Anbu_Mask_Red/A = new()
				A.loc=M.contents
			else
				var/obj/items/Clothing/Anbu_Mask_Blue/A = new()
				A.loc=M.contents
obj/Leaf_Chuunin_Instructor //Make Chuunin, Fail Exam
	verb
		Host_Chuunin()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a Chuunin exam shortly, please make your way to the academy for further instructions."

		Make_Chuunin()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/M=input("Who would you like to make a Chuunin?") in V
			M.Class="Chuunin"
			M.Cap=450
			if(M.Village=="Konohagakure")
				M.contents += new/obj/items/Clothing/Leaf_Chuunin
			if(M.Village=="Sunagakure")
				M.contents += new/obj/items/Clothing/Suna_Chuunin
			if(M.Village=="Kirigakure")
				M.contents += new/obj/items/Clothing/Mist_Chuunin
			var/random=rand(1,3)
			if(random==1)
			 M.srank="C-"
			if(random==2)
			 M.srank="C"
			if(random==3)
			 M.srank="C+"

		Fail_Exam()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					if(A.Class=="Genin")
						V.Add(A)
			var/mob/M=input("Who would you like to remove from the exam?") in V
			viewers(M) << "[M] has been removed from the exam and has failed their Chuunin exam."

		Create_Earth_Scroll()
			set category = "Rank"
			var/obj/items/Scrolls/Earth_Scroll/A = new()
			A.loc = usr.loc

		Create_Heaven_Scroll()
			set category = "Rank"
			var/obj/items/Scrolls/Heaven_Scroll/A = new()
			A.loc = usr.loc


obj/Toad_Sage // Teach Jutsu, Make New Sage
	verb
		Make_New_Sage(mob/M in world)
			set category = "Rank"
			Toad_Sage=M.key
			for(var/obj/Toad_Sage/A in usr.contents)
				del(A)
			M.contents += new/obj/Toad_Sage

		Teach_Rasengan()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				V.Add(A)
			var/mob/M=input("Who would you like to teach a jutsu to?") in V
			switch(input("Which Jutsu would you like to teach to them?") in list("Rasengan","Cancel"))
				if("Rasengan")
					M.contents += new/obj/Ninjutsu/Rasengan


obj/Snake_Sage// Give Cursed Seal, Make New Sage, Living Corpse Reincarnation.
	verb
		Make_New_Sage(mob/M in world)
			set category = "Rank"
			Snake_Sage=M.key
			for(var/obj/Snake_Sage/A in usr.contents)
				del(A)
			M.contents += new/obj/Snake_Sage

		Give_Curse_Seal(mob/M in viewers())
			set category = "Rank"
			M.Curse()
		Seal_Cursed_Seal(mob/M in viewers())
			set category = "Rank"
			M.HasCurseSeal=0
			M.contents -= /obj/CurseSeal
obj/Slug_Sage// Make New Sage, Creation Rebirth
	verb
		Make_New_Sage(mob/M in world)
			set category = "Rank"
			Slug_Sage=M.key
			for(var/obj/Slug_Sage/A in usr.contents)
				del(A)
			M.contents += new/obj/Slug_Sage

obj/Akatsuki_Leader// Make New Leader, Invite Member,Create Ring, Create Clothes Scroll
	verb
		Mission_Reward_Experience()
			set category ="Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village==usr.Village)
					V.Add(A)
			var/mob/P=input("Who would you like to reward for a successful mission?")in V + list("Cancel")
			var/H = input("What rank of mission did they complete?")in list("E","D","C","B","A","S","Cancel")
			if(H=="E")
				P.Eranks += 1
				P.exptunarank += 0.5
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="D")
				P.Dranks += 1
				P.exptunarank += 1.0
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="C")
				P.Cranks += 1
				P.exptunarank += 2
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="B")
				P.Branks += 1
				P.exptunarank += 3
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="A")
				P.Aranks += 1
				P.exptunarank += 4
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
			if(H=="S")
				P.Sranks += 1
				P.exptunarank += 5
				P.Skill_Rank_Check()
				P<<"You have been rewarded for performing a mission!"
		Mission_Reward(mob/M in oview())
			set category = "Rank"
			var/reward=input("How much would you like to reward them?") as num
			if(reward>=1000)
				return
			if(reward<=0)
				return
			M.Yen += reward
		Invite_To_Akatsuki()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				if(A.Village=="None")
					V.Add(A)
			var/mob/M=input("Who would you like to invite to the Village?") in V
			M.Village = "Akatsuki"

		Create_Ring()
			set category = "Rank"
			var/M=input("Which ring would you like to create?")in list("Rei","Byaku","Kai","Sei","Shu","Sora","Minami","Hoku","San","Tama")
			var/obj/items/Nichibotsu_Ring/A = new()
			A.name = M
			A.loc = usr.loc

		Create_Clothing_Scroll()
			set category = "Rank"
			var/obj/items/Scrolls/Nichibotsu_Clothing/A = new()
			A.loc = usr.loc

obj/Sage_of_the_Six_Paths// Make New Sage, Rinnengan
	verb
		Make_New_Sage(mob/M in world)
			set category = "Rank"
			Sage_of_the_Six_Paths=M.key
			for(var/obj/Sage_of_the_Six_Paths/A in usr.contents)
				del(A)
			M.contents += new/obj/Sage_of_the_Six_Paths
			M.contents += new/obj/Doujutsu/Rinnegan

obj/Jounin
	verb
		Teach_Basic_Jutsu()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				V.Add(A)
			var/mob/M=input("Who would you like to teach a jutsu to?") in V
			switch(input("Which Jutsu would you like to teach to them?") in list("Bunshin no Jutsu","Kawarimi no Jutsu","Henge no Jutsu","Shunshin no Jutsu","Suimen Hokou no Waza","Cancel"))
				if("Bunshin no Jutsu")
					M.contents += new/obj/Genjutsu/Bunshin
				if("Kawarimi no Jutsu")
					M.contents += new/obj/Ninjutsu/Kawarimi
				if("Suimen Hokou no Waza")
					M.contents += new/obj/Ninjutsu/Suimen_Hokou_no_Waza
				if("Henge no Jutsu")
					M.contents += new/obj/Genjutsu/Henge
				if("Shunshin no Jutsu")
					M.contents += new/obj/Ninjutsu/Shunshin

		Make_Squad()
			set category = "Rank"
			var/SquadName = input("Please choose a name for your Squad") as text
			if(SquadName=="")
				return
			if(locate(/obj/Squad,usr.contents))
				return
			usr.contents += new/obj/Squad
			usr.SquadLeader=1
			usr.Squad = "[usr.key]"
			usr.SquadName= "[SquadName]"
			usr.SquadM=1



		Create_Chakra_Paper()
			set category = "Rank"
			var/obj/items/Chakra_Paper/A = new()
			A.loc = usr.loc

		Announce_Class()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a class held shortly, any students would be advised to head to the academy."

obj/Police_Captain
	verb
		Create_Badge()
			set category = "Rank"
			var/obj/items/Police_Badge/A = new()
			A.loc = usr.loc
		Bounty_Reward(mob/M in oview())
			set category = "Rank"
			var/reward=input("How much would you like to reward them?") as num
			if(reward>=1000)
				return
			if(reward<=0)
				return
			M.Yen += reward


obj/Academy_Headmaster
	verb
		Teach_Basic_Jutsu()
			set category = "Rank"
			var/list/V = new/list
			for(var/mob/A in viewers())
				V.Add(A)
			var/mob/M=input("Who would you like to teach a jutsu to?") in V
			switch(input("Which Jutsu would you like to teach to them?") in list("Bunshin no Jutsu","Kawarimi no Jutsu","Henge no Jutsu","Shunshin no Jutsu","Suimen Hokou no Waza","Cancel"))
				if("Bunshin no Jutsu")
					M.contents += new/obj/Genjutsu/Bunshin
				if("Suimen Hokou no Waza")
					M.contents += new/obj/Ninjutsu/Suimen_Hokou_no_Waza
				if("Kawarimi no Jutsu")
					M.contents += new/obj/Ninjutsu/Kawarimi
				if("Henge no Jutsu")
					M.contents += new/obj/Genjutsu/Henge
				if("Shunshin no Jutsu")
					M.contents += new/obj/Ninjutsu/Shunshin
		Invite_to_Academy(mob/M in oview())
			set category = "Rank"
			if(M.Village==usr.Village)
				M.Class = "Academy Student"

		Expell_from_Academy(mob/M in oview())
			set category = "Rank"
			if(M.Village==usr.Village)
				M.Class = "Academy Student"

		Announce_Class()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "There will be a class held shortly, any students would be advised to head to the academy."

		Announce_Meeting()
			set category = "Rank"
			for(var/mob/A in world)
				if(A.Village==usr.Village)
					A << "Please can all Academy Teachers report to the head office."

