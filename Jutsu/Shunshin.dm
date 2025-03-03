/*STAGES
1)Click Kawa
2)Click Ground
3)Move To Ground
*/


mob/var
	Shunshin=0
	ShunshinDelay=0
	shunshinskill=1

obj/Ninjutsu/Shunshin
	icon='Skillcard.dmi'
	icon_state="Shunshin"
	Click()
		if(src in usr.contents)
			if(!usr.move|usr.ShunshinDelay)
				return
			if(!usr.Shunshin)
				usr << "You have activated Shunshin no Jutsu, to use it double click on a flat piece of ground to replace your body with an object and move to that area."
				usr.Shunshin=1
				src.Active=1
			else
				usr << "You deactivate Shunshin no Jutsu, you can no longer use this Jutsu until you reactivate it."
				usr.Shunshin=0
				src.Active=0