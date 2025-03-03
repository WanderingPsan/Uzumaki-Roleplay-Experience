mob/perkmaster/verb/Set_Drains()
	set category = "Perk Master"
	for(var/obj/Custom/A in world)
		if(A.jut == "Taijutsu")
			A.idran = "Stamina"
		else
			A.idran = "Chakra"
	world<<"<font color=red>[usr.displaykey] has unlocked all jutsus."
	Admin_Logs+="<br>[usr]([usr.key]) has set all drains."
	SaveLogs()



mob
	proc
		SalaryPay()
			set background=1
			if(src.Village)
				src.Yen += src.Salary
				src<<"You got paid!"

			if(src.Village == "Konohagakure")
				KonohaCash += src.Salary*KonohaTax
				src.Yen -= src.Salary*KonohaTax
				src<<"You've paid your taxes."

			if(src.Village == "Kirigakure")
				KiriCash += src.Salary*KiriTax
				src.Yen -= src.Salary*KiriTax
				src<<"You've paid your taxes."

			if(src.Village == "Sunagakure")
				SunaCash += src.Salary*SunaTax
				src.Yen -= src.Salary*SunaTax
				src<<"You've paid your taxes."

			if(src.Village == "Kumogakure")
				KumoCash += src.Salary*KumoTax
				src.Yen -= src.Salary*KumoTax
				src<<"You've paid your taxes."

			if(src.Village == "Amegakure")
				AmeCash += src.Salary*AmeTax
				src.Yen -= src.Salary*AmeTax
				src<<"You've paid your taxes."

			if(src.Village == "Genji No Sato")
				GenjiCash += src.Salary*GenjiTax
				src.Yen -= src.Salary*GenjiTax

			if(src.Village == "Shinkogakure")
				ShinCash += src.Salary*ShinTax
				src.Yen -= src.Salary*ShinTax


			if(prob(45))
				src.SicknessDrain()
			for(var/obj/Prison_Door/P in world)
				if(P.Renter == src)
					if(src.Yen >= P.Rent)
						src.Yen -= P.Rent
						src<<"You paid your rent!"
						if(usr.Village == "Konohagakure")
							KonohaCash += P.Rent
						if(usr.Village == "Kirigakure")
							KiriCash += P.Rent
						if(usr.Village == "Kumogakure")
							KumoCash += P.Rent
						if(usr.Village == "Sunagakure")
							SunaCash += P.Rent
						if(usr.Village == "Amegakure")
							AmeCash += P.Rent
						if(usr.Village == "Shinkogakure")
							ShinCash += P.Rent
					else
						src<<"You couldn't pay your rent and lost your home!"
						P.Renter = null
						P.Password = "Orozisaurus"
						P.Rentable = 1
			spawn(12000)
			src.SalaryPay()


mob
	var
		Salary = 500
		Buffed = 0

mob/var/perkmaster=0
mob/var/katra=300
mob/var/maxkatra=300

mob/verb
	Admin_Help(msg as message)
		if(msg=="")
			return
		var/thetext=copytext(msg,1,350)
		if(!usr.Admin)
			usr << output("<i><font color=[usr.OOCFont]>(<font color = red><b>ADMIN HELP</b><font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>(<font color = white>[displaykey]<font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>(<font color = white>[usr.name]<font color=[usr.OOCFont]>)<font color=white>: [html_encode(thetext)]</i>","World.OOC")
		for(var/mob/M in world)
			if(M.Admin)
				if(M.OOCAH)
					M << output("<i><font color=[usr.OOCFont]>(<font color = red><b>ADMIN HELP</b><font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>(<font color = white>[displaykey]<font color=[usr.OOCFont]>)<font color=[usr.OOCFont]>(<font color = white>[usr.name]<font color=[usr.OOCFont]>)<font color=white>: [html_encode(thetext)]</i>","World.OOC")
					M << output("<font color=[usr.OOCFont]>><a href=?src=\ref[src];action=respond>Respond</a><")



mob/var/senserange = 0



mob/perkmaster/verb
	Set_Boosts()
		set category="Perk Master"
		for(var/obj/Custom/Blank_Buff/A in world)
			A.BOOST = 20
		world<<"[usr] has set all Buff Boosts."

	Give_Perk(mob/M in world)
		set category="Perk Master"
		var/choice = input("What perk would you like to give?")in typesof(/obj/Perk/) + "Cancel"
		M.contents += new choice
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the perk [choice]."
		SaveLogs()

	Give_Custom_Perk(mob/M in world)
		set category="Perk Master"
		var/C=input("Please Name The Perk You Would Like To Give To [usr]")as text
		var/B=input("Please Give A Description To The Perk You Would Like To Give To [usr]")as text
		var/D=input("Please State The Tier Of The Perk You Would Like To Give To [usr]")as num
		var/obj/Perk/Blank_Perk/E=new(M)
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the perk [C]."
		SaveLogs()
		E.name=C
		E.description=B
		E.tier=D
		var/F=input("Can this perk go beyond its current tier?") in list("Yes","No")
		if(F=="Yes")
			return
		if(E=="No")
			if(E.tier==1)
				E.canttier2=0
			if(E.tier==2)
				E.canttier3=0
			if(E.tier==3)
				E.canttier4=0
			if(E.tier==4)
				E.canttier5=0

	Give_Custom_Weapon(mob/M in world)
		set category="Perk Master"
		var/C=input("Please Name The Weapon You Would Like To Give To [usr]")as text
		var/B=input("Please Give A Description To The Weapon You Would Like To Give To [usr]")as text
		var/D=input("Please State The Tier Of The Weapon You Would Like To Give To [usr]")as num
		var/obj/Perk/Blank_Perk/E=new(M)
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the weapon [C]."
		SaveLogs()
		E.name=C
		E.description=B
		E.tier=D
		var/F=input("Can this weapon go beyond its current tier?") in list("Yes","No")
		if(F=="Yes")
			return
		if(E=="No")
			if(E.tier==1)
				E.canttier2=0
			if(E.tier==2)
				E.canttier3=0
			if(E.tier==3)
				E.canttier4=0
			if(E.tier==4)
				E.canttier5=0







	Give_Custom_Jutsu(mob/M in world)
		set category="Perk Master"
		var/C=input("Please Name The Jutsu You Would Like To Give To [usr]")as text
		var/B=input("Please Give A Description To The Jutsu You Would Like To Give To [usr]")as text
		var/D=input("How much does this jutsu drain?")as num
		var/F=input("How skilled is [usr] with this jutsu?","New, Novice, Expert, Veteran, Mastered")as text
		var/H=input("What type of jutsu is this?","Genjutsu,Taijutsu,Ninjutsu")as text
		var/G=input("What Rank Is This Jutsu?","E,D,C,B,A,S")as text
		var/I=input("What is the Element of this Jutsu?","Put Elementless if it has none.") as text
		var/J=input("Does this drain Chakra or Stamina?","Pick one.")in list("Chakra","Stamina")
		var/K=input("Is this a Kekkei Genkai Based Jutsu?","Pick.")in list("Yes","No")
		var/obj/Custom/Blank_Jutsu/E=new(M)
		E.name=C
		E.description=B
		E.dran=D
		E.skil=F
		E.jut=H
		E.ran=G
		E.ele=I
		E.idran=J
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the Custom Jutsu [C]."
		SaveLogs()
		if(K=="Yes")
			E.Kekkei = 1

	Give_Custom_Equipment(mob/M in world)
		set category = "Perk Master"
		var/A=input("Please Name the Custom Equipment that you are giving [usr]")as text
		var/B=input("Please Describe the Custom Equipment.")as text
		var/D=input("How much ninjutsu will this Equipment give?")as num
		var/E=input("How much genjutsu will this Equipment give?")as num
		var/F=input("How much taijutsu will this Equipment give?")as num
		var/G=input("How much control will this Equipment give?")as num
		var/H=input("How much intelligence will this Equipment give?")as num
		var/I=input("How much reflex will this Equipment give?")as num
		var/J=input("How much speed will this Equipment give?")as num
		var/K=input("How much strength will this Equipment give?")as num
		var/L=input("How much Defense will this Equipment give?")as num
		var/T=input("How much durability will this Equipment give?")as num
		var/U=input("How much attack speed with this Equipment give?")as num
		var/obj/Custom_Equipment/N=new(M)
		N.name = A
		N.ziNin = D
		N.ziGen = E
		N.ziTai = F
		N.ziCon = G
		N.ziInt = H
		N.ziRef = I
		N.ziSpd = J
		N.ziStr = K
		N.ziDef = L
		N.ziDur = T
		N.ziAtkspd = U
		N.description = B
	Give_Custom_Buff(mob/M in world)
		set category = "Perk Master"
		var/A=input("Please Name the Custom Buff that you are giving [usr]")as text
		var/B=input("How much chakra will this buff give?")as num
		var/C=input("How much stamina will this buff give?")as num
		var/D=input("How much ninjutsu will this buff give?")as num
		var/E=input("How much genjutsu will this buff give?")as num
		var/F=input("How much taijutsu will this buff give?")as num
		var/G=input("How much control will this buff give?")as num
		var/H=input("How much intelligence will this buff give?")as num
		var/I=input("How much reflex will this buff give?")as num
		var/J=input("How much speed will this buff give?")as num
		var/K=input("How much strength will this buff give?")as num
		var/L=input("How much Defense will this buff give?")as num
		var/GR=input("How much genresistence will this buff give?")as num
		var/T=input("How much durability will this buff give?")as num
		var/U=input("How much attack speed with this buff give?")as num
		var/O=input("Is this Buff a sensory Buff?")in list("Yes","No")
		var/P=input("Is this Buff Sharingan?")in list("Yes","No")
		var/Q=input("Is this Buff Byakugan?")in list("Yes","No")
		var/S=input("And Finally, Give it a description.")as text
		var/obj/Custom/Blank_Buff/N=new(M)
		N.name = A
		if(O=="Yes")
			var/R=input("How far of a sensing range in blocks does this buff give?")as num
			N.Gsense = R
			N.jut = "Ninjutsu"
			N.Sensory = 1
		if(P=="Yes")
			N.Sharingan = 1
			N.icon = 'SkillCard.dmi'
			N.jut = "Doujutsu"
			var/Z = input("What tier of Sharingan?") in list("One","Two","Three","Mangekyou")
			if(Z=="One")
				N.icon_state = "Sharingan1"
				N.GChak = -150
				N.GStam = 0
				N.Gnin = 0.23
				N.Ggen = 1.01
				N.Gtai = 1.12
				N.Gcon = 0.45
				N.Gint = 0.32
				N.Gref = 1.14
				N.Gspd = 0.12
				N.Gstr = 0.09
				N.Gdef = 0.67
				N.Gdur = 0.02
				N.Gatkspd = 0.42
				N.description = S
				N.jut = "Doujutsu"
				return
			if(Z=="Two")
				N.icon_state = "Sharingan2"
				N.GChak = -215
				N.GStam = -150
				N.Gnin = 0.46
				N.Ggen = 2.02
				N.Gtai = 2.24
				N.Gcon = 0.90
				N.Gint = 0.64
				N.Gref = 2.28
				N.Gspd = 0.24
				N.Gstr = 0.18
				N.Gdef = 1.24
				N.Gdur = 0.04
				N.Gatkspd = 0.82
				N.description = S
				N.jut = "Doujutsu"
				N.SharinganCopyy = 1
				return
			if(Z=="Three")
				N.icon_state = "Sharingan3"
				N.GChak = -320
				N.GStam = -200
				N.Gnin = 0.92
				N.Ggen = 4.04
				N.Gtai = 4.48
				N.Gcon = 1.80
				N.Gint = 1.28
				N.Gref = 4.56
				N.Gspd = 0.48
				N.Gstr = 0.36
				N.Gdef = 2.48
				N.Gdur = 0.08
				N.Gatkspd = 1.64
				N.description = S
				N.jut = "Doujutsu"
				N.SharinganCopyy = 1
				return
			if(Z=="Mangekyou")
				var/rando = rand(1,4)
				if(rando==1)
					N.icon_state = "Itachi"
					N.GChak = -455
					N.GStam = -200
					N.Gnin = 0.92
					N.Ggen = 8.08
					N.Gtai = 4.48
					N.Gcon = 1.80
					N.Gint = 1.28
					N.Gref = 4.56
					N.Gspd = 0.48
					N.Gstr = 0.36
					N.Gdef = 2.48
					N.Gdur = 0.08
					N.Gatkspd = 1.64
					N.description = S
					N.jut = "Doujutsu"
					N.SharinganCopyy = 1
					return
				if(rando==2)
					N.icon_state = "Izuna"
					N.GChak = -555
					N.GStam = -200
					N.Gnin = 4.85
					N.Ggen = 4.04
					N.Gtai = 4.48
					N.Gcon = 1.80
					N.Gint = 1.28
					N.Gref = 4.56
					N.Gspd = 0.48
					N.Gstr = 0.36
					N.Gdef = 2.48
					N.Gdur = 0.08
					N.Gatkspd = 1.64
					N.description = S
					N.jut = "Doujutsu"
					N.SharinganCopyy = 1
					return
				if(rando==3)
					N.icon_state = "Madara"
					N.GChak = -666
					N.GStam = -200
					N.Gnin = 3.25
					N.Ggen = 5.04
					N.Gtai = 4.48
					N.Gcon = 1.80
					N.Gint = 1.28
					N.Gref = 8.56
					N.Gspd = 0.48
					N.Gstr = 0.36
					N.Gdef = 2.48
					N.Gdur = 0.08
					N.Gatkspd = 1.64
					N.description = S
					N.jut = "Doujutsu"
					N.SharinganCopyy = 1
					return
				if(rando==4)
					N.icon_state = "Kakashi"
					N.GChak = -555
					N.GStam = -200
					N.Gnin = 8.54
					N.Ggen = 4.04
					N.Gtai = 4.48
					N.Gcon = 3.45
					N.Gint = 1.28
					N.Gref = 4.56
					N.Gspd = 0.48
					N.Gstr = 0.36
					N.Gdef = 2.48
					N.Gdur = 0.08
					N.Gatkspd = 1.64
					N.description = S
					N.jut = "Doujutsu"
					N.SharinganCopyy = 1
					return
		if(Q=="Yes")
			N.Byakugan = 1
			N.icon = 'SkillCard.dmi'
			N.icon_state = "Byakugan"
			N.GChak = -50
			N.GStam = 0
			N.Gnin = 0.54
			N.Gsense = 50
			N.Ggen = 2.75
			N.Gtai = 3.05
			N.Gcon = 1.00
			N.Gint = 1.00
			N.Gref = 1.55
			N.Gspd = 0.54
			N.Gstr = 0.54
			N.Gdef = 1.55
			N.Gdur = 0.54
			N.Gatkspd = 0.55
			N.description = S
			N.jut = "Doujutsu"
			return
		N.GChak = B
		N.GStam = C
		N.Gnin = D
		N.Ggen = E
		N.Gtai = F
		N.Gcon = G
		N.Gint = H
		N.Gref = I
		N.Gspd = J
		N.Gstr = K
		N.Gdef = L
		N.Gdur = T
		N.Ggenres = GR
		N.Gatkspd = U
		N.description = S
		N.jut = "Ninjutsu"
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the Custom Buff [N.name]."
		SaveLogs()



/*
	Show_Admin_Help()
		set category = "Admin"
		if(AHon)
			winshow(src,"AH",0)
			AHon=0
		else
			winshow(src,"AH",1)
			AHon=1
*/

	Give_RPP(mob/M in world)
		set category="Perk Master"
		var/amount = input("How many RPP would you like to give [M]?") as num
		M.RPP += amount



mob/Admin3/verb
	Give_Gene_Or_Illness(mob/M in world)
		set category="Perk Master"
		var/choice = input("What Gene or Illness would you like to give?")in typesof(/obj/Gene/) + typesof(/obj/Illness) + "Cancel"
		M.contents += new choice
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the Gene or Illness [choice]."
		SaveLogs()

	Give_Injury(mob/M in world)
		set category="Perk Master"
		var/A = input("What will you name the Injury?")as text
		var/B = input("What will be the details of the Injury?")as text
		var/obj/Injury/Blank_Injury/N=new(M)
		N.name = A
		N.suffix = B
		usr<<"You now need to edit the injury in the individual's inventory and set the stat deficits to match the injury's severity and drawbacks."
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the injury [N.name]."
		SaveLogs()

	Give_Custom_Blank_Gene(mob/M in world)
		set category="Perk Master"
		var/A = input("What will you name the Custom Gene?")as text
		var/B = input("What will be the details of the Custom Gene?")as text
		var/obj/Gene/N=new(M)
		N.name = A
		N.suffix = B
		Admin_Logs+="<br>[usr]([usr.key]) has given [M] the custom Gene [N.name]."
		SaveLogs()


	Edit_Skill_Rank(mob/M in world)
		set category="Perk Master"
		var/R=input("Please Enter The Rank Letter Followed by Plus(+) or Minus(-)")as text
		M.srank=R
		Admin_Logs+="<br>[usr]([usr.key]) has editted [M]'s Skill Rank to [R]."
		SaveLogs()

//By using wind-based chakra, the user can infuse their bladed weapons with it from a distance and manipulate them.


mob/verb
	Spend_RPP()
		var/Q = input("How would you like to spend your RPP?") in list("Perk Advancement","Jutsu Advancement","Salary Increase","New Perk","New Jutsu")
		if(Q=="Perk Advancement")
			var/list/O = new/list
			for(var/obj/Perk/P in usr.contents)
				O.Add(P)
			var/obj/Perk/Z = input("Which perk would you like to spend RPP on?") in O
			var/amount = input("How much RPP?") as num
			if(abs(amount) > usr.RPP)
				usr<<"You don't have enough RPP..."
				return
			if(abs(amount) == 0)
				usr<<"Stop your shit..."
				Admin_Logs+="<br>[usr] tried to bug abuse! Abuse!</font></big>"
				return
			else
				usr.RPP -= abs(amount)
				Z.RPPSpent += abs(amount)
				Z.RPPCheck()
				usr<<"You have [usr.RPP] Roleplay points left."

		if(Q=="Jutsu Advancement")
			var/Advancing = 1
			var/list/O = new/list
			for(var/obj/Custom/C in usr.contents)
				O.Add(C)
			var/obj/Custom/Z = input("Which Jutsu would you like to spend RPP on?") in O
			var/amount = input("How much RPP?") as num
			if(abs(amount) > usr.RPP)
				usr<<"You dont have that much RPP..."
				return
			else
				if(Advancing == 1)
					var/StudyTime = locate(/obj/Perk/Studious_1/) in usr.contents
					if(StudyTime)
						for(var/obj/Perk/Studious_1/B in usr.contents)
							if(B.tier == 1)
								usr.RPP += abs(amount)/8
								usr<<"You have been refunded [abs(amount)/8] Roleplay Points."
							if(B.tier == 2 )
								usr.RPP += abs(amount)/4
								usr<<"You have been refunded [abs(amount)/4] Roleplay Points."
							if(B.tier == 3 )
								usr.RPP += abs(amount)/2
								usr<<"You have been refunded [abs(amount)/2] Roleplay Points."
							if(B.tier == 4 )
								usr.RPP += abs(amount)/1.5
								usr<<"You have been refunded [abs(amount)/1.5] Roleplay Points."


					var/Perked = locate(/obj/Perk/)in usr.contents
					if(Perked)
						for(var/obj/Perk/A in usr.contents)
							if(findtext(A.name,"Elemental Training [Z.ele]"))
								Z.RPPSpent += abs(amount*1.5)
								Z.RPPSpend()
								usr.RPP -= abs(amount)
								usr<<"You have [usr.RPP] Roleplay Points left."
								Advancing = 0



							if(findtext(A.name,"Elemental Mastery [Z.ele]"))
								Z.RPPSpent += abs(amount*2)
								Z.RPPSpend()
								usr.RPP -= abs(amount)
								usr<<"You have [usr.RPP] Roleplay Points Left."
								Advancing = 0

							else
								Z.RPPSpent += abs(amount)
								Z.RPPSpend()
								usr.RPP -= abs(amount)
								usr<<"You have [usr.RPP] Roleplay Points left."
								Advancing = 0
								return

					else
						Z.RPPSpent += abs(amount)
						Z.RPPSpend()
						usr.RPP -= abs(amount)
						usr<<"You have [usr.RPP] Roleplay Points left."
						Advancing = 0





				Advancing = 0










		if(Q=="Salary Increase")
			var/P = input("Spend 50 RPP to increase your salary by a random amount between 100 and 400?") in list ("Yes","No")
			if(P=="Yes")
				if(usr.ckey == ""&&usr.RPP>=25)
					usr.RPP -= 25
					var/rando=rand(200,500)
					usr.Salary += rando
					usr<<"Your salary has increased by [rando]."
					return
				if(usr.RPP>=50)
					usr.RPP -= 50
					var/rando=rand(50,100)
					usr.Salary += rando
					usr<<"Your salary has increased by [rando]."
					return
			if(P=="No")
				return

		if(Q=="New Perk")
			var/Perk = input("Which perk would you like to purchase?","Buy a Perk!")in list("Strength","Hand Seal Speed","Reflex","Speed","Body","Stamina","Adrenaline Focus","Innate Sensing","Mind","Sight","Studious","Chakra","Hearing","Attack Speed","Chakra Control","Smell","Cancel")
			if(usr.RPP >= 1000)
				var/list/O = new/list
				for(var/obj/Perk/P in usr.contents)
					O.Add(P)
				if(findtext("[usr.srank]","D"))
					if(O.len>=10)
						return
				if(findtext("[usr.srank]","C"))
					if(O.len>=20)
						return
				if(findtext("[usr.srank]","B"))
					if(O.len>=30)
						return
				if(findtext("[usr.srank]","A"))
					if(O.len>=40)
						return
				if(findtext("[usr.srank]","S"))
					if(O.len>=50)
						return

				if(Perk=="Chakra Control")
					var/obj/chakracon = locate(/obj/Perk/Chakra_Control) in usr.contents
					if(chakracon)
						usr<<"You already have a chakra control perk."
						return
					else
						usr.contents += new/obj/Perk/Chakra_Control
						usr<<"You have obtained the chakra control perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Strength")
					var/obj/strength = locate(/obj/Perk/Strength) in usr.contents
					if(strength)
						usr<<"You already have a strength perk."
						return
					else
						usr.contents += new/obj/Perk/Strength
						usr<<"You have obtained the strength perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Hand Seal Speed")
					var/obj/hsp = locate(/obj/Perk/Hand_Seal_Speed) in usr.contents
					if(hsp)
						usr<<"You already have a hand seal speed perk."
						return
					else
						usr.contents += new/obj/Perk/Hand_Seal_Speed
						usr<<"You have obtained the hand seals speed perk!"
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Reflex")
					var/obj/reflex = locate(/obj/Perk/Reflex) in usr.contents
					if(reflex)
						usr<<"You already have a reflex perk."
						return
					else
						usr.contents += new/obj/Perk/Reflex
						usr<<"You have obtained the reflex perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Speed")
					var/obj/speed = locate(/obj/Perk/Speed) in usr.contents
					if(speed)
						usr<<"You already have a speed perk."
						return
					else
						usr.contents += new/obj/Perk/Speed
						usr<<"You have obtained the Speed perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Body")
					var/obj/Body = locate(/obj/Perk/Body) in usr.contents
					if(Body)
						usr<<"You already have a Body perk."
						return
					else
						usr.contents += new/obj/Perk/Body
						usr<<"You have obtained the body perk. You can feel your body reacting already."
						viewers() << output("<font color=[usr.SayFont]>[usr]([usr.rank2] [usr.srank]) says<font color = white>: My body is ready...","World.IC")
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Stamina")
					var/obj/Stamina = locate(/obj/Perk/Stamina) in usr.contents
					if(Stamina)
						usr<<"You already have a Stamina perk."
						return
					else
						usr.contents += new/obj/Perk/Stamina
						usr<<"You have obtained the Stamina perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Adrenaline Focus")
					var/obj/AD = locate(/obj/Perk/Adrenaline_Focus) in usr.contents
					if(AD)
						usr<<"You already have a Adrenaline Focus perk."
						return
					else
						usr.contents += new/obj/Perk/Adrenaline_Focus
						usr<<"You have obtained the Adrenaline Focus perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Innate Sensing")
					var/obj/Sense = locate(/obj/Perk/Innate_Sensing) in usr.contents
					if(Sense)
						usr<<"You already have a Sensing perk."
						return
					else
						usr.contents += new/obj/Perk/Innate_Sensing
						usr<<"You have obtained the Innate Sensing perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Mind")
					var/obj/Mind = locate(/obj/Perk/Mind) in usr.contents
					if(Mind)
						usr<<"You already have a Mind perk."
						return
					else
						usr.contents += new/obj/Perk/Mind
						usr<<"You have obtained the Mind perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Sight")
					var/obj/Sight = locate(/obj/Perk/Sight) in usr.contents
					if(Sight)
						usr<<"You already have a Sight perk."
						return
					else
						usr.contents += new/obj/Perk/Sight
						usr<<"You have obtained the Sight perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Studious")
					var/obj/Study = locate(/obj/Perk/Studious_1) in usr.contents
					if(Study)
						usr<<"You already have a Studious perk."
						return
					else
						usr.contents += new/obj/Perk/Studious_1
						usr<<"You have obtained the Studious perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Chakra")
					var/obj/Chakra = locate(/obj/Perk/Chakra) in usr.contents
					if(Chakra)
						usr<<"You already have a Chakra perk."
						return
					else
						usr.contents += new/obj/Perk/Chakra
						usr<<"You have obtained the Chakra perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Hearing")
					var/obj/Hear = locate(/obj/Perk/Hearing) in usr.contents
					if(Hear)
						usr<<"You already have a Hearing perk."
						return
					else
						usr.contents += new/obj/Perk/Hearing
						usr<<"You have obtained the Hearing perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()

				if(Perk=="Smell")
					var/obj/Smell = locate(/obj/Perk/Smell) in usr.contents
					if(Smell)
						usr<<"You already have a Smell perk."
						return
					else
						usr.contents += new/obj/Perk/Smell
						usr<<"You have obtained the Smell perk. You can feel your body reacting already."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Attack Speed")
					var/obj/Aspd = locate(/obj/Perk/Attack_Speed) in usr.contents
					if(Aspd)
						usr<<"You already have the attack speed perk."
						return
					else
						usr.contents += new/obj/Perk/Attack_Speed
						usr<<"You have obtained the Attack Speed perk."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
				if(Perk=="Ninjutsu Defense")
					var/obj/nindef = locate(/obj/Perk/Attack_Speed) in usr.contents
					if(nindef)
						usr<<"You already have the ninjutsu defense perk."
						return
					else
						usr.contents += new/obj/Perk/Attack_Speed
						usr<<"You have obtained the Ninjutsu Defense perk."
						usr.RPP -= 1000
						usr.exptunarank += 1
						usr.Skill_Rank_Check()



		if(Q=="New Jutsu")
			var/varJutsu
			var/A=input("What Type of Jutsu?","Learn Jutsu") in list("Ninjutsu","Taijutsu","Genjutsu","Fuuinjutsu","Cancel")
			if(A=="Fuuinjutsu")
				usr<<"S Rank Jutsu Cost 2000 | A Rank Jutsu Cost 1200 | B Rank Jutsu Cost 950 | C Rank Jutsu Cost 650 | D Rank Jutsu Cost 500"
				var/Rank = input("What rank of Fuuinjutsu?","Pick Rank") in list("D","C","B","A","S")
				if(Rank=="D")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Fuuinjutsu/Drank) + list("Cancel")
						if(usr.RPP>= 500 && !locate(/obj/Perk/Mastery)in usr.contents )
							usr.contents += new varJutsu
							usr.RPP -=500
							if(locate(/obj/Perk/Mastery)in usr.contents && usr.RPP >= 250)
								usr.RPP -= 250
								usr.contents += new varJutsu
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="C")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Fuuinjutsu/Crank) + list("Cancel")
						if(usr.RPP>= 650)
							usr.contents += new varJutsu
							usr.RPP -= 650
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 325
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="B")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Fuuinjutsu/Brank) + list("Cancel")
						if(usr.RPP>= 950)
							usr.contents += new varJutsu
							usr.RPP -= 950
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 475
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="A")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Fuuinjutsu/Arank) + list("Cancel")
						if(usr.RPP>= 1200)
							usr.contents += new varJutsu
							usr.RPP -= 1200
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 600
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="S")
					if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Fuuinjutsu/Arank) + list("Cancel")
						if(usr.RPP>= 2000)
							usr.contents += new varJutsu
							usr.RPP -= 2000
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 1000
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."


			if(A=="Genjutsu")
				usr<<"S Rank Jutsu Cost 1200 | A Rank Jutsu Cost 800 | B Rank Jutsu Cost 650 | C Rank Jutsu Cost 450 | D Rank Jutsu Cost 250"
				var/Rank = input("What rank of Genjutsu","Pick Rank") in list("D","C","B","A","S")
				if(Rank=="D")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Genjutsu/Drank) + list("Cancel")
						if(usr.RPP>= 250)
							usr.contents += new varJutsu
							usr.RPP -= 250
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 125
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="C")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Genjutsu/Crank) + list("Cancel")
						if(usr.RPP>= 450)
							usr.contents += new varJutsu
							usr.RPP -= 450
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 225
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="B")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Genjutsu/Brank) + list("Cancel")
						if(usr.RPP>= 650)
							usr.contents += new varJutsu
							usr.RPP -= 650
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 325
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="A")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Genjutsu/Arank) + list("Cancel")
						if(usr.RPP>= 800)
							usr.contents += new varJutsu
							usr.RPP -= 800
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 400
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="S")
					if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Jooootsooo") in typesof(/obj/Custom/Genjutsu/Srank) + list("Cancel")
						if(usr.RPP>= 1200)
							usr.contents += new varJutsu
							usr.RPP -= 1200
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 600
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."

			if(A=="Taijutsu")
				usr<<"S Rank Jutsu Cost 2000 | A Rank Jutsu Cost 1000 | B Rank Jutsu Cost 800 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 300"
				var/Rank = input("What rank of Taijutsu?","Pick Rank") in list("D","C","B","A","S")
				if(Rank=="D")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Joooootsooo") in typesof(/obj/Custom/Taijutsu/Drank) + list("Cancel")
						if(usr.RPP >= 300)
							usr.contents += new varJutsu
							usr.RPP -= 300
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 150
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="C")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Joooootsooo") in typesof(/obj/Custom/Taijutsu/Crank) + list("Cancel")
						if(usr.RPP >= 500)
							usr.contents += new varJutsu
							usr.RPP -= 500
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 250
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="B")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Joooootsooo") in typesof(/obj/Custom/Taijutsu/Brank) + list("Cancel")
						if(usr.RPP >= 800)
							usr.contents += new varJutsu
							usr.RPP -= 800
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 400
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="A")
					if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
						varJutsu=input("Pick a Jutsu!","Joooootsooo") in typesof(/obj/Custom/Taijutsu/Arank) + list("Cancel")
						if(usr.RPP >= 1000)
							usr.contents += new varJutsu
							usr.RPP -= 1000
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 500
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."
				if(Rank=="S")
					if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
						varJutsu=input("Pick a Jutsu!","Joooootsooo") in typesof(/obj/Custom/Taijutsu/Srank) + list("Cancel")
						if(usr.RPP >= 2000)
							usr.contents += new varJutsu
							usr.RPP -= 2000
							if(locate(/obj/Perk/Mastery)in usr.contents)
								usr.RPP += 1000
							usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
					else
						usr<<"Your rank is too low."



			if(A=="Ninjutsu")
				var/Element=input("What Element of Ninjutsu?","Pick Element") in list("Fire","Earth","Water","Wind","Lightning","Cancel")
				if(Element=="Fire")
					if(usr.PrimaryElement=="Fire"||usr.SecondaryElement=="Fire"||usr.TertiaryElement=="Fire"||usr.QuadranaryElement=="Fire"||usr.QuinaryElement=="Fire")
						usr<<"S Rank Jutsu Cost 2000 | A Rank Jutsu Cost 1500 | B Rank Jutsu Cost 1000 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 250"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Katon/Srank) + list("Cancel")
								if(usr.RPP >= 2000)
									usr.contents += new varJutsu
									usr.RPP -= 2000
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
							else
								usr<<"Your rank is too low."
						if(Rank=="A")
							if(findtext("[usr.srank]","A") || findtext("[usr.srank]","B") || findtext("[usr.srank]","S"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Katon/Arank) + list("Cancel")
								if(usr.RPP >= 1500)
									usr.contents += new varJutsu
									usr.RPP -= 1500
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 750
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Katon/Brank) + list("Cancel")
								if(usr.RPP >= 1000)
									usr.contents += new varJutsu
									usr.RPP -= 1000
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 500
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Katon/Crank) + list("Cancel")
								if(usr.RPP >= 500)
									usr.contents += new varJutsu
									usr.RPP -= 500
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 250
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Katon/Drank) + list("Cancel")
								if(usr.RPP >= 250)
									usr.contents += new varJutsu
									usr.RPP -= 250
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 125
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"Your rank is too low."
					else
						usr<<"You do not have the fire element so you cannot learn a fire jutsu currently."
				if(Element=="Water")
					if(usr.PrimaryElement=="Water"||usr.SecondaryElement=="Water"||usr.TertiaryElement=="Water"||usr.QuadranaryElement=="Water"||usr.QuinaryElement=="Water")
						usr<<"S Rank Jutsu Cost 1500 | A Rank Jutsu Cost 1000 | B Rank Jutsu Cost 750 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 300"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Suiton/Srank) + list("Cancel")
								if(usr.RPP >= 1500)
									usr.contents += new varJutsu
									usr.RPP -= 1500
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 750
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B")|| findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Suiton/Arank) + list("Cancel")
								if(usr.RPP >= 1000)
									usr.contents += new varJutsu
									usr.RPP -= 1000
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 500
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Suiton/Brank) + list("Cancel")
								if(usr.RPP >= 750)
									usr.contents += new varJutsu
									usr.RPP -= 750
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 375
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Suiton/Crank) + list("Cancel")
								if(usr.RPP >= 500)
									usr.contents += new varJutsu
									usr.RPP -= 500
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 250
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."

						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Suiton/Drank) + list("Cancel")
								if(usr.RPP >= 300)
									usr.contents += new varJutsu
									usr.RPP -= 300
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 150
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
							else
								usr<<"No..."
					else
						usr<<"You do not have the water element so you cannot learn a water jutsu currently."

				if(Element=="Earth")
					if(usr.PrimaryElement=="Earth"||usr.SecondaryElement=="Earth"||usr.TertiaryElement=="Earth"||usr.QuadranaryElement=="Earth"||usr.QuinaryElement=="Earth")
						usr<<"S Rank Jutsu Cost 1250 | A Rank Jutsu Cost 975 | B Rank Jutsu Cost 800 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 350"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Doton/Srank) + list("Cancel")
								if(usr.RPP >= 1250)
									usr.contents += new varJutsu
									usr.RPP -= 1250
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 625
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Doton/Arank) + list("Cancel")
								if(usr.RPP >= 975)
									usr.contents += new varJutsu
									usr.RPP -= 975
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 488
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Doton/Brank) + list("Cancel")
								if(usr.RPP >= 800)
									usr.contents += new varJutsu
									usr.RPP -= 800
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 400
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Doton/Crank) + list("Cancel")
								if(usr.RPP >= 500)
									usr.contents += new varJutsu
									usr.RPP -= 500
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 250
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Doton/Drank) + list("Cancel")
								if(usr.RPP >= 350)
									usr.contents += new varJutsu
									usr.RPP -= 350
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 175
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
					else
						usr<<"You do not have the earth element so you cannot learn a earth jutsu currently."
				if(Element=="Lightning")
					if(usr.PrimaryElement=="Lightning"||usr.SecondaryElement=="Lightning"||usr.TertiaryElement=="Lightning"||usr.QuadranaryElement=="Lightning"||usr.QuinaryElement=="Lightning")
						usr<<"S Rank Jutsu Cost 2000 | A Rank Jutsu Cost 1750 | B Rank Jutsu Cost 1200 | C Rank Jutsu Cost 900 | D Rank Jutsu Cost 400"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Raiton/Srank) + list("Cancel")
								if(usr.RPP >= 2000)
									usr.contents += new varJutsu
									usr.RPP -= 2000
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Raiton/Arank) + list("Cancel")
								if(usr.RPP >= 1750)
									usr.contents += new varJutsu
									usr.RPP -= 1750
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 875
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Raiton/Brank) + list("Cancel")
								if(usr.RPP >= 1200)
									usr.contents += new varJutsu
									usr.RPP -= 1200
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 600
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Raiton/Crank) + list("Cancel")
								if(usr.RPP >= 900)
									usr.contents += new varJutsu
									usr.RPP -= 900
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 450
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Raiton/Drank) + list("Cancel")
								if(usr.RPP >= 400)
									usr.contents += new varJutsu
									usr.RPP -= 400
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 200
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
					else
						usr<<"You do not have the lightning element so you cannot learn a lightning jutsu currently."
				if(Element=="Wind")
					if(usr.PrimaryElement=="Wind"||usr.SecondaryElement=="Wind"||usr.TertiaryElement=="Wind"||usr.QuadranaryElement=="Wind"||usr.QuinaryElement=="Wind")
						usr<<"S Rank Jutsu Cost 1250 | A Rank Jutsu Cost 975 | B Rank Jutsu Cost 800 | C Rank Jutsu Cost 500 | D Rank Jutsu Cost 350"
						var/Rank=input("What rank of Jutsu?") in list("S","A","B","C","D","Cancel")
						if(Rank=="S")
							if(findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Fuuton/Srank) + list("Cancel")
								if(usr.RPP >= 1250)
									usr.contents += new varJutsu
									usr.RPP -= 1250
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 625
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
						if(Rank=="A")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Fuuton/Arank) + list("Cancel")
								if(usr.RPP >= 975)
									usr.contents += new varJutsu
									usr.RPP -= 975
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 988
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 1000
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="B")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Fuuton/Brank) + list("Cancel")
								if(usr.RPP >= 800)
									usr.contents += new varJutsu
									usr.RPP -= 800
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 400
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="C")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Fuuton/Crank) + list("Cancel")
								if(usr.RPP >= 500)
									usr.contents += new varJutsu
									usr.RPP -= 500
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 250
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
						if(Rank=="D")
							if(findtext("[usr.srank]","B") || findtext("[usr.srank]","C") || findtext("[usr.srank]","S") || findtext("[usr.srank]","A") || findtext("[usr.srank]","D"))
								varJutsu=input("Pick a Jutsu!","Joootsooo") in typesof(/obj/Custom/Fuuton/Drank) + list("Cancel")
								if(usr.RPP >= 350)
									usr.contents += new varJutsu
									usr.RPP -= 350
									if(locate(/obj/Perk/Mastery)in usr.contents)
										usr.RPP += 175
									usr<<"You recieve a new jutsu! You have [usr.RPP] RPP left! Keep Roleplaying for more RPP!"
									usr.exptunarank += 1
									usr.Skill_Rank_Check()
								else
									usr<<"You don't have enough RPP. Check the chat window for the prices."
					else
						usr<<"You do not have the wind element so you cannot learn a wind jutsu currently."

/*
Skill Ranks = New, Novice, Expert, Veteran, Master

Jutsu Rank = A, B, C, D, E, S
*/
obj/Custom
	proc
		RPPSpend()
			if(src.skil=="New")
				if(src.ran=="E")
					if(src.RPPSpent >= 200)
						src.skil = "Novice"
						src.dran -= src.dran*(0.35)
						usr.exptunarank += 0.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="D")
					if(src.RPPSpent >= 400)
						src.skil = "Novice"
						src.dran -= src.dran*(0.30)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="C")
					if(src.RPPSpent >= 800)
						src.skil = "Novice"
						src.dran -= src.dran*(0.25)
						usr.exptunarank += 1.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="B")
					if(src.RPPSpent >= 1600)
						src.skil = "Novice"
						src.dran -= src.dran*(0.20)
						usr.exptunarank += 2
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="A")
					if(src.RPPSpent >= 3200)
						src.skil = "Novice"
						src.dran = src.dran-(src.dran*(0.15))
						usr.exptunarank += 2.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="S")
					if(src.RPPSpent >= 5000)
						src.skil = "Novice"
						src.dran -= src.dran*(0.10)
						usr.exptunarank += 3
						usr.Skill_Rank_Check()
						src.RPPSpent = 0
				return
			if(src.skil=="Novice")
				if(src.ran=="E")
					if(src.RPPSpent >= 200)
						src.skil = "Expert"
						src.dran -= src.dran*(0.35)
						usr.exptunarank += 0.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="D")
					if(src.RPPSpent >= 400)
						src.skil = "Expert"
						src.dran -= src.dran*(0.30)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="C")
					if(src.RPPSpent >= 800)
						src.skil = "Expert"
						src.dran -= src.dran*(0.25)
						usr.exptunarank += 1.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="B")
					if(src.RPPSpent >= 1600)
						src.skil = "Expert"
						src.dran -= src.dran*(0.20)
						usr.exptunarank += 2
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="A")
					if(src.RPPSpent >= 3200)
						src.skil = "Expert"
						src.dran -= src.dran*(0.15)
						usr.exptunarank += 2.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="S")
					if(src.RPPSpent >= 5000)
						src.skil = "Expert"
						src.dran -= src.dran*(0.10)
						usr.exptunarank += 3
						usr.Skill_Rank_Check()
						src.RPPSpent = 0
				return
			if(src.skil=="Expert")
				if(src.ran=="E")
					if(src.RPPSpent >= 200)
						src.skil = "Veteran"
						src.dran -= src.dran*(0.35)
						usr.exptunarank += 0.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="D")
					if(src.RPPSpent >= 400)
						src.skil = "Veteran"
						src.dran -= src.dran*(0.30)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="C")
					if(src.RPPSpent >= 800)
						src.skil = "Veteran"
						src.dran -= src.dran*(0.25)
						usr.exptunarank += 1.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="B")
					if(src.RPPSpent >= 1600)
						src.skil = "Veteran"
						src.dran -= src.dran*(0.20)
						usr.exptunarank += 2
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="A")
					if(src.RPPSpent >= 3200)
						src.skil = "Veteran"
						src.dran -= src.dran*(0.15)
						usr.exptunarank += 2.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="S")
					if(src.RPPSpent >= 5000)
						src.skil = "Veteran"
						src.dran -= src.dran*(0.10)
						usr.exptunarank += 3
						usr.Skill_Rank_Check()
						src.RPPSpent = 0
				return
			if(src.skil=="Veteran")
				if(src.ran=="E")
					if(src.RPPSpent >= 200)
						src.skil = "Mastered"
						src.dran -= src.dran*(0.35)
						usr.exptunarank += 0.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="D")
					if(src.RPPSpent >= 400)
						src.skil = "Mastered"
						src.dran -= src.dran*(0.30)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="C")
					if(src.RPPSpent >= 800)
						src.skil = "Mastered"
						src.dran -= src.dran*(0.25)
						usr.exptunarank += 1.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="B")
					if(src.RPPSpent >= 1600)
						src.skil = "Mastered"
						src.dran -= src.dran*(0.20)
						usr.exptunarank += 2
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="A")
					if(src.RPPSpent >= 3200)
						src.skil = "Mastered"
						src.dran -= src.dran*(0.15)
						usr.exptunarank += 2.5
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="S")
					if(src.RPPSpent >= 5000)
						src.skil = "Mastered"
						src.dran -= src.dran*(0.10)
						usr.exptunarank += 3
						usr.Skill_Rank_Check()
						src.RPPSpent = 0
				return
			if(src.skil=="Mastered")
				if(src.ran=="E")
					if(src.RPPSpent >= 200)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.dran = 0

				if(src.ran=="D")
					if(src.RPPSpent >= 400)
						src.dran -= src.dran*(0.10)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="C")
					if(src.RPPSpent >= 800)
						src.dran -= src.dran*(0.10)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="B")
					if(src.RPPSpent >= 1600)
						src.dran -= src.dran*(0.10)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="A")
					if(src.RPPSpent >= 3200)
						src.dran -= src.dran*(0.10)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.RPPSpent = 0

				if(src.ran=="S")
					if(src.RPPSpent >= 5000)
						src.dran -= src.dran*(0.10)
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.RPPSpent = 0
				usr.Skill_Rank_Check()
				return







obj/Perk
	proc
		RPPCheck()
			if(src.tier == 1)
				if(!src.canttier2)
					if(src.RPPSpent>=1000)
						src.tier = 2
						src.RPPSpent = 0
						src.description = "[src.tier2descrip]"
						src.name = "[src.tier2name]"
						src.icon_state = "[src.tier2state]"
						usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has increased [src] to tier [src.tier]"
				else
					usr<<"This is fully upgraded already..."
					usr.RPP += src.RPPSpent
					usr.exptunarank += 1
					usr.Skill_Rank_Check()
					src.RPPSpent = 0
					return
			if(src.tier == 2)
				if(!src.canttier3)
					if(src.RPPSpent>=2500)
						src.tier = 3
						src.RPPSpent = 0
						src.description = "[src.tier3descrip]"
						src.name = "[src.tier3name]"
						src.icon_state = "[src.tier3state]"
						if(istype(src,/obj/Perk/Chakra))
							usr.Jchakra += 500
						if(istype(src,/obj/Perk/Stamina))
							usr.Jstam += 500
						if(istype(src,/obj/Perk/Speed))
							usr.Jspd += 1
						if(istype(src,/obj/Perk/Body))
							usr.Jdef += 1
							usr.Jdur += 1.1
						if(istype(src,/obj/Perk/Reflex))
							usr.Jref += 1
						usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has increased [src] to tier [src.tier]"
				else
					usr<<"Tbis is fully upgraded already..."
					usr.RPP += src.RPPSpent
					src.RPPSpent = 0
					return
			if(src.tier == 3)
				if(!src.canttier4)
					if(src.RPPSpent >=5000)
						src.tier = 4
						src.RPPSpent = 0
						src.description = "[src.tier4descrip]"
						src.name = "[src.tier4name]"
						src.icon_state = "[src.tier4state]"
						usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
						if(istype(src,/obj/Perk/Chakra))
							usr.Jchakra += 2000
						if(istype(src,/obj/Perk/Stamina))
							usr.Jstam += 2000
						if(istype(src,/obj/Perk/Speed))
							usr.Jspd += 1
						if(istype(src,/obj/Perk/Body))
							usr.Jdef += 1
							usr.Jdur += 1.1
						if(istype(src,/obj/Perk/Reflex))
							usr.Jref += 1
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has increased [src] to tier [src.tier]"
				else
					usr<<"This is fully upgraded already."
					usr.RPP += src.RPPSpent
					src.RPPSpent = 0
					usr.exptunarank += 1
					usr.Skill_Rank_Check()
					return
			if(src.tier == 4)
				if(src.canttier5&&!src.cantmaster)
					if(src.RPPSpent >= 50000)
						src.tier = "Master"
						src.RPPSpent = 0
						usr.exptunarank += 1
						usr.Skill_Rank_Check()
						src.description = "[src.masterdescrip]"
						src.name = "[src.mastername]"
						usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
						for(var/mob/M in world)
							if(M.key in Admin3s)
								M<<"[usr] has increased [src] to tier [src.tier]"
				else
					if(!src.canttier5)
						if(src.RPPSpent >= 10000)
							src.tier = 5
							src.RPPSpent = 0
							usr.exptunarank += 1
							usr.Skill_Rank_Check()
							src.description = "[src.tier5descrip]"
							src.name = "[src.tier5name]"
							src.icon_state = "[tier5state]"
							usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
							for(var/mob/M in world)
								if(M.key in Admin3s)
									M<<"[usr] has increased [src] to tier [src.tier]"
			if(src.tier == 5)
				if(src.cantmaster)
					usr<<"This is fully upgraded already."
					usr.RPP += src.RPPSpent
					src.RPPSpent = 0
					return
				if(src.RPPSpent >= 15000)
					src.tier = "Master"
					src.RPPSpent = 0
					usr.exptunarank += 1
					usr.Skill_Rank_Check()
					src.description = "[src.masterdescrip]"
					src.name = "[src.mastername]"
					usr<<"Your [src] Perk has increased. It may be subject to change based upon an admin's discretion."
					for(var/mob/M in world)
						if(M.key in Admin3s)
							M<<"[usr] has increased [src] to tier [src.tier]"
			if(src.tier == "Master")
				usr<<"This is fully upgraded already."
				usr.RPP += src.RPPSpent
				src.RPPSpent = 0
				return

			usr.Skill_Rank_Check()


