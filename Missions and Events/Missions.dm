mob/var
	Eranks = 0
	Dranks = 0
	Cranks = 0
	Branks = 0
	Aranks = 0
	Sranks = 0


obj/items/Scrolls
	Mission_Scroll
		icon='Scrolls.dmi'
		var/mission = ""
		var/completer = ""
		var/reward = 0
		var/Vreward = 0
		var/complete = 0
		Click()
			if(src in usr.contents)
				usr<<browse(src.mission,"window=[src];size=250x350;can_resize=0;can_minimize=0")
				if(istype(src,/obj/items/Scrolls/Mission_Scroll/ERankMission/ERank10/))
					var/B=input("Which Choice do you want?") in list("A","B","C")
					if(B=="A")
						src.reward = 0
						src.Vreward = 600
						usr<<"You chose choice A."
					if(B=="B")
						src.reward = 15
						src.Vreward = 150
						usr<<"You chose choice B."
					if(B=="C")
						src.reward = 50
						src.Vreward = 300
						usr<<"You chose choice C."
		verb
			Give_Scroll()
				if(usr.Kage)
					var/list/O = new/list
					for(var/mob/M in view())
						if(M.Village == usr.Village)
							O.Add(M)
					var/mob/Q = input(usr,"Who do you want to give this to?","Give Scroll") in O
					Q.contents += src
					src.completer = Q.displaykey
					Q<<"You have been given a mission by your Kage! Complete it for a reward."
					for(var/mob/P in world)
						if(P.Admin)
							P<<"[usr] has given [Q] A Mission it is [src.name]. You may be needed."
				else
					usr<<"You cannot perform this task, you are not the Kage."
			Complete(msg as message)
				if(!src.complete)
					if(msg=="")
						return
					if(lentext(msg) <= 500)
						return
					src.mission = "<html><body>[msg]"
					src.complete = 1
					if(usr.displaykey == src.completer)
						usr.Yen += src.reward
						if(usr.Village == "Konohagakure")
							KonohaCash += src.Vreward
						if(usr.Village == "Kirigakure")
							KiriCash += src.Vreward
						if(usr.Village == "Kumogakure")
							KumoCash += src.Vreward
						if(usr.Village == "Sunagakure")
							SunaCash += src.Vreward
						if(usr.Village == "Amegakure")
							AmeCash += src.Vreward
					del src
				else
					usr<<"This is already completed...This is why we can't have nice things..."

		ERankMission
			ERank1
				name = "E-Rank Mission 1: Clean up Trash!"
				mission = "<html><body bgcolor = grey><center><b><hr><font size = 5>E-Rank Mission One: Clean up Trash!</font></b><br><hr><br>You must walk around the village and clean up trash.<br><hr><br>RP Requirements:<hr><br>3 Paragraph, cleaning up 10 bags of trash for 500 Yen to the village. 50 to the completer.</center>"
				icon_state = "1"
				reward = 50
				Vreward = 500
			ERank2
				name = "E-Rank Mission 2: Locate Missing Cat in Forest!"
				mission = "<html><body bgcolor = grey><center><b><hr><font size = 5>E-Rank Mission Two: Locate Lost Cat!</font></b><br><hr><br>There is a cat lost in the forest just outside of the village. Go there and search.<br><hr><br>RP Requirements:<hr><br>RP five paragraphs after going out into the forest near your village. If you're in Kirigakure you don't have to leave the village, if you're in Sunagakure, check the desert for 600 Yen to the Village. 60 to the completer.</center>"
				icon_state = "1"
				reward = 60
				Vreward = 600
			ERank3
				name = "E-Rank Mission 3: Sweep the Steps of the Kage's Office!"
				mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>E-Rank Mission Three: Sweep the Steps!</font></b><br><hr><br>The Kage's mansions steps are dusty...Sweep them.<br><hr><br>RP Requirements:<hr><br>3 RPS of sweeping steps. If you're in Sunagakure, five RPs and double payment. For 300 Yen to village. 30 to completer.</center>"
				icon_state = "1"
				reward = 30
				Vreward = 300
			ERank4
				name = "E-Rank Mission 4: Pick up a letter!"
				mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>E-Rank Mission Four: Retrieve a Letter!</font></b><br><hr><br>A Letter for the client has arrived at the local postal service. Go pick it up and bring it back to them.<br><hr><br>RP Requirements:<hr><br>2 RPS. One going. One Coming. 100 Yen for the Village. 10 for the completer.</center>"
				icon_state = "1"
				reward = 10
				Vreward = 100
			ERank5
				name = "E-Rank Mission 5: Deliver Flowers!"
				mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>E-Rank Mission Five: Deliver Flowers!</font></b><br><hr><br>A woman's lover has ordered some flowers for her. Deliver them to her please.<br><hr><br>RP Requirements:<hr><br>3 RPS for 350 Yen to the village. 35 to the completer. An Extra 50 if the completer sings a song.</center>"
				icon_state = "1"
				reward = 35
				Vreward = 350
			ERank6
				name = "E-Rank Mission 6: Dig a hole!"
				mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>E-Rank Mission Six: Dig a hole!</font></b><br><hr><br>A local construction company needs a hole to be dug. Go and help them.<br><hr><br>RP Requirements:<hr><br>3 RPS. Dig a hole...Pretty simple. 700 Yen for the village. 70 to completer.</center>"
				icon_state = "1"
				reward = 70
				Vreward = 700
			ERank7
				name = "E-Rank Mission 7: Fill a hole!"
				mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>E-Rank Mission Seven: Fill a hole!</font></b><br><hr><br>Turns out that construction company that was building recently wasn't allowed to dig there..Fill the hole up.<br><hr><br>RP Requirements:<hr><br>4 RPS. Fill a hole. 800 Yen to the Village. 60 to completer.</center>"
				icon_state = "1"
				reward = 60
				Vreward = 800
			ERank8
				name = "E-Rank Mission 8: Help build a house!"
				mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>E-Rank Mission Eight: Let's Build a House!</font></b><br><hr><br>A home is in need of construction, head out and help the crew!<br><hr><br>RP Requirements:<hr><br>7 RPs, the house needs to be built from the bottom up. Call an admin to actually build it if you're in Kumo, Kiri, Suna, or Ame. 2500 for village. 250 for completer.</center>"
				icon_state = "1"
				reward = 250
				Vreward = 2500
			ERank9
				name = "E-Rank Mission 9: Go Shopping with an elderly villager!"
				mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>E-Rank Mission Nine: Go Shopping with an Elderly Person!</font></b><br><hr><br>There is an elderly person waiting for you. Take them to the local market!<br><hr><br>RP Requirements:<hr><br>If you call an Admin to play the old person ( recommended ) Then the requirement is as long as it takes and the payout is 5000 for the Village 500 for completer. If you don't, 5 RPs, 200 for village, 20 for completer.</center>"
				icon_state = "1"
				reward = 20
				Vreward = 200
			ERank10
				name = "E-Rank Mission 10: Locate a runaway dog!"
				mission ="<html><body bgcolor = grey><center><b><hr><font size = 5>E-Rank Mission Ten: Locate a Stray Dog!</font></b><br><hr><br>A dog has gone missing! It's up to you to find it!<br><hr><br>RP Requirements:<hr><br>5 RPs. Your Choice: A) The dog attacks and you must put it down B)its scared and in a corner C) It runs. Hard. Catch it. Prices: A) 600 Village | 0 You B) 150 Village | 15 You C) 300 Village | 50 You"
				icon_state = "1"
				reward = 50
				Vreward = 500

		DRankMission
			DRank1
				name = "D-Rank Mission 1: Give an academy student a private lesson!"
				mission ="<html><body bgcolor = black><center><b><hr><font size = 3 color=white>D-Rank Mission One: Give an Academy Student a Private Lesson!</font></b><br><hr><br><font size = 2 color=white>A student from the academy is behind a few of his peers. Help him catch up by teaching him something!<br><hr><br>RP Requirements:<hr><br>15 RPs. 1500 Yen to the village. 150 to you.</center>"
				icon_state = "2"
				reward = 150
				Vreward = 1500

			DRank2
				name = "D-Rank Mission 2: Deliver materials!"
				mission="<html><body bgcolor = black><center><b><hr><font size = 3 color=white>D-Rank Mission Two: Deliver Materials!</font></b><br><hr><br><font size = 2 color=white>You must deliver a package of materials from your village to the Samurai Settlement south of Konohagakure!<br><hr><br>RP Requirements:<hr><br>5 - 7 RPs per map, more RPs means more rewards. 2k Yen to village. 200 to you.</center>"
				icon_state = "2"
				reward = 200
				Vreward = 2000
			DRank3
				name = "D-Rank Mission 3: Show a visitor around the village!"
				mission="<html><body bgcolor = black><center><b><hr><font size = 3 color=white>D-Rank Mission Three: Show a visitor around the village!</font></b><br><hr><br><font size = 2 color=white>You must show a foreigner around the village!<br><hr><br>RP Requirements:<hr><br>8 - 10 RPs. 1700 Yen to village. 170 to you.</center>"
				icon_state = "2"
				reward = 170
				Vreward = 1700
			DRank4
				name = "D-Rank Mission 4: Sit in on a meeting and take notes!"
				mission="<html><body bgcolor = black><center><b><hr><font size = 3 color=white>D-Rank Mission Four: Sit in on a meeting!</font></b><br><hr><br><font size = 2 color=white>You must sit in on a village political meeting and take notes on the proceedings.<br><hr><br>RP Requirements:<hr><br>10 - 15 RPs. 150 Yen to Village. 1500 to you.</center>"
				icon_state = "2"
				reward = 1500
				Vreward = 150
			DRank5
				name = "D-Rank Mission 5: Take a message to a friendly village!"
				mission="<html><body bgcolor = black><center><b><hr><font size = 3 color=white>D-Rank Mission Five: Take a message to a friendly village!</font></b><br><hr><br><font size = 2 color=white>You must take a message, provided by your Kage, to one of the villages allied with yours.<br><hr><br>RP Requirements:<hr><br>5 RPs per map. This is a mission best performed with an EC on the way there. 1750 Yen to Village. 175 to you.</center>"
				icon_state = "2"
				reward = 750
				Vreward = 1750
			DRank6
				name = "D-Rank Mission 6: Wood delivery!"
				mission="<html><body bgcolor = black><center><br><hr><font size = 3 color=white>D-Rank Mission Six: Wood delivery!</font></b><hr><br><font size = 2 color=white>You must cut down a tree in the forest and take the wood to a small village in the south of the Land of Fire.<br><hr><br>RP Requirements:<hr><br>3 RPs per map. 4000 Yen to village. 1500 to you.</center>"
				icon_state = "2"
				reward = 1500
				Vreward = 4000
			DRank7
				name = "D-Rank Mission 7: Spar a lower ranked shinobi!"
				mission="<html><body bgcolor =black><center><br><hr><font size = 3 color=white>D-Rank Mission Seven: Spar!</font></b><hr><br><font size = 2 color=white>You have to find and have a friendly spar with a lower ranked shinobi.<br><hr><br>RP Requirements:<hr><br>Five Rounds or until one of the ighters is unconscious. This mission nets no Yen.</center>"
				icon_state = "2"
				reward = 0
				Vreward = 0
			DRank8
				name = "D-Rank Mission 8: Gate Guard Duty!"
				mission="<html><body bgcolor = black><center><br><hr><font size = 3 color=white>D-Rank Mission Seven: Gate Guard Duty!</font></b><hr><br><font size= 2 color=white>You must guard the gate of your village until your kage relieves you.<br><hr><br>RP Requirements:<hr><br>20 minute minimum. 10 RPs. 1500 Yen to Village. 900 to you.</center>"
				icon_state = "2"
				reward = 900
				Vreward = 1500

		CRankMission
			CRank1
				name = "C-Rank Mission 1: Wolf Invasion!"
				mission="<html><body bgcolor = black><center><br><hr><font size = 3 color=white>C-Rank Mission One: Wolf Invasion!</font></b><hr><br><font size= 2 color=white>More and more reports of rabid wolves have been coming in. Go to the outskirts of your village and take out as many wolves as you can to clear a safe path for merchants and visitors.<br><hr><br>RP Requirements:<hr><br>25 RPs. 1600 Yen to Village. 1000 to you.</center>"
				icon_state = "2"
				reward = 1000
				Vreward = 1600
			CRank2
				name = "C-Rank Mission 2: Speculations!"
				mission="<html><body bgcolor = black><center><br><hr><font size = 3 color=white>C-Rank Mission Two: Speculations!</font></b><hr><br><font size= 2 color=white>Your Kage disclose to you that he has a feeling that the village is being spied on. It's not a major threat from another major village but a business deal with bandits gone wrong. Take a look at the outskirts of the village and report what you find. (You can have this missions EC'd and carry a squad of your choosing with you. Should you have this EC then the reward rank would be B but keep in mind that the death possibility for you raises as well since you'll be fighting bandits really out to kill you).<br><hr><br>RP Requirements:<hr><br>30 RPs. 2600 Yen to Village. 2000 to you.</center>"
				icon_state = "2"
				reward = 2000
				Vreward = 2600
			CRank3
				name = "C-Rank Mission 3: Bouncer!"
				mission="<html><body bgcolor = black><center><br><hr><font size = 3 color=white>C-Rank Mission Three: Bouncer!</font></b><hr><br><font size= 2 color=white>The local bar has been getting some rowdy customers lately, your job is to be the bouncer and eject unwanted customers.<br><hr><br>RP Requirements:<hr><br>15 RPs. 1600 Yen to Village. 1000 to you.</center>"
				icon_state = "2"
				reward = 1000
				Vreward = 1600
			CRank4
				name = "C-Rank Mission 4: Operation Clear-out!"
				mission="<html><body bgcolor = black><center><br><hr><font size = 3 color=white>C-Rank Missons Four: Operation Clear-out!</font></b><hr><br><font size= 2 color=white>A nearby valley has suffered a landslide and as a result is blocked. Clear the valley to allow passage to traders and travelers.<br><hr><br>RP Requirements:<hr><br>15 RPs. 1600 Yen to Village. 1000 to you.</center>"
				icon_state = "2"
				reward = 1000
				Vreward = 1600
			CRank5

		BRankMission
			BRank1
				name = "B-Rank Mission 1: Spar a higher ranked shinobi!"
				mission="<html><body bgcolor = green><center><br><hr><font size = 3 color=pink>B-Rank Mission One: Spar a higher ranked shinobi!</font></b><hr><br><font size=2 color=pink>You must spar a higher ranked shinobi for training.<br><hr><br>RP Requirements:<hr><br>5 round minimum."
				icon_state = "2"
				reward = 0
				Vreward = 0
			BRank2
				name = "B-Rank Mission 2: Give a Private Lesson!"
				mission="<html><body bgcolor = green><center><br><hr><font size = 3 color=pink>B-Rank Mission Two: Give a private lesson to a clas of students!</font></b><hr><br><font size=2 color=pink>You must teach a class of at least three students about any topic.<br><hr><br>RP Requirements:<hr><br>None specifically. Students must learn."
				reward = 500
				Vreward = 0
			BRank3
				name = "B-Rank Mission 3: Lead a squad on a mission!"
				mission="<html><body bgcolor = green><cener><br><hr><font size = 3 color=pink>B-Rank Mission Three: Take a squad on a mission!</font></b><hr><br><font size=2 color=pink>You must lead a squad of three genin on a mission of any rank.<br><hr><br>RP Requirements:<hr><br>Whatever the mission you take entails."
				reward = 750
				Vreward = 0
			BRank4
				name = "B-Rank Mission 4: Execute a criminal!"
				mission="<html><body bgcolor = green><cener><br><hr><font size = 3 color=pink>B-Rank Mission Four: Execute a criminal!</font></b><hr><br><font size=2 color=pink>You must execute a criminal on Death Row."
				reward = 1500
				Vreward = 15000
		ARankMission
			ARank1
			ARank2
			ARank3
			ARank4
			ARank5
			ARank6
			ARank7
			ARank8
			ARank9
		SRankMission
			SRank1

		CustomMission
			icon_state = "5"
			var
				rank = ""
				typ = ""
				clie = ""
				targ = ""


































































































































