mob/NPC
	Kiri_Caravan
		icon='CaravanMerchantKirigakure.dmi'
		verb/Talk()
			set src in view(2)
			switch(input("Where would you like to go today?")in list("Konoha","Sunagakure","Kumogakure","Genjigakure","Shinko","Cancel"))
	/*			if("Konoha")
					if(usr.Yen >= 15000)
						usr.Yen -= 15000
						usr.loc = locate(150,57,1)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Konohagakure from Kirigakure."
						return */

				if("Sunagakure")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(211,183,10)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Sunagakure from Kirigakure."
						return
				if("Kumogakure")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(169,176,15)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Kumogakure from Kirigakure."
						return
				if("Genjigakure")
					if(usr.Yen >= 15000)
						usr.Yen -= 15000
						usr.loc = locate(232,77,2)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Genjigakure from Kirigakure."
						return
				if("Shinko")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(79,228,2)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Genjigakure from Kumogakure."
						return


mob/NPC
	Konoha_Caravan
		icon='CaravanMerchantKonoha.dmi'
		verb/Talk()
			set src in view(2)
			switch(input("Where would you like to go today?")in list("Kirigakure","Sunagakure","Kumogakure","Genjigakure","Shinko","Cancel"))
				if("Kirigakure")
					if(usr.Yen >= 15000)
						usr.Yen -= 15000
						usr.loc = locate(47,31,3)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Kirigakure from Konoha."
						return
				if("Sunagakure")
					if(usr.Yen >= 15000)
						usr.Yen -= 15000
						usr.loc = locate(211,183,10)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Sunagakure from Konoha."
						return
				if("Kumogakure")
					if(usr.Yen >= 25000)
						usr.Yen -= 25000
						usr.loc = locate(169,176,15)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Kumogakure from Konoha."
						return
				if("Genjigakure")
					if(usr.Yen >= 10000)
						usr.Yen -= 10000
						usr.loc = locate(232,77,2)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Genjigakure from Konoha."
						return
				if("Shinko")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(79,228,2)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Genjigakure from Kumogakure."
						return

mob/NPC
	Suna_Caravan
		icon='CaravanMerchantSunagakure.dmi'
		verb/Talk()
			set src in view(2)
			switch(input("Where would you like to go today?")in list("Konoha","Kirigakure","Kumogakure","Genjigakure","Shinko","Cancel"))
	/*			if("Konoha")
					if(usr.Yen >= 15000)
						usr.Yen -= 15000
						usr.loc = locate(150,57,1)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Konoha from Sunagakure."
						return */
				if("Kirigakure")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(47,31,3)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Kirigakure from Sunagakure."
						return
				if("Kumogakure")
					if(usr.Yen >= 30000)
						usr.Yen -= 30000
						usr.loc = locate(169,176,15)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Kumogakure from Sunagakure."
						return
				if("Genjigakure")
					if(usr.Yen >= 15000)
						usr.Yen -= 15000
						usr.loc = locate(232,77,2)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Genjigakure from Sunagakure."
						return
				if("Shinko")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(79,228,2)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Genjigakure from Kumogakure."
						return

mob/NPC
	Genji_Caravan
		icon='CaravanMerchantGenjigakure.dmi'
		verb/Talk()
			set src in view(2)
			switch(input("Where would you like to go today?")in list("Konoha","Sunagakure","Kumogakure","Shinko","Cancel"))
	/*			if("Konoha")
					if(usr.Yen >= 10000)
						usr.Yen -= 10000
						usr.loc = locate(150,57,1)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Konoha from Genjigakure."
						return */
				if("Sunagakure")
					if(usr.Yen >= 15000)
						usr.Yen -= 15000
						usr.loc = locate(211,183,10)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Sunagakure from Genjigakure."
						return
				if("Kumogakure")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(169,176,15)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Kumogakure from Genjigakure."
						return
				if("Kirigakure")
					if(usr.Yen >= 15000)
						usr.Yen -= 15000
						usr.loc = locate(47,31,3)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Kirigakure from Genjigakure."
						return
				if("Shinko")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(79,228,2)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Genjigakure from Kumogakure."
						return

mob/NPC
	Kumo_Caravan
		icon='CaravanMerchantKumogakure.dmi'
		verb/Talk()
			set src in view(2)
			switch(input("Where would you like to go today?")in list("Konoha","Sunagakure","Kirigakure","Genjigakure","Shinko","Cancel"))
	/*			if("Konoha")
					if(usr.Yen >= 25000)
						usr.Yen -= 25000
						usr.loc = locate(150,57,1)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Konoha from Kumogakure."
						return */
				if("Sunagakure")
					if(usr.Yen >= 30000)
						usr.Yen -= 30000
						usr.loc = locate(211,183,10)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Sunagakure from Kumogakure."
						return
				if("Kirigakure")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(47,31,3)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Kirigakure from Kumogakure."
						return

				if("Genjigakure")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(232,77,2)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Genjigakure from Kumogakure."
						return
				if("Shinko")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(79,228,2)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Genjigakure from Kumogakure."
						return


mob/NPC
	Shinko_Caravan
		icon='CaravanMerchantKumogakure.dmi'
		verb/Talk()
			set src in view(2)
			switch(input("Where would you like to go today?")in list("Konoha","Sunagakure","Kirigakure","Genjigakure","Kumogakure","Cancel"))
		/*		if("Konoha")
					if(usr.Yen >= 25000)
						usr.Yen -= 25000
						usr.loc = locate(150,57,1)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Konoha from Kumogakure."
						return */
				if("Sunagakure")
					if(usr.Yen >= 30000)
						usr.Yen -= 30000
						usr.loc = locate(211,183,10)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Sunagakure from Kumogakure."
						return
				if("Kirigakure")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(47,31,3)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Kirigakure from Kumogakure."
						return

				if("Genjigakure")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(232,77,2)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Genjigakure from Kumogakure."
						return
				if("Kumogakure")
					if(usr.Yen >= 20000)
						usr.Yen -= 20000
						usr.loc = locate(169,176,15)
						for(var/mob/M in world)
							if(M.Admin == 1)
								M<<"[usr] has paid for a caravan to Genjigakure from Kumogakure."
						return

mob/NPC
	Boat_Caravan
		icon='CaravanMerchantBoat.dmi'
//		verb/Talk()
//			set src in view(2)
//			switch(input("Where would you like to go today?")in list("Amegakure Port","Kirigakure (Only select this if you are NOT in Kirigakure)","Cancel"))
//				if("Amegakure Port")
//					if(usr.Yen >= 5000)
//						usr.Yen -= 5000
//						usr.loc = locate(142,55,26)
//						return
//				if("Kirigakure (Only select this if you are NOT in Kirigakure)")
//					if(usr.Yen >= 5000)
//						usr.Yen -= 5000
//						usr.loc = locate(241,161,3)
//						return
/

/////////////////////////////////////////////////////////////


