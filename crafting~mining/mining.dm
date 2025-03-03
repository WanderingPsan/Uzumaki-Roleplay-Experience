obj/tools
	Anvil
		icon = 'Cstuff.dmi'
		icon_state="anvill"
		density = 1
		verb
			Forge_Soul_Calibur()
				if(locate(/obj/items/Soul_Shard,usr.contents))
					set src in oview(1)
					usr << "<b>You begin to smith."
					sleep(rand(10))
					usr << "<b>You made the soul sword!"
					for(var/obj/items/Soul_Shard/B in usr.contents)
						del(B)
					usr.contents += new/obj/items/Weapon/Soul_Calibur
				else
					usr << "<b>You need Soul Shards to smith this!"

			Forge_Soul_Edge()
				if(locate(/obj/items/Soul_Shard,usr.contents))
					set src in oview(1)
					usr << "<b>You begin to smith."
					sleep(rand(10))
					usr << "<b>You made the soul sword... What type of evil have you unleashed!"
					for(var/obj/items/Soul_Shard/B in usr.contents)
						del(B)
					usr.contents += new/obj/items/Weapon/Soul_Edge
				else
					usr << "<b>You need Soul Shards to smith this!"

			Forge_Samurai_Sword()
				if(locate(/obj/items/iron_bar,usr.contents))
					set src in oview(1)
					usr << "<b>You begin to smith."
					sleep(rand(10))
					usr << "<b>You made a Samurai Sword!"
					for(var/obj/items/iron_bar/B in usr.contents)
						del(B)
					usr.contents += new/obj/items/Weapon/Samurai_Sword
				else
					usr << "<b>You need bars to smith!"

			Forge_Tanto()
				if(locate(/obj/items/iron_bar,usr.contents))
					set src in oview(1)
					usr << "<b>You begin to smith."
					sleep(rand(10))
					usr << "<b>You made a Tanto!"
					for(var/obj/items/iron_bar/B in usr.contents)
						del(B)
					usr.contents += new/obj/items/Weapon/Tanto
				else
					usr << "<b>You need bars to smith!"

			Forge_Kunai()
				if(locate(/obj/items/iron_bar,usr.contents))
					set src in oview(1)
					usr << "<b>You begin to smith."
					sleep(rand(10))
					usr << "<b>You made 2 Kunai!"
					for(var/obj/items/iron_bar/B in usr.contents)
						del(B)
					usr.contents += new/obj/items/Weapon/Kunai
					usr.contents += new/obj/items/Weapon/Kunai
				else
					usr << "<b>You need bars to smith!"


obj/tools
	Forge
		icon = 'Cstuff.dmi'
		icon_state="forge"
		density = 1
		verb
			Forge()
				if(locate(/obj/items/iron_ore,usr.contents))
					set src in oview(1)
					usr << "<b>You begin to forge."
					sleep(rand(10))
					usr << "<b>You made iron bar!"
					for(var/obj/items/iron_ore/B in usr.contents)
						del(B)
					usr.contents += new/obj/items/iron_bar
				else
					usr << "<b>You need a ore to smith!"

obj/items
	pickaxe
		icon = 'Cstuff.dmi'
		icon_state = "pickaxe"
		verb/Get()
			set src in oview(0)
			usr.contents+=new/obj/items/pickaxe//This adds a mace to usr.contents *Note* always use the new var cause if you don't you will get nasty run time errors//
			del(src)

obj/tools/Stone
	icon = 'Cstuff.dmi'
	icon_state = "rock"
	name = "storn"
	density = 1
	verb
		Mine()
			set src in oview(1)
			var/obj/pickaxe = locate(/obj/items/pickaxe) in usr.contents
			if(pickaxe)
				usr << "<b>You begin to mine."
				sleep(10)
				if (prob(50))
					usr << "<b>You found something!"
					sleep(5)
					usr << "<b>You found iron!"
					usr.contents+=new/obj/items/iron_ore
				else
					usr << "<b>You don't find anything."
			else
				usr << "<b>You need a pickaxe to mine."
obj/items
	iron_ore
		icon = 'Cstuff.dmi'
		icon_state = "iron"
		verb/Get()
			set src in oview(0)
			usr.contents+=new/obj/items/iron_ore//This adds a mace to usr.contents *Note* always use the new var cause if you don't you will get nasty run time errors//
			del(src)

obj/items
	iron_bar
		icon = 'Cstuff.dmi'
		icon_state = "ironbar"
		verb/Get()
			set src in oview(1)
			usr.contents+=new/obj/items/iron_bar//This adds a mace to usr.contents *Note* always use the new var cause if you don't you will get nasty run time errors//
			del(src)

obj/items
	Soul_Shard
		icon = 'Soul Shard.dmi'
		icon_state = "soul"
		verb/Get()
			set src in oview(1)
			usr.contents+=new/obj/items/Soul_Shard//This adds a mace to usr.contents *Note* always use the new var cause if you don't you will get nasty run time errors//
			del(src)

obj/items/Weapon
	Soul_Edge
		icon='Soul Edge.dmi'
		icon_state=""
		name = "Soul Edge"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.9
					usr.Defense *= 1.9
					usr.Offence *= 1.9
					usr.Taijutsu *= 1.9
					usr.Health *= 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
					usr.Chakra *= 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Defense = usr.MaxDefense
					usr.Offence = usr.MaxOffence
					usr.Agility = usr.MaxAgility
	Soul_Calibur
		icon='Soul Calibur.dmi'
		icon_state=""
		name = "Soul Calibur"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.Weapon=1
					usr.overlays += src.icon
					usr.Agility *= 1.9
					usr.Defense *= 1.9
					usr.Offence *= 1.9
					usr.Taijutsu *= 1.9
					usr.Health *= 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
					usr.Chakra *= 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
				else
					src.worn = 0
					src.suffix=""
					usr.Weapon=0
					usr.overlays -= src.icon
					usr.Taijutsu = usr.MaxTaijutsu
					usr.Defense = usr.MaxDefense
					usr.Offence = usr.MaxOffence
					usr.Agility = usr.MaxAgility