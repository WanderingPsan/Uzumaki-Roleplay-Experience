obj/items/Citem/tools
	Genetics_Computer
		icon = 'Computer.dmi'
		density = 1
		var/Cultivating = 0
		var/InUse = 0
		var/SplicerIn = 0
		var/SharCultivated = 0
		var/ByaCultivated = 0
		var/RinnCultivated = 0
		var/SenjCultivated = 0
		var/RinnActive = 0
		proc
			SharinganCreate()
				sleep(TwoHours)
				src.contents += new/obj/items/Citem/Eye/Sharingan
				src.SharCultivated = 1
				src.Cultivating = 0
			ByakuganCreate()
				sleep(TwoHours/2)
				src.contents += new/obj/items/Citem/Eye/Byakugan
				src.ByaCultivated = 1
				src.Cultivating = 0
			RinneganCreate()
				sleep(TwoHours*2)
				src.contents += new/obj/items/Citem/Eye/Rinnegan
				src.RinnCultivated = 1
				src.Cultivating = 0
		verb
			Turn_On()
				set src in view(2)
				if(src.InUse)
					usr<<"This computer is currently being used by someone."
					return
				else
					goto Home
				Home
				var/UU=input("What shall you do?")in list("Gene Splicer Manipulation","Dojutsu Cultivation","Turn Off")
				if(UU == "Turn Off")
					src.InUse = 0
					return
				if(UU == "Gene Splicer Manipulation")
					goto Splicerin
				if(UU == "Dojutsu Cultivation")
					if(src.Cultivating)
						usr<<"You are already cultivating a dojutsu."
						return
					if(!src.Cultivating)
						if(src.SharCultivated)
							for(var/obj/items/Citem/Eye/Sharingan/A in src.contents)
								usr.contents += A
								usr<<"You recieve the cultivated Sharingan."
						if(src.ByaCultivated)
							for(var/obj/items/Citem/Eye/Byakugan/B in src.contents)
								usr.contents += B
								usr<<"You recieve the cultivated Byakugan."
						if(src.RinnCultivated)
							for(var/obj/items/Citem/Eye/Rinnegan/C in src.contents)
								usr.contents += C
								usr<<"You recieve the cultivated Rinnegan."
						goto Cultivation


				Cultivation
				if(src.RinnActive)
					var/Cult = input("What Dojutsu would you like to cultivate.")in list("Sharingan","Byakugan","Rinnegan","Cancel")
					if(Cult == "Cancel")
						goto Home
					if(Cult == "Sharingan")
						if(locate(/obj/Gene/Sharingan) in src.contents)
							usr<<"You place your hand on a scanner which nicks you and draws a bit of blood."
							usr.JConst -= 50
							sleep(10)
							usr<<"<b>Computer Says:</b> Somatic Cells Recieved. Occular Cultivation Process begin."
							src.SharinganCreate()
							src.Cultivating = 1
							goto Home
						else
							usr<<"The computer does not have the required data to cultivate this dojutsu."
							goto Home
					if(Cult == "Byakugan")
						if(locate(/obj/Gene/Byakugan) in src.contents)
							usr<<"You place your hand on a scanner which nicks you and draws a bit of blood."
							usr.JConst -= 50
							sleep(10)
							usr<<"<b>Computer Says:</b> Somatic Cells Recieved. Occular Cultivation Process begin."
							src.ByakuganCreate()
							src.Cultivating = 1
							goto Home
						else
							usr<<"The computer does not have the required data to cultivate this dojutsu."
							goto Home
					if(Cult == "Rinnegan")
						if(locate(/obj/Gene/Rinnegan) in src.contents)
							usr<<"You place your hand on a scanner which nicks you and draws a bit of blood."
							usr.JConst -= 50
							sleep(10)
							usr<<"<b>Computer Says:</b> Somatic Cells Recieved. Occular Cultivation Process begin."
							src.RinneganCreate()
							src.Cultivating = 1
							goto Home
						else
							if(locate(/obj/Gene/Sharingan) in src.contents && locate(/obj/Gene/Wood_Release) in src.contents)
								usr<<"You place your hand on a scanner which nicks you and draws a bit of blood."
								usr.JConst -= 50
								sleep(10)
								usr<<"<b>Computer Says:</b> Somatic Cells Recieved. Occular Cultivation Process begin."
								src.RinneganCreate()
								src.Cultivating = 1
								goto Home
							else
								usr<<"The computer does not have the required data to cultivate this dojutsu."
								goto Home
				else
					var/Cult = input("What Dojutsu would you like to cultivate.")in list("Sharingan","Byakugan","Cancel")
					if(Cult == "Cancel")
						goto Home
					if(Cult == "Sharingan")
						if(locate(/obj/Gene/Sharingan) in src.contents)
							usr<<"You place your hand on a scanner which nicks you and draws a bit of blood."
							usr.JConst -= 50
							sleep(10)
							usr<<"<b>Computer Says:</b> Somatic Cells Recieved. Occular Cultivation Process begin."
							src.SharinganCreate()
							src.Cultivating = 1
							goto Home
						else
							usr<<"The computer does not have the required data to cultivate this dojutsu."
							goto Home
					if(Cult == "Byakugan")
						if(locate(/obj/Gene/Byakugan) in src.contents)
							usr<<"You place your hand on a scanner which nicks you and draws a bit of blood."
							usr.JConst -= 50
							sleep(10)
							usr<<"<b>Computer Says:</b> Somatic Cells Recieved. Occular Cultivation Process begin."
							src.ByakuganCreate()
							src.Cultivating = 1
							goto Home
						else
							usr<<"The computer does not have the required data to cultivate this dojutsu."
							goto Home

				Splicerin
				if(!src.SplicerIn)
					var/list/L = new/list
					for(var/obj/items/Citem/tools/Gene_Splicer/G in usr.contents)
						L.Add(G)
					var/obj/items/Citem/tools/Gene_Splicer/S = input("Which Gene Splicer will you insert into the machine?")in L+list("Cancel")
					if(S=="Cancel")
						src.SplicerIn = 0
						usr<<"<b>Computer says:</b> <font color=red><i>Error!</i></font>"
						goto Home
					else
						usr<<"You insert the splicer into the machine."
						src.SplicerIn = 1
						src.contents += S
						goto Manipulation



				Manipulation
				if(!src.SplicerIn)
					goto Splicerin
				else
					var/Jin = input("What will you do with this splicer?")in list("Insert Genes","Insert Illnesses","Save Genes to Buffer","Save Illnesses to Buffer","Wipe Splicer","Eject Splicer","Go Back")
					if(Jin == "Go Back")
						goto Home

					if(Jin == "Insert Genes")
						goto InsertGene

					if(Jin == "Insert Illnesses")
						goto InsertIllness

					if(Jin == "Save Genes to Buffer")
						goto GeneBuffer

					if(Jin == "Save Illnesses to Buffer")
						goto IllnessBuffer
					if(Jin == "Eject Splicer")
						goto SplicerEject
					if(Jin == "Wipe Splicer")
						goto SplicerWipe

					if(Jin == "Go Back")
						goto Home


				SplicerWipe
				var/list/IO = new/list
				var/list/PO = new/list
				for(var/obj/items/Citem/tools/Gene_Splicer/V in src.contents)
					IO.Add(V)
					for(var/obj/Illness/KK in V.contents)
						PO.Add(KK)
					for(var/obj/Gene/JK in V.contents)
						PO.Add(JK)
				var/obj/LO = input("What will you remove from the splicer?")in PO
				if(LO=="Cancel")
					usr<<"<font color=red><i>Error!"
					goto Home
				else
					var/obj/AQ = input("What will you delete?")in PO
					del AQ
					var/OOQ = input("Will you delete something else?")in list("Yes","No")
					if(OOQ=="Yes")
						goto SplicerWipe
					if(OOQ =="No")
						goto Home

				IllnessBuffer
				var/list/M = new/list
				for(var/obj/items/Citem/tools/Gene_Splicer/R in src.contents)
					for(var/obj/Illness/G in R.contents)
						M.Add(G)
				var/obj/Z = input("What Illness will you save to buffer?")in M+list("Cancel")
				if(Z=="Cancel")
					usr<<"<font color=red><i>Error!</i></font>"
					goto Home
				else
					var/obj/E = new Z.type(src)
					usr<<"You saved [E.name] to buffer."
					var/D = input("Will you save another Illness to buffer?")in list("Yes","No")
					if(D=="Yes")
						goto IllnessBuffer
					if(D=="No")
						goto Manipulation




				GeneBuffer
				var/list/Y = new/list
				for(var/obj/items/Citem/tools/Gene_Splicer/R in src.contents)
					for(var/obj/Gene/G in R.contents)
						Y.Add(G)
				var/obj/O = input("What gene will you save to buffer?")in Y+list("Cancel")
				if(O=="Cancel")
					usr<<"<font color=red><i>Error!</i></font>"
					goto Home
				else
					var/obj/E = new O.type(src)
					usr<<"You saved [E.name] to buffer."
					var/D = input("Will you save another Gene to buffer?")in list("Yes","No")
					if(D=="Yes")
						goto GeneBuffer
					if(D=="No")
						goto Manipulation





				InsertGene
				var/list/N = new/list
				for(var/obj/Gene/G in src.contents)
					N.Add(G)
				var/obj/Q = input("What gene will you copy from the buffer to the Splicer?") in N+list("Cancel")
				if(Q=="Cancel")
					usr<<"<font color=red><i>Error!</i></font>"
					goto Home
				else
					for(var/obj/items/Citem/tools/Gene_Splicer/R in src.contents)
						var/obj/OO = new Q.type(src)
						R.contents += OO
						var/A=input("Will you copy another gene from buffer?")
						if(A=="Yes")
							goto InsertGene
						else
							goto Home

				InsertIllness
				var/list/U = new/list
				for(var/obj/Illness/G in src.contents)
					U.Add(G)
				var/obj/QQ = input("What Illness will you copy from the buffer to the Splicer?") in U+list("Cancel")
				if(QQ=="Cancel")
					usr<<"<font color=red><i>Error!</i></font>"
					goto Home
				else
					for(var/obj/items/Citem/tools/Gene_Splicer/R in src.contents)
						var/obj/OOO = new QQ.type(src)
						R.contents += OOO
						var/A=input("Will you copy another Illness from buffer?")
						if(A=="Yes")
							goto InsertIllness
						else
							goto Home

				SplicerEject
				for(var/obj/items/Citem/tools/Gene_Splicer/G in src.contents)
					usr.contents += G
					usr<<"You pull the splicer from the machine."
				src.SplicerIn = 0
				goto Home





























