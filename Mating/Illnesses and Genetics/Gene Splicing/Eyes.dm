obj/items/Citem
	Eye
		verb
			Implant()
				if(!locate(/obj/Perk/Surgeon) in usr.contents)
					usr<<"You're not a surgeon. Stop that....Unless you want to try anyway..."
					var/ try_input = input("Will you give it a go?")in list("Yes","No")
					if(try_input=="Yes")
						if(locate(/obj/Perk/Mastery) in usr.contents)
							if(prob(50))
								goto Transplant
							else
								usr<<"You failed."
								del src
						else
							if(prob(10))
								goto Transplant
							else
								usr<<"You fail. Good Game. Well Played."
								del src
					if(try_input == "No")
						usr<<"Good on you mate."
						return

				Transplant
				var/list/A = new/list
				for(var/mob/B in view(2))
					A.Add(B)
				var/mob/C = input("Who would you like to implant this [src.name] into?")in A+list("Cancel")
				if(C=="Cancel")
					return
				if(findtext("[src.name]","Sharingan"))
					var/obj/Custom/Blank_Buff/Transplant_Sharingan1/D = new(C)
					view(6)<<"[usr] implants [src] into [C]'s right eye left eye socket."
					D.Activo = 1
					C.overlays += 'Sharingan2.dmi'
					C.TShar1 = 1
					var/obj/items/Citem/Sharingan_Eye_Wrap/F = new(C)
					F.name = "Eye Wrap"
				if(findtext("[src.name]","Byakugan"))
					var/obj/Custom/Blank_Buff/Transplant_Byakugan/E = new(C)
					view(6)<<"[usr] implants [src] into [C]'s left eye left eye socket."
					E.Activo = 1
					C.overlays += 'Hyuuga2.dmi'
					usr.TByaku = 1
					var/obj/items/Citem/Byakugan_Eye_Wrap/G = new(C)
					G.name = "Eye Wrap"
				if(findtext("[src.name]","Rinnegan"))
					usr<<"You can't transplant that yet."
					return
				del src

		Sharingan
			icon = 'Eyes.dmi'
			icon_state = "Sharingan"
		Byakugan
			icon = 'Eyes.dmi'
			icon_state = "Byakugan"
		Rinnegan
			icon = 'Eyes.dmi'
			icon_state = "Rinnegan"
mob/var
	TShar1 = 0
	TShar2 = 0
	TShar3 = 0
	TByaku = 0

obj/Custom/Blank_Buff
	Transplant_Sharingan1
		icon_state = "Sharingan1"
		TSharingan = 1
		GChak = -450
		GStam = 0
		Gnin = 0.23
		Ggen = 1.01
		Gtai = 1.12
		Gcon = 0.45
		Gint = 0.32
		Gref = 1.14
		Gspd = 0.12
		Gstr = 0.09
		Gdef = 0.67
		Gdur = 0.02
		Gatkspd = 0.42
		description = "Ability to see Chakra Flow, read lips, and increased focus abilities."
		jut = "Doujutsu"

	Transplant_Sharingan2
		icon_state = "Sharingan2"
		TSharingan = 1
		GChak = -545
		GStam = 150
		Gnin = 0.46
		Ggen = 2.02
		Gtai = 2.24
		Gcon = 0.90
		Gint = 0.64
		Gref = 2.28
		Gspd = 0.24
		Gstr = 0.18
		Gdef = 1.24
		Gdur = 0.04
		Gatkspd = 0.82
		description = "Enhanced reflexes, ability to copy non-Kekkei Jutsu, enhanced visual to muscle memory, enhanced perception and sensing, ability to see through Genjutsu, ability to break those weaker than self."
		jut = "Doujutsu"
		SharinganCopyy = 1

	Transplant_Sharingan3
		icon_state = "Sharingan3"
		TSharingan = 1
		GChak = -645
		GStam = 200
		Gnin = 0.92
		Ggen = 4.04
		Gtai = 4.48
		Gcon = 1.80
		Gint = 1.28
		Gref = 4.56
		Gspd = 0.48
		Gstr = 0.36
		Gdef = 2.48
		Gdur = 0.08
		Gatkspd = 1.64
		description = "Greater Enhanced Reflexes, Ability to copy non-kekkei jutsu, even more enhanced visual to muscle memory, even greater enhanced perception and sensing, ability to turn Genjutsu on their users, ability to freeze opponent in place with eye contact."
		jut = "Doujutsu"
		SharinganCopyy = 1



	Transplant_Byakugan
		TByakugan = 1
		icon = 'SkillCard.dmi'
		icon_state = "Byakugan"
		GChak = -100
		GStam = 0
		Gnin = 0.54
		Gsense = 50
		Ggen = 2.75
		Gtai = 3.05
		Gcon = 1.00
		Gint = 1.00
		Gref = 1.55
		Gspd = 0.54
		Gstr = 0.54
		Gdef = 1.55
		Gdur = 0.54
		Gatkspd = 0.55
		description = "Allows the user to see the chakra pathway network. Allows for increased ability with Jyuuken. 360 degree, telescoping, X-ray sight with a small blindspot at nape."
		jut = "Doujutsu"



obj/items/Citem
	Sharingan_Eye_Wrap
		name = "Eye Wrap"
		icon='Eye Band2.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays += src.icon
					if(usr.TShar1)
						usr.Sharingan = 0
						usr.overlays -= 'Sharingan2.dmi'
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] cover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan1/G in usr.contents)
							usr.Jnin -= G.Gnin
							usr.Jgen -= G.Ggen
							usr.Jtai -= G.Gtai
							usr.Jcon -= G.Gcon
							usr.Jint -= G.Gint
							usr.Jref -= G.Gref
							usr.Jspd -= G.Gspd
							usr.Jstr -= G.Gstr
							usr.Jdef -= G.Gdef
							usr.Jdur -= G.Gdur
							usr.Jatkspd -= G.Gatkspd
							G.GChak += rand(5,7.5)
							G.Activo = 0
							usr.Buffed = 0

					if(usr.TShar2)
						usr.Sharingan = 0
						usr.SharinganBuffCopy = 0
						usr.overlays -= 'Sharingan2.dmi'
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] cover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan2/G in usr.contents)
							usr.Jnin -= G.Gnin
							usr.Jgen -= G.Ggen
							usr.Jtai -= G.Gtai
							usr.Jcon -= G.Gcon
							usr.Jint -= G.Gint
							usr.Jref -= G.Gref
							usr.Jspd -= G.Gspd
							usr.Jstr -= G.Gstr
							usr.Jdef -= G.Gdef
							usr.Jdur -= G.Gdur
							usr.Jatkspd -= G.Gatkspd
							G.GChak += rand(5,7.5)
							G.Activo = 0
							usr.Buffed = 0

					if(usr.TShar3)
						usr.Sharingan = 0
						usr.overlays -= 'Sharingan2.dmi'
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] cover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan3/G in usr.contents)
							usr.Jnin -= G.Gnin
							usr.Jgen -= G.Ggen
							usr.Jtai -= G.Gtai
							usr.Jcon -= G.Gcon
							usr.Jint -= G.Gint
							usr.Jref -= G.Gref
							usr.Jspd -= G.Gspd
							usr.Jstr -= G.Gstr
							usr.Jdef -= G.Gdef
							usr.Jdur -= G.Gdur
							usr.Jatkspd -= G.Gatkspd
							G.GChak += rand(5,7.5)
							G.Activo = 0
							usr.Buffed = 0
				else
					src.worn = 0
					src.suffix = ""
					usr.overlays -= src.icon
					if(usr.TShar1)
						usr.Sharingan = 1
						usr.overlays += 'Sharingan2.dmi'
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] uncover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan1/G in usr.contents)
							usr.Jnin += G.Gnin
							usr.Jgen += G.Ggen
							usr.Jtai += G.Gtai
							usr.Jcon += G.Gcon
							usr.Jint += G.Gint
							usr.Jref += G.Gref
							usr.Jspd += G.Gspd
							usr.Jstr += G.Gstr
							usr.Jdef += G.Gdef
							usr.Jdur += G.Gdur
							usr.Jatkspd += G.Gatkspd
							G.Activo = 1
							usr.Buffed = 1


					if(usr.TShar2)
						usr.Sharingan = 1
						usr.SharinganBuffCopy = 1
						usr.overlays -= 'Sharingan2.dmi'
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] uncover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan2/G in usr.contents)
							usr.Jnin += G.Gnin
							usr.Jgen += G.Ggen
							usr.Jtai += G.Gtai
							usr.Jcon += G.Gcon
							usr.Jint += G.Gint
							usr.Jref += G.Gref
							usr.Jspd += G.Gspd
							usr.Jstr += G.Gstr
							usr.Jdef += G.Gdef
							usr.Jdur += G.Gdur
							usr.Jatkspd += G.Gatkspd
							G.Activo = 1
							usr.Buffed = 1

					if(usr.TShar3)
						usr.Sharingan = 1
						usr.overlays -= 'Sharingan2.dmi'
						usr.SharinganBuffCopy = 1
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] uncover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan3/G in usr.contents)
							usr.Jnin += G.Gnin
							usr.Jgen += G.Ggen
							usr.Jtai += G.Gtai
							usr.Jcon += G.Gcon
							usr.Jint += G.Gint
							usr.Jref += G.Gref
							usr.Jspd += G.Gspd
							usr.Jstr += G.Gstr
							usr.Jdef += G.Gdef
							usr.Jdur += G.Gdur
							usr.Jatkspd += G.Gatkspd
							G.Activo = 1
							usr.Buffed = 1




	Byakugan_Eye_Wrap
		name = "Eye Band"
		icon = 'Eye Band.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays += src.icon
					if(usr.TByaku)
						usr.Byakugan = 0
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] covers their transplanted Byakugan.<font color = white>*)"
						usr.overlays -= 'Hyuuga2.dmi'
						for(var/obj/Custom/Blank_Buff/Transplant_Byakugan/G in usr.contents)
							usr.Jnin -= G.Gnin
							usr.Jgen -= G.Ggen
							usr.Jtai -= G.Gtai
							usr.Jcon -= G.Gcon
							usr.Jint -= G.Gint
							usr.Jref -= G.Gref
							usr.Jspd -= G.Gspd
							usr.Jstr -= G.Gstr
							usr.Jdef -= G.Gdef
							usr.Jdur -= G.Gdur
							usr.Jatkspd -= G.Gatkspd
							G.GChak += rand(5,7.5)
							G.Activo = 0
				else
					src.worn = 0
					src.suffix = ""
					usr.overlays -= src.icon
					usr.ByakuganNetwork()
					if(usr.TByaku)
						usr.Byakugan = 1
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] uncovers their transplanted Byakugan.<font color = white>*)"
						usr.overlays += 'Hyuuga2.dmi'
						for(var/obj/Custom/Blank_Buff/Transplant_Byakugan/G in usr.contents)
							usr.Jnin += G.Gnin
							usr.Jgen += G.Ggen
							usr.Jtai += G.Gtai
							usr.Jcon += G.Gcon
							usr.Jint += G.Gint
							usr.Jref += G.Gref
							usr.Jspd += G.Gspd
							usr.Jstr += G.Gstr
							usr.Jdef += G.Gdef
							usr.Jdur += G.Gdur
							usr.Jatkspd += G.Gatkspd
							G.Activo = 1


	Blindfold
		icon='White headband.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays += src.icon
					if(usr.TShar1)
						usr.Sharingan = 0
						usr.overlays -= 'Sharingan2.dmi'
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] cover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan1/G in usr.contents)
							usr.Jnin -= G.Gnin
							usr.Jgen -= G.Ggen
							usr.Jtai -= G.Gtai
							usr.Jcon -= G.Gcon
							usr.Jint -= G.Gint
							usr.Jref -= G.Gref
							usr.Jspd -= G.Gspd
							usr.Jstr -= G.Gstr
							usr.Jdef -= G.Gdef
							usr.Jdur -= G.Gdur
							usr.Jatkspd -= G.Gatkspd
							G.GChak += rand(5,7.5)
							G.Activo = 0
							usr.Buffed = 0

					if(usr.TShar2)
						usr.Sharingan = 0
						usr.SharinganBuffCopy = 0
						usr.overlays -= 'Sharingan2.dmi'
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] cover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan2/G in usr.contents)
							usr.Jnin -= G.Gnin
							usr.Jgen -= G.Ggen
							usr.Jtai -= G.Gtai
							usr.Jcon -= G.Gcon
							usr.Jint -= G.Gint
							usr.Jref -= G.Gref
							usr.Jspd -= G.Gspd
							usr.Jstr -= G.Gstr
							usr.Jdef -= G.Gdef
							usr.Jdur -= G.Gdur
							usr.Jatkspd -= G.Gatkspd
							G.GChak += rand(5,7.5)
							G.Activo = 0
							usr.Buffed = 0

					if(usr.TShar3)
						usr.Sharingan = 0
						usr.overlays -= 'Sharingan2.dmi'
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] cover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan3/G in usr.contents)
							usr.Jnin -= G.Gnin
							usr.Jgen -= G.Ggen
							usr.Jtai -= G.Gtai
							usr.Jcon -= G.Gcon
							usr.Jint -= G.Gint
							usr.Jref -= G.Gref
							usr.Jspd -= G.Gspd
							usr.Jstr -= G.Gstr
							usr.Jdef -= G.Gdef
							usr.Jdur -= G.Gdur
							usr.Jatkspd -= G.Gatkspd
							G.GChak += rand(5,7.5)
							G.Activo = 0
							usr.Buffed = 0

					if(usr.TByaku)
						usr.Byakugan = 0
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] covers their transplanted Byakugan.<font color = white>*)"
						usr.overlays -= 'Hyuuga2.dmi'
						for(var/obj/Custom/Blank_Buff/Transplant_Byakugan/G in usr.contents)
							usr.Jnin -= G.Gnin
							usr.Jgen -= G.Ggen
							usr.Jtai -= G.Gtai
							usr.Jcon -= G.Gcon
							usr.Jint -= G.Gint
							usr.Jref -= G.Gref
							usr.Jspd -= G.Gspd
							usr.Jstr -= G.Gstr
							usr.Jdef -= G.Gdef
							usr.Jdur -= G.Gdur
							usr.Jatkspd -= G.Gatkspd
							G.GChak += rand(5,7.5)
							G.Activo = 0
							usr.Buffed = 0
				else
					src.worn = 0
					src.suffix = ""
					usr.overlays -= src.icon
					if(usr.TShar1)
						usr.Sharingan = 1
						usr.overlays += 'Sharingan2.dmi'
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] uncover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan1/G in usr.contents)
							usr.Jnin += G.Gnin
							usr.Jgen += G.Ggen
							usr.Jtai += G.Gtai
							usr.Jcon += G.Gcon
							usr.Jint += G.Gint
							usr.Jref += G.Gref
							usr.Jspd += G.Gspd
							usr.Jstr += G.Gstr
							usr.Jdef += G.Gdef
							usr.Jdur += G.Gdur
							usr.Jatkspd += G.Gatkspd
							G.Activo = 1
							usr.Buffed = 1

					if(usr.TShar2)
						usr.Sharingan = 1
						usr.SharinganBuffCopy = 1
						usr.overlays -= 'Sharingan2.dmi'
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] uncover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan2/G in usr.contents)
							usr.Jnin += G.Gnin
							usr.Jgen += G.Ggen
							usr.Jtai += G.Gtai
							usr.Jcon += G.Gcon
							usr.Jint += G.Gint
							usr.Jref += G.Gref
							usr.Jspd += G.Gspd
							usr.Jstr += G.Gstr
							usr.Jdef += G.Gdef
							usr.Jdur += G.Gdur
							usr.Jatkspd += G.Gatkspd
							G.Activo = 1
							usr.Buffed = 1

					if(usr.TShar3)
						usr.Sharingan = 1
						usr.overlays -= 'Sharingan2.dmi'
						usr.SharinganBuffCopy = 1
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] uncover's their Sharingan.<font color = white>*)"
						for(var/obj/Custom/Blank_Buff/Transplant_Sharingan3/G in usr.contents)
							usr.Jnin += G.Gnin
							usr.Jgen += G.Ggen
							usr.Jtai += G.Gtai
							usr.Jcon += G.Gcon
							usr.Jint += G.Gint
							usr.Jref += G.Gref
							usr.Jspd += G.Gspd
							usr.Jstr += G.Gstr
							usr.Jdef += G.Gdef
							usr.Jdur += G.Gdur
							usr.Jatkspd += G.Gatkspd
							G.Activo = 1
							usr.Buffed = 1

					if(usr.TByaku)
						usr.Byakugan = 1
						viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr] uncovers their transplanted Byakugan.<font color = white>*)"
						usr.overlays += 'Hyuuga2.dmi'
						for(var/obj/Custom/Blank_Buff/Transplant_Byakugan/G in usr.contents)
							usr.Jnin += G.Gnin
							usr.Jgen += G.Ggen
							usr.Jtai += G.Gtai
							usr.Jcon += G.Gcon
							usr.Jint += G.Gint
							usr.Jref += G.Gref
							usr.Jspd += G.Gspd
							usr.Jstr += G.Gstr
							usr.Jdef += G.Gdef
							usr.Jdur += G.Gdur
							usr.Jatkspd += G.Gatkspd
							G.Activo = 1
							usr.Buffed = 1
