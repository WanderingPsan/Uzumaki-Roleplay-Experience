mob/var
	RadioIn = 0
	Frequency = 0.00


obj/items/Clothes/Radio_Comm
	icon='Radio.dmi'
	var
		Frequency = 0.00
	Click()
		if(src in usr.contents)
			if(!src.worn)
				src.worn = 1
				src.suffix = "**Equipped**"
				usr.RadioIn = 1
				usr.Frequency = src.Frequency
				usr.overlays += src.icon
			else
				src.worn = 0
				usr.Frequency = 0.00
				usr.RadioIn = 0
				src.suffix=""
				usr.overlays -= src.icon
	verb
		Set_Frequency(bleh as num)
			var/choice = input("Are you sure you want to change the frequency?") in list("Yes", "No")
			if(choice == "Yes")
				src.Frequency = bleh
				usr.Frequency = bleh
			else
				return
		Check_Frequency()
			usr<<"Current Frequency is: [src.Frequency]."
			return

		Radio_Say(msg as text)
			usr.Mute_Check()
			if(msg==""||!global.OOC)
				return
			if(usr.Muted)
				usr<<"Shut the fuck up."
				return
			var/thetext=copytext(msg,1,550)
			for(var/mob/M in world)
				if(M.RadioIn)
					if(M.Frequency == usr.Frequency)
						M<<output("<b><font color=[usr.SayFont]>([usr.Village]):[usr]: [html_encode(thetext)]")






