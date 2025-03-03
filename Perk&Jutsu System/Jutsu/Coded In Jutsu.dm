obj/Custom
	var/RPPCost = 0
	var/CalDran
	Click()
		if(src in usr.contents)
			if(src.name == "Sickle Weasel Technique")
				var/obj/items/Weapon/Kyodai_Sensu/A = locate() in usr.contents
				if(A)
					usr<<"You swing your fan!"
				else
					usr<<"You need a fan for that."
					return
			if(src.CalDran > 0)
				if(usr.Calories >= src.CalDran)
					var/Cost = src.CalDran
					var/times = input("How many times will you use this jutsu?")as num
					var/chiz = Cost * times
					for(var/obj/Perk/A in usr.contents)
						if(findtext("[A.name]","Control"))
							if(A.tier==1)
								Cost = src.CalDran*0.90
							if(A.tier==2)
								Cost = src.CalDran*0.80
							if(A.tier==3)
								Cost = src.CalDran*0.70
							if(A.tier==4)
								Cost = src.CalDran*0.60
							if(A.tier==5)
								Cost = src.CalDran*0.50
							if(A.tier=="Master")
								Cost = src.CalDran*0.40
						if(findtext("[A.name]","Calorie Fighter"))
							Cost = Cost/2
					if(usr.Calories>=Cost*times)
						usr.Calories-=Cost*times
						viewers(16) << "<font color=[usr.SayFont]>[usr] Just used a Jutsu <center><hr><br>[src.name](<font color=white>[jut]</font>) <hr><br> [src.description]<hr><br>Calorie Drain: [chiz] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele]"
						usr.SkillUp()
						src.ErpUp()
					return

			if(src.idran == "Chakra")
				var/Cost = src.dran
				var/times = input("How many times will you use this jutsu?")as num
				for(var/obj/Perk/A in usr.contents)
					if(findtext(A.name,"Elemental Training [src.ele]"))
						if(A.tier==1)
							Cost -= src.dran*0.10
						if(A.tier==2)
							Cost -= src.dran*0.20
						if(A.tier==3)
							Cost -= src.dran*0.30
						if(A.tier==4)
							Cost -= src.dran*0.40
						if(A.tier==5)
							Cost -= src.dran*0.50
						if(A.tier=="Master")
							Cost -= src.dran*0.60
					if(findtext(A.name,"Chakra Control"))
						if(src.ele == "Elementless" || !src.ele == "Fire" || !src.ele == "Water" || !src.ele == "Lightning" || !src.ele == "Wind" || !src.ele == "Earth")
							if(A.tier==1)
								Cost -= src.dran*0.10
							if(A.tier==2)
								Cost -= src.dran*0.20
							if(A.tier==3)
								Cost -= src.dran*0.30
							if(A.tier==4)
								Cost -= src.dran*0.40
							if(A.tier==5)
								Cost -= src.dran*0.50
							if(A.tier=="Master")
								Cost -= src.dran*0.60
				if(usr.Jchakra>=Cost*times)
					usr.Jchakra-=Cost*times
					viewers(16) << output("<font color=[usr.SayFont]>[usr] Just used a Jutsu <center><hr><br>[src.name](<font color=white>[jut]</font>) <hr><br> [src.description]<hr><br>Chakra Drain: [Cost*times] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele]","World.OOC")
					usr.SkillUp()
					if(src.ele=="Fire")
						var/obj/HousenkaAbil/A = new
						A.loc=usr.loc
						A.dir=usr.dir
						walk(A,usr.dir)
					if(src.ele=="Water")
						var/obj/SuiryuudanAbil/A = new
						A.loc=usr.loc
						A.dir = usr.dir
						walk(A,usr.dir)
					if(src.ele=="Lightning")
						var/obj/IkadzuchiAbil/A = new
						A.loc=usr.loc
						A.dir = usr.dir
						walk(A,usr.dir)
					if(src.ele=="Wind")
						var/obj/KazeAbil/A = new
						A.loc=usr.loc
						A.dir = usr.dir
						walk(A,usr.dir)
					if(src.ele=="Earth")
						var/obj/Rock/A = new
						A.loc = usr.loc
						A.dir = usr.dir
						walk(A,usr.dir)
					if(prob(35))
						src.RPPSpent += rand(0.5,0.8)
						src.RPPSpend()

					for(var/obj/Perk/A in usr.contents)
						if(A.name == "Serene State")
							usr.Jchakra+=usr.maxJchakra*(0.05)
							if(usr.Jchakra >= usr.maxJchakra)
								usr.Jchakra = usr.maxJchakra
					for(var/mob/M in oviewers())
						if(M.SharinganBuffCopy)
							var/GG = input(M,"[usr] has used [src]! Your sharingan allows you to copy it! Wil you?")in list("Yes","No")
							if(GG=="Yes")
								var/obj/Custom/Blank_Jutsu/E = new(M)
								E.name=src.name
								E.description=src.description
								E.dran=src.dran*1.95
								E.skil="[src.skil]"
								E.jut=src.jut
								E.ran=src.ran
								E.ele=src.ele
								E.Kekkei = src.Kekkei
								M.SharinganBuffCopy = 0
								sleep(2500)
								M.SharinganBuffCopy = 1
								M<<"Your ability to copy techniques with the Sharingan has returned."
							if(GG=="No")
								return
				else
					var/Try = input("Will you attempt to use this jutsu? There's a possibility of death if you over extend yourself!") in list("Yes","No")
					if(Try == "Yes")
						if(prob(25))
							usr.Jchakra = 0
							viewers(16) << "<font color=[usr.SayFont]>[usr] Just used a Jutsu <center><hr><br>[src.name](<font color=white>[jut]</font>) <hr><br> [src.description]<hr><br>Chakra Drain: [Cost*times] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele]"
							usr.SkillUp()
							for(var/obj/Perk/A in usr.contents)
								if(A.name == "Serene State")
									usr.Jchakra+=usr.maxJchakra*(0.1)
									if(usr.Jchakra >= usr.maxJchakra)
										usr.Jchakra = usr.maxJchakra

						else
							usr<<"You overextend your chakra using the jutsu....You're dead."
							view()<<"[usr] has died from overextending their chakra."
							usr.Health = 0
							usr.Death()
					if(Try == "No")
						usr<<"You don't have enough chakra left to use this...."
						oviewers()<<"This character has tried to use a jutsu they don't have the chakra for.."

			if(src.idran == "Stamina")
				if(usr.Jstam>=src.dran)
					usr.Jstam-=src.dran
					viewers(16) << "<font color=[usr.SayFont]>[usr] Just used a Jutsu  <center><hr><br>[src.name](<font color=white>[jut]</font>) <hr><br> [src.description]<hr><br>Stamina Drain: [src.dran] / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele]"
					usr.SkillUp()
					for(var/obj/Perk/A in usr.contents)
						if(A.name == "Serene State")
							usr.Jstam+=usr.maxJstam*(0.1)
							if(usr.Jstam >= usr.maxJstam)
								usr.Jstam = usr.maxJstam
					for(var/mob/M in oviewers())
						if(M.SharinganBuffCopy)
							var/GG = input(M,"[usr] has used [src]! Your sharingan allows you to copy it! Wil you?")in list("Yes","No")
							if(GG=="Yes")
								var/obj/Custom/Blank_Jutsu/E = new(M)
								E.name=src.name
								E.description=src.description
								E.dran=src.dran*1.95
								E.skil="[src.skil]"
								E.jut=src.jut
								E.ran=src.ran
								E.ele=src.ele
								E.Kekkei = src.Kekkei
								M.SharinganBuffCopy = 0
								sleep(2500)
								M.SharinganBuffCopy = 1
								M<<"Your ability to copy techniques with the Sharingan has returned."
							if(GG=="No")
								return
				else
					usr<<"You don't have enough stamina left to use this...."
					oviewers()<<"This character has tried to use a jutsu they don't have the stamina for.."
			src.ErpUp()

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Blank_Buff
		BOOST = 15
		Gentle_Fist
			GChak = -30
			GStam = -45
			Gnin = 0
			Ggen = 0
			Gtai = 0
			Gcon = 0
			Gint = 0
			Gref = 1
			Gspd = 1
			Gstr = 0
			Gdef = 0
			Gdur = 0
			Gatkspd = 2
			description = "The user drops into the Hyuuga Clan's signature combat form. Their strikes target their opponents vital organs and chakra pathways instead of aiming to do physical external damage."
			jut = "Taijutsu"
		Byakugan
			icon_state = "Byakugan"
			GChak = -50
			Gdef= 3
			Gsense = 50
			Sensory = 1
			Byakugan = 1
			description = "The Byakugan gives the user a near 360º field of vision, except for one blind spot at the back of the neck above the first thoracic vertebra. The range of this vision varies between users and in fact can be improved with training. Its vision can penetrate through most solid objects and obstructions, though certain barriers may distort the Byakugan's perception somewhat. The Byakugan is also able to more effectively follow high-speed movements to better react to them. In the anime, the Byakugan is shown magnifying in on small targets and seeing infrared to detect a target's body heat. Arguably, its greatest ability is to see chakra to a greater degree than the Sharingan: it can identify chakra by the specific individuals it originates from, determine when genjutsu is being used, and discern certain types of clone from the real thing. The Byakugan's ability to see chakra is so acute that it can actually see the chakra."
			jut = "Doujutsu"
		BeastMimicry
			GChak = -120
			GStam = -50
			Gnin = 0
			Ggen = 0
			Gtai = 0
			Gcon = 0
			Gint = -1.00
			Gref = 1.5
			Gspd = 2.5
			Gstr = 1.00
			Gdef = 0
			Gdur = 0
			Gatkspd = 1.50
			name = "Ninja Art of Beast Mimicry: All-Fours Jutsu"
			description = "The user goes down on all fours, their body taking on a feral look as their chakra creates a cloak around their body, giving them the impression of becoming a beast."
			jut = "Taijutsu"
		DanceOfTheWillow
			GChak = -20
			GStam = -100
			Gnin = 0
			Ggen = 0
			Gtai = 2.75
			Gcon = 0
			Gint = 0
			Gref = 1.75
			Gspd = 1.00
			Gstr = 1.75
			Gdef = 1.45
			Gdur = 2.50
			Gatkspd = 1.30
			name = "Dance of the Willow"
			description = "The first of the Kaguya's five dances. To perform this dance, The user grows several long bone blades from his body for use as weapons. There isn't any set form for the Dance of the Willow. Just like a willow  that is shaken by the wind, the opponents attacks are simply parried and countered. This dance form is incredibly acrobatic, using spins, charges, and long sweeping slashes to make the strikes more effective and to evade opponents' counter strikes."
			jut = "Taijutsu"
		DanceOfTheCamellia
			GChak = -20
			GStam = -125
			Gnin = 0
			Ggen = 0
			Gtai = 2.75
			Gcon = 0
			Gint = 0
			Gref = 2.00
			Gspd = 1.00
			Gstr = -1.00
			Gdef = 1.45
			Gdur = 3.00
			Gatkspd = 3.00
			name = "Dance of the Camellia"
			description = "The second of the Kaguya's five dances, which he performs by modifying one of his upper arm bones to create a short, bone-hilted bone sword. He then stabs chaotically and continuously which causes the opponents eyes to lag behind. The speed resembles afterimages, the hand with the sword is again and again visibly projected."
			jut = "Taijutsu"
		DanceOfTheLarch
			GChak = -20
			GStam = -125
			Gnin = 0
			Ggen = 0
			Gtai = 3.75
			Gcon = 0
			Gint = 0
			Gref = 1.65
			Gspd = 0.75
			Gstr = 2.00
			Gdef = 1.45
			Gdur = 3.75
			Gatkspd = 2.45
			name = "Dance of the Larch"
			description = "The third of the Kaguya's five dances. From the body, several bones pop out all at once. The stronger the opponent's physical attack, the more powerful the counter attack is, dealing severe damage. The sudden Defense, combined with the needle-like bones high killing ability, makes way for a technique which potential his high for battle."
			jut = "Taijutsu"
/*		AuralJudgement
			GChak = 0
			GStam = 0
			Gnin = 1.5
			Ggen = 0
			Gtai = 5.0
			Gcon = -2.0
			Gint = 0
			Gref = 0
			Gspd = 0
			Gstr = 0
			Gdef = 2.0
			Gdur = 0
			Ggenres = 5.0
			Gatkspd = 0
			name = "Dark Release: Aural Judgement"
			description = "The user releases an aura of Dark Release Chakra from their body.  They take on a dark coloration.  Their eyes become bright yellow and they seem to give off a Dark Release stream of chakra as they move.  It drains the chakra from ninjutsu which come near the user, lowering the power of said techniques and transferring the chakra to the user.  The stream of chakra that follows them deals no damage, it is only cosmetic.  But when the user comes into contact with their opponent, they drain a small amount of chakra with each strike."
			jut = "Ninjutsu"
		SonataOfCorruption
			GChak = 0
			GStam = 0
			Gnin = 3
			Ggen = 0
			Gtai = 7
			Gcon = -3.0
			Gint = 0
			Gref = 3
			Gspd = 1
			Gstr = 1
			Gdef = 3.5
			Gdur = 1
			Ggenres = 7.0
			Gatkspd = 0
			name = "Dark Release: Sonata of Corruption"
			description = "The uses releases a much larger aura of Dark Release Chakra from their body, similarly to Aural Release. Their aura extends into several physical tendrils which are capable of draining chakra rapidly from targets struck by them. It drains massive amounts of chakra from ninjutsu which are launched at the user, transferring that chakra to the user. They are able to drain chakra from their targets with each physical strike made against them."
			jut = "Ninjutsu" */
		DoubleHeadedWolf
			GChak = -90
			GStam = -120
			Gnin = 3
			Ggen = 0
			Gtai = 7.0
			Gcon = -3.0
			Gint = -3.0
			Gref = 3.5
			Gspd = 7.5
			Gstr = 4.5
			Gdef = 3.5
			Gdur = 5.5
			Ggenres = 0
			Gatkspd = 5
			name = "Inuzuka-Style: Human Beast Combination Transformation: Double Headed Wolf"
			description = "A Combination Transformation where the user and their ninken become a single entity. It is a speciality of the Inuzuka clan, they fuse into a two-headed wolf, thus drastically increasing their size, and power. In their direct attacks, they demonstrate great efficiency. Furthermore, using techniques in addition to this gives birth to an extraordinary destructive power."
			jut = "Taijutsu"
		GateofOpening
			GStam = -300
			Gtai = 2
			Gspd = 1.5
			Gstr = 4.0
			name = "Gate of Opening"
			description = "The Gate of Opening located in the brain, removes the restraints of the brain on the muscles so 100% of the user's strength can be used whereas normally, a person can only use 20% of their muscles' strength to keep them from disintegrating. Unlocking this gate allows the user to use the Front Lotus."
			jut = "Taijutsu"
		GateofHealing
			GStam = 1000
			Gstr = 1.5
			name = "Gate of Healing"
			description = "The user unlocks the Gate of Healing, revitalizing their torn muscles and quickly regenerating the tears. The user's body is revitalized in order to supplement their muscles with additional stamina. By doing so, they are able to channel more of their energy and withstand the crippling effects of the Gate of Opening."
			jut = "Taijutsu"
		GateofLife
			GChak = 1000
			GStam = -300
			Gtai = 3.0
			Gspd = 3.5
			Gatkspd = 3.5
			name = "Gate of Life"
			description = "The user opens the Gate of Life, resulting in increased blood flow. This increased blood flow results in the user's epidermis turning a pale reddish color, before completely evolving into that of a deep crimson reminiscent of the bloodstream."
			jut = "Taijutsu"
		GateofPain
			GStam = -400
			GChak = 1000
			Gspd = 4.5
			Gatkspd = 4.5
			Gtai = 4.5
			Gcon = -4.5
			Ggenres = 3.5
			name = "Gate of Pain"
			description = "The Gate of Pain, located on the spinal cord, increases the user's speed and power. May cause muscle tissue to tear on use."
			jut = "Taijutsu"
		GateofLimit
			GStam = -500
			GChak = 1000
			Gatkspd = 5.0
			Gref = 5.0
			Gspd = 5.0
			Gstr = 5.0
			Gtai = 5.0
			Ggenres = 5.0 //subject to change
			name = "Gate of Limit"
			description = "The Gate of Limit, located in the abdomen, increases the user's speed and power."
			jut = "Taijutsu"
		GateofView
			GStam = -600
			GChak = 1000
			Gatkspd = 7.5
			Gatkspd = 7.5
			Gspd = 7.5
			Gref = 7.5
			Gtai = 7.5
			Ggenres = 7.5
			name = "Gate of View"
			description = "The Gate of View, cated in the stomach, increases the user's speed and power. Opening of this gate releases such enormous amounts of energy that it can cause nearby water bodies to form a vortex around the user. Once opened, capable users can perform the Morning Peacock."
			jut = "Taijutsu"
		GateofWonder
			GStam = -700
			GChak = 2000
			Gatkspd = 10.0
			Gspd = 10.0
			Gref= 10.0
			Gtai = 10.0
			Ggenres = 10.0
			name = "Gate of Wonder"
			description = "The Gate of Wonder, located below the stomach, further increases the user's speed and power. Only after this gate is activated, can a capable user perform the Daytime Tiger. Those who open this gate will secrete glowing green — blue in the anime — sweat from every inch of their body which immediately evaporates from their own heat energy, creating an aura which people mistake as a chakra coating. Unfortunately, the side effects of opening the gate are that the user's muscle fibres are ripped to shreds, causing intense pain if anything or anyone touches them."
			jut = "Taijutsu"
		GateofDeath
			GStam = 5000
			GChak = 5000
			Gatkspd = 13.5
			Gspd = 13.5
			Gref = 13.5
			Gtai = 13.5
			Ggenres = 20.0
			name = "Gate of Death"
			description = "The Gate of Death, located at the heart, requires the user to puncture their chest just above the heart in order to open it. Opening this gate will cause the user's blood to emanate a flaming aura of red steam from all pores of their body, hair, and eyebrows. Releasing this gate uses up all of the body's energy while making the heart pump at maximum power. Exceeding the power of every other gate, the user is granted approximately a hundred times their normal power, far beyond that of the five Kage. Once activated, those who are capable can perform the Evening Elephant and the Night Guy. Unfortunately, the side effect of opening this gate is that it comes at the expense of the user's life, causing the user to crumble to ash, having virtually cooked themselves from the inside-out."
			jut = "Taijutsu"
		DrunkenFist
			GStam = -200
			Gref = 3.0
			Gspd = 2.5
			Gint = -3
			Gcon = -3
			name = "Drunken Fist"
			description = "runken Fist is a unique style of combat where, according to Might Guy, 'the more you drink, the drunker you get, and the stronger you become'. It can not be learned, taught, nor refined through training and practice. Drunken Fist fighters are not simply drunk: they become human powerhouses who'll strike unpredictably with an explosive fury and without any second thoughts about their actions. Once drunk, the user will lose their ability to know friend from foe and attack whomever is in their vicinity. The user's ability to dodge enemy attacks is also seemingly enhanced."
			jut = "Taijutsu"
		LightningArmor
			GChak = -600
			Gref = 1.5
			Gspd = 6
			Gdur = 3
			Gdef = 3
			Gatkspd = 4
			name = "Lightning Armor"
			description = "The user wraps their body in a layer of lightning chakra which, instead of being used offensively, is used to electrically stimulate the user's nervous system. The technique speeds up neural synapses to react faster, and to push physical prowess to the absolute limit, allowing for tremendous raw speed. The technique has different levels of activation. The level's activation is depicted by the users hair which stands up when the technique is activated to the fullest. The higher the level, the higher the speed the user can achieve."
			jut = "Ninjutsu"
		SandArmor
			GChak = -200
			Gdur= 4
			Gdef = 4
			Gspd = -2.5
			Gatkspd = -2.5
			Gtai = -2.0
			name = "Sand Armor"
			description = "Using this technique, the user can cover themselves in a compacted layer of sand, providing an additional defense should their Shield of Sand fail; Though quite effective, maintaining the armor requires a large amount of chakra and stamina. Furthermore, it is nowhere as resilient as the Shield of Sand, since it easily breaks away upon impact, indicating that the sole purpose of the armor is to absorb impact channeled unto the users body during battle. Another weakness is the additional weight of the sand which leads to decreased levels of speed and mobility."
			jut = "Ninjutsu"
		EarthSpear
			GChak = -300
			Gdur = 7
			Gdef = 5.5
			Gspd = -2.5
			Gatkspd = -2.5
			Gstr = 4
			name = "Earth Spear"
			description = "The user flows chakra through all parts of their body causing it to become noticeably darker, which increases their defensive power to its utmost limits by making the skin as hard as diamond, easily capable of withstanding most attacks with little to no damage. As a result the amount of techniques that can break through the areas hardened by the Earth Spear are close to zero, excluding its undeniable weak point: Lightning Release ninjutsu. Furthermore, the destructive power of physical attacks is increased, making this a great all-purpose technique."
			jut = "Ninjutsu"
		EyeofKagura
			GChak = -100
			Gref = 3
			Gsense = 50
			Sensory = 1
			description = "By focusing and opening the mind's eye, the user is able to find and track an individual's chakra over a vast distance that exceeds ten kilometres. By further focusing their chakra, they can extend this range to far greater distances. This ability also gives them the capability to perceive fluctuations in a person's chakra made when a person is lying or if someone, including themself, is under a genjutsu. Also, by focusing on a particular chakra, they can perceive their target's movements and surrounding area with great detail. These sensory capabilities bless the user with abilities that even surpass dojutsu with comparable powers."
			name = "Eye of Kagura"
			jut = "Ninjutsu"
		SharinganT1
			icon_state = "Sharingan1"
			GChak = -50
			Gnin = 2.0
			Ggen = 2.0
			Gtai = 2.0
			Gcon = 1
			name = "Sharingan"
			description = "This person have achieved the first stage of Sharingan, tomoe 1." //more to add later.
			jut = "Doujutsu"
		SharinganT2
			icon_state = "Sharingan2"
			GChak = -100
			Gnin = 2.5
			Ggen = 2.5
			Gtai = 2.5
			Gref = 2.5
			Gcon = 1.5
			name = "Sharingan"
			description = "This person have achieved the next level of Sharingan, tomoe 2."
			jut = "Doujutsu"
			SharinganCopyy = 1
		SharinganT3
			icon_state = "Sharingan3"
			GChak = -150
			Gnin = 4.0
			Ggen = 4.0
			Gtai = 4.0
			Gref = 4.5
			Gcon = 1.5
			name = "Sharingan"
			description = "This person has achieved Tomoe 3 of the Sharingan."
			jut = "Doujutsu"
			SharinganCopyy = 1
		MangekyouSharingan
			GChak = -200
			Gnin = 5.0
			Ggen = 5.0
			Gtai = 4.0
			Gref = 6.0
			Gcon = 2.5
			name = "Mangekyou Sharingan"
			description = "This person has unlocked the legendary Mangekyou Sharingan."
			jut = "Doujutsu"
		OldPerson
			Gstr = -4
			Gspd = -4
			Gref = -4
			Gdur = -3
			Gdef = -3
			Gint = 10
			name = "Old Person"
			description = "This person is old. Despite this, however, they are extremely wise and fit to teach the next generation of shinobi."
			jut = "Ninjutsu"
/*		HeroReleaseMask
			GChak = -25
			Gtai = 1.95
			Gref = 1.95
			Gdur = 0.2
			Gdef = 1.54
			Gint = 1.25
			Ggenres = 1.25
			Sensory = 3
			Gsense = 10
			name = "Hero Release: Mask!"
			description = "The user releases their hero chakra into their body. This increases their sight by 1 tier and gives them very low level sensing in the immediate area. This technique manifests as a colorful mask that covers just their eyes and nose."
			jut = "Ninjutsu"
		HeroReleaseCape
			GChak = -120
			GStam = -60
			Gnin = 0
			Ggen = 0
			Gtai = 4.5
			Gcon = 0
			Gint = 0
			Gref = 3.5
			Gspd = 2.75
			Gstr = 4.5
			Gdef = 3.0
			Gdur = 5.0
			Ggenres = 1.5
			Gatkspd = 0
			name = "Hero Release: Cape!"
			description = "The user distributes their Hero release chakra throughout their body for a boost in physical prowess. Contact with the Ouendan during this jutsu will result in a burning, shocking, and cutting sensation similar to the Strike technique, albeit the results are drastically lowered. This sudden release of chakra produces an interesting asthetic in which a cape appears at their back as if they were a literal superhero, accompanied by lighter hair sheen and iris coloration."
			jut = "Ninjutsu" */

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Ninjutsu
		idran = "Chakra"
		skil = "New"
		jut = "Ninjutsu"
		ele = "Elementless"
		icon = 'SkillCard.dmi'
		icon_state = "Shunshin"
		Drank
			ran = "D"
			Shunshin
				icon = 'Skillcard.dmi'
				icon_state = "Run"
				name = "Shunshin no Jutsu"
				dran = 750
				description = "A technique wherein the user exerts chakra into their body, increasing their metabolic rate, allowing them to cover a distance in a short period. This technique has a delay and causes the user to become dizzy and disoriented for a short period after use until mastered."
			BasicHealing
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Basic Healing Jutsu"
				dran = 450
				description = "The user focuses their chakra to their hands and uses it to heal their target. This technique sanitizes wounds, halts bleeding, and in the case of very minor injuries, fully heals them."
			ManipulatedShuriken
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Manipulated Shuriken Technique"
				dran = 0
				description = "With this technique a translucent string, both elastic and highly durable, is attached to a shuriken, making it possible to alter its path after having thrown it. An expert will have the ability to freely glide the shuriken in any direction with just a single movement of their fingertip. The first attack, challenging the enemy, is avoided and after a time-lag of several seconds, it will come from behind. Depending on the performance, the possible tactics can be infinite."
			ShadowShuriken
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Shadow Shuriken Technique"
				dran = 150
				description = "It's a simple technique where two shuriken, like the Fuma Shuriken, are piled one onto another and thrown simultaneously. However, depending on the way it's used, it can prove its absolute efficiency. The trick is to somehow draw the enemy's attention towards the upper shuriken. Then, they have to deal with the path of the lower, unnoticed shuriken. However, if the enemy notices both shuriken, which is done when they duck down, the technique ends up losing most of its efficiency."

		Crank
			ran = "C"
			NoviceHealing
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Novice Healing Jutsu"
				dran = 600
				description = "The user places their palms upon a wound inflicted upon their target, healing it. This santizes wounds and stops bleeding. It is capable of compltely healing minor to moderate wounds such as sword-inflicted stab wounds."
			Oukashou
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Cherry Blossom Impact"
				dran = 600
				description = "While some may see it as superhuman strength, this technique is actually an application of medical ninjutsu, that demands the ability to concentrate, along with minute chakra control. An immense amount of chakra is kneaded inside the body, and a moment later all of it it is gathered into the fist. That chakra is then released into the target, which does a great amount of damage. With the damage done dependent on the amount of chakra used, it is also possible for a skilled shinobi to amass it in their fingertip. When the ground is hit it is pulverised into many pieces by the excess shock, which are then scattered like flower petals, giving rise to the name Cherry Blossom Impact."
		Brank
			ran = "B"
			ExpertHealing
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Expert Healing Jutsu"
				dran = 650
				description = "The user focuses their chakra to their palms before placing them to a wound. This technique santizes wounds and stops bleeding. It is capable of completely healing minor to severe wounds such as multiple stab wounds or intensive blunt trauma. Lasting medical attention is still required."
		Arank
			ran = "A"
			KageBunshinNoJutsu
				icon = 'Skillcard.dmi'
				icon_state = "Kawarimi"
				name = "Shadow Clone Jutsu"
				description = "Similar to the basic Clone Technique, this technique creates copies of the user.  However, these clones are corporeal instead of illusions.  The user's chakra is evenly distributed among every clone, giving each clone an equal fraction of the user's overall power.  The clones are capable of performing techniques on their own and can even bleed, but will usually disperse after hit by a strong enough force.  The clones can also disperse on their own or be dispelled by the user of the technique.  Shadow clones can't be distinguished from the original with Sharingan, Byakugan, Rinnegan or Rinne Sharingan."
				dran = 800

	Fuuinjutsu
		idran = "Chakra"
		skil = "New"
		jut = "Fuuinjutsu"
		ele = "Elementless"
		icon = 'SkillCard.dmi'
		icon_state = "Gogyou Fuuin"
		Drank
			ran = "D"
			Basic_Sealing
				name = "Basic Sealing"
				dran = 350
				description = "This character is capable of performing basic sealing techniques. They are capable of sealing a small number of weapons into scrolls and inanimate objects of suitable size, but not onto another organic being."
		Crank
			ran = "C"
			Five_Seal_Barrier
				name = "Five Seal Barrier"
				dran = 450
				description = "This technique creates a barrier around a place by placing four forbidden (?, kin) tags in different locations surrounding the place to be protected, a fifth tag on the location to be protected. The tags are placed on flat surfaces, and are connected with the user's chakra. This technique turns the entire range surrounded by the tags into a barrier space, and inside the space, the material's destruction is forbidden. Using any kind of physical attack to try and destroy something in the barrier is folly, as it will only lead to injury. To cancel this, it is necessary to search for the four tags and tear them off simultaneously. Meaning there must be at least five people on a team to cancel it."
			Finger_Carving_Seal
				name = "Finger Carving Seal"
				dran = 450
				description = "The user concentrates chakra into their finger and using the heat from that, can apply writing of whatever they want to a surface. This technique however requires them to be very delicate with their chakra control. This technique causes slight discomfort for a living target and if it is on flesh, it will scar."
			Lotus_Sealing
				name = "Lotus Sealing"
				dran = 500
				description = " This character is capable of unique seals which allow them to store a moderate amount of weapons in scrolls and other inanimate objects. This character's seal take on the shape of lotus flowers when used to their full capacity, and they are capable of creating remote triggers with their seals for traps."

		Brank
			ran = "B"
			Fuuinjutsu_Fire_Sealing
				name = "Fuuinjutsu: Fire Seal"
				dran = 650
				description = "A kind of fuinjutsu that involves sealing a technique's effects within a specific location. As it is tailored for fire release ninjutsu, it requires a caster well-versed in the exacting art of Sealing Formulas, as well as in ninjutsu. The jutsu-sealing space in the scroll is left blank, for the formula to be inscribed in with a brush. After performing the needed hand seals, chakra-like vapour appears from the scroll, and envelops the flames. They are sucked in towards the scroll, and the appearance of the kanji for seal (?) certifies the technique's completion."
			Root_Sealing
				name = "ROOT Sealing"
				dran = 750
				description = " This character is capable of applying seals directly to the body of other beings which restrict one very specific thing from the person. This can range from a word, to a certain single action, or even the use of a certain body part. This however does not apply to jutsu, or the execution of jutsu. This seal can not be used to cut someone's chakra."

		Arank
			ran = "A"
			Five_Pronged_Seal
				name = "Fuuinjutsu: Gogyou Fuuin"
				dran = 900
				description = "Five Element Seal is a technique which produces a powerful seal that is used to block or disturb the flow of chakra in a target. Once the seal is completed, the target will become unconscious and unable to fight for a short time. "
			Five_Pronged_Unseal
				name = "Fuuinjutsu: Gogyou Kaiin"
				dran = 850
				description = "This technique can be used to remove fuinjutsu of up to equal power, like its counterpart."
			Contract_Seal
				name = "Contract Sealing"
				dran = 1100
				description = "When the user implements this fuinjutsu on a summoner, it removes any direct control the summoner has over a summoned creature. Close contact appears to be required for the implementation of the seal."
			Curse_Sealing
				name = "Curse Sealing"
				dran = 1250
				description = "This technique is used to suppress technique-induced marks on a person. Marks of weaker power can be completely suppressed by this technique alone, but for marks of higher power, like the Cursed Seal of Heaven, it will cause the seal's power to become dependent on the recipient's own willpower to some extent, especially if the sealer is not experienced enough to strengthen the seal with his own power."
			Advanced_Sealing
				name = "Advanced Sealing"
				dran = 1350
				description = "This character is skilled enough with sealing to seal a massive amount of weapons into a single scroll or object. They can seal a large number of weapons into a person's body, leaving seals grafted to one's skin permanently(even after the seal has been released), and even block one's ability to use up to one chakra nature, or just a bit of their chakra in general."

		Srank
			ran = "S"
			Reaper_Death_Seal
				name = "Reaper Death Seal"
				dran = 1500
				description = "The Dead Demon Consuming Seal is a seal developed by the Uzumaki clan. It invokes the power of a spectral entity known as the Shinigami that can only be seen when it grasps one's soul. "
			Reverse_Tetragram_Seal
				name = "Reverse Tetragram Sealing Jutsu"
				dran = 1500
				description = "This technique is a fuinjutsu that the user places across their chest, and sets it to activate upon their death. The technique releases four symbols from the user's body that then forms a large, black sphere around them. Anything caught inside the sphere's area is then drawn in and sealed within the user's corpse."


	Genjutsu
		idran = "Chakra"
		skil = "New"
		jut = "Genjutsu"
		ele = "Elementless"
		icon = 'SkillCard.dmi'
		icon_state = "Nehan"
		Drank
			ran = "D"
			Genjutsu_Kai
				name= "Genjutsu: Kai"
				dran = 250
				description = "The ninja needs to stop the flow of chakra in their body, and then apply an even stronger power to disrupt the flow of the caster's chakra; this is called Genjutsu Dissipation (???, Genjutsu Kai). This can also be done by an unaffected ninja by applying a sudden surge of chakra into the affected person."
			Magen_Narakumi
				name = "Demonic Illusion: Death Mirage Jutsu"
				dran = 350
				description = "This is a genjutsu that reveals the fears that dwell inside people's hearts. Everyone has an image of the one thing they wouldn't want to ever see. This genjutsu is a technique that draws forth such an image from within the heart and has one mistake it for reality. First, an imaginary circle of leaves will spin around and envelop the target, falling away shortly after. After a short period, the illusion will begin. This is to make the illusion more convincing, since the user will likely have moved before the illusion sets in. If the mental image is a gruesome one, the shock will be accordingly great."
			Interrogation_Jutsu
				name = "Interrogation Jutsu"
				dran = 460
				description = "uses this genjutsu to break the will of his (captured) target, to make him or her give as much information as possible. However, if the target has strong will, the technique will be useless."
			Mist_Servant
				name = "Mist Servant Jutsu"
				dran = 375
				description = "This genjutsu creates eerie black ninja illusions, which appear one by one from trees and rocks, and then corners the enemy. Their movements are somehow slow, but when attacked they multiply, and in this way they appear like ghosts inhabiting the mist. Kunai knives are added to this technique, by throwing them to match illusions movement, making them seem real. As the clones continue to multiply rapidly, the victim will eventually be worn down."


		Crank
			ran = "C"
			Magen_Katon
				name = "Demonic Illusion: Descending Fire Jutsu"
				dran = 250
				description = "This technique causes the illusion of a tremendous ball of fire falling from the sky into a designated area. The targets involved in the illusion literaly feel the ball's hot temperature getting closer."
			Genjutsu_Optic_Delusory
				name = "Demonic Illusion: False Surroundings Technique"
				dran = 250
				description = "A genjutsu that allows one to trick others into mistaking the place they're in for another. This technique's main feature is that it can be cast over an extensive surface, therefore any and all who step into the illusion's area of effect will fall under the spell. That said, it might not work so well on people who are well-versed or otherwise skilled in genjutsu."
			Sly_Mind_Effect
				name = "Sly Mind Effect Jutsu"
				dran = 250
				description = "This technique allows the user to change the enemies sense of direction as they see fit. When this technique was evoked, the enemy was forced to walk around continuously in circles by making it seem as if they're walking straight to their desired destination."
			Hazy_Illusion
				name = "Hazy Genjutsu"
				dran = 360
				description = "This technique casts an illusion on the enemy that blurs the target's vision of the entire area. In addition, it causes the victim to react as though they're sinking in quicksand, effectively immobilising the target."
			Leaf_Style_Willow
				name = "Leaf-Style Willow"
				dran = 460
				description = "The user waves their sword back and forth, which when seen by the target locks them in a genjutsu which causes them to hallucinate multiple waving arms. The movement resembles that of a willow tree blowing in the wind. With the enemy off guard, the user is free to cut them down."
			Rockslide_Genjutsu
				name = "Rockslide Genjutsu"
				dran = 550
				description = "This technique casts an illusion on multiple targets, making them perceiving multiple large explosions going off. From this, the victims will see the ground around them collapsing, disorienting them and leave them confused and in a panic. This technique does not appear to be very powerful as an individual can negate it themselves and all others around them without direct contact on the fellow victims."

		Brank
			ran = "B"
			Genjutsu_Double_Optic_Delusory
				name = "Genjutsu: Inception"
				dran = 500
				description = "This technique places another illusion within another illusion created by the user. When the target dispels the first illusion, they will not realise that a second is in place."
			Genjutsu_Shibari
				name = "Genjutsu: Genjutsu Binding"
				dran = 750
				description = "As the name suggests, the user binds the opponent in a genjutsu, rendering them incapable of movement. This genjutsu can be used on more than one target at the same time. Once the target is bound, the user or an ally can rush up to the enemy and deliver a devastating killing blow."
			Genjutsu_Sylvan_Fetters
				name = "Genjutsu: Sylvan Fetters"
				dran = 750
				description = "This is one of the genjutsu passed down since ancient times in Konohagakure. The user first disappears from plain sight in a mist-like fashion in order to approach the target without being detected. Once close enough, the target will then be completely robbed of their mobility as they see the mirage of a fast-growing tree coiling itself around them. Given that the subject remains conscious, this technique proves extremely efficient for information-gathering. Once the target is immobile, the user can then attack the enemy, usually after emerging from the trunk of the tree."
			Lightning_Flash_Pillar
				name = "Lightning Illusion: Flash Pillar"
				dran = 850
				description = "This genjutsu blinds the enemy with an extremely bright light that appears to emanate from the user's body."
		Arank
			ran = "A"
			Nehan_Shoja
				name = "Genjutsu: Feather Illusion Jutsu"
				dran = 400
				description = "It is a powerful genjutsu that generates a fluttering rain of sleep-inducing, illusory white feathers. Whomever sees them as they fall, piling up and covering the whole target area, will experience Eden-like bliss and fall into a state of tranquil slumber. No matter how much one resists the hypnotic spell, the desire to sleep is instinctive, and there's no fighting it. However, an experienced shinobi will be able to dispel the genjutsu before it takes effect."
			Infinite_Darkness
				name = "Genjutsu: Infinite Darkness Jutsu"
				dran = 400
				description = "This technique exerts an hallucinatory effect upon the eyesight, effectively blinding the opponent. No matter how skilled an opponent may be, they are forced to wait helpless in this world of darkness, as this technique allows the user to attack unseen. Although it negates sight, it does not stop the other senses."

		Srank
			ran = "S"

	Taijutsu
		icon='Skillcard.dmi'
		icon_state="Run"
		Drank
			idran = "Stamina"
			skil = "New"
			jut = "Taijutsu"
			ran = "D"
			ele = "Elementless"
			Dynamic_Entry
				icon='Skillcard.dmi'
				icon_state="Run"
				name = "Dynamic Entry"
				description = "The technique is basically the user performing a jump kick into their opponent's face."
				dran = 150
			Silent_Killing
				icon='Skillcard.dmi'
				icon_state="Run"
				name = "Kirigakure Assassin Technique: Silent Killing"
				dran = 150
				description = "As the name suggests, this technique is simply a very quiet method of killing an opponent, usually from behind with a blade. Additionally, because the user moves silently, it cannot be defended against, because the attack cannot be anticipated."
			Leaf_Whirlwind
				icon='Skillcard.dmi'
				icon_state="Run"
				name = "Konohagakure Style Taijutsu: Leaf Whirlwind"
				dran = 200
				description = "A taijutsu where one launches a succession of high kicks and low kicks. Firstly, the opponent's evasion margin is restrained upon seeing the high kick, thus augmenting the chances for the low kick to hit the mark. So originally the high kick is little more than a feint."

		Crank
			idran = "Stamina"
			skil = "New"
			jut = "Taijutsu"
			ran = "C"
			ele = "Elementless"
	//		Oukashou
	//			icon='Skillcard.dmi'
	//			icon_state="Oukashou"
	//			name = "Oukashou"
	//			description = "While some may see it as superhuman strength, this technique is actually an application of medical ninjutsu, that demands the ability to concentrate and minute chakra control. An immense amount of chakra is kneaded inside the body, and a moment later all of it it is gathered into the fist. That chakra is then released into the target, which does a great amount of damage. With the damage done dependent on the amount of chakra used, it is also possible for a skilled shinobi to amass it in their fingertip. When the ground is hit it is pulverised into minute pieces by the excess shock, which are then scattered like flower petals, giving rise to the name Cherry Blossom Impact."
	//			dran = 250
			Leaf_Great_Whirlwind
				icon='Skillcard.dmi'
				icon_state="Run"
				name = "Konohagakure Style Taijutsu: Leaf Great Whirlwind"
				dran = 300
				description = "This technique is a series of kicking attacks, starting from a low kick and linking into a middle kick and high kick then finishing off with a heel drop. As the rotation speed picks up the user gains buoyancy, which they use to shift into gradually higher attacks."
			Creeping_Leaf_Shadow
				icon='Skillcard.dmi'
				icon_state="Run"
				name = "Konohagakure Style Taijutsu: Creeping Leaf Shadow"
				dran = 250
				description = "A technique where one follows the opponent, closely matching his or her body's movement, just like a leaf that dances in the air is followed by its shadow. The technique is usually preceded by a swift upper kick that will launch the target into the air. It is mainly used to position an opponent into a vulnerable aerial position. This move by itself is harmless, but it is usable as a stepping stone for a great many powerful techniques like Front Lotus and the Lion Combo. That being said, it also has a rather high degree of difficulty."

		Brank
			idran = "Stamina"
			skil = "New"
			jut = "Taijutsu"
			ran = "B"
			ele = "Elementless"
			Severe_Leaf_Hurricane
				name = "Severe Leaf Hurricane"
				icon_state="Run"
				icon='Skillcard.dmi'
				dran = 400
				description = "A taijutsu using a combination of speed and power. The essence of this technique is concentrated in a spinning back kick, with such speed that not a single person can follow the user's movement, smashing his enemy with overwhelming strength. In the anime, it also creates a powerful whirlwind around the user which can be used to attack multiple opponents."
		Arank
			First_Gate_Gate_of_Opening
				icon='Skillcard.dmi'
				icon_state="Hachimon 1"
				name = "First Gate: Gate of Opening"
				description = "This gate removes the restraints of the brain on the muscles so 100% of their strength can be used whereas normally, a person can only use 20% of their muscles' strength to keep them from disintegrating. Unlocking this gate allows the user to use the Front Lotus."
				dran = 350
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "A"
				ele = "Elementless"
		Srank
			Second_Gate_Gate_of_Healing
				icon='Skillcard.dmi'
				icon_state="Hachimon 2"
				name = "Second Gate: Gate of Healing"
				description = "Forcibly increases one's physical strength and temporarily re-energises the body."
				dran = 450
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Third_Gate_Gate_of_Life
				icon='Skillcard.dmi'
				icon_state="Hachimon 3"
				name = "Third Gate: Gate of Life"
				description = "Allows the user to use the Reverse Lotus. The increased blood flow turns the skin red."
				dran = 550
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Fourth_Gate_Gate_of_Pain
				icon='Skillcard.dmi'
				icon_state="Hachimon"
				name = "Fourth Gate: Gate of Pain"
				description = "Increases the user's speed and power. May cause muscle tissue to tear on use."
				dran = 600
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Fifth_Gate_Gate_of_Limit
				icon='Skillcard.dmi'
				icon_state="Hachimon 5"
				name = "Fifth Gate: Gate of Limit"
				description = "Increases the user's speed and power."
				dran = 700
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Sixth_Gate_Gate_of_View
				icon='Skillcard.dmi'
				icon_state="Hachimon 5"
				name = "Sixth Gate: Gate of View"
				description = "Increases the user's speed and power. Allows the user to perform the Morning Peacock. Opening of this gate releases such enormous amounts of chakra that it can cause nearby water bodies to form a vortex around the user."
				dran = 700
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Morning_Peacock
				icon='Skillcard.dmi'
				icon_state="Hachimon"
				name = "Morning Peacock"
				description = "The technique is started by kicking the enemy into the air, which for most would be an instant kill. The user then jumps into the air in a distinctive stance and begins punching the enemy repeatedly. The speed of the punches is so fast that they are set ablaze by sheer speed and friction. This creates a peacock-like fan of flames around the opponent. Once the attack is finished, the enemy will be sent crashing back to the ground, covered with the attack's aura. The technique is also strong enough to briefly stun a tailed beast"
				dran = 1000
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Seventh_Gate_Gate_of_Wonder
				icon='Skillcard.dmi'
				icon_state="Hachimon 5"
				name = "Seventh Gate: Gate of Wonder"
				description = "Further increases the user's speed and power. Allows the user to perform the Daytime Tiger. Those who open this gate will pour glowing green sweat from every inch of their body, blue in the anime, which immediately evaporates from their own heat energy, creating an aura which people would mistake as a chakra coating. Unfortunately, the side effects of opening the gate are that the user's muscle fibres are ripped to shreds, causing intense pain if anything or anyone touches them."
				dran = 700
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Daytime_Tiger
				icon='Skillcard.dmi'
				icon_state="Hachimon"
				name = "Daytime Tiger"
				description = "After opening the seventh of the Eight Gates, the user places a palm facing forward in front of their face with one hand and then taps it with his other hand, formed into a fist, which creates a massive amount of air pressure. Next, the user forms a unique hand seal resembling a tiger, which launches the air pressure at the opponent in the shape of a tiger, by leaving a gigantic tiger-shaped impression into the initially built-up air pressure with the hand seal. The air pressure will condense as it's moving and be focused into a single point. The technique then explodes on command, releasing the built up air pressure in an instant. A massive concussive explosion is created which can be felt a significant distance away."
				dran = 900
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Eighth_Gate_Gate_of_Death
				icon='Skillcard.dmi'
				icon_state="Hachimon 5"
				name = "Eighth Gate: Gate of Death"
				description = "Releasing this gate uses up all of the body's energy. It makes the heart pump at maximum power and exceeds the power of every other gate. Opening this gate gives the user power that is even beyond the five Kage, but comes at the expense of the user's life shortly after."
				dran = 1000
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"
			Evening_Elephant
				icon='Skillcard.dmi'
				icon_state="Hachimon"
				name = "Evening Elephant"
				description = "This technique is a continuous assault of five punches, with each 'foot'  as they are referred to being performed faster than the one before. It creates a vacuum of pressurised air which bears the appearance of an elephant's leg, causing devastating damage to the opponent. One punch alone was capable of creating a massive and deep tunnel in the ground. The final punch is strong enough to break through Madara Uchiha's chakra shell."
				dran = 2000
				idran = "Stamina"
				skil = "New"
				jut = "Taijutsu"
				ran = "S"
				ele = "Elementless"





	Katon
		icon = 'SkillCard.dmi'
		icon_state="Katon"
		Drank
			Ninja_Art_Fire_Run// - D-Rank 100 RPP <br>
				name = "Ninja Art: Fire Run"
				description = "This technique creates a stream of fire that can be manipulated into several forms (so far, rings of fire that runs on the ground or a circle of fire flying through the air) before striking the target. It can also be used in combination with Wind Release: Divine Wind to create a tornado of flames, or with Wind Release: Godly Wind from the Mountains to release a massive inferno."
				dran = 250
				RPPCost = 100
				skil = "New"
				jut = "Ninjutsu"
				ran = "D"
				ele = "Fire"
				idran = "Chakra"
			Fire_Shot
				name = "Ninja Art: Flamethrower"
				description = "The user fires a stream of fire from their mouth. This is the most basic fire style technique."
				dran = 275
				skil = "New"
				jut = "Ninjutsu"
				ran = "D"
				ele = "Fire"
				idran = "Chakra"
		Crank
			FireDragonBullet
				name = "Fire Style: Fire Dragon Bullet"
				description = " basic Fire Release technique, where the use exhales a flame breath from their mouth. This technique can be used in conjunction with Earth Release: Earth Dragon Bullet to ignite the projectiles fired by the latter technique, making it more devastating."
				dran = 700
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
				idran = "Chakra"
			Exploding_Flame
				name = "Exploding Flame Shot"
				description = "By creating a spark from their hands, this technique allows the user to throw multiple balls of flames, which are able to either cause fiery explosions on impact or set the target on fire."
				dran = 650
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
				idran = "Chakra"
			Fire_Style_Fireball_Jutsu// - C-Rank 450 <br>
				name = "Fire Style: Fireball Jutsu"
				description = "A technique where chakra kneaded inside the body is converted into fire and expelled from the mouth either as a massive orb of roaring flame or as a continuous flame-thrower. The scope of the attack is altered by controlling the volume of chakra that is mustered. The released flames will engulf their target, and leave a crater on the ground's surface. This technique apparently requires more than average chakra reserves and most genin should not be able to do this technique."
				dran = 500
				RPPCost = 450
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
				idran = "Chakra"
			Fire_Style_Phoenix_Flower_Jutsu // - C-Rank 400<br>
				name = "Fire Style: Phoenix Flower Jutsu"
				description = "This technique creates a volley of small fireballs, which are sent flying in an unpredictable manner assaulting the enemy. In addition, the flames are controlled one by one with chakra, so avoiding them all is extremely difficult. "
				dran = 450
				RPPCost = 400
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
				idran = "Chakra"
			Fire_Style_Misty_Flames_Dance_Jutsu// - C-Rank 300 <br>
				name = "Fire Style: Misty Flames Dance Jutsu"
				description = "The user is able to create and blow a flammable gas from their lungs. Once it comes in contact with fire or spark, the gas ignites into a large fireball. "
				dran =400
				RPPCost = 300
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				idran = "Chakra"
				ele = "Fire"
			Fire_Style_Dragon_Fire_Jutsu// - C-Rank 500 <br>
				name = "Fire Style: Dragon Fire Jutsu"
				description = "The user breathes fire along a cord or any other type of long object, which rushes forward in straight line catching the enemy on fire. A line of enemies can be used as the conductor as well."
				dran = 600
				RPPCost = 500
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
			Fire_Style_Phoenix_Flower_Shuriken_Jutsu// - C-Rank 450 <br>
				name = "Fire Style: Phoenix Flower Shuriken Jutsu"
				description = "The user unleashes a volley of shuriken with one hand, and at the same time, exhales fire-infused chakra onto them in order to increase the weapons' destructive potential by making them capable of inflicting severe burns upon direct contact with either the intended victim, or any other object caught within their trajectories."
				dran = 500
				RPPCost = 450
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
			Fire_Clone
				name = "Fire Clone"
				description = "This technique allows the user to make a clone infused with fire. Because it is a elemental clone, it is able to perform techniques and interact with the environment due to it having physical substance; and also evenly distributes the user's chakra to each clone. If the clone is injured, it will revert to its natural fire-state, at the same time burning whatever it is touching. This clone is at 1/4 power for all stats of it’s creator, except when using fire ninjutsu which allows them to be at full Control stat.<br><br>(Max Clones Permitted: Control Stat)<br>(Must use the jutsu the jutsu for as many clones created. I.e. 4 clones = 4 uses)<br>(All jutsu used by the clones drains the user as well)"
				dran = 350
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Fire"
		Brank
			Fire_Style_Burning_Ash// - B-Rank 600 <br>
				name = "Fire Style: Burning Ash"
				description = "The user spews a stream of chakra infused gun-powder from their mouth, which surrounds the region. As the gunpowder is composed entirely of ash, it stays in the air around the victim like a cloud, which can be used like a smokescreen. After surrounding the enemy with the ash, the user can ignite it with a flint placed on their teeth beforehand to create a spark, resulting in a violent explosion, burning the enemy. "
				dran = 850
				RPPCost = 600
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Fire"
			Fire_Style_Dragon_Flame_Jutsu// - B-Rank 650 <br><br>
				name = "Fire Style: Great Dragon Flame Jutsu"
				description = "The user compresses a large amount of chakra built up inside their body and changes it into a dragon head-shaped fireball. The user then skilfully manipulates that great fire, and attacks their opponent. Even outside of the attack range, its power and reliability are stressed. The flames have a high temperature, as they can create an upward movement of air currents which in turn can give rise to thunder clouds. A master of this technique can fire off several flames in succession and anyone caught in the technique could potentially be reduced to ashes."
				dran = 900
				RPPCost = 700
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Fire"
		Arank
			Fire_Style_Dragon_Flame_Bomb// - B-Rank 650 <br>
				name = "Fire Style: Dragon Flame Bomb"
				description = "The user kneads their chakra into flames, which are then manipulated into a genuine-looking dragon. Since the art of having the flames obey the user's will is outrageously difficult, its mastery is restricted to a limited number of skilful shinobi. The flames are divided to launch a left side, right side, and frontal assault in all three directions at once, turning the enemy into ash in a matter of seconds."
				dran = 780
				idran = "Chakra"
				RPPCost = 650
				skil = "New"
				jut = "Ninjutsu"
				ran = "A"
				ele = "Fire"
			Fire_Style_Giant_Flame_Bombs// - B-Rank<br>
				name = "Fire Style: Giant Flame Bombs"
				description = "The user creates fire in their gullet before releasing it in a large burst. It is capable of destroying a small building, burning it down to nothing in no time."
				dran = 900
				idran = "Chakra"
				RPPCost = 700
				skil = "New"
				jut = "Ninjutsu"
				ran = "A"
				ele = "Fire"
			Fire_Style_Shadow_Clone_Jutsu// - B-Rank 700 <br>
				name = "Fire Style: Shadow Clone Jutsu"
				description = "This technique allows the user to make a shadow clone infused with fire. Because it is a shadow clone, it is able to perform techniques and interact with the environment due to it having physical substance; and also evenly distributes the user's chakra to each clone. If the clone is injured, it will revert to its natural fire-state, at the same time burning whatever it is touching. This clone is at half power for all stats of it’s creator, except when using fire ninjutsu which allows them to be at full Control stat.<br><br>(Max Clones Permitted: Control Stat)<br>(Must use the jutsu the jutsu for as many clones created. I.e. 4 clones = 4 uses)<br>(All jutsu used by the clones drains the user as well)"
				dran = 800
				idran = "Chakra"
				RPPCost = 1500
				skil = "New"
				jut = "Ninjutsu"
				ran = "A"
				ele = "Fire"
		Srank

	Blank_Fire_Jutsu
		name = "Blank Fire Jutsu"
		description = ""
		dran = 0
		idran = "Chakra"
		skil = "New"
		jut = "Ninjutsu"
		ran = "E"
		ele = "Fire"



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Suiton
		icon = 'SkillCard.dmi'
		icon_state="Suiton"
		Drank
			Ninja_Art_Hidden_Mist_Jutsu// - D-Rank(Kirigakure Only) 150 <br>
				name = "Ninja Art: Kirigakure No Jutsu"
				description = "This displacement technique is a speciality of the ninja from Kirigakure, where one causes a mist to spring forth by lifting up some water from either a pre-existing source or expelled from their mouth, then goes in and out of sight at will from within the pearly-white realm. The mist's thickness is controlled by the amount of chakra kneaded into it. It can't fool the Byakugan, but, due to the mist being created with the user's chakra, any Sharingan and Rinnegan-user will see the mist coloured by their opponent's chakra, which will effectively hide the user from the dojutsu."
				dran = 350
				skil = "New"
				jut = "Ninjutsu"
				ran = "D"
				ele = "Water"
				idran = "Chakra"
			Ninja_Art_Water_Gun
				name = "Ninja Art: Watergun"
				description = "The user fires out a stream of water from their mouth. This is the simplest of water release techniques."
				dran = 275
				skil = "New"
				jut = "Ninjutsu"
				ran = "D"
				ele = "Water"
				idran = "Chakra"
		Crank
			Water_Style_Syrup_Trap// - C-Rank 350 <br>
				name = "Water Style: Syrup Trap"
				description = "The user spits out high-viscosity, chakra infused water, aimed at a surface of wide scope. This is a stream of sticky liquid which can be used to form an adhesive trap that can inhibit a person's mobility. One can effectively reduce their enemy's area of activity with this technique, and has the effect of being able to take complete control over the battlefield. The normal scope of this technique is normally just a few metres, but if prepared, it is also possible to make an entire pond of starch syrup. Being caught in the technique can be avoided by channelling chakra to one's feet allowing one to walk upon it uninhibited, beforehand."
				dran = 450
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Water"
			Water_Style_Raging_Waves// - C-Rank 299 ( discounted ) <br>
				name = "Water Style: Raging Waves"
				description = "Water gushes out from the mouth like a waterfall and washes away the enemy. One can freely control the power of this technique with the amount chakra one releases. Having many variations, this is a basic Water Release technique"
				dran = 300
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "C"
				ele = "Water"

			Water_Prison_Jutsu// - C-Rank 450 <br>
				name = "Suirou no Jutsu"
				description = "This technique is used to trap a victim inside a virtually inescapable sphere of water. The only downside to this technique is that the user must keep at least one arm inside the sphere at all times in order for the victim to remain imprisoned. This technique requires a sufficient amount of water, which can be provided by expelling it from one's mouth. Once trapped the target is unable to move or breathe while within it due to the heaviness of the water. Because of the density of the water it can be used, to a limited extent, for defensive purposes if performed on oneself. It can also be stored in scrolls as traps."
				dran = 555
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Water"
			Water_Clone
				name = "Water Clone"
				description = "This technique allows the user to make a clone infused with water. Because it is a elemental clone, it is able to perform techniques and interact with the environment due to it having physical substance; and also evenly distributes the user's chakra to each clone. If the clone is injured, it will revert to its natural water-state. This clone is at 1/4 power for all stats of it’s creator, except when using fire ninjutsu which allows them to be at full Control stat.<br><br>(Max Clones Permitted: Control Stat)<br>(Must use the jutsu the jutsu for as many clones created. I.e. 4 clones = 4 uses)<br>(All jutsu used by the clones drains the user as well)"
				dran = 350
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Water"
		Brank
			Water_Style_Water_Trumpet// - B-Rank 599 ( discounted ) <br>
				name = "Water Style: Water Trumpet"
				description = "The user launches a large jet of water from their mouth through their hand. This gives the appearance of playing a trumpet, hence the name."
				dran = 600
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
			Water_Style_Water_Wall// - B-Rank 700 <br>
				name = "Water Style: Water Wall"
				description = "This defensive technique creates a wall of water around the user. Enemy attacks are completely intercepted by a fence of water blown out from the mouth, and is raised from below with tremendous might. The water is blown out in the form of a circle around the user, and it makes for a Defense without openings. It is also possible for the user to control the amount of water and duration at will. The wall's strength and resistance change following the quantity of chakra poured down into the water, so a skilful shinobi will be able to build a sturdy one. Furthermore, because the field of vision is maintained even while defending one can easily go on to the next move, which is a great advantage. The wall can also be formed from a pre-existing water source."
				dran = 700
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
			Water_Style_Water_Dragon_Jutsu// - B-Rank 699 <br>
				name = "Water Style: Water Dragon Jutsu"
				description = "This technique shapes a large amount of water into a giant, powerful dragon, which hits the opponent with formidable might, dealing physical damage. The ideal place to use it is near a body of water, but if the user's skill allows it, it is possible to use it even in a place where there is none. The amount of water used will be in proportion with the user's skill."
				dran = 950
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
			Water_Style_Water_Shockwave// - B-Rank 650 <br>
				name = "Water Style: Water Shockwave"
				description = "This technique allows the user to make a spiralling vortex of water. The vortex then proceeds to explode from the top in the form of a wave. The user can also control the direction the wave goes with hand movements."
				dran = 1100
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
			Water_Style_Exploding_Water_Shock_Wave//- B-Rank 600 <br>
				name = "Water Style: Exploding Water Shock Wave"
				description = "The user spits out a great volume of water from their mouth, swallowing up and crushing the enemy with the advancing surge. The user can ride the wave, allowing them to move at high speed, and attack the enemy, now swept off their feet, without fear of counter-attacks. The amount of water created is proportional to the amount of chakra used; when used with Kisame's enormous chakra, even a dry wasteland can become a small ocean. Afterwards, the excess water can be used for additional Water Release techniques."
				dran = 1200
				idran = "Chakra"
				skil = "New"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
		Arank
			Water_Style_Giant_Vortex_Jutsu// - A-Rank 900 <br><br>
				name = "Water Style: Giant Vortex Jutsu"
				description = "This technique extends water over a large scale, surges and rises up to several dozens of metres high. Then it streams down to the ground in one big cascade, much like a gigantic waterfall. In doing so, it resembles a huge wave, with tremendous power that can hollow out the ground. What remains after that technique's utilisation is reminiscent of no less than the aftermath of a natural disaster. This is a considerably advanced ninjutsu, and activating this technique requires a fair amount of chakra."
				dran = 1300
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "B"
				ele = "Water"
			Water_Clone_Jutsu// - C-Rank 500 <br>
				name = "Mizu Bunshin no Jutsu"
				description = "This technique allows the user to make a shadow clone infused with water. Because it is a shadow clone, it is able to perform techniques and interact with the environment due to it having physical substance; and also evenly distributes the user's chakra to each clone. If the clone is injured, it will revert to its natural water-state. This clone is at half power for all stats of it’s creator, except when using water ninjutsu which allows them to be at full Control stat.<br><br>(Max Clones Permitted: Control Stat)<br>(Must use the jutsu the jutsu for as many clones created. I.e. 4 clones = 4 uses)<br>(All jutsu used by the clones drains the user as well)"
				dran = 800
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "A"
				ele = "Water"
		Srank
	Blank_Water_Jutsu
		name = "Blank Water Jutsu"
		description = ""
		dran = 0
		idran = "Chakra"
		skil = "New"
		jut = "Ninjutsu"
		ran = "E"
		ele = "Water"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	Raiton
		icon = 'SkillCard.dmi'
		icon_state="Raiton"
		Drank
			Ninja_Art_Raiton_Flash// - D-Rank 350
				name = "Ninja Art: Raiton Flash"
				description = "The user surges their chakra for a moment. The air directly around their body surges with raiton chakra shocking their opponents, numbing them for a moment."
				dran = 250
				skil = "New"
				idran = "Chakra"
				jut = "Ninjutsu"
				ran = "D"
				ele = "Lightning"
		Crank
			Lightning_Style_Earth_Flash// - C-Rank 500 <br>
				name = "Lightning Style: Earth Flash"
				description = "This technique allows the user to create a wave of electricity from their hands. The user can vary its power from a small surge to shock an opponent to a powerful stream of lightning capable of ripping through solid rock. It is ideal to use in conjunction with a water technique."
				dran = 450
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Lightning"
			Ninja_Art_Lightning_Ball// - C-Rank 450 <br>
				name = "Ninja Art: Lighting Ball"
				description = "By gathering lightning chakra between their hands or two chakra flow weapons, the user creates a ball of lightning that they then shoot."
				dran = 350
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Lightning"
			Lightning_Clone
				name = "Lightning Clone"
				description = "This technique allows the user to make a clone infused with water. Because it is a elemental clone, it is able to perform techniques and interact with the environment due to it having physical substance; and also evenly distributes the user's chakra to each clone. If the clone is injured, it will revert to its natural lightning-state, at the same time shocking whatever it is touching. This clone is at 1/4 power for all stats of it’s creator, except when using fire ninjutsu which allows them to be at full Control stat.<br><br>(Max Clones Permitted: Control Stat)<br>(Must use the jutsu the jutsu for as many clones created. I.e. 4 clones = 4 uses)<br>(All jutsu used by the clones drains the user as well)"
				dran = 350
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Lightning"
		Brank

			Ninja_Art_Lightning_Fangs// - B-Rank 650 <br>
				name = "Ninja Art: Lightning Fangs"
				description = "The user flows their lightning chakra through their chakra flow weapon in order to send bolts of lightning towards their opponent."
				dran = 500
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Lightning"
			Lightning_Style_Electric_Needle_Spark// - B-Rank 599 ( discounted ) <br>
				name = "Lightning Style: Electric Needle Spark"
				description = "After coming into physical contact with the opponent, the user raises their arm into the air, generating a powerful bolt of electricity which travels through their body into the body of the opponent."
				dran = 650
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Lightning"
		Arank
			Chidori// - A-Rank 1100 + Other Requirements <br>
				name = "Raiton: Chidori"
				description = "This technique channels a large amount of lightning chakra to the user's hand. The amount of chakra is so great that it becomes visible. The high concentration of electricity produces a sound reminiscent of many birds chirping, hence the name. Once the technique is completed, the user charges forward and thrusts the Chidori into the target. This produces heavy amounts of damage that is usually fatal. This technique is classified as an assassination technique because of the speed at which it is performed, despite the loud noise it produces."
				dran = 900
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Lightning"
			Chidori_Senbon// - A-Rank 900 + Chidori <br>
				name = "Raiton: Chidori Senbon"
				description = "This is one of many variations of the Chidori that uses shape transformation. It is specialised in more speed, by being transformed into countless sharp senbon, all aimed at the enemy. By increasing the amount of chakra used, the number of senbon also increases. It can become even more effective by using it together with the Sharingan, allowing the user to precisely shoot for the enemy's vital points."
				dran = 950
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Lightning"
			Lightning_Release_Armor// - A-Rank 1100 + Other Requirements <br>
				name = "Raiton No Yoroi"
				description = "The user wraps their body in a layer of lightning chakra that, instead of being used offensively, is used to electrically stimulate the user's nervous system. The technique speeds up neural synapses to react faster, and to push physical prowess to the absolute limit, allowing for tremendous raw speed."
				dran = 1350
				skil = "New"
				jut = "Ninjutsu"
				ran = "A"
				idran = "Chakra"
				ele = "Lightning"
			Nervous_System_Rupture //(Medical Ninja Only)-A-Rank 1150 <br>
				name = "Nervous System Rupture"
				description = "An extremely high-level technique, used as a medical ninjutsu. The human body is controlled with electrical signals from the brain, but a person who had those electrical signals cut off with this technique will become unable to make their body move as they want. By transforming the chakra within one's body and giving it the properties of electricity, one creates an electric field. As soon as a strike of the hand lands, electricity is poured into the enemy's nervous system, severing the signals and deranging their body control. The target's body moves in any way, except how they want it to move. For the common shinobi, battle, not to mention even just walking, will become impossible."
				dran = 750
				skil = "New"
				jut = "Ninjutsu"
				ran = "A"
				idran = "Chakra"
				ele = "Lightning"
			Lightning_Clone_Jutsu// - B-Rank 699 <br>
				name = "Lightning Style Shadow Clone Jutsu"
				description = "This technique allows the user to make a shadow clone infused with lightning. Because it is a shadow clone, it is able to perform techniques and interact with the environment due to it having physical substance; and also evenly distributes the user's chakra to each clone. If the clone is injured, it will revert to its natural lightning-state, at the same time burning whatever it is touching. This clone is at half power for all stats of it’s creator, except when using water ninjutsu which allows them to be at full Control stat.<br><br>(Max Clones Permitted: Control Stat)<br>(Must use the jutsu the jutsu for as many clones created. I.e. 4 clones = 4 uses)<br>(All jutsu used by the clones drains the user as well)"
				dran = 850
				skil = "New"
				jut = "Ninjutsu"
				ran = "A"
				idran = "Chakra"
				ele = "Lightning"
		Srank
			Lightning_Blade// - S-Rank 1500 + Other Requirements.
				name = "Raikiri"
				description = "The Lightning Cutter is an enhanced and concentrated form of the Chidori with the same effects and drawbacks."
				dran = 1000
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "S"
				ele = "Lightning"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Doton
		icon = 'SkillCard.dmi'
		icon_state="Doton"
		Drank
			Earth_Style_Mud_Silhouette// - D-Rank 250 <br>
				name = "Earth Style: Mud Silhouette"
				description = "This technique lets the user summon a river of mud. This technique can have water added to it to speed up the flow and increase its power."
				dran = 300
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "D"
				ele= "Earth"
			Earth_Style_Headhunter_Jutsu// - D-Rank 150 <br>
				name = "Earth Style: Headhunter Jutsu"
				description = "This technique conceals the user underground and drags the object of their attack down into the earth, robbing them of their freedom. In addition, they can start another attack."
				dran = 250
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "D"
				ele = "Earth"
		Crank
			Earth_Style_Hidden_Mole_Jutsu// - C-Rank 450 <br>
				name = "Earth Style: Hiding like a Mole Jutsu"
				description = "This technique changes earth into fine sand by channelling chakra into it, allowing the user to dig through it like a mole. This effect goes around the body (not just the hands), making it just large enough for a person to move through. The user can pinpoint where they are, despite being underground, by sensing the magnetic forces. They can also sense what is happening on the surface and use that information to launch a surprise attack on the enemy.One can also hide deep in the ground, escaping to a depth where the enemy can't reach. It also appears that after digging, the ground can be returned to its original state, leaving no trace of where the user entered the earth."
				dran = 300
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Earth"
			Earth_Style_Underground_Shark_Jutsu// - C-Rank 500 <br>
				name = "Earth Style: Subterranean Voyage"
				description = "A technique that transforms the earth surrounding the user into a fluid, allowing them to close in on the enemy with high speed by swimming underground. Since being under the ground is a blind spot, the target has no warning; allowing the user to launch a surprise attack. By using this technique in conjunction with a weapon, it also gains great effect as an assault ninjutsu."
				dran = 325
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Earth"
			Rock_Clone_Jutsu// - C-Rank 350 <br>
				name = "Earth Style: Rock Clone"
				description = "This technique allows the user to make a clone infused with earth. Because it is a elemental clone, it is able to perform techniques and interact with the environment due to it having physical substance; and also evenly distributes the user's chakra to each clone. If the clone is injured, it will revert to its natural earth-state. This clone is at 1/4 power for all stats of it’s creator, except when using fire ninjutsu which allows them to be at full Control stat.<br><br>(Max Clones Permitted: Control Stat)<br>(Must use the jutsu the jutsu for as many clones created. I.e. 4 clones = 4 uses)<br>(All jutsu used by the clones drains the user as well)"
				dran = 350
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Earth"

		Brank
			Earth_Style_Mud_Wall// - B-Rank 650 <br>
				name = "Earth Style: Mud Wall"
				description = "The user creates a solid wall of earth as a form of Defense. Chakra is either converted to earth within the body and then spat out to form the wall or the user can manipulate pre-existing earth to form the wall. The earth then instantly rises up and takes form. The barrier itself is also coated with chakra, making its strength incomparable to that of a normal mud wall. Because of the earth's special characteristics, the wall is highly resistant against, for instance, fire and water. "
				dran = 450
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Earth"
			Earth_Style_Earth_Dragon_Bomb// - B-Rank 799 <br>
				name = "Earth Style: Earth Dragon Bomb"
				description = "When used with Earth Release: Earth Flow River, this technique can create a dragon-like head to fire balls of mud at an opponent. This can also be combined with a fire technique to shoot searing hot rock towards an opponent."
				dran = 500
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Earth"
			Earth_Style_Earthen_Corridor// - B-Rank 699 <br>
				name = "Earth Style: Earthen Corridor"
				description = "This technique causes the earth in the surrounding area to rise up and over a target and create a cavern, imprisoning the target. The user can leave an opening to allow attacks to go in to strike down the trapped adversaries, or close it up completely to prevent escape."
				dran = 650
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Earth"
			Earth_Style_Iron_Skin// - B-Rank// 799 <br>
				name = "Earth Style: Iron Skin"
				description = "The user flows chakra through all parts of their body causing it to become noticeably darker, which increases their defensive power to its utmost limits by making the skin as hard as diamond. Furthermore, the destructive power of physical attacks is increased, making this a great all-purpose technique. The amount of techniques that can break through the areas hardened by the Earth Spear are close to zero, excluding its undeniable weak point: Lightning Release ninjutsu."
				dran = 700
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Earth"
		Arank
			Earth_Style_Dark_Swamp// - A-Rank// 900 <br>
				name = "Earth Release: Swamp of the Underworld"
				description = "By changing the surface of an object beneath an enemy into mud and creating a swamp, the user can sink his enemy into the mud. The adhesive, chakra-infused mud ensnares the enemy's body, making it almost impossible to recover one's strength and escape from the swamp. The size and depth of the created swamp depends on the user's skill and the amount of chakra used, but if the user is an expert in this technique, it will always be possible to make a fair-sized swamp which is extremely effective against a great number of enemies or when having to face gigantic creatures.<br>Note: For every boost in size, use it once more. One use is the size of a single human. Two uses for two humans. Three uses for a medium summoning. 10 uses for one the size of Gamabunta or the larger Bijuu."
				dran = 900
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Earth"
			Earth_Style_Earth_Golem_Jutsu // - A-Rank 1200 <br><br>
				name = "Earth Style: Earth Golem Jutsu"
				description = "This technique allows the user to create a large, humanoid creature composed of rock that can either be expelled from the user's mouth or formed from a nearby, pre-existing source of earth. Depending on the user, the golem can be formed instantly."
				dran = 850
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Earth"
			Earth_Clone_Jutsu// - C-Rank 550 <br>
				name = "Earth Style: Shadow Clone"
				description = "This technique allows the user to make a shadow clone infused with earth. Because it is a shadow clone, it is able to perform techniques and interact with the environment due to it having physical substance; and also evenly distributes the user's chakra to each clone. If the clone is injured, it will revert to its natural earth-state. This clone is at half power for all stats of it’s creator, except when using water ninjutsu which allows them to be at full Control stat.<br><br>(Max Clones Permitted: Control Stat)<br>(Must use the jutsu the jutsu for as many clones created. I.e. 4 clones = 4 uses)<br>(All jutsu used by the clones drains the user as well)"
				dran = 800
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Earth"
		Srank

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Aburame
		icon = 'SkillCard.dmi'
		icon_state = "Aburame"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Erank
			ran = "E"
			Insect_Tracking_Technique
				name = "Insect Tracking Technique"
				description = "The user sends a tiny female kikaichuu to land on their opponent. The female releases a scent that draws in the rest of their bugs making all of the user's parasitic insect attacks homing even if the user cannot see/sense their target."
				dran = 20
		Drank
			ran = "D"
			Parasitic_Insects_Jutsu
				name = "Parasitic Insects Jutsu"
				description = "The user manipulates their gathered bugs using a sort of Hive Mind effect which gives them minute control over the insects."
				dran = 260

		Crank
			ran = "C"
			Insect_Summoning_Jutsu
				name = "Insect Summoning Jutsu"
				description = "The user summons a large hive of their Parasitic Desctruction Insects to fight alongside them."
				dran = 355
		Brank
			ran = "B"
			Insect_Sphere
				name = "Mushidama"
				description = "The user creates a large orb of their insects which fly towards the target. If even a portion makes contact, the bugs quickly swarm the target's body, quickly drinking their chakra."
				dran = 560
		Arank
			ran = "A"
		Srank
			ran = "S"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/*	Lyzerg
		icon = 'SkillCard.dmi'
		icon_state = "Illusion"
		skil = "New"
		jut = "Genjutsu"
		idran = "Chakra"
		ele = "Illusion"
		Drank
			ran = "D"
			Genjutsu_Cancel
				name = "Illusion Release: Genjutsu Cancel"
				description = "The user causes their chakra network to automatically disrupt its flow periodically. During these disruptions their jutsu often fail or waver. After mastering this technique, the wavers and failures stop occuring."
				dran = 100
			Kuchiyose1
				jut = "Ninjutsu"
				ele = "Elementless"
				name = "Personal Summon"
				description = "The user summons their personal summon. The summon cannot be larger than a normal sized dog."
				dran = 250
			ShadowBlink
				name = "Shadow Blink"
				description = "The user makes eye contact with their target, causing them to go blind for a moment. It lasts for the duration of two blinks."
				dran = 175
			SilentFlash
				name = "Silent Flash"
				description = "The user sings or plays a singular note which causes anyone who hears it to go deaf for half of a turn."
				dran = 180
		Crank
			ran = "C"
			Kuchiyose2
				jut = "Ninjutsu"
				ele = "Elementless"
				name = "Combat Summon"
				description = "The user summons either their Medium sized Personal summon or the small version of their Combat Summon."
				dran = 375
			ShadowSight
				name = "Shadow Sight"
				description = "The user makes eye contact with their target, causing them to go blind for the entire duration of a single turn."
				dran = 450
			SilentNight
				name = "Silent Night"
				description = "The user sings a series of three notes which causes anyone who hears it to go deaf for the duration of a single turn."
				dran = 445
			TerrorOfTheNight
				name = "Terror of the Night"
				description = "The user pulses their chakra outwards from their body in a three by three area. Anyone caught within is plunged into a shadowy realm and forced to relive their darkest fears, the greater the fear caused, the greater the shock."
				dran = 450
			IllusionBlade
				name = "Illusion Blade"
				description = "The user flows their Illusion chakra through a weapon, anyone who is struck with the weapon, or if it's an instrument, hears it, is struck by any Genjutsu that the user knows. This can be used as a way of activated a Genjutsu via different means than what is intrisic to the jutu itself."
				dran = 475
		Brank
			ran = "B"
			EternalShadowSight
				name = "Eternal Shadow Sight"
				description = "The user's eyes turn pitch black. Anyone who they make eye contact with after activating this jutsu goes blind until they turn it off. For every person after the first the user's chakra is strained and their body is stressed. If they hold more than three people for longer than one turn they become irrevocably blind."
				dran = 700
			WorldOfMadness
				name = "The World of Madness"
				description = "The user releases a pulse of chakra outwards in a five by five area. Anyone caught in this pulse is plunged into a shadowy realm of darkness where they relive their darkest fears. This lasts for two turns and cannot be countered by Kai. Anyone who's Genjutsu Resistance + Intelligence is less than 1/2 of the user's is left incapacitated and unconscious."
				dran = 750
			PsychicStrike
				name = "Psychic Strike"
				description = "The user moulds their Illusion Chakra around their limbs. When they strike the chakra flows into their target and causes them a small amount of physical discomfort even if they miss the actual attack. Damage uses the user's Genjutsu / 2 compared to target's durability."
				dran = 475
		Arank
			ran = "A"
			EternalSilence
				name = "Eternal Silence"
				description = "The user plays/sings a song that takes an entire turn to play. If successfully performed, anyone within the influence of the song will go permenantly deaf."
				dran = 950
			ShadowRealm
				name = "The Shadow Realm"
				description = "The user releases a pulse of chakra outwards in a five by five area. Anyone caught in this pulse is plunged into a shadowy realm of darkness where they relive their darkest fears. This lasts for two turns and cannot be countered by Kai. Anyone who's Genjutsu Resistance + Intelligence is less than the user's is left incapacitated and unconscious."

		Srank
			ran = "S"
			PsychoBreaker
				name = "Psycho Breaker"
				description = "The user releases a burst of chakra into their target. If their Genjutsu Resistance + Intelligence is lower than the user's, then their mind is broken, they lose all of their memories and have their personality wiped are left unconscious after a short period."
				dran = 1500

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Houkyakyu
		icon = 'SkillCard.dmi'
		icon_state = "Houkyakyu"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Kekkei = 1
		Drank
			ran = "D"
			Hinder_Bomb
				name = "Hinder Bomb"
				description = "The user's wrist rings extend, they are able to fire a small orb of chakra that, upon contact with anything solid, explodes with concussive force to knock back and possibly incapacitate their target."
				dran = 375

		Crank
			ran = "C"
			Accela_Flash
				name = "Accela Flash"
				description = "The blue rings around the user's legs expand increasing their speed and movement. When they make a leap, a minor, mild, shock-less wave appears the moment their feet hit the ground. From Veteran onward, the user leaves afterimages which makes it seem as if they had not yet moved. Can only be used Once a turn at New. Twice at Novice. Three times at Expert. Four times at Veteran. and Five at Master."
				dran = 450
			Text_Weapon
				name = "Text Weapon"
				description = "The user's hands glow bright red. By touching the surface of something solid, they are capable of creating a weapon from that contact, however the weapon's durability will be as strong as the material used to make it."
				dran = 250

		Brank
			ran = "B"
			Aegis
				name = "Aegis"
				description = "The blue rings around the user's wrist extend outwards. The user is able to completely negate an elemental jutsu and draw it into one of the eight diamonds upon their back. Depending on the element of the technique, the color of the diamond will change."
				dran = 450
			Strife
				name = "Strife"
				description = "The user fires one of the stored jutsu from their diamonds by placing their hands together and linking their fingers into a single fist. The two blue rings around their arms link together and create a sort of cannon from which the jutsu is fired as a beam of its elemented chakra."
				dran = 500

		Arank
			ran = "A"
			Angelica
				name = "Angelica"
				description = "The user forces a massive amount of chakra into the diamonds on their back. The chakra is jettisoned outwards in the form of angelic wings. The user gains the ability to fly around. The blue rings around their arms and legs extend. They are able to fire blasts of non-elemented chakra from the rings on their arms and fire bursts of chakra from the ones around their legs to propel themselves. After using this technique, the user's chakra is sealed away temporarily, leaving them incapacitated and drained."
				dran = 1200


*/




//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Akimichi
		icon = 'SkillCard.dmi'
		icon_state = "Akimichi"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			ran = "D"
		Crank
			ran = "C"
			Human_Boulder
				name = "Human Boulder"
				description = "The user's body expands rapidly and they take on a large orb shape. After tucking in their head and limbs, the user rolls around like a boulder, crushing anything in their path."
				dran = 600
				CalDran = 300
			Expansion_Jutsu
				name = "Expansion Jutsu"
				description = "The user, manipulating their calories into chakra, increases their size by large multiples increasing their power and durability."
				dran = 650
				CalDran = 300
			Partial_Expansion
				name = "Partial Expansion Jutsu"
				description = "The user changes the	size of just a portion of their body as opposed to their entire body using the process of the Baika no Jutsu. <br><center>Strength + Taijutsu vs Durability x2. +1 to damage for every master user has. Example: New = +1, Novice = +2, Expert = +3, Veteran = +4, Master = +5</center>"
				dran = 450
				CalDran = 300
			Spiked_Meat_Tank
				name = "Spiked Meat Tank"
				description = "The user, puts on a roped jacket covered in kunai before using the Human Boulder technique. This technique has increased lethality and danger for possible targets. Not only crushing, but impaling them."
				dran = 600
				CalDran = 300

		Brank
			ran = "B"
			Butterfly_Bomb
				name = "Butterfly Bomb"
				description = "The user, after eating the third of the Akimichi Pills, or after having mastered the technique without them, sprouts a pair of Butterfly Wings made of chakra and draws the entirety of this chakra into their fist and performs a massive chakra enhanced strike. "
				dran = 700
				CalDran = 500
			Super_Expansion_Jutsu
				name = "Super Expansion Jutsu"
				description = "The user grows to a massive size making them able to fight on par with a larger bijuu or even Gamabunta. This increases their strength by ridiculous amounts and doesn't really affect their speed as they are capable of crossing long distances with very little effort because of their size. <br><center> +8 Strength, +8 Durability, +8 Ninjutsu Defense</center>"
				dran = 750
				CalDran = 500
			Earthquake_Slam
				name = "Earthquake Slam"
				description = "The user, after using the Super Expansion Jutsu, channels their chakra to their hands before slamming them into the ground. This creates a massive tremor in the ground as well as cleaving it in two in a straight line away from the epicenter, leaving a crater at the center of the attack."
				jut = "Taijutsu"
				dran = 775
				CalDran = 500
			BallisticWaterwheel
				name = "Ballistic Waterwheel"
				description = "After the user swallows a great amount of water to make themselves into a human-sized ball, they tuck their limbs inside their clothes and use chakra to propel themselves into a powerful roll. The added water gives the user extra weight, causing more damage to the opponent and area. This is an excellent technique to use against Water Release users as it not only nullifies their attack but also turns it against them."
				jut = "Taijutsu"
				dran = 500
				CalDran = 500
			SuperOpenHandSlap
				name = "Super Open Hand Slap"
				description = "After using the Multi-Size Technique to increase their size, the user funnels chakra into their hands, which causes special markings to appear in them. The weight and power of the hands are greatly increased because of the larger size, the muscles are activated with concentrated chakra, and the thickness is also increased. With so much chakra that it becomes visible, the user's palms become like an iron hammer. This gives this attack the power to even cave in the earth, causing extensive crushing damage to anything that may be caught beneath them. This attack is also shown to have a wide range due to the increased size of his palms."
				dran = 1000
				CalDran = 500


		Arank
			ran = "A"
		Srank
			ran = "S"




//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Yamanaka
		icon = 'SkillCard.dmi'
		icon_state = "Kawarimi"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			ran = "D"
		Crank
			ran = "C"
			SensingTransmission
				name = "Sensing Transmission"
				description = "By making physical contact with another individual, the user is able to transmit what they are currently sensing directly into the said target's mind.<br><br>(Requires T1 Sensing)"
				dran = 250
			MindBodySwitchTechnique
				name = "Mind Body Switch Technique"
				description = "With this technique, a ninja sends their mind as spiritual energy into a target's body supplanting the target's mind with their own. The user transfers their consciousness to the target, giving them complete control of the body for a short period of time. While in control of the body, the user is able to communicate with the target. Since the user is in another body, they are also able to use that body's chakra. It is also possible for the user to switch bodies with the target. This has great strategic value when used on a team-mate as neither body is left incapacitated and they may also make use of the user's abilities as well as their own while doing this. To remain inconspicuous when spying, the user can perform this technique on an animal, such as a hawk, which they can use to do aerial reconnaissance. It is generally used on immobilised targets. Conversely however, the user's original body is left defenceless while this technique is active, leaving it susceptible to attack until they return. The mind transfer moves slowly in a straight direction and takes some time to return to the user's body if it misses. Similarly, if the opponent's will is strong enough, they can force the user from their body. Also, if the user's chakra level is low, the technique will be harder to maintain. Furthermore, should any physical injury befall the victim's body while the mind link is active, it would cause the user's body to also receive those same injuries. This can be rectified if user cancels the technique before the victim's body receives the damage.<br><br>(Con + Intel vs Intel x2)"
				dran = 	350
		Brank
			ran = "B"
			MindBodyDisturbanceTechnique
				name = "Mind Body Disturbance Technique"
				description = "A ninjutsu where one sends their chakra into the subject's nervous system, thus gaining complete control of the target's body. The enemies this technique is cast upon are completely under the user's control, as their bodies become disconnected from their will. The difference between this and the Mind Body Switch Technique is that the caster doesn't project their consciousness into the enemies' bodies. Situations of numerical superiority for the adversary are precisely where this technique, which freely manipulates human beings, will display its efficiency, by getting the enemies to turn on one another. Control can be exerted even from long distances.<br><br>(Con + Intel vs Intel x2)"
				dran = 800
			MindBodyTransmissionTechnique
				name = "Mind Body Transmission Technique"
				description = "The Mind Body Transmission Technique allows the user to telepathically communicate with other people. Using this technique, the Yamanaka may also act as a medium for persons to communicate with one another telepathically; this is done through establishing physical contact with the person. The user can communicate with multiple people at once and the targets can also communicate with one another while the technique is in effect. This technique is not limited to just transmitting thoughts, and images such as memories or even strong feelings can be conveyed through this method. The more people that are connection through this technique however, the more a physical strain is put on the user, forcing them to keep the connection going for shorter periods to otherwise avoid sustaining injuries.<br><br>(1-2nd Round: Safe, 3rd: Headache, 4th: Mental Strain, 5th: Brain Hemorrhaging)"
				dran = 800
			MindCloneSwitchTechnique
				name = "Mind Clone Switch Technique"
				description = "This technique allows the user to transfer their consciousness into more than one target by cloning their consciousness, giving them complete control of the bodies for a short period of time. Like the Mind Body Switch Technique, the user's body is left defenceless while the technique is in use. Unlike the Mind Body Switch, this technique can travel in a curved line.<br><br>(Con + Intel vs Intel x2 (Calculated individually for each target))<br>)Number of Clones: New: 2, Novice: 3, Expert: 4, Veteran: 5, Mastered: 6)"
				dran = 500
		Arank
			ran = "A"
			MindDisturbanceDancePerformanceTechnique
				name = "Mind Disturbance Dance Performance Technique"
				description = "This is simply a large-scale version of the Mind Body Disturbance Technique, where the sheer volume of people affected in a given area is much greater. Like its parent technique, it causes the user to gain complete control of the target's body, often forcing allies to attack each other.<br><br>(Con + Intel vs Intel x2 (Calculated individually for each target))<br>(Everyone effected in the AOE of 15x15 tiles)"
				dran = 3000
			MindPuppetSwitchCursedSealTechnique
				name = "Mind Puppet Switch Cursed Seal Technique"
				description = "The user of this technique firstly transfers their mind into a puppet laid somewhere in advance, near the vicinity of an enemy's predicted path, before manipulating it to attack an intended opponent. When the opponent counters and inflicts damage upon the puppet or the puppet inflicts damage on the enemy, the cursed seal will take effect, causing the kanji 'curse' to disappear from the puppet's forehead and the two consciousness (that of the user's inside the puppet and that of the victim who countered) to switch. Consequently, the user will gain full control of the opponent's body, while the victim's mind remains trapped within the immobile puppet. Like the original technique, the user's body is left defenceless while the ability is active and any injury done to the victim's body is also reflected upon their true body, but this can be rectified if the user cancels the technique just before any damage is received. Unlike the original, the user does not have to worry about the target's will overpowering their own, as it is sealed in the puppet.<br><br>(If the attack lands, the mind body switch cannot be resisted, no calculation needed)"
				dran = 1000

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Hyuuga
		icon = 'SkillCard.dmi'
		icon_state = "Hyuuga"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			ran = "D"
			Palm_Heel_Strike
				name = "Palm Heel Strike"
				description = "The user strikes an opponents chakra pathway with a palm heel strike causing both internal and external damage."
				jut = "Taijutsu"
				idran = "Stamina"
				dran = 100
		Crank
			ran = "C"
			Rotations
				name = "Eight Trigrams: Heavenly Rotation"
				description = "The user expels chakra from every one of their chakra points while at the same time rotating. This technique acts as both offense and Defense in most situations. It cannot be used if the user cannot spin properly."
				dran = 375
			Protection
				name = "Eight Trigrams: Protection of the Holy Eight Trigrams"
				description = "The user makes several dozen strikes in the air around them creating a slicing, protective, sphere of chakra which upon completion, the user expels outwards to attack anyone within the near vicinity of the attack."
				dran = 400
		Brank
			ran = "B"
			SixtyFourPalms
				name = "Eight Trigrams: Sixty Four Palms"
				description = "After the user catches their target within the range of this technique, their strike at 64 of the targets chakra points, causing massive internal damage to both their chakra system and their organs."
				dran = 455
			AirPalm
				name = "Eight Trigrams: Air Palm"
				description = "The user releases a burst of chakra directly from their hand which strikes their target from a distance causing internal damage."
				dran = 390
		Arank
			ran = "A"
			OneTwoEightPalms
				name = "Eight Trigrams: One Hundred Twenty-Eight Palms"
				description = "After the user catches their target within the range of this technique, they strikes at 124 of the targets chakra points, causing massive internal damage to both their chakra system and their organs. This causes their body to shut down and death to come shortly thereafter."
				dran = 800
		Srank
			ran = "S"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Hozuki
		icon = 'SkillCard.dmi'
		icon_state = "Suika"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Water"
		Drank
			ran = "D"
		Crank
			ran = "C"
			Suiga
				name = "Water Transformation Jutsu"
				description = "The user transforms their entire body, or a part of their body, into water in order to avoid taking damage or to sneak up on a target. If they are electrocuted in this form, they will turn into a jelly-like state."
				dran = 275
		Brank
			ran = "B"
			GreatWaterArm
				name = "Water Style: Great Water Arm Jutsu"
				description = "The user increases the size and power of one of their arms, allowing for them to lift larger loads and deal more damage with a single blow."
				dran = 400
			DemonFish
				name = "Water Style: Demon Fish"
				description = "The user melds with a body of water before manipulating the water in the shape of a large monster which they then control."
				dran = 600
			FangBomb
				name = "Water Style: Water Fang Bomb"
				description = "The user jettisons themself at their target, giving them an increase in speed and ability to deal damage."
				dran = 400
		Arank
			ran = "A"
			WaterGun
				name = "Water Style: Water Gun no Jutsu"
				description = "The user fires a stream of water from their finger. This bullet is capable of cutting through flesh and bone with ease."
				dran = 700
		Srank
			ran = "S"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Inuzuka
		icon = 'SkillCard.dmi'
		icon_state = "Inuzuka"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Erank
			ran = "E"
			DynamicMarking
				name = "Dynamic Marking"
				description = "This technique involves a Ninken urinating on a target, marking it with a strong odour that allows both them and their partner to easily track it by scent.  The Ninken is able to accurately hit targets.  This is a prerequisite for using the Fang Wolf Fang technique unless the user is a sensor."

		Drank
			ran = "D"
			ManBeastClone
				name = "Man-Beast Clone"
				description = "The user's canine companion transforms into them."
				dran = 100

			TunnellingFang
				name = "Tsuuga"
				description = "The user runs while on all fours and rapidly spins, ripping and shredding anything in their way."
				dran = 265
				idran = "Stamina"
				jut = "Taijutsu"
		Crank
			ran = "C"
			FangOverFang
				name = "Gatsuuga"
				description = "The user, and their dog after they have transformed into them, perform the Tunnelling Fang technique in tandem with one another."
				dran = 376
				idran = "Stamina"
				jut = "Taijutsu"
		Brank
			ran = "B"
			WolfTransform
				name = "Inuzuka Style: Man Beast Transformation Combo: Two-Headed Wolf"
				description = "The user and their canine transform, morphing together into a giant two-headed wolf-like beast."
				dran = 500
			Garoga
				name = "Garouga"
				description = "Man and beast transform into a single two-headed, gigantic animal thanks to the Human Beast Combination Transformation: Double-Headed Wolf technique, and have their body spin in a violent assault against the enemy.  The ultra-violent rotation creates a vacuum vortex in its surroundings, that tears the enemy apart even without touching them directly.  The excessively high speed of the rotation strips the user of their field of vision.if the user is skilled enough though this is unnecessary."
				dran = 450
		Arank
			ran = "A"
		Srank
			ran = "S"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Sabaku
		icon = 'SkillCard.dmi'
		icon_state = "Sabaku"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Magnetism"
		Drank
			ran = "D"
			Sand_Shuriken
				name = "Sand Shuriken"
				description = "The user creates shuriken out of sand and fires them off at their opponent."
				dran = 200
			Third_Eye
				name = "Third Eye"
				description = "With chakra, the user connects an eye made of sand to their optic nerve, which enables them to know what happens in the artificial eye's field of vision, this is genuinely a third eye for its user. The user can control the size of the eye depending on its use. Its main purpose is spying, since it can form and disperse in any location on command. Gaara also uses it when he completely surrounds himself with his Shield of Sand so he can see what's happening outside of the protective dome. In order to activate it, however, the user must close one of their eyes."

	 	Crank
	 		ran = "C"
	 		Sand_Armor
	 			icon_state = "Yoroi"
	 			name = "Sand Armor"
	 			description = "The user draws around them a mass of sand which adheres to their skin and increases their Defense by a massive amount, enough to triple their durability at the minimum. This technique is weak against raiton."
	 			dran = 350
	 		Sand_Shield
	 			icon_state = "Mayu"
	 			name = "Sand Shield"
	 			description = "The user creates a dome of sand around them that is nigh impenetrable to most techniques, but just about any raiton technique will tear through it with ease."
	 			dran = 400
	 		Sand_Coffin
	 			icon_state = "Kyuu"
	 			name = "Sabaku Kyuu"
	 			description = "The user binds their target within a crushing coffin of sand leaving only their head exposed. This not only deals damage on its own but it takes any chance of their opponents escape away from them."
	 			dran = 375
	 	Brank
	 		ran = "B"
	 		Sand_Burial
	 			icon_state = "Sousou"
	 			name = "Sabaku Sousou"
	 			description = "The user crushes an opponent that they have captured within a sand coffin. This is an instant kill technique and turns their opponent to little more than a blood rain."
				dran = 400
			Sand_Tsunami
				icon_state = "Tsunami"
				name = "Sand Tsunami"
				description = "The user creates a massive crushing wave of sand to capture a large group of targets or to simply take away any chance a target has of escaping."
				dran = 450
			Great_Sand_Pyramid
				icon_state = "Tsunami"
				name = "Great Sand Pyramid"
				description = "The user moulds their sand into a large pyramid after using the Sand Tsunami, capturing anyone that was caught in the wave. They then compact the pyramid down into a singular point, crushing everyone caught in the pyramid."
				dran = 750
	 	Arank
	 		ran = "A"
	 		Giant_Sand_Burial
	 			name = "Great Desert Burial"
	 			description = "The user activates Sand Burial upon multiple targets that they have trapped using either Sand Tsunami or multiple Sand Coffin."
	 			dran = 1100
	 		Great_Sand_Pyramid
				icon_state = "Tsunami"
				name = "Great Sand Pyramid"
				description = "The user moulds their sand into a large pyramid after using the Sand Tsunami, capturing anyone that was caught in the wave. They then compact the pyramid down into a singular point, crushing everyone caught in the pyramid."
				dran = 750

	 	Srank
	 		ran = "S"


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Kaguya
		icon = 'SkillCard.dmi'
		icon_state = "Karamatsu no Mai"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			ran = "D"
			BoneBullets
				name = "Digital Shrapnel"
				description = "The user fires off small missles from their fingers, causing blunt damage to anything that they hit. When mastered, the bone bullets gain a piercing element. Attack Power vs Ninjutsu Defense."
				dran = 250


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/*	Kyokugi
		icon = 'Bat.dmi'
		icon_state = "Skill"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			ran = "D"
		Crank
			ran = "C"
		Brank
			ran = "B"
		Arank
			ran = "A"
		Srank
			ran = "S" */

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Nara
		icon = 'SkillCard.dmi'
		icon_state = "Nara"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			ran = "D"
			ShadowImitationShuriken
				name = "Shadow Imitation Shuriken"
				description = "By infusing the blades with his own chakra beforehand, they are given the effect of his shadow techniques. By using these weapons to pierce the enemies' shadows, they are paralysed in place."
				dran = 200

		Crank
			ran = "C"
			ShadowImitate
				name = "Shadow Imitation Technique"
				description = "The user extends their shadow on any surface (even water) and as far as they want as long as there is a sufficient area. Once it comes into contact with a target's shadow, the two merge and the target is forced to imitate the user's movements. Therefore, the two can throw shuriken at each other at the same time if the user desires that (of course, to prevent hurting themselves, the user just has to have the shuriken holster in a place where you don't normally have it, like the back, so that the opponent draws nothing when the user draws a shuriken). If the target is out of range, the user can produce a better light source to increase their shadow's size or rely on pre-existing shadows for their shadow to freely travel through. It's also possible to split one's shadow, either to trap more opponents at once, or to create a distraction."
				dran = 300


		Brank
			ran = "B"
			ShadowStitching
				name = "Shadow Sewing Technique"
				description = "This is a ninjutsu from among the Nara clan's secret techniques that uses materialised shadows to attack and bind, instead of merely immobilising and controlling like the Shadow Imitation Technique. The user changes the shape of their shadow into several sharp needles and controls each separately. They can then attack several targets simultaneously and at the same time snatch away their ability to move by sewing them stuck with the shadow threads. Because it is a physical attack, it is impossible to capture someone without harming them, but on the other hand, since the speed of invocation and the time of duration are excellent, it can be used when urgent restraint is required."
				dran = 600
			ShadowBind
				name = "Shadow Imitation Shadow Bind Technique"
				description = "The user attaches their shadow to a target without restricting the target's movements. When the target's shadow comes into contact with a third party's, the user's shadow attaches to theirs instead, allowing them to be bound with the Shadow Imitation Technique."
				dran = 575
			ShadowNeckBind
				name = "Shadow-Neck Binding Technique"
				description = "It is possible to attack body parts like fingers and such by turning the shadow slender and to bind the opponent's body in order to restrain them. It was given its name because, above all else, strangulation is the most efficient method. The smaller the distance to the target, the greater the power of the shadow. This technique cannot be used for an extended period of time, as it weakens with each passing minute."
				dran = 750
			BlackSpiderLily
				name = "Black Spider Lily"
				description = "After trapping the target with the Shadow Sewing Technique, the user can then manipulate the shadow to bring them closer to themselves. This technique can be used to draw multiple enemies in."
				dran = 800
			ShadowGathering
				name = "Shadow Gathering Technique"
				description = "This is a ninjutsu using materialised shadows, but compared to the Shadow Sewing Technique from the same line, this technique places emphasis on the minute control of the shadow's movements. It is accurate enough to even make the tentacles go through tiny holes. Basically, this technique takes the user's own shadow and transforms and stretches it into countless thin tentacles, which are then used to grab objects and pull them in. Also, one can skilfully make use of the tentacle-shaped shadow tendrils by using them to lift up and throw weapons like kunai and such. This technique has many possible applications and uses. There are no hand seals used for this technique, but the hand movements resemble that of Sand Binding Coffin."
				dran = 650


		Arank
			ran = "A"
			ShadowClutch
				name = "Shadow Clutch"
				description = "The user materialises their shadow and increases its power, becoming like steel. The user then captures the target's shadow and forcibly moves them about. The techniques strength is proportionate to the chakra put into it, with enough strengh even giants can be moved. When used together with the Akimichi's Human Bullet Tank, it turns it into a weapon. This simple application makes it useful in a number of emergency situations. Unlike with the Shadow Imitation Technique, though the two shadows are connected, the target is not forced to copy the user's movements, allowing them to retain their own range of motion."
				dran = 1200
			ShadowGathering
				name = "Shadow Gathering Technique"
				description = "This is a ninjutsu using materialised shadows, but compared to the Shadow Sewing Technique from the same line, this technique places emphasis on the minute control of the shadow's movements. It is accurate enough to even make the tentacles go through tiny holes. Basically, this technique takes the user's own shadow and transforms and stretches it into countless thin tentacles, which are then used to grab objects and pull them in. Also, one can skilfully make use of the tentacle-shaped shadow tendrils by using them to lift up and throw weapons like kunai and such. This technique has many possible applications and uses. There are no hand seals used for this technique, but the hand movements resemble that of Sand Manipulators."
				dran = 1150
		Srank
			ran = "S"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Yuki
		icon = 'Yuki1.dmi'
		icon_state = "Mirror"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			ran = "D"
		Crank
			ran = "C"
		Brank
			ran = "B"
		Arank
			ran = "A"
		Srank
			ran = "S"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/*	Toyotomi
		icon = 'SkillCard.dmi'
		icon_state = "Toyotomi"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Erank
			ran = "E"
			dran = 50
			idran = "Stamina"
			jut = "Taijutsu"
			SandThrow
				name = "Sand Throw!"
				description = "The user swings their spear, sliding it across the ground kicking up dust and sand which lowers the visibility of their target for a moment. This is a basic technique but when used correctly can lead to a devestating blow."
				dran = 10
			Vault
				name = "Vault!"
				description = "The user sticks their Spear down into the ground. They then push off of it and use it as a pole vault to launch themselves upwards. A skilled user of this jutsu may bring the spear down in a follow-up attack."
				dran = 10
		Drank
			ran = "D"
			Thrust
				name = "Thrust!"
				description = "The user thrusts their spear outwards three times quickly. Each thrust slightly faster than the last. As the user's experience with this increases, the speed of the thrusts leads to them being hard to follow."
				dran = 150
				jut = "Taijutsu"
				idran = "Stamina"
			Throw
				name = "Throw!"
				description = "The user focuses their chakra into their spear. They then throw it towards their opponent. If the strike misses, they are able to draw the spear back due to their spear being attached to the Toyotomi Chain."
				dran = 150
				jut = "Taijutsu"
				idran = "Stamina"
			Arc
				name = "Arc!"
				description = "The user's chakra flows through their Toyotomi Chain and down into the head of the Spear. With every strike, the spearhead leaves a cutting streak of chakra behind in the air where it struck."
				dran = 200

		Crank
			ran = "C"
			HiddenStrike
				name = "Hidden Strike!"
				description = "The user's spear is thrust into the ground where the chain extends to allow it to travel. At the user's discretion, the spear shoots out from the ground to impale the target. While using this, the user is unable to act."
				dran = 175
				jut = "Taijutsu"
				idran = "Stamina"
			SacredMist
				name = "Sacred Mist!"
				description = "This is the Toyotomi clan's version of the Kirigakure no Jutsu. They release a mist made of pure chakra into the air which thickens and lowers visibility to nothing. The use of this technique is the same as Kirigakure no Jutsu minus the need of the Water Element."
				dran = 250
		Brank
			ran = "B"
			BladeDance
				name = "Blade Dance!"
				description = "The user performs a rapid dance which involves hard to follow movements, feints, and nigh-unavoidable strikes. The spear is imbued with chakra during this technique and each strikes leaves an arc of chakra."
				dran = 475

		Arank
			ran = "A"
			SummoningBladeWorks
				name = "Toyotomi Clan Secret Technique: Summoning Bladeworks!"
				description = "The user spins their spear before stabbing it into the ground, releasing a massive amount of chakra. A small forest of blades shoots up from the ground all around the battlefield, ranging in height from equal to the user to double their height. These blades are extremely sharp and even one touch is enough to deeply lacerate someone. When mastered, the user is able to enter the surface of the blade like a Yuki with their mirrors."
				dran = 900

		Srank
			ran = "S"
			ChainBreak
				name = "Toyotomi Clan Secret Forbidden Technique: Final Gambit: Chain Break!"
				description = "This is the Toyotomi Clan's last ditch technique. Their Toyotomi Chain snaps in two, causing nearly all of their chakra to drain out. Their spear then shatters into thousands of pieces and floats around them like a cloud. They are able to control this swarm of razor-sharp blades as if it were an extension of themselves. After using this technique, the user's right arm becomes cripppled and they need immediate medical attention or have a high chance of death."
				dran = 1200




//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	Denjiba
		icon = 'SkillCard.dmi'
		icon_state = "Denjiba"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Elementless"
		Drank
			ran = "D"
			ElectroNudge
				name="Electro Nudge!"
				description = "The user sends a simple electromagnetic impulse to a person within their field. It can either be used to distract them or call their attention."
				dran = 150
			Swish
				name="Swish!"
				description = "The user changes the flux around the hand of an opponent near them causing them to have a hard time holding in steady. If their opponent's skill rank is equal to or greater then theirs. They are able to easily overpower this."
				dran = 175
		Crank
			ran = "C"
			MagnaSwitch
				name="Magna Switch!"
				description = "The user causes an object flying through their field to change direction by activating the field surrounding the object.It changes the flux around the object changing the amount of force acted upon it, moving in the direction of the weaker vector acting upon it. This technique requires the user to act quickly and at most the object can be moved thirty-five degrees to the left, right, up, or down."
				dran = 275
			TheBuzzer
				name="The Buzzer!"
				description = "This technique is similar to Jibashi. But instead of shooting out rock splitting Lighting streams. The user simply electrically charges their hands. This can be used either as a defibrillator or as a heart stopper. The user -has- to make direct contact with the heart or it will simply cause a burn."
				dran = 300
		Brank
			ran = "B"
			DragnDrop
				name = "Drag and Drop!"
				description = "The user sends an electric pulse into a target within their field, it causes them to lose control of their muscles for a few moments. Just long enough to stop their forward movement in the case of a pursuer or their upwards/sidewards movement in the case of a shunshin or Kawarimi user. If the user is wet, then they are shocked, causing them to lose control of their muscles."
				dran = 554



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Houseki
		icon = 'SkillCard.dmi'
		icon_state = "Gem"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Gem"
		Erank
			ran = "E"
			WepnSumn
				name = "Weapon Summon!"
				description = "The user draws up to two copies of their weapon from their gym. If it is a two handed weapon, they can only make one copy."
				skil = "Mastered"
				Click()
					viewers(16) << "<font color=[usr.SayFont]>[usr] Just used a Jutsu <center>1<hr><br>[src.name](<font color=white>[jut]</font>) <hr><br> [src.description]<hr><br>Chakra Drain: 175 / Skill Rank: [src.skil] / Jutsu Rank: [src.ran] / Element: [src.ele]"
					usr.SkillUp()
					usr.contents += new/obj/items/Weapon/Gem_Weapon

		Drank
			ran = "D"
			ShpeShft
				name = "Shapeshift!"
				description = "The user draws power through their gem and in doing so change their physical form to match a human or animal which they have seen previously. The larger the size difference the more chakra used."
				dran = 300
			PadPort
				name = "Pad Teleport!"
				description = "The user releases a small amount of energy into the teleport pad while thinking of the pad they'd like to move to."
				dran = 450
				skil = "Mastered"
		Crank
			ran = "C"
			GymReclu
				name = "Gem Reclusion!"
				description = "When the user is killed, and their gem isn't destroyed in the process, their physical form disappears and they enter their gem to regenerate. This takes two ooc days."
				skil = "Mastered"
				dran = 275
		Brank
			ran = "B"
			DuoGemFuse
				name = "Houseki Clan Secret Technique: Duo Gem Fusion!"
				description = "Two memebers of the Houseki Clan perform a signature duo dance and fuse into each other. Their overall height doubles and all of their stats do as well aside from speed which lowers slightly. Upon defeat/slaying they split instead of dying."
				dran = 1000
		Arank
			ran = "A"
			TrioGemFuse
				name = "Houseki Clan Secret Technique: Trio Gem Fusion!"
				description = "Three memebers of the Houseki Clan perform a signature trio dance and fuse into each other. Their overall height triples and all of their stats do as well aside from speed which lowers slightly. Upon defeat/slaying they split instead of dying."
				dran = 1500
		Srank
			ran = "S"
			GroupGemFuse
				name = "Houseki Clan Secret Technique: Group Gem Fusion!"
				description = "Four memebers of the Houseki Clan perform a signature group dance and fuse into each other. Their overall height quadruples and all of their stats do as well aside from speed which lowers slightly. Upon defeat/slaying they split instead of dying."
				dran = 2000

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Hero
		icon = 'SkillCard.dmi'
		icon_state = "Hero"
		skil = "New"
		jut = "Ninjutsu"
		idran = "Chakra"
		ele = "Hero"
		Crank
			HeroStrike
				name="Hero Release: Strike!"
				description = "The user draws their Hero Release chakra to their fists before striking.  The strike shocks, burns, and cuts the target.  Used in conjunction with chakra enhanced strength, the technqiue's power increases proportionately."
				dran = 255
				ran = "C"
			HeroMist
				name="Hero Release: Mist!"
				description = "The user draws their Hero Release Chakra into their lungs before releasing it. It creates a mist similar to Kirigakure no Jutsu. Anyone in the mist, that doesn't have Hero Chakra, is constantly burned and shocked, progressively becoming worse until lethality after five rounds. Unconsciousness after four. Inability to fight effectively after three."
				dran = 275
				ran = "C"
			HeroSummon
				name="Hero Release: Summon!"
				description = "The user, activating a secret seal, summons their Sidekick to fight alongside them in combat. This is only a one way technique, meaning the Sidekick cannot summon the Hero."
				dran = 350
				ran = "C"
			HeroZap
				name="Hero Release: Zap!"
				description = "The user, drawing on their Hero Chakra's electric aspects, electrifies their hands making their grapples stun their opponent and numb their limbs."
				dran = 265
				ran = "C"
			HeroSteam
				name="Hero Release: Steam!"
				description = "The user releases a compressed stream of hero chakra from their mouth.  The energy released burns, shocks, and cuts at the target whle having a knockback effect.  Similar to Suiton: Raging Waves."
				dran = 200
				ran = "C"
			HeroMask
				name="Hero Release: Mask!"
				description = "The user releases their hero chakra into their body. This increases their sight by 1 tier and gives them very low level sensing in the immediate area. This technique manifests as a colorful mask that covers just their eyes and nose."
				dran = 175
				ran = "C"
		Brank

			HeroDevastation
				name="Hero Release: Devestation!"
				description = "The user creates an orb of Hero Release chakra in their hands which they can fire at an enemy. These orbs explode upon contact in a firey blast with a lightning aura coursing through the air, capable of stunning the target along with burning them."
				dran = 400
				ran = "B"
			HeroCape
				name="Hero Release: Cape!"
				description = "The user distributes their Hero release chakra throughout their body for a boost in physical prowess Contact with the Ouendan during this jutsu will result in a burning, shocking, and cutting sensation similar to the Strike technique, albeit the results are drastically lowered. This sudden release of chakra produces an interesting asthetic in which a cape appears at their back as if they were a literal superhero, accompanied by lighter hair sheen and iris coloration."
				dran = 400
				ran = "B"
		Arank

			HeroChaos
				name="Ouendan Secret Technique: Hero Release: Chaos Disrupter!"
				description = "The user draws upon a great deal of Hero Chakra. They focus it in their palms before firing the energy in a powerful beam at their target. This beam moves quickly and has the power to pierce and knockback targets."
				dran = 1750
				ran = "A"
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Dark
		icon = 'SkillCard.dmi'
		icon_state = "dark"
		ele = "Dark"
		Drank
			ran = "D"
			DarkGenCancel
				name = "Dark Release: Genjutsu Cancel"
				description = "The user causes their chakra network to automatically disrup its flow periodically. During these disruptions their jutsu often fail or waver. After mastering this technique, the wavers and failures stop occuring."
				dran =  150
				jut = "Genjutsu"
		Crank
			ran = "C"
			DarkWhip
				name = "Dark Release: Whip of Judgement"
				description = "The user creates a small orb of Dark Release chakra which then extends into a whip.  Anyone that the whip strikes, as well as taking physical damage, has a portion of chakra drained from them."
				dran = 475
				jut = "Ninjutsu"
			DarkShunshin
				name = "Dark Release: Shunshin"
				description = "The user performs the shunshin technique.  In doing so, instead of a burst of smoke, a burst of Dark Release chakra appears, this chakra is capable of draining a target slightly."
				dran = 150
				jut = "Ninjutsu"
		Brank
			ran = "B"
			DarknessShield
				name = "Dark Release: Darkness Shield"
				description = "The user releases a small orb of Dark Release chakra from their hand. This chakra quickly spins outwards and forms into a flat magatama which acts as a shield against incoming attacks. It drains the chakra from ninjutsu which come into contact with it, lowering the power of said techniques."
				dran = 800
				jut = "Ninjutsu"
			HellzoneGrenade
				name = "Hellzone Grenade"
				description = "The user creates an orb of dark release chakra in their hand.  They then throw the grenade at or near a target.  It explodes into a 3 x 3 dome which quickly begins to drain the chakra from anyone caught within it before dissipating.  The dome last for a turn + 1 for every tier of Mastery.  At Expert it becomes a 5x5; At Veteran, a 7x7; Mastered, 10x10"
				dran = 650
				jut = "Ninjutsu"


		Arank
			ran = "A"
		Srank
			ran = "S"
*/






//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Fuuton
		icon = 'SkillCard.dmi'
		icon_state="Fuuton"
		Drank
			Wind_Style_Divine_Wind// - D-Rank 350 <br>
				name="Divine Wind"
				description = "The user releases a gust of wind that forms several small tornadoes. Combined with Fire Release: Running Fire that forms a circle on ground level, this creates a massive flaming hurricane."
				dran = 250
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "D"
				ele = "Wind"
		Crank
			Wind_Style_Great_Breakthrough// - C-Rank 475 <br>
				name="Wind Style: Great Breakthrough"
				description = "This is a relatively simple technique that creates a sudden gust of wind, but its scale varies greatly depending on the user. If used by a superior shinobi, it has enough destructive power to knock down a large tree. The wind from the squall can blow away all things in the user's line of sight. A variation of the technique involves a smaller blast of wind which gets ignited with flame."
				dran = 450
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Wind"
			Wind_Scythe_Jutsu// - C-Rank(Giant Folding Fan Required) 450 <br>
				name="Sickle Weasel Technique"
				description = "This bold move is Temari's speciality. By freely manipulating the gale brought forth by her Giant Folding Fan, the many air currents collide and create vacuum pockets. The person enveloped by this gale is assaulted by countless invisible blades, carving up their body. Also, the strong wind power will blow away all incoming projectile weapons and will even make the opponent unable to stay on their feet."
				dran = 250
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Wind"
			Wind_Style_Air_Bullet// - C-Rank 400 <br>
				name="Wind Style: Air Bullet"
				description = "This technique shoots multiple bullets of air at the victim with intense speed. The bullets also have great power, enough to subdue a whole group of shinobi."
				dran = 250
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Wind"
			Wind_Style_Gale_Palm// - C-Rank 400 <br>
				name = "Wind Style: Gale Palm"
				description = "A simple technique that when the users hands are clapped together, wind is compressed and transformed into a powerful gale. This technique, when used as an isolated attack has the power to easily knock over a human. Though the true value comes from using it together with projectile weapons like shuriken or kunai. Their speed, power, and ability to wound or even kill are all increased several times."
				dran = 300
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Wind"
			Wind_Clone
				name = "Wind Clone"
				description = "This technique allows the user to make a clone infused with wind. Because it is a elemental clone, it is able to perform techniques and interact with the environment due to it having physical substance; and also evenly distributes the user's chakra to each clone. If the clone is injured, it will revert to its natural win-state, at the same time pushing whatever it is touching. This clone is at 1/4 power for all stats of it’s creator, except when using fire ninjutsu which allows them to be at full Control stat.<br><br>(Max Clones Permitted: Control Stat)<br>(Must use the jutsu the jutsu for as many clones created. I.e. 4 clones = 4 uses)<br>(All jutsu used by the clones drains the user as well)"
				dran = 350
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "C"
				ele = "Wind"
		Brank
			Wind_Style_Jade_Hurricane// - B-Rank 650 <br>
				name="Wind Style: Jade Hurricane"
				description = "By using wind-based chakra, the user can infuse their bladed weapons with it from a distance and manipulate them. "
				dran = 750
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Wind"
			Cyclone_Scythe_Jutsu// - B-Rank(Giant Folding Fan Required) 750 <br>
				name="Great Sickle Weasel Technique"
				description = "This technique is a more powerful version of the Sickle Weasel Technique: many air currents collide to create vacuum pockets that slashes the opponents, with enough power to slice down many trees in a forest. This technique can deflect both physical and sound wave attacks and attack at the same time, making it both an offensive and defensive technique."
				dran = 800
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Wind"
			Wind_Style_Wind_Blade_Jutsu// - B-Rank 699 <br>
				name="Wind Style: Blade of Wind"
				description = "Using their chakra or a tool such as a war fan to manipulate or else create an external source of wind, the user can create a single, or several blades of wind which are capable of slicing through their target with ease.."
				dran = 800
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Wind"
			Wind_Release_Vacuum_Sphere
				name = "Wind Release: Vacuum Sphere"
				description = "The user takes a deep breath and then exhales several small blasts of wind chakra in such a manner that they are dispersed over an expansive range, enough to make it difficult to avoid them entirely without taking any damage. Due to the properties of this technique, the expelled blasts are capable of piercing into and potentially through an opponent's flesh when they collide, in a similar manner to how bullets function."
				dran = 850
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "B"
				ele = "Wind"
		Arank
			Wind_Sword_Jutsu// - A-Rank 1200 <br>
				name="Wind Style: Blade of Wind"
				description = "This technique is a pinpoint slashing strike, where the user emits chakra from their fingertips and materialises it into an near invisible weapon that assaults the enemy in a gust of wind. If the Sickle Weasel Technique can be regarded as a swarm of wind kunai, then this technique is akin to an unavoidable longsword which can leave the target's body mutilated. The wind blades can be created and thrown, like projectiles, in rapid succession."
				dran = 1100
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Wind"
			Wind_Style_Vacuum_Serial_Waves// - B-Rank 650 <br>
				name="Wind Style: Vacuum Serial Waves"
				description = "The user takes a deep breath and exhales several blades of wind at different angles, by rapidly moving their head in various directions. The power of this technique can be dramatically enhanced when utilised in conjunction with the effects of extreme suction, such as that generated by Baku, where the augmented attack proved effective enough to even slice through the Defenses of a complete Susanoo."
				dran = 800
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Wind"
			Wind_Style_Vacuum_Wave// - A-Rank 900 <br>
				name="Wind Style: Vacuum Wave"
				description = "The user takes a deep breath and spins while exhaling, compressing the released air into a solitary blade of wind that covers a substantial area around the user, due to their circular motion. The resulting sharpened blast is large enough to slice through multiple targets located a significant distance from the user, causing grievous injuries to those hit."
				dran = 1000
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Wind"
			Wind_Style_Shadow_Clone
				name = "Wind Style: Shadow Clone"
				description = "This technique allows the user to make a shadow clone infused with wind. Because it is a shadow clone, it is able to perform techniques and interact with the environment due to it having physical substance; and also evenly distributes the user's chakra to each clone. If the clone is injured, it will revert to its natural wind-state, at the same time pushing whatever it is touching. This clone is at half power for all stats of it’s creator, except when using water ninjutsu which allows them to be at full Control stat.<br><br>(Max Clones Permitted: Control Stat)<br>(Must use the jutsu the jutsu for as many clones created. I.e. 4 clones = 4 uses)<br>(All jutsu used by the clones drains the user as well)"
				dran = 800
				skil = "New"
				jut = "Ninjutsu"
				idran = "Chakra"
				ran = "A"
				ele = "Wind"
		Srank

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//	Medical
//		Drank
//			Prepared Needle Shot - C-Rank  450<br>
//			Ninja Art: Poison Fog - B-Rank 650 <br>
//			Chakra Scalpel - B-Rank 650 <br>
//			Poison Extraction Jutsu - B-Rank 600 <br>
//			Dead Soul Jutsu - B-Rank 799 <br>
//			Healing Jutsu - A-Rank 1000 <br>
//			Pre-Healing Jutsu - A-Rank<br>
//			Regenerative Healing Jutsu - A-Rank 1300

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//	Elementless
//		Drank
//			Shadow Clone Jutsu - A-Rank 1400 <br>
//			Clone Jutsu - E-Rank <i>Starter</i> <br>
//			Substitution Jutsu - E-Rank <i>Starter</i> <br>
//			Transformation Jutsu - E-Rank <i>Starter</i> <br>
//			Body Flicker-D-Rank 150 <br>
//			Manipulated Shuriken Technique - D-Rank 250 <br>
//			Shadow Shuriken Jutsu - D-Rank 300 <br>
//			Crystal Ball Jutsu - (Kage Exclusive) <i>Starter</i> <br>
//			Kagura: The Mind's Eye - C-rank(Sensory Only) 450 <br>
//			Shadow Clone Explosion - A-Rank(Shadow Clone Mastery Required) 1350 <br>
//			Rasengan - A-rank 1450 <br>

