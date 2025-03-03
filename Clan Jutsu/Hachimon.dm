mob/var/Hachimon=0





obj/Taijutsu/First_Gate:_Gate_of_Opening
	icon='Skillcard.dmi'
	icon_state="Hachimon 1"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<100)
					return
				usr.Hachimon=1
				usr.Stamina-=100
				usr.MaxChakra*=1.25
				usr.Taijutsu *= 1.25
				usr.Defense/=1.15
				usr.Offence *=1.7
				usr.Agility*=1.5
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body releases the brains restraints allowing full power usage of the body's muscles.<font color = white>*)"
				src.Active=1
			else
				usr.Hachimon=0
				usr.MaxChakra/=1.15
				usr.MaxStamina/=1.15
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body return to normal<font color = white>*)"
				src.Active=0

obj/Taijutsu/Second_Gate:_Gate_of_Healing
	icon='Skillcard.dmi'
	icon_state="Hachimon 2"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<150)
					return
				usr.Hachimon=1
				usr.Stamina-=150
				usr.Stamina+=300
				usr.Health+=10
				usr.MaxChakra*=1.25
				usr.Taijutsu *= 1.5
				usr.Defense/=1.5
				usr.Offence *=1.9
				usr.Agility*=1.9
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body raises stamina and assists in recovery .<font color = white>*)"
				src.Active=1

			else
				usr.Hachimon=0
				usr.MaxChakra/=1.5
				usr.MaxStamina/=1.5
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body return to normal.<font color = white>*)"
				src.Active=0

obj/Taijutsu/Third_Gate:_Gate_of_Life
	icon='Skillcard.dmi'
	icon_state="Hachimon 3"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<250)
					return
				usr.Hachimon=1
				usr.Stamina-=100
				usr.MaxChakra*=1.15
				usr.Taijutsu *= 2.25
				usr.Defense/=2.15
				usr.Offence *=2.7
				usr.Agility*=3.5
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body enters Ura Renge phase, turning their body a shade of red.<font color = white>*)"
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.overlays += 'Gate_2.dmi'
				usr.icon = 'Hachimon.dmi'
				sleep(10)
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.overlays -= 'Gate_2.dmi'
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.overlays -= 'Gate_2.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=1.15
				usr.MaxStamina/=1.15
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body return to normal as the shade of red fades<font color = white>*)"
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'

obj/Taijutsu/Fourth_Gate:_Gate_of_Pain
	icon='Skillcard.dmi'
	icon_state="Hachimon"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<500)
					return
				usr.Hachimon=1
				usr.Stamina-=500
				usr.MaxChakra*=1.5
				usr.Taijutsu *= 4.5
				usr.Defense*=0.5
				usr.Offence *=1.7
				usr.Agility*=2.5
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body increases speed and power, further usage will begin to tear the body's muscles.<font color = white>*)"
				usr.drain_1=1
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.icon = 'Hachimon.dmi'
				sleep(10)
				usr.overlays -= 'Rocks.dmi'
				usr.drain_1()
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=1.5
				usr.MaxStamina/=1.5
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body return to normal as the shade of red fades<font color = white>*)"
				usr.drain_1=0
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'


obj/Taijutsu/Fifth_Gate:_Gate_of_Limit
	icon='Skillcard.dmi'
	icon_state="Hachimon 5"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<700)
					return
				usr.Hachimon=1
				usr.Stamina-=700
				usr.MaxChakra*=1.5
				usr.Taijutsu *= 5.25
				usr.Defense*=0.2
				usr.Offence *=2
				usr.Agility*=3
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body Further increases speed and power.<font color = white>*)"
				usr.drain_1=1
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.icon = 'Hachimon.dmi'
				usr.overlays += 'Gate_1.dmi'
				usr.overlays += 'Gate_2.dmi'
				sleep(10)
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_2.dmi'
				usr.drain_1()
				sleep(15)
				usr.overlays -= 'Gate_1.dmi'
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=1.5
				usr.MaxStamina/=1.5
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body return to normal as the shade of red fades<font color = white>*)"
				usr.drain_1=0
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'
obj/Taijutsu/Sixth_Gate:_Gate_of_View
	icon='Skillcard.dmi'
	icon_state="Hachimon 5"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<800)
					return
				usr.Hachimon=1
				usr.Stamina-=800
				usr.MaxChakra*=2
				usr.Taijutsu *= 7
				usr.Defense*=0.15
				usr.Offence *=3
				usr.Agility*=4
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body Further increases speed and power.<font color = white>*)"
				usr.drain_1=1
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.icon = 'Hachimon.dmi'
				usr.overlays += 'Gate_1.dmi'
				usr.overlays += 'Gate_2.dmi'
				sleep(10)
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_2.dmi'
				usr.drain_1()
				sleep(15)
				usr.overlays -= 'Gate_1.dmi'
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=2
				usr.MaxStamina/=1.5
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body return to normal as the shade of red fades<font color = white>*)"
				usr.drain_1=0
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'

obj/Taijutsu/Seventh_Gate:_Gate_of_Wonder
	icon='Skillcard.dmi'
	icon_state="Hachimon 5"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<900)
					return
				usr.Hachimon=1
				usr.Stamina-=900
				usr.MaxChakra*=3
				usr.Taijutsu *= 8
				usr.Defense*=0.12
				usr.Offence *=4
				usr.Agility*=5
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body Further increases speed and power.<font color = white>*)"
				usr.drain_1=1
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.icon = 'Hachimon.dmi'
				usr.overlays += 'Gate_1.dmi'
				usr.overlays += 'Gate_2.dmi'
				sleep(10)
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_2.dmi'
				usr.drain_1()
				sleep(15)
				usr.overlays -= 'Gate_1.dmi'
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=3
				usr.MaxStamina/=1.5
				usr.Taijutsu = usr.MaxTaijutsu
				usr.Offence = usr.MaxOffence
				usr.Agility = usr.MaxAgility
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body return to normal as the shade of red fades<font color = white>*)"
				usr.drain_1=0
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'
obj/Taijutsu/Eighth_Gate:_Gate_of_Death
	icon='Skillcard.dmi'
	icon_state="Hachimon 5"
	Click()
		if(src in usr.contents)
			if(!usr.Hachimon)
				if(usr.Stamina<1000)
					return
				usr.Hachimon=1
				usr.Stamina-=1000
				usr.MaxChakra*=6
				usr.Taijutsu *= 10
				usr.Defense*=0.8
				usr.Offence *=8
				usr.Agility*=15
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body Further increases speed and power, their body is now at its absolute limit.(8)<font color = white>*)"
				usr.drain_1=1
				src.Active=1
				usr.overlays += 'Rocks.dmi'
				usr.icon = 'Hachimon.dmi'
				usr.overlays += 'Gate_1.dmi'
				usr.overlays += 'Gate_2.dmi'
				sleep(10)
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_2.dmi'
				usr.drain_1()
				sleep(15)
				usr.overlays -= 'Gate_1.dmi'
			else
				usr.overlays -= 'Rocks.dmi'
				usr.overlays -= 'Gate_1.dmi'
				usr.Hachimon=0
				usr.MaxChakra/=6
				usr.MaxStamina/=3
				usr.Taijutsu -= usr.MaxTaijutsu
				usr.Offence -= usr.MaxOffence
				usr.Agility -= usr.MaxAgility
				usr.Stamina -= 5000000
				usr.Chakra -= 50000000
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body return to normal as the shade of red fades<font color = white>*)"
				usr.drain_1=0
				src.Active=0
				if(usr.White)
					usr.icon = 'Base_White.dmi'
				if(usr.Pale)
					usr.icon = 'Base_Pale.dmi'
				if(usr.Tan)
					usr.icon = 'Base_Tan.dmi'
				if(usr.Dark)
					usr.icon = 'Base_Black.dmi'
				if(usr.White&&usr.Female)
					usr.icon = 'Base_FemaleWhite.dmi'
				if(usr.Pale&&usr.Female)
					usr.icon = 'Base_FemalePale.dmi'
				if(usr.Tan&&usr.Female)
					usr.icon = 'Base_FemaleTan.dmi'
				if(usr.Dark&&usr.Female)
					usr.icon = 'Base_FemaleBlack.dmi'
				usr << "You are seriously going to die, you have about 2 minutes to RP your heart exploding from overload."
				sleep(2000)
				viewers(16) <<"[usr]'s heart explodes!"
				usr.Death()
mob/var/drain_1=0
mob/proc
	drain_1()
		spawn(10)
		if(usr.drain_1)
			usr.Stamina -= 20
			usr.drain_1()
		if(usr.Stamina<=0)
			usr.Hachimon=0
			usr.Control=usr.MaxControl
			usr.MaxChakra/=1.5
			viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]'s Body return to normal as the shade of red fades <font color = white>*)"
			usr.drain_1=0
			usr.overlays -= 'Rocks.dmi'
			usr.overlays -= 'Gate_1.dmi'
			usr.overlays -= 'Gate_2.dmi'
			if(usr.White)
				usr.icon = 'Base_White.dmi'
			if(usr.Pale)
				usr.icon = 'Base_Pale.dmi'
			if(usr.Tan)
				usr.icon = 'Base_Tan.dmi'
			if(usr.Dark)
				usr.icon = 'Base_Black.dmi'
			if(usr.White&&usr.Female)
				usr.icon = 'Base_FemaleWhite.dmi'
			if(usr.Pale&&usr.Female)
				usr.icon = 'Base_FemalePale.dmi'
			if(usr.Tan&&usr.Female)
				usr.icon = 'Base_FemaleTan.dmi'
			if(usr.Dark&&usr.Female)
				usr.icon = 'Base_FemaleBlack.dmi'
