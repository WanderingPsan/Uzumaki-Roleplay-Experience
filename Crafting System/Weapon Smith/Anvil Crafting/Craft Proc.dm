/*
_|_|_
_|_|_
_|_|_
*/

mob/var/Blacksmith = 0
mob/var/Anvil
obj/items/Citem/tools
	Anvil
		icon='Anvil.dmi'
		Click()
			if(usr.Blacksmith)
				if(!usr.Anvil)
					usr.Anvil=1
					usr.BS1 = null
					usr.BS2 = null
					usr.BS3 = null
					usr.BS4 = null
					usr.BS5 = null
					usr.BS6 = null
					usr.BS7 = null
					usr.BS8 = null
					usr.BS9 = null
					winshow(usr,"Anvil",1)
				else
					usr.Anvil=0
					usr.BS1 = null
					usr.BS2 = null
					usr.BS3 = null
					usr.BS4 = null
					usr.BS5 = null
					usr.BS6 = null
					usr.BS7 = null
					usr.BS8 = null
					usr.BS9 = null
					winshow(usr,"Anvil",0)
			else
				usr<<"You cannot use this, you aren't a Blacksmith..."
		verb
			Bolt()
				if(!src.Bolted)
					src.Bolted = 1
					usr<<"You bolt the [src]."
				else
					if(src.Bolter == usr)
						src.Bolted = 0
						usr<<"You unbolt the [src]."
					else
						usr<<"You cannot unbolt this because you didn't bolt it."
			Anvil_Create()
				set src in view(2)
				set hidden = 1
				if(!usr.Blacksmith)
					usr<<"You aren't a Blacksmith and as such you don't have the expertise to use this.."
					return
				if(istype(usr.BS5,/obj/items/Citem/Iron_Blade/) && istype(usr.BS8,/obj/items/Citem/Hard_Wood_Pommel/) && usr.BS1 == null && usr.BS2 == null && usr.BS3 == null && usr.BS4 == null && usr.BS6 == null && usr.BS7 == null && usr.BS9 == null)
					usr<<"You fit the blade into the pommel making a broadsword."
					usr.contents += new/obj/items/Weapon/Broadsword
					usr.BS5 = null
					usr.BS8 = null
					usr << output(usr.BS5,"Anvil.C")
					usr << output(usr.BS8,"Anvil.BC")
				if(istype(usr.BS4,/obj/items/Citem/Soft_Wood_Plank/) && istype(usr.BS8,/obj/items/Citem/Soft_Wood_Plank/) && istype(usr.BS6,/obj/items/Citem/Soft_Wood_Plank/) && usr.BS1==null && usr.BS2==null && usr.BS3==null && usr.BS5==null && usr.BS7==null && usr.BS9==null)
					usr<<"You carve the wood and create a Soft Wooden Pommel."
					usr.contents += new/obj/items/Citem/Soft_Wood_Pommel
					usr.BS4 = null
					usr.BS8 = null
					usr.BS6 = null
					usr << output(usr.BS4,"Anvil.CL")
					usr << output(usr.BS8,"Anvil.BC")
					usr << output(usr.BS6,"Anvil.CR")
				if(istype(usr.BS4,/obj/items/Citem/Hard_Wood_Plank/) && istype(usr.BS8,/obj/items/Citem/Hard_Wood_Plank/) && istype(usr.BS6,/obj/items/Citem/Hard_Wood_Plank/) && usr.BS1==null && usr.BS2==null && usr.BS3==null && usr.BS5==null && usr.BS7==null && usr.BS9==null)
					usr<<"You carve the wood and create a Hard Wooden Pommel."
					usr.contents += new/obj/items/Citem/Hard_Wood_Pommel
					usr.BS4 = null
					usr.BS8 = null
					usr.BS6 = null
					usr << output(usr.BS4,"Anvil.CL")
					usr << output(usr.BS8,"Anvil.BC")
					usr << output(usr.BS6,"Anvil.CR")
				if(istype(usr.BS2,/obj/items/Citem/Iron_Bar/) && istype(usr.BS5,/obj/items/Citem/Iron_Bar/) && istype(usr.BS8,/obj/items/Citem/Iron_Bar/) && usr.BS1==null && usr.BS3==null && usr.BS4==null && usr.BS6==null && usr.BS7==null && usr.BS9==null)
					usr<<"You hammer the Iron Bars into a singular Iron Blade."
					usr.contents += new/obj/items/Citem/Iron_Blade
					usr.BS2 = null
					usr.BS5 = null
					usr.BS8 = null
					usr << output(usr.BS2,"Anvil.TC")
					usr << output(usr.BS5,"Anvil.C")
					usr << output(usr.BS8,"Anvil.BC")
				if(istype(usr.BS2,/obj/items/Citem/Aeratum_Bar/) && istype(usr.BS5,/obj/items/Citem/Aeratum_Bar/) && istype(usr.BS8,/obj/items/Citem/Aeratum_Bar/) && usr.BS1==null && usr.BS3==null && usr.BS4==null && usr.BS6==null && usr.BS7==null && usr.BS9==null)
					usr<<"You hammer the Aeratum Bars into a wavering Aeratum Blade."
					usr.contents += new/obj/items/Citem/Aeratum_Blade
					usr.BS2 = null
					usr.BS5 = null
					usr.BS8 = null
					usr << output(usr.BS2,"Anvil.TC")
					usr << output(usr.BS5,"Anvil.C")
					usr << output(usr.BS8,"Anvil.BC")
				if(istype(usr.BS1,/obj/items/Citem/Iron_Bar/) && istype(usr.BS3,/obj/items/Citem/Iron_Bar) && istype(usr.BS4,/obj/items/Citem/Iron_Bar/) && istype(usr.BS6,/obj/items/Citem/Iron_Bar/) && istype(usr.BS7,/obj/items/Citem/Iron_Bar/)  && istype(usr.BS9,/obj/items/Citem/Iron_Bar/) && usr.BS2==null && usr.BS5==null && usr.BS8==null)
					usr <<"You shape the malleable bars into chain links before connecting them into a springy series of links."
					usr.contents += new/obj/items/Citem/Chain
					usr.contents += new/obj/items/Citem/Chain
					usr.contents += new/obj/items/Citem/Chain
					usr.BS1 = null
					usr.BS3 = null
					usr.BS4 = null
					usr.BS6 = null
					usr.BS7 = null
					usr.BS9 = null
					usr << output(usr.BS6,"Anvil.CR")
					usr << output(usr.BS4,"Anvil.CL")
					usr << output(usr.BS1,"Anvil.TL")
					usr << output(usr.BS3,"Anvil.TR")
					usr << output(usr.BS7,"Anvil.BL")
					usr << output(usr.BS9,"Anvil.BR")
				if(istype(usr.BS4,/obj/items/Citem/Iron_Bar/) && istype(usr.BS6,/obj/items/Citem/Iron_Bar/) && usr.BS1==null && usr.BS2==null && usr.BS3==null && usr.BS5==null && usr.BS7==null && usr.BS8==null && usr.BS9==null)
					usr << "You pound the Iron Bars into shape creating a set of Scythe Blades."
					usr.contents += new/obj/items/Citem/Scythe_Blades
					usr.contents += new/obj/items/Citem/Scythe_Blades
					usr.BS4 = null
					usr.BS6 = null
					usr << output(usr.BS4,"Anvil.CL")
					usr << output(usr.BS6,"Anvil.CR")
				if(istype(usr.BS1,/obj/items/Citem/Scythe_Blades/) && istype(usr.BS3,/obj/items/Citem/Scythe_Blades/) && istype(usr.BS4,/obj/items/Citem/Chain/) && istype(usr.BS6,/obj/items/Citem/Chain/) && istype(usr.BS8,/obj/items/Citem/Chain/) && usr.BS2==null && usr.BS5==null && usr.BS7==null && usr.BS9==null)
					usr<< "You cut holes in the base of the scythe blades before attaching the chains creating Chained Scythes."
					usr.contents += new/obj/items/Weapon/Chained_Scythes
					usr.BS1 = null
					usr.BS3 = null
					usr.BS4 = null
					usr.BS6 = null
					usr.BS8 = null
					usr << output(usr.BS6,"Anvil.CR")
					usr << output(usr.BS4,"Anvil.CL")
					usr << output(usr.BS1,"Anvil.TL")
					usr << output(usr.BS3,"Anvil.TR")
					usr << output(usr.BS8,"Anvil.BC")
				if(istype(usr.BS5,/obj/items/Citem/Iron_Blade/) && istype(usr.BS2,/obj/items/Citem/Iron_Bar/) && istype(usr.BS8,/obj/items/Citem/Iron_Bar/) && usr.BS1==null && usr.BS3==null && usr.BS4==null && usr.BS6==null && usr.BS7==null && usr.BS9==null)
					usr<<"You work and fold and work and fold the iron bars over and over in the way of the Old Artisans. You have created a Katana Blade."
					usr.contents += new/obj/items/Citem/Katana_Blade
					usr.BS2 = null
					usr.BS5 = null
					usr.BS8 = null
					usr << output(usr.BS8,"Anvil.BC")
					usr << output(usr.BS2,"Anvil.TC")
					usr << output(usr.BS5,"Anvil.C")
				if(istype(usr.BS1,/obj/items/Citem/Katana_Blade/) && istype(usr.BS5,/obj/items/Citem/Katana_Hilt/) && istype(usr.BS9,/obj/items/Citem/Katana_Sheathe/) && usr.BS2 == null && usr.BS3 == null && usr.BS4 == null && usr.BS6 == null && usr.BS7 == null && usr.BS8 == null)
					usr<<"You fit the Katana's Blade into the Hilt. After a time of hard work, you slide it into its new sheathe..."
					usr.contents += new/obj/items/Weapon/Custom_Katana
					usr.BS1 = null
					usr.BS5 = null
					usr.BS9 = null
					usr << output(usr.BS5,"Anvil.C")
					usr << output(usr.BS1,"Anvil.TL")
					usr << output(usr.BS9,"Anvil.BR")
				if(istype(usr.BS2,/obj/items/Citem/Aeratum_Blade/) && istype(usr.BS3,/obj/items/Citem/Iron_Blade/) && istype(usr.BS4,/obj/items/Citem/Aeratum_Blade/) && istype(usr.BS5,/obj/items/Citem/Energy_Core/) && istype(usr.BS8,/obj/items/Citem/Aeratum_Blade/) && istype(usr.BS9,/obj/items/Citem/Energy_Limiter/) && usr.BS1==null && usr.BS6==null && usr.BS7==null)
					usr<<"You shape the Aeratum blades into two arms and attach them at the ends. You take an iron blade and furnish the bottom end with it. After doing so you attach an Energy Limiter to an Energy Core before attaching it to the Frame of the bow. It activates and begins to hum with energy."
					usr.contents += new/obj/items/Weapon/Bow_Sword
					usr.BS2 = null
					usr.BS3 = null
					usr.BS4 = null
					usr.BS5 = null
					usr.BS8 = null
					usr.BS9 = null
					usr << output(usr.BS5,"Anvil.C")
					usr << output(usr.BS9,"Anvil.BR")
					usr << output(usr.BS8,"Anvil.BC")
					usr << output(usr.BS4,"Anvil.CL")
					usr << output(usr.BS2,"Anvil.TC")
					usr << output(usr.BS3,"Anvil.TR")
				if(istype(usr.BS1,/obj/items/Citem/Aeratum_Bar/) && istype(usr.BS3,/obj/items/Citem/Iron_Bar/) && usr.BS2==null&& usr.BS4==null&& usr.BS5==null&& usr.BS6==null&& usr.BS7==null&& usr.BS8==null&& usr.BS9==null)
					usr<<"You mould and shape the two bars into a Gun Barrel."
					usr.contents += new/obj/items/Citem/Gun_Barrel
					usr.BS1 = null
					usr.BS3 = null
					usr << output(usr.BS1,"Anvil.TL")
					usr << output(usr.BS3,"Anvil.TR")
				if(istype(usr.BS2,/obj/items/Citem/Iron_Blade/) && istype(usr.BS6,/obj/items/Citem/Aeratum_Blade/) && istype(usr.BS8,/obj/items/Citem/Iron_Blade/) && istype(usr.BS4,/obj/items/Citem/Aeratum_Blade/) && usr.BS1==null&& usr.BS3==null&& usr.BS5==null&& usr.BS7==null&& usr.BS9==null)
					usr<<"You mould the four blades together and create a large throwing star."
					usr.contents += new/obj/items/Weapon/Giant_Shuriken
					usr.BS2 = null
					usr.BS6 = null
					usr.BS8 = null
					usr.BS4 = null
					usr << output(usr.BS8,"Anvil.BC")
					usr << output(usr.BS4,"Anvil.CL")
					usr << output(usr.BS2,"Anvil.TC")
					usr << output(usr.BS6,"Anvil.CR")
				if(istype(usr.BS5,/obj/items/Citem/Iron_Bar/) && istype(usr.BS7,/obj/items/Citem/Hard_Wood_Plank/) && usr.BS1==null && usr.BS2==null && usr.BS3==null && usr.BS4==null && usr.BS6==null && usr.BS8==null && usr.BS9==null)
					usr<<"You cut and shape the wooden plank into a handle butt before shaping the Iron Bar and attaching the two."
					usr.contents += new/obj/items/Citem/Gun_Handle
					usr.BS5 = null
					usr.BS7 = null
					usr << output(usr.BS5,"Anvil.C")
					usr << output(usr.BS7,"Anvil.BL")
				if(istype(usr.BS5,/obj/items/Citem/Soft_Wood/)&&usr.BS1==null && usr.BS2==null && usr.BS3==null && usr.BS4==null && usr.BS6==null && usr.BS7==null && usr.BS8==null && usr.BS9==null)
					usr.contents += new/obj/items/Citem/Soft_Wood_Plank
					usr.contents += new/obj/items/Citem/Soft_Wood_Plank
					usr.contents += new/obj/items/Citem/Soft_Wood_Plank
					usr.contents += new/obj/items/Citem/Soft_Wood_Plank
					usr.contents += new/obj/items/Citem/Soft_Wood_Plank
					usr<<"You carve the wood into planks."
					usr.BS5 = null
					usr << output(usr.BS5,"Anvil.C")
				if(istype(usr.BS5,/obj/items/Citem/Hard_Wood/)&&usr.BS1==null && usr.BS2==null && usr.BS3==null && usr.BS4==null && usr.BS6==null && usr.BS7==null && usr.BS8==null && usr.BS9==null)
					usr.contents += new/obj/items/Citem/Hard_Wood_Plank
					usr.contents += new/obj/items/Citem/Hard_Wood_Plank
					usr.contents += new/obj/items/Citem/Hard_Wood_Plank
					usr.contents += new/obj/items/Citem/Hard_Wood_Plank
					usr.contents += new/obj/items/Citem/Hard_Wood_Plank
					usr<<"You carve the wood into planks."
					usr.BS5 = null
					usr << output(usr.BS5,"Anvil.C")
				if(istype(usr.BS5,/obj/items/Citem/Iron_Blade/)&&usr.BS1==null && usr.BS2==null && usr.BS3==null && usr.BS4==null && usr.BS6==null && usr.BS7==null && usr.BS8==null && usr.BS9==null)
					usr.contents += new/obj/items/Weapon/Kunai
					usr<<"You've created a kunai."
					usr.BS5 = null
					usr << output(usr.BS5,"Anvil.C")
				if(istype(usr.BS5,/obj/items/Citem/Paper/)&&istype(usr.BS6,/obj/items/Citem/Chakra_Orb/)&&usr.BS1==null && usr.BS2==null && usr.BS3==null && usr.BS4==null && usr.BS7==null && usr.BS8==null && usr.BS9==null)
					usr.contents += new/obj/items/Weapon/Explosive_Tag
					usr<<"You've created an explosive tag!"
					usr.BS5 = null
					usr.BS6 = null
					usr << output(usr.BS5,"Anvil.C")
					usr << output(usr.BS6,"Anvil.CR")
				if(istype(usr.BS5,/obj/items/Citem/Iron_Blade/)&&istype(usr.BS9,/obj/items/Citem/Katana_Hilt/)&&usr.BS1==null && usr.BS2==null && usr.BS3==null && usr.BS4==null && usr.BS7==null && usr.BS8==null && usr.BS6==null)
					usr.contents += new/obj/items/Weapon/Tanto
					usr<<"You've created a tanto!"
					usr.BS5 = null
					usr.BS9 = null
					usr << output(usr.BS5,"Anvil.C")
					usr << output(usr.BS9,"Anvil.BR")
				if(istype(usr.BS4,/obj/items/Citem/Iron_Blade/) && istype(usr.BS6,/obj/items/Citem/Iron_Blade/) && usr.BS1==null && usr.BS2==null && usr.BS3==null && usr.BS5==null && usr.BS7==null && usr.BS8==null && usr.BS9==null)
					usr << "You pound the Iron Blades and create a Windmill Shuriken"
					usr.contents += new/obj/items/Weapon/Windmill
					usr.BS4 = null
					usr.BS6 = null
					usr << output(usr.BS4,"Anvil.CL")
					usr << output(usr.BS6,"Anvil.CR")
				if(istype(usr.BS2,/obj/items/Citem/Iron_Blade/) && istype(usr.BS5,/obj/items/Citem/Iron_Blade/) && istype(usr.BS8,/obj/items/Citem/Katana_Hilt/) && usr.BS1==null && usr.BS3==null && usr.BS4==null && usr.BS6==null && usr.BS7==null && usr.BS9==null)
					usr<<"You hammer the Iron Blades into a large Zanbatou."
					usr.contents += new/obj/items/Weapon/Zanbatou
					usr.BS2 = null
					usr.BS5 = null
					usr.BS8 = null
					usr << output(usr.BS2,"Anvil.TC")
					usr << output(usr.BS5,"Anvil.C")
					usr << output(usr.BS8,"Anvil.BC")


/*
Zanabtou ~ 1 = Iron Blade | 2 = Katana Hilt
_|1|_
_|1|_
_|2|_

Windmill Shuriken ~ 1 = Iron Blade
_|_|_
1|_|1
_|_|_

Exploding Tag ~ 1 = Paper | 2 = Chakra Orb
_|_|_
_|1|2
_|_|_

Kunai ~ 1 = Iron Blade
_|_|_
_|1|_
_|_|_

Soft Wood Plank ~ 1 = Soft Wood
_|_|_
_|1|_
_|_|_

Hard Wood Plank ~ 1 = Hard Wood
_|_|_
_|1|_
_|_|_

Gun Handle ~ 1= Hard Wood Plank | 2 = Iron Bar
_|_|_
_|2|_
1|_|_

Hard/Soft Wood Pommel~ 1 = Wood ( Hard or Soft )
_|_|_
1|_|1
_|1|_

Iron Blade ~ 1 = Iron Bar
_|1|_
_|1|_
_|1|_

Aeratum Blade ~ 1 = Aeratum Bar
_|1|_
_|1|_
_|1|_


Broadsword ~ 1 = Iron Blade | 2 = Hard Wood Pommel
_|_|_
_|1|_
_|2|_


Chain~ 1 = Iron Bar
1|_|1
1|_|1
1|_|1

Chain Sword ~ 1 = Aeratum Blade | 2 = Motor | 3 = Chain | 4 = Hard Wood Pommel
_|1|_
3|2|3
_|4|_

Chained Scythe ~ 1 = Scythe Blades | 2 = Chain
1|_|1
2|_|2
_|2|_

Scythe Blade ~ 1 = Iron Bar
_|_|_
1|_|1
_|_|_

Katana Blade ~ 1 = Iron Bar
_|1|_
_|1|_
_|1|_

Custom_Katana ~ 1 = Katana Blade | 2 = Katana Hilt | 3 = Katana Sheathe
1|_|_
_|2|_
_|_|3

Gunblade ~ 1 = Barrel | 2 = Energy Core | 3 = Aeratum Blade | 4 = Limiter | 5 = Gun Handle
1|_|_
3|2|_
_|4|5

Chakra Bow ~ 1 = Aeratum Blade | 2 = Iron Blade | 3 = Energy Core | 4 = Limiter
_|1|2
1|3|_
_|1|4

Gun Barrel ~ 1 = Aeratum Bar | 2 = Iron Bar
1|_|2
_|_|_
_|_|_

Giant Shuriken ~ 1 = Iron Blade | 2 = Aeratum Blade
_|1|_
2|_|2
_|1|_

 ~
_|_|_
_|_|_
_|_|_

 ~
_|_|_
_|_|_
_|_|_

 ~
_|_|_
_|_|_
_|_|_
*/



