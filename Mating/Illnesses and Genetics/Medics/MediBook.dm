mob/var
	MB1 = null
	MB2 = null
	MB3 = null
	MB4 = null
	MB5 = null
	MB6 = null






obj/items/Citem/tools/Medicine_Book
	icon = 'Manual.dmi'
	icon_state = "Medicine"
	Click()
		usr.MB1 = null
		usr << output(usr.MB1,"Medicine Book.TL")
		usr << output(usr.MB1,"Medicine Book.TC")
		usr << output(usr.MB1,"Medicine Book.TR")
		usr << output(usr.MB1,"Medicine Book.BL")
		usr << output(usr.MB1,"Medicine Book.BC")
		usr << output(usr.MB1,"Medicine Book.BR")
		winshow(usr,"Medicine Book",1)




	verb
	/*	CBIRecipe()
			set hidden = 1
			usr.MB1 = null
			usr << output(usr.MB1,"Medicine Book.TL")
			usr << output(usr.MB1,"Medicine Book.TC")
			usr << output(usr.MB1,"Medicine Book.TR")
			usr << output(usr.MB1,"Medicine Book.BL")
			usr << output(usr.MB1,"Medicine Book.BC")
			usr << output(usr.MB1,"Medicine Book.BR")
			sleep(1)
			var/obj/items/herb/grass/Health_Herb/A = new
			var/obj/items/herb/grass/Poison_Herb/B = new
			var/obj/items/herb/grass/Chakra_Herb/C = new
			usr.MB1 = A
			usr.MB2 = B
			usr.MB3 = C
			winset(usr,"Medicine Book.Name","text=\"Chakra Borne Illness\"")
			usr << output(usr.MB1,"Medicine Book.TL")
			usr << output(usr.MB1,"Medicine Book.TR")
			usr << output(usr.MB1,"Medicine Book.BL")
			usr << output(usr.MB1,"Medicine Book.BR")
			usr << output(usr.MB2,"Medicine Book.TC")
			usr << output(usr.MB3,"Medicine Book.BC")
			return*/

		CAFRecipe()
			set hidden = 1
			usr.MB1 = null
			usr << output(usr.MB1,"Medicine Book.TL")
			usr << output(usr.MB1,"Medicine Book.TC")
			usr << output(usr.MB1,"Medicine Book.TR")
			usr << output(usr.MB1,"Medicine Book.BL")
			usr << output(usr.MB1,"Medicine Book.BC")
			usr << output(usr.MB1,"Medicine Book.BR")
			sleep(1)
			var/obj/items/herb/grass/Red_Pepper/A = new
			var/obj/items/herb/grass/Health_Herb/B = new
			var/obj/items/herb/grass/Curry_Herb/C = new
			usr.MB1 = A
			usr.MB2 = B
			usr.MB3 = C
			winset(usr,"Medicine Book.Name","text=\"Cold and Flu Medicine\"")
			usr << output(usr.MB1,"Medicine Book.BL")
			usr << output(usr.MB2,"Medicine Book.TL")
			usr << output(usr.MB2,"Medicine Book.BR")
			usr << output(usr.MB3,"Medicine Book.TR")
			return

		AntiRecipe()
			set hidden = 1
			usr.MB1 = null
			usr << output(usr.MB1,"Medicine Book.TL")
			usr << output(usr.MB1,"Medicine Book.TC")
			usr << output(usr.MB1,"Medicine Book.TR")
			usr << output(usr.MB1,"Medicine Book.BL")
			usr << output(usr.MB1,"Medicine Book.BC")
			usr << output(usr.MB1,"Medicine Book.BR")
			sleep(1)
			var/obj/items/herb/grass/Health_Herb/A = new
			var/obj/items/herb/grass/Poison_Herb/B = new
			usr.MB1 = A
			usr.MB2 = B
			winset(usr,"Medicine Book.Name","text=\"Antidote\"")
			usr << output(usr.MB1,"Medicine Book.TL")
			usr << output(usr.MB1,"Medicine Book.TR")
			usr << output(usr.MB1,"Medicine Book.BL")
			usr << output(usr.MB1,"Medicine Book.BR")
			usr << output(usr.MB2,"Medicine Book.TC")
			return

		PoisonRecipe()
			set hidden = 1
			usr.MB1 = null
			usr << output(usr.MB1,"Medicine Book.TL")
			usr << output(usr.MB1,"Medicine Book.TC")
			usr << output(usr.MB1,"Medicine Book.TR")
			usr << output(usr.MB1,"Medicine Book.BL")
			usr << output(usr.MB1,"Medicine Book.BC")
			usr << output(usr.MB1,"Medicine Book.BR")
			sleep(1)
			var/obj/items/herb/grass/Health_Herb/A = new
			var/obj/items/herb/grass/Poison_Herb/B = new
			usr.MB1 = A
			usr.MB2 = B
			winset(usr,"Medicine Book.Name","text=\"Poison\"")
			usr << output(usr.MB2,"Medicine Book.TL")
			usr << output(usr.MB2,"Medicine Book.TR")
			usr << output(usr.MB2,"Medicine Book.BL")
			usr << output(usr.MB2,"Medicine Book.BR")
			usr << output(usr.MB1,"Medicine Book.TC")
			return

		HealingRecipe()
			set hidden = 1
			usr.MB1 = null
			usr << output(usr.MB1,"Medicine Book.TL")
			usr << output(usr.MB1,"Medicine Book.TC")
			usr << output(usr.MB1,"Medicine Book.TR")
			usr << output(usr.MB1,"Medicine Book.BL")
			usr << output(usr.MB1,"Medicine Book.BC")
			usr << output(usr.MB1,"Medicine Book.BR")
			sleep(1)
			var/obj/items/herb/grass/Health_Herb/A = new
			var/obj/items/herb/grass/Chakra_Herb/B = new
			usr.MB1 = A
			usr.MB2 = B
			winset(usr,"Medicine Book.Name","text=\"Healing Pills\"")
			usr << output(usr.MB1,"Medicine Book.TC")
			usr << output(usr.MB2,"Medicine Book.BC")
			return

		AkiPills()
			set hidden = 1
			usr.MB1 = null
			usr << output(usr.MB1,"Medicine Book.TL")
			usr << output(usr.MB1,"Medicine Book.TC")
			usr << output(usr.MB1,"Medicine Book.TR")
			usr << output(usr.MB1,"Medicine Book.BL")
			usr << output(usr.MB1,"Medicine Book.BC")
			usr << output(usr.MB1,"Medicine Book.BR")
			sleep(1)
			var/obj/items/herb/grass/Chakra_Herb/A = new
			var/obj/items/herb/grass/Red_Pepper/B = new
			var/obj/items/herb/grass/Curry_Herb/C = new
			var/obj/items/herb/grass/Spinach/D = new
			usr.MB1 = A
			usr.MB2 = B
			usr.MB3 = C
			usr.MB4 = D
			winset(usr,"Medicine Book.Name","text=\"Chakra Borne Illness\"")
			usr << output(usr.MB1,"Medicine Book.TL")
			usr << output(usr.MB1,"Medicine Book.TR")
			usr << output(usr.MB1,"Medicine Book.BC")
			usr << output(usr.MB2,"Medicine Book.BR")
			usr << output(usr.MB3,"Medicine Book.BL")
			usr << output(usr.MB4,"Medicine Book.TC")
			return
