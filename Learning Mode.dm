mob/var
	learning=0
	teaching=0

mob/verb
	Learning_Mode()
		set category="Combat"
		if(!usr.leeching)
			src << "You are now able to learn from those who can teach."
			usr.leeching=1
		else
			src << "You are no longer paying attention to teachers."
			usr.leeching=0

mob/var/exp = 0


mob/proc
	SkillUp()
		for(var/obj/Perk/A in usr.contents)
			if(A.name == "Prodigy")
				if(prob(50))
					usr.exp += 5
				else
					if(prob(60))
						usr.exp += 4.5
					else
						usr.exp += 4.0
			else
				if(A.name == "Mastery")
					if(prob(50))
						usr.exp += 5
					else
						if(prob(60))
							usr.exp += 4.5
						else
							usr.exp += 4.0
				else
					if(prob(30))
						usr.exp += 1
					else
						if(prob(50))
							usr.exp += 0.1
						else
							usr.exp += 0
			usr.exp+=5

		if(usr.exp > 50)
			var/obj/P = locate(/obj/Student) in usr.contents
			if(!P)
				usr.contents += new/obj/Student
		if(usr.exp > 200)
			var/obj/U = locate(/obj/Teacher) in usr.contents
			if(!U)
				usr.contents += new/obj/Teacher

obj/Custom/proc
	ErpUp()
		for(var/obj/Perk/A in usr.contents)
			if(A.name == "Mastery")
				src.RPPSpent += rand(10,15)
			if(findtext("[A.name]","[src.ele]"))
				if(A.tier==1)
					src.RPPSpent += rand(5,10)
				if(A.tier==2)
					src.RPPSpent += rand(10,15)
				if(A.tier==3)
					src.RPPSpent += rand(15,20)
				if(A.tier==4)
					src.RPPSpent += rand(20,25)
				if(A.tier==5)
					src.RPPSpent += rand(25,30)
				if(A.tier=="Master")
					src.RPPSpent += rand(30,35)
			src.RPPSpend()

mob/var/leeching = 0
mob/var/Training = 0

obj
	Teacher
		verb
			Teach_Jutsu()
				set category = "Jutsu Training"
				var/mob/M
				var/list/L = new/list
				for(var/obj/Custom/B in usr.contents)
					L.Add(B)
				var/obj/Custom/C = input("Which Jutsu would you like to teach?") in L
				var/list/N = new/list
				for(M in view(2))
					N.Add(M)
				var/mob/D = input("Who would you like to teach it to?") in N
				if(D.exp > 50 && D.leeching)
					if(C.skil == "Expert" || C.skil == "Veteran" || C.skil =="Mastered")
						if(C.ele ==D.PrimaryElement || C.ele ==D.SecondaryElement || C.ele ==D.TertiaryElement ||C.ele =="Elementless" || C.ele ==D.QuadranaryElement || C.ele ==D.QuinaryElement)
							var/obj/Custom/Blank_Jutsu/E = new(D)
							E.name= C.name
							E.description= C.description
							E.dran= C.dran * 1.55
							E.skil= "New"
							E.jut= C.jut
							E.ran= C.ran
							E.ele= C.ele
							usr<<"You have taught [C] to [D]."
						else
							usr<<"They cannot learn a jutsu of that element."
					else
						usr<<"You are not skilled enough to teach this."
				else
					usr<<"They either don't have the experience to learn from watching you or they aren't currently paying attention."

			Create_Jutsu_Scroll()
				set category = "Jutsu Training"
				usr.contents += new/obj/items/Scrolls/Jutsu_Scroll

	Student
		verb
			Practice_Jutsu()
				set category = "Jutsu Training"
				if(usr.Training)
					usr<<"You cannot train right now.."
				else
					usr.Training = 1
					spawn(500)
					usr.Training = 0
					var/list/L = new/list
					for(var/obj/Custom/B in usr.contents)
						L.Add(B)
					var/obj/Custom/C = input("Which Jutsu would you like to train?") in L
					if(C == null)
						return
					C.RPPSpent += rand(2,5)
					usr<<"You have successfully increased you skill with this jutsu by a small amount!"
					C.RPPSpend()
					usr.Training = 0
					if(usr.Trait == "Genius")
						C.RPPSpent += rand(5,10)
						usr<<"Your Genius Trait Kicked In!"
					if(usr.Trait == "Hardworker")
						C.RPPSpent += rand (10,25)
						usr<<"Your Hardworker Trait Kicked In!"
					for(var/obj/Perk/Q in usr.contents)
						if(findtext(Q.name,"Elemental Training [C.ele]"))
							if(prob(95))
								C.RPPSpent += 10
								C.RPPSpend()
								usr<<"Elemental Training [C.ele] kicked in!"
								usr.Training = 0
							else
								C.RPPSpent += 5
								C.RPPSpend()
								usr<<"You have successfully increased you skill with this jutsu by a small amount!"
								spawn(100)
								usr.Training = 0
						if(findtext(Q.name,"Elemental Mastery [C.ele]"))
							if(prob(75))
								C.RPPSpent += 25
								C.RPPSpend()
								usr<<"Elemental Master [C.ele] kicked in!"
								usr.Training = 0
							else
								C.RPPSpent += 5
								C.RPPSpend()
								usr<<"You have successfully increased you skill with this jutsu by a small amount!"
								spawn(100)
								usr.Training = 0

						if(findtext(Q.name,"Studious 1"))
							if(prob(85))
								C.RPPSpent += rand(5,20)
								C.RPPSpend()
								usr<<"Studious 1 kicked in!"
								usr.Training = 0

						if(findtext(Q.name,"Studious 2"))
							if(prob(85))
								C.RPPSpent += rand(10,40)
								C.RPPSpend()
								usr<<"Studious 2 kicked in!"
								usr.Training = 0

						if(findtext(Q.name,"Studious 3"))
							if(prob(85))
								C.RPPSpent += rand(15,60)
								C.RPPSpend()
								usr<<"Studious 3 kicked in!"
								usr.Training = 0

						if(findtext(Q.name,"Studious 4"))
							if(prob(85))
								C.RPPSpent += rand(20,80)
								C.RPPSpend()
								usr<<"Studious 4 kicked in!"
								usr.Training = 0

						if(Q.name == "Mastery")
							C.RPPSpent += rand(20,80)
							C.RPPSpend()
							usr<<"Your Masterful Skill kicked in."
							usr.Training = 0

						if(Q.name == "Prodigy")
							C.RPPSpent += rand(20,80)
							C.RPPSpend()
							usr<<"Your Prodigal skill kicked in."
							usr.Training = 0

						if(Q.name == "Hardworker")
							C.RPPSpent += rand(20,80)
							C.RPPSpend()
							usr<<"Your Hard Work Has Paid Off."
							usr.Training = 0

mob/Admin3/verb
	Delete_False_Prophets()
		set category = "Admin"
		for(var/obj/Teacher/Q in world)
			del Q

	Delete_False_Worshippers()
		set category = "Admin"
		for(var/obj/Student/Q in world)
			del Q