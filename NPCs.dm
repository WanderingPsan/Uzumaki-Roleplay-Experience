mob/var/mob/Target

mob/proc/Mob_AI()
	if(monster)
		spawn while(src)
			if(name=="Guardian")
				if(!KO)
					if(!Target)
						for(var/mob/M in oview(3)) if(M.z==z&&!Target)
							Target=M
					if(Target)
						step_towards(src,Target)
						BunshinAttack()
						var/confirmtarget=0
						for(var/mob/M in oview(3))
							if(M.z==z&&Target==M)
								confirmtarget=1
								break
						if(!confirmtarget) Target=null
			else if(!KO)
				if(!Target)
					step_rand(src)
					for(var/mob/M in oview(6)) if(M.z==z&&!Target)
						Target=M
				if(Target)
					step_towards(src,Target)
					var/confirmtarget=0
					for(var/mob/M in oview(6))
						if(M.z==z&&Target==M)
							confirmtarget=1
							src.BunshinAttack()
							break
					if(!confirmtarget) Target=null
			if(Target) sleep(movespeed)
			else sleep(movespeed*rand(8,12))


mob/var
	movespeed=6
	movetimer
	monster=0
	hostile=0
mob/Enemy
	attackable=1
	monster=1
	KO=0
	move=1
	New()
		..()
		spawn Mob_AI()
		Strength*=rand(10,100)
		Agility*=rand(10,100)
		Offence*=rand(10,100)
		Defense*=rand(10,100)
		var/random158=rand(1,4)
		if(random158==1)
			src.overlays+='Hair_Villager.dmi'
			var/obj/A=new/obj/items/Clothing/Boots
			A.icon += rgb(0,0,50)
			src.overlays+=A
			src.overlays += A.icon
			var/obj/B=new/obj/items/Clothing/Jacket
			B.icon += rgb(150,0,0)
			src.overlays+=B
			src.overlays += B.icon
		if(random158==2)
			src.overlays+='Hair_Long.dmi'
			var/obj/A=new/obj/items/Clothing/Boots
			A.icon += rgb(150,0,0)
			src.overlays+=A
			src.overlays += A.icon
			var/obj/B=new/obj/items/Clothing/Female_Coat
			B.icon += rgb(204,51,102)
			src.overlays+=B
			src.overlays += B.icon
		if(random158==3)
			src.overlays+='Hair_Spikey2.dmi'
			var/obj/C=new/obj/items/Clothing/Long_Shoes
			C.icon += rgb(150,150,150)
			src.overlays+=C
			src.overlays += C.icon
			var/obj/A=new/obj/items/Clothing/Boots
			A.icon += rgb(0,0,0)
			src.overlays+=A
			src.overlays += A.icon
			var/obj/B=new/obj/items/Clothing/Coat
			B.icon += rgb(150,150,150)
			src.overlays+=B
			src.overlays += B.icon
		if(random158==4)
			src.overlays+='Clothing_Kimono.dmi'
			src.overlays+='Hair_Loose_Ponytail.dmi'
			var/obj/A=new/obj/items/Clothing/Shoes
			A.icon += rgb(0,0,50)
			src.overlays+=A
			src.overlays += A.icon
			var/obj/C=new/obj/items/Clothing/Pants
			C.icon += rgb(0,112,223)
			src.overlays+=C
			src.overlays += C.icon
			var/obj/B=new/obj/items/Clothing/Kimono
			B.icon += rgb(0,112,223)
			src.overlays+=B
			src.overlays += B.icon

	Villager
		icon='Villager.dmi'
		attackable=1
		monster=1
		Health=10
		MaxChakra=5
		Chakra=5
		Strength=3
		Agility=1
		Offence=15
		Defense=1
		Yen=100
		movespeed=2
		BunshinAttack()

mob/Guard/WanderingGuard
	New()
		name="Guard [RandomName()]"
		icon=pick('Base_Black.dmi','Base_FemaleBlack.dmi','Base_FemalePale.dmi','Base_FemaleTan.dmi','Base_FemaleWhite.dmi','Base_Pale.dmi','Base_Tan.dmi','Base_White.dmi')
		spawn()src.Wander(2)
		spawn()src.AddHair()
		spawn()src.AddGuardOverlays()
		spawn()src.Guard_AI()
		..()
	attackable=1
	move=1
	Chakra=150
	MaxChakra=150
	Stamina=200
	Strength=150
	Agility=300
	Defense=150
	Offence=200
	Control=200
	Resistance=200
	Ninjutsu=80
	Genjutsu=80
	Taijutsu=80
	Health=1000
	MaxHealth=1000
	monster=1
	Village="None"

mob/Guard/StantionaryGuard
	New()
		name="Guard [RandomName()]"
		icon=pick('Base_Black.dmi','Base_FemaleBlack.dmi','Base_FemalePale.dmi','Base_FemaleTan.dmi','Base_FemaleWhite.dmi','Base_Pale.dmi','Base_Tan.dmi','Base_White.dmi')
		spawn()src.AddHair()
		spawn()src.AddGuardOverlays()
		spawn()src.Guard_AI()
		..()
	attackable=1
	move=1
	Chakra=500
	MaxChakra=500
	Stamina=500
	Strength=500
	Agility=500
	Defense=500
	Offence=500
	Control=500
	Resistance=500
	Ninjutsu=500
	Genjutsu=500
	Taijutsu=500
	Health=2500
	MaxHealth=2500
	monster=1
	Village="None"



mob/proc/Guard_AI()
	set background=1
	while(src)
		if(prob(5))
			src.Health+=src.MaxHealth/1
			if(src.Health>src.MaxHealth)
				src.Health=src.MaxHealth
		if(src.hostile==0)
			if(src.Health/MaxHealth < 0.9)
				hostile=1
				world<<"<font color=red>Village Information:<font color=#FFCC11> [src.Village] is under attack!"
			sleep(60)
		else
			for(var/mob/M in oview(10))
				if(src.Village!=M.Village)
					if(!src.KO)
						if(!src.Target)
							if(M.z==src.z&&!src.Target)
								Target=M
						if(Target)
							step_towards(src,src.Target)
							BunshinAttack()
							var/confirmtarget=0
							if(M.z==src.z&&src.Target==M)
								confirmtarget=1
								break
							if(!confirmtarget) src.Target=null
				if(src.Target) sleep(src.movespeed)
				else sleep(src.movespeed*rand(8,12))


mob/Villager
	New()
		name=RandomName()
		icon=pick('Base_Black.dmi','Base_FemaleBlack.dmi','Base_FemalePale.dmi','Base_FemaleTan.dmi','Base_FemaleWhite.dmi','Base_Pale.dmi','Base_Tan.dmi','Base_White.dmi')
		spawn()src.Wander(1)
		spawn()src.AddHair()
		spawn()src.AddOverlays()
		..()
	attackable=1
	move=1
	Chakra=5
	MaxChakra=5
	Stamina=100
	Strength=4
	Agility=4
	Defense=5
	Offence=6
	Control=4
	Resistance=4
	Ninjutsu=1
	Genjutsu=1
	Taijutsu=5
	Health=100
	MaxHealth=100

proc/RandomName()
	var/WTF=pick("Bob","John","Michael","Maya","Sayara","Mina","Honda","Hanzo","Zack","George","Michelle","Leo","Ven","Kira","Tilk","Teala","Mishy","Niss","Jay","Vagou","Danny","Gabriel","Esperanza","Nathaniel","Chris","Isaiah","Ian","Marshal","Wayne","Sean","Jean","Joey","Laura","Kiki","Coco","Kairi","Mengst","Kerry","Tim","Jamal","Timothy","Riesa","Rita","Karl","Carter","Jackie","Louis","Peter","Meg","Saiza","Mariah","Marsha","Dorris","Hezekaiah","Zen","Darrel","Mike","Vincent","Yuffie","Ayame","Kasumi","Tina","Nirithia","Titania","Odyssia","Bobby","Jesse","Jessica","Shaquana-leesha","Shanequa","Sara","Sarah","Paul","Amanda","Frank","Sora","Jaquelin","Kim","Kimmy","Pajamay","Niri","Hawthorne","Melanie","Jose","Jaze","Cerulean","Nick","James","Kadeem","Jack","Dave","David","Jackson","Clark","Kent","Mobey","Obi","Obey","Tazz","Raphael","Angelo","Leonardo","Donny","Donotello","Rad","Jamel","Krystie","Krystyna","Brittney","Lolli","Lily","Pedal","Sylvan","Tyri","Marsai","Kai","Koga","Rave","Raven","Robin","Strinn","Aeol","Zack","Rick","Ricky","Tifa","Reno","Tareno","Barret","Chip","Dale","Mirazoka","Peach","Gisae","Crystal","Mary","Marie","Melinda","Desiree","Caroll","Carrol","Faith","Dianna","Ray","Tyson","Max","Maximus","Keith","Cherish","Dijonae","Karina","Tyrell","Turell","Lee","Antonyo","Erik","Eryk","Eric","Elric","Alphonse","Al","Jon","Jones","Nala","Nahla","Nayla","Ysera","Alex","Alexander","Alexis","Alexa","Li","Jade","Ruby","Rubee","Saphire","Tae","Tita","Tristan","Isolde","Mark","Macho","Julio","Priscilla","Naomi","Cynthia","Milly","Nelly","Sabrina","Wilma","Jen","Jennifer","Giselle","Hara","Monica","Monique","Shaquille","Desmond","Allejulah","Vonz","Rebekah","Rebecca","Sanchez","Saneria","Carlos")
	return WTF
mob/proc
	Wander(var/Type)
		set background=1
		if(Type == 1)
			while(src)
				step_rand(src)
				var/Person="<b>[src.name]:</b>"
				for(var/mob/M in viewers(10))
					if(M.client&&prob(30))
						if(src.WHO)
							if(!(src.WHO.Find(M.ckey)))
								var/GreetingMessage=pick("Hello [M]!","Sup?","Hi.","Hey.","Wassup'!?","How are you?","How's it going?","Hey, my name's [src.name].","Hey, the name's [src.name].","What's your name?","Hi, my name is [src.name].","What're you doing around here?","We don't like your kind around here.","....","What're you lookin' at?","Why are you looking at me?","Did you want something?","I hear things are bad out at night, I wouldn't know. I'm too scared to go out around then!","You know… I dropped something around here the other day.","I hope she sends me mail!","I hope he sends me mail!","I wonder if they're thinking about me right now","I love her. I lo- Huh?! Oh, what are you doing here?","Look at this chump.","Anyone ever notice the baby boom around here?","Ninja's Yuk!","Ninjas don't bring anything but conflict!","Fighting doesn't solve anything.","Fighting is the only way to solve problems now'a'days.","I'm going to be an awesome ninja one day!","I'm going to be the Kage!","One day. One day you'll all see!","You'll all be sorry. Watch. All of you will be sorry.","You know that the human body can barely survive with five pints of blood. Right? Heheha","I just got a new blade!","My dad is the best ninja ever!","My dad is the best!","You seen my mom?","I wonder if I have a chance","Just put that there Cut th- Oh, hey."," Psst, come here Interested in a bit of 'Stuff'?","Hey, like what you see?","I never wanted this.","Another day, another dollar.","God… Work is so lame!","Babies. The lot of you.","Another pathetic guy.","I'm never dating another guy again!","I'm never dating another girl again!","You got a problem punk?!","The kage is horrible! The village is going downhill quick!","The Kage does such a great job, life is great!","Peace and prosperity. If only it would last.","Down with the Kage!","The Kage only brings trouble. We have to get rid of him.","The Kage, just like every other ninja, is destroying peace!","The Kage is great, those fanatics don't know what they're talking about.","The darkest place is inside a person's heart.","You never know what you got until its gone.")
								viewers(10) << "[Person] [GreetingMessage]"
								src.WHO+=M.ckey
								spawn(rand(1000,4000))src.WHO-=M.ckey
						else
							var/GreetingMessage=pick("Hello [M]!","Sup?","Hi.","Hey.","Wassup'!?","How are you?","How's it going?","Hey, my name's [src.name].","Hey, the name's [src.name].","What's your name?","Hi, my name is [src.name].","What're you doing around here?","We don't like your kind around here.","....","What're you lookin' at?","Why are you looking at me?","Did you want something?","I hear things are bad out at night, I wouldn't know. I'm too scared to go out around then!","You know… I dropped something around here the other day.","I hope she sends me mail!","I hope he sends me mail!","I wonder if they're thinking about me right now","I love her. I lo- Huh?! Oh, what are you doing here?","Look at this chump.","Anyone ever notice the baby boom around here?","Ninja's Yuk!","Ninjas don't bring anything but conflict!","Fighting doesn't solve anything.","Fighting is the only way to solve problems now'a'days.","I'm going to be an awesome ninja one day!","I'm going to be the Kage!","One day. One day you'll all see!","You'll all be sorry. Watch. All of you will be sorry.","You know that the human body can barely survive with five pints of blood. Right? Heheha","I just got a new blade!","My dad is the best ninja ever!","My dad is the best!","You seen my mom?","I wonder if I have a chance","Just put that there Cut th- Oh, hey."," Psst, come here Interested in a bit of 'Stuff'?","Hey, like what you see?","I never wanted this.","Another day, another dollar.","God… Work is so lame!","Babies. The lot of you.","Another pathetic guy.","I'm never dating another guy again!","I'm never dating another girl again!","You got a problem punk?!","The kage is horrible! The village is going downhill quick!","The Kage does such a great job, life is great!","Peace and prosperity. If only it would last.","Down with the Kage!","The Kage only brings trouble. We have to get rid of him.","The Kage, just like every other ninja, is destroying peace!","The Kage is great, those fanatics don't know what they're talking about.","The darkest place is inside a person's heart.","You never know what you got until its gone.")
							viewers(10) << "[Person] [GreetingMessage]"
							src.WHO+=M.ckey
							spawn(rand(1000,4000))src.WHO-=M.ckey
				sleep(rand(20,60))
		if(Type == 2)
			while(src)
				if(src.hostile!=1)
					step_rand(src)
					for(var/mob/M in viewers(10))
						if(M.client&&prob(30))
							if(src.WHO)
								if(!(src.WHO.Find(M.ckey)))
									var/Person="<b>[src.name]:</b>"
									var/GreetingMessage=pick("... Watch yourself... People are savages...","...If you wanna get out alive... Run for you life.","You can die in a second, anything more is a luxury.","I carry many knives...","How many pints of blood does it take for someone to die...? Want to find out?","...","If you take another step, you're liable to stop breathing.","Move along.","Don't piss me off!","Pathetic...","You picked the wrong day.","Move it!","Fool!","I hate cowards.","A scream sounds the same in every language.","How many cries could a blonde girl cry, if a blond girl had her throat cut...?","Anyone hear about that Darkness? He hasn't called me back in a while.","Man... Kage's fuckin' up lately.","I hate serving this pathetic place... These pathetic... People.","Only the strong survive!","I can see your future... And all I see is a bag.","The most frightening name you'll ever know is Wynn.","From the day you were born... Killing was your instinct to live!")
									viewers(10) << "[Person] [GreetingMessage]"
									src.WHO+=M.ckey
									spawn(rand(1000,4000))src.WHO-=M.ckey
							else
								var/Person="<b>[src.name]:</b>"
								var/GreetingMessage=pick("... Watch yourself... People are savages...","...If you wanna get out alive... Run for you life.","You can die in a second, anything more is a luxury.","I carry many knives...","How many pints of blood does it take for someone to die...? Want to find out?","...","If you take another step, you're liable to stop breathing.","Move along.","Don't piss me off!","Pathetic...","You picked the wrong day.","Move it!","Fool!","I hate cowards.","A scream sounds the same in every language.","How many cries could a blonde girl cry, if a blond girl had her throat cut...?","Anyone hear about that Darkness? He hasn't called me back in a while.","Man... Kage's fuckin' up lately.","I hate serving this pathetic place... These pathetic... People.","Only the strong survive!","I can see your future... And all I see is a bag.","The most frightening name you'll ever know is Wynn.","From the day you were born... Killing was your instinct to live!")
								viewers(10) << "[Person] [GreetingMessage]"
								src.WHO+=M.ckey
								spawn(rand(1000,4000))src.WHO-=M.ckey
				sleep(rand(20,60))

mob/proc/AddHair()
	var/obj/Hairz=new/obj/
	Hairz.icon=pick('Hair_Bowl.dmi','Hair_Hinata.dmi','Hair_Choji.dmi','Hair_Villager.dmi','Hair_Juugo.dmi','Tsunade.dmi','Hair_Kakashi.dmi','Hair_Kisame.dmi','Hair_Short.dmi','Hair_Chiyo.dmi','Jiraiya.dmi','Hair_Emo.dmi','Hair_Wild.dmi','Hair_Loose_Ponytail.dmi','Hair_Long.dmi','Hair_Little.dmi','Hair_Ponytail.dmi','Hair_Sakura.dmi','Hair_Sasuke.dmi','Hair_Naruto.dmi','Hair_Spikey.dmi','Hair_Spikey2.dmi','Hair_Spikey3.dmi','Hair_Topknot.dmi','Hair_Tenten.dmi','Hair_Mohawk.dmi','Afro.dmi','Hair_Crazy-Afro.dmi','Hair_Crazy.dmi','Hair_Untidy.dmi')
	Hairz.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
	src.overlays+=Hairz.icon
mob/proc/AddOverlays()
	var/obj/A
	var/obj/B
	var/obj/C
	var/obj/D
	var/obj/E
	var/R=rand(1,3)
	var/RM=rand(1,4)
	if(R==1)
		A = new/obj/items/Clothing/Robe
	if(R==2)
		var/RA=rand(1,7)
		if(RA==1)
			A=new/obj/items/Clothing/Jacket
		if(RA==2)
			A=new/obj/items/Clothing/Sleeveless_Jacket
		if(RA==3)
			A=new/obj/items/Clothing/Long_Sleeved_Shirt
		if(RA==4)
			A=new/obj/items/Clothing/Vest
		if(RA==5)
			A=new/obj/items/Clothing/Coat
		if(RA==6)
			A=new/obj/items/Clothing/Female_Coat
		if(RA==7)
			A=new/obj/items/Clothing/Shirt
		if(prob(60))
			var/LOL=rand(1,3)
			if(LOL==1)
				B=new/obj/items/Clothing/Shoes
			if(LOL==2)
				B=new/obj/items/Clothing/Boots
			if(LOL==3)
				B=new/obj/items/Clothing/Long_Shoes
		if(prob(60))
			var/LOL=rand(1,3)
			if(LOL==1)
				C=new/obj/items/Clothing/Slash
			if(LOL==2)
				C=new/obj/items/Clothing/Belt
		if(prob(80))
			var/LOL=rand(1,2)
			if(LOL==1)
				E=new/obj/items/Clothing/Pants
			if(LOL==2)
				E=new/obj/items/Clothing/Shorts
	if(R==3)
		A=new/obj/items/Clothing/Kimono
	if(RM==1)
		D=new/obj/items/Clothing/Facemask
	if(RM==2)
		D=new/obj/items/Clothing/Backwards_Scarf
	if(RM==3)
		D=new/obj/items/Clothing/Scarf
	if(RM==4)
		D=new/obj/items/Clothing/Gloves
	if(A.icon)
		A.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
		src.overlays+=A.icon
	if(B.icon)
		B.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
		src.overlays+=B.icon
	if(C.icon)
		C.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
		src.overlays+=C.icon
	if(D.icon)
		D.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
		src.overlays+=D.icon
	if(E.icon)
		E.icon += rgb(rand(1,80),rand(1,80),rand(1,80))
		src.overlays+=E.icon



mob/proc/AddGuardOverlays()
	var/obj/I
	var/obj/H
	var/RI=rand(1,3)
	if(RI==1)
		I=new/obj/items/Clothing/Leaf_Jounin
	if(RI==2)
		I=new/obj/items/Clothing/Suna_Jounin
	if(RI==3)
		I=new/obj/items/Clothing/Mist_Jounin
	var/RH=rand(1,3)
	if(RH==1)
		H=new/obj/items/Clothing/Leaf_Chuunin
	if(RH==2)
		H=new/obj/items/Clothing/Suna_Chuunin
	if(RH==3)
		H=new/obj/items/Clothing/Mist_Chuunin
	src.overlays+=I.icon
	src.overlays+=H.icon
	var/obj/N=new/obj/items/Clothing/Holster
	src.overlays+=N.icon
	var/obj/WTF=new/obj/items/Clothing/LeafHeadband
	src.overlays+=WTF.icon

mob/NPC
	Medical_Supplier
		icon = 'NPCs.dmi'
		icon_state="Medic"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What can I help you with?") in list ("Genetics","Medicine","Cancel"))
				if("Genetics")
					if(!locate(/obj/Perk/Geneticist) in usr.contents)
						usr<<"You're not a geneticist."
						return
					switch(input("What would you like to buy?") in list("Splicer",/*"Combiner"*/,"Computer","Cancel"))
						if("Splicer")
							if(usr.Yen>=50000)
								usr.Yen-=50000
								var/obj/A = new/obj/items/Citem/tools/Gene_Splicer
								usr.contents+=A
							else
								usr<<"You don't have enough money. Cash: [usr.Yen] Price: 50,000 Difference: [50000-usr.Yen]"
						if("Computer")
							if(usr.Yen>=75000)
								usr.Yen-=75000
								var/obj/A = new/obj/items/Citem/tools/Genetics_Computer
								usr.contents+=A
							else
								usr<<"You don't have enough money. Cash: [usr.Yen] Price: 75,000 Difference: [75000-usr.Yen]"

		//				if("Combiner")
		//					if(usr.Yen>=100000)
		//						usr.Yen-=100000
		//						var/obj/A = new/obj/items/Citem/tools/Gene_Combiner
		//						usr.contents += A
		//					else
		//						usr<<"You don't have enough money. Cash: [usr.Yen] Price: 100,000 Difference: [100000-usr.Yen]"

				if("Medicine")
					switch(input("What would you like to buy?") in list("Healing Pills","Cold and Flu","Cancel"))
						if("Cold and Flu")
							if(usr.Yen >= 1750)
								usr.Yen -= 1750
								var/obj/A = new/obj/items/Medicine/Cold_And_Flu
								usr.contents += A
								usr.contents += A
							else
								usr<<"You don't have enough money. Cash: [usr.Yen] Price: 1750 Difference: [1500-usr.Yen]"
						if("Healing Pills")
							if(usr.Yen >= 1500)
								usr.Yen -= 1500
								var/obj/A = new/obj/items/Medicine/Healing_Pill
								usr.contents += A
								usr.contents += A
							else
								usr<<"You don't have enough money. Cash: [usr.Yen] Price: 1500 Difference: [1500-usr.Yen]"



	Shopkeeper
		icon='NPCs.dmi'
		icon_state="Shop"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What can i help you with?") in list ("Clothes","Scrolls","Seeds","Nothing"))
				if("Seeds")
					switch(input("What kind of seeds?") in list("Carrot","Tomato","Turnip","Cabbage","Potato","Cancel"))
						if("Carrot")
							if(usr.Yen >= 200)
								usr.Yen-=200
								usr.contents += new/obj/items/Citem/Seed_Bag/Carrot_Seeds
							else
								usr<<"You need 200 Yen for that."
						if("Tomato")
							if(usr.Yen >= 200)
								usr.Yen-=200
								usr.contents += new/obj/items/Citem/Seed_Bag/Tomato_Seeds
							else
								usr<<"You need 200 Yen for that."

						if("Turnip")
							if(usr.Yen >= 200)
								usr.Yen-=200
								usr.contents += new/obj/items/Citem/Seed_Bag/Turnip_Seeds
							else
								usr<<"You need 200 Yen for that."

						if("Cabbage")
							if(usr.Yen >= 200)
								usr.Yen-=200
								usr.contents += new/obj/items/Citem/Seed_Bag/Cabbage_Seeds
							else
								usr<<"You need 200 Yen for that."

						if("Potato")
							if(usr.Yen >= 350)
								usr.Yen-=350
								usr.contents += new/obj/items/Food/Potato
							else
								usr<<"You need 350 Yen for that."
				if("Clothes")
					switch(input("What would you like to buy?") in list (/*"Weights",*/"Shorts","Belt","Slash","Holster","Boots","Cloak","Coat","Sleeveless Jacket","Jacket","Robe","Facemask","Female Coat","Kimono","Gloves","Long Sleeved Shirt","Pants","Scarf","Backwards Scarf","Shirt","Shoes","Long Shoes","Vest","Backpouch","Cancel"))
						if("Backpouch")
							if(usr.Yen>=150)
								usr.Yen-=150
								var/obj/A = new/obj/items/Citem/tools/Backpouch
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Cloak")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Cloak
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Robe")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Robe
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Jacket")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Jacket
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Sleeveless Jacket")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Sleeveless_Jacket
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Facemask")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Facemask
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Long Sleeved Shirt")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Long_Sleeved_Shirt
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Gloves")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Gloves
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Holster")
							if(usr.Yen>=5)
								usr.Yen-=5
								var/obj/A = new/obj/items/Clothing/Holster
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Vest")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Vest
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Belt")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Belt
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Slash")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Slash
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Coat")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Coat
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Female Coat")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Female_Coat
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Kimono")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Kimono
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Pants")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Pants
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Scarf")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Scarf
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Backwards Scarf")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Backwards_Scarf
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Shirt")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Shirt
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Shoes")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Shoes
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Long Shoes")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Long_Shoes
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Shorts")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Shorts
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Boots")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Boots
								A.icon += input("Please choose a color") as color
								usr.contents+=A
				if("Scrolls")
					switch(input("What would you like to buy?") in list ("Messenger Bird","Empty Scroll","Cancel"))
						if("Empty Scroll")
							if(usr.Yen>=50)
								usr.Yen-=50
								var/obj/A = new/obj/items/Scrolls/Scroll
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Messenger Bird")
							if(usr.Yen>=5500)
								usr.Yen-=5500
								var/obj/A = new/obj/items/Citem/tools/Messenger_Bird
								A.icon += input("Please choose a color") as color
								usr.contents+=A
							else
								usr<<"That costs 2500."


mob/NPC
	Suna_Shopkeeper
		icon='NPCs.dmi'
		icon_state="Suna2"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What can i help you with?") in list ("Clothes","Scrolls","Nothing"))
				if("Clothes")
					switch(input("What would you like to buy?") in list (/*"Weights",*/"Suna Cloak","Suna Head Scarf","Shorts","Belt","Slash","Holster","Boots","Cloak","Coat","Sleeveless Jacket","Jacket","Robe","Facemask","Female Coat","Kimono","Gloves","Long Sleeved Shirt","Pants","Scarf","Backwards Scarf","Shirt","Shoes","Long Shoes","Vest","Cancel"))
						if("Suna Cloak")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Suna_Cloak
								usr.contents+=A
						if("Suna Head Scarf")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Suna_Head_Scarf
								usr.contents+=A
						if("Cloak")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Cloak
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Robe")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Robe
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Jacket")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Jacket
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Sleeveless Jacket")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Sleeveless_Jacket
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Facemask")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Facemask
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Long Sleeved Shirt")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Long_Sleeved_Shirt
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Gloves")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Gloves
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Holster")
							if(usr.Yen>=5)
								usr.Yen-=5
								var/obj/A = new/obj/items/Clothing/Holster
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Vest")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Vest
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Belt")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Belt
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Slash")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Slash
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Coat")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Coat
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Female Coat")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Female_Coat
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Kimono")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Kimono
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Pants")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Pants
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Scarf")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Scarf
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Backwards Scarf")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Backwards_Scarf
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Shirt")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Shirt
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Shoes")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Shoes
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Long Shoes")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Long_Shoes
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Shorts")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Shorts
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Boots")
							if(usr.Yen>=10)
								usr.Yen-=10
								var/obj/A = new/obj/items/Clothing/Boots
								A.icon += input("Please choose a color") as color
								usr.contents+=A
				if("Scrolls")
					switch(input("What would you like to buy?") in list ("Empty Scroll","Puppet Scroll","Cancel"))
						if("Empty Scroll")
							if(usr.Yen>=50)
								usr.Yen-=50
								var/obj/A = new/obj/items/Scrolls/Scroll
								A.icon += input("Please choose a color") as color
								usr.contents+=A
						if("Puppet Scroll")
							if(usr.Yen > 2500)
								usr.Yen-= 2500
								var/obj/A = new/obj/items/Scrolls/Puppet_Scroll
								A.icon += input("Please choose a color for your puppet's scroll") as color
								usr.contents += A


	Weapon_Supplier
		icon='NPCs.dmi'
		icon_state="Weapon"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What would you like to buy?") in list ("Tanto","Kunai","Senbon","Shuriken","Explosive Tag","Windmill","Giant Shuriken",/*"Training Log",*/"Cancel"))
				if("Tanto")
					if(usr.Yen>=300)
						usr.Yen-=300
						var/obj/A = new/obj/items/Weapon/Tanto
						usr.contents+=A
					else
						usr << "Tanto's cost 300 Yen!"
				if("Kunai")
					if(usr.Yen>=15)
						usr.Yen-=15
						var/obj/A = new/obj/items/Weapon/Kunai
						usr.contents+=A
					else
						usr << "Kunai's cost 15 Yen!"
				if("Explosive Tag")
					if(usr.Yen>=50)
						usr.Yen-=50
						var/obj/A = new/obj/items/Weapon/Explosive_Tag
						usr.contents+=A
					else
						usr << "Explosive Tag's cost 50 Yen!"
				/*if("Training Log")
					if(usr.Yen>=250)
						usr.Yen-=250
						var/obj/A = new/obj/items/Weapon/Log
						usr.contents+=A
					else
						usr << "Log's cost 250 Yen!"*/

				if("Soldier Pill")
					if(usr.Yen>=50)
						usr.Yen-=50
						var/obj/A = new/obj/items/Medicine/Soldier_Pill
						usr.contents+=A
					else
						usr << "Soldier Pill's cost 50 Yen!"

				if("Senbon")
					if(usr.Yen>=5)
						usr.Yen-=5
						var/obj/A = new/obj/items/Weapon/Senbon
						var/amount = input("How many would you like to purchase?\n(An extra 5 yen is required per Senbon)") as num
						amount = amount*5
						if(amount<=0)
							return
						if(amount<=usr.Yen)
							usr.Yen -= amount
							amount = amount/5
							A:senbon = amount
						usr.contents+=A
						A.suffix = "You current have [A:senbon] in this stack"
					else
						usr << "Senbon's cost 5 Yen!"

				if("Shuriken")
					if(usr.Yen>=10)
						usr.Yen-=10
						var/obj/A = new/obj/items/Weapon/Shuriken
						var/amount = input("How many would you like to purchase?\n(An extra 5 yen is required per Shuriken)") as num
						amount = amount*5
						if(amount<=0)
							return
						if(amount<=usr.Yen)
							usr.Yen -= amount
							amount = amount/5
							A:shuriken = amount
						usr.contents+=A
						A.suffix = "You current have [A:shuriken] in this stack"
					else
						usr << "Shuriken's cost 10 Yen!"

				if("Giant Shuriken")
					if(usr.Yen>=200)
						usr.Yen-=200
						var/obj/A = new/obj/items/Weapon/Giant_Shuriken
						usr.contents+=A
					else
						usr << "Giant Shuriken's cost 200 Yen!"

				if("Windmill")
					if(usr.Yen>=150)
						usr.Yen-=150
						var/obj/A = new/obj/items/Weapon/Windmill
						usr.contents+=A
					else
						usr << "Windmill's cost 150 Yen!"

	Suna_Weapon_Supplier
		icon='NPCs.dmi'
		icon_state="Suna"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What would you like to buy?") in list ("Tanto","Kunai","Shuriken","Explosive Tag","Poison Bomb",/*"Puppet Scroll"*//*"Training Log",*/"Cancel"))
				if("Tanto")
					if(usr.Yen>=300)
						usr.Yen-=300
						var/obj/A = new/obj/items/Weapon/Tanto
						usr.contents+=A
					else
						usr << "Tanto's cost 300 Yen!"
				if("Kunai")
					if(usr.Yen>=15)
						usr.Yen-=15
						var/obj/A = new/obj/items/Weapon/Kunai
						usr.contents+=A
					else
						usr << "Kunai's cost 15 Yen!"
				if("Explosive Tag")
					if(usr.Yen>=50)
						usr.Yen-=50
						var/obj/A = new/obj/items/Weapon/Explosive_Tag
						usr.contents+=A
					else
						usr << "Explosive Tag's cost 50 Yen!"

				/*if("Puppet Scroll")
					if(usr.Yen>=2000)
						usr.Yen-=2000
						var/obj/A = new/obj/items/Scrolls/Puppet_Scroll
						usr.contents+=A
					else
						usr << "Puppet Scroll's cost 2000 Yen!"*/

				/*if("Training Log")
					if(usr.Yen>=250)
						usr.Yen-=250
						var/obj/A = new/obj/items/Weapon/Log
						usr.contents+=A
					else
						usr << "Log's cost 250 Yen!"*/

				if("Poison Bomb")
					if(usr.Yen>=50)
						usr.Yen-=50
						var/obj/A = new/obj/items/Weapon/Poison_Bomb
						usr.contents+=A
					else
						usr << "Poison's cost 50 Yen!"

				if("Senbon")
					if(usr.Yen>=5)
						usr.Yen-=5
						var/obj/A = new/obj/items/Weapon/Senbon
						var/amount = input("How many would you like to purchase?\n(An extra 5 yen is required per Senbon)") as num
						amount = amount*5
						if(amount<=0)
							return
						if(amount<=usr.Yen)
							usr.Yen -= amount
							amount = amount/5
							A:senbon = amount
						usr.contents+=A
						A.suffix = "You current have [A:senbon] in this stack"
					else
						usr << "Senbon's cost 5 Yen!"

				if("Shuriken")
					if(usr.Yen>=10)
						usr.Yen-=10
						var/obj/A = new/obj/items/Weapon/Shuriken
						var/amount = input("How many would you like to purchase?\n(An extra 5 yen is required per Shuriken)") as num
						amount = amount*5
						if(amount<=0)
							return
						if(amount<=usr.Yen)
							usr.Yen -= amount
							amount = amount/5
							A:shuriken = amount
						usr.contents+=A
						A.suffix = "You current have [A:shuriken] in this stack"
					else
						usr << "Shuriken's cost 10 Yen!"


	Flower_Seller
		icon='NPCs.dmi'
		icon_state="Flower"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What would you like to buy?") in list ("Natsu Top","Bra","Natsu Bottoms",/*"Eye Wrap",*/"Cancel"))
				if("Natsu Top")
					if(usr.Yen>=30)
						usr.Yen-=30
						var/obj/A = new/obj/items/Clothing/Natsu_Top
						usr.contents+=A
				if("Natsu Bottoms")
					if(usr.Yen>=30)
						usr.Yen-=30
						var/obj/A = new/obj/items/Clothing/Natsu_Bottoms
						usr.contents+=A
			//	if("Eye Wrap")
			//		if(usr.Yen>=10)
			//			usr.Yen-=10
			//			var/obj/A = new/obj/items/Clothing/Eye_Wrap
			//			usr.contents+=A
				if("Bra")
					if(usr.Yen>=10)
						usr.Yen-=10
						var/obj/A = new/obj/items/Clothing/Bra
						A.icon += input("Please choose a color") as color
						usr.contents+=A




	Ramen_Chef
		icon='NPCs.dmi'
		icon_state="Ramen"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What would you like to buy?") in list ("Ramen","Vegetable Ramen","Miso Ramen","Cancel"))
				if("Ramen")
					if(usr.Yen>=10)
						usr.Yen-=10
						var/obj/A = new/obj/items/Food/Ramen
						usr.contents+=A
					else
						usr << "Ramen's cost 10 Yen!"
				if("Vegetable Ramen")
					if(usr.Yen>=15)
						usr.Yen-=15
						var/obj/A = new/obj/items/Food/Vegetable_Ramen
						usr.contents+=A
					else
						usr << "Vegetable Ramen's cost 15 Yen!"
				if("Miso Ramen")
					if(usr.Yen>=30)
						usr.Yen-=30
						var/obj/A = new/obj/items/Food/Miso_Ramen
						usr.contents+=A
					else
						usr << "Miso Ramen's cost 30 Yen!"




	Tea_Shop_Owner
		icon='NPCs.dmi'
		icon_state="Tea"
		attackable=0

	Barber
		icon='NPCs.dmi'
		icon_state="Shop"
		attackable=0
		verb/Talk()
			set src in view(2)
			usr.Hair()





mob/NPC
	Nez_Dealer
		icon='NPCs.dmi'
		icon_state="Suna2"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What'ya want punk?") in list ("Clothes","Nothing"))
				if("Clothes")
					switch(input("What would you like to buy?") in list (/*"Weights",*/"Nez Shirt Black","Nez White Striped Black Shirt","Nez Domo","Alternate Nez Domo","Nez Blue Polo","Nez White Stripe Brown Shirt","Nez Flag Shirt","Nez Black Striped Green Shirt","Nez Green Hoodie","Nez A.T.I Green","Nez Gray Hoodie","Nez Marsh","Nez Blue Striped Pink Shirt","Nez Pink Hoodie","Nez Purple Hoodie","Nez Umir Shirt","Nez Silver Hoodie","Cancel"))
						if("Nez Shirt Black")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Blackshirt
								usr.contents+=A
						if("Nez White Striped Black Shirt")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Black_Stripe
								usr.contents+=A

						if("Nez Domo")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Domo
								usr.contents+=A

						if("Nez Alternate Domo")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Alt_Domo
								usr.contents+=A

						if("Nez Blue Polo")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Blue_Polo
								usr.contents+=A

						if("Nez White Striped Brown Shirt")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Brown_Stripe
								usr.contents+=A

						if("Nez Flag Shirt")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Flag_Shirt
								usr.contents+=A
						if("Nez Black Striped Green Shirt")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Green_Stripe
								usr.contents+=A
						if("Nez Green Hoodie")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Green_Hoodie
								usr.contents+=A
						if("Nez A.T.I. Green")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Green_Up
								usr.contents+=A
						if("Nez Gray Hoodie")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Gray_Hoodie
								usr.contents+=A
						if("Nez Marsh")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Marsh
								usr.contents+=A
						if("Nez Blue Striped Pink Shirt")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Pink_Stripe
								usr.contents+=A
						if("Nez Purple Hoodie")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Purple_Hoodie
								usr.contents+=A
						if("Nez Pink Hoodie")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Pink_Hoodie
								usr.contents+=A
						if("Nez Umir Shirt")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Rimu
								usr.contents+=A
						if("Nez Silver Hoodie")
							if(usr.Yen>=25)
								usr.Yen-=25
								var/obj/A = new/obj/items/Clothing/Nez_Silver_Hoodie
								usr.contents+=A


	Make_Up_Seller
		icon='NPCs.dmi'
		icon_state="Flower"
		attackable=0
		verb/Talk()
			set src in view(2)
			switch(input("What would you like to buy?") in list ("Insomniac Makeup","Memori Makeup","Gaara Makeup","Cancel"))
				if("Insomniac Makeup")
					if(usr.Yen>=70)
						usr.Yen-=30
						var/obj/A = new/obj/items/Clothing/Insomniac_Eyes
						usr.contents+=A
				if("Memori Makeup")
					if(usr.Yen>=30)
						usr.Yen-=30
						var/obj/A = new/obj/items/Clothing/Memori_Eyes
						usr.contents+=A
				if("Gaara Makeup")
					if(usr.Yen>=10)
						usr.Yen-=10
						var/obj/A = new/obj/items/Clothing/Eye_Wrap
						usr.contents+=A






















