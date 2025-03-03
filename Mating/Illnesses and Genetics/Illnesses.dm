obj/Illness
	icon='DNA.dmi'
	Fever
		suffix = "Your body is hot though you feel cold despite this."
	Flu
		suffix = "You have a high fever, a cough, runny nose, and frequent vomiting."
	Common_Cold
		suffix = "You have a low fever and a stuffy nose."
	Encephilitis
		suffix = "Your brain is swelling slightly, impairing your vision and giving you massive headaches as well as forcing you to be bed-ridden."
	Congestive_Heart_Failure
		suffix = "Your heart does not work as it should. Whenever you put too much strain on your body you pass out from exertion and require immediate medical attention. You must take medicine daily or face death."
	Wasting_Syndrome
		suffix = "Your body is wasting away. You are no more than skin and bones as your muscles deteriorate."
	Ebola
		suffix = "You've got Ebola~"
	Diarrhea
		suffix = "You have to constantly run to the restroom or find a place to let it loose, you risk dehydration."
	Tuberculosis
		suffix = "Your lungs are infected and you have a very bad cough. You're very infectious and risk death in no time."
	Nausea
		suffix = "Your stomach feels uneasy making it hard to keep down food and drink."
	Fatal_Auto_Immune_Deficiency
		suffix = "Your immune system has completely shut down and you've been infected with a deadly disease. You don't have long to live."
	Non_Fatal_Auto_Immune_Deficiency
		suffix = "Your immune system is on its last leg and you're very susceptible to other diseases."

mob/var/Susceptible = 0




mob/proc
	Illness_Obtain()
		if(src.JConst < 100)
			src.Susceptible = 1
			if(prob(30))
				var/U = rand(1,5)
				if(U==1)
					src.contents += new/obj/Illness/Tuberculosis
					src<<"You cough and blood comes up...."
				if(U==2)
					src.contents += new/obj/Illness/Non_Fatal_Auto_Immune_Deficiency
					src<<"You feel a great pain well up deep within your body."
				if(U==3)
					src.contents += new/obj/Illness/Fatal_Auto_Immune_Deficiency
					src<<"You suddenlly fall over as your body gives up on itself..."
					viewers()<<"[src] passes out and seems death-like."
					src.Health = 0
					src.Ko()
				if(U==4)
					src.contents += new/obj/Illness/Congestive_Heart_Failure
					src<<"Your heart stops for a moment and you pass out."
					viewers()<<"<font color=red>[src] passes out!"
					src.Health = 0
					src.Ko()
				if(U==5)
					src.contents += new/obj/Illness/Wasting_Syndrome
					src<<"You can feel your body stop in such a way that it causes you great pain."
					src.maxJConst = src.maxJConst/2
					src.JConst = src.maxJConst

		if(src.JConst < 500 && src.JConst > 350)
			if(!src.Susceptible)
				if(prob(25))
					var/U = rand(1,5)
					if(U==1)
						src.contents += new/obj/Illness/Fever
						src<<"Your body begins to grow clammy as it heats up internally..."
					if(U==2)
						src.contents += new/obj/Illness/Common_Cold
						src<<"You feel a bit ill as you begin to cough and your nose runs."
					if(U==3)
						src.contents += new/obj/Illness/Diarrhea
						src<<"Your stomach becomes uneasy and your abdomen begins to ache slightly."
					if(U==4)
						src.contents += new/obj/Illness/Nausea
						src<<"You feel uneasy."
					if(U==5)
						src<<"You feel a slight itch in the back of your throat."
						src.Susceptible = 1
			else
				if(prob(65))
					var/U = rand(1,4)
					if(U==1)
						src.contents += new/obj/Illness/Fever
						src<<"Your body begins to grow clammy as it heats up internally..."
					if(U==2)
						src.contents += new/obj/Illness/Common_Cold
						src<<"You feel a bit ill as you begin to cough and your nose runs."
					if(U==3)
						src.contents += new/obj/Illness/Diarrhea
						src<<"Your stomach becomes uneasy and your abdomen begins to ache slightly."
					if(U==4)
						src.contents += new/obj/Illness/Nausea
						src<<"You feel uneasy."
		if(src.JConst < 350	&& src.JConst > 100)
			if(!src.Susceptible)
				if(prob(20))
					var/U = rand(1,5)
					if(U==1)
						src.contents += new/obj/Illness/Flu
						src<<"You feel rather bad..."
					if(U==2)
						src.contents += new/obj/Illness/Encephilitis
						src<<"You get a major headache out of nowhere and you can barely see a thing."
					if(U==3)
						src.contents += new/obj/Illness/Congestive_Heart_Failure
						src<<"Your heart stops for a moment and you pass out."
						viewers()<<"<font color=red>[src] passes out!"
						src.Health = 0
						src.Ko()
					if(U==4)
						src.contents += new/obj/Illness/Wasting_Syndrome
						src<<"You can feel your body stop in such a way that it causes you great pain."
						src.maxJConst = src.maxJConst/2
						src.JConst = src.maxJConst
					if(U==5)
						src<<"You feel a deep pain in your abdomen."
						src.Susceptible = 1
			else
				if(prob(45))
					var/U = rand(1,4)
					if(U==1)
						src.contents += new/obj/Illness/Flu
						src<<"You feel rather bad..."
					if(U==2)
						src.contents += new/obj/Illness/Encephilitis
						src<<"You get a major headache out of nowhere and you can barely see a thing."
					if(U==3)
						src.contents += new/obj/Illness/Congestive_Heart_Failure
						src<<"Your heart stops for a moment and you pass out."
						viewers()<<"<font color=red>Passes out!"
						src.Health = 0
						src.Ko()
					if(U==4)
						src.contents += new/obj/Illness/Wasting_Syndrome
						src<<"You can feel your body stop in such a way that it causes you great pain."
						src.maxJConst = src.maxJConst/2
						src.JConst = src.maxJConst
					if(U==5)
						src.contents += new/obj/Illness/Non_Fatal_Auto_Immune_Deficiency
						src<<"You feel a great pain well up deep inside of your body."


