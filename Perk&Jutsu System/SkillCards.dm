mob/var/Tsuiga
obj/SkillCard/Jutsu
	var
		icon/Jutsuicon
		icon/JutsuiconTrail
		Damage
		Mob
		Name
		Emote
		JutsuType
		Chakracost
		Projectile
		Controlled_Projectile
		Gaint_Transform
		tmp/Transforming
		Henge
		Flood
		Paralyze
		Area_Jutsu
		Area=1
		removeoverlays
		Wall
		AllowedOneMob
		skill=1
		PowerJutsu
		Chakra=1
		Stamina=1
		Strength=1
		Agility=1
		Offence=1
		Defense=1
		Control=1
		Resistance=1
		Taijutsu=1
		Ninjutsu=1
		Genjutsu=1
		Tsuiga=0

	Click()
		if(src in usr.contents)
			switch(JutsuType)
				if("Projectile") Projectile()
				if("Controlled Projectile") Controlled_Projectile()
				if("Paralyze") Paralyze()
				if("Wall") Wall()
				if("Area Jutsu") Area_Jutsu()
				if("Giant Transform") Transform()
				if("Mob") Mob()
				if("Flood") Flood()
				if("PowerJutsu") Power()
				if("Henge") Henge()
	proc
		Projectile()
			if(src.Active)
				return
			if(usr.Chakra<Chakracost)
				usr << "Your Chakra is too low to perform [Name]!"
				return
			var/obj/SkillCardProjectile/x = new (usr.loc)
			x.icon = Jutsuicon
			x.JutsuiconTrail = JutsuiconTrail
			usr.Chakra-=Chakracost
			usr.MaxNinjutsu += (1 *0.001)
			x.damage = rand(50,100)/5+skill
			x.dir = usr.dir
			walk(x,usr.dir)
			viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: [Name]!"
			viewers(16) << "<font color=[usr.SayFont]>[usr] [Emote]"
			src.Active=1
			sleep(45)
			src.Active=0


		Controlled_Projectile()
			if(usr.Chakra<Chakracost)
				usr << "Your Chakra is too low to perform [Name]!"
				return
			if(!src.Active)
				var/obj/SkillCardProjectile/x = new (usr.loc)
				x.icon = Jutsuicon
				x.JutsuiconTrail = JutsuiconTrail
				usr.Chakra-=Chakracost
				usr.MaxNinjutsu += (1 *0.001)
				x.damage = rand(50,100)/5+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: [Name]!"
				viewers(16) << "<font color=[usr.SayFont]>[usr] [Emote]"

				x.loc=usr.loc
				x.dir = usr.dir
				usr.controlled=x
				sleep(20*skill)
				usr.controlled=null
				walk(x,x.dir)
				spawn(45)
				usr.firing=0
				src.Active=0
			else
				usr.controlled=null
				usr.firing=0

		Flood()
			if(src.Active)
				return
			if(usr.Chakra<Chakracost)
				usr << "Your Chakra is too low to perform [Name]!"
				return
			var/obj/SkillCardProjectile/A = new
			var/obj/SkillCardProjectile/B = new
			var/obj/SkillCardProjectile/C = new
			var/obj/SkillCardProjectile/D = new
			A.icon = Jutsuicon
			B.icon = Jutsuicon
			C.icon = Jutsuicon
			D.icon = Jutsuicon
			A.JutsuiconTrail = JutsuiconTrail
			B.JutsuiconTrail = JutsuiconTrail
			C.JutsuiconTrail = JutsuiconTrail
			D.JutsuiconTrail = JutsuiconTrail
			usr.Chakra-=Chakracost
			usr.MaxNinjutsu += (1 *0.001)
			A.damage = rand(55,100)/5+skill
			B.damage = rand(50,100)/5+skill
			C.damage = rand(50,100)/5+skill
			D.damage = rand(55,100)/5+skill
			viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: [Name]!"
			viewers(16) << "<font color=[usr.SayFont]>[usr] [Emote]"

			if(usr.dir==NORTH)
				A.loc=usr.loc
				B.loc=locate(usr.x-1,usr.y,usr.z)
				C.loc=locate(usr.x+1,usr.y,usr.z)
				D.loc=locate(usr.x+2,usr.y,usr.z)
			if(usr.dir==SOUTH)
				A.loc=usr.loc
				B.loc=locate(usr.x-1,usr.y,usr.z)
				C.loc=locate(usr.x+1,usr.y,usr.z)
				D.loc=locate(usr.x+2,usr.y,usr.z)
			if(usr.dir==EAST)
				A.loc=locate(usr.x,usr.y+1,usr.z)
				B.loc=usr.loc
				C.loc=locate(usr.x,usr.y-1,usr.z)
				D.loc=locate(usr.x,usr.y+2,usr.z)
			if(usr.dir==WEST)
				A.loc=locate(usr.x,usr.y+1,usr.z)
				B.loc=usr.loc
				C.loc=locate(usr.x,usr.y-1,usr.z)
				D.loc=locate(usr.x,usr.y+2,usr.z)

			A.dir = usr.dir
			B.dir = usr.dir
			C.dir = usr.dir
			D.dir = usr.dir
			walk(A,usr.dir)
			walk(B,usr.dir)
			walk(C,usr.dir)
			walk(D,usr.dir)
			src.Active=1
			sleep(150)
			src.Active=0

		Paralyze()
			if(src in usr.contents)
				if(usr.move)
					if(src.Active)
						return
					if(usr.Chakra<Chakracost)
						usr << "Your Chakra is too low to perform [Name]!"
						return
					usr.Chakra-=Chakracost
					var/list/V = new/list
					for(var/mob/M in oview())
						V.Add(M)
					var/mob/A=input("Who would you like to use [Name] on?") in V
					if(A.KO)
						return
					if(A==null)
						return
					if(A.Ninjutsu+A.Resistance<usr.Ninjutsu+usr.Control)
						A.move=0
						A.icon_state=""
						A.dir=SOUTH
						usr.Tsuiga=1
						A.overlays += Jutsuicon
						viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: [Name]!"
						viewers(16) << "<font color=[usr.SayFont]>[usr] [Emote]"
						usr.MaxNinjutsu += (1 *0.01)
						src.Active=1
						sleep(rand(200,400))
						A.move=1
						A.overlays -= Jutsuicon

						src.Active=0
					else
						usr << "[A] dodged your [Name]!"


		Wall()
			if(usr.Chakra<Chakracost)
				usr << "Your Chakra is too low to perform [Name]!"
				return
			var/obj/SkillCardWall/x = new (usr.loc)
			x.icon = Jutsuicon
			usr.Chakra-=Chakracost
			usr.MaxNinjutsu += (1 *0.001)
			if(usr.dir==NORTH)
				x.loc = locate(usr.x,usr.y+1,usr.z)
			if(usr.dir==EAST)
				x.loc = locate(usr.x+1,usr.y,usr.z)
			if(usr.dir==SOUTH)
				x.loc = locate(usr.x,usr.y-1,usr.z)
			if(usr.dir==WEST)
				x.loc = locate(usr.x-1,usr.y,usr.z)
			viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: [Name]!"
			viewers(16) << "<font color=[usr.SayFont]>[usr] [Emote]"
			src.Active=1
			sleep(300)
			del(x)
			src.Active=0

		Mob()
			for(var/mob/SkillCardMob/D in world)
				if(src.AllowedOneMob)
					if(D.Owner == usr.key)
						usr << "You may only summon one [Name] at a time."
						return
			if(usr.Chakra<Chakracost)
				usr << "Your Chakra is too low to perform [Name]!"
				return
			var/mob/SkillCardMob/x = new (usr.loc)
			x.name = src.Name
			x.icon = Jutsuicon
			x.Owner = usr.key
			usr.Chakra-=Chakracost
			x.Chakra=usr.Chakra/4
			x.MaxChakra=usr.MaxChakra/4
			x.Strength=usr.Strength/4
			x.Agility=usr.Agility/3
			x.Defense=usr.Defense/4
			x.Offence=usr.Offence*1.25
			x.Control=usr.Control/3
			x.Resistance=usr.Resistance/3
			x.Ninjutsu=usr.Ninjutsu/2
			x.Genjutsu=usr.Genjutsu/3
			x.Taijutsu = usr.Taijutsu*1.25
			x.Health=100
			x.MaxHealth=100
			x.attackable=1
			viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: [Name]!"
			viewers(16) << "<font color=[usr.SayFont]>[usr] [Emote]"

		Power()
			if(usr.Chakra<Chakracost)
				usr << "Your Chakra is too low to perform [Name]!"
				return
			if(!src.Active)
				usr.MaxTaijutsu += (1 *0.001)
				usr.Chakra-=Chakracost
				usr.Chakra *= Chakra
				usr.Stamina *= Stamina
				usr.Strength *= Strength
				usr.Agility *= Agility
				usr.Offence *= Offence
				usr.Defense *= Defense
				usr.Control *= Control
				usr.Resistance *= Resistance
				usr.Taijutsu *= Taijutsu
				usr.Ninjutsu *= Ninjutsu
				usr.Genjutsu *= Genjutsu
				usr.overlays += Jutsuicon
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: [Name]!"
				viewers(16) << "<font color=[usr.SayFont]>[usr] [Emote]"
				src.Active=1
			else
				usr.Chakra = usr.MaxChakra
				usr.Stamina = usr.MaxStamina
				usr.Strength = usr.MaxStrength
				usr.Agility = usr.MaxAgility
				usr.Offence = usr.MaxOffence
				usr.Defense = usr.MaxDefense
				usr.Control = usr.MaxControl
				usr.Resistance = usr.MaxResistance
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Ninjutsu = usr.MaxNinjutsu
				usr.Genjutsu = usr.MaxGenjutsu
				usr.overlays -= Jutsuicon
				src.Active=0
		Henge()
			if(usr.Chakra<Chakracost)
				usr << "Your Chakra is too low to perform [Name]!"
				return
			if(!src.Active)
				if(src.removeoverlays)
					usr.overlays=null
				usr.Chakra-=Chakracost
				usr.icon = Jutsuicon
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: [Name]!"
				viewers(16) << "<font color=[usr.SayFont]>[usr] [Emote]"
				src.Active=1
			else
				usr.icon = usr.Oicon
				src.Active=0
				if(src.removeoverlays)
					usr.overlays += usr.hair

		Transform()
			if(usr.Chakra<Chakracost)
				usr << "Your Chakra is too low to perform [Name]!"
				return
			if(!src.Active&&!src.Transforming)
				src.Transforming=1
				spawn(20) src.Transforming=0
				usr.Taijutsu*=skill
				usr.Chakra-=Chakracost
				usr.MaxNinjutsu += (1 *0.001)
				src.Active=1
				usr.icon=null
				usr.overlays = null
				var/scale=128
				var/xtiles=(scale*0.03125)
				var/ytiles=xtiles
				var/disposition=80
				scale=128
				xtiles=(scale*0.03125)
				ytiles=xtiles
				disposition=80
				var/icon/I=new(src.Jutsuicon)
				I.Scale(scale,scale)
				while(ytiles>0)
					sleep(1)
					usr.overlays+=image(icon=I,icon_state="[xtiles-1],[ytiles-1]",pixel_x=(xtiles*32)-disposition,pixel_y=(ytiles*32)-disposition)
					xtiles-=1
					if(!xtiles)
						ytiles-=1
						xtiles=(scale*0.03125)
			else
				usr.overlays = null
				for(var/obj/items/Clothing/C in usr.contents)
					if(C.worn)
						usr.overlays += C.icon
				usr.overlays += usr.hair
				usr.Taijutsu = usr.MaxTaijutsu
				src.Active=0
				usr.icon=usr.Oicon

		Area_Jutsu()
			if(src.Active&&usr.firing)
				return
			if(usr.Chakra<Chakracost)
				usr << "Your Chakra is too low to perform [Name]!"
				return
			src.Active=1
			usr.firing=1
			usr.MaxNinjutsu += (1 *0.001)
			usr.Chakra-=Chakracost
			var/obj/SkillCardArea/A = new
			viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: [Name]!"
			viewers(16) << "<font color=[usr.SayFont]>[usr] [Emote]"

			if(usr.dir==NORTH)
				A.loc = locate(usr.x,usr.y+1,usr.z)
				A.dir = usr.dir
			if(usr.dir==SOUTH)
				A.loc = locate(usr.x,usr.y-1,usr.z)
				A.dir = usr.dir
			if(usr.dir==EAST)
				A.loc = locate(usr.x+1,usr.y,usr.z)
				A.dir = usr.dir
			if(usr.dir==WEST)
				A.loc = locate(usr.x-1,usr.y,usr.z)
				A.dir = usr.dir
			for(var/mob/M in oview(src.Area,usr))
				if(A)
					if(M.loc==A.loc)
						var/damage= rand(60,100)/5+skill
						M.Health -= damage
						M.Ko()

			spawn(45)
			usr.firing=0
			src.Active=0
			usr.move=0
			sleep(30)
			usr.move=1




obj/SkillCardArea
	density = 1
	layer = MOB_LAYER+1
	New()
		spawn(70)
		del src

obj/SkillCardProjectile
	density = 1
	var/JutsuiconTrail
	var/damage
	New()
		spawn(150)
		del src
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				M.Health -= damage
				M.Ko()
				del(src)
		if(istype(M,/turf))
			if(M.density)
				del(src)
		if(istype(M,/obj))
			if(M.density)
				del(src)
	Move()
		var/obj/SkillCardTrail/A = new
		A.icon = src.JutsuiconTrail
		A.loc = src.loc
		A.dir = src.dir
		..()

obj/SkillCardTrail
	layer=MOB_LAYER+1
	New()
		spawn(150)
		del src

obj/SkillCardWall
	density = 1
	New()
		flick("Rise",src)
		spawn(500)
		del src


mob/SkillCardMob/MouseDrag()
	if(src.displaykey==usr.key)
		mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)
mob/SkillCardMob/New()
	..()
	mouse_drag_pointer=icon(src.icon,src.icon_state,src.dir)


mob/SkillCardMob/MouseDrop(o_o,s_l,o_l) //make it so if an object has been dragged to someplace...
	if(src.Owner == usr.key)
		if(isturf(o_l)) //making sure it was dropped on the map, and not in a statpanel or off the map
			walk_towards(src,o_l)

mob/SkillCardMob

mob/SkillCardMob
	var/function
	var/Owner = null
	New()
		..()
	Click()
		if(Owner==usr.key)
			var/list/Choices=new/list
			Choices.Add("Attack Target")
			Choices.Add("Follow")
			Choices.Add("Stay")
			Choices.Add("Unsummon")
			Choices.Add("Cancel")
			switch(input("Choose Option","",text) in Choices)
				if("Unsummon")
					flick('Smoke.dmi',src)
					del(src)
				if("Follow")
					function=1
					spawn while(function==1)
						sleep(5)
						if(prob(5)) step_rand(src)
						else step_towards(src,usr)
				if("Stay") function=2
				if("Attack Target")
					function=3
					var/mob/list/Targets=new/list
					for(var/mob/M in oviewers(12)) Targets.Add(M)
					var/mob/Choice=input("Attack who?") in Targets
					for(var/mob/M in oviewers(12)) if(Choice==M)
						spawn while(function==3)
							sleep(20)
							if(prob(5)) step_rand(src)
							else step_towards(src,M)
							BunshinAttack()