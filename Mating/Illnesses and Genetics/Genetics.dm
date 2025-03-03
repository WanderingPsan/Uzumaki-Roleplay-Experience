mob/var
	Viewer = 0
	Viewed = 0
	Viewet = ""
	EyeViewer = 0

obj/Gene
	icon='DNA.dmi'
	High_Healing_Rate
		suffix = "This character has a higher than normal rate of healing."
	Transformation_Release
		suffix = "This character has been exposed to the light of a Henkan and now has Transform Release Chakra. They need to be exposed to the blood of a Dorukyo in order to activate this gene and gain the ability to use Henkan."
	Monstrous_Chakra
		suffix = "This character has naturally high levels chakra."
	Small_Reservoir
		suffix = "This character suffers from below average chakra levels.."
	Monstrous_Stamina
		suffix = "This character has naturally high levels of stamina."
	Depleting_Stamina
		suffix = "This character doesn't last long in battle, their stamina is cut drastically."
	Monster_Body
		suffix = "This character has naturally high physical durability."
	Fragile_Body
		suffix = "This character breaks easily from physical attacks."
	Sharingan
		suffix = "This character has the ability to unlock the Special Doujutsu Kekkei Genkai of the Uchiha Clan; The Sharingan."
	Byakugan
		suffix = "This character has the ability to use the Kekkei Genkai of the Hyuuga; The Byakugan."
	Rinnegan
		suffix = "This character has the ability to unlock the Special Doujutsu of the Sage of Six Paths; The Rinnegan."
	Wood_Release
		suffix = "This character has the Wood Release."
	Lava_Release
		suffix = "This character has the Lava Release."
	Scorch_Release
		suffix = "This character has the Scorch Release."
	Steel_Release
		suffix = "This character has the Steel Release."
	Ice_Release
		suffix = "This character has the Ice Release."
//	Illusion_Release
//		suffix = "This character has the Illusion Release."
	Boil_Release
		suffix = "This character has the Boil Release."
	Storm_Release
		suffix = "This character has the Storm Release."
	Magnetism_Release
		suffix = "This character has the Magnetism Release."
	Crystal_Release
		suffix = "This character has the Crystal Release."
	Steam_Release
		suffix = "This character has the Steam Release."
	Blaze_Release
		suffix = "This character has the Blaze Release."
	Dust_Release
		suffix = "This character has the Dust Release."
	Dark_Release
		suffix = "This character has the Dark Release."
	Swift_Release
		suffix = "This character has the Swift Release."
	Explosion_Release
		suffix = "This character has the Explosion Release."
//	Hero_Release
//		suffix = "This character has the Hero Release."
	Custom_Release
		suffix = "This character has this release."
	Shikotsumyaku
		suffix = "This character has the Kaguya Bloodline Limit and is able to manipulate their bones."
	Longevity
		suffix = "This character has an extreme amount of life-force and will live for a very long time."
	High_Speed
		suffix = "This character has naturally high speed and agility."
	Low_Speed
		suffix = "This character is slow as hell."
	High_Defense
		suffix = "This character has naturally high Defense."
	Low_Defense
		suffix = "This character has naturally low Defense."
	High_Intelligence
		suffix = "This character has an extremely high level of intelligence."
	Low_Intelligence
		suffix = "This character isn't the smartest cookie in the jar."
	Great_Constitution
		suffix = "This character is naturally extremely healthy and less likely to contract illnesses."
	Chakra_Borne_Illness
		suffix = "This character has a Chakra Borne Illness. Their life will be cut short unless they can get their hands on the required medicine. But they have extremely high chakra levels and aptitude for learning new jutsu."
	Custom_Dojutsu
		suffix = "This character has the ability to develop a Dojutsu based upon their choices as a shinobi."
	Child_of_Grandeur
		suffix = "This character is a descendant of Pickles. This Gene is unrecognizable without the proper IC Study."
	Grand_Illusion
		suffix = "This character is a carrier of an, as of yet, unheard of and never before seen technique."
	Sanderwicci
		suffix = "This character has the Sandwich Making Gene passed on by an offshoot branch of Pickles's family. They are able to create sandwiches and other food with their chakra and imagination."
	Child
		suffix = "This character is a child. Their age affects their progress as a shinobi to certain extent."
	Reflexive
		suffix = "This character is extemely reflexive."
	High_Control
		suffix = "This character is amazing control over their chakra."
	Low_Control
		suffix = "This character has trouble controling their chakra."
	Monstrous_Strength
		suffix = "This character has a lot of physical strength."
	Miniscule_Strength
		suffix = "This character has low physical strength."


obj/Gene
	Blank_Gene



obj/items/Citem/tools
	Gene_Viewer
		icon='Viewer.dmi'
		verb
			View_Genes(mob/M in view(1))
				M<<"[usr] scans your body, allowing them to see your Genes and Illnesses"
				usr.Viewer = 1
				M.Viewed = 1
				M.Viewet = "[usr]"
				M.JConst -= 70
				var/obj/Illness/Nausea/N = new(M)
				sleep(500)
				M.Viewed = 0
				M.Viewet = ""
				del N



obj/items/Clothing
	Eye_Viewer
		icon= 'Scouter.dmi'
		Click()
			if(src in usr.contents)
				if(!src.worn)
					src.worn = 1
					src.suffix = "**Equipped**"
					usr.overlays +=src.icon
					usr.EyeViewer = 1
				else
					src.worn = 0
					usr.EyeViewer = 0
					src.suffix=""
					usr.overlays += usr.hair
					usr.overlays -= src.icon