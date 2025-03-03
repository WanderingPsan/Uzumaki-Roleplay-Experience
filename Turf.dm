obj/Konoha/Gate
	icon='Gate.dmi'
	icon_state="Open"
	density=0
	var/open=1
	layer=98
obj/Konoha/Gate
	Click()
		if(usr.Class == "Hokage")
			src.KonohaGateOpenClose()
obj/Konoha/Gate/verb/Open_or_Close()
	KonohaGateOpenClose()

obj/Konoha/Gate/proc/KonohaGateOpenClose()
	if(!src.open)
		src.open=1
		src.icon_state="Open2"
		src.layer=98
		src.density=0
	else
		src.open=0
		src.icon_state="Closed2"
		src.layer=98
		src.density=1
/*
obj/Konoha/Gate
	icon='Gate.dmi'
	icon_state="Open1"
	density=0
	var/open=1
	layer=98
obj/Konoha/Gate
	Click()
		if(usr.Class == "Mizukage")
			src.KonohaGateOpenClose()
obj/Konoha/Gate/verb/Open_or_Close()
	KonohaGateOpenClose()

obj/Konoha/Gate/proc/KonohaGateOpenClose()
	if(!src.open)
		src.open=1
		src.icon_state="Open1"
		src.layer=98
		src.density=0
	else
		src.open=0
		src.icon_state="Closed1"
		src.layer=98
		src.density=1

obj/Konoha/Gate
	icon='Gate.dmi'
	icon_state="Open3"
	density=0
	var/open=1
	layer=98
obj/Konoha/Gate
	Click()
		if(usr.Class == "Raikage")
			src.KonohaGateOpenClose()
obj/Konoha/Gate/verb/Open_or_Close()
	KonohaGateOpenClose()

obj/Konoha/Gate/proc/KonohaGateOpenClose()
	if(!src.open)
		src.open=1
		src.icon_state="Open3"
		src.layer=98
		src.density=0
	else
		src.open=0
		src.icon_state="Closed3"
		src.layer=98
		src.density=1 */

obj/Konoha_Secret_Door
	icon = 'AcademyInside.dmi'
	icon_state = ""
	density = 1
	layer = 15000
obj/Suna_Secret_Door
	icon = 'AcademyInside.dmi'
	icon_state = "WallB"
	density = 1
	layer = 15000
obj/Ame_Secret_Door
	icon = 'AcademyInside.dmi'
	icon_state = "WallB"
	density = 1
	layer = 15000

obj/Suna_Wall_Forte
	icon = 'Turf.dmi'
	icon_state = "Sand"
	density = 1
	layer = 150




area/Darkness
	icon='DarkC.dmi'
	mouse_opacity=0
	layer=9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
mob/var
	HasHeaven=0
	HasEarth=0
	AllowCEnter=0
mob/
	Chuunin1
	Chuunin2
	Chuunin3
obj/chuunin
	Heaven
		name="Heaven"
		icon='CScrolls.dmi'
		icon_state="H"
		layer=999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
	Earth
		name="Earth"
		icon='CScrolls.dmi'
		icon_state="E"
		layer=999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
	verb
		Pick_Up()
			set src in oview(1)
			if(src.name=="Earth")
				usr.HasEarth=1
			if(src.name=="Heaven")
				usr.HasHeaven=1
			src.loc = usr
		Drop()
			set src in usr.contents
			if(src.name=="Earth")
				usr.HasEarth=0
			if(src.name=="Heaven")
				usr.HasHeaven=0
			src.loc = locate(src.x,src.y,src.z)
turf/EnterChuuninR3
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client&&M.HasEarth==1&&M.HasHeaven==1)
				M.loc = locate(236,170,29)
				M.overlays -= 'Swim.dmi'
				alert(M,"Tell the admins who your squad members are so they can summon them.")
			else
				M<<"Get all the scrolls."

turf/EnterChuuninR2
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client&&M.AllowCEnter==1)
				M.loc = locate(81,97,29)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/EnterChuuninR
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(143,22,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/ExitChuuninR
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(86,76,1)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/TeaShop1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(110,110,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/TeaShop1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(8,291,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/TeaShop2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(111,110,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/TeaShop2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(9,291,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/BlackSmith1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(96,119,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/BlackSmith1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(6,272,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/BlackSmith2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(97,119,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/BlackSmith2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(7,272,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Black1Smith1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(6,272,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Black1Smith2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(97,119,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WeaponShop1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(125,119,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WeaponShop1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(8,281,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WeaponShop2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(126,119,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WeaponShop2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(9,281,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/ClothingShop1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(110,127,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/ClothingShop1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(8,262,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/ClothingShop2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(111,127,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/ClothingShop2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(9,262,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Prison1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(131,151,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Prison1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(65,278,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Prison2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(132,151,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Prison2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(65,278,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Conference1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(160,151,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Conference1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(90,270,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Conference2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(161,151,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Conference2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(91,270,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Mansion1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(146,155,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Mansion1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(138,250,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Mansion2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(146,155,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Mansion2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(139,250,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/MansionTop1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(143,263,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/MansionTop1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(122,242,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/MansionTop2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(144,263,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/MansionTop2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(123,242,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/MansionTop3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(145,263,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/MansionTop3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(124,242,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Academy1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(185,191,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Academy1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(196,274,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Academy2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(186,191,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Academy2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(197,274,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/AcademyBot1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(206,285,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/AcademyBot1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(197,270,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/AcademyBot2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(207,285,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/AcademyBot2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(198,270,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/AcademyBot3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(208,285,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/AcademyBot3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(199,270,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Inn1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(226,176,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Inn1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(239,271,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Bar1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(250,182,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Bar1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(273,282,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Bar2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(251,182,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Bar2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(274,282,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Bar3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(252,182,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Bar3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(275,282,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/LargeKaguya1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(117,214,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/LargeKaguya1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(82,243,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/LargeKaguya2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(118,214,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/LargeKaguya2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(83,243,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/LargeKaguya3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(117,214,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/LargeKaguya3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(84,243,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/WestKaguya1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(106,219,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestKaguya1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(64,262,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestKaguya2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(107,219,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestKaguya2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(65,262,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestKaguya3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(108,219,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestKaguya3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(66,261,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestKaguya4Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(109,219,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestKaguya4In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(67,261,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastKaguya1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(129,219,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastKaguya1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(64,244,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastKaguya2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(130,219,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastKaguya2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(65,244,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastKaguya3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(131,219,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastKaguya3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(66,243,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastKaguya4Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(132,219,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastKaguya4In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(66,243,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/LargeHozukiOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(220,273,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/LargeHozukiIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(98,243,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/LargeHozuki2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(220,273,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/LargeHozuki2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(99,243,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1



turf/WestHozuki1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(209,278,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestHozuki1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(37,230,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestHozuki2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(210,278,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestHozuki2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(38,230,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastHozuki1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(232,278,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastHozuki1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(37,212,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastHozuki2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(233,278,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastHozuki2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(38,212,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1



turf/LargeYuki1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(231,43,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/LargeYuki1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(82,213,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/LargeYuki2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(231,43,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/LargeYuki2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(83,213,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/WestYuki1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(220,48,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestYuki1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(64,226,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestYuki2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(221,48,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/WestYuki2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(65,226,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/EastYuki1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(243,48,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastYuki1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(64,208,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastYuki2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(244,48,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/EastYuki2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(65,208,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/HoshigakiCaveOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.Hoshigaki==1)
				M.loc = locate(196,218,3)
				M.loc = locate(197,218,3)
				M.overlays -= 'Swim.dmi'
				alert(M,"See you soon.")
			else
				M<<"Notify an Admin that you're trying to leave this cave."
turf/HoshigakiCaveIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.Hoshigaki==1)
				M.loc = locate(31,248,5)
				M.loc = locate(32,248,5)
				M.overlays -= 'Swim.dmi'
				alert(M,"Welcome.")
			else
				M<<"Notify an Admin that you've entered this cave."

turf/HoshigakiSecIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.Hoshigaki==1)
				M.loc = locate(24,264,5)
				M.loc = locate(25,264,5)
				M.overlays -= 'Swim.dmi'
				alert(M,"Welcome.")
			else
				M<<"Notify an Admin that you're trying to leave this cave."
turf/HoshigakiSecOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.Hoshigaki==1)
				M.loc = locate(128,267,3)
				M.loc = locate(129,267,3)
				M.overlays -= 'Swim.dmi'
				alert(M,"See you soon.")
			else
				M<<"Notify an Admin that you've entered this cave."






turf/Hospital1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(110,182,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Hospital1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(31,269,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Hospital2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(110,182,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Hospital2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(32,269,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/HospitalTop1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(31,280,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/HospitalTop1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(49,293,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/HospitalTop2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(32,280,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/HospitalTop2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(50,293,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/Large1House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(93,148,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Large1House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(138,213,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Large1House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(93,148,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Large1House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(139,213,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/Large2House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(134,187,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Large2House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(161,212,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Large2House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(134,187,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Large2House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(162,212,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/Large3House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(181,144,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Large3House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(160,239,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Large3House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(181,144,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Large3House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(161,239,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1





turf/Large4House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(193,94,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Large4House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(103,213,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1






turf/Small1House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(157,199,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small1House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(87,201,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small1House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(158,199,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small1House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(86,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1



turf/Small2House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(166,90,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small2House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(102,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small2House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(167,90,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small2House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(102,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/Small3House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(176,97,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small3House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(118,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small3House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(177,97,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small3House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(118,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1



turf/Small4House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(206,131,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small4House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(135,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small4House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(207,131,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small4House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(136,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/Small5House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(221,138,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small5House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(151,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small5House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(222,138,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small5House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(152,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1





turf/Small6House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(208,144,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small6House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(167,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small6House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(209,144,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small6House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(168,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1






turf/Small7House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(159,204,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small7House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(183,208,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small7House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(160,204,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small7House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(184,208,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1





turf/Small8House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(174,216,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small8House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(199,208,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small8House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(175,216,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small8House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(200,208,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1





turf/Small9House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(160,217,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small9House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(215,208,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small9House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(161,217,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small9House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(216,208,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/Small10House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(233,215,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small10House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(183,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small10House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(234,215,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small10House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(184,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1





turf/Small11House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(244,215,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small11House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(199,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small11House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(245,215,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small11House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(200,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1





turf/Small12House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(255,215,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small12House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(215,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small12House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(256,215,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small12House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(216,185,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/Small13House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(238,204,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small13House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(226,229,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small13House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(239,204,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small13House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(226,229,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1





turf/Small14House1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(250,204,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small14House1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(242,247,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small14House2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(251,204,3)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/Small14House2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(242,247,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1





//Suna stuff
turf/SunaClothingShopOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(154,191,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaClothingShopIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(270,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/SunaTeaShopOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(137,191,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaTeaShopIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(285,11,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/SunaWeaponShopOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(82,191,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/SunaWeaponShopIn //Double Check This
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(285,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/SunaInnOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(82,178,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaInnIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(164,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/SunaHospitalOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(82,165,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHospitalIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(254,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHospitalTop1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(253,12,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHospitalTop1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(259,25,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHospitalTop2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(254,12,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHospitalTop2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(260,25,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/SunaAcademyOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(141,165,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaAcademyIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(201,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(112,210,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(287,30,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionTop1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(281,43,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionTop1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(270,22,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionTop2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(282,43,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionTop2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(271,22,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionTop3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(283,43,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionTop3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(272,22,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionR1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(291,43,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionR1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(113,226,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionR2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(292,43,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionR2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(113,226,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionR3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(293,43,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaMansionR3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(113,226,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/SunaBlackSmithOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(105,171,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaBlackSmithIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(273,11,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1






turf/SunaHouse1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(87,142,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(9,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1



turf/SunaHouse2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(97,142,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(7,23,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1





turf/SunaHouse3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(82,153,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(23,23,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1





turf/SunaHouse4Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(92,153,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse4In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(26,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/SunaHouse5Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(102,153,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse5In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(41,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/SunaHouse6Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(77,219,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse6In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(39,23,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1





turf/SunaHouse7Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(91,219,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse7In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(55,23,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/SunaHouse8Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(71,231,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse8In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(57,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/SunaHouse9Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(84,231,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse9In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(71,23,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/SunaHouse10Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(97,231,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse10In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(73,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/SunaHouse11Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(136,221,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse11In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(87,23,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/SunaHouse12Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(150,221,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse12In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(89,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/SunaHouse13Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(129,231,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1
turf/SunaHouse13In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(111,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/SunaHouse14Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(143,231,10)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1

turf/SunaHouse14In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(127,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1




turf/SunaHouse15Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(157,231,10)
				M.overlays -= 'Swim.dmi'
turf/SunaHouse15In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(143,1,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1



turf/SunaJailIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(117,175,10)
				M.overlays -= 'Swim.dmi'


turf/SunaJailOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(107,23,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/SunaBedsIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(159,159,10)
				M.overlays -= 'Swim.dmi'


turf/SunaBedsOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(138,31,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/SunaSpaIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(159,174,10)
				M.overlays -= 'Swim.dmi'


turf/SunaSpaOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(196,23,5)
				M.loc = locate(197,32,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/SunaLargeHouse1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(93,209,10)
				M.overlays -= 'Swim.dmi'


turf/SunaLargeHouse1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(234,59,5)
				M.loc = locate(235,59,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/SunaLargeHouse2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(73,209,10)
				M.overlays -= 'Swim.dmi'


turf/SunaLargeHouse2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(233,34,5)
				M.loc = locate(234,34,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/SunaLargeHouse3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(81,247,10)
				M.overlays -= 'Swim.dmi'


turf/SunaLargeHouse3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(219,92,5)
				M.loc = locate(220,92,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/SunaLargeHouse4In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(96,247,10)
				M.overlays -= 'Swim.dmi'


turf/SunaLargeHouse4Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(243,84,5)
				M.loc = locate(244,84,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/SunaLargeHouse5In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(123,247,10)
				M.overlays -= 'Swim.dmi'


turf/SunaLargeHouse5Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(257,59,5)
				M.loc = locate(258,59,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1



turf/SunaLargeHouse6In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(138,247,10)
				M.overlays -= 'Swim.dmi'


turf/SunaLargeHouse6Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(280,59,5)
				M.loc = locate(281,59,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/SunaLargeHouse7In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(118,238,10)
				M.overlays -= 'Swim.dmi'


turf/SunaLargeHouse7Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(289,84,5)
				M.loc = locate(290,84,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1



turf/SunaLargeHouse8In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(103,238,10)
				M.overlays -= 'Swim.dmi'


turf/SunaLargeHouse8Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(289,84,5)
				M.loc = locate(290,84,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/SunaLargeHouse9In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(132,211,10)
				M.overlays -= 'Swim.dmi'


turf/SunaLargeHouse9Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(266,84,5)
				M.loc = locate(267,84,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1


turf/SunaLargeHouse10In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(152,211,10)
				M.overlays -= 'Swim.dmi'


turf/SunaLargeHouse10Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(265,109,5)
				M.loc = locate(266,109,5)
				M.overlays -= 'Swim.dmi'
	layer = TURF_LAYER + 1



//Kumo Teleporters


turf/KumoKageOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(151,256,15)
				M.loc = locate(152,256,15)
				M.loc = locate(153,256,15)
				M.overlays -= 'Swim.dmi'
turf/KumoKageIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(98,16,8)
				M.overlays -= 'Swim.dmi'


turf/KumoKageRoomIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(81,8,8)
				M.loc = locate(82,8,8)
				M.loc = locate(83,8,8)
				M.overlays -= 'Swim.dmi'
turf/KumoKageRoomOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(92,29,8)
				M.loc = locate(93,29,8)
				M.loc = locate(94,29,8)
				M.overlays -= 'Swim.dmi'




turf/KumoPrisonOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(139,256,15)
				M.loc = locate(140,256,15)
				M.overlays -= 'Swim.dmi'
turf/KumoPrisonIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(12,4,8)
				M.overlays -= 'Swim.dmi'


turf/KumoShopOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(132,212,15)
				M.loc = locate(133,212,15)
				M.overlays -= 'Swim.dmi'
turf/KumoShopIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(50,5,8)
				M.overlays -= 'Swim.dmi'


turf/KumoBlackOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(143,212,15)
				M.loc = locate(144,212,15)
				M.overlays -= 'Swim.dmi'
turf/KumoBlackIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(53,15,8)
				M.overlays -= 'Swim.dmi'


turf/KumoWeapOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(132,204,15)
				M.loc = locate(133,204,15)
				M.overlays -= 'Swim.dmi'
turf/KumoWeapIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(65,5,8)
				M.overlays -= 'Swim.dmi'


turf/KumoTeaOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(143,204,15)
				M.loc = locate(144,204,15)
				M.overlays -= 'Swim.dmi'
turf/KumoTeaIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(65,15,8)
				M.overlays -= 'Swim.dmi'



turf/KumoConOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.Class=="Chuunin"&&M.Village=="Kumogakure"||M.Class=="Jounin"||M.Class=="Raikage")
				if(locate(/obj/items/Clothing/CloudHeadband,usr.contents))
					M.loc = locate(164,256,15)
					M.loc = locate(165,256,15)
					M.overlays -= 'Swim.dmi'
					M<<"See you again, [M]."
				else
					M<<"Guard Ruby: Should've listened. Should've stopped your shit. Now you're stuck in here, I'm sounding the alarms."
					world<<"<font color=red size=2>Attention! Someone managed to break into the conference room but is stopped by the guards! Everyone report to Kumogakure's conference room!"

turf/KumoConIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.Class=="Chuunin"&&M.Village=="Kumogakure"||M.Class=="Jounin"||M.Class=="Raikage")
				if(locate(/obj/items/Clothing/CloudHeadband,usr.contents))
					M.loc = locate(54,37,8)
					M.loc = locate(55,37,8)
					M.overlays -= 'Swim.dmi'
					M<<"Welcome, [M]."
				else
					M<<"Stop your shit. You don't have permission to enter this building."

turf/KumoInnOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(136,235,15)
				M.loc = locate(137,235,15)
				M.overlays -= 'Swim.dmi'
turf/KumoInnIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(160,5,8)
				M.overlays -= 'Swim.dmi'
				M<<"Welcome to the Inn."

turf/KumoAcadOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(151,235,15)
				M.loc = locate(152,235,15)
				M.overlays -= 'Swim.dmi'
turf/KumoAcadIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(130,5,8)
				M.overlays -= 'Swim.dmi'

turf/KumoHospOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(167,235,15)
				M.loc = locate(168,235,15)
				M.overlays -= 'Swim.dmi'
turf/KumoHospIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(39,5,8)
				M.overlays -= 'Swim.dmi'

turf/KumoHospStairsIn
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(38,16,8)
				M.loc = locate(39,16,8)
				M.overlays -= 'Swim.dmi'
turf/KumoHospStairsOut
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(44,29,8)
				M.loc = locate(45,29,8)
				M.overlays -= 'Swim.dmi'





turf/KumoSHouse1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(104,259,15)
				M.loc = locate(105,259,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(177,37,8)
				M.loc = locate(178,37,8)
				M.overlays -= 'Swim.dmi'

turf/KumoLHouse1Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(114,259,15)
				M.loc = locate(115,259,15)
				M.overlays -= 'Swim.dmi'
turf/KumoLHouse1In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(186,2,8)
				M.loc = locate(187,2,8)
				M.overlays -= 'Swim.dmi'

turf/KumoSHouse2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(124,259,15)
				M.loc = locate(125,259,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(194,37,8)
				M.loc = locate(195,37,8)
				M.overlays -= 'Swim.dmi'





turf/KumoSHouse3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(104,251,15)
				M.loc = locate(105,251,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(210,37,8)
				M.loc = locate(211,37,8)
				M.overlays -= 'Swim.dmi'

turf/KumoLHouse2Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(114,251,15)
				M.loc = locate(115,251,15)
				M.overlays -= 'Swim.dmi'
turf/KumoLHouse2In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(209,2,8)
				M.loc = locate(210,2,8)
				M.overlays -= 'Swim.dmi'

turf/KumoSHouse4Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(124,251,15)
				M.loc = locate(125,251,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse4In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(226,32,8)
				M.loc = locate(227,32,8)
				M.overlays -= 'Swim.dmi'





turf/KumoSHouse5Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(104,242,15)
				M.loc = locate(105,242,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse5In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(242,32,8)
				M.loc = locate(242,32,8)
				M.overlays -= 'Swim.dmi'

turf/KumoLHouse3Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(114,242,15)
				M.loc = locate(115,242,15)
				M.overlays -= 'Swim.dmi'
turf/KumoLHouse3In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(232,2,8)
				M.loc = locate(233,2,8)
				M.overlays -= 'Swim.dmi'

turf/KumoSHouse6Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(124,242,15)
				M.loc = locate(125,242,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse6In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(258,32,8)
				M.loc = locate(259,32,8)
				M.overlays -= 'Swim.dmi'




turf/KumoSHouse7Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(180,259,15)
				M.loc = locate(181,259,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse7In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(210,61,8)
				M.loc = locate(211,61,8)
				M.overlays -= 'Swim.dmi'
turf/KumoLHouse4Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(190,259,15)
				M.loc = locate(191,259,15)
				M.overlays -= 'Swim.dmi'
turf/KumoLHouse4In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(255,2,8)
				M.loc = locate(256,2,8)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse8Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(200,259,15)
				M.loc = locate(201,259,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse8In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(226,61,8)
				M.loc = locate(227,61,8)
				M.overlays -= 'Swim.dmi'



turf/KumoSHouse9Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(180,251,15)
				M.loc = locate(181,251,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse9In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(242,61,8)
				M.loc = locate(242,61,8)
				M.overlays -= 'Swim.dmi'
turf/KumoLHouse5Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(190,251,15)
				M.loc = locate(191,251,15)
				M.overlays -= 'Swim.dmi'
turf/KumoLHouse5In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(278,2,8)
				M.loc = locate(279,2,8)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse10Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(200,251,15)
				M.loc = locate(201,251,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse10In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(258,59,8)
				M.loc = locate(259,59,8)
				M.overlays -= 'Swim.dmi'




turf/KumoSHouse11Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(180,242,15)
				M.loc = locate(181,242,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse11In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(274,59,8)
				M.loc = locate(275,59,8)
				M.overlays -= 'Swim.dmi'
turf/KumoLHouse6Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(190,242,15)
				M.loc = locate(191,242,15)
				M.overlays -= 'Swim.dmi'
turf/KumoLHouse6In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(279,32,8)
				M.loc = locate(280,32,8)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse12Out
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(200,242,15)
				M.loc = locate(201,242,15)
				M.overlays -= 'Swim.dmi'
turf/KumoSHouse12In
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(290,59,8)
				M.loc = locate(291,59,8)
				M.overlays -= 'Swim.dmi'












turf/Teleporter
	var/goto_x
	var/goto_y
	var/goto_z
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(goto_x,goto_y,goto_z)
/*
turf/Teleporter1
	var/goto_x
	var/goto_y
	var/goto_z
	Enter(mob/M)
		if(istype(M,/mob))
			if(M.client)
				M.loc = locate(goto_x,goto_y,goto_z) */



turf/TeleportKumoHightoLow
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(M.x,300,13)
turf/TeleportKumoLowtoHigh
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(M.x,1,15)


turf/TeleporterToyoMizuOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(1,M.y,27)
				M.overlays-= 'Swim.dmi'
turf/TeleporterToyoMizuIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(300,M.y,3)
				M.overlays-= 'Swim.dmi'

turf/TeleporterKonOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(M.x,299,2)
				M.overlays -= 'Swim.dmi'
turf/TeleporterKonIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(M.x,2,1)
				M.overlays -= 'Swim.dmi'

turf/TeleporterKiriIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(2,M.y,3)
				M.overlays -= 'Swim.dmi'
turf/TeleporterKiriOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(299,M.y,4)
				M.overlays -= 'Swim.dmi'
turf/TeleporterForestIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(2,M.y,4)
				M.overlays -= 'Swim.dmi'
turf/TeleporterForestOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(299,M.y,2)
				M.overlays -= 'Swim.dmi'
turf/TeleporterSunaIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(299,M.y,9)
				M.overlays -= 'Swim.dmi'
turf/TeleporterSunaOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(2,M.y,2)
				M.overlays -= 'Swim.dmi'
turf/TeleporterSunaKazeIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(299,M.y,10)
				M.overlays -= 'Swim.dmi'
turf/TeleporterSunaKazeOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(2,M.y,9)
				M.overlays -= 'Swim.dmi'
turf/TeleporterValleyIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(2,M.y,6)
				M.overlays -= 'Swim.dmi'
turf/TeleporterValleyOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(299,M.y,1)
				M.overlays -= 'Swim.dmi'
turf/TeleporterSoundIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(2,M.y,7)
				M.overlays -= 'Swim.dmi'
turf/TeleporterSoundOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(299,M.y,6)
				M.overlays -= 'Swim.dmi'

turf/TeleporterGenIn
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(299,M.y,29)
				M.overlays -= 'Swim.dmi'
turf/TeleporterGenOut
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(256,M.y,29)
				M.overlays -= 'Swim.dmi'

turf/TeleporterGenIn2
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(M.x,14,29)
				M.overlays -= 'Swim.dmi'
turf/TeleporterGenOut2
	Enter(mob/M)
		if(istype(M, /mob/))
			if(M.client)
				M.loc = locate(M.x,1,29)
				M.overlays -= 'Swim.dmi'
turf/Tsukuyomi
	icon='Tsukuyomi.dmi'
	Floor
		icon_state="Black"
	Base
		icon_state="Base"
	Cross
		icon_state="Cross"
turf/Clan
	icon='SkillCard.dmi'
	Uchiha
		icon_state="Uchiha"
		layer = 15
	Nara
		icon_state="Nara"
		layer = 15
	Hyuuga
		icon_state="Hyuuga"
		layer = 15
	Inuzuka
		icon_state="Inuzuka"
		layer = 15
	Aburame
		icon_state="Aburame"
		layer = 15
	Akimichi
		icon_state="Akimichi"
		layer = 15

	Fire
		icon_state="Katon"
		layer = 15
	Water
		icon_state="Suiton"
		layer = 15
	Lightning
		icon_state="Raiton"
		layer = 15
	Earth
		icon_state="Doton"
		layer = 15
	Wind
		icon_state="Fuuton"
		layer = 15
	Nomaru
		icon_state="Denjiba"
		layer = 15
	Ouendan
		icon_state="Hero"
		layer = 15
	Houseki
		icon_state="Gem"
		layer = 15
	Lyzerg
		icon_state="Lyzerg"
		layer = 15
	Toyotomi
		icon_state="Toyotomi"
		layer = 15
	Regalado
		icon_state ="Regalado"
		layer = 15
turf
	Block
		opacity=1
	Dense
		density=1
turf/Bamboo
	icon='Turf.dmi'
	Bamboo
		icon_state="Bamboo"
		density=1
	Bamboo_2
		icon_state="Bamboo"
		layer=MOB_LAYER+1
	Bamboo_Head
		icon_state="Bamboo Head"
		layer=MOB_LAYER+1

	Big_Bamboo
		icon_state="Big Bamboo"
		density=1
	Big_Bamboo_2
		icon_state="Big Bamboo"
		layer=MOB_LAYER+1
	Big_Bamboo_Head
		icon_state="Big Bamboo Head"
		layer=MOB_LAYER+1

turf/Powerline
	icon='Powerline.dmi'
	Top
		icon_state="1"
		layer=MOB_LAYER+1
	Mid
		icon_state="2"
		layer=MOB_LAYER+1
	Low
		icon_state="3"
		layer=MOB_LAYER+1

	Bottom
		icon_state="4"
		density=1
	Left
		icon_state="Left"
		layer=MOB_LAYER+1
	Mid_Line
		icon_state="Mid"
		layer=MOB_LAYER+1
	Right
		icon_state="Right"
		layer=MOB_LAYER+1


turf/Terrain
	icon='Cave.dmi'

	Mud
		icon_state="CaveMud"




turf/Terrain
	icon='Turf.dmi'

	Sand
		icon_state="Sand"


	Grass
		Dark
			icon_state="darkgrass"
		Center
			icon='Grass1.dmi'
			icon_state="c"
			/*icon_state="grass"*/
			P1
				icon_state="1"
			P2
				icon_state="2"
			P3
				icon_state="3"
			P4
				icon_state="4"
			P5
				icon_state="5"
			P6
				icon_state="6"
			P7
				icon_state="7"
			P8
				icon_state="8"
		Horizon
			icon_state="horizon"
		Verticle
			icon_state="verticle"
		BL
			icon_state="bl"
		BR
			icon_state="br"
		TL
			icon_state="tl"
		TR
			icon_state="tr"
		C1
			icon_state="1"
		C2
			icon_state="2"
		C3
			icon_state="3"
		C4
			icon_state="4"
		Path
			icon='Dirt1.dmi'
			icon_state="c"
turf/StatueKage
	icon='Hokage.dmi'
	density=1
mob/
turf/ChuuninFloor
	icon='ChuuninFloor.dmi'
turf/ChuuninFense
	icon='FenseC.dmi'
	P1
		layer=100
		icon_state="1"
	P2
		density=1
		icon_state="1"
	P3
		layer=100
		icon_state="2"
turf/Interior
	Academy
		icon='AcademyInside.dmi'
		density = 0
	Weapons
		icon='WeaponInside.dmi'
		density = 0
	Tea
		icon='TeaInside.dmi'
		density = 0
	Flowers
		icon='FlowersInside.dmi'
		density = 0
	ClothesInside
		icon='ClothesInside.dmi'
		density = 0
	Scrolls
		icon='Scroll.dmi'
		density= 1
	Decoration
		icon='InteriorDeco.dmi'
		Photo
			icon_state="gikki"
			density = 1
		Mask
			icon_state="oopi"
			density = 1
		Paper
			icon_state="paper"
			density = 0
		Paper2
			icon_state="p2"
			density = 1
		Unrolled_Scroll
			icon_state="unrolled"
			density = 1
		Poster1
			icon_state="po1"
			density = 1
		Poster2
			icon_state="po2"
			layer=15
			density = 1
		Mat
			icon_state="mat"
		Cushion
			icon_state="cushion"




obj/Chuunin_Door
	icon='InteriorDeco.dmi'
	icon_state="Celldoor2"
	density=1
	var/open=0
	verb/Open_or_Close()
		set src in view(usr,2)
		if(!open)
			open=1
			density=0
			icon_state="Celldoor3"
			view() << "[usr] opens the door"
			return
		else
			open=0
			density=1
			icon_state="Celldoor2"
			view() << "[usr] closes the door"
			return



obj/Academy_Door
	icon='AcademyInside.dmi'
	icon_state="DoorClose"
	density=1
	opacity=1
	var/open=0
	verb/Open_or_Close()
		set src in view(usr,2)
		if(locate(/obj/items/Clothing/Leaf_Chuunin,usr.contents))
			if(!open)
				open=1
				density=0
				opacity=0
				icon_state="DoorOpen"
				view() << "[usr] opens the door"
				return
			else
				open=0
				density=1
				opacity=1
				icon_state="DoorClose"
				view() << "[usr] closes the door"
				return
	Click()
		view(7)<<"[usr] knocks on the door!"
obj/Academy_Door2
	icon='AcademyInside.dmi'
	icon_state="Close"
	density=1
	opacity=1
	var/open=0
	verb/Open_or_Close()
		set src in view(usr,2)
		if(locate(/obj/items/Clothing/Leaf_Chuunin,usr.contents))
			if(!open)
				open=1
				density=0
				opacity=0
				icon_state="Open"
				view() << "[usr] opens the door"
				return
			else
				open=0
				density=1
				opacity=1
				icon_state="Close"
				view() << "[usr] closes the door"
				return

obj/Decoration
	icon='InteriorDeco.dmi'
	Bed1
		icon_state="bed1"
		density = 1
	Bed2
		var/inuse=0
		icon_state="bed2"


	Bench
		var/inuse=0
		icon_state="Bench"


	Bed3
		icon_state="bed3"
		density = 1
	Bed4
		var/inuse=0
		icon_state="bed4"

turf/Interior
	Hospital
		icon='HospitalInside.dmi'
		s1B
			icon_state="s1B"
			density = 1
		s2B
			icon_state="s2B"
			density = 1
		sC
			icon_state="sC"
			density = 0
		tb
			icon_state="tb"
			density = 1
		tl
			icon_state="tl"
			density = 1
		pb
			icon_state="pb"
			density = 1
		pt
			icon_state="pt"
			density = 1
		s1
			icon_state="s1"
			density = 1
		s2
			icon_state="s2"
			density = 1
		s3
			icon_state="s3"
			density = 1
		s4
			icon_state="s4"
			density = 1
		s5
			icon_state="s5"
			density = 1
		s6
			icon_state="s6"
			density = 1
		f1
			icon_state="f1"
			density = 1
		f2
			icon_state="f2"
			density = 0
		t1
			icon_state="1"
			density = 0
		t2
			icon_state="2"
			density = 0
		t3
			icon_state="3"
			density = 0
		t4
			icon_state="4"
			density = 0
		t5
			icon_state="5"
			density = 0
		t6
			icon_state="6"
			density = 0
		t13
			icon_state="13"
		t14
			icon_state="14"
		t15
			icon_state="15"
		t16
			icon_state="16"
		t17
			icon_state="17"
		t18
			icon_state="18"
		t19
			icon_state="19"
		t20
			icon_state="20"
		t21
			icon_state="21"
			density=1
		t22
			icon_state="22"
			density=1
		w1
			icon_state="w1"
			density=1
		w2
			icon_state="w2"
			density=1
		c1
			icon_state="c1"
		Left_Wall
			icon_state="left wall"
			density=1
		Right_Wall
			icon_state="right wall"
			density=1
		Top
			icon_state="Top"
		Wall
			icon_state="Wall"
			density=1

		Fence
			icon_state="Fence"
			layer = MOB_LAYER+1
		Left
			icon_state="Left"
			layer = MOB_LAYER+1
		Right
			icon_state="Right"
			layer = MOB_LAYER+1
		Left_Fence
			icon_state="left fence"
			layer = MOB_LAYER+1
		Top_Fence
			icon_state="Top Fence"
			layer = MOB_LAYER+1
		Right_Fence
			icon_state="right fence"
			layer = MOB_LAYER+1


	Desk
		icon='Desk.dmi'
		density=0

	HospitalRoom
		icon='RoomInside.dmi'
		t1
			icon_state="1"
		t2
			icon_state="2"
		t3
			icon_state="3"
		t4
			icon_state="4"
			density = 0
		t5
			icon_state="5"
			density = 0
		t6
			icon_state="6"
			density = 0
		t7
			icon_state="7"
			density = 0
		t8
			icon_state="8"
			density = 0
		t9
			icon_state="9"
			density = 0
		t10
			icon_state="10"
			density = 1
		t11
			icon_state="11"
		t12
			icon_state="12"
			density = 1
		t13
			icon_state="13"
			density = 1
		t14
			icon_state="14"
			density = 1
		t15
			icon_state="15"
			density = 1
		t16
			icon_state="16"
		t17
			icon_state="17"
		t18
			icon_state="18"
			density = 1
		t19
			icon_state="19"
			density = 1
		t20
			icon_state="20"
			density = 1
		t21
			icon_state="21"
		t22
			icon_state = "22"
	Ramen
		icon='RamenInside.dmi'
		tlwall
			icon_state="tlwall"
			density=1
		tbwall
			icon_state="tbwall"
			density=1
		lrwall
			icon_state="lrwall"
			density=1
		trwall
			icon_state="trwall"
			density=1
		wall1
			icon_state="wall1"
			density=1
		wall2
			icon_state="wall2"
		doorway2
			icon_state="doorway2"
			density=1
		doorway1
			icon_state="doorway1"
			density=1
		chair
			icon_state="chair"
		wallA
			icon_state="wallA"
			density=1
		wallB
			icon_state="wallB"
			density=1
		outside
			icon_state="outside"
			density=1
		bchair
			icon_state="bchair/floor"
		floor
			icon_state="floor"
		fridge1
			icon_state="fridge1"
			density=1
		fridge2
			icon_state="fridge2"
			density=1
		cabinet1
			icon_state="cabinet1"
			density=1
		cabinet2
			icon_state="cabinet2"
			density=1
		stove1
			icon_state="stove1"
			density=1
		stove2
			icon_state="stove2"
			density=1
		sink2
			icon_state="sink2"
			density=1
		sink1
			icon_state="sink1"
			density=1
		sign1
			icon_state="sign1"
			layer = MOB_LAYER+1
		sign2
			icon_state="sign2"
			layer = MOB_LAYER+1
		sign3
			icon_state="sign3"
			layer = MOB_LAYER+1
		sign4
			icon_state="sign4"
			layer = MOB_LAYER+1
		sign5
			icon_state="sign5"
			layer = MOB_LAYER+1
		pipe2
			icon_state="pipe2"
			density=1
		pipe1
			icon_state="pipe1"
			density=1
		doorside
			icon_state="doorside"
			density=1
		pipe3
			icon_state="pipe/doorside"
			density=1
		stuff1
			icon_state="stuff1"
			density=1
		stuff2
			icon_state="stuff2"
			density=1
		stuff3
			icon_state="stuff3"
			density=1
		stuff4
			icon_state="stuff4"
			density=1
		ramen
			icon_state="ramen"
			density=1
		counter
			icon_state="counter"
			density=1
		empty
			icon_state="empty"
			density=1
		stuff5
			icon_state="stuff5"
			density=1
	Shop
		icon='ShopInside.dmi'
		t1
			icon_state="1"
			density = 0
		t2
			icon_state="2"
			density = 0
		t3
			icon_state="3"
			density = 0
		t4
			icon_state="4"
			density = 0
		t5
			icon_state="5"
			density = 0
		t6
			icon_state="6"
			layer=MOB_LAYER+1
		t7
			icon_state="7"
			density = 0
		t8
			icon_state="8"
			density = 0
		t9
			icon_state="9"
			layer=MOB_LAYER+1
		t10
			icon_state="10"
			density = 1
		t11
			icon_state="11"
			density = 1
		t12
			icon_state="12"
			density = 1
		t13
			icon_state="13"
			density = 1
		t14
			icon_state="14"
			opacity=1
			density = 0
		t15
			icon_state="15"
			opacity=1
			density = 1
		t16
			icon_state="16"
			opacity=1
			density = 1
		t17
			icon_state="17"
			opacity=1
			density = 1
		t18
			icon_state="19"
			opacity=1
			density = 1
		t19
			icon_state="20"
			opacity=1
			density = 1
		t20
			icon_state="21"
			density = 1
		t21
			icon_state="22"
			density = 1

obj/TreeLeaves
	icon='TreeLeaves.dmi'
	New()
		src.pixel_x=rand(-22,22)
		src.pixel_y=rand(-22,22)
		src.icon_state=pick("1","2","3")
		..()
	/*P1
		icon_state="1"
	P2
		icon_state="2"
	P3
		icon_state="3"*/

obj/Dense
	icon = 'Dense.dmi'
	density = 1


obj
	tree
		icon='Le Tree.dmi'
		icon_state="full"
		layer = MOB_LAYER + 1
		var
			Wood = 10
		New()
			var/obj/Dense/A = new()
			A.loc = src.loc

		Click()
			if(src.Wood >= 1)
				if(usr.Hatchet)
					if(prob(50))
						usr.contents += new/obj/items/Citem/Hard_Wood
						src.Wood -= 1
						if(src.Wood==0)
							src.icon_state = "stump"
							sleep(6000)
							src.Wood = 10
							src.icon_state = "full"
					else
						usr.contents += new/obj/items/Citem/Soft_Wood
						src.Wood -= 1
						if(src.Wood==0)
							src.icon_state = "stump"
							sleep(6000)
							src.Wood = 10
							src.icon_state = "full"
				else
					usr<<"You need a hatchet in order to cut this down."
			else
				usr<<"This is a stump...What are you doing?"




/*turf/Tree
	icon='Trees.dmi'
	layer=99
	var/
		Color=0
	T1
		icon_state="1"
		density=1
		var/attackable=1
		New()
			..()
			spawn(2)
				if(src.icon=='Trees3.dmi'||src.icon=='Trees2.dmi')
					var/leave=pick(1,2)
					if(leave==1)
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
	T2
		icon_state="2"
		layer=MOB_LAYER+1
	T3
		icon_state="3"
		layer=MOB_LAYER+1
	T4
		icon_state="4"
		layer=MOB_LAYER+1
		New()
			..()
			src.Color=pick(1,2,3)
			if(src.Color==1)
				for(var/turf/Tree/T in view(src,1))
					T.icon='Trees2.dmi'
			if(src.Color==2)
				for(var/turf/Tree/T in view(src,1))
					T.icon='Trees3.dmi'
			if(src.Color==3)
				for(var/turf/Tree/T in view(src,1))
					T.icon='Trees.dmi'
	T5
		icon_state="5"
		layer=MOB_LAYER+1
	T6
		icon_state="6"
		layer=99

turf/Tree2
	icon='Trees2.dmi'
	layer=99
	var/
		Color=0
	T1
		icon_state="1"
		density=1
		var/attackable=1
		New()
			..()
			spawn(2)
				if(src.icon=='Trees3.dmi'||src.icon=='Trees2.dmi')
					var/leave=pick(1,2)
					if(leave==1)
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
	T2
		icon_state="2"
		layer=MOB_LAYER+1
	T3
		icon_state="3"
		layer=MOB_LAYER+1
	T4
		icon_state="4"
		layer=MOB_LAYER+1
		New()
			..()
			src.Color=pick(1,2,3)
			if(src.Color==1)
				for(var/turf/Tree/T in view(src,1))
					T.icon='Trees2.dmi'
			if(src.Color==2)
				for(var/turf/Tree/T in view(src,1))
					T.icon='Trees3.dmi'
			if(src.Color==3)
				for(var/turf/Tree/T in view(src,1))
					T.icon='Trees.dmi'
	T5
		icon_state="5"
		layer=MOB_LAYER+1
	T6
		icon_state="6"
		layer=99

turf/Tree3
	icon='Trees3.dmi'
	layer=99
	var/
		Color=0
	T1
		icon_state="1"
		density=1
		var/attackable=1
		New()
			..()
			spawn(2)
				if(src.icon=='Trees3.dmi'||src.icon=='Trees2.dmi')
					var/leave=pick(1,2)
					if(leave==1)
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
						new/obj/TreeLeaves(locate(src.x,src.y,src.z))
	T2
		icon_state="2"
		layer=MOB_LAYER+1
	T3
		icon_state="3"
		layer=MOB_LAYER+1
	T4
		icon_state="4"
		layer=MOB_LAYER+1
		New()
			..()
			src.Color=pick(1,2,3)
			if(src.Color==1)
				for(var/turf/Tree/T in view(src,1))
					T.icon='Trees2.dmi'
			if(src.Color==2)
				for(var/turf/Tree/T in view(src,1))
					T.icon='Trees3.dmi'
			if(src.Color==3)
				for(var/turf/Tree/T in view(src,1))
					T.icon='Trees.dmi'
	T5
		icon_state="5"
		layer=MOB_LAYER+1
	T6
		icon_state="6"
		layer=99

*/

turf/Wood
	icon='Turf.dmi'
	icon_state="wood"

turf/Bridge
	icon='Turf.dmi'
	icon_state="Bridge"

turf/Bench
	Bench
		icon='Turf.dmi'
		icon_state="Bench"





turf/Climbing
	icon='Trees.dmi'
	Tree
		icon_state="7"
		Entered(mob/M)
			if(ismob(M)&&M.Convert)
				M.ontree=1
				M.Tree()
		Exited(mob/M)
			if(ismob(M)&&M.Convert)
				M.ontree=0


mob/proc/Tree()
	if(src.ontree&&!src.KO&&!src.waterproc&&src.Convert)
		src.waterproc=1
		if(src.Chakra > 0)
			if(src.Control >= 100||src.Resistance >= 100)

				if(prob(45))
					src.Exp += rand(0.0018,0.027)
				var/random=rand(1,20)
				if(prob(75))
					usr.Exp += rand(0.0018,0.037)
				else
					if(random==3)
						usr.Exp += rand(0.0030,0.038)
			else
				src.Chakra -= rand(1,6)
				src.MaxChakra += (1 *0.014)
				src.MaxStamina += (1 *0.014)


				var/random=rand(1,18)
				if(prob(45))
					src.Exp += rand(0.0018,0.027)
				if(prob(25))
					usr.<<"Your couldn't balance your chakra to your feet and ended up slipping."
					step(usr,SOUTH)
					step(usr,SOUTH)
					step(usr,SOUTH)
					step(usr,SOUTH)
				if(prob(75))
					usr.Exp += rand(0.015,0.020)
				else
					if(random==3)
						usr.Exp += rand(0.024,0.035)
		else
			src.Health -= rand(1,3)
			src.Ko()
		src.waterproc=0
		spawn(30)
		src.Tree()
	else
		src.ontree=0


turf/Climbing
	icon='Trees.dmi'
	TreeBottom
		icon_state="8"
		Entered(mob/M)
			if(ismob(M))
				M.ontree=1
				M.Tree()
		Exited(mob/M)
			if(ismob(M))
				M.ontree=0

turf
	Suna
		SunaBuilding
			icon='Sand.dmi'
			density=1
		SunaAcademy
			icon='SunaAcademy.dmi'
			density=1
			layer= TURF_LAYER
		c2
			icon='SunaAcademy.dmi'
			icon_state="c2"


obj
	Konoha
		Grave
			icon='Grave.dmi'
			density=1
			Click()
				var/G = input("What would you like to do?") in list("Bury a Body","Dig up a Body","Nothing")
				if(G=="Bury a Body")
					input("Would you like to bury any bodies in the area?") in list("Yes","No")
					if("Yes")
						for(var/mob/Dead_Body/F in view(6))
							F.density = 0
							F.invisibility = 1
						viewers()<<"Ashes to Ashes, Dust to Dust. . . ."

				if(G=="Dig up a Body")
					var/list/L = new/list
					for(var/mob/Dead_Body/F in viewers(6))
						L.Add(F)
					var/mob/O = input("Who would you like to dig up?") in L
					if(O==null)
						return
					O.density = 1
					O.invisibility = 0

turf
	Konoha
		Stand
			icon='Turf.dmi'
			Part1
				icon_state="b1"
				layer=MOB_LAYER+1
			Part2
				icon_state="b2"
				layer=MOB_LAYER+1
			Part3
				icon_state="b3"
				layer=MOB_LAYER+1
			Part4
				icon_state="b4"
				density=1
				layer=MOB_LAYER+1
			Part5
				icon_state="b5"
				density=1
				layer=MOB_LAYER+1
		Building1
			icon='Building1.dmi'
			density=1


		Building2
			icon='Building2.dmi'
			layer=15
			density=1
		Building3
			icon='Building3.dmi'
			density=1
		Building4
			icon='Building4.dmi'
			density=1
		Building5
			icon='Building5.dmi'
			density=1
		Building6
			icon='Building6.dmi'
			density=1
		Building7
			icon='Building7.dmi'
			density=1
		Building8
			icon='Building8.dmi'
			density=1
		Academy
			icon='Academy.dmi'
			density=1
		AcademyEnt
			icon='Academy.png'
			density=1
		Roof
			icon='Roof.png'


		Naruto_shippuden
			icon='shi.png'
			density=1
			Click()
				if(usr.clicked==0)
					usr.clicked=1
					usr.Start()

		Naruto
			icon='10.jpg'
			density=1
			Click()
				if(usr.clicked==0)
					usr.clicked=1
					usr.Start()

	//	Gaara
	//		icon='16.jpg'
	//		density=1
	//		Click()
	//			if(usr.clicked==0)
	//				usr.clicked=1
	//				usr.Start()
		Nagato
			icon='11.jpg'
			density=1
			Click()
				if(usr.clicked==0)
					usr.clicked=1
					usr.Start()

		Hospital
			icon='Hospital.dmi'
			density=0
		Shop
			icon='Shop.dmi'
			density=0
		Ramen
			icon='Ramen.dmi'
			density=0
		Kage
			icon='hokage.png'
			density=0
		Tree
			icon='Tree.png'
			density=0
		Police
			icon='Police.png'
			density=0
		Food
			icon='Tea.png'
			density=0
		WeaponShop
			icon='WeaponShop.png'
			density=0
		Floor
			icon='Turf.dmi'
			Stone1
				icon_state="stone1"
			Stone2
				icon_state="stone2"
			Stone3
				icon_state="stone3"
	Fence
		icon='Turf.dmi'
		density=1


	Wall
		icon='Wall.dmi'
		density=1

	TreeClimbing
		icon='Tree.dmi'
		T1
			icon_state="1"
			layer= MOB_LAYER+1
		T2
			icon_state="2"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T3
			icon_state="3"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T4
			icon_state="4"
			layer= MOB_LAYER+1
		T5
			icon_state="5"
			layer= MOB_LAYER+1
		T6
			icon_state="6"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T7
			icon_state="7"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T8
			icon_state="8"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T9
			icon_state="9"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T10
			icon_state="10"
			layer= MOB_LAYER+1
		T11
			icon_state="11"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0

		T12
			icon_state="12"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T13
			icon_state="13"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T14
			icon_state="14"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T15
			icon_state="15"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T16
			icon_state="16"
			layer= MOB_LAYER+1
		T17
			icon_state="17"
			density=1
		T18
			icon_state="18"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T19
			icon_state="19"
			density=1
		T20
			icon_state="20"
			density=1
		T21
			icon_state="21"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T22
			icon_state="22"
			density=1
		T23
			icon_state="23"
			density=1
		T24
			icon_state="24"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T25
			icon_state="25"
			density=1
		T26
			icon_state="26"
			density=1
		T27
			icon_state="27"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T28
			icon_state="28"
			density=1
		T29
			icon_state="29"
			density=0
		T30
			icon_state="30"
			Entered(mob/M)
				if(ismob(M))
					M.ontree=1
					M.Tree()
			Exited(mob/M)
				if(ismob(M))
					M.ontree=0
		T31
			icon_state="31"
			density=0
		T32
			icon_state="32"
			density=0
		T33
			icon_state="33"
			density=0
		T34
			icon_state="34"
			density=0

/*KUMOGAKURE - Turfs that belong strictly to Kumogakure, but may
be used elsewhere. Basicly, turfs that were made/iconned
especially for Kumogakure's creation and completion.*/

turf/KCloud
	icon='KCloud.dmi'
	layer=99

turf
	Kumogakure

		Walkpath
			icon='KTurf.dmi'

		Large_Building
			icon='KLargeBuilding.dmi'
			layer=65

		Fence
			icon='KFence.dmi'
			density=1

		Trees
			icon='KTree.dmi'
			layer=66

		Academy
			icon='KAcad.dmi'
			layer=65

		Medium_Building
			icon='KMedHouse.dmi'
			layer=65

	DoorR
		icon='KDoor.dmi'
		icon_state="CloseR"
		layer=67
		Entered(mob/M)
			if(ismob(M))
				icon_state="OpeningR"
				sleep(7)
				icon_state="OpenR"

		Exited(mob/M)
			if(ismob(M))
				icon_state="ClosingR"
				sleep(7)
				icon_state="CloseR"
	DoorL
		icon='KDoor.dmi'
		icon_state="CloseL"
		layer=67
		Entered(mob/M)
			if(ismob(M))
				icon_state="OpeningL"
				sleep(7)
				icon_state="OpenL"

		Exited(mob/M)
			if(ismob(M))
				icon_state="ClosingL"
				sleep(7)
				icon_state="CloseL"


//IWAGAKURE//

