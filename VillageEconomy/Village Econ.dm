mob/perkmaster/verb/Minimum_Wage()
	set category = "Perk Master"
	for(var/mob/M in world)
		if(M.Salary < 500)
			M.Salary = 500
			M<<"Your salary has been changed to 500. The current minimum wage."

var
	KonohaCash = 0
	KonohaArmy = 0
	KiriCash = 0
	KiriArmy = 0
	KumoCash = 0
	KumoArmy = 0
	AmeCash = 0
	AmeArmy = 0
	SunaCash = 0
	SunaArmy = 0
	GenjiForces = 0
	GenjiCash = 0
	ShinCash = 0
	ShinForces = 0

	KonohaTax = 0.15
	KiriTax = 0.15
	KumoTax = 0.15
	AmeTax = 0.15
	SunaTax = 0.15
	GenjiTax = 0.15
	ShinTax = 0.15



mob/Admin1/verb/Change_Village_Forces()
	var/vill = input("Which village's standing force will you modify?") in list("Konoha","Kirigakure","Sunagakure","Kumogakure","Amegakure","Genji","Uchi")
	if(vill == "Konoha")
		var/newforces = input("How many forces will you add? - to take away + to add.") as num
		KonohaArmy += newforces
	if(vill == "Kirigakure")
		var/newforces = input("How many forces will you add? - to take away + to add.") as num
		KiriArmy += newforces
	if(vill == "Sunagakure")
		var/newforces = input("How many forces will you add? - to take away + to add.") as num
		SunaArmy += newforces
	if(vill == "Kumogakure")
		var/newforces = input("How many forces will you add? - to take away + to add.") as num
		KumoArmy += newforces
	if(vill == "Amegakure")
		var/newforces = input("How many forces will you add? - to take away + to add.") as num
		AmeArmy += newforces
	if(vill == "Genji")
		var/newforces = input("How many forces will you add? - to take away + to add.") as num
		GenjiForces += newforces
	if(vill == "Shinkogakure")
		var/newforces = input("How many forces will you add? - to take away + to add.") as num
		ShinForces += newforces


mob/Admin1/verb/Change_Village_Funds()
	var/vill =  input("Which village's funds will you modify?") in list("Konoha","Kirigakure","Sunagakure","Kumogakure","Amegakure","Genji")
	if(vill == "Konoha")
		var/newforces = input("How much money will you add? - to take away + to add.") as num
		KonohaCash += newforces
	if(vill == "Kirigakure")
		var/newforces = input("How many money will you add? - to take away + to add.") as num
		KiriCash += newforces
	if(vill == "Sunagakure")
		var/newforces = input("How many money will you add? - to take away + to add.") as num
		SunaCash += newforces
	if(vill == "Kumogakure")
		var/newforces = input("How many money will you add? - to take away + to add.") as num
		KumoCash += newforces
	if(vill == "Amegakure")
		var/newforces = input("How many money will you add? - to take away + to add.") as num
		AmeCash += newforces
	if(vill == "Genji")
		var/newforces = input("How many money will you add? - to take away + to add.") as num
		GenjiCash += newforces
	if(vill == "Shinkogakure")
		var/newforces = input("How much money will you add? - to take away + to add.") as num
		ShinCash += newforces

