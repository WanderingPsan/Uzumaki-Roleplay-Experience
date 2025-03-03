obj/Squad
	verb
		Recruit()
			set category = "Squad"
			var/list/V = new/list
			for(var/mob/M in oview())
				if(M.Village ==usr.Village)
					V.Add(M)
			var/mob/A=input("Who would you like to recruit to your Squad?") in V
			if(A==null)
				return
			switch(alert(A,"[usr] has invited you to their Squad, [usr.SquadName]","","Accept","Deny"))
				if("Accept")
					A.Squad = "[usr.Squad]"
					A.SquadMember =1
					A.SquadName = "[usr.SquadName]"
					A.contents += new/obj/Squad_Member
					A.SquadM=1
					for(var/mob/B in world)
						if(B.Squad=="[usr.Squad]")
							B << "[A] has joined [usr.SquadName]"

		Rename()
			set category = "Squad"
			var/NewSquadName = input("Please choose a new Squad name") as text
			for(var/mob/B in world)
				if(B.Squad=="[usr.Squad]")
					B.SquadName = "[NewSquadName]"

		Exile()
			set category = "Squad"
			var/list/V = new/list
			for(var/mob/M in oviewers())
				if(M.client)
					if(M.Squad == usr.Squad)
						V.Add(M)
			var/mob/A=input("Who would you like to exile from [usr.SquadName]?") in V
			if(A==null)
				return
			A.Squad="None"
			A.SquadName=""
			A.SquadMember =0
			A.SquadM=0
			A.verbs -= /obj/Squad/verb/Leave_Squad
			A.verbs -= new/obj/Squad/verb/Radio
			for(var/obj/Squad/B in usr.contents)
				del(B)


		Radio(msg as text)
			set category = "Squad"
			if(msg=="")
				return
			for(var/mob/M in world)
				if(M.Squad=="[usr.Squad]")
					M << "<font color= green>{Radio}[usr] says<font color = green>: [html_encode(msg)]"


		Make_Squad_Leader()
			set category = "Squad"
			var/list/V = new/list
			for(var/mob/M in oviewers())
				if(M.client)
					if(M.Squad == usr.Squad)
						V.Add(M)
			var/mob/A=input("Who would you like to make the leader of [usr.SquadName]?") in V
			if(A==null)
				return
			usr.contents -= new/obj/Squad
			usr.verbs += new/obj/Squad/verb/Leave_Squad
			usr.SquadLeader=0
			for(var/obj/Squad/B in usr.contents)
				del(B)
			A.verbs -= new/obj/Squad/verb/Leave_Squad
			A.contents += new/obj/Squad
			A.verbs += new/obj/Squad/verb/Radio
			A.SquadLeader=1

		Leave_Squad()
			set category = "Squad"
			switch(input("Are you sure you wish to leave your Squad?") in list("Yes","No"))
				if("Yes")
					usr.Squad = ""
					usr.SquadName=""
					usr.SquadMember=0
					usr.SquadLeader=0
					usr.SquadM=0
					usr.contents -= new/obj/Squad
					usr.contents -= new/obj/Squad_Member
					usr.verbs -= new/obj/Squad/verb/Radio
					usr.verbs -= new/obj/Squad/verb/Leave_Squad
					for(var/obj/Squad/B in usr.contents)
						del(B)

obj/Squad_Member
	verb
		Radio(msg as text)
			set category = "Squad"
			if(msg=="")
				return
			for(var/mob/M in world)
				if(M.Squad=="[usr.Squad]")
					M << "<font color=[usr.SayFont]>[usr] says<font color = green>: [html_encode(msg)]"

		Leave_Squad()
			set category = "Squad"
			switch(input("Are you sure you wish to leave your Squad?") in list("Yes","No"))
				if("Yes")
					usr.Squad = ""
					usr.SquadName=""
					usr.SquadMember=0
					usr.SquadLeader=0
					usr.SquadM=0
					usr.contents -= new/obj/Squad
					usr.contents -= new/obj/Squad_Member
					usr.verbs -= new/obj/Squad/verb/Radio
					usr.verbs -= new/obj/Squad/verb/Leave_Squad
					for(var/obj/Squad/B in usr.contents)
						del(B)