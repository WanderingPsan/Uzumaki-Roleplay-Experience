mob/var/Picking = 1

mob/Click()
	if(src.client)
		if(!src.KO)
			if(src.NiCOn == 0)
				usr<<browse(src.profile,"window=[src];size=500x350")
			else
				usr<<browse("<html><head><center><title>[src.name]'s Ninja Info Card</title></center></head><body bgcolor=00000#><font color=[src.SayFont]><font size=5>Ninja Info Card</size><br>---<br>[src] has these parameters:<br><br> Chakra:[src.Jchakra] | Stamina: [src.Jstam]<br><hr> Ninjutsu:[src.Jnin] | Taijutsu: [src.Jtai] | Genjutsu: [src.Jgen] <br><hr>Intelligence: [src.Jint] | Control: [src.Jcon]<br><hr> Reflexes: [src.Jref] | Speed: [src.Jspd] <br><hr> Physical Power: [src.Jstr] | Physical Durability: [src.Jdur] | Attack Speed: [src.Jatkspd]<br><hr>Genjutsu Resistance: [src.Jgenres] | Ninjutsu Defense: [src.Jdef]<body></html>","window=[src.name];size=705x400;can_resize=0;can_minimize=0")
		else
			Flob
			var/list/L = new/list
			for(var/obj/items/I in src.contents)
				L.Add(I)
			var/obj/items/O = input(usr,"What would you like to steal?") in L
			if(O==null)
				return
			usr.contents += O
			usr<<"You steal the [O]."
			src<<"[usr] has stolen your [O]."
			var/KeepItGoing=input(usr,"Would you like to steal something else?") in list("Yes","No")
			if(KeepItGoing=="Yes")
				goto Flob
			else
				return

obj/items
	DblClick()
		if(!src.loc==usr)
			for(var/mob/M in view(2))
				if(src.loc == M)
					if(usr.Picking)
						src.Move(usr)