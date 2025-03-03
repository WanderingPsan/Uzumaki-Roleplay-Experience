#include "map.dmm"
#define MOVEMENTDEMO 0

world
	map_format=TOPDOWN_MAP
	mob=/mob/player

turf
	icon='grass.dmi'
	New()
		..()
		src.icon_state="[rand(1,2)]"

client
	perspective=EDGE_PERSPECTIVE
	view=8

mob/player
	icon='player.dmi'
	icon_state="idle"

	//	This works just fine with pixel movement, just make sure to lower the move_delay.
	//step_size=8

	New()
		..()
		src.loc=locate(10,10,1)
		spawn()
			src<<"Use the WASD keys to move."


	verb
		DisableMove()
			move_disabled=1
			src<<"Movement is now disabled."

		EnableMove()
			move_disabled=0
			src<<"Movement is now enabled!"

		ChangeSpeed()
			var/speed=input(src,"Change speed to what?","Change Speed",move_delay) as num
			if(speed<0)speed=0
			move_delay=speed


		//	If you're not using move-dynamic.dm then remove this command.
		MovementStyle()
			switch(move_type)
				if(0)
					src<<"move_type: DIAGONAL"
					move_type=1
				if(1)
					src<<"move_type: STRAFE"
					move_type=2
				if(2)
					src<<"move_type: DEFAULT"
					move_type=0