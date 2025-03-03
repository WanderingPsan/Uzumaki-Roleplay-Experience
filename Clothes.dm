mob/var/Red=0
mob/var/Green=0
mob/var/Yellow=0
mob/var/Soldier=0
mob/var/Seishingan=0
mob/var/ShurikenSkill=1
mob/var/WindmillSkill=1
mob/var/KunaiSkill=1
mob/var/SenbonSkill=1
obj/items
	var/worn=0
	var/Title = ""
	var/Bolted = 0
	var/Bolter = null
	Nichibotsu_Ring
		icon='Akatsuki_Ring.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
				else
					src.worn = 0
					src.suffix=""
	verb
		Pick_Up()
			set src in oview(1)
			if(src.Bolted)
				usr<<"You cannot move this."
				return
			if(istype(src,/obj/items/Weapon/Shuriken))
				src.suffix = "You current have [src:shuriken] in this stack"
			if(istype(src,/obj/items/Weapon/Windmill))
				src.suffix = "You current have [src:Windmill] in this stack"
			if(istype(src,/obj/items/Weapon/Senbon))
				src.suffix = "You current have [src:senbon] in this stack"
			if(istype(src,/mob/Log/Log))
				viewers() << "<font color = white>(*<font color=[usr.SayFont]>[usr]picks up the Log<font color = white>*)"
			src.Move(usr)

		Drop()
			set src in usr.contents
			if(istype(src,/obj/items/Weapon/Shuriken))
				var/amount = input("How many shuriken would you like to drop? you current have [src:shuriken] in this stack.\n(Enter 0 to cancel)") as num
				if(amount==0||amount>src:shuriken)
					return
				usr.contents += src
				src:shuriken-=amount
				var/obj/items/Weapon/Shuriken/A = new
				A.shuriken=amount
				A.Move(usr.loc)
				if(amount>=src:shuriken)
					del(src)
			if(istype(src,/obj/items/Weapon/Log))
				var/mob/Log/Log/A = new
				A.loc=usr.loc
				A.Health=100
				A.MaxHealth=100
				A.Defense=usr.Defense/5
				A.attackable=1
				A.Savable=0
				del(src)
			if(istype(src,/obj/items/Weapon/Senbon))
				var/amount = input("How many shuriken would you like to drop? you current have [src:senbon] in this stack.\n(Enter 0 to cancel)") as num
				if(amount==0||amount>src:senbon)
					return
				usr.contents += src
				src:senbon-=amount
				var/obj/items/Weapon/Senbon/A = new
				A.senbon=amount
				A.Move(usr.loc)
				if(amount>=src:senbon)
					del(src)
			if(istype(src,/obj/items/Scrolls/Mission_Scroll))
				usr<<"That's too important to drop!"
				return
			if(!src.worn)
				src.Move(usr.loc)
				step(src,usr.dir)
				if(src.loc)
					for(var/mob/M in src.loc)
						if(M&&M.client)
							if(M.client.address==usr.client.address) return
							range(15,usr)<<output("[usr] hands [M] a [src].","World.IC")
							M.ChatLog("<font color=teal>*[usr] hands [M] a [src].")
							M.SpyLand("<font color=teal>*[usr] hands [M] a [src].")
							src.Move(M)
							break









obj/items/Scrolls
	Nichibotsu_Clothing
		icon='Scrolls.dmi'
		icon_state="5"
		verb/Summon_Clothing()
			set src in usr.contents
			var/obj/items/Clothing/Nichibotsu_Cloak/A = new()
			var/obj/items/Clothing/Nichibotsu_Hat/B = new()
			usr.contents += A
			usr.contents += B
	Earth_Scroll
		icon='scroll1.dmi'
		icon_state="Earth"
	Heaven_Scroll
		icon='scroll1.dmi'
		icon_state="Heaven"
	Scroll
		icon='Mscroll.dmi'
		var/profile2={"<html><head><center><title>Scroll</title></center></head><body>Text goes here</body>"}
		verb/Write_Scroll()
			profile2=input(usr,"Edit","Edit Profile",profile2) as message
		Click()
			if(src in usr.contents)
				usr<<browse(src.profile2,"window=[src];size=500x350")
				icon_state="read"
				sleep(50)
				icon_state=""
		verb
			Label_Scroll()
				var/newname = input("What will you change the name to?") as text
				if(newname==null)
					return
				src.name = newname


	Kage_Clothing
		icon='Scrolls.dmi'
		icon_state="3"
		verb/Summon_Clothing()
			set src in usr.contents
			var/obj/items/Clothing/Kage_Suit/A = new()
			var/obj/items/Clothing/Kage_Hat/B = new()
			usr.contents += A
			usr.contents += B
	MizuKage_Clothing
		icon='Scrolls.dmi'
		icon_state="1"
		verb/Summon_Clothing()
			set src in usr.contents
			var/obj/items/Clothing/MizuKage_Suit/A = new()
			var/obj/items/Clothing/MizuKage_Hat/B = new()
			usr.contents += A
			usr.contents += B
	RaiKage_Clothing
		icon='Scrolls.dmi'
		icon_state="5"
		verb/Summon_Clothing()
			set src in usr.contents
			var/obj/items/Clothing/RaiKage_Suit/A = new()
			var/obj/items/Clothing/RaiKage_Hat/B = new()
			usr.contents += A
			usr.contents += B
	AmeKage_Clothing
		icon='Scrolls.dmi'
		icon_state="5"
		verb/Summon_Clothing()
			set src in usr.contents
			var/obj/items/Clothing/AmeKage_Suit/A = new()
			var/obj/items/Clothing/AmeKage_Hat/B = new()
			usr.contents += A
			usr.contents += B
	KazeKage_Clothing
		icon='Scrolls.dmi'
		icon_state="1"
		verb/Summon_Clothing()
			set src in usr.contents
			var/obj/items/Clothing/KazeKage_Suit/A = new()
			var/obj/items/Clothing/KazeKage_Hat/B = new()
			usr.contents += A
			usr.contents += B
	Toad_Summoning
		icon='scroll1.dmi'
		icon_state="Tscroll"
		var/Kuchiyoseskill=1
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
		verb/Summon_Gamatumichi()
			set src in usr.contents
			for(var/mob/Summoning/Big_Frog/E in world)
				if(E.Owner==usr.key)
					usr << "You may only summon one Toad at a time."
					return
			if(usr.Chakra<usr.MaxChakra*(0.80/Kuchiyoseskill))
				return
			if(!usr.move)
				return
				if(prob(10/Kuchiyoseskill/Kuchiyoseskill/Kuchiyoseskill))
					usr<<"Your understanding of the Kuchiyose no Jutsu has increased."
					Kuchiyoseskill+=1

			usr.MaxNinjutsu += (1 *0.002)
			usr.Chakra-=usr.MaxChakra*(0.80/Kuchiyoseskill)
			var/mob/Summoning/Big_Frog/E = new()
			E.Owner = usr.key
			E.loc = usr.loc
			E.Health=100
			E.MaxHealth=100
			E.Chakra=usr.Chakra/1.5*rand(1.5,3)
			E.MaxChakra=usr.MaxChakra/1.5*rand(1.5,3)
			E.Strength=usr.Strength/1.5*rand(1.5,3)
			E.Agility=usr.Agility/2.5*rand(1.5,3)
			E.Defense=usr.Defense/2*rand(1.5,3)
			E.Control=usr.Control/1*rand(1.5,3)
			E.Resistance=usr.Resistance/1.5*rand(1.5,3)
			E.Taijutsu=usr.Taijutsu/1.5*rand(1.5,3)
			E.Ninjutsu=usr.Ninjutsu/2*rand(1.5,3)
			E.Genjutsu=usr.Genjutsu/1*rand(1.5,3)

			icon_state="Tread"
			sleep(50)
			icon_state="Tscroll"
obj/items/Clothing


	Panda_Hat
		icon = 'Pandahat.dmi'
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



	One_Sleeve_Suit
		icon = 'jumpsuitsso.dmi'
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

	Akimichi_Suit
		icon='Akimichi Suit.dmi'
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

	Bear_Hat
		icon = 'BearHat.dmi'
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
	Arm_Tattoo
		icon='blackgraytattooflamesfixed - othersidesso.dmi'
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

	Cat_Ears
		icon = 'Cat Ears.dmi'
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

	Samurai_Armour
		icon = 'Samurai Armor.dmi'
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

	Danzou_Suit
		icon = 'Danzou Suit yo.dmi'
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
	Purple_Dress
		icon = 'MonkClothes.dmi'
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
	Clayr_Jacket
		icon = 'Clayr Jacket.dmi'
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


	Nichibotsu_Cloak
		icon='Akatsuki_Cloak.dmi'
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

	Tobi_Mask
		icon='Tobi.dmi'
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


	KuraSword
		icon='KuraSword.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equiped**"
					usr.overlays +=src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon





	Kitsune_Mask
		icon='Akatsuki_Hat.dmi'
		Title = "**Concealed Figure**"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.name = "[src.Title]"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.name = usr.Oname
					usr.overlays += usr.hair
					usr.overlays -= src.icon






	Hidan_Scythe
		icon='HidanScythe.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equiped**"
					usr.overlays +=src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon





	Firefist
		icon='Firefist.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equiped**"
					usr.overlays +=src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon





	Sound_Amplifiers
		icon='Dosu_Sound Amplifier.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equiped**"
					usr.overlays +=src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon





	Claws
		icon='Claws.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equiped**"
					usr.overlays +=src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon





	Chain_Sword
		icon='Chain Sword.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equiped**"
					usr.overlays +=src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon








	Uchiha_Crest
		icon='UchihaCrest.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equiped**"
					usr.overlays +=src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon






	Skater_Goggles
		icon='Skater Goggles.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equiped**"
					usr.overlays +=src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon





	ANBU_Cloak
		icon='ANBU Cloak.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays -= usr.hair
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon





	Nichibotsu_Cloak
		icon='Akatsuki_Cloak.dmi'
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
	Nichibotsu_Hat
		icon='Akatsuki_Hat.dmi'
		Title = "**Concealed Figure**"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.name = "[src.Title]"
					usr.overlays -= usr.hair
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.name = usr.Oname
					usr.overlays += usr.hair
					usr.overlays -= src.icon





	Sound_Outfit
		icon='Clothing_Sound.dmi'
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

	Sound_Four
		icon='Sound_Four.dmi'
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

	Coat
		icon='Clothing_Coat.dmi'
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
	Kimono
		icon='Clothing_Kimono.dmi'
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


	Female_Coat
		icon='Clothing_Coat2.dmi'
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

	Gloves
		icon='Clothing_Gloves.dmi'
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
	Vest
		icon='Clothing_Vest.dmi'
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
	Belt
		icon='Clothing_Belt.dmi'
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
	Slash
		icon='Clothing_Slash.dmi'
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
	Leaf_Jounin
		icon='Clothing_Jounin.dmi'
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

	Hachimon_Master
		icon='Guy.dmi'
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

	Toad_Sage
		icon='Toad_Sage.dmi'
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

	Slug_Sage
		icon='Slug_Sage.dmi'
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

	Snake_Sage
		icon='Snake_Sage.dmi'
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
	Leaf_Chuunin
		icon='Clothing_LeafChuunin.dmi'
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
	Pants
		icon='Clothing_Pants.dmi'
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
	Suna_Jounin
		icon='Clothing_SandJounin.dmi'
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
	Suna_Chuunin
		icon='Clothing_SandChuunin.dmi'
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

	Suna_Cloak
		icon='Clothing_Suna_Cloak.dmi'
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
	Suna_Head_Scarf
		icon='Clothing_Suna.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays += src.icon
					usr.overlays -= usr.hair
				else
					src.worn = 0
					src.suffix=""
					usr.overlays -= src.icon
					usr.overlays += usr.hair


	Mist_Jounin
		icon='Clothing_MistJounin.dmi'
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
	Mist_Chuunin
		icon='Clothing_MistChuunin.dmi'
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
	Shirt
		icon='Clothing_Shirt.dmi'
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
	Scarf
		icon='Clothing_Scarf.dmi'
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

	Backwards_Scarf
		icon='Clothing_Backwards-Scarf.dmi'
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

	Shoes
		icon='Clothing_Shoes.dmi'
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
	Long_Shoes
		icon='Clothing_Long Shoes.dmi'
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
	Shorts
		icon='Shorts.dmi'
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
	Holster
		icon='Holster.dmi'
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




	Headband
		icon='Headband.dmi'
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
		verb/Show_Village()
			if(src.worn)
				viewers()<<"<font color=green>[usr] shows their Konohagakure no Sato Headband."
		verb/Change_Headband()
			if(src.worn)
				src.worn = 0
				src.suffix=""
				usr.overlays -= src.icon
			switch(input(" How would you like to wear your Headband?") in list("Chestband","Normal","Neck","Leg",/*"Bandanna",*/"Kakashi","Choji Style","Waist","Armored","Demon Styled","Cancel"))
				if("Kakashi")
					src.icon='Kakashi.dmi'
				if("Normal")
					src.icon='Headband.dmi'
				if("Leg")
					src.icon='Leg.dmi'
				if("Waist")
					src.icon='Waist.dmi'
				if("Choji Style")
					src.icon='Choji-Style.dmi'
				if("Neck")
					src.icon='Neck.dmi'
				if("Armored")
					src.icon='H_Headband.dmi'
				if("Demon Styled")
					src.icon='Demon Headband.dmi'
				if("Chestband")
					src.icon='Chestband.dmi'





	LeafHeadband
		icon='Headband.dmi'
		name = "Headband"
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
		verb/Show_Village()
			if(src.worn)
				viewers()<<"<font color=red>[usr] shows their Konohagakure no Sato Headband."
		verb/Change_Headband()
			if(src.worn)
				src.worn = 0
				src.suffix=""
				usr.overlays -= src.icon
			switch(input(" How would you like to wear your Headband?") in list("Chestband","Normal","Neck","Leg",/*"Bandanna",*/"Kakashi","Choji Style","Waist","Armored","Demon Styled","Cancel"))
				if("Kakashi")
					src.icon='KonoKakashi.dmi'
				if("Normal")
					src.icon='KonoNormal.dmi'
				if("Leg")
					src.icon='KonoLeg.dmi'
				if("Waist")
					src.icon='KonoWaist.dmi'
				if("Choji Style")
					src.icon='KonoChoji.dmi'
				if("Neck")
					src.icon='KonoNeck.dmi'
				if("Armored")
					src.icon='KonoMask.dmi'
				if("Demon Styled")
					src.icon='KonoDemon.dmi'
				if("Chestband")
					src.icon='KonoChestband.dmi'



	CloudHeadband
		name = "Headband"
		icon='KumoNormal.dmi'
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
		verb/Show_Village()
			if(src.worn)
				viewers()<<"<font color=silver>[usr] shows their Kumogakure no Sato Headband."
		verb/Change_Headband()
			if(src.worn)
				src.worn = 0
				src.suffix=""
				usr.overlays -= src.icon
			switch(input(" How would you like to wear your Headband?") in list("Chestband","Normal","Neck","Leg","Kakashi","Choji Style","Waist","Armored","Demon Styled","Cancel"))
				if("Kakashi")
					src.icon='KumoKakashi.dmi'
				if("Normal")
					src.icon='KumoNormal.dmi'
				if("Leg")
					src.icon='KumoLeg.dmi'
				if("Waist")
					src.icon='KumoWaist.dmi'
				if("Choji Style")
					src.icon='KumoChoji.dmi'
				if("Neck")
					src.icon='KumoNeck.dmi'
				if("Armored")
					src.icon='KumoMask.dmi'
				if("Demon Styled")
					src.icon='KumoDemon.dmi'
				if("Chestband")
					src.icon='KumoChestband.dmi'




	MistHeadband
		name = "Headband"
		icon='KiriNormal.dmi'
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
		verb/Show_Village()
			if(src.worn)
				viewers()<<"<font color=cyan>[usr] shows their Kirigakure no Sato Headband."
		verb/Change_Headband()
			if(src.worn)
				src.worn = 0
				src.suffix=""
				usr.overlays -= src.icon
			switch(input(" How would you like to wear your Headband?") in list("Chestband","Normal","Neck","Leg","Kakashi","Choji Style","Waist","Armored","Demon Styled","Cancel"))
				if("Kakashi")
					src.icon='KiriKakashi.dmi'
				if("Normal")
					src.icon='KiriNormal.dmi'
				if("Leg")
					src.icon='KiriLeg.dmi'
				if("Waist")
					src.icon='KiriWaist.dmi'
				if("Choji Style")
					src.icon='KiriChoji.dmi'
				if("Neck")
					src.icon='KiriNeck.dmi'
				if("Armored")
					src.icon='KiriMask.dmi'
				if("Demon Styled")
					src.icon='KiriDemon.dmi'
				if("Chestband")
					src.icon='KiriChestband.dmi'



	SandHeadband
		name = "Headband"
		icon='SunaNormal.dmi'
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
		verb/Show_Village()
			if(src.worn)
				viewers()<<"<font color=olive>[usr] shows their Sunagakure no Sato Headband."
		verb/Change_Headband()
			if(src.worn)
				src.worn = 0
				src.suffix=""
				usr.overlays -= src.icon
			switch(input(" How would you like to wear your Headband?") in list("Chestband","Normal","Neck","Leg","Kakashi","Choji Style","Waist","Armored","Demon Styled","Cancel"))
				if("Kakashi")
					src.icon='SunaKakashi.dmi'
				if("Normal")
					src.icon='SunaNormal.dmi'
				if("Leg")
					src.icon='SunaLeg.dmi'
				if("Waist")
					src.icon='SunaWaist.dmi'
				if("Choji Style")
					src.icon='SunaChoji.dmi'
				if("Neck")
					src.icon='SunaNeck.dmi'
				if("Armored")
					src.icon='SunaMask.dmi'
				if("Demon Styled")
					src.icon='SunaDemon.dmi'
				if("Chestband")
					src.icon='SunaChestband.dmi'


	RainHeadband
		name = "Headband"
		icon='AmeNormal.dmi'
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
		verb/Show_Village()
			if(src.worn)
				viewers()<<"<font color=purple>[usr] shows their Amegakure no Sato Headband."
		verb/Change_Headband()
			if(src.worn)
				src.worn = 0
				src.suffix=""
				usr.overlays -= src.icon
			switch(input(" How would you like to wear your Headband?") in list("Chestband","Normal","Neck","Leg","Kakashi","Choji Style","Waist","Armored","Demon Styled","Cancel"))
				if("Kakashi")
					src.icon='AmeKakashi.dmi'
				if("Normal")
					src.icon='AmeNormal.dmi'
				if("Leg")
					src.icon='AmeLeg.dmi'
				if("Waist")
					src.icon='AmeWaist.dmi'
				if("Choji Style")
					src.icon='AmeChoji.dmi'
				if("Neck")
					src.icon='AmeNeck.dmi'
				if("Armored")
					src.icon='AmeMask.dmi'
				if("Demon Styled")
					src.icon='AmeDemon.dmi'
				if("Chestband")
					src.icon='AmeChestband.dmi'
	Cloak
		icon='Clothing_Cloak.dmi'
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
	Robe
		icon='Clothing_Cloak2.dmi'
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
	Boots
		icon='Clothing_Boots.dmi'
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


	Anbu_Mask_Red
		icon='Clothing_AnbuMask.dmi'
		Title = "ANBU Agent"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.name = "[src.Title]"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.name = usr.Oname
					usr.overlays += usr.hair
					usr.overlays -= src.icon
	Anbu_Armor
		icon='Clothing_Anbu.dmi'
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
	Anbu_Mask_Blue
		icon='Clothing_AnbuMask2.dmi'
		Title = "ANBU Agent"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.name = "[src.Title]"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.name = usr.Oname
					usr.overlays += usr.hair
					usr.overlays -= src.icon
	Long_Sleeved_Shirt
		icon='Clothing_LongShirt.dmi'
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
	Jacket
		icon='Clothing_Jacket.dmi'
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
	Naruto_Jacket
		icon='Naruto_Jacket.dmi'
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

	Naruto_Shippuuden_Jacket
		icon='Naruto_Shippuuden.dmi'
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


	Sasuke_Suit
		icon='Sasuke_Suit.dmi'
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

	Arm_Band
		icon='Arm Band.dmi'
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

	Sleeveless_Jacket
		icon='ShortJacket.dmi'
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
	Facemask
		icon='Clothing_Facemask.dmi'
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
	Kage_Suit
		icon='Clothing_KageLeaf.dmi'
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
	Kakashi_Suit
		icon='Clothing_Kakashi.dmi'
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

	First_Hokage_Suit
		icon='1st Hokage.dmi'
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


	Kage_Hat
		icon='Kage_Hat.dmi'
		Title = "**Hokage**"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.name = "[src.Title]"
					usr.overlays -= usr.hair
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.name=usr.Oname
					usr.overlays += usr.hair
					usr.overlays -= src.icon
	Curse_Seal_Container
		icon='CS.dmi'
		Click()
			if(src in usr.contents)
				if(!usr.Seishingan)
					return
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays -= usr.hair
					usr.overlays += src.icon
					usr.move=0
					sleep(rand(1000,2200))
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon
					usr.move=1
					if(usr.Earth_HasCurseSeal)
						usr.Earth_HasCurseSeal2=1
					if(usr.Stone_HasCurseSeal)
						usr.Stone_HasCurseSeal2=1
					if(usr.Heaven_HasCurseSeal)
						usr.Heaven_HasCurseSeal2=1
					del(src)


	MizuKage_Suit
		icon='Clothing_KiriKage.dmi'
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
	MizuKage_Hat
		icon='KiriKage_Hat.dmi'
		Title = "**Mizukage**"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.name = "[src.Title]"
					usr.overlays -= usr.hair
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.name = usr.Oname
					usr.overlays += usr.hair
					usr.overlays -= src.icon

	KazeKage_Suit
		icon='Clothing_SunaKage.dmi'
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
	KazeKage_Hat
		icon='Suna_Hat.dmi'
		Title = "**KazeKage**"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.name = "[src.Title]"
					usr.overlays -= usr.hair
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.name = usr.Oname
					usr.overlays += usr.hair
					usr.overlays -= src.icon

	Medical_Suit
		icon='Clothing_Medical.dmi'
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
	Medical_Hat
		icon='Clothing_Medic-Hat.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays -= usr.hair
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon

	Aburame_Jacket
		icon='Aburame JacketSSO2.dmi'
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

	Port_Hat
		icon='Ace Hat.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays -= usr.hair
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon

	Toad_Sage_Mask
		icon='ANBU Toad Mask SS.dmi'
		Title = "**ANBU Agent**"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.name = "[src.Title]"
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.name = usr.Oname
					usr.overlays +=usr.hair
					usr.overlays -= src.icon

	Arm_ClothLeft
		icon='Arm Wrap Left.dmi'
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

	Arm_ClothRight
		icon='Arm Wrap Right.dmi'
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

	Bahamut_Garb
		icon='Bahamut Garb.dmi'
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

	Chest_Bandage
		icon='Bandage_Chest(1).dmi'
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

	Chest_Patch
		icon='Bandage_Chest.dmi'
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

	Bra
		icon='Bra.dmi'
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

	Chuck_Norris_Hat
		icon='Black Hat.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays -= usr.hair
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon

	Clothing_Keyo
		icon='Clothes Keyo1.dmi'
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

	Back_Scrolls
		icon='Clothing_Backscrolls1.dmi'
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


	Flowing_Cloak
		icon='Clothing_Flowing Cloak.dmi'
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

	Jet_Jacket
		icon='Clothing_Jet Jacket.dmi'
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

	Tribal_Mask
		icon='Clothing_Mask01.dmi'
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

	Rein_Uniform
		icon='Custom 4th Hokage Cloak.dmi'
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

	Demon_Brother_Headband
		icon='Demon Headband.dmi'
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

	Demon_Brother_Clothes
		icon='Demon bro gear.dmi'
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

	Demon_Brother_Cloak
		icon='Demon bro cloak.dmi'
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

	Dosu_Poncho
		icon='Dosu_Poncho.dmi'
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

	Edward_Elric_Shirt
		icon='Elric Shirt.dmi'
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


	Face_Wrappings
		icon='Face_Bandages.dmi'
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

	Hood_Shin_Coat
		icon='Ghetto Shin Coat.dmi'
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

	Obito_Goggles
		icon='Goggles.dmi'
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

	Axe_Guitar
		icon='guitar axe.dmi'
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


	Eye_Wrap
		icon='Eye Band.dmi'
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



	Blindfold
		icon='White headband.dmi'
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


	Hand_Wraps
		icon='Hand Wraps (SS).dmi'
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

	Insomniac_Eyes
		icon='Insomniac Eyes.dmi'
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

	Hijikata_Robes
		icon='Hijikata Robe.dmi'
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

	Memori_Eyes
		icon='Memori Drake Eyes.dmi'
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

	Natsu_Top
		icon='Natsu Top.dmi'
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

	Natsu_Bottoms
		icon='Natsu bottoms.dmi'
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

	Obito_Jacket
		icon='Obito Jacket.dmi'
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

	Radio_Comm
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

	Wings
		icon='Raven Wings.dmi'
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

	Red_Scroll
		icon='Red Scroll.dmi'
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

	Rib_Wrappings
		icon='Rib-bandages.dmi'
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

	Sham_Cloak
		icon='Sham Cloak.dmi'
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

	Shino_Coat
		icon='Shino Coat.dmi'
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

	Tilted_Headband
		icon='Sideways_Band.dmi'
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
	SinX_Shirt_Dark
		icon='SinX shirt Dark V.dmi'
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

	SinX_Shirt
		icon='SinX shirt.dmi'
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

	Ningetsu_Jacket
		icon='SS_Red-Collar Jacket.dmi'
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

	Kurapika_Robe
		icon='Uriahima Robe.dmi'
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



	Armored_Faceplate
		icon='H_Headband.dmi'
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

	Gas_Mask
		icon='Gas Mask.dmi'
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

	Kitsune_Mask
		icon='Kitsune Mask.dmi'
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
	Nez_Blackshirt
		icon='Blackshirt.dmi'
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

	Nez_Black_Stripe
		icon='BlackWhitestripe.dmi'
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

	Nez_Black_Polo
		icon='Blackpolo.dmi'
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

	Nez_Alt_Domo
		icon='AltDomo.dmi'
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

	Nez_Blue_Polo
		icon='BluePolo.dmi'
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

	Nez_Brown_Stripe
		icon='BrownWhiteStripe.dmi'
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

	Nez_Domo
		icon='Domo.dmi'
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

	Nez_Flag_Shirt
		icon='FlagShirt.dmi'
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

	Nez_Green_Stripe
		icon='GreenBlackStripe.dmi'
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

	Nez_Green_Hoodie
		icon='GreenHoodie.dmi'
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

	Nez_Green_Up
		icon='GreenUpShirt.dmi'
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

	Nez_Gray_Hoodie
		icon='GreyHoodie.dmi'
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

	Nez_Marsh
		icon='Marsh.dmi'
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

	Nez_Pink_Stripe
		icon='PinkBlueStripe.dmi'
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

	Nez_Pink_Hoodie
		icon='PinkHoodie.dmi'
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

	Nez_Purple_Hoodie
		icon='PurpleHoodie.dmi'
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

	Nez_Rimu
		icon='Rimuz.dmi'
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

	Nez_Silver_Hoodie
		icon='SilverHoodie.dmi'
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
	RaiKage_Suit
		icon='Clothing_KumoKage.dmi'
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
	RaiKage_Hat
		icon='KumoKageHat.dmi'
		Title = "**Raikage**"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.name = "[src.Title]"
					usr.overlays -= usr.hair
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.name = usr.Oname
					usr.overlays += usr.hair
					usr.overlays -= src.icon
					usr.name = usr.Oname
	Kumo_Chunin
		icon='Clothing_Kumo_Chunin.dmi'
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

	Kumo_Jonin
		icon='Clothing_Kumo_Jonin.dmi'
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

	AmeKage_Suit
		icon='Clothing_AmeKage.dmi'
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
	AmeKage_Hat
		icon='AmeKageHat.dmi'
		Title = "**Amekage**"
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.name = "[src.Title]"
					usr.overlays -= usr.hair
					usr.overlays += src.icon
				else
					src.worn = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon
					usr.name = usr.Oname
	Ame_Chunin
		icon='Clothing_Ame_Chunin.dmi'
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

	Ame_Jonin
		icon='Clothing_Ame_Jonin.dmi'
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































