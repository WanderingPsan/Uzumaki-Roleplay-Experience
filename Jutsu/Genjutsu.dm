/*
Magen: Jubaku Satsu - Tree binding

Kokuangyo no Jutsu - Darkness

Nehan Shoja no Jutsu - Sleep

Toton Jutsu - Spying
*/
mob/var/Gen=0
obj/Magen
	icon='Trees.dmi'
	T1
		icon_state="Magen"
		layer=MOB_LAYER+5
	T2
		icon_state="2"
		pixel_x=-32
		layer=MOB_LAYER+5
	T3
		icon_state="3"
		pixel_y=32
		pixel_x=-32
		layer=MOB_LAYER+5
	T4
		icon_state="4"
		pixel_y=32
		layer=MOB_LAYER+5
	T5
		icon_state="5"
		pixel_y=32
		pixel_x=32
		layer=MOB_LAYER+5
	T6
		icon_state="6"
		pixel_y=64
		layer=MOB_LAYER+5
mob/var/magen=0
obj/Genjutsu
	Jabaku_Satsu
		icon='Skillcard.dmi'
		icon_state="Magen"
		Click()
			if(src in usr.contents)
				if(usr.move)
					if(usr.Chakra<usr.MaxChakra*0.45)
						return
					usr.Chakra-=(usr.MaxChakra*0.45)
					var/list/V = new/list
					for(var/mob/M in oview())
						V.Add(M)
					var/mob/A=input("Who would you like to use the Genjutsu on?") in V
					if(A==null)
						return
					if(A.Kai)
						usr << "[A] resists your Genjutsu!"
						return
					if(A.Kyouten)
						usr.icon_state="Focus"
						usr.move=0
						usr.magen=1
						usr.overlays += new/obj/Magen/T1
						usr.overlays += new/obj/Magen/T2
						usr.overlays += new/obj/Magen/T3
						usr.overlays += new/obj/Magen/T4
						usr.overlays += new/obj/Magen/T5
						usr.overlays += new/obj/Magen/T6
						viewers(16) << "<font color=[A.SayFont]>[A] yells<font color = white>: Magen: Jubaku Satsu no Jutsu!"
						A.MaxGenjutsu += (1 *0.01)
						usr << "[A] reversed your Genjutsu!"
						sleep(200*A.Genjutsu/usr.Resistance*1.5)
						if(usr.magen)
							usr.move=1
							usr.Health -= (usr.Genjutsu/4)+1
							usr.overlays -= /obj/Magen/T1
							usr.overlays -= /obj/Magen/T2
							usr.overlays -= /obj/Magen/T3
							usr.overlays -= /obj/Magen/T4
							usr.overlays -= /obj/Magen/T5
							usr.overlays -= /obj/Magen/T6
							usr.icon_state=""
						return
					if(usr.Genjutsu >= A.Genjutsu*1.3)
						A.icon_state="Focus"
						A.move=0
						A.magen=1
						A.overlays += new/obj/Magen/T1
						A.overlays += new/obj/Magen/T2
						A.overlays += new/obj/Magen/T3
						A.overlays += new/obj/Magen/T4
						A.overlays += new/obj/Magen/T5
						A.overlays += new/obj/Magen/T6
						viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Magen: Jubaku Satsu no Jutsu!"
						usr.MaxGenjutsu += (1 *0.01)
						sleep(200*usr.Genjutsu/A.Resistance*1.5)
						if(A.magen)
							A.move=1
							A.Health -= (usr.Genjutsu/4)+1
							A.overlays -= /obj/Magen/T1
							A.overlays -= /obj/Magen/T2
							A.overlays -= /obj/Magen/T3
							A.overlays -= /obj/Magen/T4
							A.overlays -= /obj/Magen/T5
							A.overlays -= /obj/Magen/T6
							A.icon_state=""
					else
						usr << "[A] resists your Genjutsu!"


	Kokaungyo
		icon='Skillcard.dmi'
		icon_state="Kokuangyo"
		Click()
			if(src in usr.contents)
				if(usr.move)
					if(usr.Chakra<usr.MaxChakra*0.45)
						return
					usr.Chakra-=(usr.MaxChakra*0.40)
					var/list/V = new/list
					for(var/mob/M in oview())
						V.Add(M)
					var/mob/A=input("Who would you like to use the Genjutsu on?") in V
					if(A==null)
						return
					if(A.Kai)
						usr << "[A] resists your Genjutsu!"
						return
					if(A.Kyouten)
						usr.client.view="1x1"
						viewers(16) << "<font color=[A.SayFont]>[A] yells<font color = white>: Kokaungyo no Jutsu!"
						A.MaxGenjutsu += (1 *0.01)
						usr << "[A] reversed your Genjutsu!"
						sleep(150*A.Genjutsu/usr.Resistance*1.5)
						usr.client.view="20x20"
						return
					if(usr.Genjutsu >= A.Genjutsu*1.1)
						A.client.view="1x1"
						viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Kokaungyo no Jutsu!"
						usr.MaxGenjutsu += (1 *0.01)
						sleep(150*usr.Genjutsu/A.Resistance*1.5)
						A.client.view="20x20"
					else
						usr << "[A] resists your Genjutsu!"

	Nehan_Shoja
		icon='Skillcard.dmi'
		icon_state="Nehan"
		Click()
			if(src in usr.contents)
				if(usr.move)
					if(usr.Chakra<usr.MaxChakra*0.30)
						return
					usr.Chakra-=(usr.MaxChakra*0.30)
					var/list/V = new/list
					for(var/mob/M in oview())
						V.Add(M)
					var/mob/A=input("Who would you like to use the Genjutsu on?") in V
					if(A==null)
						return
					if(A.Kai)
						usr << "[A] resists your Genjutsu!"
						return
					if(A.Kyouten)
						usr.overlays += 'Nehan.dmi'
						usr.move=0
						usr.icon_state="KO"
						viewers(16) << "<font color=[A.SayFont]>[A] yells<font color = white>: Nehan Shoja no Jutsu!"
						A.MaxGenjutsu += (1 *0.01)
						usr << "[A] reversed your Genjutsu!"
						sleep(150*A.Genjutsu/usr.Resistance*1.5)
						usr.overlays -= 'Nehan.dmi'
						usr.move=1
						usr.icon_state=""
						return
					if(usr.Genjutsu >= A.Genjutsu*1.1)
						A.overlays += 'Nehan.dmi'
						A.move=0
						A.icon_state="KO"
						viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Nehan Shoja no Jutsu!"
						usr.MaxGenjutsu += (1 *0.01)
						sleep(150*usr.Genjutsu/A.Resistance*1.5)
						A.overlays -= 'Nehan.dmi'
						A.move=1
						A.icon_state=""
					else
						usr << "[A] resists your Genjutsu!"
	Toton
		icon='Skillcard.dmi'
		icon_state="Toton"
		Click()
			if(src in usr.contents)
				if(usr.move)
					var/list/V = new/list
					for(var/mob/M in world)
						V.Add(M)
					var/mob/A=input("Who would you like to use the Genjutsu on?") in V
					if(A.Kai)
						usr << "[A] resists your Genjutsu!"
						return
					if(usr.Genjutsu >= A.Genjutsu*1.1)
						usr.move=0
						usr.client.perspective=EYE_PERSPECTIVE
						usr.client.eye=A
						viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Toton no Jutsu!"
						usr.MaxGenjutsu += (1 *0.001)
						sleep(150)
						usr.client.perspective=EYE_PERSPECTIVE
						usr.client.eye=usr
						usr.move=1
					else
						usr << "[A] resists your Genjutsu!"


	Shikumi_no_Jutsu
		icon='Skillcard.dmi'
		icon_state="Shikumi"
		Click()
			if(src in usr.contents)
				if(usr.move)
					if(usr.Chakra<usr.MaxChakra*0.20)
						return
					usr.Chakra-=(usr.MaxChakra*0.20)
					var/list/V = new/list
					for(var/mob/M in oview())
						V.Add(M)
					var/mob/A=input("Who would you like to use the Genjutsu on?") in V
					if(A==null)
						return
					if(A.Kai)
						usr << "[A] resists your Genjutsu!"
						return
					if(A.Kyouten)
						usr.move=0
						viewers(16) << "<font color=[A.SayFont]>[A] yells<font color = white>: Shikumi no Jutsu!"
						A.MaxGenjutsu += (1 *0.01)
						usr << "[A] reversed your Genjutsu!"
						sleep(250*A.Genjutsu/usr.Resistance*1.5)
						usr.move=1
						usr.icon_state=""
						return
					if(usr.Genjutsu >= A.Genjutsu*1.1)
						A.move=0
						viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Shikumi no Jutsu!"
						usr.MaxGenjutsu += (1 *0.01)
						sleep(250*usr.Genjutsu/A.Resistance*1.5)
						A.move=1
						A.icon_state=""
					else
						usr << "[A] resists your Genjutsu!"




	Kai
		icon='Skillcard.dmi'
		icon_state="Kai"
		var/skill=1
		Click()
			if(src in usr.contents)
				if(!usr.Kai)
					if(usr.Chakra<usr.MaxChakra*(0.20/skill))
						return
					if(prob(10/skill/skill/skill))
						usr<<"Your understanding of the Kai no Jutsu has increased."
						skill+=1
					usr.icon_state="Focus"
					usr.Kai=1
					usr.MaxGenjutsu += (1 *0.001)
					usr << "You have activated Kai no Jutsu, it will allow you to reflect certain Genjutsu for a short amount of time."
					usr.Chakra-=usr.MaxChakra*(0.20/skill)
					sleep(10)
					usr.icon_state=""
					src.Active=1
					var/list/V = new/list
					for(var/mob/M in viewers(3))
						V.Add(M)
					var/mob/A=input("Who would you like to use the Kai no Jutsu on?") in V
					if(A==null)
						return
					if(!A.Kai)
						for(var/mob/Genjutsu/B)
							A.loc=B.loc
							A.Kori=0
							del(B)
						A.Kai=1
						A.move=1
						A.icon_state=""
						A.overlays -= 'Nehan.dmi'
						A.overlays -= /obj/Magen/T1
						A.overlays -= /obj/Magen/T2
						A.overlays -= /obj/Magen/T3
						A.overlays -= /obj/Magen/T4
						A.overlays -= /obj/Magen/T5
						A.overlays -= /obj/Magen/T6
						A << "[usr] has used Kai no Jutsu on you, it is able to release Genjutsu affects."
						sleep(rand(100,300))
						A.Kai=0
						//usr << "You have activated Kai no Jutsu, it will allow you to reflect certain Genjutsu for a short amount of time."
						//usr.Kai=1
						//src.Active=1
					sleep(rand(200,350))
					src.Active=0
					usr << "You deactivate Kai no Jutsu, you can no longer use this Jutsu until you reactivate it."
					usr.Kai=0
				else
					usr << "You deactivate Kai no Jutsu, you can no longer use this Jutsu until you reactivate it."
					usr.Kai=0
					src.Active=0



	Kori_Shinchuu_no_Jutsu
		icon='Skillcard.dmi'
		icon_state="Kori"
		Click()
			if(src in usr.contents)
				if(usr.move)
					if(usr.Chakra<usr.MaxChakra*0.20)
						return
					usr.Chakra-=(usr.MaxChakra*0.20)
					var/list/V = new/list
					for(var/mob/M in oview())
						V.Add(M)
					var/mob/A=input("Who would you like to use the Genjutsu on?") in V
					if(A==null)
						return
					if(A.Kori==1)
						return
					if(A.Kai)
						usr << "[A] resists your Genjutsu!"
						return
					if(A.Kyouten)
						viewers(16) << "<font color=[A.SayFont]>[A] yells<font color = white>: Kori Shinchuu no Jutsu!"
						A.MaxGenjutsu += (1 *0.01)
						usr << "[A] reversed your Genjutsu!"
						usr.Kori=1
						var/mob/B = new/mob/Genjutsu
						B.loc=usr.loc
						B.Health=0
						B.Kori=1
						B.MaxHealth=0
						B.Savable=0
						B.displaykey = usr.key
						B.name="[usr.name]"
						B.icon=usr.icon
						B.overlays.Add(usr.overlays)
						B.icon_state="KO"
						B.attackable=0
						usr.loc=locate(277,8,29)
						sleep(1000)
						usr.loc=B.loc
						usr.Kori=0
						B.Kori=0
						del(B)
						return
					if(usr.Genjutsu >= A.Genjutsu*1.1)
						viewers(16) << "<font color=[usr.SayFont]>[usr] yells<font color = white>: Kori Shinchuu no Jutsu!"
						usr.MaxGenjutsu += (1 *0.01)
						A.Kori=1
						var/mob/B = new/mob/Genjutsu
						B.loc=A.loc
						B.Kori=1
						B.Health=0
						B.MaxHealth=0
						B.Savable=0
						B.displaykey = A.key
						B.name="[A.name]"
						B.icon=A.icon
						B.overlays.Add(A.overlays)
						B.icon_state="KO"
						B.attackable=0
						A.loc=locate(277,8,29)
						sleep(1000)
						A.Kori=0
						B.Kori=0
						A.loc=B.loc
						del(B)
					else
						usr << "[A] resists your Genjutsu!"


mob/var/Kori=0