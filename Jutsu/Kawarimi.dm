/*STAGES
1)Click Kawa
2)Click Ground
3)Move To Ground
*/
obj
	Log
		var/Owner
		icon='Log.dmi'
		New()
			spawn(300)
			del(src)


turf/DblClick()
	if(usr.Shunshin&&!usr.ShunshinDelay)
		if(usr.Chakra>2)
			usr.MaxNinjutsu += (1 *0.001)
			usr.Chakra-=2
			usr.shunshinskill+=1
			flick('smoke.dmi',usr)
			usr.Move(src)
			usr.ShunshinDelay=1
			spawn(200/usr.shunshinskill)
			usr.ShunshinDelay=0
	if(usr.Trait=="SUPER SAIYAN!")
		usr.MaxNinjutsu += (1 *0.001)
		flick('smoke.dmi',usr)
		usr.Move(src)
		usr << "ZANZOKEN!"



mob/var
	Kawa=0
	KawaDelay=0
	kawarimiskill=1

obj/Ninjutsu/Kawarimi
	icon='Skillcard.dmi'
	icon_state="Kawarimi"
	Click()
		if(src in usr.contents)
			if(!usr.move|usr.KawaDelay)
				return
			if(!usr.Kawa)
				if(usr.Chakra>2)
					usr << "You have created a log, it will be deleted in thirty seconds. Clicking this verb again while the log is active, will result in you teleporting to the said log."
					usr.Kawa=1
					src.Active=1
					usr.CreateLog()
			else
				usr.FakeZanzo()
				usr.Kawa=0
				src.Active=0
mob/proc/CreateLog()
	if(usr.Kawa&&!usr.KawaDelay)
		var/obj/Log/L=new()
		L.loc=usr.loc
		L.icon='blank.dmi'
		L.name="[usr.name] - Kawa"
		L.Owner=usr.key
		usr << "Kawarimi no Jutsu...."
		usr.Chakra-=1
mob/proc/FakeZanzo()
	for(var/obj/Log/L in world)
		if(L.Owner==usr.key)
			flick('smoke.dmi',L)
			usr.MaxNinjutsu += (1 *0.001)
			usr.Chakra-=1
			usr.kawarimiskill+=1
			flick('smoke.dmi',usr)
			var/obj/Log/M=new()
			M.loc=usr.loc
			usr.loc=L.loc
			usr.Move(src)
			usr.KawaDelay=1
			usr.Kawa=0
			usr << "Kawarimi no Jutsu!"
			spawn(200/usr.kawarimiskill)usr.KawaDelay=0
			del(L)
