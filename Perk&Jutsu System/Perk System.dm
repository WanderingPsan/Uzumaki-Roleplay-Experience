obj/Perk
	Click()
		if(src in usr.contents)
			viewers(16) << output("<font color=grey>[usr] just activated [src.name]: <font color=purple>[src.description] A Tier [src.tier] perk.","World.OOC")


	var
		tier2descrip = ""
		tier3descrip = ""
		tier4descrip = ""
		masterdescrip = ""
		tier5descrip = ""
		tier2name = ""
		tier3name = ""
		tier4name = ""
		tier5name = ""
		mastername = ""
		tier2state = ""
		tier3state = ""
		tier4state = ""
		tier5state = ""
		canttier2 = 0
		canttier3 = 0
		canttier4 = 0
		canttier5 = 0
		cantmaster = 0
		RPPSpent = 0

	Blank_Perk
		icon = 'perks.dmi'
		icon_state = "agi"
		description = ""
		Click()
			if(src in usr.contents)
				viewers(16) << output("<font color=grey>[usr] just activated [src.name]: <font color=purple>[src.description] A Tier [src.tier] perk.","World.OOC")







obj/var
	description = ""
	use = ""
	skil= ""
	jut=""
	tier=""
	ran=""
	dran=0
	idran

mob/var
	AHon = 0
/*
	1_Tier_Perks
		icon = 'perks.dmi'
		icon_state = "perk"
		description = ""
		tier = 1

	Perk_Name
		icon = 'perks.dmi'
		icon_state = ""
		description = ""
		tier2descrip = ""
		tier2name = ""
		tier3descrip = ""
		tier3name = ""
		tier4descrip = ""
		tier4name = ""
		masterdescrip = ""
		mastername = ""
		tier2state = ""
		tier3state = ""
		tier4state = ""
		tier = 1

	Six_Tier_Perk
		icon = 'perks.dmi'
		icon_state = ""
		description = ""
		tier2descrip = ""
		tier2name = ""
		tier3descrip = ""
		tier3name = ""
		tier4descrip = ""
		tier4name = ""
		tier5descrip = ""
		tier5name = ""
		masterdescrip = ""
		mastername = ""
		tier2state = ""
		tier3state = ""
		tier4state = ""
		tier5state = ""
		tier = 1
		cantier5 = 1
*/








obj/Perk
	NinjutsuDefense
		icon = 'perks.dmi'
		icon_state = "str1"
		description = "This character has a low level of resistance to Ninjutsu and can avoid instantaneous death from one assuming it doesn't majorly overpower them."
		tier2descrip = "This character has an average resistance to Ninjutsu and can avoid death instantenous from most techniques. They also have a slightly higher threshold in reference to chakra absorption techniques."
		tier2name = "Novice Ninjutsu Defense"
		tier3descrip = "This character has a high resistance to ninjutsu. Chakra Absorption techniques have a hard time damaging as well. They are highly resistant to most techniques which require chakra control."
		tier3name = "Veteran Ninjutsu Defense"
		tier4descrip = "This character has an extreme level of resistance to Ninjutsu. They're able to laugh at most, if not all, levels of Ninjutsu. They're the time to eat Ninjutsu for dinner and ask for seconds."
		tier4name = "Master Ninjutsu Defense"
		tier2state = "str2"
		tier3state = "str3"
		tier4state = "str4"
		tier = 1
		canttier5 = 1
		cantmaster =1
		giDef = 1


	Strength
		icon = 'perks.dmi'
		icon_state = "str1"
		description = "This character has a higher than average level of power. They are able to deal heavy blows with much more ease than a character of the same level without strength."
		tier2descrip = "This Character has a great deal of body power. Their physical power is more than just impressive. Their strikes are capable of rattling bones, and an unguarded strike can break bones. This character has enough strength to take on medium sized beasts such as those who are summoned via contract on equal grounds."
		tier2name = "Enhanced Strength"
		tier3descrip = "This person's level of strength is nigh on unbelievable. They are able to induce a great bit of knockback with each and every blow, causing their enemies to be thrown off balance with their strikes."
		tier3name = "Super Strength"
		tier4descrip = "This Character's strength is immeasurable. Their power is downright horrifying, and they're capable of contending with even the most fearsome opponents. Large creatures lack the power to actually bring this person to their knees in a fair contest of strength. The Earth breaks with their strikes. The character's power output rivals Oukashou, but nowhere near as explosive."
		tier4name = "Monstrous Strength"
		masterdescrip = "This character's strength is literally too immense for their own good. They are able to kill any opponent that doesn't have Master Body in one hit. This character is beyond the strength of any shinobi alive now  or that ever was....They are on par with God."
		mastername = "Master Strength"
		tier2state = "str2"
		tier3state = "str3"
		tier4state = "str4"
		tier = 1
		canttier5 = 1

	Chakra_Enhanced_Strength
		icon = 'perks.dmi'
		icon_state = "ces1"
		description = "This character's skill with chakra enhanced strength is paltry at best. Their release time is sloppy and as such they are unable to manage more than 2x strength output on attacks."
		tier2descrip = "This character's skill with chakra enhanced strength has increased. They are now able to triple their strength output upon attacking and in doing so are capable of breaking bones easily with an unguarded strike."
		tier2name = "Chakra Enhanced Strength 2"
		tier3descrip = "This character has an great overall understanding with the Chakra Enhanced Strength technique. They are able to easily shatter the earth with their strength, on par with Cherry Blossom Clash. They are also capable of killing an opponent with a simple unguarded strike."
		tier3name = "Chakra Enhanced Strength 3"
		tier4descrip = "This character's skill with the technique is masterful. They can change the terrain of a battle with ease using their powerful strikes. They are able to dish out 10x their normal max power with a single blow. They are a force to be reckoned with."
		tier4name = "Chakra Enhanced Strength 4"
		tier2state = "ces2"
		tier3state = "ces3"
		tier4state = "ces4"
		tier = 1
		canttier5 = 1
		cantmaster = 1
	Attack_Speed
		icon = 'perks.dmi'
		icon_state = "str1"
		description = "This Character is able to attack quickly, not only changing the direction of their attacks but pulling punches as needed."
		tier2descrip = "This character's ability to attack quickly makes their attacks even harder to follow. They are able to change the direction of their attacks and even change which appendage they are attacking with."
		tier2name = "Attack Speed 2"
		tier3descrip = "This character's attacks are hard to follow to the untrained eye and even harder to avoid without at least second tier reflexes.."
		tier3name = "Attack Speed 3"
		tier4descrip = "This character's attacks are little more than blurs. They can be followed by those with sharingan or tier 3 sight perks. Only those with tier 3 reflexes can hope to avoid them."
		tier4name = "Attack Speed 4"
		masterdescrip = "This character's attacks are almost instantaneous. Its viable that you won't even see them coming. It would require a technique to increase perception and high reflexes to avoid this person's attacks.."
		mastername = "Master Attack Speed"
		tier2state = "str2"
		tier3state = "str3"
		tier4state = "str4"
		tier = 1
		canttier5 = 1
	Chakra_Control
		icon = 'perks.dmi'
		icon_state = "mind"
		description = "This user's chakra control is subpar at best. They overuse their chakra when using a technique at their skill level or higher. Their Ninjutsu prowess is immature at best."
		tier2descrip = "This user's chakra control is on par with their skill rank. They are able to use jutsu at their skill level and below without wasting chakra, but anything above that is overly draining."
		tier2name = "Chakra Control Novice"
		tier3descrip = "This user is capable of using techniques up to a single skill rank higher than themselves without overly draining themselves. Though they still have trouble with anything higher."
		tier3name = "Chakra Control Adept"
		tier4descrip = "This character is able to use techniques of any rank without risking overly draining themselves. Their skill with chakra control is masterful."
		tier4name = "Chakra Control Veteran"
		masterdescrip = "This character has the greatest level of chakra control. They are able to use any jutsu without handseals and also has the ability to create new jutsu on the fly as long as they have a technique to base it upon."
		mastername = "Chakra Control Master"
		tier2state = "mind"
		tier3state = "mind"
		tier4state = "mind"
		tier = 1
		canttier5 = 1
	Hand_Seal_Speed
		icon = 'perks.dmi'
		icon_state = "hand"
		description = "This character can complete up to ten handseals in a single round."
		tier2descrip = "This character can complete up to sixteen handseals in a single round."
		tier2name = "Hand Seal Speed 2"
		tier3descrip = "This character can complete up to twenty handseals in a single round."
		tier3name = "Hand Seal Speed 3"
		tier4descrip = "This character can complete up to thirty handseals in a single round."
		tier4name = "Hand Seal Speed 4"
		tier5descrip = "This character is capable of completing strings of handseals within a few seconds so long as it doesn't extend beyond ten handseals. Anything more can completed in half a minute."
		tier5name = "Lightning Seals"
		masterdescrip = "This character is capable of performing 120 handseals in the span of a minute. They can perform skills that use 5 or less seals without performing the seals."
		mastername = "Master Seals"
		tier2state = "hand"
		tier3state = "hand"
		tier4state = "hand"
		tier5state = "hand"
		tier = 1
	Fledgeling_Manipulator
		icon = 'perks.dmi'
		icon_state = "elem"
		description = "This character has a poor level of ability in manipulating a single material, they are only able to manipulate an amount equal to half the size of their body."
		tier2descrip = "This character has a low level of ability in manipulating a single material, they are able to manipulate an amount equal to the size of their body size."
		tier2name = "Novice Manipulator"
		tier3descrip = "This character is capable of mid level manipulation. They are able to manipulate an amount of their material equal to triple the size of their body. "
		tier3name = "Expert Manipulator"
		tier4descrip = "This character is capable of high level manipulation. They are capable of manipulating a massive amount of their material which scales with thier control."
		tier4name = "Master Manipulator"
		tier2state = "elem"
		tier3state = "elem"
		tier4state = "elem"
		tier5state = "elem"
		tier = 1
		cantmaster = 1

	Reflex
		icon = 'perks.dmi'
		icon_state = "rfx1"
		description = "This character has enhanced reflexes, and are capable of reacting quickly enough to dodge close range strikes consecutively. They can also dodge projectiles consecutively from long range without having to stay on the move."
		tier2descrip = "This character's reflexes are even more impressive than that of a character with the reflex perk. They are capable of dodging projectiles at medium range, and are capable of trading blows and blocking effectively with fast characters."
		tier2name = "Heightened Reflex"
		tier3descrip = "This character's reaction speed is impeccable. They can contend with a gate user within the first four gates and dodge a number of their strikes. They can dodge large projectiles at close range, though they are incapable of dodging consecutive weapons; and fighting a gate user of the fifth gate forces them to block a number of strikes, as dodging becomes harder consecutively."
		tier3name = "Lightning Reflex"
		tier4descrip = "This character has impressive reflexes slightly better than lightning reflexes. They are capable of fighting on par with a character in the sixth gate when it comes to trading blows and blocking strikes, and they can dodge blows from a fifth gate user so long as they aren't consecutive blows. A character with lock-on jammer can completely elude their opponent when they dodge, forcing their opponent to have to relocate them before attacking again."
		tier4name = "Lock-on Jammer"
		masterdescrip = "This character is literally...The hardest thing to hit. In order to hit them you would need to be a Master Marksman or have a Master Sensing skill. They are able to react so quickly they are able to rival the Sharingan."
		mastername = "Master Reflex"
		tier2state = "rfx2"
		tier3state = "rfx3"
		tier4state = "rfx4"
		tier = 1
		canttier5 = 1

	Speed
		icon = 'perks.dmi'
		icon_state = "spd1"
		description = "This character's speed is amazing. They can move like the wind, and breeze by the competition with ease."
		tier2descrip = "This character's speed is beyond amazing. They are able to outrun some of the quickest shinobi, though, they suffer from tunnel vision at high speeds."
		tier2name = "Enhanced Speed"
		tier3descrip = "This character's speed is a few steps above Enhanced Speed. Almost as fast as Orochimaru in the FoD against Sasuke and Naruto."
		tier3name = "Super Speed"
		tier4descrip = "The speed of the character with this perk is unmatched. They can move across a field in a very short amount of time, and can move twice as fast as a character with the speed perk. Though this perk doesn't match the speed of shunshin, it comes pretty close, and without disorientation. However, tunnel vision does become an issue as the speed of the character increases."
		tier4name = "Mach Speed"
		masterdescrip = "This character is fast. They are speed incarnate. Impossible to catch unless you have Master Speed yourself. This has no bearing on their handseals or ability to use jutsu of course. They are able to avoid travel wait times. They are also able to run over the surface of water if they are running at full speed."
		mastername = "Master Speed"
		tier2state = "spd2"
		tier3state = "spd3"
		tier4state = "spd4"
		tier = 1
		canttier5 = 1


	Body
		icon = 'perks.dmi'
		icon_state = "bdy1"
		description = "This character's body is fit. Their opponents have a hard time dealing damage to them. "
		tier2descrip = "This character's body is rock solid. Their muscles are strong enough to resist the stun of blows, or the after-effects of a strike.The skin of this particular character is also slightly hardened, making it impossible to cut this character's skin without actually putting effort into a strike. "
		tier2name = "Enhanced Body"
		tier3descrip = "This character's body is a work of art. They have increased their physical defense to a point that is just short of the Defense granted by Domu, though it doesn't offer up much Defense against jutsu."
		tier3name = "Super Body"
		tier4descrip = "This character has a body like no other. The average blow has minimal effect on them, and weapons have minimal effect as well. A focused blow is required to pierce their skin, lest their enemy resorts to using jutsu."
		tier4name = "Monstrous Body"
		masterdescrip = "This user is immune to physical damage dealt to them unless dealt by someone with Master Strength, or someone running at full speed with Master Speed. In these cases, they will be barely scratched."
		mastername = "Master Body"
		tier2state = "bdy2"
		tier3state = "bdy3"
		tier4state = "bdy4"
		tier = 1
		canttier5 = 1

	Stamina
		icon = 'perks.dmi'
		icon_state = "sta1"
		description = "This character has a nice deal of stamina, and can last longer in a fight. Their energy allows them to hold out in an average battle without much fatigue."
		tier2descrip = "This character has a deal more stamina than one with the stamina perk. They are able to last for quite a long time in battle without running low on steam."
		tier2name = "Enhanced Stamina"
		tier3descrip = "This character's stamina is incredible. Even whilst carrying a great deal of weight, this character can fight an average battle without rest. They can also travel long distances without stopping."
		tier3name = "Massive Stamina"
		tier4descrip = "The energy of this character is amazing. He's capable of innately opening the first two gates due to the amount of energy in his body, and he is seemingly unstoppable. His energy never seems to diminish, and can fight one thousand soldiers before tiring."
		tier4name = "Monstrous Stamina"
		masterdescrip = "This character's energy is off the charts. They can fight a marathon of fights without getting tired. They have access to the first four gates based on their pure amount of energy. They are able to use them without any drawbacks."
		mastername = "Master Stamina"
		tier2state = "sta2"
		tier3state = "sta3"
		tier4state = "sta4"
		tier = 1
		canttier5 = 1

	Adrenaline_Focus
		icon = 'perks.dmi'
		icon_state = "agi"
		description = "This character's mind is geared to focus on a single target. They subconsciously create tunnel vision for themselves, bettering their focus on their target and slightly blinding themselves to others."
		tier2descrip = "This character's mind creates strong tunnel vision, allowing them to focus on a single target even better. Their projectiles rarely move off trajectory and their aim is great when it comes to acting at their target. It is rather hard for their target to slip from their sights."
		tier2name = "Adrenaline Focus 2"
		tier3descrip = "This character's focus is downright amazing. They completely block out the world around them, focusing on their target. They rarely lose their target, and they never lose their target without some kind of item, jutsu, or distraction that interferes. Their aim is deadly, as they hone in with such focus, that their target is all they can see. Anything not in front of the character, in-between them and their target, does not exist. And therefor they are oblivious to any other dangers, however, their target is at their mercy."
		tier3name = "Adrenaline Focus 3"
		tier2state = "agi"
		tier3state = "agi"
		tier = 1
		canttier4 = 1

	Sight
		icon = 'perks.dmi'
		icon_state = "sight"
		description = "This character's sight is above average, and they can spot their enemies from a notable distance. When at medium range, as well as traps so long as they're looking for them."
		tier2descrip = "This character can spot a hidden enemy so long as they are in their field of vision, and they make a move, so long as there isn't solid cover in between the two such as a wall."
		tier2name = "Enhanced Sight"
		tier3descrip = "This character's sight is amazing. They can spot the smallest details, and pinpoint the location of their enemies from a long distance. At medium range, their opponent can not hide from them if they have seen said opponent just before he went into hiding. This character can also spot all traps in front of them without needing to search for the traps."
		tier3name = "Eagle Vision"
		tier2state = "sight"
		tier3state = "sight"
		tier = 1
		canttier4 = 1
	Innate_Sensing
		icon = 'perks.dmi'
		icon_state = "mind"
		description = "This character's sensory abilities are high, and they are capable of sensing large chakra outputs without focusing."
		tier2descrip = "This character's sensory abilities are great, they are capable of sening as a second nature. They can sense without focusing, but it is general sensing."
		tier2name = "Primal Sensing"
		tier3descrip = "This character is an amazing sensor. They can sense with no effort at all, and it comes completely natural to them. They gain full benefits of sensing as someone who is focusing is, without the need to focus."
		tier3name = "Sixth Sense"
		tier2state = "mind"
		tier3state = "mind"
		canttier4 = 1
		tier = 1
	Mind
		icon = 'perks.dmi'
		icon_state = "mind"
		description = "This character has a fortified mind that both protects them against Genjutsu, and strengthens their own genjutsu. The character with this perk caught in a low level genjutsu can always tell they're in a genjutsu. If this character is using a low level genjutsu, they can manipulate the effects of the technique so long as it keeps to the same concept."
		tier2descrip = "This character's mind is further fortified. They are capable of resisting low leveled genjutsu so long as they're aware of what the genjutsu is.Low level techniques used by this character grant further freedom by allowing them to change the property of the genjutsu's effect(Ex: Burning to shocking)."
		tier2name = "Mind 2"
		tier3descrip = "The character with this perk is capable of freely transforming low leveled genjutsu, and manipulating the effects of mid-leveled genjutsu so long as they keep to the same concept. The use is capable of boosting low level genjutsu to a mid level genjutsu."
		tier3name = "Mind 3"
		tier4descrip = "This character's mind has been fortified to the farthest extent. They are able to resist the fatiguing effects of medium level genjutsu, and even counter lower level genjutsu with a slightly stronger genjutsu. This character is able to boost the effects of mid level genjutsu to high level genjutsu."
		tier4name = "Mind 4"
		tier2state = "mind"
		tier3state = "mind"
		tier4state = "mind"
		tier = 1
		canttier5 = 1
		cantmaster = 1
	Studious_1
		icon = 'perks.dmi'
		icon_state = "study"
		description = "This character is scholar. He dedicates his life to collecting information, and has an easier time learning techniques."
		tier2descrip = "This character is scholar. He dedicates his life to collecting information, and has an easier time learning techniques."
		tier2name = "Studious 2"
		tier3descrip = "This character is scholar. He dedicates his life to collecting information, and has an easier time learning techniques."
		tier3name = "Studious 3"
		tier4descrip = "This character is scholar. He dedicates his life to collecting information, and has an easier time learning techniques."
		tier4name = "Studious 4"
		tier2state = "study"
		tier3state = "study"
		tier4state = "study"
		tier = 1
		canttier5 = 1
		cantmaster = 1
	Chakra
		icon = 'perks.dmi'
		icon_state = "cha1"
		description = "This character has large pools of chakra. Their reserves are great, and can be considered a rank above what they are. A student with the average reserves of an untrained Genin, or a Genin with the untrained reserves of a Chuunin."
		tier2descrip = "This character's chakra pools are impressive. An untrained student with massive chakra has the reserves of a fully trained Genin, and a trained student will have the reserves to rival a fresh chuunin character. Massive Chakra ups the reserve of the character to that of a trained character exactly one rank up, and if the character is trained, then it ups their reserves to two ranks up, however not trained."
		tier2name = "Massive Chakra"
		tier3descrip = "The chakra pools of this character can only be described as monstrous. They have the reserves that puts them on par with someone three ranks ahead of themselves. The chakra of a student with monstrous chakra can rival that of a trained chuunin, and at times an untrained special jounin. Characters with monstrous chakra usually have a great deal of energy in combat, and can dish out a number of jutsu before running out of gas."
		tier3name = "Monstrous Chakra"
		tier4descrip = "This character's chakra pools are so immense, that it can match that of a tailed beast once matured. An untrained student easily has the reserves to match an untrained jounin. The character with this perk's reserves appear endless, at times, and once they've hit the rank of jounin, their chakra levels easily tops that of the average kage. The chakra pool pushes the character four untrained ranks upward when they are untrained, and five untrained ranks when they are indeed trained."
		tier4name = "Tailed - Beast Chakra"
		tier2state = "cha2"
		tier3state = "cha3"
		tier4state = "cha4"
		tier = 1
		canttier5 = 1
		cantmaster = 1

	Boxer
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Fluent Boxer"
		description = "As an adept in taijutsu this individual is able to perform basic taijutsu stances and fighting styles as well as contend with them."
		tier2name = "Trained Boxer"
		tier2descrip = "As a trained fighter, this individual can perform the most difficult fighting styles, and contend with the best."
		tier3name = "Experienced Boxer"
		tier3descrip = "he boxer is a skilled hand to hand fighter. His punches are feared, and his upper body strength is amazing in combat. Each punch is considered a heavy blow and has a concussive effect (Concussive Knockback Tiles: Str/2 -if- over the opponent’s durability on damage calculation)."
		tier4name = "Boxer Master"
		tier4descrip = "This individual is truly a master of close quarters combat. Such is their striking speed that their limbs no longer blur, in fact they may appear to vanish to lesser combatants. They have reached the pinnacle of boxing (Concussive Knockback Tiles: Str/2 -if- over the opponent’s durability on damage calculation)."
		tier2state = "perk"
		tier3state = "perk"
		tier4state = "perk"
		tier = 1
		canttier5 = 1
		cantmaster = 1
		giStr = 1.0
		giTai = 1.0
		giAtkspd = 1.0
	KickBoxer
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Fluent Kickboxer"
		description = "As an adept in using their feet this individual is able to perform basic kicks and stances with a fighting style that contends with the average taijutsu fighter."
		tier2name = "Trained Kickboxer"
		tier2descrip = "As a trained kickboxer fighter, this individual can perform more difficult fighting styles, and contend with some of the best in terms of leg and foot based attacks."
		tier3name = "Experienced Kickboxer"
		tier3descrip = "The kickboxer is feared for his kicking ability. His kicks are quick, powerful, and his combinations are deadly. The kick boxer can drop an opponent with a few well placed successful kicks."
		tier4name = "Kickboxer Master"
		tier4descrip = "This individual is truly a master of mid-range combat. Such is their striking speed that their feet & lower legs no longer blur, in fact they may appear to vanish to lesser combatants. They have reached the pinnacle of kickboxing."
		tier = 1
		canttier5 = 1
		cantmaster = 1
		giStr = 1.0
		giTai = 1.0
		giAtkspd = 1.0




	Hearing
		icon = 'perks.dmi'
		icon_state = "mind"
		description = "This character's ears are tuned in to hear the movements of those nearby, even when they're not focusing. Careless movements will reveal the location of a character around one with the hearing perk."
		tier2descrip = "This character's ears are tuned in to hear the slightest movements without focus. When focusing, this character can hear another character breathing in close proximity to them."
		tier2name = "Extraordinary Hearing"
		tier2state = "mind"
		tier = 1
		canttier3 = 1

	Smell
		icon = 'perks.dmi'
		icon_state = "smell"
		description = "This character's ability to smell is beyond that of the average person. They can smell blood nearby with ease, and can tell what it is."
		tier2descrip = "This character's ability to smell is heightened. They can smell any aroma or odors within a fifteen tile radius, and even discern strange gases in the air."
		tier2name = "Enhanced Smell"
		tier3descrip = "This character's nose is amazing. They can track the scents of other characters, discern poisons in the air, and smell any odors and aroma within a thirty tile radius."
		tier3name = "Bloodhound's Nose"
		tier2state = "smell"
		tier3state = "smell3"
		tier = 1
		canttier4 = 1
	Anger
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has a great deal of anger, and it boosts their combat ability, making them both stronger and more resistant to pain. Not to say they do not feel the pain, they are able to fight against the pain due purely to their anger. So long as they have been enraged, they can fight like a man possessed."
		tier = 1
		canttier2=1
	Berserker// Tier 2 requires Anger
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Berserker is unstoppable. He is incapable of caring for his allies in battle, and fights to draw blood. His blows are almost always guaranteed to draw blood, and he fights on until he can not fight any more. He is incapable of stopping once a battle has begun, and must be put down for him to calm down."
		tier = 2
		canttier3=1
		giStamina = 500
		giDur = 2.75
		giStr = 2.75
/*	1_Tier_Perks
		icon = 'perks.dmi'
		icon_state = "perk"
		description = ""
		tier = 1
*/
	Big_Eater
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Big Eater lasts longer without food, as his stomach is large, and he's capable of holding a lot more."
		tier = 1
		canttier2=1
		giDur = 2.0

	Henge_Mastery
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "With increased use of the illusion Henge no Jutsu, this person has advanced the skill to a point they can maintain it as a passive over a greater amount of time in order to change their looks to a small degree or create complex disguises. This henge user can pass basic henge checks without the illusion breaking as well as receiving damage to their body. The only way this Henge is broken is if the user willingly releases it or they run out of chakra to maintain the skill."
		tier = 2
		canttier3 = 1
		giCon = 2

	BFSW // Requires Strength and Reflex 1
		icon = 'perks.dmi'
		icon_state = "ssm"
		description = "This character is able to weild a large sword with ease. It no longer weighs them down."
		tier2descrip = "This character is able to utilize a rather large sword as if it were a short sword."
		tier2name = "BFSW Adept"
		tier3descrip = "The BFSW Veteran can handle large weapons with ease. He doesn't tire when carrying heavy weapons, and it acts as an extension of himself. Large swords, even special ones, do not tire him unless the sword has some special property to it which weighs down on the user."
		tier3name = "BFSW Veteran"
		tier4descrip = "To this character, any sword of a Zanbatou's size and larger are child's play. They can begin to utilize multiple large swords."
		tier4name = "BFSW Master"
		tier2state = "ssm"
		tier3state = "ssm"
		tier4state = "ssm"
		tier = 1
		cantmaster = 1
		canttier5 = 1
		giStamina = 250
		giTai = 1.5
		giStr = 2.0
		giAtkspd = 0.45
		giDur = 0.7


	Midair_Combat
		icon = 'perks.dmi'
		icon_state = "shunshin"
		name = "Midair Combat"
		description = "This character is capable of changing their direction by moving over one square in mid-air one time while falling or leaping."
		tier2descrip = "This character is capable of moving three steps one time in midair while falling or leaping."
		tier2name = "Midair Combat 2"
		tier3descrip = "This character is capable of leaping 5 squares from their current position while midair up to twice."
		tier3name = "Midair Combat Master"
		tier = 1
		canttier4 = 1
		giRef = 2.30
		giSpd = 1.2

	Senju_Clan
		icon = 'perks.dmi'
		icon_state = "poi"
		name = "Senju Clan"
		description = "This character is a member of the Senju Clan."
		giStamina = 1000
		giChakra = 1000
		tier = 1
		canttier2 = 1

	Uzumaki_Clan
		icon = 'perks.dmi'
		icon_state = "shunshin"
		name = "Uzumaki Clan"
		description = "This character is a member of the Uzumaki clan."
		giChakra = 1000
		giStamina = 1000
		tier = 1
		canttier2 = 1
	Kaguya_Clan
		name = "Kaguya Clan"
		icon_state = "perk"
		icon = 'perks.dmi'
		description = "This person is a member of the Kaguya clan. Their biology is inwardly different than that of a human’s and thus when using anatomy against them, the opponent must roll a dice. The attack only lands with the desired effect if a 5-6 is rolled, otherwise it strikes a different inward body part than assumed for a human’s anatomy."
		tier = 1
		canttier2 = 1
		giDur = 3
	Hoshigaki
		name = "Hoshigaki"
		icon_state = "perk"
		icon = 'perks.dmi'
		description = "This person is a member of the Hoshigaki Species. They are capable of breathing under water, they only use one stamina round while in the water, and have +10 to speed/attack speed in the water. They are also capable of smelling blood in the water with easy."
		tier = 1
		canttier2 = 1
		giChakra = 1000
	Yuki_Clan
		name = "Yuki Clan"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This person is a member of the Yuki clan."
		tier = 1
		canttier2 = 1
		giChakra = 1000
	Sabaku_Clan
		name = "Sabaku Clan"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This person is a member of the Sabaku clan and is capable of manipulating magnetism in order to mold a sand type of their choosing."
		tier = 1
		canttier2 = 2
		giCon = 1.5
	Sarutobi_Clan
		name = "Sarutobi Clan"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is part of the Sarutobi clan. Their learning ability is so great, they are capable of comprehending techniques above their skill level. (Rather than being capable of learning 1 skill rank above the character's skill rank, they are capable of learning 2 skill ranks above their own)"
		tier = 1
		canttier2 = 1
	Aburame_Clan
		name = "Aburame Clan"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is a member of the Aburame clan, and thus is a host of very tiny beetles within their bodies that feed off chakra reserves."
		tier = 1
		canttier2 = 1
		giChakra = 500
	Yamanaka_Clan
		name = "Yamanaka Clan"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is a member of the Yamanaka clan. They commonly use strange mind bending techniques and have their own set of special handseals for their hiden techniques."
		canttier2 = 1
		tier = 1
	Kamizuru_Clan
		name = "Kamizuru Clan"
		icon = 'perks.dmi'
		icon_state = "perk"
		description	= "This character is a member of the Kamizuru clan. They are capable of summoning bee’s in large hoards in combat, and are notably rivals with the Aburame clan."
		tier = 1
		canttier2 = 1
	Inuzuka_Clan
		name = "Inuzuka Clan"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is a member of the Inuzuka clan. They are capable of communicating with ninken and have a naturally heightened sense of smell. Many of their clan members are known to wear clan markings with facial paint and are commonly named after parts of a dog."
		tier = 1
		canttier2 = 1
	Fuma_Clan
		name = "Fuuma Clan"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is a member of the Fuma clan and have the potential to access their clan’s kinjutsu. (Roll double 6’s for Curse Mandala)"
		tier = 1
		canttier2 = 1
	Akai_Clan
		name = "Akai Clan"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is a member of the Akai clan. This clan possesses the mysterious dojutsu of glowing red eyes."
		tier = 1
		canttier2 = 1
	Kedion_Clan
		name = "Kedion Clan"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is a member of the hiden Kedoin clan. They are capable of learning their clan’s hiden techniques."
		tier = 1
		canttier2 = 1




	Pharmacist
		icon = 'perks.dmi'
		icon_state = "poi"
		name = "Pharmaceutical Practitioner"
		description = "This character is decent at making medicine. Their medicine can cure minor diseases and afflictions that are common such as the Cold, Fever, Cough, or Flu. They are able to create medicines to counteract basic Poisons."
		tier2descrip = "This character is trained in the art of pharmaceutical services. They are able to identify lesser poisons and develop antidotes to nullify their effects. They can cure additional diseases with their medicine such as tuberculosis and other potentially life-threatening diseases."
		tier2name = "Pharmaceutical Specialist "
		tier3descrip = "This character is an expert when it comes to pharmacy. They can identify intermediate and mediocre poisons from examination and they are able to nullify their effects with their poison. In addition, this character can create drugs that can enhance the powers of Shinobi temporarily, as well as replenish their blood, lymphocytes, and nutrients with their medicine by grinding necessities up into a single pill."
		tier3name = "Pharmaceutical Expert"
		tier4descrip = "This character is a genius when it comes to pharmaceutical services and practices. They can identify the strongest of poisons and nullify their effects through medicine. They can also create drugs to induce temporary death as well as prolong life. Their drugs can mitigate pain or completely wipe out pain in a shinobi. They can create drugs that can enhance muscles and create drugs that can amplify chakra outputs. This is a level of pharmacy that if related to canon, only Kabuto could match."
		tier4name = "Pharmaceutical Prodigy"
		tier2state = "poi"
		tier3state = "poi"
		tier4state = "poi"
		tier = 1
		cantmaster = 1
		canttier5 = 1
		giInt = 2


	Santoryu
		icon = 'perks.dmi'
		icon_state = "poi"
		name = "Santoryu Executioner"
		description = "Santoryu is a style of sword fighting where the practitioner wields three Katana; one in each hand and one in the mouth. There are many different techniques for this sword style, including high speed attacks ('Shishi Sonson'), direct hit attacks ('Oni Giri') and compressed air projectile attacks ('Hyaku Hachi Pound Ho')"
		tier = 2
		giAtkspd = 2.75
		giSpd = 3.0


	Poison_Proficiency
		icon = 'perks.dmi'
		icon_state = "poi"
		name = "Poison Amateur"
		description = "This character is capable of creating weak poisons capable of numbing epithelial muscles. These poisons can also assume the qualities of diseases such as colds and coughs."
		tier2descrip = "This character is capable of creating mediocre poisons that are an intermediate between debilitating and annoying. These poisons are capable of numbing entire limbs with prolonged exposure as well as course itself through the body to affect several different regions instead of a singular region."
		tier2name = "Poison Specialist"
		tier3descrip = "This character is capable of creating potentially lethal poisons. These poisons can course through the entire body and antidotes are difficult to be made in regards to these poisons. Their poison can hinder skeletal muscle, the nervous system, as well as disturb the epithelial cells. The poison's effects assume that of many diseases."
		tier3name = "Poison Expert"
		tier4descrip = "This character is highly experienced in the creation of poisons. They are capable of creating lethal poisons capable of killing people in five days simply from a dosage on a Senbon. Extended exposure to a poison from this character can prove lethal easily. They are such an expert with poison that they are able to Frankenstein poisons to combine effects, though mitigating their effects. This gives them a broad range of opportunities, whose abilities can only be matched by Sasori."
		tier4name = "Poison Guru"
		tier2state = "poi"
		tier3state = "poi"
		tier4state = "poi"
		tier = 1
		cantmaster = 1
		canttier5 = 1

	Machete_Proficiency
		icon = 'perks.dmi'
		icon_state = "ssm"
		name = "Machete/Scimitar Proficiency 1"
		description = "This character is capable of employing a machete or a similar weapon in combat."
		tier2descrip = "This character is experienced with machetes and similar weapons. Their speed with the weapon is equivalent to Attack Speed 2 and wield the weapon with proficiency."
		tier2name = "Machete/Scimitar Proficiency 2"
		tier3descrip = "This character is a professional when it comes to machetes and similar weapons. They slash at the speed of Attack Speed 3 and they can utilize all parts of the weapon proficiently. They are capable of beheading an opponent if given an unguarded strike."
		tier3name = "Machete/Scimitar Proficiency 3"
		tier4descrip = "This character is an expert at wielding a machete. They fight on par with Katana Proficiency 4. Their strength is not mitigated regardless of how awkward of a position they are in. Their ability to employ their body weight along with the sharp edge of the machete have heightened the destructive power of their strikes."
		tier4name = "Machete/Scimitar Proficiency 4"
		tier = 1
		tier2state = "ssm"
		tier3state = "ssm"
		tier4state = "ssm"
		cantmaster = 1
		canttier5 = 1
		giStamina = 250
		giRef = 1.5
		giStr = 0.45




	Bow_Proficiency
		icon = 'perks.dmi'
		icon_state = "fuu"
		name = "Bowman"
		description = "This character is capable of using a bow in combat at medium to long range and is capable of firing up to two arrows at a time."
		tier2descrip = "This character is capable of using a bow with greater profiency and has the ability to use it at close range and firing up to three arrows at a time."
		tier2name = "Bowman 2"
		tier3descrip = "This character's skill with a bow is very great. They are capable of firing off up to four arrows at a time. Their arrows can change their trajectory by ninety degrees a single time after being shot."
		tier3name = "Bowman 3"
		tier4descrip = "This character is almost a master with a bow. They can change the trajectory of an arrow after having shot it up to three times.."
		tier4name = "Bowman 4"
		masterdescrip = "Bow Mastery"
		mastername = "This character's skill with a bow is unparalleled. They are capable of firing off up to five arrows at a time. Each of their arrows homes in on the target."
		tier2state = "fuu"
		tier3state = "fuu"
		tier4state = "fuu"
		tier = 1
		giTai = 2.75
		giAtkspd = 1.0

	Marksman
		icon = 'perks.dmi'
		icon_state = "kunai"
		name = "Marksman"
		description = "The user is capable of throwing a single weapon with accuracy though it isn't always guaranteed to hit exactly where intended, smaller weaponry will hit a still target without fail. While the user struggles when it comes to hitting moving targets, any weapons outside of senbon or shuriken hold a greater chance of inaccuracy. When throwing multiple weapons at once, the user sacrifices precision for a greater range of attack."
		tier2descrip = "The user has invested some time into the training of their skill with weapons, now being able to throw up to three weapons at once with clearer accuracy. They're able to create a cluster of sorts when it comes to throwing multiple weapons, but they still suffer from a lack of precision in such cases. When throwing a single weapon such as a senbon or kunai, they can pinpoint a spot and generally hit it with considerable accuracy, especially on a still target."
		tier2name = "Expert Marksman"
		tier3descrip = "The user is able to throw roughly six weapons at a target with amazing accuracy. They are able to hit even a bird with a senbon, shuriken, or kunai while it's flying in the air. They have enough focus that their shots rarely deviate from their desired impact point. They appear to have a homing property added to these shots, making it incredibly harder to dodge when the target lacks the proper reflexes. They can even launch a cluster of weaponry with considerable accuracy. This user is capable of bouncing weapons against each other to change the original course of the weapon to create surprise attacks."
		tier3name = "Veteran Marksman"
		tier4descrip = "This user's talent with a thrown weapon is unmatched, able to throw weapons with pinpoint accuracy.  To be thrown into perspective, this character can clip the wings of a humming bird with ease, target a character from a range spanning several meters, and strike with pinpoint accuracy. This character is a genius when it comes to creating surprise attacks, and has a great understanding of the inner workings of weaponry. They can angle a single weapon to change the course of all other thrown weapons if used in time. They suffer no problems when it comes to accuracy, even when throwing multiple weapons. This character is a force to be reckoned with when handed the proper weapons. "
		tier4name = "Master Marksman"
		tier2state = "kunai"
		tier3state = "kunai"
		tier4state = "kunai"
		tier = 1

	Flicker_Fighter
		icon = 'perks.dmi'
		icon_state = "shunshin"
		name = "Rookie Flicker Fighter"
		description = "This user of Shunshin is able to utilize the technique with moderate efficiency in battle. They're not immune to the effects of Shunshin as the effects do not stun them entirely; however, the effects still linger making it nearly impossible to attack immediately after its use. Note: Adds +1 to Tiles moved."
		tier2descrip = "The user has invested time into suppressing the effects of Shunshin; although if used repeatedly and in rapid succession, they will experience the effects. The user is able to initiate at most, an attack out of Shunshin but can't perform any combos. Note: Adds +3 to Tiles."
		tier2name = "Novice Flicker Fighter"
		tier3descrip = "The user's knowledge and understanding of this technique are great. They're able to completely suppress the effects of Shunshin's usage, and can use it in succession. But are limited to only performing a string of three attacks using the technique as an aid for movement. Note: Adds +5 tiles."
		tier3name = "Veteran Flicker Fighter"
		tier4descrip = "The flicker fighter has the skill to execute shunshin quickly, effectively, and in the midst of combat. They are capable of utilizing shunshin based combos, and can attack multiple times, tying in shunshin with their consecutive strikes. They suffer no consequences when performing attacks, and thus the potential for combos is unmatched. Note: Adds +8 Tiles."
		tier4name = "Master Flicker Fighter"
		tier2state = "shunshin"
		tier3state = "shunshin"
		tier4state = "shunshin"
		tier = 1
		giInt = 3
		giRef = 2.1
		giCon = 2





	Uchiha_Compassion
		name = "Uchiha's Compassion"
		icon = 'perks.dmi'
		icon_state = "uchiha"
		description = "Above all else, the Uchiha clan members value the love they have for their family..."
		tier = 1
		canttier2=1

	Blackened_Will_Of_Fire
		icon = 'perks.dmi'
		icon_state = "sharingan"
		description = "This character embodies two different sides of the spectrum. They carry the determination, and the will power of Konoha's will of fire; tainted with the hatred, aggression, and power of the Uchiha. They are a formidable foe, and they do not quit. They are capable of rising up to fight again once they've been beaten. They also carry high master over the sharingan, and whenever their hatred grows, and their anger, so does their power. This character does not lose himself in hatred, his hatred fuels him to fight on, and he is able to direct it toward his enemies. This character embodies a darker side of Konoha, and once he's been put down a second time, he is unable to move."
		tier = 3
		canttier4=1

	Uchiha_Hatred
		name = "Uchiha's Hatred"
		icon = 'perks.dmi'
		icon_state = "uchiha"
		description = "This character carries the hate of the Uchiha with him. He is relentless, and hate driven. His power is boosted, and so is his mastery over the Sharingan. His power grows at a quickened pace, and he seeks to end not only the source of his hate, but all those connected to the source, and connected to his hate as well. He loses himself in hatred, and destroys everything to try and sate the insatiable urge which follows him. His strikes are much faster and stronger than the average fighter."
		tier = "Master"
	Blind_Fight
		icon = 'perks.dmi'
		icon_state = "blind"
		description = "The Blind Fighter is capable of fighting whilst blinded. His senses are fine tuned, and he can fight as if he is capable of seeing with eyes both in front, and in back of his head. The Blind Fighter however can not fight against a silent opponent."
		tier = 3
		canttier4=1
		giTai = 1
		giRef = 1
		giDef = 0.75
		giGenres = 1.5
		giSenserange = 5
	Blood_Lust
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "Blood Lust drives this character to fight on as long as he draws blood from his opponent. Each time he draws blood, he becomes faster, stronger, more deadly, and he becomes harder to stop. He is very susceptible to stunning blows, but will not stop from pain so long as he is drawing blood from his opponent."
		tier = 2
		canttier3=1
		giStamina = 275
		giTai = 0.75
		giRef = 0.25
		giSpd = 0.20
		giStr = 1
		giAtkspd = 1
		giDur = 1

	Brute
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Brute is a walking tank. He laughs at pain, and fights on despite his injuries. As long as he hasn't lose too much blood, he won't stop, and he'll take blows recklessly as it brings him pleasure. He fights for enjoyment, and he is feared on the battlefield."
		tier = 1
		canttier2=1
		giStr = 1
		giDef = 1
		giDur = 1.45

	Chicken
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Chicken values his life above all else. He'll never risk his life in battle, and he'll go to any and all ends to preserve his own life. The Chicken can traverse an extra map in order to escape their opponent if they've been dragged into a fight."
		tier = 1
		canttier2=1
		giInt = 0.45
		giRef = 1.0
		giSpd = 1.45


	Cleaver
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Cleaver cuts through his opponents with no remorse to get to another. The cleaver is capable of double kills, and follow up strikes. Whenever he strikes an opponent down, whether to be killed, knocked out, or severely injured, he can instantly jump to another opponent and capitalize on their shock, attacking them right away, and with very little delay inbetween."
		tier = 3
		canttier4 = 1
		giRef = 1
		giStr = 1
		giAtkspd = 1

	Messenger
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "Able to skip every other map while travelling, If and only if they are carrying a message between villages for a Jounin or higher level ninja."
		tier = 2
		canttier3 = 1

	Courier
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Courier is a veteran traveler. He ferries information, weapons, anything, between lands and can traverse two maps instead of just one."
		tier = 3
		canttier4 = 1

	Demon_Aura
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Demon fights with obscene ferocity. He fights like a man possessed, with the ruthlessness of a demon. His instincts drive him to kill, and he cuts down multiple enemies simultaneously without remorse. With each successful strike, he's guaranteed a blow on another character if they are within range of the weapon he attacked with. He also is capable of fighting with half the ability of a brute."
		tier = 3
		canttier4 = 1
		giTai = 1
		giRef = 1
		giSpd = 1
		giStr = 1
		giAtkspd = 1
		giDur = 1

	Divine_Healing
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Priest with Divine Healing can not only heal at high speeds, but they can also spread their healing to multiple people. This is more draining for them, and when low on energy, they risk their lives to do such things."
		tier = 2
		canttier3 = 1

	Dual_Caster// - Tertiary Tier 3; Requires Chakra Training 2 or higher or Elemental Training 2 or higher AND Transitionist
		icon= 'perks.dmi'
		icon_state = "fuuin"
		description = "This perk allows the character to execute two techniques consecutively, without delay. For ninja, it requires the handseals for both techniques to be done first, and then the techniques may be executed one after the other with very minimal delay, allowing for combination jutsu."
		tier = 3
		canttier4 = 1
		giChakra = 0
		giNin = 1.5
		giCon = 1.25

	Dual_Pact// - 2ndary Tier 2; Requires Summoner Class and One Summon at Adept or higher level.
		icon = 'perks.dmi'
		icon_state = "summon"
		description = "A character with dual pact, is able to form a blood allegiance with two different forces. For normal characters, this allows a ninja to summon two different kinds of animals without the need of the animal's summoning contract for the jutsu. For Necromancers, this allows multiple demonic possession, which allows a Necromancer to summon two special demons, rather than just the one they're bound to."
		tier = 2
		canttier3 = 1

	Familiar_Tamer// - 2ndary Tier 2; Requires Summoner Class
		icon = 'perks.dmi'
		icon_state = "summon"
		description = "This character has the ability to force beasts under his will. Depending on the rank of the character, and the strength of the beast, as well as the relation between the two, it may be harder. However, the character can sway the beast to stand down, or to work with him."
		tier = 1
		canttier2 = 1

	Free_Runner// - 2ndary Tier 2; Requires Speed 2 or Higher, Reflex 1 or Higher, Stamina or Higher.
		icon = 'perks.dmi'
		icon_state = "free"
		description = "This character is incapable of being slowed down. They adjust to the many different shifts on the battlefield with ease, and glide across as if each boundary was not in their way. Their mobility is amazing, and they keep on the move, making them hard targets."
		tier = 2
		canttier3 = 1
		giStamina = 500
		giRef = 1
		giSpd = 2


	Flexibility// - 3etiary Tier 3; Requires at least B- Rank
		icon = 'perks.dmi'
		icon_state = "free"
		description = "This character can adjust to a number of fighting styles with ease. If it a fighting style they've not seen before, they can likely adjust ot it quickly, and are capable of combatting the moves of the style so long as they've seen it at least twice."
		tier = 2
		canttier3 = 1
		giStamina = 500
		giRef = 2.5
		giInt = 2


	Guardian// - 2ndary Tier 2; Requires Strength or Higher.
		icon = 'perks.dmi'
		icon_state = "body"
		description = "This character has increased strength and pain tolerance when protecting another. So long as they have something to fight for, they can fight on, and give it their all."
		tier = 2
		canttier3 = 1
		giStamina = 500
		giDur = 2


	Hozuki_Clan// -  Clan Base; Requires Hozuki Clan. Increases from Tier 1 ~ Tier 4. At Tier 4 turns into Hydration Master. Suika Mastered, 2 Other Hozuki Jutsu at Adept or higher.
		icon = 'perks.dmi'
		icon_state = "Suika"
		description = "This is a Hozuki Clan member. They are capable of performing the skills of this clan and breathing underwater. They only use 1 stamina turn while underwater."
		tier = 1
		canttier2 = 1


	Hydration_Master// - Master Tier 5; Requires Hozuki Clan Tier 4
		icon = 'perks.dmi'
		icon_state = "Suika"
		description = "This character is a master of hydration, and can use the water particles in the air to help boost their hydration techniques. They carry enough skill to perform techniques much like that of Suigetsu when Hebi fought the Hachibi."
		tier = "Master"
		giChakra = 2000
		giStamina = 1500
		giNin = 2
		giCon = 1.75
		giConst = 1000

	Hopeless_Visionary// - 3ertiary Tier 3; Requires Genjutsu Specialist, Mind 2 or higher. 2 Genjutsu Mastered. 2 at Adept or higher.
		icon = 'perks.dmi'
		icon_state = "mind"
		description = "This character is a big dreamer, and has the skill to turn his dreams into a weapon. He can empower genjutsu, and warp the effects of it. He can capture multiple people in the same genjutsu, and have them all experience it simultaneously, as if it were a group genjutsu."
		tier = 3
		canttier4 = 1
		giGen = 3
		giInt = 2
		giCon = 1
		giGenres = 2.5

	Illusionist// - 3ertiary Tier 3; Requires Genjutsu Specialist, Mind 3 or Higher. 4 Genjutsu Mastered. 3 at Adept or Higher. **Hidden Requirement** If the player gives up all other jutsu and perks at creation AND are Chunin or higher, This can be attained along with Magen: Narakumi ( Demonic Illusion: Hell-Viewing )
		icon = 'perks.dmi'
		icon_state = "gen"
		description = "The Illusionist is skilled in manipulating the triggers for genjutsu specifically fitted to manipulating the mind. They can warp the world around those they capture in their genjutsu, and either paralyze them or trick them into attacking their own allies by reconstructing the image of their allies within the illusion."
		tier = 4
		cantmaster = 1
		giGen = 4
		giInt = 3.5
		giGenres = 3.5


	Innovator// - Master Tier 4; Requires an Elemental or Chakra Training at Tier 4.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The innovator is someone who is constantly bringing forth trump cards in battle. He is intuitive enough to create new techniques, and he saves his techniques to always surprise his opponents. So long as he can surprise his opponent, he is guaranteed a non-lethal strike on his opponent."
		tier = 4
		cantmaster = 1
		giChakra = 1250
		giNin = 2
		giCon = 1.5


	Jinchuriki// - Base Tier 1; Requires the user to be a Bijuu Host.
		icon = 'perks.dmi'
		icon_state = "jin"
		description = "This character is a vessel for one of the tailed beasts of legend."
		tier = 1
		canttier2 = 1
	Jinchuuriki_Pact// - Requires Jinchuriki at Tier 2 or higher. Overrides Jinchuriki.
		icon = 'perks.dmi'
		icon_state = "jin"
		description = "This character has a certain level of control over the bijuu which inhabits their body. The relation varies, but this character can draw on their power to a certain extent. They recieve certain benefits, depending on the bijuu itself."
		tier = "Master"
	Jiongu_Threads// - Base Tier 1; Requires that the user get no other jutsu or perks at creation. If they aren't able to attain a Second Heart after six IC months, the Jiongu Threads drain them of their chakra and they die.
		icon = 'perks.dmi'
		icon_state = "thread"
		description = "This character has been affected by an ancient kinjutsu. Their body is now sprawling with the Jiongu threads, tangible threads that can be manipulated by the user, and seems to have a life of its own. The user is capable of manipulating them, sewing bodies together, sewing wounds shut, using the thread offensively, and allowing it to boost their power."
		tier = 1
		canttier2 = 1
	Light_Bringer// - Base Tier 1; Requires Kokonoresu and the rest to be included in the wipe. Only 1 out of every 10 Monks is allowed this perk.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has obscene potential with the light, and is capable of doubling their light-based powers such as the light palm, and other holy abilities."
		tier = 1
		canttier2 = 1
		giNin = 2
		giCon = 2
	Light_Foot// - 2ndary Tier 2; Requires Speed 2 or higher.
		icon = 'perks.dmi'
		icon_state = "spd"
		description = "This character is sneaky, and light on his feet. He makes no sounds when he walks, and is capable of avoiding those without the extroadinary hearing perk."
		tier = 2
		canttier3 = 1
		giTai = 1.0
		giRef = 1.0
		giSpd = 1.0


	Locksmith// - 3ertiary Tier 3; Requires Fuinjutsu Specialist, Speed, Handseal Speed 1 or higher.
		icon = 'perks.dmi'
		icon_state = "seal"
		description = "This character is a fuuinjutsu master, and is capable of not only executing numerous seals consecutively, but they are also capable of applying the seals with little preparation, and whilst on the move. The character is a speeding seal bullet, and is feared on the battlefield."
		tier = 3
		canttier4 = 1
		giChakra = 1000
		giNin = 2
		giCon = 2
		giAtkspd = 2
		giInt = 3


	Lycanthropic// - 2ndary Tier 2; Requires Summoner at Tier 3 or higher, A Mastered or Higher Summon.
		icon = 'perks.dmi'
		icon_state = "summon"
		description = "This character has an amplified connection to a certain animal, to the point where the animal they are connected to have affected their physical ability and appearance. Depending on what they have a connection to, their physical abilities will change."
		tier = 2
		canttier3 = 1

	Magician// - 3ertiary Tier 3; Requires Genjutsu Specialist, Mind 2 or higher. 2 Genjutsu Mastered. 2 at Adept or higher.
		icon = 'perks.dmi'
		icon_state = "gen"
		description = "The magician is capable of manipulating the triggers of genjutsu, allowing a certain part of their body to be the trigger. Their genjutsu is activated by sight, and are capable of putting anyone who views their trigger into a trance."
		tier = 3
		canttier4 = 1
		giGen = 2.5
		giInt = 1.5
		giGenres = 2.5

/*	Manipulator// - 3ertiary Tier 3; Requires Elemental Training at Tier 3 or Higher, Requires Shape Training at 1 or higher, Requires C- Rank or higher.
		icon = 'perks.dmi'
		icon_state = "elem"
		description = "This character manipulates a certain element or material with their chakra allowing for them the ultimate freedom with their jutsus. They also do not need to use hand seals, as their weapon bends to their will."
		tier = 3
		canttier4 = 1 */



	Martyr// - Base Tier 1
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The martyr is a character who fights for a cause. He can put his life on the line, and take a deadly strike to guarantee himself a realistic strike on his enemy. He gives his life for the opportunity, even if he isn't guaranteed a kill."
		tier = 1
		canttier2 = 1

	Mastery// - Master Tier 4; Prodigy are born with this perk. It is what decreases costs, wait times, and cooldowns.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has a natural gift when it comes to jutsu. Though usually used with power-type jutsu that enhances the power of the character, he can break jutsu up and utilize only parts of them. His natural mastery over techniques allow for great control and manipulation of said techniques(Ex: Partial Bijuu transformations alike Killer Bee; Partial Curse Seal transformations alike Sasuke)"
		tier = 4
		cantmaster = 1

	Prodigy
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is a Prodigy and has increased learning skills."
		tier = 1
		canttier2 = 1

	Medic// -  Base Tier 1; Requires Medic Class. Increases potency for Medic Jutsu.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The medic is a quick and nimble fighter, keeping out of the battle and protecting themselves. They are capable of quickly healing fighters on the battlefield just enough to get them up and ready for battle again. They can also heal at faster rates, and are able to focus with much more ease than the average medic, allowing for easier surgeries, and healing."
		tier = 1
		canttier2 = 1
		giChakra = 2500
		giCon = 2.5
		giInt = 2

	Mist_Fighter// - 2ndary Tier 2; Requires a Sight, Smell, or Hearing Perk AND Light Foot. As well as Kirigakure no Jutsu.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is capable of vanishing in the hidden mist. He fights with deadly precision, and with deception within the mist, making him nearly unstoppable inside of it."
		tier = 3
		canttier4 = 1
		giTai = 1

	Murderer// - 4dranary Tier 4; Requires Evil. Requires Cleaver,Demon Aura,or Berserker.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character becomes stronger, more durable, and faster with each life he takes. Each kill excites him, and empowers him, whilst demoralizing others. He is nothing short of a monster, and will stop at nothing to take a life."
		tier = 4
		cantmaster = 1
		giStamina = 2000
		giTai = 2
		giAtkspd = 1.5
		giDur = 2

	One_Eyed_Dragon// - 4dranary Tier 4; Requires Samurai at Tier 3 or higher.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Character with this perk carries the spirit of the One Eyed Dragon, Masamune Date, and are capable of weilding three to six katana with such expertise, that it is frightening. They fight with high skill, and are seemingly unstoppable with the katana."
		tier = 4
		cantmaster = 1
		giStamina = 1000
		giTai = 2
		giRef = 1.5
		giSpd = 2
		giStr = 1
		giAtkspd = 1.45

	Rebound// - 3ertiary Tier 3; Requires Flexibility, Reflex at tier 2 or higher and Sight 2 or higher.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character capitalizes on every moment. He counters as much as possible, focusing on dodging and waiting for the opportune moment. Ever three turns, he is capable of landing an immediate counter on his opponent if he dodged a strike on that third turn."
		tier = 3
		canttier4 = 1
		giTai = 1.34
		giRef = 1


	Regenerative_Cells// - Master Tier 4; Requires a Surgeon Tier 3 or higher to perform the 'Regenerative Cells' Surgery upon you.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The character with regenerative cells have chakra stored away to heal themselves when they need to. Their health regen is increased, and they recover from wounds more quickly than other, in and out of combat."
		tier = 4
		cantmaster = 1

	Serene_State// - 3ertiary Tier 3; Requires Mind 2 or higher
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has excellent focus. Their meditation is above all else, and they are capable of keeping their cool in battle. When meditating, they are able to keep perfectly still with ease. They also regenerate chakra faster."
		tier = 3
		canttier4 = 1
		giChakra = 1500
		giCon = 2

	Shadow_Walker// - 3ertiary Tier 3; Requires Light Foot, 2 years of IC Training.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "Shadow walkers are masters of stealth. The character with Shadow Walker is capable of hiding in shadows, and will remain unseen unless someone with sight two or better, or with primal sensing is focusing on their direction/in their location. Once every five rounds in combat, the Shadow Walker can completely vanish and elude their opponent's sights by falling into the shadows so long as their is an ample source around, or if it is night time and they are bathed in the darkness.."
		tier = 3
		canttier4 = 1
		giRef = 1.5
		giGenres = 1
		giSenserange = 20

	Nara_Clan// - Clan Base; Require Nara Clan. Increases from Tier 1 ~ Tier 4. At Tier 4 turns into Shadow Master. Shadow Bind + Shadow Stitching Mastered. 2 other Nara Jutsu Adept or higher.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is a member of the Nara Clan and is able to use their Hiden Jutsu."
		tier = 1
		canttier2 = 1
		giNin = 1.56
		giInt = 2
		giCon = 1


	Shadow_Master// - Master Tier 4; Requires  Nara Clan Tier 4.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The character with this perk is a master of the Nara clan jutsu, and can manipulate their shadows freely. They can modify and expand jutsu they have, and granted they know all the techniques there is to offer, they can go beyond this and utilize mock versions of shadow techniques with basic shadow manipulation."
		tier = 4
		cantmaster = 1
		giNin = 2
		giInt = 1.5
		giCon = 1.75

	Solid_Feet// - 2ndary Tier 2;  Requires a Hunger Based Perk as well as Body 2 or higher.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The character with solid feet has a great deal of balance, and has a hard time being knocked down."
		tier = 2
		canttier3 = 1
		giTai = 1
		giDur = 2


	Sturdy_Fighter// - 2ndary Tier 2; Requires Body or higher.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Sturdy Fighter is nothing short of a tank. He fights defensively, and acts as a shield for his allies. He can take quite the beating, and lives off of it."
		tier = 3
		canttier4 = 1
		giTai = 2
		giDef = 1
		giDur = 1.75
		giConst = 1000


	Survivalist// - Base Tier 1; Can live anywhere. No wait time on travelling.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The survivalist has trained himself to survive in numerous outdoor conditions. The wild is no match for him, as he can survive even in the toughest weather. He fights on, a part of the wilderness, relying on the land for survival."
		tier = 1
		giDur = 1
		giDef = 1
		giGenres = 1
		canttier2 = 1


	Tag_Specialist// - 2ndary Tier 2; Requires a second person with this perk. 2 IC years of training -TOGETHER-
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The tag specialist excels when he has a partner. One every three turns, he can make a coordinated attack with his partner which guarantees him a non-lethal strike on his enemy. He does better in combat once he has a partner, and is capable of pulling off combination jutsu with much less effort."
		tier = 2
		canttier3 = 1
	The_Keg// - 2ndary Tier 2; Big Nigga Woot Woot Chinchilla. Requires Big Eater.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The keg has taken the Big Eater to higher levels. His hunger is further increased, and with that, so has his durability."
		tier = 2
		canttier3 = 1
		giDur = 3.0
	Toe_Fighter// - 2ndary Tier 2; Cannot be used with Body or Strength Perks. Requires Speed or Reflex perks
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Toe Fighter fights on his toes, keeping agile and quick in his battle. He focuses on quick strikes with less power, and is capable of laying numerous hits on his opponents. He is notably more fragile in combat, and is much more susceptible to knockdowns."
		tier = 2
		canttier3 = 1
		giStamina = 0
		giTai = 2
		giRef = 1
		giSpd = 1
		giStr = -1.5
		giAtkspd = 1.5


	Underdog// - Base Tier 1
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The underdog doesn't give up. He fights his best when he is beaten, and as he comes closer to being defeated, he fights harder. He regains a great deal of energy, and fights on with stronger reserves, but falls faster."
		tier = 1
		canttier2 = 1
	Will_Breaker// - 2ndary Tier 2; Requires Evil.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Will-Breaker is a frightening being. His presence quite literally breaks the will of the character, by disabling one of their will perks and leaving them helpless. Whenever an opponent attempts to benefit from a will perk, the Will Breaker can counter the perk successfully, breaking the perk for the duration of the battle, and make a successful strike on their opponent."
		tier = 2
		canttier3 = 1
	Will_Of_Fire// - Base Tier 1
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Will of Fire is found in Konoha Shinobi who embody the fire that drove the ancient Senju Clan to greatness. They never give up on their philosophy, and have the strongest resolve. They fight on, and will never give up, finding the will to fight even after their body has failed them. They are capable of rising to fight against once after they've been defeated. After they've been put down a second time, their body will no longer move, until they have been healed, though this rarely stops them from trying."
		tier = 1
		canttier2 = 1
	Tenacity_of_Lightning// - Base Tier 1
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Tenacity of Lightning is found in Kumogakure Shinobi who embody the lightning that allowed the historic Regalado Clan to fight to greatness. They stay calm, cool, and collected in even the toughest of situations. They never give in, they perservere, when faced by multiple foes their lightning attacks rend through the opposition without distinction. Their non-melee lightning attacks all have an AOE effect and have 25% better aim than normal."
		tier = 1
		canttier2 = 1
	Cunning_of_Water// - Base Tier 1
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Cunning of Water is found in Kirigakure Shinobi who embody the water that allowed the crafty Toyotomi Clan to slyly steal their way to greatness. They are cunning, sly, and sketchy. They never fight head on when it can be avoided and will always work to preserve themselves. When fighting in the mist, they are cloaked -completely- from anyone lower in rank than them as long as they are not attacking."
		tier = 1
		canttier2 = 1
	Strategem_of_Wind// - Base Tier 1
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Intellect of Wind is found in Sunagakure Shinobi who embody the wind that the old Lyzerg Clan rode to power. They are calculating, critical, and genius. They fight smarter, not harder. When fighting, they are allowed an extra turn, every three rounds, to set up or trigger a plan into action."
		tier = 1
		canttier2 = 1
	Zealot// - 2ndary Tier 2; Requires Martyr or Zealot Attitude
		icon = 'perks.dmi'
		icon_state = "zeal"
		description = "The zealot fights for their belief, their God. They fight onward for the sake of their religion. They are unstoppable, and will fight through their pain, until their dying breath. They never slow down, so long as their faith is strong, which leads to a faster death. The zealot, is a double edged sword."
		tier = 2
		canttier3 = 1
	Jashinist// - Master Tier 2; Requires Zealot, Must sacrifice ten player souls before obtaining immortality. Loss of Immortality = Death. Immortality lost if one soul an OOC weak isn't sacrificed.
		icon = 'perks.dmi'
		icon_state = "jashin"
		description = "This character is a member of the Cult of Jashin. They are able to become immortal, throwing themselves headlong into battle without a care in the world."
		tier = 2
		canttier3=1
	Architect// - Base Tier 1
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is a natural builder, and can construct things for half the resource cost."
		tier = "Master"
	Advanced_Chakra_Strings// - Master Tier 4; Requires Puppet Specialist at Tier 3 or higher, Kugutsu at Veteran or higher.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has great skill with their chakra strings, and can control puppets with a single finger. They can also manipulate non-organic objects with their chakra strings."
		tier = 4
		cantmaster=1
	Amplifier// - Master Tier 5; Requires Massive Chakra or Higher
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has the power to amplify the power of their techniques, forcefully expanding it and creating something greater out of it by inputting much more energy for a stronger output."
		tier = "Master"
	Armor_Smith// - Base Tier 1
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is a talented blacksmith, and is capable of smithing armors at their anvils."
		tier = "Master"
		giInt = 3.75

	Akimichi_Clan// - Clan Base; Requires Akimichi Clan. Increases from Tier 1 ~ Tier 4. At Tier 4 with Akimichi Pills mastered, Turns into Calorie Fighter.
		icon = 'perks.dmi'
		icon_state = "akimichi"
		description = "This character is a member of the Akimichi clan. They can use the clan's hiden jutsu."
		tier = 1
		canttier2=1
		giStamina = 0
		giTai = 2.0
		giRef = -1.5
		giSpd = -1.0
		giStr = 1.5
		giDur = 1.5
		giConst = 1000


	Calorie_Control// - Master Tier 5; Requires Akimichi Clan 5 and Akimichi Pills Mastered as well as 5 Years IC training.
		icon = 'perks.dmi'
		icon_state = "akimichi"
		description = "This character is capable of fully converting the calories in their body into chakra without the aid of the Akimichi clan pills. They have reached a feat which is not commonly achieved."
		tier = 4
		canttier5 = 1
		giCon = 15




	Copy_Wheel// - Tier 3; Requires Sharingan 2 tomoe and Genjutsu Spec as well as Mind 2 or higher.
		icon = 'perks.dmi'
		icon_state = "sharingan"
		description = "The character with copy wheel has a great deal of mastery over the sharingan, and is capable of analyzing the jutsu they see, and copying it so long as they are focusing. This character is incapable of learning the jutsu they copied unless they've gone without copying another jutsu for three OOC days."
		tier = 3
		canttier4 = 1
	Chakram_Proficiency// - Requires 3 years IC Chakram Use.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is proficient with Chakrams. They can use them effectively, throw and retrieve them, and their thrown chakrams act like boomerangs. They can also fight quickly and effectively with them in melee combat."
		tier = "Master"
	Concealer// - Requires 2 Years Concealment training.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is excellent at the art of concealment. They can hide items from other characters with ease so long as they lack the advanced sight perks. This character can hide small and medium size weapons, and even use them for sneak attacks. Characters without sight 2 will have to focus on this character without any distractions to pick up a clue about it, and a character with Eagle Vision can spot the weapon if they focus. If distracted, they can only find a clue."
		tier = "Master"
	Ender_Blade_Proficiency// - Requires 10 years of IC Ender Blade Use As Well as BFSW 2 or higher.
		icon = 'perks.dmi'
		icon_state = "ender"
		description = "This character can handle the power of the Ender Blade, and utilize its full potential."
		tier = "Master"
	Fan_Proficiency// - Requires a Fan and 1 Year of IC Training
		icon = 'perks.dmi'
		icon_state = "fan"
		description = "This character is capable of utilizing a fan to its full potential. They can cast jutsu with the help of the fan, and even glide with it."
		tier = "Master"
	Gunbai_Proficiency
		icon = 'madara.dmi'
		description = "This character is capable of utilizing a Gunbai to its full potential. They can cast jutsu with the help of the gunbai, and even deflect weak techniques with it. It is, unlike the fan, capable of being utilized with multiple elements beyond simple wind."
		tier = "Master"
	Geneticist// - Requires Medic Level 5 or higher, Surgeon Level 4 or higher, Poison Extraction Veteran or higher, Shosen Veteran or higher. 5 Years of -intense- IC study. ( We're talking 250 ~ 500 RPs Intense )
		icon = 'perks.dmi'
		icon_state = "gene"
		description = "The Geneticist has done a great deal of research, and medical practices to modify DNA. His findings have granted him increased insight to a number of mysteries in the human body, and he can use this to amplify the features of others, change their DNA, and replicate kekkei genkai after studying it, so long as he has the resources."
		tier = "Master"
/*	1_Tier_Perks
		icon = 'perks.dmi'
		icon_state = "perk"
		description = ""
		tier = 1
*/
	Gourd_Combatant // Requires 3 years of IC Gourd use in battle.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Gourd combatant is a veteran fighter with a Gourd. The gourd is heavy, but it doesn't bother the Gourd Combatant as much as it would a regular fighter. They are capable of utilizing full jumping potential, and they are also capable of jogging with the gourd. The combatant can also cast techniques directly out of their gourd."
		tier = "Master"
	Grappler // Requires Some form of Taijutsu Spec, 2 years IC training.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The Grappler fights to force his foes into submission. Anyone who isn't a rank over him lacks the ability to break out of his holds, and his ability to cause pain through submissive moves are unmatched."
		tier = "Master"
	Main_Hyuuga_Clan //Levels up 4 times to Grand Vision
		icon = 'perks.dmi'
		icon_state = "hyuuga"
		description = "This character is a member of the Hyuuga Clan. They have access to the Kekkei Genkai Dojutsu: Byakugan. This character is a Main Family member, and thus are considered noble among their clan."
		tier = 1
		canttier2 = 1
		giTai = 1.75
	Branch_Hyuuga_Clan
		icon = 'perks.dmi'
		icon_state = "hyuuga"
		description = "This character is a member of the Hyuuga Clan. They have access to the Kekkei Genkai Dojutsu: Byakugan. This character is a Branch Family member, and thus have a control seal upon their forehead in bright green."
		tier = 1
		canttier2 = 1
		giTai = 1.75


	Grand_Vision // Requires Jyuuken tier 3 or higher Byakugan 4 or higher
		icon = 'perks.dmi'
		icon_state = "byakugan"
		description = "This character has great mastery over the Byakugan, and can easily see over a grand distance. Their sensing range has been increased."
		tier = "Master"
	Halberd_Polearm_Proficiency// Requires 2 years IC Polearm usage.
		icon = 'perks.dmi'
		icon_state = "pole"
		description = "This character can make skillful use of Halberds and Polearm weapons. They can move gracefully with their weapons, and strike with deadly skill."
		tier = "Master"


	Reaper
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Amateur Reaper"
		description = "This individual has began to make use of a scythe, a weapon suited for a mix of brutal offense with a brutal blade, and elegant defense with the pole that it is linked to. They are an amateur as of yet, leaning on the weapons defensive ability, and still have trouble with how unwieldy a weapon a scythe can be."
		tier2descrip = "This individual has attained a proper understanding of how to use a scythe in battle, elegantly shifting between blocking and attacking, sometimes in a single motion. They have begun to master the reach of the pole and blade combo, and their skill can be said to be that of a proper soldier."
		tier2name = "Professional Reaper"
		tier3descrip = "This individual has attained an artistic mastery of the scythe in battle, reaping their foes like wheat at the harvest, and dancing between them; twirling the pole elegantly into every stroke and action. A true artist of death."
		tier3name = "Dancing Reaper"
		tier4descrip = "A true master of the scythe, this individual is a monster of genocide, capable of ending lives in elegantly brutal swings of their blade on their stave. They have turned a farming implement into a tool of artistic death, a truly terrifying notion."
		tier4name = "Grim Reaper"
		tier2state = "perk"
		tier3state = "perk"
		tier4state = "perk"
		tier = 1
		cantmaster = 1
		giStr = 1.5
		giRef = 1.5
		giAtkspd = 1.5

	Axe
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Axe Swinger"
		description = "This individual has chosen to wield an axe; a brutal, savage weapon. While not the fastest of weapons, it's simple and easy to use, and the weight of the weapon allows for immense potential to penetrate armor. The skill of this individual when using one, however? Novice. They can mostly simply swing it about like a lunatic and pray."
		tier2name = "Axe Lover"
		tier2descrip = "This individual has learned to move beyond the bare basics, developing a love of their weapon that is necessary to make proper use of it. Plumbing into actual style with their savage brutality. They make this savage weapon look good."
		tier3name = "Reaver"
		tier3descrip = "This individual is a monster with an axe of any kind, maiming and slaughtering, ripping and tearing with a savage abandon. They utilize this most brutal of weapons with a finesse and brutality that merge into truly murderous perfection."
		tier4name = "Executioner"
		tier4descrip = "This individual does not fight with an Axe. They kill with an axe, acting like an executioner come to the slaughter. Each blow capable of monstrous damage to whatever they choose to hit with superior concussive knockback damage."
		tier2state = "perk"
		tier3state = "perk"
		tier4state = "perk"
		tier = 1
		cantmaster = 1
		giStr = 1.5
		giAtkspd = 1.5



	Gunslinger
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Gunslinger"
		description = "This individual has attained something truly terrifying. An understanding of how to load, maintain, and fire a gunpowder firearm. They are acclimatized to the smoke from the barrel, understand the basics of how to aim one and deal with recoil, and know how to pack the powder and bullet."
		tier = 3
		canttier4 = 1
		giRef = 2.5
		giAtkspd = 2.5
	MasterGunslinger
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Master Gunslinger"
		description = "This individual has mastered a terrifying art, bringing death and destruction from afar with shocking precision. They can maintain their own guns, and are capable of terrifying feats of marksmanship with one. They are fully capable of speed-loading a rifle or pistol, inasmuch as the pistol or rifle in question can feasibly allow, and their ability to call their shots and hit small targets is near inhuman."
		tier = 4
		cantmaster = 1
		giRef = 5
		giAtkspd = 5

	KnuckleFighter
		name = "Knuckle Fighter"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This individual has gained skill in the use of brass knuckles, they are capable of adding extra damage to their punches, without causing severe damage to their own hands while using these strangely simple weapons."
		canttier2 = 1
		tier = 1
		giStr = 2

	Shield_Prof
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Shield Bearer"
		description = "This individual is skilled on a basic level when it comes to using a shield for both defense and offense. They are actually capable of coordinating their movement of the shield to correctly deflect enemy attacks, and making clumsy shield bashes to disrupt their foe."
		tier2name = "Knight of the Shield"
		tier2descrip = "This individual has a more advanced grasp of the use of a shield, gaining a good deal more alacrity when using one for defense. Smoothly deflecting strikes with minimal damage to the shield in melee, and brutally bashing at the enemy to stun and confuse them with notable skill."
		tier3name = "The Wall"
		tier3descrip = "This stoic warrior is a wall in combat, immovable save when they wish to be moved. They are more than capable of blocking and deflecting most any kind of blow with their shield, agiley shifting its position as they need it to be, and counterattacking with the same weapon, using the rims and edges of the shield as brutal weapons to extend their reach with it.<br> Concussive Knockback Tiles: Str/2"
		tier4name = "The Immovable Object"
		tier4descrip = "This absolute bastard is capable of making any kind of shield a nigh indestructible object of supreme annoyance for their foes, moving it skillfully to deflect blows rather than tank them on the object they have chosen to use as a shield, then striking out with its edges and body to distract, stun, and annoy their foe further. Their stance with a shield is solid and sturdy, and when standing still and raising shield, they are fully capable of enduring most any force that transfers through the heavy metal, and standing their ground against any onslaught. A true master of defense.<br>Concussive Knockback Tiles: Str/2"
		tier2state = "perk"
		tier3state = "perk"
		tier4state = "perk"
		cantmaster = 1
		tier = 1
		giTai = 1.0
		giStr = 1.0
		giAtkspd = 1.0

	Wire_Prof
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Ninja Wire Specialist"
		description = "This individual has made the choice of specializing in the use of Ninja Wire of all kinds. They make use of all kinds of wires in battle, ranging from hyper thin and sharp edged wire, to thick cords to entangle. The uses are limitless.. but their use remains realistic and.. difficult, to say the least."
		tier2name = "Ninja Wire Afficionado"
		tier2descrip = "This individual has moved on from merely playing about with all kinds of wire, to real hardcore specialization. They can shred a man with a garrote from ten paces, and entangle limbs with thick cords. A difficult art to master, and most of the time, unwieldy to say the least, but... metal wires on the wind can be most deadly."
		tier3name = "This individual is a horrific monster, by now; capable of using all kinds of ninja wire to lethal effect, or more precise maiming. This is an art meant for single target use, but the sheer battlefield control a master can attain is... terrifying. An inhuman creature, surely."
		tier4name = "Angel of Death"
		tier4descrip = "This master of murder has attained a mastery over Ninja wire that pushes the limits of logical possibility; shredding multiple individuals, dancing about and using the thin wires to intercept attacks skillfully then severing the limbs that sent the attacks. Few can survive their proximity when they get going."
		tier2state = "perk"
		tier3state = "perk"
		tier4state = "perk"
		cantmaster = 1
		tier = 1
		giRef = 1.0
		giStr = 1.0
		giAtkspd = 1.0

	Lasher_Prof
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Amateur Lasher"
		description = "This individual has begin to train with the unusual weapon choice of a whip. This exotic and possibly erotic weapon is useful as a tool just as much as it is a weapon of battle; but is not to be underestimated. As the blunt trauma and speed along with the whipcrack force can easily rip skin apart and cause extensive damage to anywhere that has veins or arteries, due to causing massive blood loss once it breaks skin. Still, this individual has only just begun to make use of these deeply sadistic weapons, and has at best a minimal skill."
		tier2name = "Skilled Lasher"
		tier2descrip = "This dominating individual has advanced their skill with a whip to a higher level; gaining the ability to use It to dexterously pick up items from a reach and yank them over, use as an aid in reaching high places or climbing, or bringing themselves closer to a foe. It's damage potential has also increased in their hands, as they learn how to swing the whip just so to inflict lasting damage, rather than just extreme pain."
		tier3name = "Whiplash"
		tier3descrip = "This determined individual has decided that a whip, while a fun tool, is first and foremost a lethal weapon; and has begun to master its use as such. Fighting them is an exercise in endurance and pain, more often than not. The whip in their hands is a liquid tendril of agile pain and agony."
		tier4name = "Bringer of Pain"
		tier4descrip = "This monstrous individual has perfected the use of the whip in combat, and outside of it. They are capable of inflicting both excruciating agony and absolutely destructive damage with the whip in hand. Their blows do not just cause damage, they hurt far, far more than they should, and likely have caused massive rupture of the blood cells in your skin."
		tier2state = "perk"
		tier3state = "perk"
		tier4state = "perk"
		cantmaster = 1
		tier = 1
		giRef = 1.0
		giStr = 1.0
		giAtkspd = 1.0

	Crossbow_Prof
		icon = 'perks.dmi'
		icon_state = "perk"
		tier2name = "Crossbow Dabbler"
		tier2descrip = "This individual has begun to dabble in the use of one of history's most easy to use medieval weapons. The crossbow is a simple thing to fire, you point, you aim, you pull a trigger and metal winches fire a bolt fast and hard. The issue? Reloading. Reloading a crossbow by hand winch is a difficult thing to do, and time consuming, to say the least. This individual can at least do that much, though! "
		tier3name = "Crossbow Machinis"
		tier3descrip = "This deviously cunning individual has become acclimatized to the harsh reloading time of a crossbow, and even figured out a few tricks here and there for speeding it up! What is more, their aim is pretty solid with one, as they learn to account for wind velocity and drift with their projectiles."
		tier4name = "Arbalestier"
		tier4descrip = "This individual has attained a level of marksmanship and skill with a crossbow that is outright bizarre; devoting an inordinate amount of time to mastering the use of this simple, easy to fire weapon with uncanny skill. Their aim is impressive, and they are capable of speed-loading and re-loading even the biggest of crossbows."
		tier2state = "perk"
		tier3state = "perk"
		tier4state = "perk"
		cantmaster = 1
		tier = 1
		giRef = 1.0
		giAtkspd = 1.0

	Hammer_Prof
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Hammer Bearer"
		description = "This individual has acclimatized themselves to the use of heavy two handed warhammers, an achievement in and of itself. They swing around these weapons freely, using the haft to parry and the head to strike, or sometimes the other way around. Regardless; they are lacking in actual finesse or skill with the weapon, but not on brute force."
		tier2name = "Hammer Time"
		tier2descrip = "This individual has grown completely used to using a Warhammer, finding it not a tiring experience at all, anymore than any other weapon or mode of combat. They strike and parry with fluidity and righteous fury, their weapon of choice lending itself well to crushing armor and pressing it in against those wearing it."
		tier3name = "Hammer Lord"
		tier3descrip = "This individual has attained a mastery of the Warhammer rarely seen in Shinobi, using such weapons with speed and grace and above all, raw brutal power. There are few alive who can match them in sheer bludgeoning force, when they get going all out with their chosen weapon."
		tier4name = "Unstoppable Force"
		tier4descrip = "This individual has attained a skill and strength with the hammer that is nigh inhuman, crushing bones and shattering blades with every strike, flattening armor and destroying rocks with ease. Do not be in their way if you can help it, it won't be pretty when they hit you."
		tier2state = "perk"
		tier3state = "perk"
		tier4state = "perk"
		cantmaster = 1
		tier = 1
		giRef = 1.0
		giTai = 1.0
		giStr = 1.0

	Bludge_Prof
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Bludgeoning Fan"
		description = "This individual has found themselves growing fond of the simpler things in battle, that is, blunt weaponry of a basic nature. Maces, Clubs, table legs, really, anything blunt of that shape and size, they consider a valid weapon. They aren't the most skillful around, perhaps, but it's hard to argue with the results."
		tier2name = "Blunt Trauma"
		tier2descrip = "This individual has taken their sick fascination with primitive weaponry one step further, advancing their use to more precise destruction of the enemy body with their choice of a weapon that either knocks you out harmlessly, or deals massive internal damage!"
		tier3name = "Blunt Force"
		tier3descrip = "This bastard has begun to really get into the swing of things. Their blows with a mace, club, or other weapon of similar nature are brutal and savage things that concuss, break bones, and push ribs into organs on the average swing, when attacking poor fleshies, and do even nastier things to armor that isn't tough enough to stand the test (Concussive Knockback Tiles: Str/2)."
		tier4name = "Brutal Bludgeoner"
		tier4descrip = "This monster has attained a skill with blunt objects that can be called masterful. Artistic. Horrifyingly brutal... and many other similar adjectives that make it clear how painful being on the receiving end of a swing from this savage can be (Concussive Knockback Tiles: Str/2)."
		tier2state = "perk"
		tier3state = "perk"
		tier4state = "perk"
		cantmaster = 1
		tier = 1
		giTai = 1.0
		giStr = 1.0

	Spear_Prof
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Spearman"
		description = "This individual has begun to focus on use of the spear as a weapon in combat, harking back to some of the earliest innovators to strap a pointed bit to their sticks! They are skillful with the weapon, but their main and only real advantage at this point is the reach it affords them."
		tier2name = "Lancer"
		tier2descrip = "This individual has begun to really get used to using a spear in real combat, lunging and weaving with it, and avoiding closing to full melee by utilizing the reach of the weapon they have chosen with skill and grace."
		tier3name = "Spear Twirler"
		tier3descrip = "This individual Is becoming a true master of the spear; nearly at the summit of their weapons use. They are capable of utilizing it as a slashing weapon through high speed movements, and twirling the haft to parry in melee with ease."
		tier4name = "Lance Master"
		tier4descrip = "This master of the spear has attained a grace and speed with the spear that cannot be underestimated, allowing them to pick apart foes from a short range, then dismember them as they push past the spears reach with twirling, elegant motions."
		tier2state = "perk"
		tier3state = "perk"
		tier4state = "perk"
		cantmaster = 1
		tier = 1
		giTai = 1.0
		giStr = 1.0
		giRef = 1.0

	Sai_Prof
		icon = 'perks.dmi'
		icon_state = "perk"
		name = "Sai Specialist"
		description = "This individual has begun to specialize in the use of the Sai, a Tri Pronged dagger. It's a weapon whose primary use is that of being an offhand used to disarm. They are thusly primarily defensive, finding themselves lacking in offensive skill."
		tier2name = "Sai Lover"
		tier2descrip = "This individual  has taken their use of the Sai's to a professional weapon, gaining a skillful grace when using the prongs to catch swords and disarm their users, catching weapons between the prongs of the Sai and twisting the wrist to disarm. They are graceful and skilled with the weapons in their hands, and can also use them offensively."
		tier3name = "Disarmament Genius"
		tier3descrip = "This individual has mastered the art of using a Sai to strip a foe of their weaponry, clashing blades with them is a dangerous business, liable to result in the other individual losing their weapon to a smooth flourish, then being cut with narrow wounds."
		tier4name = "All in the Wrist"
		tier4descrip = "This individual has mastered the use of a Sai both for disarming their foes, and dealing massive damage, the closeness of the wounds caused by the triple prong making them difficult to stitch, and that same design optimal for disarming others. Simple, efficient wrist movements, are the core of their style."
		tier2state = "perk"
		tier3state = "perk"
		tier4state = "perk"
		cantmaster = 1
		tier = 1
		giTai = 1.0
		giTai = 1.0
		giRef = 1.0

	Savior
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This individual is obsessed with saving the lives of others, at great cost to themselves more often than not. Like a guardian, they fight better when defending others; but they take this to self destructive extremes. The salvation of others lives is their greatest desire; and they will fight to the edge of human capability to do so. Enables the user to take attacks meant for those nearby them, providing they would have had the reflexes to dodge the attack where it aimed at them."
		tier = 3
		canttier4 = 1
		giRef = 5
		giAtkspd = 5
		giStamina = 1000

	Saintly
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This individual is a borderline saint; their will to better the world and others is inhuman, almost; as they transcend basic human nature to achieve true selflessness. This serene acceptance enables them to achieve inhuman feats through simple ignorance of the self; in mechanical terms, so long as they are doing so for the benefit of another, they can endure any level of pain or injury without being impaired, unless the injury would physically make ignoring it impossible. i.e. they could ignore any number of stab wounds long enough to reach someone and help them, but could not ignore a severed limb."
		tier = 4
		cantmaster = 1
		giStamina = 2000
		giDur = 5
		giRef = 5

	Neurologist
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has studied the functions of the nervous system in great depth and has exceeding knowledge regarding the structure of the brain. This enables them a higher probability of success in terms of brain surgery and they are also able to rewire the amygdala, as well as afferent and efferent pathways to work more effectively. They are capable of developing technology regarding neurogenesis should they work in tandem with an engineer."
		tier = 3
		canttier3 = 1
		giInt = 5

	Respiratory_Specialist
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has studied the inner workings of the respiratory system. They understand the flow of breathing amongst several different organisms, not just human beings. This makes them effective at recognizing both Hoshigaki and regular human oxygen cycles. They are capable of CPR and are able to perform surgery regarding lung damages."
		tier = 2
		canttier2 = 1
		giInt = 2

	Cardiologist
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has studied the cardiac muscle’s performance in the heart. This incredibly difficult subject has been near mastered by this character, giving them great performance when performing surgeries regarding the circulatory system and control of blood flow. They are able to incorporate this into jutsu by even cutting off blood-flow with the chakra scalpel technique. These doctors are much more deadly but also much more useful, as they have the capability of engineering electrical surges that can rebound a heart from death."
		tier = 3
		canttier4 = 1
		giInt = 5.5

	Immunologist
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has studied a vast range of diseases, ranging from malaria and even sexually transmitted ones. Their vast expanses of knowledge enables them to further create antidotes and vaccines that can prevent the spread of such malicious diseases from ever encountering the body’s immune system again. This character can also incorporate their studies by speeding up the T-cell production in the body to counteract diseases and mitigate the effects of poisons."
		tier = 3
		canttier4 = 1
		giInt = 5

	Plastic_Surgeon
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has a good grasp over surgery and are now able to replicate epidermic layers of skin. They can remove subcutaneous fat from the chin and other regions of the body, making for slimmer bodies, or even add fat or color into regions of the body. This enables them to artificially change the appearances of patients."
		tier = 2
		canttier3 = 1
		giInt = 2.5

	Anesthesiologist
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has a great understanding of how drugs function in the human body. While the task of being an anesthesiologist is not physically demanding, it requires great understanding of chemical operations within the human body. They are skilled in applying painkillers and other types of drugs in the body, and can even stretch to steroids and euthanasia, as they are skilled enough to locate particular blood vessels that are perfect for syringe entry."
		tier = 2
		canttier3 = 1
		giInt = 3

	Orthopedist
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is increasingly skilled with handling problems of the musculoskeletal system. They are skilled at handling problems when it involves skeletal muscles and are masterful in rekindling the muscular systems in various locations across the body. Their understanding of the human body extends from head to bottom, involving the entire skeletal system and the muscular system."
		tier = 3
		canttier4 = 1
		giInt = 5

	Psychiatrist
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is handy when it comes to treating mental disabilities and mental disorders. They have a good understanding of chemical processes in the brain and can administer drugs to treat some of these disorders, including epilepsy, schizophrenia, and anxiety disorder. They are capable of coupling this with neurologist for a massive expansion of their knowledge of the nervous system’s workings."
		tier = 2
		canttier3 = 1
		giInt = 3

	Akimichi_Pills
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This person is capable of creating Akimichi pills for use by the Akimichi clan."
		tier = 3
		canttier4 = 1
		giInt = 4

	Kaguya_Anatomy
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has dissected at least one Kaguya member and has fully examined the contents of their body. By mapping it out, they have expanded their anatomy perk to include the Kaguya anatomy as well, and can operate on them properly. They can also identify weaknesses in the Kaguya’s armor-like shell and use chakra scalpel more effectively."
		tier = 3
		canttier4 = 1
		giInt = 4


	Heavy_Armor_Proficiency // Requires 3 years IC training.
		icon = 'perks.dmi'
		icon_state = "armor"
		description = "This character is capable of fighting in Heavy Armor without any drawbacks. It does not slow them down as drastically as it would an untrained warrior, and they can attack without any issues in it."
		tier = "Master"
	Herbalist //Requires 2 years of farming
		icon = 'perks.dmi'
		icon_state = "poi"
		description = "This character is capable of growing and using herbal remedies (This does not include poisons or chemicals for pills)."
		tier = "Master"
	Hiramekarei_Proficiency // Requires BFSW 2 or higher plus 2 years of training with Hiramkarei
		icon = 'perks.dmi'
		icon_state = "hiram"
		description = "This character is proficient with the Hiramekarei blade. They are capable of infusing it with their chakra, and even spawning the hammers of pure energy the sword is capable of creating."
		tier = "Master"

	Katana_Proficiency // Levels up 3 times to Iai AND Requires 4 years IC training
		icon = 'perks.dmi'
		icon_state = "katana"
		description = "This character is able to use a katana in battle."
		tier = 1
		tier2descrip = "This character's skill with a Katana is nothing to be laughed at. They are able to cut through an unguarded opponent with ease."
		tier2name = "Katana Proficiency 2"
		tier3descrip = "This character's ability with a Katana is amazing. They are able to swiftly switch between striking and defending with the blade with the ease of someone with Attack Speed 2."
		tier3name = "Katana Proficiency 3"
		tier4descrip = "This character's ability with a Katana is frightening. They are capable of fending off multiple targets with ease and striking them down with a single blow if unimpeded."
		tier4name = "Katana Proficiency 4"
		tier2state = "katana"
		tier3state = "katana"
		tier4state = "katana"


	Dual_Wielding_Sword_Art
		icon = 'perks.dmi'
		icon_state = "katana"
		description = "This character is proficient with dual wielding average sized swords. They remove the dangers of the weapons from themselves, and can utilize off-handed weapons efficiently, even in conjunction with a regular sword."
		tier = 2
		canttier3 = 1
		giTai = 2.5
		giAtkspd = 1.5
		giStr = 2
		giRef = 1

	Giant_Dual_Wielding_Sword_Art
		icon = 'perks.dmi'
		icon_state = "katana"
		description = "This character is proficient with dual wielding giant swords. They remove the dangers of the weapons from themselves, and can utilize off-handed weapons efficiently, even in conjunction with another giant sword."
		tier = 3
		canttier4 = 1
		giTai = 2.5
		giStr = 5
		giRef = 1.25

	Iai // Requires Katana Prof Tier 4
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is trained in the art of quickly drawing their katana from the sheaths. This character can make a blindingly fast strike that is capable of automatically stopping the hand seal usage of a ninja. If said ninja does not block, they take a deadly hit."
		tier = "Master"
		giTai = 2.0
		giRef = 1.54
		giSpd = 0.75
		giStr = 1
		giAtkspd = 2.5


	Anatomy
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has an understanding of the human anatomy and is able to, in conjuction with Needles of Death, inhibit their target's movement, cause them to enter a state of faux death, or paralyze their opponent."
		tier = 2
		canttier3 = 1
		giInt = 4
	Uchiha_Clan // Levels 3 times. Getting Sharingan 1 = Tier 2 || Getting Sharingan 2 = Tier 3 || Gettting Sharingan 3 = Tier 4
		icon = 'perks.dmi'
		icon_state = "uchiha"
		description = "This character is a member of the Uchiha clan."
		tier = 1
		canttier2 = 1
	Illuminating_Eyes // Requires Illuminating Eyes Level 2
		icon = 'perks.dmi'
		icon_state = "sharingan"
		description = "This character has a natural mastry of the sharingan, and can see through the effects of some of the strongest genjutsu with ease."
		tier = "Master"
	Indirect_Fighter
		icon = 'perks.dmi'
		icon_state = "blind"
		description = "This character is a skilled fighter and is capable of fighting an opponent by looking at their feet alone."
		tier = 1
		canttier2 = 1
	Iwagakure_Kneading_Kinjutsu:
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has knowledge of the Iwagakure Kneading Kinjutsu, and is capable of kneading their chakra into different objects. When used in conjunction with clay artist and the explosion element, this character's abilities can mirror Deidara."
		tier = "Master"
	Juggler //Requires BFSW 1 or higher, Weapon Specialist, Hand Seal Speed 1 or higher, Reflex 1 or higher, Attack Speed 1 or higher
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is capable of shifting through throwing weapons instantly. He can also handle large weapons with much ease, making for a formidable ranged opponent."
		tier = 3
		canttier4 = 1
	Kabutowari_Proficiency // Requires 4 IC years of training with Kabutowari + BFSW 3
		icon = 'perks.dmi'
		icon_state = "ssm"
		description = "This character is proficient with the Kabutowari. He is capable of utilizing both weapons flawlessly, and can deliver blows with the weapon that can shatter most defenses."
		tier = "Master"
	Weaver
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is a tailor, and is capable of crafting unique clothing items with custom icons."
		tier = "Master"
	Katar_Proficiency// Requires 3 years IC training
		icon = 'perks.dmi'
		icon_state = "ssm"
		description = "This character is skilled with the use of katars, and other fist-blade weapons. They fight like experts with these weapons, and remove the dangers of self-harm."
		tier = "Master"
	Kiba_Blades_Proficiency//:
		icon = 'perks.dmi'
		icon_state = "ssm"
		description = "This character is highly proficient with the dreaded kiba blades. They are capable of wielding both with ease, and can use both like an expert."
		tier = "Master"

	Kubikirihoucho_Proficiency//:
		icon = 'perks.dmi'
		icon_state = "ssm"
		description = "This character is highly skilled with the Kubikiri Houcho, and can use the weapon to behead his opponents. He is capable of utilizing the weapon with a great deal of ferocity, leaving him feared on the battlefield."
		tier = "Master"
	Kusarigama_Proficiency//:
		icon = 'perks.dmi'
		icon_state = "ssm"
		description = "This character is skilled with the Kusarigama. They are capable of utilizing the weapon to its fullest potential, using both the weighted ball, the chain, and the scythe effectively, and without endangering themselves."
		tier = "Master"
	Magic_Box// Requires Kawarimi Mastered + Amplifier
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is capable of enhancing their kawarimi usage. They're capable of using two replacements, back to back without preparation for the second. When struck, they'll be replaced, and if struck a second time before they can recover, they are sent back to where they were originally. This ability can only be used every five turns."
		tier = "Master"
	Musician
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is talented with a musical instrument, and can use their instrument to channel their chakra. This opens a range of new possibilities for them as they can base their techniques on their music, allowing for new forms of ninjutsu and genjutsu."
		tier = "Master"
	Needles_of_Death// Requires Marksman and 5 Years IC training
		icon = 'perks.dmi'
		icon_state = "perk"
		description = " This character is capable of not only disabling their opponent with senbons by hitting pressure points on their body, but they are capable of throwing senbon with such force that it tears through the skin which can change them into a lethal weapon."
		tier = "Master"
	Nuibari_Proficiency // Requires BFSW 2 or higher + Nuibari IC training x 3 years
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is proficient with the Nuibari, allowing for skillful practice with the long thin blade, and even the thread that comes with it."
		tier = "Master"
	Numchaku_Proficiency // Requires Reflex + 2 years of IC training
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is highly proficient with numchaku, and are capable of utilizing it without injuring themselves."
		tier = "Master"
	Puppeteer_Tier_1 // Ranks up 3 times to Puppet Squadron
		icon = 'perks.dmi'
		icon_state = "puppet"
		description = "This character is well versed in puppetry, and can utilize ONE puppet effectively in combat and two outside of combat."
		tier = 1
		tier2descrip = "This character is well versed in puppetry, and can utilize TWO puppets effectively in combat and three outside of combat."
		tier2name = "Puppeteer Tier 2"
		tier3descrip = "This character is well versed in puppetry, and can utilize THREE puppets effectively in combat and four outside of combat."
		tier3name = "Puppeteer Tier 3"
		tier4descrip = "This character is well versed in puppetry, and can utilize FIVE puppets effectively in combat and numerous puppets outside of combat."
		tier4name = "Master Puppeteer"
		tier2state = "puppet"
		tier3state = "puppet"
		tier4state  = "puppet"
		cantmaster = 1
		giNin = 2.5
		giInt = 3
		giCon = 2.5

	Puppet_Squadron // Rankes up twice to Puppetry Human Performance
		icon = 'perks.dmi'
		icon_state = "puppet"
		description = "This character can utilize between 15 and 100 puppets in battle dependant upon jutsu the person utilizes."
		tier = 4
		cantmaster = 1
		giNin = 4.5
		giInt = 6
		giCon = 4.5

	Puppetry_Human_Performance
		icon = 'perks.dmi'
		icon_state = "puppet"
		description = "This character is skilled enough in puppetry to take control of human bodies, and utilize them in combat. This can be used on dead bodies to animate them in battle when the puppeteer has no more puppets, and can be used on the living so long as the puppeteer is skillful enough to work with the body of the person, or can overpower them. Alternatively, the target can work with the puppeteer, allowing for the puppeteer to aid the movements of the character."
		tier = "Master"

	Samehada_Proficiency // Requires Monstrous Chakra or Higher + 5 years of IC training with Samehada
		icon = 'perks.dmi'
		icon_state = "ssm"
		description = " This character is capable of utilizing the Samehada effectively. The Samehada also takes a liking to them, and not only gives them chakra, but allows them to hold it."
		tier = "Master"

	Shape_Training // Requires 2 years IC training
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has been trained to manipulate his chakra to modify the shape of it effectively for the usage of certain jutsu, and the creation of others."
		tier = 1
		canttier2 = 1
		giCon = 4
		giNin = 3
	Shibuki_Proficiency // Requires BFSW + 7 years IC Training ORRRR **HIDDEN REQUIREMENT** Creator of Sword Auto Gets Proficiency.
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is skilled with the Shibuki, and is capable of using the explosive prowess of the blade. They can also use the blade without harming themselves."
		tier = 1
		canttier2 = 1
	Staff_Pole_Proficiency //Requires 3 years IC training
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is proficient with the use of staves and poles, and can utilize both quickly, effectively, and like an expert."
		tier = "Master"
	Surgeon // Requires Medic Tier 3 + 4 years IC study
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The surgeon specializes in performing surgery on human subjects, and animal subjects. They are capable of modifying bodies through surgery, to reach most of the ends they desire."
		tier = 2
		canttier3 = 1
		giInt = 3
	Sensei
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This person is a teacher, they are capable of passing on their legacy, including higher ranked abilities, to three people in their lifetime. Students:"
		tier = 2
		canttier3 = 1
		giInt = 3


	Tailed_Beast_Skill // Requires Jinchuriki Pact
		icon = 'perks.dmi'
		icon_state = "Jin"
		description = "This character is a jinchuuriki, and has had the abilities of their bijuu melded with their owns. They are capable of utilizing special techniques unique to the bijuu themselves."
		tier = "Master"
	Tonfa_Proficiency // Requires 1 year IC training
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character is skilled with the usage of Tonfas, and can fight with great expertise whilst wielding them."
		tier = "Master"
	Transitionist // Requires 1.5 years training in switching + Reflex 1 or Higher
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The transitionist is capable of quickly switching between their techniques. They suffer no delay when switching between targets for the sake of jutsu usage, allowing for them to transition from target to target, and from jutsu to jutsu with ease."
		tier = 2
		canttier3 = 1
		giRef = 1.75
	One_Handed_Seals // Requires T3 Handseals
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This person is capable of creating and using one handed handseals."
		tier = 2
		canttier3 = 1
	Cleric
		name = "Cleric"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This individual is blessed by their faith with the ability to mend wounds. Their magic healing even the most dire of wounds, potentially. Injuries fade away under holy light, and prayer soothes pain into naught. This is not without price however, as a cleric usually lacks offensive ability. Still, they can heal on a level surpassing most normal methods and leave no scars behind. Cleric’s are not capable of using any scientific method of healing and reject medication and poisons."
		giChakra = 2500
		giCon = 2.5
	Crusader
		name = "Crusader"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This holy knight is a champion of their faith, and all they consider just in this world. They fight with righteous power and fury, empowered by their beliefs and religion to carry the fight against what they believe to be evil anywhere via melee weapons and taijutsu ability only. This class generally uses holy weapons as their light magic aid."
		tier = 1
		canttier2 = 1
		giDef = 4
	Exorcist
		name = "Exorcist"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This individual is specialized in the esoteric domain of using their holy gifts to halt the deviltry of others. Dispelling summoned beings of all kinds, destroying demons with a flick of the wrist, and sealing away monsters of all kinds. Against other human beings however, their abilities are.. limited to being able to destroy illusions such as clones and knocking Fuuinjutsu down a notch."
		tier = 1
		canttier2 = 1
		giInt = 3.5








	Dark_Summoner_Necromancer
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character practices the dark arts and has delved into the practice long enough to be able to beckon monsters from other realms for combat purposes. This person must chant for a single turn at the minimum to summon all creatures."
		tier = 1
		canttier2 = 1
		giInt = 2.5
		giCon = 1
	Magic_Specialist_Necromancer
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has amplified prowess with their Dark Arts, making them double in effectiveness against a heroic/good-natured opponent."
		tier = 1
		canttier2 = 1
		giNin = 2
		giCon = 2
		giInt = 0 //due to change soon.

	Dark_Bringer
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This character has amplified prowess with their Dark Arts, making them double in effectiveness against a heroic/good-natured opponent."
		tier = 1
		canttier2 = 1
	Soul_Reaper
		name = "Soul Reaper (Deathbringer)"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This Necromancer has plumbed the depths of darkness within their very soul- and have externalized their soul into a weapon suitable to their nature. They project this weapon with dark magic- then wield it skillfully. They may devour the souls of others to empower this weapon and gain new abilities, but if it is ever broken, they will meet with a terrible fate."
		tier = 1
		giCon = 2
		giTai = 2
	Gravity_Manipulator
		name = "Gravity Manipulator (Deathbringer)"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This Necromancer has paired their study of the discipline of affecting gravity with dark magic, with keen bladesmanship. They may use dark magic techniques that manipulate gravity and advance with swordsmanship techniques of various natures."
		tier = 1
		giCon = 2
		giTai = 2
	Curse_Specialist
		name = "Curse Specialist Necromancer"
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "This sick, twisted bastard specializes not in direct combat or summoning, but in afflicting others with false emotions, delusions, or general misfortune. In them is all the world's evils, waiting to be released via long, unwieldy incantations which take a full turn minimum to incant before any result occurs."
		tier = 1
		giInt = 2
		giCon = 1.5
	Vipers_Touch //Requires Poison Spec + 4 years IC training with poisons after reaching Poison Spec. Tier 3
		name = "Viper's Touch"
		icon = 'perks.dmi'
		icon_state = "poi"
		description = "This character is capable of applying a poison to another character with a touch, usually by bumping, or by placing a hand on them. The target would never know when, or who poisoned them unless the character with Viper's touch was high profile, or blatantly obvious."
		tier = "Master"
	Void_Blade_Proficiency
		icon = 'perks.dmi'
		icon_state = "ssm"
		description = "This character is fully capable of utilizing the Void blade, and its twisted power. This weapon will still always require two hands to wield."
		tier = "Master"
	Weapon_Smith
		icon = 'perks.dmi'
		icon_state = "ssm"
		description = "This character is a skilled blacksmith, and excels at the creation of weapons.	"
		tier = 1
		canttier2 = 1
		giInt = 2.75
	Zombification // Requires Surgeon, Geneticist, And a revival Jutsu
		icon = 'perks.dmi'
		icon_state = "perk"
		description = "The character with Zombification is capable of re-animating fresh dead bodies to serve them. The dead body is unable to regenerate, and actually deteriorates over time. Mostly found in Necromancers, these bodies retain their abilities and power, and fights onward as a drone. They have little care for their own safety, and fight until they can no longer move. Players are allowed to play their own zombies, but will be granted negative health regen."
		tier = 1
		canttier2 = 1
	Containment_Sealing
		icon = 'perks.dmi'
		icon_state = "seal"
		description = "This character is capable of applying seals to another person's body to impede the progress of an ailment, or power the person has. This does not work on things such as Kekkei Genkai, but it works on poisons, abilities like Curse Seal, and more. This in turn makes it harder to access their full power, but can also help them avoid the dangers of certain things."
		tier = 3
		tier4name = "Five Element Sealing"
		tier5name = "Masterful Sealing"
		tier4descrip = "This character is capable of applying seals to elemental chakra natures. This bars the use of one's chakra of a single nature, to all five natures. The more natures the seal blocks, the more chakra it takes to perform the seal, and the more preparation time as well. This can also block the power of a Jinchuuriki a great deal."
		tier5descrip = "This character has devoted their entire life to the arts of fuuinjutsu and has achieved a level of mastery like no other. The Master Sealer is capable of sealing a great number of weapons into a person's body, and enough weapons to supply a small army in a scroll or inanimate object. They can seal half of the average person's chakra, and up to three quarters of the average person's chakra with double the preparation. They are also capable of restricting the use of two elements on a single person. Masterful sealing also allows one to seal a large mass of chakra such as that of a Bijuu into a host.!"
		tier2state = "seal"
		tier3state = "seal"
		tier4state  = "seal"
		tier5state = "seal"
		cantmaster = 1
		giChakra = 500
		giNin = 3
		giInt = 3
		giCon = 3


	Basic_Sealing
		icon = 'perks.dmi'
		icon_state = "seal"
		description = "This character is capable of performing basic sealing techniques. They are capable of sealing a small number of weapons into scrolls and inanimate objects of suitable size, but not onto another organic being."
		tier = 1
		tier2descrip = "This character is capable of unique seals which allow them to store a moderate amount of weapons in scrolls and other inanimate objects. This character's seal take on the shape of lotus flowers when used to their full capacity, and they are capable of creating remote triggers with their seals for traps."
		tier2name = "Lotus Sealing "
		tier3descrip = "This character is capable of applying seals directly to the body of other beings which restrict one very specific thing from the person. This can range from a word, to a certain single action, or even the use of a certain body part. This however does not apply to jutsu, or the execution of jutsu. This seal can not be used to cut someone's chakra."
		tier3name = "ROOT Sealing"
		tier4descrip = "This character is skilled enough with sealing to seal a massive amount of weapons into a single scroll or object. They can seal a large number of weapons into a person's body, leaving seals grafted to one's skin permanently(even after the seal has been released), and even block one's ability to use up to one chakra nature, or just a bit of their chakra in general."
		tier4name = "Advanced Sealing"
		tier2state = "seal"
		tier3state = "seal"
		tier4state  = "seal"
		cantmaster = 1
		canttier5=1
		giChakra = 0
		giNin = 2
		giInt = 3
		giCon = 2

	Elemental_Training_Fire// - Tier 1; Levels up to Tier 4 Then turns into Fire Element Mastery
		icon = 'perks.dmi'
		icon_state = "kato"
		description = "This character has a very basic understanding of the Fire Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Fire Element and is capable of performing C ranked Katon Techniques and creating D-ranked techniques."
		tier2name = "Elemental Training Fire 2"
		tier3descrip = "This character has a great understanding of the Fire element and is capable of performing B ranked Katon techniques and is capable of creating C-ranked techniques."
		tier3name = "Elemental Training Fire 3"
		tier4descrip = "This character has near-mastery over the Fire element and can perform even A-ranked Techniques and is capable of creating B-ranked techniques."
		tier4name = "Elemental Training Fire 4"
		masterdescrip = "This character has mastery over the Fire element and can perform S-ranked Techniques with ease and is capable of creating any ranked Katon techniques."
		mastername = "Elemental Mastery Fire"
		tier2state = "kato"
		tier3state = "kato"
		tier4state = "kato"
		tier = 1
		canttier5 = 1

	Elemental_Training_Wind// - Tier 1; Levels up to Tier 4 Then turns into Fire Element Mastery
		icon = 'perks.dmi'
		icon_state = "fuu"
		description = "This character has a very basic understanding of the Wind Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Wind Element and is capable of performing C ranked Fuuton Techniques and creating D-ranked techniques."
		tier2name = "Elemental Training Wind 2"
		tier3descrip = "This character has a great understanding of the Wind element and is capable of performing B ranked Fuuton techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Wind 3"
		tier4descrip = "This character has near-mastery over the Wind element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Wind 4"
		masterdescrip = "This character has mastery over the Wind element and can perform S-ranked Techniques with ease and is capable of creating any ranked Fuuton technques."
		mastername = "Elemental Mastery Wind"
		tier2state = "fuu"
		tier3state = "fuu"
		tier4state = "fuu"
		tier = 1
		canttier5 = 1

	Elemental_Training_Lightning// - Tier 1; Levels up to Tier 4 Then turns into Fire Element Mastery
		icon = 'perks.dmi'
		icon_state = "raiton"
		description = "This character has a very basic understanding of the Lightning Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Lightning Element and is capable of performing C ranked Raiton Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Lightning 2"
		tier3descrip = "This character has a great understanding of the Lightning element and is capable of performing B ranked Raiton techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Lightning 3"
		tier4descrip = "This character has near-mastery over the Lightning element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Lightning 4"
		masterdescrip = "This character has mastery over the Lightning element and can perform S-ranked Techniques with ease and is capable of creating any ranked Raiton techniques."
		mastername = "Elemental Mastery Lightning"
		tier2state = "raiton"
		tier3state = "raiton"
		tier4state = "raiton"
		tier = 1
		canttier5 = 1

	Elemental_Training_Earth// - Tier 1; Levels up to Tier 4 Then turns into Fire Element Mastery
		icon = 'perks.dmi'
		icon_state = "doto"
		description = "This character has a very basic understanding of the Earth Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Earth Element and is capable of performing C ranked Doton Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Earth 2"
		tier3descrip = "This character has a great understanding of the Earth element and is capable of performing B ranked Doton techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Earth 3"
		tier4descrip = "This character has near-mastery over the Earth element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Earth 4"
		masterdescrip = "This character has mastery over the Earth element and can perform S-ranked Techniques with ease and is capable of creating any ranked Doton techniques."
		mastername = "Elemental Mastery Earth"
		tier2state = "doto"
		tier3state = "doto"
		tier4state = "doton"
		tier = 1
		canttier5 = 1

	Elemental_Training_Water// - Tier 1; Levels up to Tier 4 Then turns into Fire Element Mastery
		icon = 'perks.dmi'
		icon_state = "sui"
		description = "This character has a very basic understanding of the Water Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Water Element and is capable of performing C ranked Suiton Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Water 2"
		tier3descrip = "This character has a great understanding of the Water element and is capable of performing B ranked Suiton techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Water 3"
		tier4descrip = "This character has near-mastery over the Water element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Water 4"
		masterdescrip = "This character has mastery over the Water element and can perform S-ranked Techniques with ease and is capable of creating any ranked Suiton techniques."
		mastername = "Elemental Mastery Water"
		tier2state = "sui"
		tier3state = "sui"
		tier4state = "suiton"
		tier = 1
		canttier5 = 1

	Elemental_Training_Ice// - Tier 1; Levels up to Tier 4 Then turns into Fire Element Mastery
		icon = 'perks.dmi'
		icon_state = "Ice"
		description = "This character has a very basic understanding of the Ice Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Ice Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Ice 2"
		tier3descrip = "This character has a great understanding of the Ice element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Ice 3"
		tier4descrip = "This character has near-mastery over the Ice element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Ice 4"
		masterdescrip = "This character has mastery over the Ice element and can perform S-ranked Techniques with ease and is capable of creating any ranked Hyouton techniques."
		mastername = "Elemental Mastery Ice"
		tier2state = "Ice"
		tier3state = "Ice"
		tier4state = "Ice"
		tier = 1
		canttier5 = 1

	Elemental_Training_Boil// - Tier 1; Levels up to Tier 4 Then turns into Fire Element Mastery
		icon = 'perks.dmi'
		icon_state = "boil"
		description = "This character has a very basic understanding of the Boil Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Boil Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Boil 2"
		tier3descrip = "This character has a great understanding of the Boil element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Boil 3"
		tier4descrip = "This character has near-mastery over the Boil element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Boil 4"
		masterdescrip = "This character has mastery over the Boil element and can perform S-ranked Techniques with ease and is capable of creating any ranked Hyouton techniques."
		mastername = "Elemental Mastery Boil"
		tier2state = "boil"
		tier3state = "boil"
		tier4state = "boil"
		tier = 1
		canttier5 = 1

	Elemental_Training_Storm
		icon = 'perks.dmi'
		icon_state = "storm"
		description = "This character has a very basic understanding of the Storm Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Storm Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Storm 2"
		tier3descrip = "This character has a great understanding of the Storm element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Storm 3"
		tier4descrip = "This character has near-mastery over the Storm element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Storm 4"
		masterdescrip = "This character has mastery over the Storm element and can perform S-ranked Techniques with ease and is capable of creating any ranked Storm techniques."
		mastername = "Elemental Mastery Storm"
		tier2state = "storm"
		tier3state = "storm"
		tier4state = "storm"
		tier = 1
		canttier5 = 1

	Elemental_Training_Wood
		icon = 'perks.dmi'
		icon_state = "wood"
		description = "This character has a very basic understanding of the Wood Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Wood Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Wood 2"
		tier3descrip = "This character has a great understanding of the Wood element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Wood 3"
		tier4descrip = "This character has near-mastery over the Wood element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Wood 4"
		masterdescrip = "This character has mastery over the Wood element and can perform S-ranked Techniques with ease and is capable of creating any ranked Storm techniques."
		mastername = "Elemental Mastery Wood"
		tier2state = "wood"
		tier3state = "wood"
		tier4state = "wood"
		tier = 1
		canttier5 = 1

	Elemental_Training_Lava
		icon = 'perks.dmi'
		icon_state = "lava"
		description = "This character has a very basic understanding of the Lava Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Lava Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Lava 2"
		tier3descrip = "This character has a great understanding of the Lava element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Lava 3"
		tier4descrip = "This character has near-mastery over the Lava element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Lava 4"
		masterdescrip = "This character has mastery over the Lava element and can perform S-ranked Techniques with ease and is capable of creating any ranked Lava techniques."
		mastername = "Elemental Mastery Lava"
		tier2state = "lava"
		tier3state = "lava"
		tier4state = "lava"
		tier = 1
		canttier5 = 1

	Elemental_Training_Crystal
		icon = 'perks.dmi'
		icon_state = "crystal"
		description = "This character has a very basic understanding of the Crystal Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Crystal Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Crystal 2"
		tier3descrip = "This character has a great understanding of the Crystal element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Crystal 3"
		tier4descrip = "This character has near-mastery over the Crystal element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Crystal 4"
		masterdescrip = "This character has mastery over the Crystal element and can perform S-ranked Techniques with ease and is capable of creating any ranked Crystal techniques."
		mastername = "Elemental Mastery Crystal"
		tier2state = "crystal"
		tier3state = "crystal"
		tier4state = "crystal"
		tier = 1
		canttier5 = 1

	Elemental_Training_Magnetism
		icon = 'perks.dmi'
		icon_state = "magnet"
		description = "This character has a very basic understanding of the Magnetism Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Magnetism Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Magnetism 2"
		tier3descrip = "This character has a great understanding of the Magnetism element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Magnetism 3"
		tier4descrip = "This character has near-mastery over the Magnetism element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Magnetism 4"
		masterdescrip = "This character has mastery over the Magnetism element and can perform S-ranked Techniques with ease and is capable of creating any ranked Magnetism techniques."
		mastername = "Elemental Mastery Magnetism"
		tier2state = "magnet"
		tier3state = "magnet"
		tier4state = "magnet"
		tier = 1
		canttier5 = 1

	Elemental_Training_Dust
		icon = 'perks.dmi'
		icon_state = "dust"
		description = "This character has a very basic understanding of the Dust Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Dust Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Dust 2"
		tier3descrip = "This character has a great understanding of the Dust element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Dust 3"
		tier4descrip = "This character has near-mastery over the Dust element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Dust 4"
		masterdescrip = "This character has mastery over the Dust element and can perform S-ranked Techniques with ease and is capable of creating any ranked Dust techniques."
		mastername = "Elemental Mastery Dust"
		tier2state = "dust"
		tier3state = "dust"
		tier4state = "dust"
		tier = 1
		canttier5 = 1

	Elemental_Training_Blaze
		icon = 'perks.dmi'
		icon_state = "blaze"
		description = "This character has a very basic understanding of the Blaze Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Blaze Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Blaze 2"
		tier3descrip = "This character has a great understanding of the Blaze element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Blaze 3"
		tier4descrip = "This character has near-mastery over the Blaze element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Blaze 4"
		masterdescrip = "This character has mastery over the Blaze element and can perform S-ranked Techniques with ease and is capable of creating any ranked Blaze techniques."
		mastername = "Elemental Mastery Blaze"
		tier2state = "blaze"
		tier3state = "blaze"
		tier4state = "blaze"
		tier = 1
		canttier5 = 1

	Elemental_Training_Dark
		icon = 'perks.dmi'
		icon_state = "dark"
		description = "This character has a very basic understanding of the Dark Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Dark Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Dark 2"
		tier3descrip = "This character has a great understanding of the Dark element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Dark 3"
		tier4descrip = "This character has near-mastery over the Dark element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Dark 4"
		masterdescrip = "This character has mastery over the Dark element and can perform S-ranked Techniques with ease and is capable of creating any ranked Dark techniques."
		mastername = "Elemental Mastery Dark"
		tier2state = "dark"
		tier3state = "dark"
		tier4state = "dark"
		tier = 1
		canttier5 = 1

	Elemental_Training_Steel
		icon = 'perks.dmi'
		icon_state = "steel"
		description = "This character has a very basic understanding of the Steel Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Steel Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Steel 2"
		tier3descrip = "This character has a great understanding of the Steel element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Steel 3"
		tier4descrip = "This character has near-mastery over the Steel element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Steel 4"
		masterdescrip = "This character has mastery over the Steel element and can perform S-ranked Techniques with ease and is capable of creating any ranked Steel techniques."
		mastername = "Elemental Mastery Steel"
		tier2state = "steel"
		tier3state = "steel"
		tier4state = "steel"
		tier = 1
		canttier5 = 1

	Elemental_Training_Explosion
		icon = 'perks.dmi'
		icon_state = "explode"
		description = "This character has a very basic understanding of the Explosion Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Explosion Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Explosion 2"
		tier3descrip = "This character has a great understanding of the Explosion element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Explosion 3"
		tier4descrip = "This character has near-mastery over the Explosion element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Explosion 4"
		masterdescrip = "This character has mastery over the Explosion element and can perform S-ranked Techniques with ease and is capable of creating any ranked Explosion techniques."
		mastername = "Elemental Mastery Explosion"
		tier2state = "explode"
		tier3state = "explode"
		tier4state = "explode"
		tier = 1
		canttier5 = 1

	Elemental_Training_Swift
		icon = 'perks.dmi'
		icon_state = "swift"
		description = "This character has a very basic understanding of the Swift Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Swift Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Explosion 2"
		tier3descrip = "This character has a great understanding of the Swift element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Explosion 3"
		tier4descrip = "This character has near-mastery over the Swift element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Explosion 4"
		masterdescrip = "This character has mastery over the Swift element and can perform S-ranked Techniques with ease and is capable of creating any ranked Swift techniques."
		mastername = "Elemental Mastery Explosion"
		tier2state = "swift"
		tier3state = "swift"
		tier4state = "swift"
		tier = 1
		canttier5 = 1

	Elemental_Training_Scorch
		icon = 'perks.dmi'
		icon_state = "scorch"
		description = "This character has a very basic understanding of the Scorch Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Scorch Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Scorch 2"
		tier3descrip = "This character has a great understanding of the Scorch element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Scorch 3"
		tier4descrip = "This character has near-mastery over the Scorch element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Scorch 4"
		masterdescrip = "This character has mastery over the Scorch element and can perform S-ranked Techniques with ease and is capable of creating any ranked Scorch techniques."
		mastername = "Elemental Mastery Scorch"
		tier2state = "scorch"
		tier3state = "scorch"
		tier4state = "scorch"
		tier = 1
		canttier5 = 1

/*	Elemental_Training_Hero
		icon = 'perks.dmi'
		icon_state = "hero"
		description = "This character has a very basic understanding of the Hero Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Hero Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Hero 2"
		tier3descrip = "This character has a great understanding of the Hero element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Hero 3"
		tier4descrip = "This character has near-mastery over the Hero element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Hero 4"
		masterdescrip = "This character has mastery over the Hero element and can perform S-ranked Techniques with ease and is capable of creating any ranked Hero techniques."
		mastername = "Elemental Mastery Hero"
		tier2state = "hero"
		tier3state = "hero"
		tier4state = "hero"
		tier = 1
		canttier5 = 1

	Elemental_Training_Illusion
		icon = 'perks.dmi'
		icon_state = "illusion"
		description = "This character has a very basic understanding of the Illusion Element and is capable of performing D ranks with ease barely performing non-mastered C ranked techniques."
		tier = 1
		tier2descrip = "This character has a novice's understanding of the Illusion Element and is capable of performing C ranked Techniques and creating D-ranked techniques"
		tier2name = "Elemental Training Hero 2"
		tier3descrip = "This character has a great understanding of the Illusion element and is capable of performing B ranked techniques and creating C-ranked techniques."
		tier3name = "Elemental Training Hero 3"
		tier4descrip = "This character has near-mastery over the Illusion element and can perform even A-ranked Techniques and creating B-ranked techniques."
		tier4name = "Elemental Training Hero 4"
		masterdescrip = "This character has mastery over the Illusion element and can perform S-ranked Techniques with ease and is capable of creating any ranked Illusion techniques."
		mastername = "Elemental Mastery Hero"
		tier2state = "illusion"
		tier3state = "illusion"
		tier4state = "illusion"
		tier = 1
		canttier5 = 1 */

