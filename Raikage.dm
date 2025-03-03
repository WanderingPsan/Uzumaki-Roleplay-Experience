obj/Raikage
	verb
		Set_Taxes()
			set category = "Rank"
			var/numb = input("What will you set the village's tax rate to, between 25 and 30.")as num
			if(numb < 25)
				numb = 25
			if(numb > 30)
				numb = 30
			KumoTax = numb*0.01

		Take_Money_From_Coffers()
			set category = "Rank"
			var/numb = input("How much will you take from the village's coffers?")as num
			if(numb < KumoCash)
				usr.Yen += numb
				KumoCash -= numb
			if(numb > KumoCash)
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
			var/obj/items/Scrolls/RaiKage_Clothing/A = new()
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
			M.contents += new/obj/items/Clothing/CloudHeadband

		Give_Permission()
			set category = "Rank"
			for(var/mob/A in viewers())
				if(A.KumoPermission==0)
					A.KumoPermission=1
				if(A.KumoPermission==1)
					A.KumoPermission=0



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
			M.contents += new/obj/items/Clothing/Kumo_Chunin
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
			M.contents += new/obj/items/Clothing/Kumo_Jonin
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
				var/obj/items/Clothing/Anbu_Armor/B=new(M)
				A.loc=M.contents
				B.loc=M.contents
			else
				var/obj/items/Clothing/Anbu_Mask_Blue/A = new()
				var/obj/items/Clothing/Anbu_Armor/B=new(M)
				A.loc=M.contents
				B.loc=M.contents

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
			if(prob(50))
				var/obj/items/Clothing/Anbu_Mask_Red/A = new()
				var/obj/items/Clothing/Anbu_Armor/B=new(M)
				A.loc=M.contents
				B.loc=M.contents
			else
				var/obj/items/Clothing/Anbu_Mask_Blue/A = new()
				var/obj/items/Clothing/Anbu_Armor/B=new(M)
				A.loc=M.contents
				B.loc=M.contents

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
			var/Q = input("Which rank of scroll would you like?") in list("E Rank","D Rank","C Rank","B Rank","A Rank","S Rank","Custom")
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



obj/Amekage
	verb
		Set_Taxes()
			set category = "Rank"
			var/numb = input("What will you set the village's tax rate to, between 25 and 30.")as num
			if(numb < 25)
				numb = 25
			if(numb > 30)
				numb = 30
			AmeTax = numb*0.01

	/*	Take_Money_From_Coffers()
			set category = "Rank"
			var/numb = input("How much will you take from the village's coffers?")as num
			if(numb > AmeCash)
				numb = AmeCash
			usr.Yen += numb
			AmeCash -= numb */

		Take_Money_From_Coffers()
			set category = "Rank"
			var/numb = input("How much will you take from the village's coffers?")as num
			if(numb < AmeCash)
				usr.Yen += numb
				AmeCash -= numb
			if(numb > AmeCash)
				return

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
			var/obj/items/Scrolls/AmeKage_Clothing/A = new()
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
			M.contents += new/obj/items/Clothing/RainHeadband

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
			M.contents += new/obj/items/Clothing/Ame_Chunin
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
			M.contents += new/obj/items/Clothing/Ame_Jonin
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
				var/obj/items/Clothing/Anbu_Armor/B=new(M)
				A.loc=M.contents
				B.loc=M.contents
			else
				var/obj/items/Clothing/Anbu_Mask_Blue/A = new()
				var/obj/items/Clothing/Anbu_Armor/B=new(M)
				A.loc=M.contents
				B.loc=M.contents

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
			if(prob(50))
				var/obj/items/Clothing/Anbu_Mask_Red/A = new()
				var/obj/items/Clothing/Anbu_Armor/B=new(M)
				A.loc=M.contents
				B.loc=M.contents
			else
				var/obj/items/Clothing/Anbu_Mask_Blue/A = new()
				var/obj/items/Clothing/Anbu_Armor/B=new(M)
				A.loc=M.contents
				B.loc=M.contents

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