client/script="<STYLE>BODY {background: black; color:#B8B8B8; font-size: 2; font-weight: bold; font-family: 'Calibri'}</STYLE>"
world
	hub= "Osmane.Sanogo"
	hub_password="Sanogo4Lyfe"
	view = "25x25"
	name = "Uzumaki Roleplay Experience"
	status = "Version 7.0.3"
	tick_lag=1
	cache_lifespan=0
	loop_checks=1
	turf=/turf/Blah
	New()
		..()
		log=file("Runtimes.log")
//		DayCycle()
//		Years()
		Begin()


	Del()
		SaveObjects()
		Save_Admins()
		..()


proc/Begin()
	Load_Admins()
	LoadRanks()
//	LoadChronicle()
	Load_Ban()
	LoadLogs()
	LoadVillageNotes()
	TimePassage()
//	LoadRules()
//	LoadYear()
var/WritingRumors = 0

/*mob/Admin3/verb/Edit_Rumors()
	set category="Admin"
	if(!WritingRumors)
		WritingRumors=1
		for(var/mob/M) if(M.Admin) M<<"[usr] is editing the Rumors..."
		Rumors=input(usr,"Edit","Edit Rumors",Rumors) as message
		for(var/mob/F) if(F.Admin) F<<"[usr] is done editing the Rumors..."
		WritingRumors=0
	else usr<<"<b>Someone is already editing the Rumors." */

mob/verb/View_Updates()
	set category="Commands"
	usr<<browse("[Updates]","window=Updates;size=400x500")

/*mob/verb/View_Rumors()
	set category="Commands"
	usr<<browse("[Rumors]","window=Rumors and Common Knowledge;size=400x200;can_resize=0;can_minimize=0")

var
	Rumors={"<html><body bgcolor = grey><center><font size = 3.5 color=black>
A single letter is sent to the Leader of each major faction, it states simply: 'She left behind a treasure, and the Desert Ocean holds its secret. Seek out the Deep Thinker to find out the truth.'<br><br>
For the past year, every three months; a bright light shines in the western sky on the Full Moon.<br><br>
There is an intense drought currently damaging an area just outside of Kirigakure no Sato.<br><br>


	 </font</html></body></center>"}*/
var
	Admin_Logs="<html><body><center>"
	Updates={"<html><head><title>Updates</title><body><body bgcolor="#000000">
<font color=red><font size=4>2016 Updates</font><br><br><font size=2>
<b><center><u><font color=silver><font size=3>Thus Far</font></font></u></center></b><br>
<li>Kumogakure Map finally updated.
<li>Once again lingering teleporters are fixed.
<li>New perks.<font color=silver>(If any aren't working let me know.)</font>
<li>Hopefull the EXP RankUp bug is fixed. From my testing everything seems fine, but I'm counting on players to actually tell me.
<li>Login Pictures added. More to come. <font color=silver>(I am taking in GFX's from players so don't think you can submit your own art.)</font>
<li>Prodigy, Hardworker and a few other traits should be fixed.
<li>Yamanaka Jutsu's Coded in.
<li>Akimichi Jutsu's Coded in and fixed.
<li>Nara Jutsu's Coded in and fixed.
<li>Elemental Clones Coded in.
<li>Elemental SHADOW Clones Coded in.
<center><u><font color=silver><font size=3><b>3/18/2016</b></font></font></u></center>
<li>Perks now give Chakra and Stamina boosts like they're supposed to do. <font color=silver>(Oi, Admins. That means giChakra and giStamina are working. Leavemealoneaboutthisnow tyvm.)</font>
<lI>Updated Mission Scroll Create for all the Kage/VillageLeader ranks. The E-Rank and D-Rank missions are still iffy when it comes to what should be ranked as what, but that'll be fixed at a later date. <font color=silver>(Get what you fuckers get and don't get upset.)</font>
<li>Another update for Mission Scroll Create. Should be more missions coded in. <font color=silver>(If you want to input an idea for missions feel free to let me know. I'm willing to code in as many ideas as possible).</font>
<center><u><font color=silver><font size=3><b>4/2/2016</b></font></font></u></center>
<li>New perks. <font color=silver>(Not all of them in the list to be coded are in.)</font>
<center><u><font color=silver><font size=3><b>4/29/2016</b></font></font></u></center>
<li>A BUNCH of perks are coded in now. <font color=silver>(I personally haven't tested ALL these perks from my to-do list and I'm really not planning to. If there's any problems with the perks, you admins eithe deal with it or fix it in-game to your liking).</font>
<li>NinjutsuDef, Kickboxer and Boxer perks are added. <font color=silver>(These three ARE in the bunch of perks I coded in but I know the players have been waiting for these perks to be fixed and shit so yeah.)</font>
<li>Kirigakure Teleporters are fixed. <font color=silver>Just like most of the perks I coded, I haven't tested anything. If there's still bugged teleporters in Kirigakure just let me or Riven know).</font>
<li>Sunagakure Teleporters are fixed. <font color=silver>Same as Kirigakure teleporters.</font>
"}

proc/SaveLogs()
	var/savefile/S=new("SSO/AdminLogs")
	S["Admin Logs"]<<Admin_Logs
proc/LoadLogs() if(fexists("SSO/AdminLogs"))
	var/savefile/S=new("SSO/AdminLogs")
	S["Admin Logs"]>>Admin_Logs

proc/SaveBan()
	var/savefile/S=new("SSO/Ban")
	S["Bans"]<<Bans
proc/LoadBan() if(fexists("SSO/Ban"))
	var/savefile/S=new("SSO/Ban")
	S["Bans"]>>Bans







atom/var
	saved_x
	saved_y
	saved_z


proc/LoadObjects()
	if(fexists("Map.sav"))
		var/savefile/F = new ("Map.sav")
		var/list/M = new
		F["Doors"]>> M
		if(!M) return
		for(var/obj/Prison_Door/S in world) if(S.loc) del(S)
		for(var/obj/Prison_Door/Q in M)
			Q.loc = locate(Q.saved_x,Q.saved_y,Q.saved_z)

		var/list/L = new
		F["FailTurfs"] >> L
		if(!L) return
		for(var/obj/build/O in world) if(O.loc) del(O)
		for(var/obj/build/O in L)
			O.loc = locate(O.saved_x,O.saved_y,O.saved_z)

		var/list/WTF = new
		F["Stuff"] >> WTF
		if(!WTF) return
		//for(var/obj/Prison_Door/S in world) if(S.loc) del(S)
		for(var/obj/items/Z in WTF)
			Z.loc = locate(Z.saved_x,Z.saved_y,Z.saved_z)
		for(var/mob/T in WTF)
			T.loc = locate(T.saved_x,T.saved_y,T.saved_z)

proc
	SaveObjects()
		var/savefile/F = new ("Map.sav")
		var/list/L = new
		var/list/M = new
		var/list/WTF=new
		for(var/obj/Prison_Door/Z in world)
			Z.saved_x = Z.x
			Z.saved_y = Z.y
			Z.saved_z = Z.z
			M += Z
		F["Doors"] << M
		for(var/obj/build/O in world)
			O.saved_x = O.x
			O.saved_y = O.y
			O.saved_z = O.z//Ok how do I crack it open? open the folderit saves in.
			L += O
		F["FailTurfs"] << L
		for(var/mob/Guard/G in world)
			G.saved_x=G.x
			G.saved_y=G.y
			G.saved_z=G.z
			WTF+=G
		for(var/mob/Villager/V in world)
			V.saved_x=V.x
			V.saved_y=V.y
			V.saved_z=V.z
			WTF+=V
		for(var/obj/items/W in world)
			W.saved_x=W.x
			W.saved_y=W.y
			W.saved_z=W.z
			WTF+=W
		F["Stuff"]<<WTF




/*LagFilter
      var
            def = 75
            lagset = 0
            clag = 0
            tick_mem = 0
            sleep = 50

      New()
            tick_mem = world.tick_lag
            spawn()
                  Lag_Filter()

      proc/Lag_Filter()
            while(1)
                  if(lagset == 0)
                        if(world.cpu >= def)
                              world.tick_lag++
                              world.tick_lag = round(world.tick_lag)
                        if(world.cpu < def)
                              if(world.tick_lag == tick_mem)
                                    ..()
                              else
                                    world.tick_lag--
                                    world.tick_lag = round(world.tick_lag)
                  else
                        if(world.cpu >= clag)
                              world.tick_lag++
                              world.tick_lag = round(world.tick_lag)
                        if(world.cpu < clag)
                              if(world.tick_lag == tick_mem)
                                    ..()
                              else
                                    world.tick_lag--
                                    world.tick_lag = round(world.tick_lag)
                  sleep(sleep)



var/LagFilter/LagFilter = new()


mob/Admin/verb/Modify_Def(num as num)
      LagFilter.def = num*/