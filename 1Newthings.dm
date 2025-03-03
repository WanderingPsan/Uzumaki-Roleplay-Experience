//obj/landmine
  // Crossed(O)
    //  O << "You stepped on a land mine!"
      //O.Health -= 9999 * 9999
      //Death()



//mob/proc
//	Explode()
//		for(var/mob/O)
//			O.Health -= 9999 * 9999
//		M.Death()



mob
	verb
		Show_Skill_Rank()
			view(6)<<"<font color=[usr.SayFont]>[usr]'s Skill rank is [usr.srank]."
		Grandie()
			set hidden = 1
			usr.icon = 'Grandie.dmi'




#define OneMinute 600
#define	SixtyMinutes 36000
#define TwoHours 72000
#define	ThreeHours 108000