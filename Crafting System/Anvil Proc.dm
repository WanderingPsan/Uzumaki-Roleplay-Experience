obj/tools
	Click_Forge
		icon = 'Cstuff.dmi'
		icon_state="forge"
		Click()
			winshow(usr,"Forge",1)

obj/items/Citem/tools/Crafting_Manual
	icon = 'Manual.dmi'
	Click()
		winshow(usr,"Crafting Book",1)
mob/var
	CB1
	CB2
	CB3
	CB4
	CB5
	CB6
	CB7
	CB8
	CB9
	Book_Page = 0
mob/verb
	Check_Book()
		set hidden = 1
	//	winshow(usr,"Crafting Book",1)
		usr.CB1 = null
		usr << output(usr.CB1,"Crafting Book.TL")
		usr << output(usr.CB1,"Crafting Book.TC")
		usr << output(usr.CB1,"Crafting Book.TR")
		usr << output(usr.CB1,"Crafting Book.CR")
		usr << output(usr.CB1,"Crafting Book.C")
		usr << output(usr.CB1,"Crafting Book.CL")
		usr << output(usr.CB1,"Crafting Book.BL")
		usr << output(usr.CB1,"Crafting Book.BC")
		usr << output(usr.CB1,"Crafting Book.BR")
		if(usr.Book_Page == 0||usr.Book_Page==18)
			var/obj/items/Citem/MagWoo/A = new
			usr.CB1 = A
			usr.Book_Page = 1
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Wooden Planks x 5\"")
			usr << output(usr.CB1,"Crafting Book.C")
			return
		if(usr.Book_Page == 1)
			var/obj/items/Citem/MagBar/A = new
			usr.CB1 = A
			usr.Book_Page = 2
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Blade; Iron or Aeratum\"")
			usr << output(usr.CB1,"Crafting Book.TC")
			usr << output(usr.CB1,"Crafting Book.C")
			usr << output(usr.CB1,"Crafting Book.BC")
			return
		if(usr.Book_Page == 2)
			var/obj/items/Citem/MagPlank/A = new
			usr.CB1 = A
			usr.Book_Page = 3
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Wood Pommel; Soft or Hard\"")
			usr<< output(usr.CB1,"Crafting Book.CL")
			usr<< output(usr.CB1,"Crafting Book.BC")
			usr<< output(usr.CB1,"Crafting Book.CR")
			return
		if(usr.Book_Page == 3)
			var/obj/items/Citem/Hard_Wood_Plank/A = new
			var/obj/items/Citem/Iron_Bar/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 4
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Gun Handle\"")
			usr << output(usr.CB1,"Crafting Book.BL")
			usr << output(usr.CB2,"Crafting Book.C")
			return
		if(usr.Book_Page == 4)
			var/obj/items/Citem/Aeratum_Bar/A = new
			var/obj/items/Citem/Iron_Bar/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 5
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Gun Barrel\"")
			usr << output(usr.CB1,"Crafting Book.TL")
			usr << output(usr.CB2,"Crafting Book.TR")
			return
		if(usr.Book_Page == 5)
			var/obj/items/Citem/Soft_Wood_Plank/A = new
			var/obj/items/Citem/Magic_Nexus/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 6
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Wand\"")
			usr << output(usr.CB1,"Crafting Book.BC")
			usr << output(usr.CB2,"Crafting Book.C")
			return
		if(usr.Book_Page == 6)
			var/obj/items/Citem/Hard_Wood_Plank/A = new
			var/obj/items/Citem/Magic_Nexus/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 7
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Staff\"")
			usr << output(usr.CB1,"Crafting Book.C")
			usr << output(usr.CB1,"Crafting Book.BC")
			usr << output(usr.CB2,"Crafting Book.TC")
			return
		if(usr.Book_Page == 7)
			var/obj/items/Citem/Iron_Blade/A = new
			var/obj/items/Citem/Aeratum_Blade/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 8
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Giant Shuriken\"")
			usr << output(usr.CB1,"Crafting Book.TC")
			usr << output(usr.CB1,"Crafting Book.BC")
			usr << output(usr.CB2,"Crafting Book.CL")
			usr << output(usr.CB2,"Crafting Book.CR")
			return
		if(usr.Book_Page == 8)
			var/obj/items/Citem/Aeratum_Blade/A = new
			var/obj/items/Citem/Iron_Blade/B = new
			var/obj/items/Citem/Energy_Core/C = new
			var/obj/items/Citem/Energy_Limiter/D = new
			usr.CB1 = A
			usr.CB2 = B
			usr.CB3 = C
			usr.CB4 = D
			usr.Book_Page = 9
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Energy Bow\"")
			usr << output(usr.CB1,"Crafting Book.TC")
			usr << output(usr.CB1,"Crafting Book.CL")
			usr << output(usr.CB1,"Crafting Book.BC")
			usr << output(usr.CB2,"Crafting Book.TR")
			usr << output(usr.CB3,"Crafting Book.C")
			usr << output(usr.CB4,"Crafting Book.BR")
			return
		if(usr.Book_Page == 9)
			var/obj/items/Citem/Aeratum_Blade/A = new
			var/obj/items/Citem/Gun_Handle/B = new
			var/obj/items/Citem/Energy_Core/C = new
			var/obj/items/Citem/Energy_Limiter/D = new
			var/obj/items/Citem/Gun_Barrel/E = new
			usr.CB1 = A
			usr.CB2 = B
			usr.CB3 = C
			usr.CB4 = D
			usr.CB5 = E
			usr.Book_Page = 10
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Gunblade\"")
			usr << output(usr.CB1,"Crafting Book.CL")
			usr << output(usr.CB2,"Crafting Book.BR")
			usr << output(usr.CB3,"Crafting Book.C")
			usr << output(usr.CB4,"Crafting Book.BC")
			usr << output(usr.CB5,"Crafting Book.TL")
			return
		if(usr.Book_Page == 10)
			var/obj/items/Citem/Iron_Blade/A = new
			var/obj/items/Citem/Iron_Bar/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 11
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Katana Blade\"")
			usr << output(usr.CB1,"Crafting Book.C")
			usr << output(usr.CB2,"Crafting Book.TC")
			usr << output(usr.CB2,"Crafting Book.BC")
			return
		if(usr.Book_Page == 11)
			var/obj/items/Citem/Katana_Blade/A = new
			var/obj/items/Citem/Katana_Hilt/B = new
			var/obj/items/Citem/Katana_Sheathe/C = new
			usr.CB1 = A
			usr.CB2 = B
			usr.CB3 = C
			usr.Book_Page = 12
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Katana\"")
			usr << output(usr.CB1,"Crafting Book.TL")
			usr << output(usr.CB2,"Crafting Book.C")
			usr << output(usr.CB3,"Crafting Book.BR")
			return
		if(usr.Book_Page == 12)
			var/obj/items/Citem/Iron_Blade/A = new
			usr.CB1 = A
			usr.Book_Page = 13
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Scythe Blades x 2\"")
			usr << output(usr.CB1,"Crafting Book.CL")
			usr << output(usr.CB1,"Crafting Book.CR")
			return
		if(usr.Book_Page == 13)
			var/obj/items/Citem/Chain/A = new
			var/obj/items/Citem/Scythe_Blades/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 14
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Chained Scythes\"")
			usr << output(usr.CB2,"Crafting Book.TL")
			usr << output(usr.CB2,"Crafting Book.TR")
			usr << output(usr.CB1,"Crafting Book.CL")
			usr << output(usr.CB1,"Crafting Book.CR")
			usr << output(usr.CB1,"Crafting Book.BC")
			return
		if(usr.Book_Page == 14)
			var/obj/items/Citem/Iron_Bar/A = new
			usr.CB1 = A
			usr.Book_Page = 15
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Chain x 3\"")
			usr << output(usr.CB1,"Crafting Book.TL")
			usr << output(usr.CB1,"Crafting Book.TR")
			usr << output(usr.CB1,"Crafting Book.CL")
			usr << output(usr.CB1,"Crafting Book.CR")
			usr << output(usr.CB1,"Crafting Book.BL")
			usr << output(usr.CB1,"Crafting Book.BR")
			return
		if(usr.Book_Page == 15)
			var/obj/items/Citem/Aeratum_Blade/A = new
			var/obj/items/Citem/Motor/B = new
			var/obj/items/Citem/Chain/C = new
			var/obj/items/Citem/Hard_Wood_Pommel/D = new
			usr.CB1 = A
			usr.CB2 = B
			usr.CB3 = C
			usr.CB4 = D
			usr.Book_Page = 16
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Chain Sword\"")
			usr << output(usr.CB1,"Crafting Book.TC")
			usr << output(usr.CB2,"Crafting Book.C")
			usr << output(usr.CB3,"Crafting Book.CL")
			usr << output(usr.CB3,"Crafting Book.CR")
			usr << output(usr.CB4,"Crafting Book.BC")
			return
		if(usr.Book_Page == 16)
			var/obj/items/Citem/Iron_Blade/A = new
			var/obj/items/Citem/Hard_Wood_Pommel/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 17
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Broadsword\"")
			usr << output(usr.CB1,"Crafting Book.C")
			usr << output(usr.CB2,"Crafting Book.BC")
			return
		if(usr.Book_Page == 17)
			var/obj/items/Citem/Iron_Blade/A = new
			var/obj/items/Citem/Katana_Hilt/B = new
			usr.CB2 = A
			usr.CB5 = A
			usr.CB8 = B
			usr.Book_Page = 18
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Zanbatou\"")
			usr << output(usr.CB2,"Crafting Book.TC")
			usr << output(usr.CB5,"Crafting Book.C")
			usr << output(usr.CB8,"Crafting Book.BC")
			return

	Back_Book()
		set hidden = 1
	//	winshow(usr,"Crafting Book",1)
		usr.CB1 = null
		usr << output(usr.CB1,"Crafting Book.TL")
		usr << output(usr.CB1,"Crafting Book.TC")
		usr << output(usr.CB1,"Crafting Book.TR")
		usr << output(usr.CB1,"Crafting Book.CR")
		usr << output(usr.CB1,"Crafting Book.C")
		usr << output(usr.CB1,"Crafting Book.CL")
		usr << output(usr.CB1,"Crafting Book.BL")
		usr << output(usr.CB1,"Crafting Book.BC")
		usr << output(usr.CB1,"Crafting Book.BR")

		if(usr.Book_Page==2)
			var/obj/items/Citem/MagWoo/A = new
			usr.CB1 = A
			usr.Book_Page = 1
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Wooden Planks x 5\"")
			usr << output(usr.CB1,"Crafting Book.C")
			return
		if(usr.Book_Page == 3)
			var/obj/items/Citem/MagBar/A = new
			usr.CB1 = A
			usr.Book_Page = 2
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Blade; Iron or Aeratum\"")
			usr << output(usr.CB1,"Crafting Book.TC")
			usr << output(usr.CB1,"Crafting Book.C")
			usr << output(usr.CB1,"Crafting Book.BC")
			return
		if(usr.Book_Page == 4)
			var/obj/items/Citem/MagPlank/A = new
			usr.CB1 = A
			usr.Book_Page = 3
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Wood Pommel; Soft or Hard\"")
			usr<< output(usr.CB1,"Crafting Book.CL")
			usr<< output(usr.CB1,"Crafting Book.BC")
			usr<< output(usr.CB1,"Crafting Book.CR")
			return
		if(usr.Book_Page == 5)
			var/obj/items/Citem/Hard_Wood_Plank/A = new
			var/obj/items/Citem/Iron_Bar/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 4
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Gun Handle\"")
			usr << output(usr.CB1,"Crafting Book.BL")
			usr << output(usr.CB2,"Crafting Book.C")
			return
		if(usr.Book_Page == 6)
			var/obj/items/Citem/Aeratum_Bar/A = new
			var/obj/items/Citem/Iron_Bar/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 5
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Gun Barrel\"")
			usr << output(usr.CB1,"Crafting Book.TL")
			usr << output(usr.CB2,"Crafting Book.TR")
			return
		if(usr.Book_Page == 7)
			var/obj/items/Citem/Soft_Wood_Plank/A = new
			var/obj/items/Citem/Magic_Nexus/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 6
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Wand\"")
			usr << output(usr.CB1,"Crafting Book.BC")
			usr << output(usr.CB2,"Crafting Book.C")
			return
		if(usr.Book_Page == 8)
			var/obj/items/Citem/Hard_Wood_Plank/A = new
			var/obj/items/Citem/Magic_Nexus/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 7
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Staff\"")
			usr << output(usr.CB1,"Crafting Book.C")
			usr << output(usr.CB1,"Crafting Book.BC")
			usr << output(usr.CB2,"Crafting Book.TC")
			return
		if(usr.Book_Page == 9)
			var/obj/items/Citem/Iron_Blade/A = new
			var/obj/items/Citem/Aeratum_Blade/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 8
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Giant Shuriken\"")
			usr << output(usr.CB1,"Crafting Book.TC")
			usr << output(usr.CB1,"Crafting Book.BC")
			usr << output(usr.CB2,"Crafting Book.CL")
			usr << output(usr.CB2,"Crafting Book.CR")
			return
		if(usr.Book_Page == 10)
			var/obj/items/Citem/Aeratum_Blade/A = new
			var/obj/items/Citem/Iron_Blade/B = new
			var/obj/items/Citem/Energy_Core/C = new
			var/obj/items/Citem/Energy_Limiter/D = new
			usr.CB1 = A
			usr.CB2 = B
			usr.CB3 = C
			usr.CB4 = D
			usr.Book_Page = 9
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Energy Bow\"")
			usr << output(usr.CB1,"Crafting Book.TC")
			usr << output(usr.CB1,"Crafting Book.CL")
			usr << output(usr.CB1,"Crafting Book.BC")
			usr << output(usr.CB2,"Crafting Book.TR")
			usr << output(usr.CB3,"Crafting Book.C")
			usr << output(usr.CB4,"Crafting Book.BR")
			return
		if(usr.Book_Page == 11)
			var/obj/items/Citem/Aeratum_Blade/A = new
			var/obj/items/Citem/Gun_Handle/B = new
			var/obj/items/Citem/Energy_Core/C = new
			var/obj/items/Citem/Energy_Limiter/D = new
			var/obj/items/Citem/Gun_Barrel/E = new
			usr.CB1 = A
			usr.CB2 = B
			usr.CB3 = C
			usr.CB4 = D
			usr.CB5 = E
			usr.Book_Page = 10
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Gunblade\"")
			usr << output(usr.CB1,"Crafting Book.CL")
			usr << output(usr.CB2,"Crafting Book.BR")
			usr << output(usr.CB3,"Crafting Book.C")
			usr << output(usr.CB4,"Crafting Book.BC")
			usr << output(usr.CB5,"Crafting Book.TL")
			return
		if(usr.Book_Page == 12)
			var/obj/items/Citem/Iron_Blade/A = new
			var/obj/items/Citem/Iron_Bar/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 11
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Katana Blade\"")
			usr << output(usr.CB1,"Crafting Book.C")
			usr << output(usr.CB2,"Crafting Book.TC")
			usr << output(usr.CB2,"Crafting Book.BC")
			return
		if(usr.Book_Page == 13)
			var/obj/items/Citem/Katana_Blade/A = new
			var/obj/items/Citem/Katana_Hilt/B = new
			var/obj/items/Citem/Katana_Sheathe/C = new
			usr.CB1 = A
			usr.CB2 = B
			usr.CB3 = C
			usr.Book_Page = 12
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Katana\"")
			usr << output(usr.CB1,"Crafting Book.TL")
			usr << output(usr.CB2,"Crafting Book.C")
			usr << output(usr.CB3,"Crafting Book.BR")
			return
		if(usr.Book_Page == 14)
			var/obj/items/Citem/Iron_Blade/A = new
			usr.CB1 = A
			usr.Book_Page = 13
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Scythe Blades x 2\"")
			usr << output(usr.CB1,"Crafting Book.CL")
			usr << output(usr.CB1,"Crafting Book.CR")
			return
		if(usr.Book_Page == 15)
			var/obj/items/Citem/Chain/A = new
			var/obj/items/Citem/Scythe_Blades/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 14
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Chained Scythes\"")
			usr << output(usr.CB2,"Crafting Book.TL")
			usr << output(usr.CB2,"Crafting Book.TR")
			usr << output(usr.CB1,"Crafting Book.CL")
			usr << output(usr.CB1,"Crafting Book.CR")
			usr << output(usr.CB1,"Crafting Book.BC")
			return
		if(usr.Book_Page == 16)
			var/obj/items/Citem/Iron_Bar/A = new
			usr.CB1 = A
			usr.Book_Page = 15
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Chain x 3\"")
			usr << output(usr.CB1,"Crafting Book.TL")
			usr << output(usr.CB1,"Crafting Book.TR")
			usr << output(usr.CB1,"Crafting Book.CL")
			usr << output(usr.CB1,"Crafting Book.CR")
			usr << output(usr.CB1,"Crafting Book.BL")
			usr << output(usr.CB1,"Crafting Book.BR")
			return
		if(usr.Book_Page == 17)
			var/obj/items/Citem/Aeratum_Blade/A = new
			var/obj/items/Citem/Motor/B = new
			var/obj/items/Citem/Chain/C = new
			var/obj/items/Citem/Hard_Wood_Pommel/D = new
			usr.CB1 = A
			usr.CB2 = B
			usr.CB3 = C
			usr.CB4 = D
			usr.Book_Page = 16
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Chain Sword\"")
			usr << output(usr.CB1,"Crafting Book.TC")
			usr << output(usr.CB2,"Crafting Book.C")
			usr << output(usr.CB3,"Crafting Book.CL")
			usr << output(usr.CB3,"Crafting Book.CR")
			usr << output(usr.CB4,"Crafting Book.BC")
			return
		if(usr.Book_Page == 18)
			var/obj/items/Citem/Iron_Blade/A = new
			var/obj/items/Citem/Hard_Wood_Pommel/B = new
			usr.CB1 = A
			usr.CB2 = B
			usr.Book_Page = 17
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Broadsword\"")
			usr << output(usr.CB1,"Crafting Book.C")
			usr << output(usr.CB2,"Crafting Book.BC")
			return

		if(usr.Book_Page == 1)
			var/obj/items/Citem/Iron_Blade/A = new
			var/obj/items/Citem/Katana_Hilt/B = new
			usr.CB2 = A
			usr.CB5 = A
			usr.CB8 = B
			usr.Book_Page = 18
			winset(usr,"Crafting Book.Name","text=\"Crafting Book - Zanbatou\"")
			usr << output(usr.CB2,"Crafting Book.TC")
			usr << output(usr.CB5,"Crafting Book.C")
			usr << output(usr.CB8,"Crafting Book.BC")
			return

