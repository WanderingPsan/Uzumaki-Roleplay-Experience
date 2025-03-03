mob/var/Hatchet
obj/items/Citem
	var
		Type=""
		Quality=""

	Hatchet
		icon='Citem.dmi'
		icon_state = "Hatchet"
		Click()
			if(!usr.Hatchet)
				usr.Hatchet = 1
				src.suffix = "**Ready**"
			else
				usr.Hatchet = 0
				src.suffix = ""
	Pickaxe
		icon='Citem.dmi'
		icon_state="Pickaxe"
		Click()
			if(istype(usr.loc,/turf/Terrain/) || istype(usr.loc,/turf/Tsukuyomi/))
				usr.mining = 1
				winshow(usr,"Bane",1)
			else
				usr<<"You must be in a cave or in a sandy area to mine."
				return



	Hard_Wood
		icon='Citem.dmi'
		icon_state = "HarWood"
	Soft_Wood
		icon='Citem.dmi'
		icon_state = "SofWood"
	MagWoo
		icon='Citem.dmi'
		icon_state = "MagWoo"

	Paper
		icon='Citem.dmi'
		icon_state="paper"
	Chakra_Orb
		icon='Citem.dmi'
		icon_state="Magic Nexus"

	Soft_Wood_Plank
		icon='Citem.dmi'
		icon_state="SoftWoo"
		Type = "Wood"
		Quality = "Soft"
	Hard_Wood_Plank
		icon='Citem.dmi'
		icon_state="HardWoo"
		Type = "Wood"
		Quality = "Hard"
	MagPlank
		icon='Citem.dmi'
		icon_state="MagPlank"

	Iron_Bar
		icon='Citem.dmi'
		icon_state="IBar"
		Type = "Bar"
		Quality = "Iron"
	Aeratum_Bar
		icon='Citem.dmi'
		icon_state="ABar"
		Type = "Bar"
		Quality = "Aeratum"
	MagBar
		icon ='Citem.dmi'
		icon_state="MagBar"

	MagBlade
		icon='Citem.dmi'
		icon_state="MagBlade"



	Hard_Wood_Pommel
		icon='Citem.dmi'
		icon_state="HardWooPom"
		Type = "Pommel"
		Quality = "Hard"
	Soft_Wood_Pommel
		icon='Citem.dmi'
		icon_state="SoftWooPom"
		Type = "Pommel"
		Quality = "Soft"
	MagPom
		icon='Citem.dmi'
		icon_state="MagPom"

	Iron_Blade
		icon='Citem.dmi'
		icon_state="IBlade"
		Type = "Blade"
		Quality = "Iron"
	Aeratum_Blade
		icon='Citem.dmi'
		icon_state="ABlade"
		Type = "Blade"
		Quality = "Aeratum"

	Iron_Dagger
		icon='Citem.dmi'
		icon_state="IroDagger"
		Type = "Dagger"
		Quality = "Iron"
	Aeratum_Dagger
		icon='Citem.dmi'
		icon_state="AerDagger"
		Type = "Dagger"
		Quality = "Aeratum"

	Chain
		icon='Citem.dmi'
		icon_state="Chain"
	Scythe_Blades
		icon='Citem.dmi'
		icon_state="ScyBlades"

	Motor
		icon='Citem.dmi'
		icon_state="Motor"

	Katana_Hilt
		icon='Citem.dmi'
		icon_state="Hilt"
	Katana_Sheathe
		icon='Citem.dmi'
		icon_state="Sheathe"
	Katana_Blade
		icon='Citem.dmi'
		icon_state = "Katana"

	Gun_Barrel
		icon='Citem.dmi'
		icon_state = "Barrel"
	Energy_Core
		icon='Citem.dmi'
		icon_state = "Energy Core"
	Energy_Limiter
		icon='Citem.dmi'
		icon_state = "Limiter"
	Gun_Handle
		icon='Citem.dmi'
		icon_state = "GHandle"

	Magic_Nexus
		icon='Citem.dmi'
		icon_state = "Magic Nexus"