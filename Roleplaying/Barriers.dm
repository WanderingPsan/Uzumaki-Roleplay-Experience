obj/items/Citem/Barrier_Tag
	icon = 'BarrierTag.dmi'
	Entered()
		var/obj/O
		if(istype(O,/obj/BarrierWall))
			walk(O,0)

	var
		Placed = 0
	verb
		Place()
			set src in usr.contents
			src.loc=usr.loc
			src.Placed = 1
			src.Bolted = 1
			src.Bolter = usr
		Connect()
			set src in view(2)
			if(!src.Placed)
				usr<<"Place it first!"
				return
			var/list/G = new
			for(var/obj/items/Citem/Barrier_Tag/A in orange(10))
				G.Add(A)
			var/Connecta = input("Which Tag will you connect to?") in G + list("Cancel")
			var/obj/BarrierWall/B = new
			B.loc=src.loc
			B.dir=src.dir
			B.Taggit = src
			walk_towards(B,Connecta)
			return
		Remove()
			set src in view(2)
			for(var/obj/BarrierWall/A in world)
				if(A.Taggit == src)
					del A
			src.loc = usr
			src.Bolted = 0
			src.Bolter = null
			src.Placed = 0
			return



obj/BarrierWall
	icon = 'Barrier.dmi'
	density = 1
	var
		Taggit = null

	Move()
		var/obj/BarrierWall/A = new
		A.loc = src.loc
		A.dir = src.dir
		A.Taggit = src.Taggit
		..()