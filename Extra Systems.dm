var/Suggestions="<body bgcolor=black>"
mob/verb/Post_Suggestion(msg as message)
	if(lentext(msg)>50000)
		usr<<"Far too Long!"
		return
	if(lentext(msg)<5)
		usr<<"Far too Short!"
		return
	Suggestions+="<font color=[usr.OOCFont]>[usr]([displaykey]): <font color=white>[msg]<br>"
	for(var/mob/M in world)
		if(M.Admin)
			M<<"[usr] has posted a <a href=?src=\ref[src];action=readsuggestion>Suggestion</a>!"

mob/Admin3/verb
	View_Suggestion()
		set category="Admin"
		usr<<browse(Suggestions,"window=Suggestions;size=500x350")

turf/nature/FishDirt
	icon='Turf.dmi';icon_state="dirtz"

obj/nature/WaterOpac
	icon='Turf.dmi';icon_state="wateropac";layer=1000;screen_loc="SOUTHWEST TO NORTHEAST"

mob/Fish/Fish1
	icon='fishing.dmi';icon_state="1";name="Fish";layer=2000;density=1;var/value=1
	New()
		..()
		spawn(8)
			src.Wanderz()
	proc/Wanderz()
		while(src)
			sleep(8);step_rand(src)
mob/Fish/Fish2
	icon='fishing.dmi';icon_state="2";name="Fish";layer=2000;density=1;var/value=2
	New()
		..()
		spawn(8)
			src.Wanderz()
	proc/Wanderz()
		while(src)
			sleep(8);step_rand(src)
mob/Fish/Fish3
	icon='fishing.dmi';icon_state="3";name="Fish";layer=2000;density=1;var/value=3
	New()
		..()
		spawn(3)
			src.Wanderz()
	proc/Wanderz()
		while(src)
			sleep(3);step_rand(src)
mob/Fish/Fish4
	icon='fishing.dmi';icon_state="4";name="Fish";layer=2000;density=1;var/value=4
	New()
		..()
		spawn(3)
			src.Wanderz()
	proc/Wanderz()
		while(src)
			sleep(3);step_rand(src)

mob/var/dead=0
mob/Move(loc,dir)
	if(src.dead==1)
		return 0
	else ..()

obj/items/Fish
	icon='fishing.dmi';icon_state="1";name="Fish"
	DblClick()
		usr<<"<font color=blue>You eat the fish!"
		usr.Hunger-=2
		del(src)
mob/Bump(atom/M)
	if(istype(M,/mob/Fish))
		if(prob(40))
			usr<<"<font color=blue>You have caught a fish!"
			var/obj/items/Fish/F=new
			F.icon_state="[M:value]"
			usr.contents+=F
			del(M)
		else
			usr<<"<font color=blue>The fish slips from your grasp!"
			return

world/New()
	Fish()
proc/Fish()
	world.Repop()
	sleep(10000)
	Fish()

mob/proc
	UpdateBreath()
		while(src.swimming)
			winset(src,"World.BreathBar","value=[round((src.Breath/100)*100)]")
			sleep(1)

mob/var/swimming=0
mob/var/Breath=100
mob/swim/verb/Dive()
	usr.overlays -= 'Swim.dmi'
	winset(usr,"default.BreathLabel","is-visible=true")
	winset(usr,"default.BreathBar","is-visible=true")
	usr.verbs-=/mob/swim/verb/Dive
	usr.verbs+=/mob/swim/verb/Swim_Up
	usr.oldx=usr.x
	usr.oldy=usr.y
	usr.oldz=usr.z
	usr.swimming=1
	usr.client.screen+=new/obj/nature/WaterOpac
	if(usr.Village=="Konoha")
		usr.loc=locate(246,160,5)
	if(usr.Village=="Kirigakure")
		usr.loc=locate(285,180,5)
	if(usr.Village=="Sunagakure")
		usr.loc=locate(188,90,5)
	else
		usr.loc=locate(240, 120, 5)
	usr.Swim()

mob/proc/Swim()
	while(usr.swimming)
		spawn()usr.UpdateBreath()
		if(usr.Breath<=0)
			if(usr.Health<=0)
				for(var/obj/nature/WaterOpac/W in usr.client.screen)
					usr.client.screen-=W
				usr.loc=locate(usr.oldx,usr.oldy,usr.oldz)
				usr.swimming=0
				usr.Breath=100
				usr.verbs-=/mob/swim/verb/Dive
				usr.verbs-=/mob/swim/verb/Swim_Up
				usr.Ko()
			usr.Breath=0
			usr.Health-=5
			sleep(2)
		usr.Breath-=3
		sleep(10)
mob/var
	oldx
	oldy
	oldz
mob/swim/verb/Swim_Up()
	usr.overlays += 'Swim.dmi'
	winset(usr,"default.BreathLabel","is-visible=false")
	winset(usr,"default.BreathBar","is-visible=false")
	usr.swimming=0
	usr.Breath=100
	for(var/obj/nature/WaterOpac/W in usr.client.screen)
		usr.client.screen-=W
	usr.verbs-=/mob/swim/verb/Dive
	usr.verbs-=/mob/swim/verb/Swim_Up
	usr.loc=locate(usr.oldx,usr.oldy,usr.oldz)

								//////////////////////////////////////////////////////////////////////
								//////////////////////////////////////////////////////////////////////
								//////////////////////////////////////////////////////////////////////
								///////////////////////                        ///////////////////////
								/////////////////////// Village Enable/Disable ///////////////////////
								///////////////////////                        ///////////////////////
								//////////////////////////////////////////////////////////////////////
								//////////////////////////////////////////////////////////////////////
								//////////////////////////////////////////////////////////////////////


var/kono="Enabled"
var/suna="Enabled"
var/kiri="Enabled"
var/iwa="Enabled"
var/kumo="Enabled"
var/ame="Enabled"
/*
SeElCh = 20
TerElCh = 10
QuaElCh = 5
QuiElCh = 1
ClanProb = 1
*/
mob/Admin3/verb/Toggle_Clan_Probability()
	set category = "Admin"
	var/choice=input("What will you change the clan probability to?")as num
	if(choice > 0)
		ClanProb = choice
	else
		ClanProb = 1
	Admin_Logs+="<br>[usr]([usr.key]) has changed the clan probability to [choice]."
	SaveLogs()
mob/Admin3/verb/Toggle_Element_Probablities()
	set category = "Admin"
	var/choice=input("Which elements probability will you change?")in list("Secondary","Tertiary","Quadranary","Quinary")
	if(choice=="Secondary")
		var/Sec=input("What will you set the Secondary Element Probability to?") as num
		SeElCh = Sec
		Admin_Logs+="<br>[usr]([usr.key]) has changed the Secondary Element Probability to [Sec]."
		SaveLogs()
	if(choice=="Tertiary")
		var/Tert=input("What will you set the Tertiary Element Probability to?") as num
		TerElCh = Tert
		Admin_Logs+="<br>[usr]([usr.key]) has changed the Tertiary Element Probability to [Tert]."
		SaveLogs()
	if(choice=="Quadranary")
		var/Qua=input("What will you set the Quadranary Element Probability to?") as num
		QuaElCh = Qua
		Admin_Logs+="<br>[usr]([usr.key]) has changed teh Quadranary Element Probability to [Qua]."
		SaveLogs()
	if(choice=="Quinary")
		var/Qui=input("What will you set the Quinary Element Probability to?") as num
		QuiElCh = Qui
		Admin_Logs+="<br>[usr]([usr.key]) has changed the Quinary Element Probability to [Qui]."
		SaveLogs()

mob/Admin3/verb/Toggle_Village()
	set category="Admin"
	var/choice=input("Kono=[kono] *|* Suna=[suna] *|* Kiri=[kiri] *|* Iwa=[iwa] *|* Kumo=[kumo] *|* Ame=[ame]")in list("Enable","Disable")
	if(choice=="Enable")
		var/village=input("Enable what village?")in list("Konoha","Sunagakure","Kirigakure","Amegakure","Kumogakure")
		if(village=="Konoha")
			kono="Enabled"
			world<<"<font color=red>Server Information:<font color=yellow> Konoha enabled!"
		if(village=="Sunagakure")
			suna="Enabled"
			world<<"<font color=red>Server Information:<font color=yellow> Sunagakure enabled!"
		if(village=="Kirigakure")
			kiri="Enabled"
			world<<"<font color=red>Server Information:<font color=yellow> Kirigakure enabled!"
		if(village=="Kumogakure")
			ame="Enabled"
			world<<"<font color=red>Server Information:<font color=yellow> Kumogakure enabled!"
		if(village=="Amegakure")
			kumo="Enabled"
			world<<"<font color=red>Server Information:<font color=yellow> Amegakure enabled!"
	if(choice=="Disable")
		var/village=input("Disable what village?")in list("Konoha","Sunagakure","Kirigakure","Amegakure","Kumogakure")
		if(village=="Konoha")
			kono="Disabled"
			world<<"<font color=red>Server Information:<font color=yellow> Konoha Disabled!"
		if(village=="Sunagakure")
			suna="Disabled"
			world<<"<font color=red>Server Information:<font color=yellow> Sunagakure Disabled!"
		if(village=="Kirigakure")
			kiri="Disabled"
			world<<"<font color=red>Server Information:<font color=yellow> Kirigakure Disabled!"
		if(village=="Amegakure")
			ame="Disabled"
			world<<"<font color=red>Server Information:<font color=yellow> Amegakure Disabled!"
		if(village=="Kumogakure")
			kumo="Disabled"
			world<<"<font color=red>Server Information:<font color=yellow> Kumogakure Disabled!"