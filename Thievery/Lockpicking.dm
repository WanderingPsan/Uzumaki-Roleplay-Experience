mob
	Bump(obj/A)
		..()
		if(istype(A,/obj/Suna_Wall_Forte))
			if(locate(/obj/items/Clothing/SandHeadband,usr.contents))
				A.density = 0
				sleep(20)
				A.density = 1
		if(istype(A,/obj/Konoha_Secret_Door))
			if(locate(/obj/items/Clothing/LeafHeadband,usr.contents))
				A.density = 0
				sleep(20)
				A.density = 1
		if(istype(A,/obj/Suna_Secret_Door))
			if(locate(/obj/items/Clothing/SandHeadband,usr.contents))
				A.density = 0
				sleep(20)
				A.density = 1
		if(istype(A,/obj/Ame_Secret_Door))
			if(locate(/obj/items/Clothing/RainHeadband,usr.contents))
				A.density = 0
				sleep(20)
				A.density = 1
		if(istype(A,/obj/Prison_Door))
			for(var/obj/items/Police_Badge/Z in usr.contents)
				if(Z.Password==A:Password)
					A:OpenClose(usr)
					return
			if(A:Password)
				var/Guess=input(src,"You must know the password to enter here") as text
				if(Guess==A:Password) A:OpenClose(usr)
			else
				A:OpenClose(usr)
		if(istype(A,/obj/Hospital_Door))
			for(var/obj/items/Police_Badge/Z in usr.contents)
				if(Z.Password==A:Password)
					A:OpenClose(usr)
					return
			if(A:Password)
				var/Guess=input(src,"You must know the password to enter here") as text
				if(Guess==A:Password) A:OpenClose(usr)
			else
				A:OpenClose(usr)
		if(istype(A,/obj/Door))
			for(var/obj/items/Police_Badge/Z in usr.contents)
				if(Z.Password==A:Password)
					A:OpenClose(usr)
					return
			if(A:Password)
				var/Guess=input(src,"You must know the password to enter here") as text
				if(Guess==A:Password) A:OpenClose(usr)
			else
				A:OpenClose(usr)
obj/Prison_Door/proc/OpenClose(var/mob/Guy)
	if(!src.open)
		src.open=1
		src.density=0
		src.icon_state="Celldoor2"
		view() << "[Guy] opens the door"
		spawn(60)src.open=0
		spawn(60)src.density=1
		spawn(60)src.icon_state="Celldoor"

obj/Hospital_Door/proc/OpenClose(var/mob/Guy)
	if(!src.open)
		src.open=1
		src.density=0
		src.icon_state="Hospitaldoor2"
		view() << "[Guy] opens the door"
		spawn(60)src.open=0
		spawn(60)src.density=1
		spawn(60)src.icon_state="Hospitaldoor"

obj/Door/proc/OpenClose(var/mob/Guy)
	if(!src.open)
		src.open=1
		src.density=0
		src.icon_state="Door2"
		view() << "[Guy] opens the door"
		spawn(60)src.open=0
		spawn(60)src.density=1
		spawn(60)src.icon_state="Door"





obj/items/Police_Badge
	icon='InteriorDeco.dmi'
	icon_state="Police"
	var/Password="PolicePassword"

obj/items/Citem/tools/Lockpick
	icon = 'Lockpick.dmi'
	var/Setti = 0
	Click()
		if(!src.Setti)
			src.Setti = 1
			src.suffix = "**Equipped**"
		else
			src.Setti = 0
			src.suffix = ""

mob/var/LockPickSkill = 0

obj/Prison_Door
	icon='InteriorDeco.dmi'
	icon_state="Celldoor"
	density=1
	var/open=0
	var/Pickable = 1
	var/Password="PolicePassword"
	var/Rentable = 0
	var/Rent = 750
	var/Renter = null
	DblClick()
		if(src.Rentable)
			var/O = input("Would you like to rent this building?")in list("Yes","No")
			if(O == "Yes")
				if(usr.Yen >= src.Rent)
					usr<<"You pay the [src.Rent] yen fee to rent this home. Everytime you get paid you will have to pay your rent. If you do not have enough money, then you will lose your claim on this home."
					var/newkey = input("What will the password be?")as text
					src.Password=newkey
					src.Renter = usr
					src.Rentable = 0
					var/obj/items/Police_Badge/A = new
					usr.contents += A
					A.Password = newkey
					A.icon_state = "Key"
					if(usr.Village == "Konohagakure")
						KonohaCash += src.Rent
					if(usr.Village == "Kirigakure")
						KiriCash += src.Rent
					if(usr.Village == "Kumogakure")
						KumoCash += src.Rent
					if(usr.Village == "Sunagakure")
						SunaCash += src.Rent
					if(usr.Village == "Amegakure")
						AmeCash += src.Rent
			if(O == "No")
				usr<<"Alright."
				return
	Click()
		for(var/obj/items/Citem/tools/Lockpick/A in usr.contents)
			if(A.suffix == "**Equipped**")
				if(!src.Pickable)
					usr<<"This door has a special lock which cannot be picked."
					return
				input("Would you like to attempt to pick this lock?") in list("Yes","No")
				if("Yes")
					if(prob(usr.LockPickSkill))
						usr<<"You pick the lock."
						usr.LockPickSkill += rand(1,3)
						src.OpenClose(usr)
						return
					else
						usr<<"You fail to pick the lock."
						usr.LockPickSkill += rand(1,3)
						if(prob(25))
							usr<<"Your lockpick broke."
							del A
						return
				if("No")
					usr<<"You put your lockpick away."
					return


obj/Hospital_Door
	icon='InteriorDeco.dmi'
	icon_state="Hospitaldoor"
	density=1
	var/open=0
	var/Pickable = 1
	var/Password="PolicePassword"
	var/Rentable = 0
	var/Rent = 750
	var/Renter = null
	DblClick()
		if(src.Rentable)
			var/O = input("Would you like to rent this room?")in list("Yes","No")
			if(O == "Yes")
				if(usr.Yen >= src.Rent)
					usr<<"You pay the [src.Rent] yen fee to rent this room. Everytime you get paid you will have to pay your rent. If you do not have enough money, then you will lose your claim on this room."
					var/newkey = input("What will the password be?")as text
					src.Password=newkey
					src.Renter = usr
					src.Rentable = 0
					var/obj/items/Police_Badge/A = new
					usr.contents += A
					A.Password = newkey
					A.icon_state = "Key"
					if(usr.Village == "Konohagakure")
						KonohaCash += src.Rent
					if(usr.Village == "Kirigakure")
						KiriCash += src.Rent
					if(usr.Village == "Kumogakure")
						KumoCash += src.Rent
					if(usr.Village == "Sunagakure")
						SunaCash += src.Rent
					if(usr.Village == "Amegakure")
						AmeCash += src.Rent
			if(O == "No")
				usr<<"Alright."
				return
	Click()
		for(var/obj/items/Citem/tools/Lockpick/A in usr.contents)
			if(A.suffix == "**Equipped**")
				if(!src.Pickable)
					usr<<"This door has a special lock which cannot be picked."
					return
				input("Would you like to attempt to pick this lock?") in list("Yes","No")
				if("Yes")
					if(prob(usr.LockPickSkill))
						usr<<"You pick the lock."
						usr.LockPickSkill += rand(1,3)
						src.OpenClose(usr)
						return
					else
						usr<<"You fail to pick the lock."
						usr.LockPickSkill += rand(1,3)
						if(prob(25))
							usr<<"Your lockpick broke."
							del A
						return
				if("No")
					usr<<"You put your lockpick away."
					return

obj/Door
	icon='InteriorDeco.dmi'
	icon_state="Door"
	density=1
	var/open=0
	var/Pickable = 1
	var/Password="PolicePassword"
	var/Rentable = 0
	var/Rent = 750
	var/Renter = null
	DblClick()
		if(src.Rentable)
			var/O = input("Would you like to rent this house?")in list("Yes","No")
			if(O == "Yes")
				if(usr.Yen >= src.Rent)
					usr<<"You pay the [src.Rent] yen fee to rent this house. Everytime you get paid you will have to pay your rent. If you do not have enough money, then you will lose your claim on this house."
					var/newkey = input("What will the password be?")as text
					src.Password=newkey
					src.Renter = usr
					src.Rentable = 0
					var/obj/items/Police_Badge/A = new
					usr.contents += A
					A.Password = newkey
					A.icon_state = "Key"
					if(usr.Village == "Konohagakure")
						KonohaCash += src.Rent
					if(usr.Village == "Kirigakure")
						KiriCash += src.Rent
					if(usr.Village == "Kumogakure")
						KumoCash += src.Rent
					if(usr.Village == "Sunagakure")
						SunaCash += src.Rent
					if(usr.Village == "Amegakure")
						AmeCash += src.Rent
			if(O == "No")
				usr<<"Alright."
				return
	Click()
		for(var/obj/items/Citem/tools/Lockpick/A in usr.contents)
			if(A.suffix == "**Equipped**")
				if(!src.Pickable)
					usr<<"This door has a special lock which cannot be picked."
					return
				input("Would you like to attempt to pick this lock?") in list("Yes","No")
				if("Yes")
					if(prob(usr.LockPickSkill))
						usr<<"You pick the lock."
						usr.LockPickSkill += rand(1,3)
						src.OpenClose(usr)
						return
					else
						usr<<"You fail to pick the lock."
						usr.LockPickSkill += rand(1,3)
						if(prob(25))
							usr<<"Your lockpick broke."
							del A
						return
				if("No")
					usr<<"You put your lockpick away."
					return