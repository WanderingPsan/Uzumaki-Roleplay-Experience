
mob/build/verb/Floor_1()
	set category="Build";new /obj/build/Floor1(usr.loc)
mob/build/verb/Floor_2()
	set category="Build";new /obj/build/Floor2(usr.loc)
mob/build/verb/Screen()
	set category="Build";new /obj/build/Screen(usr.loc)
mob/build/verb/Dirt()
	set category="Build";new /obj/build/Dirt(usr.loc)
mob/build/verb/Water2()
	set category="Build";set name="Water";new /turf/Terrain/Water(usr.loc)
mob/build/verb/Grass()
	set category="Build";new /turf/Terrain/Grass/Center(usr.loc)
mob/build/verb/Cliff2()
	set category="Build";set name="Cliff";new /turf/Terrain/Cliff(usr.loc)
mob/build/verb/Fishing_Water()
	set category="Build";new /turf/Terrain/Fishing_Spot(usr.loc)
mob/build/verb/Sand()
	set category="Build";new /turf/Terrain/Sand(usr.loc)
mob/build/verb/Waterfall()
	set category="Build";new /turf/WaterFall(usr.loc)
mob/build/verb/Woodenfloor()
	set category="Build";new /turf/Wood(usr.loc)
mob/build/verb/Wall_TL()
	set category="Build";new /obj/build/Wall_TL(usr.loc)
mob/build/verb/Wall_TR()
	set category="Build";new /obj/build/Wall_TR(usr.loc)
mob/build/verb/Wall_Top()
	set category="Build";new /obj/build/Wall_Top(usr.loc)
mob/build/verb/Wall_BL()
	set category="Build";new /obj/build/Wall_BL(usr.loc)
mob/build/verb/Wall_BR()
	set category="Build";new /obj/build/Wall_BR(usr.loc)
mob/build/verb/Wall_Side()
	set category="Build";new /obj/build/Wall_Side(usr.loc)


mob/var/build=0


mob/Admin1/verb/Toggle_Build_Tab()
	set category="Admin"
	if(usr.build==0)
		usr.build=1
		usr.verbs+=typesof(/mob/build/verb/)
	else
		usr.build=0
		usr.verbs-=typesof(/mob/build/verb/)

/build/verb/Pillar()
	set category="Build"
	var/obj/build/Pillar1/a=new(usr.loc)
	var/obj/build/Pillar2/b=new(usr.loc)
	var/obj/build/Pillar3/c=new(usr.loc)
	a.loc=locate(usr.x,usr.y,usr.z)
	b.loc=locate(usr.x,usr.y+1,usr.z)
	c.loc=locate(usr.x,usr.y+2,usr.z)

obj/build/Floor1
	name="Konohagakure Online";icon='Icons.dmi';icon_state="floor1"
obj/build/Floor2
	name="Konohagakure Online";icon='Icons.dmi';icon_state="floor2"
obj/build/Dirt
	name="Konohagakure Online";icon='Icons.dmi';icon_state="dirt"
obj/build/Screen
	name="Konohagakure Online";icon='Icons.dmi';icon_state="sign5";opacity=1;layer=10000000000
obj/build/Pillar1
	name="Konohagakure Online";icon='Icons.dmi';icon_state="Pillar1";density=1
obj/build/Pillar2
	name="Konohagakure Online";icon='Icons.dmi';icon_state="Pillar2";layer=1000000000
obj/build/Pillar3
	name="Konohagakure Online";icon='Icons.dmi';icon_state="Pillar3";layer=1000000000
obj/build/Wall_TL
	name="Konohagakure Online";icon='Icons.dmi';icon_state="topleft";density=1;opacity=1
obj/build/Wall_TR
	name="Konohagakure Online";icon='Icons.dmi';icon_state="topright";density=1;opacity=1
obj/build/Wall_Top
	name="Konohagakure Online";icon='Icons.dmi';icon_state="top";density=1;opacity=1
obj/build/Wall_BL
	name="Konohagakure Online";icon='Icons.dmi';icon_state="bottomleft";density=1;opacity=1
obj/build/Wall_BR
	name="Konohagakure Online";icon='Icons.dmi';icon_state="bottomright";density=1;opacity=1
obj/build/Wall_Side
	name="Konohagakure Online";icon='Icons.dmi';icon_state="side";density=1;opacity=1
obj/var/build=0
turf/var/build=0



























































































































































