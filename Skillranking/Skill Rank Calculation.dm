mob/var
	exptunarank = 0
	PerC2Nxt = 0
	uprank = 10
	InitialSet = 0
	HPPerc = 0

mob/proc
	Rankup()
		if(findtext("[usr.srank]","D-"))
			usr.srank = "D"
			usr.uprank = 20
			return
		if(usr.srank=="D")
			usr.srank = "D+"
			usr.uprank = 30
			return
		if(findtext("[usr.srank]","D+"))
			usr.srank = "C-"
			usr.uprank = 40
			return
		if(findtext("[usr.srank]","C-"))
			usr.srank = "C"
			usr.uprank = 55
			return
		if(usr.srank=="C")
			usr.srank = "C+"
			usr.uprank = 65
			return
		if(findtext("[usr.srank]","C+"))
			usr.srank = "B-"
			usr.uprank = 75
			return
		if(findtext("[usr.srank]","B-"))
			usr.srank = "B"
			usr.uprank = 85
			return
		if(usr.srank=="B")
			usr.srank = "B+"
			usr.uprank = 95
			return
		if(findtext("[usr.srank]","B+"))
			usr.srank = "A-"
			usr.uprank = 105
			return
		if(findtext("[usr.srank]","A-"))
			usr.srank = "A"
			usr.uprank = 115
			return
		if(usr.srank=="A")
			usr.srank = "A+"
			usr.uprank = 125
			return
		if(findtext("[usr.srank]","A+"))
			usr.srank = "S-"
			usr.uprank = 135
			return
		if(findtext("[usr.srank]","S-"))
			usr.srank = "S"
			usr.uprank = 155
			return
		if(usr.srank=="S")
			usr.srank = "S+"
			usr.uprank = 200
			return

	Login_Rank_Check()
		if(findtext("[usr.srank]","D-"))
			usr.uprank = 10
		if(usr.srank=="D")
			usr.uprank = 20
		if(findtext("[usr.srank]","D+"))
			usr.uprank = 30
		if(findtext("[usr.srank]","C-"))
			usr.uprank = 45
		if(usr.srank=="C")
			usr.uprank = 55
		if(findtext("[usr.srank]","C+"))
			usr.uprank = 65
		if(findtext("[usr.srank]","B-"))
			usr.uprank = 75
		if(usr.srank=="B")
			usr.uprank = 85
		if(findtext("[usr.srank]","B+"))
			usr.uprank = 95
		if(findtext("[usr.srank]","A-"))
			usr.uprank = 105
		if(usr.srank=="A")
			usr.uprank = 115
		if(findtext("[usr.srank]","A+"))
			usr.uprank = 125
		if(findtext("[usr.srank]","S-"))
			usr.uprank = 135
		if(usr.srank=="S")
			usr.uprank = 155
		if(findtext("[usr.srank]","S+"))
			usr.uprank = 200
	ExpTunaSet()
		if(!usr.InitialSet)
			var/list/A = new/list
			for(var/obj/Perk/P in usr.contents)
				A.Add(P)
			var/list/I = new/list
			for(var/obj/Custom/J in usr.contents)
				I.Add(J)

			for(var/obj/Perk/S in A)
				if(S.tier==1)
					usr.exptunarank += 1
				if(S.tier==2)
					usr.exptunarank += 2
				if(S.tier==3)
					usr.exptunarank += 3
				if(S.tier==4)
					usr.exptunarank += 4
				if(S.tier==5)
					usr.exptunarank += 5
				if(S.tier=="Master")
					usr.exptunarank += 2
			for(var/obj/Custom/G in I)
				if(G.skil == "New")
					usr.exptunarank += 1
				if(G.skil == "Novice")
					usr.exptunarank += 2
				if(G.skil == "Expert")
					usr.exptunarank += 3
				if(G.skil == "Veteran")
					usr.exptunarank += 4
				if(G.skil == "Mastered")
					usr.exptunarank += 5
			usr.Skill_Rank_Check()
			usr.InitialSet = 1

	Skill_Rank_Check()
		usr.PerC2Nxt = round((usr.exptunarank/usr.uprank)*100)
		winset(usr,"exp","value=[usr.PerC2Nxt]")
		if(usr.exptunarank >= usr.uprank)
			winset(src,"exp","value=0")
			usr.exptunarank = 0
			usr.Rankup()
	Constitution_Check()
		src.HPPerc=round((src.JConst/src.maxJConst)*100)
		winset(src,"HPBar","value=[HPPerc]")
		if(!src.Dead)
			if(src.JConst <= 0)
				src.Death()