obj/items/Weapon
	Gem_Weapon
		icon = 'Zanbatou.dmi'
		icon_state=""
		var/WeaponSet = 0
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
		verb
			Set_Form()
				if(src.WeaponSet)
					usr<<"Your weapon form has already been chosen."
					return
				var/Form = input("What form do you want the weapon to take?") in list("Katana","Bow Sword","Chained Scythes","Cross Blade","Battle Gauntlets","Glaive","Spear","Tanto","Cleaver","Other","Cancel")
				if(Form=="Katana")
					src.icon = 'Katana.dmi'
					src.WeaponSet=1
				if(Form=="Bow Sword")
					src.icon = 'Bow Sword right.dmi'
					src.WeaponSet=1
				if(Form=="Chained Scythes")
					src.icon = 'Black Star Chained Scythe.dmi'
					src.WeaponSet=1
				if(Form=="Cross Blade")
					src.icon = 'Sword_Sheathed.dmi'
					src.WeaponSet=1
				if(Form=="Battle Gauntlets")
					src.icon = 'Demon Bro Arm.dmi'
					src.WeaponSet=1
					var/obj/items/Weapon/Gem_Weapon/B = new
					usr.contents+= B
					B.WeaponSet=1
					B.icon = 'Demon Bro Arm 2.dmi'
				if(Form=="Glaive")
					src.icon = 'Hand Blade.dmi'
					src.WeaponSet=1
				if(Form=="Spear")
					src.icon = 'Spear.dmi'
					src.WeaponSet=1
				if(Form=="Tanto")
					src.icon = 'Tanto.dmi'
					src.WeaponSet=1
				if(Form=="Cleaver")
					src.WeaponSet=1
				if(Form=="Other")
					usr<<"Alert an Admin."





obj/items/Weapon
	Custom_Katana
		icon='Katana.dmi'
		icon_state=""
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon

				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon

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




	Bow_Sword
		icon='Bow Sword right.dmi'
		icon_state="Inv"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon

		verb
			Switch_Hands()
				if(src.icon=='Bow Sword right.dmi')
					usr.overlays -= src.icon
					src.icon = 'Bow Sword left.dmi'
					usr.overlays += src.icon
				else
					if(src.icon=='Bow Sword left.dmi')
						usr.overlays -= src.icon
						src.icon = 'Bow Sword right.dmi'
						usr.overlays += src.icon