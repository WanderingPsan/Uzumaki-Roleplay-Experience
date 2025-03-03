/* Weapons
Samehada
Kunai
Shuriken
Needles
Tanto
Katana
Staff?
*/
obj/items/Chakra_Paper
	icon='Paper.dmi'
	verb/Chakra_Test()
		set src in usr
		usr << "Your primary element is: [usr.PrimaryElement]"
		usr << "Your secondary element is: [usr.SecondaryElement]"
		usr << "Your tertiary element is: [usr.TertiaryElement]"
		usr << "Your quadranary element is: [usr.QuadranaryElement]"
		usr << "Your quinary element is: [usr.QuinaryElement]"
		del src

mob/Tsukuyomi_Body
	icon='Tsukuyomi.dmi'
	icon_state="Base"

mob/Dead_Body
	verb
		Bury()
			set src in view(2)
			input("Would you like to bury this budy?")in list("Yes","No")
			if("Yes")
				var/obj/Tombstone/B = new
				B.loc = src.loc
				B.body = "[src.name]"
				B.interred = 1
				src.invisibility = 1
				src.density = 0

mob/Genjutsu

mob/var
	Weapon=0
	Weights=0
	Samehada=0
	Fan=0

obj/Shuriken
	icon='Shuriken.dmi'
	density=1
	var/damage
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/items/Weapon/Shuriken/A = new
						A.loc = src.loc
						del(src)
					else
						M.Health -= damage
						M.Ko()
						del(src)
				else
					M.Health -= damage
					M.Ko()
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/items/Weapon/Shuriken/A = new
				A.loc = src.loc
				del(src)

obj/Explosive_Tag
	icon='Explosive tag.dmi'
	density=1
	var/damage
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/Smoke/A=new()
						var/obj/Smoke/B=new()
						var/obj/Smoke/C=new()
						var/obj/Smoke/D=new()
						var/obj/Smoke/E=new()
						var/obj/Smoke/F=new()
						var/obj/Smoke/G=new()
						var/obj/Smoke/H=new()
						var/obj/Smoke/I=new()
						A.loc=locate(M.x-1,M.y,M.z)
						B.loc=locate(M.x-1,M.y-1,M.z)
						C.loc=locate(M.x-1,M.y+1,M.z)
						D.loc=locate(M.x,M.y-1,M.z)
						E.loc=locate(M.x,M.y,M.z)
						F.loc=locate(M.x,M.y+1,M.z)
						G.loc=locate(M.x+1,M.y-1,M.z)
						H.loc=locate(M.x+1,M.y,M.z)
						I.loc=locate(M.x+1,M.y+1,M.z)
						del(src)

					else
						M.Health -= damage/M.Defense*1.2
						M.Ko()
						spawn() flick('Explode.dmi',M)
						del(src)
						var/obj/Smoke/A=new()
						var/obj/Smoke/B=new()
						var/obj/Smoke/C=new()
						var/obj/Smoke/D=new()
						var/obj/Smoke/E=new()
						var/obj/Smoke/F=new()
						var/obj/Smoke/G=new()
						var/obj/Smoke/H=new()
						var/obj/Smoke/I=new()
						A.loc=locate(M.x-1,M.y,M.z)
						B.loc=locate(M.x-1,M.y-1,M.z)
						C.loc=locate(M.x-1,M.y+1,M.z)
						D.loc=locate(M.x,M.y-1,M.z)
						E.loc=locate(M.x,M.y,M.z)
						F.loc=locate(M.x,M.y+1,M.z)
						G.loc=locate(M.x+1,M.y-1,M.z)
						H.loc=locate(M.x+1,M.y,M.z)
						I.loc=locate(M.x+1,M.y+1,M.z)
				else
					M.Health -= damage/M.Defense*1.2
					M.Ko()
					var/obj/Smoke/A=new()
					var/obj/Smoke/B=new()
					var/obj/Smoke/C=new()
					var/obj/Smoke/D=new()
					var/obj/Smoke/E=new()
					var/obj/Smoke/F=new()
					var/obj/Smoke/G=new()
					var/obj/Smoke/H=new()
					var/obj/Smoke/I=new()
					A.loc=locate(M.x-1,M.y,M.z)
					B.loc=locate(M.x-1,M.y-1,M.z)
					C.loc=locate(M.x-1,M.y+1,M.z)
					D.loc=locate(M.x,M.y-1,M.z)
					E.loc=locate(M.x,M.y,M.z)
					F.loc=locate(M.x,M.y+1,M.z)
					G.loc=locate(M.x+1,M.y-1,M.z)
					H.loc=locate(M.x+1,M.y,M.z)
					I.loc=locate(M.x+1,M.y+1,M.z)
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/Smoke/A=new()
				var/obj/Smoke/B=new()
				var/obj/Smoke/C=new()
				var/obj/Smoke/D=new()
				var/obj/Smoke/E=new()
				var/obj/Smoke/F=new()
				var/obj/Smoke/G=new()
				var/obj/Smoke/H=new()
				var/obj/Smoke/I=new()
				A.loc=locate(M.x-1,M.y,M.z)
				B.loc=locate(M.x-1,M.y-1,M.z)
				C.loc=locate(M.x-1,M.y+1,M.z)
				D.loc=locate(M.x,M.y-1,M.z)
				E.loc=locate(M.x,M.y,M.z)
				F.loc=locate(M.x,M.y+1,M.z)
				G.loc=locate(M.x+1,M.y-1,M.z)
				H.loc=locate(M.x+1,M.y,M.z)
				I.loc=locate(M.x+1,M.y+1,M.z)
				del(src)

obj/Smoke
	icon='Explode.dmi'
	icon_state="1"
	layer=9
	New()
		..()
		spawn(1)
			icon_state="2"
			spawn(1)
				icon_state="3"
				spawn(1)
					icon_state="4"
					spawn(1)
						icon_state="5"
						spawn(1)
							del src



obj/Kunai
	icon='Kunai.dmi'
	icon_state="Throw"
	density=1
	var/damage
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/items/Weapon/Kunai/A = new
						A.loc = src.loc
						del(src)
					else
						M.Health -= damage
						M.Ko()
						del(src)
				else
					M.Health -= damage
					M.Ko()
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/items/Weapon/Kunai/A = new
				A.loc = src.loc
				del(src)

obj/Giant_Shuriken
	icon='Giant Shuriken.dmi'
	icon_state="Throw"
	density=1
	var/damage
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/items/Weapon/Giant_Shuriken/A = new
						A.loc = src.loc
						del(src)
					else
						M.Health -= damage
						M.Ko()
						del(src)
				else
					M.Health -= damage
					M.Ko()
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/items/Weapon/Giant_Shuriken/A = new
				A.loc = src.loc
				del(src)

obj/Windmill
	icon='Windmill.dmi'
	density=1
	var/damage
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/items/Weapon/Windmill/A = new
						A.loc = src.loc
						del(src)
					else
						M.Health -= damage
						M.Ko()
						del(src)
				else
					M.Health -= damage
					M.Ko()
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/items/Weapon/Windmill/A = new
				A.loc = src.loc
				del(src)
obj/Senbon
	icon='Senbon.dmi'
	density=1
	var/damage
	Bump(mob/M)
		if(istype(M,/mob))
			if(M.attackable)
				if(M.Weapon&&M.attacking)
					if(get_step(M,src))
						walk(src,0)
						var/obj/items/Weapon/Senbon/A = new
						A.loc = src.loc
						del(src)
					else
						M.Health -= damage
						M.Ko()
						del(src)
				else
					M.Health -= damage
					M.Ko()
					del(src)
			else
				del(src)
		if(istype(M,/turf))
			if(M.density)
				walk(src,0)
				var/obj/items/Weapon/Senbon/A = new
				A.loc = src.loc
				del(src)

obj/items/Weapon
	Samehada
		icon='Samehada.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Samehada=1
					usr.Jtai += 1.4
					usr.Jref -= 0.7
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Samehada=0
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility

	Toyotomi_Spear
		icon = 'Toyotomi Spear.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon

	Sandai_Kitetsu
		icon = 'Sandai Kitetsu.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon

	Supervibrato_Blades
		icon = 'Supervibrato Blades.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon


	Gunbai
		icon = 'madara.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon




	Raiga
		icon='Raiga.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Taijutsu *= 1.2
					usr.Ninjutsu *= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu

	Enma_Pole
		icon='Enma Pole.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Taijutsu *= 1.5
					usr.Agility /= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility
		verb/Summon_King_Enma()
			src.worn = 0
			src.suffix=""
			usr.Weapon=0
			usr.overlays -= src.icon
			usr.Taijutsu = usr.MaxTaijutsu
			usr.Agility = usr.MaxAgility
			var/mob/King_Enma/D = new()
			D.Owner = usr.key
			D.loc = usr.loc
			D.Chakra=usr.Chakra/2
			D.MaxChakra=usr.MaxChakra/2
			D.Strength=usr.Strength/2
			D.Agility=usr.Agility/3
			D.Defense=usr.Defense/2
			D.Control=usr.Control/3
			D.Resistance=usr.Resistance/3
			D.Ninjutsu=usr.Ninjutsu/2
			D.Genjutsu=usr.Genjutsu/3
			D.Taijutsu = usr.Taijutsu/2
			D.attackable=1
			D.Health=100
			D.MaxHealth=100
			del(src)


	Kubiriki
		icon='Kubiriki.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Taijutsu *= 2
					usr.Agility *= 0.4
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility

	Zanbatou
		icon='Zanbatou.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Strength *= 2.2
					usr.Agility *= 0.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Strength = usr.MaxStrength
					usr.Agility = usr.MaxAgility


	Hiramekarei
		icon='Hiramekarei.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Taijutsu *= 1.8
					usr.Strength *= 1.8
					usr.Agility *= 0.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Agility = usr.MaxAgility

	Kyodai_Sensu
		icon='Fan.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Taijutsu *= 1.3
					usr.Ninjutsu *= 2.5
					usr.Agility /= 1.5
					usr.contents += new/obj/Ninjutsu/Kazekiri
					usr.contents += new/obj/Ninjutsu/Renkuudan
					usr.Fan=1
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Agility = usr.MaxAgility
					usr.Fan=0
					for(var/obj/Ninjutsu/Renkuudan/A in usr.contents)
						del(A)
					for(var/obj/Ninjutsu/Kazekiri/B in usr.contents)
						del(B)

	Raijin
		icon='Raijin.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Taijutsu *= 1.3
					usr.Ninjutsu *= 2
					usr.Agility *= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Agility = usr.MaxAgility


	Umbrella
		icon='Umbrella.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Taijutsu *= 1.6
					usr.Ninjutsu *= 1.2
					usr.Agility *= 1.2
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Agility = usr.MaxAgility


	Cross_Blade
		icon='Sword_Sheathed.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Taijutsu *= 1.6
					usr.Agility *= 0.9
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility


	Memori_Tail
		icon='Tail of Memori.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.4
					usr.Strength *= 1.6
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Strength = usr.MaxStrength
					usr.Agility = usr.MaxAgility

	Tan_Polearm
		icon='Suna no Geton Staff Blade.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 0.8
					usr.Defense *= 0.7
					usr.Strength *= 1.6
					usr.Taijutsu *= 1.4
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Defense = usr.MaxDefense
					usr.Agility = usr.MaxAgility

	Spear
		icon='Spear.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.2
					usr.Taijutsu *= 2
					usr.Defense *= 0.6
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Defense = usr.MaxDefense
					usr.Agility = usr.MaxAgility

	Shuusui
		icon='Shuusui Unsheathed.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.8
					usr.Taijutsu *= 0.6
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility= usr.MaxAgility

	Custom_Mahiru_Katana
		icon='MahiruKatana.dmi'
		icon_state=""
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.8
					usr.Taijutsu *= 0.6
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility= usr.MaxAgility
		verb
			Color()
				switch(input("Add, Subtract, or Multiply color?", "", text) in list ("Add", "Subtract","Multiply","Cancel"))
					if("Add")
						var/rred=input("How much red?") as num
						var/ggreen=input("How much green?") as num
						var/bblue=input("How much blue?") as num
						src.icon=src.icon
						src.icon+=rgb(rred,ggreen,bblue)
					if("Subtract")
						var/rred=input("How much red?") as num
						var/ggreen=input("How much green?") as num
						var/bblue=input("How much blue?") as num
						src.icon=src.icon
						src.icon-=rgb(rred,ggreen,bblue)
					if("Multiply")
						var/colorz=input("Multiply") as color
						var/icon/I=new(src.icon)
						I.Blend((colorz),ICON_MULTIPLY)
						src.icon=I
					if("Cancel")
						return
			Name()
				switch(input("Will you name your weapon?") in list ("Yes","No"))
					if("Yes")
						var/B = input("Enter its new name") as text
						src.name = B
					if("No")
						return


	Samurai_Sword
		icon='Samurai Sword.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.4
					usr.Defense *= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Defense = usr.MaxDefense
					usr.Agility = usr.MaxAgility

	Water_Form
		icon='WaterArmorJutsu.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.4
					usr.Defense *= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Agility = usr.Agility
					usr.Defense = usr.Defense

	Garian
		icon='Garian.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 0.4
					usr.Strength *= 2.3
					usr.Ninjutsu *=1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Agility = usr.MaxAgility
					usr.Strength = usr.MaxStrength
					usr.Ninjutsu = usr.MaxNinjutsu

	Demon_Brother_Arm_1
		icon='Demon Bro Arm.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 0.8
					usr.Defense *= 1.2
					usr.Strength *= 1.6
					usr.Taijutsu *= 0.8
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Defense = usr.MaxDefense
					usr.Agility = usr.MaxAgility

	Demon_Brother_Arm_2
		icon='Demon Bro Arm 2.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 0.8
					usr.Defense *= 1.2
					usr.Strength *= 1.6
					usr.Taijutsu *= 0.8
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Defense = usr.MaxDefense
					usr.Agility = usr.MaxAgility

/*	Kura_Bow_Sword
		icon='Bow Sword right.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.2
					usr.Defense *= 1.3
					usr.Strength *= 1.3
					usr.Taijutsu *= 0.5
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Defense = usr.MaxDefense
					usr.Agility = usr.MaxAgility

	Kura_Bow_Sword_2
		icon='Bow Sword left.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.2
					usr.Defense *= 1.3
					usr.Strength *= 1.3
					usr.Taijutsu *= 0.5
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Strength = usr.MaxStrength
					usr.Defense = usr.MaxDefense
					usr.Agility = usr.MaxAgility */




	Jet_Warglaive
		icon='Hand blade 2.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.4
					usr.Defense *= 0.7
					usr.Offence *= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Defense = usr.MaxDefense
					usr.Offence = usr.MaxOffence
					usr.Agility = usr.MaxAgility

	Jet_Warglaive_2
		icon='Hand blade.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.4
					usr.Defense *= 0.7
					usr.Offence *= 1.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Defense = usr.MaxDefense
					usr.Offence = usr.MaxOffence
					usr.Agility = usr.MaxAgility


	Chained_Scythes
		icon='Black Star Chained Scythe.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.2
					usr.Defense *= 1.2
					usr.Offence *= 1.3
					usr.Taijutsu *= 0.5
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Defense = usr.MaxDefense
					usr.Offence = usr.MaxOffence
					usr.Agility = usr.MaxAgility




	Void_Blade
		icon='KuraSword.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 0.6
					usr.Defense *= 0.7
					usr.Offence *= 1.3
					usr.Strength *= 2
					usr.Taijutsu *= 0.9
					usr.Ninjutsu *= 1.4
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Strength = usr.MaxStrength
					usr.Defense = usr.MaxDefense
					usr.Offence = usr.MaxOffence
					usr.Agility = usr.MaxAgility


	Gourd
		icon='Gord.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Taijutsu *= 0.7
					usr.Agility /= 2
					usr.Ninjutsu *= 2.3
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Ninjutsu = usr.MaxNinjutsu
					usr.Agility = usr.MaxAgility
	Kunai
		icon='Kunai.dmi'
		icon_state="Inv"
		var/Kunai=1
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Taijutsu *= 1.15
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu

/*		verb/Throw()
			if(src.worn==0&&usr.Weapon==0)
				if(prob(10/usr.KunaiSkill/usr.KunaiSkill/usr.KunaiSkill))
					usr.KunaiSkill+=rand(0.5,1.2)
				var/obj/Kunai/A = new
				A.damage = (usr.KunaiSkill/1.15)+6
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				if(Kunai==1)
					del(src)
					return
				Kunai-=1  */

	Giant_Shuriken
		icon='Giant Shuriken.dmi'
		icon_state="Inv"
		var/GiantShuriken=1
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Taijutsu *= 1.89
					usr.Agility *= 0.8
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility

/*		verb/Throw()
			if(src.worn==0&&usr.Weapon==0)
				if(prob(10/usr.ShurikenSkill/usr.ShurikenSkill/usr.ShurikenSkill))
					usr.ShurikenSkill+=rand(0.5,1.2)
				var/obj/Giant_Shuriken/A = new
				A.damage = (usr.ShurikenSkill/1.2)+2
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				if(GiantShuriken==1)
					del(src)
					return
				GiantShuriken-=1

				*/
	Poison_Bomb
		icon='Poison.dmi'
		icon_state="Inv"
		var/Bomb=1
		verb/Throw()
			if(src.worn==0&&usr.Weapon==0)
				var/obj/Poison_Bomb/A = new
				A.damage = (usr.Jnin)+2
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				if(Bomb==1)
					del(src)
					return
				Bomb-=1


	Explosive_Tag
		icon='Explosive Tag.dmi'
		icon_state="Inv"
		var/Tag=1
		/*Click()
			if(src in usr.contents)
				del(src)
				var/obj/items/Weapons/Explosive_Tag/A = new
				A.loc=usr.loc
				sleep(400,500)
				var/obj/Smoke/W=new()
				var/obj/Smoke/B=new()
				var/obj/Smoke/C=new()
				var/obj/Smoke/D=new()
				var/obj/Smoke/E=new()
				var/obj/Smoke/F=new()
				var/obj/Smoke/G=new()
				var/obj/Smoke/H=new()
				var/obj/Smoke/I=new()
				W.loc=locate(A.x-1,A.y,A.z)
				B.loc=locate(A.x-1,A.y-1,A.z)
				C.loc=locate(A.x-1,A.y+1,A.z)
				D.loc=locate(A.x,A.y-1,A.z)
				E.loc=locate(A.x,A.y,A.z)
				F.loc=locate(A.x,A.y+1,A.z)
				G.loc=locate(A.x+1,A.y-1,A.z)
				H.loc=locate(A.x+1,A.y,A.z)
				I.loc=locate(A.x+1,A.y+1,A.z)
				for(var/mob/M in oview(4,A))
					if(W)
						if(M.loc==W.loc)
							var/damage=round(M.Defense*1.2/2)
							M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(B)
						if(M.loc==B.loc)
							var/damage=round(M.Defense*1.2/2)
							M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(C)
						if(M.loc==C.loc)
							var/damage=round(M.Defense*1.2/2)
							M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(D)
						if(M.loc==D.loc)
							var/damage=round(M.Defense*1.2/2)
							M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(E)
						if(M.loc==E.loc)
							var/damage=round(M.Defense*1.2/2)
							M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(F)
						if(M.loc==F.loc)
							var/damage=round(M.Defense*1.2/2)
							M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(G)
						if(M.loc==G.loc)
							var/damage=round(M.Defense*1.2/2)
							M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(H)
						if(M.loc==H.loc)
							var/damage=round(M.Defense*1.2/2)
							M.Health -= damage
							M.Ko()
				for(var/mob/M in oview(4,A))
					if(I)
						if(M.loc==I.loc)
							var/damage=round(M.Defense*1.2/2)
							M.Health -= damage
							M.Ko()
				del(A)*/



/*		verb/Throw()
			if(src.worn==0&&usr.Weapon==0)
				var/obj/Explosive_Tag/A = new
				A.damage = (usr.Ninjutsu/5)+2
				A.loc=usr.loc
				A.dir = usr.dir
				walk(A,usr.dir)
				if(Tag==1)
					del(src)
					return
				Tag-=1 */


	Log
		icon='Log.dmi'
		icon_state="Inv"
		density = 1
	Broadsword
		icon = 'Broadsword.dmi'
		icon_state = "Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.Taijutsu *= 1.3
					usr.Agility *=1.25
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility

	Tanto
		icon='Tanto.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.Taijutsu *= 1.3
					usr.Agility *=1.25
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Agility = usr.MaxAgility

	Shuriken
		icon='Shuriken.dmi'
		icon_state="Inv"
		var/shuriken=1
/*		verb/Throw()
			if(prob(10/usr.ShurikenSkill/usr.ShurikenSkill/usr.ShurikenSkill))
				usr.ShurikenSkill+=rand(0.5,1)
			var/obj/Shuriken/A = new
			A.damage = (usr.ShurikenSkill/1.5)+2
			A.loc=usr.loc
			A.dir = usr.dir
			walk(A,usr.dir)
			if(shuriken==1)
				del(src)
				return
			shuriken-=1
			src.suffix = "You current have [src.shuriken] in this stack."
*/
	Windmill
		icon='Windmill.dmi'
		icon_state="Inv"
		var/Windmill=1
/*		verb/Throw()
			if(prob(10/usr.WindmillSkill/usr.WindmillSkill/usr.WindmillSkill))
				usr.WindmillSkill+=rand(0.5,1)
			var/obj/Windmill/A = new
			A.damage = (usr.ShurikenSkill/1.3)+5
			A.loc=usr.loc
			A.dir = usr.dir
			walk(A,usr.dir)
			if(Windmill==1)
				del(src)
				return
			Windmill-=1
*/

	Senbon
		icon='Senbon.dmi'
		icon_state="Inv"
		var/senbon=1
/*		verb/Throw()
			if(prob(10/usr.SenbonSkill/usr.SenbonSkill/usr.SenbonSkill))
				usr.SenbonSkill+=rand(0.5,1)
			var/obj/Senbon/A = new
			A.damage = (usr.SenbonSkill/1.7)+2
			A.loc=usr.loc
			A.dir = usr.dir
			walk(A,usr.dir)
			if(senbon==1)
				del(src)
				return
			senbon-=1
			src.suffix = "You current have [src.senbon] in this stack"
*/


	/*Weights
		icon='Weights.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays += src.icon
					//usr.Weights()
					usr.weights=1
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
					usr.weights=0*/


	/*Weights
		icon='Weights.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays += src.icon
					usr.Weights()
					usr.Weights=1
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
					usr.Weights=0


mob/proc
	Weights()
		if(!usr.Weights)
			usr.MaxStamina += (1 *0.015)
			if(usr.Stamina > 0)
				if(usr.MaxStamina >= 75)
					usr.Spar_Gain()
				else
					usr.Stamina -= rand(1,3)
					usr.Spar_Gain()
					usr.MaxStamina += (1 *0.018)
			else
				usr.Health -= rand(1,3)
				usr.Ko()
			usr.waterproc=0
			spawn(30)
			usr.Weights()
		else
			usr.Weights=0*/


