mob/var
	LeftEye = 1
	RightEye = 1
	Head = 1
	Throat = 1
	LeftArm = 1
	RightArm = 1
	Chest = 1
	Stomach = 1
	LeftLeg = 1
	RightLeg = 1
	Doctor = 0
	Surgeon = 0




obj/Surgeon
	verb
		Surgery()
			input("What type of surgery would you like to do?")in list("Eye Transplant","First Aid","Disease Prevention","Poison Removal")
			if("Eye Transplant")
				var/list/O = new/list
				for(var/mob/G in view(2))
					if(G.LeftEye||G.RightEye)
						O.Add(G)
				var/mob/Q = input("Who will you perform surgery on?") in O
				var/mob/Y = input("Who will be the reciever of the eye?") in O
				var/eye = input("Which eye would you like to transplant?")in list("Left","Right")
				if(eye=="Left")
					if(usr.Surgeon)
						if(prob(75))
							Q.LeftEye = 0
							usr<<"You remove [Q]'s left eye successfully, you place it in a safe place."
							sleep(2)
							if(prob(75))
								Y.LeftEye = 0
								usr<<"You now remove [Y]'s left eye successfully, placing it safely away."
								if(prob(755))
									Y.LeftEye = 1
									usr<<"You successfully place [Q]'s eye into your socket."
								else
									usr<<"You fail in the transplant and lose the use of your left eye socket permenantly."

							else
								Y.LeftEye = 0
								usr<<"You remove [Y]'s left eye but destroy it in the process."
								return

						else
							Q.LeftEye = 0
							usr<<"You remove [Q]'s left eye but destroy it in the process."
							return
			if("First Aid")
				usr<<"Not yet added :P"
			if("Disease Prevention")
				usr<<"Not yet added :P"
			if("Poison Removal")
				usr<<"Not yet added :P"


