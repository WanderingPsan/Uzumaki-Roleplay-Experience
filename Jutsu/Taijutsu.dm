obj/Taijutsu/Oukashou
	var/Oukashou=0
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Oukashou"
	Click()
		if(src in usr.contents)
			if(!Oukashou)
				if(usr.Chakra<usr.MaxChakra*(0.70/skill))
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of the Oukashou Taijutsu Style increased."
					skill+=1
				usr<<"You draw Chakra to your hands to increase your power."
				usr.MaxTaijutsu += (1 *0.005)
				usr.Chakra-=usr.MaxChakra*(0.70/skill)
				usr.Taijutsu *= 1.5*(0.70*skill)
				usr.Strength *= 2*(0.70*skill)
				src.Active=1
				Oukashou=1
				usr.Oukashou_drain=1
				usr.Oukashou_drain()
			else
				usr<<"You withdraw the Chakra from your hand and return to normal."
				usr.Strength = usr.MaxStrength
				usr.Taijutsu = usr.MaxTaijutsu
				Oukashou=0
				usr.Oukashou_drain=0
				src.Active=0

mob/var/Oukashou_drain=0
mob/proc
	Oukashou_drain()
		spawn(10)
		if(usr.Oukashou_drain)
			usr.Chakra -= rand(0.5,2.5)
			usr.Oukashou_drain()
		if(usr.Chakra<=0)
			usr<<"You withdraw the Chakra from your hand and return to normal."
			usr.Strength = usr.MaxStrength
			usr.Taijutsu = usr.MaxTaijutsu
			usr.Oukashou_drain=0
			for(var/obj/Taijutsu/Oukashou/B in usr.contents)
				B.Oukashou=0
				B.Active=0

mob/var/Dynamic=0
obj/Taijutsu/Dainamikku_Entorii
	var/skill=1
	icon='Skillcard.dmi'
	icon_state="Run"
	Click()
		if(src in usr.contents)
			if(!usr.Dynamic)
				if(usr.Stamina<40)
					return
				if(prob(10/skill/skill/skill))
					usr<<"Your understanding of Dainamikku Entorii Taijutsu Style has increased."
					skill+=1
				usr.MaxAgility += (1 *0.001)
				usr.Stamina-=40
				usr.Agility *= 1.7
				src.Active=1
				usr.icon_state="Dynamic"
				usr.Dynamic=1
				step(usr,usr.dir)
				step(usr,usr.dir)
				step(usr,usr.dir)
				step(usr,usr.dir)
				var/obj/Reppushou/A = new
				A.damage = rand(20,40)/4+skill
				viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Dainamikku Entorii!"
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				sleep(10)
				usr.Agility = usr.MaxAgility
				usr.icon_state=""
				src.Active=0
				usr.Dynamic=0

