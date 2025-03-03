var/list/Lawl=list("","","","","","","")
var/list/OP=list("","","","","")

var
	SeElCh = 30
	TerElCh = 20
	QuaElCh = 10
	QuiElCh = 10
	ClanProb = 0
	AvgChnce = 85 // Chance that you roll average
	RPPGaint = 0 // Amount of RPP you gain from RPing
	ProbOfGain = 90 // Chance that you'll gain RPP from RPing
	AutoGeninOn = 1

mob/var
	hair
	Uchiha=0
	Hyuuga=0
	Uchiha1=0
	Inuzuka=0
	Nara=0
	Hozuki=0
	Kaguya=0
	Hoshigaki=0
	Akimichi=0
	Aburame=0
	Regalado=0
	Ouendan=0
	Lyzerg=0
	Houkyakyu=0
	Toyotomi=0
	Dead=0
	Yuki=0
	White=0
	Pale=0
	Tan=0
	Dark=0
	Female=0
	Kai=0
	returnx
	returny
	returnz
	eye

mob/LOL/verb
	Send_File(mob/person in viewers(usr),filez as file)
		set category = "Commands"
		switch(alert(person,"[usr]([usr.key]) is trying to send you [filez].  Do you accept the file?","**File Transfer**","Yes","No"))
			if("Yes")
				alert(usr,"[person] accepted the file","File Accepted")
				person<<ftp(filez)
			if("No")
				alert(usr,"[person] declined the file","File Declined")

mob/verb/Loggit()
	set hidden = 1
	set name = ".%LOGIAN%."
	if(src.clicked==0)
		src.clicked = 1
		src.Load()
		usr.client.view="[usr.width]x[usr.height]"
		LoginProc()
		winshow(usr,"World",1)
		winset(usr,null,"World.is-default=true;Login.is-default=false")
		winshow(usr,"Login",0)



mob/verb/Creatit()
	set hidden = 1
	set name = ".%CREATINE%."
	if(src.clicked==0)
		src.clicked = 1
		usr.Creation()
		winshow(usr,"World",1)
		winshow(usr,"Login",0)
		usr.Oname=usr.name
		usr.Locate2()
		usr.Locate2()
		usr.Locate2()
		var/obj/Custom/Med/Meditate/A = new
		usr.contents += A




mob/proc
	LoginProc()
		src.verbs+=/mob/LOL/verb/Send_File
		if(usr.KO)
			spawn(1200)
			usr.UnKo()
		if(usr.onwater)
			usr.Water()
		if(usr.swim)
			usr.swim=0
			usr.onwater=0
		usr.KawaDelay=0
		usr.ShunshinDelay=0
		usr.HasHeaven=0
		usr.HasEarth=0
		usr.attacking=0
		usr.firing=0
		usr.Training = 0
		usr.move=1
		usr.RPGain = 1
		usr.overlays -= 'Swim.dmi'
		usr<<browse("[Updates]","window=Updates;size=400x500")
		usr.AutoRumors()
		usr.Login_Rank_Check()
		usr.ExpTunaSet()
		winset(usr,"exp","value=[usr.PerC2Nxt]")
		src.stat=1
		src.attacking=0
		src.loc=locate(usr.lx,usr.ly,usr.lz)
		src.AutoSave()
//		src.Age_Update()

	Start()
		switch(input("What would you like to do?") in list ("Create a New Character","Continue an Existing Character"))
			if("Create a New Character")
				usr.Creation()
				alert("Make sure you're not making/remaking on the wrong key. If you ignore this message and end up losing your character, don't bitch.")
				winshow(usr,"World",1)
				winset(usr,null,"World.is-default=true;Login.is-default=false")
				winshow(usr,"Login",0)
				usr.Oname=usr.name
				usr.Locate2()
				usr.Locate2()
				usr.Locate2()
				var/obj/Custom/Med/Meditate/A = new
				usr.contents += A


			if("Continue an Existing Character")
				src.Load()
				world << {"<font color=yellow>Server Information:<font color="#CCCCCC">([usr.key]) has awoken!"}
				usr.client.view="[usr.width]x[usr.height]"
				LoginProc()

			if("Visit the Forum")
				usr << link("")
				usr.Start()

	Creation()
		usr.Village()



	Finalizee()
		usr.Locate()
		if(AutoGeninOn)
			usr.Class="Genin"
			if(usr.Village=="Konohagakure")
				usr.contents += new/obj/items/Clothing/LeafHeadband
			if(usr.Village=="Sunagakure")
				usr.contents += new/obj/items/Clothing/SandHeadband
			if(usr.Village=="Kirigakure")
				usr.contents += new/obj/items/Clothing/MistHeadband
			if(usr.Village=="Kumogakure")
				usr.contents += new/obj/items/Clothing/CloudHeadband
			if(usr.Village=="Amegakure")
				usr.contents += new/obj/items/Clothing/RainHeadband
			usr.srank="D"
			usr.contents += new/obj/Genjutsu/Bunshin
			usr.contents += new/obj/Ninjutsu/Kawarimi
			usr.contents += new/obj/Genjutsu/Henge
		usr.Savable=1
		usr.stat=1
		usr.move=1
		usr.Oicon=usr.icon
		usr.AutoSave()
		winshow(usr,"World",1)
		winset(usr,null,"World.is-default=true;Login.is-default=false")
		winshow(usr,"Login",0)

	Element()
		if(src.key in OP)
			var/A = input("Pick your first element.")as text
			var/B = input("Pick your second element.")as text
			var/C = input("Pick your third element.")as text
			var/D = input("Pick your fourth element.")as text
			var/E = input("Pick your fifth element.")as text
			src.PrimaryElement = A
			src.SecondaryElement = B
			src.TertiaryElement = C
			src.QuadranaryElement = D
			src.QuinaryElement = E
			src.Traitsss()
			return
		var/random=rand(1,5)
		if(random==1)
			usr.PrimaryElement="Fire"
		if(random==2)
			usr.PrimaryElement="Wind"
		if(random==3)
			usr.PrimaryElement="Lightning"
		if(random==4)
			usr.PrimaryElement="Earth"
		if(random==5)
			usr.PrimaryElement="Water"
		if(prob(SeElCh))
			random=rand(1,5)
			if(random==1)
				usr.SecondaryElement="Fire"
			if(random==2)
				usr.SecondaryElement="Wind"
			if(random==3)
				usr.SecondaryElement="Lightning"
			if(random==4)
				usr.SecondaryElement="Earth"
			if(random==5)
				usr.SecondaryElement="Water"
			if(usr.PrimaryElement==usr.SecondaryElement)
				usr.SecondaryElement=""

		if(prob(TerElCh))
			random=rand(1,5)
			if(random==1)
				usr.TertiaryElement="Fire"
			if(random==2)
				usr.TertiaryElement="Wind"
			if(random==3)
				usr.TertiaryElement="Lightning"
			if(random==4)
				usr.TertiaryElement="Earth"
			if(random==5)
				usr.TertiaryElement="Water"
			if(usr.PrimaryElement==usr.SecondaryElement || usr.SecondaryElement==usr.TertiaryElement)
				usr.TertiaryElement=""

		if(prob(QuaElCh))
			random=rand(1,9)
			if(random==1)
				usr.QuadranaryElement="Ice"
				usr.contents += new/obj/Gene/Ice_Release
			if(random==2)
				usr.QuadranaryElement="Storm"
				usr.contents += new/obj/Gene/Storm_Release
			if(random==3)
				usr.QuadranaryElement="Steam"
				usr.contents += new/obj/Gene/Steam_Release
			if(random==4)
				usr.QuadranaryElement="Wood"
				usr.contents += new/obj/Gene/Wood_Release
			if(random==5)
				usr.QuadranaryElement="Lava"
				usr.contents += new/obj/Gene/Lava_Release
			if(random==6)
				usr.QuadranaryElement="Magnetism"
				usr.contents += new/obj/Gene/Magnetism_Release
			if(random==7)
				usr.QuadranaryElement="Crystal"
				usr.contents += new/obj/Gene/Crystal_Release
			if(random==8)
				usr.QuadranaryElement="Dust"
				usr.contents += new/obj/Gene/Dust_Release
			if(random==9)
				usr.QuadranaryElement="Scorch"
				usr.contents += new/obj/Gene/Scorch_Release

		if(prob(QuiElCh))
			random=rand(1,14)
			if(random==1)
				usr.QuinaryElement="Ice"
				usr.contents += new/obj/Gene/Ice_Release
			if(random==2)
				usr.QuinaryElement="Storm"
				usr.contents += new/obj/Gene/Storm_Release
			if(random==3)
				usr.QuinaryElement="Magnetism"
				usr.contents += new/obj/Gene/Magnetism_Release
			if(random==4)
				usr.QuinaryElement="Steam"
				usr.contents += new/obj/Gene/Steam_Release
			if(random==5)
				usr.QuinaryElement="Wood"
				usr.contents += new/obj/Gene/Wood_Release
			if(random==6)
				usr.QuinaryElement="Lava"
				usr.contents += new/obj/Gene/Lava_Release
			if(random==7)
				usr.QuinaryElement="Crystal"
				usr.contents += new/obj/Gene/Crystal_Release
		//	if(random==8)
		//		usr.QuinaryElement="Blaze"
		//		usr.contents += new/obj/Gene/Blaze_Release
			if(random==9)
				usr.QuinaryElement="Dust"
				usr.contents += new/obj/Gene/Dust_Release
			if(random==10)
				usr.QuinaryElement="Dark"
				usr.contents += new/obj/Gene/Dark_Release
			if(random==11)
				usr.QuinaryElement="Steel"
				usr.contents += new/obj/Gene/Steel_Release
			if(random==12)
				usr.QuinaryElement="Swift"
				usr.contents += new/obj/Gene/Swift_Release
			if(random==13)
				usr.QuinaryElement="Explosion"
				usr.contents += new/obj/Gene/Explosion_Release
			if(random==14)
				usr.QuinaryElement="Scorch"
				usr.contents += new/obj/Gene/Scorch_Release
			if(usr.QuinaryElement == usr.QuadranaryElement)
				usr.QuinaryElement = ""
		usr.Traitsss()
/*
var/kono="Enabled"
var/suna="Enabled"
var/kiri="Enabled"
var/iwa="Enabled"
var/kumo="Enabled"
var/ame="Enabled"
*/

	Village()
		switch(input("Please choose which village you wish to be born in, if nothing happens when you click then its disabled.")in list("Konohagakure","Sunagakure","Kirigakure","Amegakure","Kumogakure"))
			if("Konohagakure")
				if(kono=="Disabled")
					usr<<"Konohagakure is disabled."
					usr.Village()
					return
				usr.Village = "Konohagakure"

			if("Kirigakure")
				if(kiri=="Disabled")
					usr<<"Kirigakure is disabled."
					usr.Village()
					return
				usr.Village = "Kirigakure"

			if("Sunagakure")
				if(suna=="Disabled")
					usr<<"Sunagakure is disabled."
					usr.Village()
					return
				usr.Village = "Sunagakure"

			if("Amegakure")
				if(ame=="Disabled")
					usr<<"Amegakure is disabled."
					usr.Village()
					return
				usr.Village = "Amegakure"

			if("Kumogakure")
				if(kumo=="Disabled")
					usr<<"Kumogakure is disabled."
					usr.Village()
					return
				usr.Village = "Kumogakure"

		usr.Clan()

	Clan()
		if(usr.Village=="Konohagakure"||usr.Village=="Sunagakure"||usr.Village=="Kirigakure"||usr.Village=="Kumogakure"||usr.Village=="Amegakure")
			usr.Clan="None"
			switch(input("Would you like to be the founder of your own clan?") in list ("Yes","No"))
				if("Yes")
					var/clanname = input("Please choose a name for your clan.\n(This will also be your surname)") as text
					if(clanname=="")
						usr.Clan="None"
					else
						if(findtext("Uchiha",clanname)||findtext("Akimichi",clanname)||findtext("Aburame",clanname)||findtext("Hyuuga",clanname)||findtext("Hyuga",clanname)||findtext("Nara",clanname)||findtext("Uzumaki",clanname)||findtext("Inuzuka",clanname)||findtext("Kaguya",clanname)||findtext("Hoshigaki",clanname))
							alert("You cannot be the founder of one of the canon clans.")
							usr.Clan()
							return
						usr.Clan="[clanname]"
						usr.contents += new/obj/Clan
			usr.Skin()

	Skin()
		var/sex = alert("Are you a male or a female?","","Male","Female")
		switch(sex)
			if("Male")
				var/skin = input("Please choose the skin color you would like") in list("White","Tan","Dark","Pale")
				switch(skin)
					if("White")
						usr.icon = 'Base_Pale.dmi'
						usr.Pale=1

					if("Tan")
						usr.icon = 'Base_Tan.dmi'
						usr.Tan=1

					if("Dark")
						usr.icon = 'Base_Black.dmi'
						usr.Dark=1

					if("Pale")
						usr.icon = 'Base_White.dmi'
						usr.White=1
			if("Female")
				usr.Female=1
				var/skin = input("Please choose the skin color you would like") in list("White","Tan","Dark","Pale")
				switch(skin)
					if("White")
						usr.icon = 'Base_FemalePale.dmi'
						usr.Pale=1
					if("Tan")
						usr.icon = 'Base_FemaleTan.dmi'
						usr.Tan=1
					if("Dark")
						usr.icon = 'Base_FemaleBlack.dmi'
						usr.Dark=1
					if("Pale")
						usr.icon = 'Base_FemaleWhite.dmi'
						usr.White=1
		usr.Hair()
		usr.Name()
		usr.Genes()

	Hair()
		usr.overlays -= hair
		usr.hair = null
		usr.overlays -= hair
		switch(input("Please select a hair style") in list ("Bald","Bowl Cut","Short","Juugo","Kakashi","Kisame","Chiyo","Emo","Afro","Crazy","Crazy Afro","Mohawk","Villager","Big Spikes","Hinata","Choji","Tsunade","Sakura","Loose Ponytail","Soft Spikey","Tenten","Long","Little","Ponytail","Sasuke","Naruto","Spikey","Topknot","Untidy","Wild","Jiraiya"))
			if("Bald")
				usr.hair = null
			if("Bowl Cut")
				hair='Hair_Bowl.dmi'
			if("Hinata")
				hair='Hair_Hinata.dmi'
			if("Choji")
				hair='Hair_Choji.dmi'
			if("Villager")
				hair='Hair_Villager.dmi'
			if("Juugo")
				hair='Hair_Juugo.dmi'
			if("Tsunade")
				hair='Tsunade.dmi'
			if("Kakashi")
				hair='Hair_Kakashi.dmi'
			if("Kisame")
				hair='Hair_Kisame.dmi'
			if("Short")
				hair='Hair_Short.dmi'
			if("Chiyo")
				hair='Hair_Chiyo.dmi'
			if("Jiraiya")
				hair='Jiraiya.dmi'
			if("Emo")
				hair='Hair_Emo.dmi'
			if("Wild")
				hair='Hair_Wild.dmi'
			if("Loose Ponytail")
				hair='Hair_Loose_Ponytail.dmi'
			if("Long")
				hair='Hair_Long.dmi'
			if("Little")
				hair='Hair_Little.dmi'
			if("Ponytail")
				hair='Hair_Ponytail.dmi'
			if("Sakura")
				hair='Hair_Sakura.dmi'
			if("Sasuke")
				hair='Hair_Sasuke.dmi'
			if("Naruto")
				hair='Hair_Naruto.dmi'
			if("Spikey")
				hair='Hair_Spikey.dmi'
			if("Soft Spikey")
				hair='Hair_Spikey2.dmi'
			if("Big Spikes")
				hair='Hair_Spikey3.dmi'
			if("Topknot")
				hair='Hair_Topknot.dmi'
			if("Tenten")
				hair='Hair_Tenten.dmi'
			if("Mohawk")
				hair='Hair_Mohawk.dmi'
			if("Afro")
				hair='Afro.dmi'
			if("Crazy Afro")
				hair='Hair_Crazy-Afro.dmi'
			if("Crazy")
				hair='Hair_Crazy.dmi'
			if("Untidy")
				hair='Hair_Untidy.dmi'
		if(usr.hair)
			hair += input("Please select your Hair colour") as color
			overlays+=hair

	Name()
		usr.Age()
		name=html_encode(copytext(input(src,"Please choose a name for your character.(Fourty - Five letter limit)"),1,45))
		if(name==""||findtext(name,"\n"))
			usr.Name()
			return
		if(usr.Clan=="None")
			ClanWtf()
			usr.Element()
		else
			usr.name="[usr.Clan], [name]"
			usr.Element()

	CheckClan(blah,wat,initial)
		if(usr.key in Lawl)
			switch(input("[blah] ftw?") in list ("Yes","No"))
				if("Yes")
					return wat
				if("No")
					return 0
		else
			return initial

	ClanWtf()
		if(usr.Village=="Sunagakure")
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Houkyakyu Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Houkyakyu=1
						usr.name="Houkyakyu, [name]"
						return
		if(usr.Village=="Konohagakure")
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Uchiha Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Uchiha=1
						Uchiha1+=1
						usr.name="Uchiha, [name]"
						return
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Hyuuga Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Hyuuga=1
						usr.name="Hyuuga, [name]"
						if(prob(20))
							usr << "You are born in the Hyuuga Main Family."
						else
							usr << "You are born in the Hyuuga Branch Family."
							usr.overlays += 'Mark.dmi'
							usr.Mark=1
						return
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Inuzuka Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Inuzuka=1
						usr.name="Inuzuka, [name]"
						return
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Aburame Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Aburame=1
						usr.name="Aburame, [name]"
						return
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Akimichi Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Akimichi=1
						usr.name="Akimichi, [name]"
						return
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Nara Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Nara=1
						usr.name="Nara, [name]"
						return
		if(usr.Village=="Kirigakure")
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Kaguya Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Kaguya=1
						usr.name="Kaguya, [name]"
						return
		if(usr.Village=="Kirigakure")
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Hoshigaki Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Hoshigaki=1
						usr.name="Hoshigaki, [name]"
						return
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Hozuki Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Hozuki=1
						usr.name="Hozuki, [name]"
						return
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Lyzerg Clan?")in list ("Yes","No"))
					if("Yes")
						usr.Lyzerg=1
						usr.name="Lyzerg, [name]"
						return
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Yuki Clan?")in list ("Yes","No"))
					if("Yes")
						usr.Yuki=1
						usr.name="Yuki, [name]"
						return
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Toyotomi Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Toyotomi=1
						usr.name="Toyotomi, [name]"
						return
		if(usr.Village=="Kumogakure")
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Ouendan Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Ouendan=1
						usr.name="Ouendan, [name]"
						return
			if(prob(ClanProb)||usr.key in Lawl)
				switch(input("Would you like to be born as a member of the Regalado Clan?") in list ("Yes","No"))
					if("Yes")
						usr.Regalado=1
						usr.name="Regalado, [name]"
						return



	Genes()
		if(prob(5))
			src.contents += new/obj/Gene/High_Healing_Rate
		if(prob(5))
			src.contents += new/obj/Gene/Monstrous_Chakra
		if(prob(5))
			src.contents += new/obj/Gene/Small_Reservoir
		if(prob(5))
			src.contents += new/obj/Gene/Monstrous_Stamina
		if(prob(10))
			src.contents += new/obj/Gene/Depleting_Stamina
		if(prob(5))
			src.contents += new/obj/Gene/Longevity
		if(prob(10))
			src.contents += new/obj/Gene/High_Speed
		if(prob(10))
			src.contents += new/obj/Gene/Low_Speed
		if(prob(10))
			src.contents += new/obj/Gene/High_Defense
		if(prob(10))
			src.contents += new/obj/Gene/Low_Defense
		if(prob(10))
			src.contents += new/obj/Gene/High_Intelligence
		if(prob(10))
			src.contents += new/obj/Gene/Low_Intelligence
	//	if(prob(10))
	//		src.contents += new/obj/Gene/Chakra_Borne_Illness
		if(prob(5))
			src.contents += new/obj/Gene/Custom_Dojutsu
		if(prob(10))
			src.contents += new/obj/Gene/Monster_Body
		if(prob(10))
			src.contents += new/obj/Gene/Fragile_Body
		if(prob(0))
			src.contents += new/obj/Gene/Child
		if(prob(10))
			src.contents += new/obj/Gene/Reflexive
		if(prob(10))
			src.contents += new/obj/Gene/High_Control
		if(prob(10))
			src.contents += new/obj/Gene/Monstrous_Strength
		if(prob(10))
			src.contents += new/obj/Gene/Miniscule_Strength



	Racelol()
		if(usr.Regalado)
			usr.PrimaryElement="Lightning"
			usr.SecondaryElement="Water"
			usr.TertiaryElement="Storm"
			var/obj/Gene/Storm_Release/A = new
			usr.contents += new A
//		if(usr.Lyzerg)
//			usr.QuadranaryElement="Illusion"
//			var/obj/Gene/Illusion_Release/A = new
//			usr.contents += new A
	//	if(usr.Ouendan)
	//		usr.PrimaryElement = "Hero"
	//		usr.contents += new/obj/Gene/Hero_Release
		if(usr.Uchiha)
			usr.PrimaryElement="Fire"
			usr.contents += new/obj/Gene/Sharingan
	//		if(prob(25))
	//			usr.contents += new/obj/Gene/Chakra_Borne_Illness
		if(usr.Hyuuga)
			usr.overlays += 'Hyuuga.dmi'
			usr.contents += new/obj/Gene/Byakugan
		if(usr.Hoshigaki)
			usr.contents += new/obj/Gene/Monstrous_Chakra
		if(usr.Kaguya)
			usr.overlays += 'Kaguya.dmi'
			if(prob(49))
		//		usr.contents += new/obj/Gene/Chakra_Borne_Illness
				usr.contents += new/obj/Gene/Shikotsumyaku
		if(usr.Inuzuka)
			usr.Inuzuka=1
		if(usr.Akimichi)
			usr.Akimichi=1
		if(usr.Aburame)
			usr.Aburame=1
		if(usr.Nara)
			Nara=1
		if(usr.Hozuki)
			Hozuki=1
			usr.PrimaryElement="Water"
		if(usr.Yuki)
			Yuki=1
			usr.PrimaryElement="Water"
			usr.SecondaryElement="Wind"
			usr.QuadranaryElement="Ice"
		usr.Finalizee()

	Locate()
		if(usr.Village=="Konohagakure")
			usr.loc=locate(52,58,20)
			usr << "Your story begins in the hospital...."
			if(prob(25)||usr.displaykey==""||usr.displaykey=="")
				usr.contents += new/obj/Perk/Will_Of_Fire
				usr<<"Your story is driven by the Will of Fire!!"
		if(usr.Village=="Sunagakure")
			usr.loc=locate(141,163,10)
			usr << "You exit the school having just graduated...."
			if(prob(25)||usr.displaykey==""||usr.displaykey=="")
				usr.contents += new/obj/Perk/Strategem_of_Wind
				usr<<"Your story is driven by the Strategem of Wind!!"
		if(usr.Village=="Kirigakure")
			usr << "Your story begins just in front of the Mizukage's mansion, you have recently graduated...."
			usr.loc=locate(186,188,3)
			if(prob(25)||usr.displaykey==""||usr.displaykey=="")
				usr.contents += new/obj/Perk/Cunning_of_Water
				usr<<"Your story is driven by the Cunning of Water!!"
			if(usr.Toyotomi)
				usr<<"Your family's mansion is to the East of the mainland. You may travel there and enter your home with this key."
				var/obj/items/Police_Badge/A = new
				usr.contents += A
				A.Password = "ToYoToMi"
				A.icon_state = "Key"
		if(usr.Village=="Amegakure")
			usr << "You wake up near the school. You have a hazy recollection of being taken from your home but nothing more than that...."
			usr.loc=locate(39,61,4)
		if(usr.Village=="Kumogakure")
			usr << "You wake up in the middle of the market compound, with no recollection as to how you got there."
			usr.loc=locate(138,208,15)
			if(prob(25)||usr.displaykey==""||usr.displaykey=="")
				usr<<"Your story is driven by the Tenacity of Lightning!!"
				usr.contents += new/obj/Perk/Tenacity_of_Lightning
	Locate2()
		if(usr.Village=="Konohagakure")
			usr.loc=locate(52,58,20)
		//	usr << "You wake up in the hospital, with no recollection as to how you got there."
		if(usr.Village=="Sunagakure")
			usr.loc=locate(141,163,10)
		//	usr << "You wake up near the school, with no recollection as to how you got there."
		if(usr.Village=="Kirigakure")
		//	usr << "You wake up near the school, with no recollection as to how you got there."
			usr.loc=locate(186,188,3)
		if(usr.Village=="Amegakure")
		//	usr << "You wake up in the middle of the market compound, with no recollection as to how you got there."
			usr.loc=locate(39,61,4)
		if(usr.Village=="Kumogakure")
		//	usr << "You wake up in the middle of the market compound, with no recollection as to how you got there."
			usr.loc=locate(138,208,15)