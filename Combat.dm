/*
Death:
	Taken to Afterlife.
	Random Chance to be brought back to the hospital?
	Summoning: Impure World Resurrection

	131,151,18
*/
obj/Tombstone
	var/body = ""
	var/interred = 0
	icon = 'Tombstone.dmi'
	density = 1
	verb
		Inspect()
			set src in view(2)
			if(src.interred)
				usr<<"Here lies [body]."
				return
			else
				usr<<"Here lies [body]...But the ground seems to have been turned and the body is gone."

		Disinter()
			set src in view(2)
			if(src.interred)
				for(var/mob/Dead_Body/M in viewers(3))
					if(findtext("[M.name]","[src.body]"))
						M.invisibility = 0
						M.density = 1
			else
				usr<<"There is no body here..."
		Inter()
			set src in view(2)
			if(!src.interred)
				for(var/mob/Dead_Body/M in viewers(3))
					M.invisibility = 1
					M.density = 0
					src.body = "[src.name]"

mob/var/Exp = 0
mob/proc
	Death()
		var/mob/A = new/mob/Dead_Body
		A.loc=src.loc
		A.Health=0
		A.MaxHealth=0
		A.Savable=0
		A.displaykey = src.key
		A.name="[src.name]'s Body"
		A.icon=src.icon
		A.overlays.Add(src.overlays)
		A.icon_state="KO"
		A.attackable=0
		for(var/obj/items/Citem/Henkan/H in src.contents)
			for(var/obj/O in src.contents)
				if(O.Henkan == H)
					H.contents += O
		if(prob(100))
			var/obj/items/Citem/Henkan/EmptyHenkan/B = new
			B.name = "[src.name]'s Henkan"
			B.loc = locate(src.loc)
			for(var/obj/Perk/P in src.contents)
				B.contents += P
				P.Henkan = B
			for(var/obj/Custom/C in src.contents)
				B.contents += C
				C.Henkan = B
			for(var/obj/items/Weapon/W in src.contents)
				if(W.worn)
					B.contents += W
					W.Henkan = B
			for(var/obj/items/Clothing/G in src.contents)
				if(G.worn)
					B.contents += G
					G.Henkan = B

		spawn()
			src.loc = locate(131,151,18)
			src.Dead=1
			src << "You have died - You can either wait to be ressurected by someone from the living realm."
			src << "Or remake and create a new character!"
			src << "Report your death to an admin if you feel it was unjust."
		if(prob(30))
			A.overlays +='Blood.dmi'
		if(prob(50))
			A.overlays +='Blood2.dmi'
		if(prob(80))
			A.overlays +='Blood3.dmi'
		sleep(1000)
		A.overlays +='Flee.dmi'



/*
Punch
Ressucitate?
Kill
*/
mob/var
	attacking=0
	KO=0
mob/verb
	Kill()
		set category = "Combat"
		for(var/mob/M in get_step(src,dir))
			if(!usr.KO&&usr.move&&M.KO&&M.attackable&&!usr.attacking)
				for(var/obj/items/A in M.contents)
					A.loc = M.loc
				for(var/mob/L in viewers(20))
					L<<"<font color=red><i>[M] was just KILLED by [usr]!"
					L.ChatLog("<font color=red>*[usr.name]([usr.key]) just <i>KILLED</i> [M]([M.key])")
					L.SpyLand("<font color=red>*[usr.name]([usr.key]) just <i>KILLED</i> [M]([M.key])")
				M.Death()

mob/verb
	Attack()
		set category = "Combat"
		var/random


		for(var/mob/M in get_step(usr,usr.dir))




			if(usr.Weapon)
				if(!usr.resting&&!usr.KO&&usr.move&&!M.KO&&M.attackable&&!usr.attacking&&usr.Stamina >= 2)
					var/damage = rand(usr.Strength/M.Defense+usr.Taijutsu/M.Taijutsu/1.5,usr.Strength/M.Defense+usr.Taijutsu/M.Taijutsu)/2.5
					if(damage<0)
						damage=0
					if(damage*1.5>=M.MaxHealth)
						damage=(usr.Strength/M.Defense+M.Taijutsu)/1.5
					if(damage*1.5>=1000)
						damage=(usr.Strength/M.Defense+M.Taijutsu)*rand(3.5,5.5)
					if(src.client==null)
						return
					if(src.Health==null)
						return
					if(src.Defense==null)
						return
					if(usr.client==null)
						return
					if(usr.Health==null)
						return
					if(usr.Defense==null)
						return



					usr.attacking=1
					if((usr.Agility+usr.Offence*rand(1,1.5)) >= M.Agility+M.Defense)
						random = rand(1,10)
						if(random<=9)
							if((usr.Strength*rand(1,2)) >= M.Defense)
								random = rand(1,10)
								if(random<=9)
									flick("Weapon",usr)
									M.Health -= damage
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Dark-Chidori.dmi'
									usr.drain=0
									usr.overlays -= 'Rasengan.dmi'
									if(usr.Weapon&&usr.Samehada)
										flick("Weapon",usr)
										M.Health -= damage
										M.Chakra -= damage*2
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
									/*if(Atton)
										sleep(15/usr.Agility)
										viewers() << "[usr] manages to cut [M]!"
										flick("Weapon",usr)
										M.Health -= damage
										usr.attacking=0
										usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'*/


								else
									flick("Weapon",usr)
									M.Health -= ((damage/M.Defense)/1.5)
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Dark-Chidori.dmi'
									usr.drain=0
									usr.overlays -= 'Rasengan.dmi'
									if(usr.Weapon&&usr.Samehada)
										flick("Weapon",usr)
										M.Health -= ((damage/M.Defense)/1.5)
										M.Chakra -= damage*1.5
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
									/*if(Atton)
										sleep(15/usr.Agility)
										viewers() << "[M] manages to block [usr]!"
										flick("Weapon",usr)
										M.Health -= ((damage/M.Defense)/1.5)
										usr.attacking=0
										usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'*/

						else
							random = rand(1,10)
							if(random<=8)
								if((usr.Strength*rand(1,2)) >= M.Defense)
									random = rand(1,10)
									if(random<=9)
										flick("Weapon",usr)
										M.Health -= damage
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
										if(usr.Weapon&&usr.Samehada)
											flick("Weapon",usr)
											M.Health -= damage
											M.Chakra -= damage*2
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
										/*if(Atton)
											sleep(15/usr.Agility)
											viewers() << "[M] manages to cut [usr]!"
											flick("Weapon",usr)
											M.Health -= damage
											usr.attacking=0
											usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'*/


									else
										flick("Attack",usr)
										M.Health -= ((damage/M.Defense)/1.5)
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
										if(usr.Weapon&&usr.Samehada)
											flick("Weapon",usr)
											M.Health -= ((damage/M.Defense)/1.5)
											M.Chakra -= damage*1.5
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
										/*if(Atton)
											sleep(15/usr.Agility)
											viewers() << "[M] manages to block [usr]!"
											flick("Attack",usr)
											M.Health -= ((damage/M.Defense)/1.5)
											usr.attacking=0
											usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'*/


							else
								flick("Dodge",M)
								flick("Weapon",usr)
								usr.overlays -= 'Chidori.dmi'
								usr.overlays -= 'Dark-Chidori.dmi'
								usr.drain=0
								usr.overlays -= 'Rasengan.dmi'
								/*if(Atton)
									sleep(15/usr.Agility)
									viewers() << "[M] manages to dodge [usr]!"
									flick("Weapon",usr)
									flick("Dodge",M)
									usr.attacking=0
									usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
									usr.drain=0
									usr.overlays -= 'Rasengan.dmi'*/


					else
						flick("Dodge",M)
						flick(usr,"Weapon")
						usr.overlays -= 'Chidori.dmi'
						usr.overlays -= 'Dark-Chidori.dmi'
						usr.drain=0
						usr.overlays -= 'Rasengan.dmi'
						/*if(Atton)
							sleep(15/usr.Agility)
							viewers() << "[M] manages to dodge [usr]!"
							flick(usr,"Weapon")
							flick("Dodge",M)

							usr.attacking=0
							usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
							usr.drain=0
							usr.overlays -= 'Rasengan.dmi'*/


					M.Ko(usr)

					/*usr.RAttack()
					if(M.client)
						M.RAttack()*/
					usr.Stamina -= 2
					if(usr.Stamina <0)
						usr.Stamina = 0
					if(usr.Agility<=100)
						sleep(rand(5,8))
						usr.attacking=0
					if(usr.Agility>=100)
						sleep(rand(2,3))
						usr.attacking=0



			else

				if(!usr.resting&&!usr.KO&&usr.move&&!M.KO&&M.attackable&&!usr.attacking&&usr.Stamina >= 2)

					var/damage = rand(usr.Strength/M.Defense+usr.Taijutsu/M.Taijutsu/1.5,usr.Strength/M.Defense+usr.Taijutsu/M.Taijutsu)/2.5
					if(damage<=0)
						damage=0
					if(damage*1.5>=M.MaxHealth)
						damage=(usr.Strength/M.Defense+M.Taijutsu)/1.6
					if(damage*1.5>=1000)
						damage=(usr.Strength/M.Defense+M.Taijutsu)*rand(2.5,4.15)

					usr.attacking=1
					if((usr.Agility+usr.Offence*rand(1,1.5)) >= M.Agility+M.Defense)
						random = rand(1,10)
						if(random<=9)
							if((usr.Strength*rand(1,2)) >= M.Defense)
								random = rand(1,10)
								if(random<=9)
									flick("Attack",usr)
									M.Health -= damage
									usr.Taijutsu = usr.MaxTaijutsu
									usr.Strength = usr.MaxStrength
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Dark-Chidori.dmi'
									usr.drain=0
									usr.overlays -= 'Rasengan.dmi'


									if(usr.Juuken)
										flick("Attack",usr)
										M.Health -= damage
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										M.Chakra -= damage*2
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'



									if(usr.Rasengan)
										flick("Attack",usr)
										M.Health -= damage
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										step(M,usr.dir)
										step(M,usr.dir)
										step(M,usr.dir)
										step(M,usr.dir)
										usr.Rasengan=0
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'


									/*if(Atton)
										sleep(15/usr.Agility)
										viewers() << "[usr] manages to hit [M]!"
										flick("Attack",usr)
										M.Health -= damage
										usr.Taijutsu = usr.MaxTaijutsu
										usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'

										usr.attacking=0
										var/random11=rand(1,20)
										if(prob(35))
											usr.Exp += rand(0.18,0.37)
										else
											if(random11==3)
												usr.Exp += rand(0.3,0.38)*/


								else
									flick("Attack",usr)
									M.Health -= ((damage/M.Defense)/1.5)
									usr.Taijutsu = usr.MaxTaijutsu
									usr.Strength = usr.MaxStrength
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Dark-Chidori.dmi'
									usr.drain=0
									usr.overlays -= 'Rasengan.dmi'

									if(usr.Juuken)
										flick("Attack",usr)
										M.Health -= ((damage/M.Defense)/1.5)
										M.Chakra -= damage*1.5
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'


									if(usr.Rasengan)
										flick("Attack",usr)
										M.Health -= damage
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										step(M,usr.dir)
										step(M,usr.dir)
										usr.Rasengan=0
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
										var/random70=rand(1,20)
										if(prob(35))
											usr.Exp += rand(0.18,0.37)
										else
											if(random70==3)
												usr.Exp += rand(0.3,0.38)
									/*if(Atton)
										sleep(15/usr.Agility)
										viewers() << "[M] manages to block [usr]!"
										flick("Attack",usr)
										M.Health -= ((damage/M.Defense)/1.5)
										usr.Taijutsu = usr.MaxTaijutsu
										usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'

										usr.attacking=0
										var/random21=rand(1,30)
										if(prob(35))
											usr.Exp += rand(0.15,0.29)
										else
											if(random21==3)
												usr.Exp += rand(0.25,0.29)*/



						else
							random = rand(1,10)
							if(random<=8)
								if((usr.Strength*rand(1,2)) >= M.Defense)
									random = rand(1,10)
									if(random<=9)
										flick("Attack",usr)
										M.Health -= damage
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
										var/random30=rand(1,20)
										if(prob(35))
											usr.Exp += rand(0.18,0.37)
										else
											if(random30==3)
												usr.Exp += rand(0.3,0.38)
										if(usr.Juuken)
											flick("Attack",usr)
											M.Health -= damage
											M.Chakra -= damage*2
											usr.Taijutsu = usr.MaxTaijutsu
											usr.Strength = usr.MaxStrength
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
											var/random90=rand(1,20)
											if(prob(35))
												usr.Exp += rand(0.18,0.37)
											else
												if(random90==3)
													usr.Exp += rand(0.3,0.38)
										if(usr.Rasengan)
											flick("Attack",usr)
											M.Health -= damage
											usr.Taijutsu = usr.MaxTaijutsu
											usr.Strength = usr.MaxStrength
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											step(M,usr.dir)
											step(M,usr.dir)
											step(M,usr.dir)
											step(M,usr.dir)
											usr.Rasengan=0
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
											var/random70=rand(1,20)
											if(prob(35))
												usr.Exp += rand(0.18,0.37)
											else
												if(random70==3)
													usr.Exp += rand(0.3,0.38)
										/*if(Atton)
											sleep(15/usr.Agility)
											viewers() << "[usr] manages to hit [M]!"
											flick("Attack",usr)
											M.Health -= damage
											usr.Taijutsu = usr.MaxTaijutsu
											usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'

											usr.attacking=0
											var/random31=rand(1,20)
											if(prob(35))
												usr.Exp += rand(0.18,0.37)
											else
												if(random31==3)
													usr.Exp += rand(0.3,0.38)*/


									else
										flick("Attack",usr)
										M.Health -= ((damage/M.Defense)/1.5)
										usr.Taijutsu = usr.MaxTaijutsu
										usr.Strength = usr.MaxStrength
										usr.overlays -= 'Chidori.dmi'
										usr.overlays -= 'Dark-Chidori.dmi'
										usr.drain=0
										usr.overlays -= 'Rasengan.dmi'
										var/random40=rand(1,40)
										if(prob(35))
											usr.Exp += rand(0.15,0.22)
										else
											if(random40==10)
												usr.Exp += rand(0.2,0.27)
										if(usr.Juuken)
											flick("Attack",usr)
											M.Health -= ((damage/M.Defense)/1.5)
											M.Chakra -= damage*1.5
											usr.Taijutsu = usr.MaxTaijutsu
											usr.Strength = usr.MaxStrength
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
											var/random100=rand(1,40)
											if(prob(35))
												usr.Exp += rand(0.15,0.22)
											else
												if(random100==10)
													usr.Exp += rand(0.2,0.27)
										if(usr.Rasengan)
											flick("Attack",usr)
											M.Health -= damage
											usr.Taijutsu = usr.MaxTaijutsu
											usr.Strength = usr.MaxStrength
											usr.overlays -= 'Chidori.dmi'
											usr.overlays -= 'Dark-Chidori.dmi'
											step(M,usr.dir)
											step(M,usr.dir)
											usr.Rasengan=0
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'
											var/random70=rand(1,20)
											if(prob(35))
												usr.Exp += rand(0.18,0.37)
											else
												if(random70==3)
													usr.Exp += rand(0.3,0.38)
										/*if(Atton)
											sleep(15/usr.Agility)
											viewers() << "[M] manages to block [usr]!"
											flick("Attack",usr)
											M.Health -= ((damage/M.Defense)/1.5)
											usr.Taijutsu = usr.MaxTaijutsu
											usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
											usr.drain=0
											usr.overlays -= 'Rasengan.dmi'

											usr.attacking=0
											var/random41=rand(1,40)
											if(prob(35))
												usr.Exp += rand(0.15,0.22)
											else
												if(random41==10)
													usr.Exp += rand(0.2,0.27)*/
							else

								flick("Dodge",M)
								flick("Attack",usr)
								usr.Taijutsu = usr.MaxTaijutsu
								usr.Strength = usr.MaxStrength
								usr.overlays -= 'Chidori.dmi'
								usr.overlays -= 'Dark-Chidori.dmi'
								usr.overlays -= 'Rasengan.dmi'
								usr.drain=0
								usr.Rasengan=0
								usr.Chidori=0
								var/random50=rand(1,40)
								if(prob(35))
									usr.Exp += rand(0.15,0.22)
								else
									if(random50==10)
										usr.Exp += rand(0.2,0.27)

								/*if(Atton)
									sleep(15/usr.Agility)
									flick("Dodge",M)
									viewers() << "[M] manages to dodge [usr]!"
									flick("Attack",usr)
									usr.Taijutsu = usr.MaxTaijutsu
									usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
									usr.overlays -= 'Rasengan.dmi'
									usr.drain=0
									usr.Chidori=0
									usr.Rasengan=0
									usr.attacking=0
									var/random51=rand(1,40)
									if(prob(35))
										usr.Exp += rand(0.15,0.22)
									else
										if(random51==10)
											usr.Exp += rand(0.2,0.27)*/


					else
						flick("Dodge",M)
						flick(usr,"Attack")
						usr.Taijutsu = usr.MaxTaijutsu
						usr.Strength = usr.MaxStrength
						usr.overlays -= 'Chidori.dmi'
						usr.overlays -= 'Dark-Chidori.dmi'
						usr.overlays -= 'Rasengan.dmi'
						usr.drain=0
						usr.Chidori=0
						usr.Rasengan=0
						var/random60=rand(1,40)
						if(prob(35))
							usr.Exp += rand(0.15,0.22)
						else
							if(random60==10)
								usr.Exp += rand(0.2,0.27)

						random = rand(1,20)
						if(random<=9)
							flick("Attack",usr)
							M.Health -= ((damage/M.Defense)/2.5)
							usr.Taijutsu = usr.MaxTaijutsu
							usr.Strength = usr.MaxStrength
							usr.overlays -= 'Chidori.dmi'
							usr.overlays -= 'Dark-Chidori.dmi'
							usr.drain=0
							usr.overlays -= 'Rasengan.dmi'
							var/random40=rand(1,40)
							if(prob(35))
								usr.Exp += rand(0.15,0.22)
							else
								if(random40==10)
									usr.Exp += rand(0.2,0.27)
							if(usr.Juuken)
								flick("Attack",usr)
								M.Health -= ((damage/M.Defense)/2.5)
								M.Chakra -= damage*1.5
								usr.Taijutsu = usr.MaxTaijutsu
								usr.Strength = usr.MaxStrength
								usr.overlays -= 'Chidori.dmi'
								usr.overlays -= 'Dark-Chidori.dmi'
								usr.drain=0
								usr.overlays -= 'Rasengan.dmi'
								var/random100=rand(1,40)
								if(prob(35))
									usr.Exp += rand(0.15,0.22)
								else
									if(random100==10)
										usr.Exp += rand(0.2,0.27)
							if(usr.Rasengan)
								flick("Attack",usr)
								M.Health -= damage
								usr.Taijutsu = usr.MaxTaijutsu
								usr.Strength = usr.MaxStrength
								usr.overlays -= 'Chidori.dmi'
								usr.overlays -= 'Dark-Chidori.dmi'
								step(M,usr.dir)
								step(M,usr.dir)
								usr.Rasengan=0
								usr.drain=0
								usr.overlays -= 'Rasengan.dmi'
								var/random70=rand(1,20)
								if(prob(35))
									usr.Exp += rand(0.18,0.37)
								else
									if(random70==3)
										usr.Exp += rand(0.3,0.38)

						/*if(Atton)
							sleep(15/usr.Agility)
							flick("Dodge",M)
							viewers() << "[M] manages to dodge [usr]!"
							flick(usr,"Attack")
							usr.Taijutsu = usr.MaxTaijutsu
							usr.overlays -= 'Chidori.dmi' usr.overlays -= 'Dark-Chidori.dmi'
							usr.overlays -= 'Rasengan.dmi'
							usr.drain=0
							usr.Rasengan=0
							usr.Chidori=0
							usr.attacking=0
							var/random61=rand(1,40)
							if(prob(35))
								usr.Exp += rand(0.15,0.22)
							else
								if(random61==10)
									usr.Exp += rand(0.2,0.27)*/

					M.Ko(usr)
					/*usr.RAttack()
					if(M.client)
						M.RAttack()*/
					usr.Stamina -= 3.5
					if(usr.Stamina <0)
						usr.Stamina = 0
					if(usr.Agility<=100)
						sleep(rand(5,8))
						usr.attacking=0
					if(usr.Agility>=100)
						sleep(rand(2,3))
						usr.attacking=0





mob/proc
	ObjKO()
		src.move=0
		src.KO=1
		src.icon_state = "KO"
		var/Ghost = rand(1500,2000)
		spawn(Ghost)
		src.UnKo()


mob/proc
	Ko(var/LOL)
		if(src.Health <= 0&&src.client)
			if(src.client==null)
				return
			var/random1=rand(1,10)
			if(random1==4&&src.client)
				src.Health=rand(10,30)
				src.Exp+=rand(0.50,0.80)
				spawn (rand(100,500))
				src.UnKo()
				return
			if(src.Health <=0)
				src.Health = 1
			src.move=0
			src.KO=1
			src.icon_state = "KO"
			for(var/mob/L in viewers(15))
				L<<"<font color=silver><b>[src] has been knocked-out by [LOL]"
				L.ChatLog("<font color=red>*[usr.name]([usr.key]) just <i><font color=white>KNOCKED OUT<font color=red></i> by [LOL]([LOL:key])")
				L.SpyLand("<font color=red>*[usr.name]([usr.key]) just <i><font color=white>KNOCKED OUT<font color=red></i> by [LOL]([LOL:key])")
			src.Kyuubi2_Revert()
			src.Kyuubi1_Revert()
			spawn (rand(500,1200))
			src.UnKo()
			return
		if(istype(src,/mob/KageBunshin)||istype(src,/mob/OboroBunshin)||istype(src,/mob/Bunshin))
			New()
			flick('Bunshin.dmi',src)
			del(src)
		if(istype(src,/mob/Dog))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Puppet))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Bugs))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] scurry away.<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Wolf))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Snake))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Med_Snake))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Med_Slug))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Slug))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Med_Toad))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/King_Enma))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Summoning/Big_Frog))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Big_Snake/Big_Snake))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Bijuu/Shukaku))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		/*if(istype(src,/mob/Daisan_no_Me))
			if(src.Health <=0)
				src.Health = 0
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)*/


		if(istype(src,/mob/Cat))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Toad))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
				src.overlays = null
				flick('Bunshin.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/TsuchiBunshin))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] becomes disfigured as they melt into the ground<font color = white>*)"
				src.overlays = null
				flick('Mud.dmi',src)
				sleep(2)
				usr.attacking=0
				New ()
				del(src)
		if(istype(src,/mob/MizuBunshin))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] becomes disfigured as they melt into the ground<font color = white>*)"
				src.overlays = null
				flick('Water.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)
		if(istype(src,/mob/KatonBunshin))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] bursts into flames<font color = white>*)"
				src.overlays = null
				flick('Fire.dmi',src)
				sleep(2)
				usr.attacking=0
				del(src)
		if(istype(src,/mob/RaitonBunshin))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] explodes into a number of electrical sparks<font color = white>*)"
				src.overlays = null
				flick(src,'Spark.dmi')
				sleep(2)
				usr.attacking=0
				del(src)

		if(istype(src,/mob/Bunshin))

			viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
			src.overlays = null
			flick('Bunshin.dmi',src)
			sleep(2)
			usr.attacking=0
			del(src)

		if(istype(src,/mob/Rinnegan_Body))
			viewers(src) << "<font color = white>(*<font color=[src.SayFont]>[src] fades into the air<font color = white>*)"
			src.overlays = null
			flick('Bunshin.dmi',src)
			del(src)
			sleep(2)
			usr.attacking=0
			src.client.perspective=EYE_PERSPECTIVE
			src.client.eye=src
			src.controlled=null
			src<<"You are no longer controlling a Body."


		if(istype(src,/mob/Log/Log))
			if(src.Health <=0)
				src.Health = 0
				viewers(src) << "<font color = white>(*<font color=[src.SayFont]>The [src] breaks<font color = white>*)"
				src.overlays = null
				flick(src,'Broke.dmi')
				sleep(2)
				usr.attacking=0
				del(src)

	UnKo()
		if(src.KO)
			src.move=1
			src.attacking=0
			viewers(6) << "<font color=silver><b>[src] regains consciousness"
			sleep(2)
			src.attacking=0
			src.KO=0
			src.icon_state = ""

