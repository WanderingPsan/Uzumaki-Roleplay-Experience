mob/var/weighted = 0
mob/var/weightson = 0

obj/items/Clothing/Weights
	var
		weight = 10
	Click()
		if(src in usr.contents)
			if(!src.worn)
				src.worn = 1
				src.suffix = "**Equipped**"
				usr.overlays += src.icon
				usr.weighted = 1
				usr.weightson += src.weight
				usr.Jref -= (src.weight/10)*1
				usr.Jspd -= (src.weight/10)*1
			else
				src.worn = 0
				src.suffix=""
				usr.overlays -= src.icon
				usr.weighted = 0
				usr.weightson -= src.weight
				usr.Jref += 1
				usr.Jspd += (src.weight/10)*1