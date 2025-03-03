obj/Buildject
	icon = 'Buildject.dmi'
	Grass
		icon='Grass1.dmi'
		icon_state="c"
		Click()
			new/turf/Terrain/Grass/Center(usr.loc)

	Water
		icon = 'Turf.dmi'
		icon_state = "water"
		Click()
			new/turf/Terrain/Water(usr.loc)

	Bottom_Left_Corner_Roof
		icon='ShopInside.dmi'
		icon_state = "19"
		Click()
			new/turf/Interior/Shop/t18(usr.loc)

	Top_Left_Corner_Roof
		icon='ShopInside.dmi'
		icon_state = "14"
		Click()
			new/turf/Interior/Shop/t14(usr.loc)

	Top_Right_Corner_Roof
		icon='ShopInside.dmi'
		icon_state = "16"
		Click()
			new/turf/Interior/Shop/t16(usr.loc)

	Bottom_Right_Corner_Roof
		icon='ShopInside.dmi'
		icon_state = "20"
		Click()
			new/turf/Interior/Shop/t19(usr.loc)

	Top_Bottom_Roof
		icon='ShopInside.dmi'
		icon_state = "15"
		Click()
			new/turf/Interior/Shop/t15(usr.loc)

	Left_Right_Roof
		icon='ShopInside.dmi'
		icon_state = "17"
		Click()
			new/turf/Interior/Shop/t17(usr.loc)

	Wood_Floor
		icon='Turf.dmi'
		icon_state="wood"
		Click()
			new/turf/Wood(usr.loc)

	Stone_Floor
		icon='RamenInside.dmi'
		icon_state="floor"
		Click()
			new/turf/Interior/Ramen/floor(usr.loc)

	Blue_Stone_Floor
		icon='HospitalInside.dmi'
		icon_state = "20"
		Click()
			new/turf/Interior/Hospital/t20(usr.loc)

	Four_Brick_Floor
		icon='RoomInside.dmi'
		icon_state="1"
		Click()
			new/turf/Interior/HospitalRoom/t1(usr.loc)

	Prison_Door
		icon='InteriorDeco.dmi'
		icon_state="Celldoor"
		Click()
			new/obj/Prison_Door(usr.loc)

	Hospital_Door
		icon='InteriorDeco.dmi'
		icon_state="Hospitaldoor"
		Click()
			new/obj/Hospital_Door(usr.loc)
	Door
		icon='InteriorDeco.dmi'
		icon_state="Door"
		Click()
			new/obj/Door(usr.loc)

	Inside_Wall_One
		icon = 'Wall1.dmi'
		Click()
			new/turf/Wall1(usr.loc)
			new/obj/UpDense(usr.loc)

	Inside_Wall_Two
		icon = 'Wall2.dmi'
		Click()
			new/turf/Wall2(usr.loc)
			new/obj/UpDense(usr.loc)

	Outside_Wall_One
		icon = 'OWall1.dmi'
		Click()
			new/turf/OutsideWall1(usr.loc)
			new/obj/UpDense(usr.loc)

	Large_Window_Wall
		icon = 'LargeWindowWall.dmi'
		Click()
			new/turf/LargeWindowWall(usr.loc)
			new/obj/SixthDense(usr.loc)

	Door_One
		icon = 'Door1.dmi'
		Click()
			new/turf/Door1(usr.loc)

	Door_Topper_Top_or_Bottom
		icon = 'RamenInside.dmi'
		icon_state = "TBwall"
		Click()
			new/turf/DoorTopperTB(usr.loc)

	Door_Topper_Left_or_Right
		icon = 'RamenInside.dmi'
		icon_state = "lrwall"
		Click()
			new/turf/DoorTopperLR(usr.loc)
	Blue_Bed
		icon = 'BlueBed.dmi'
		Click()
			new/obj/BlueBed(usr.loc)
	SandPath
		icon='Dirt1.dmi'
		icon_state="c"
		Click()
			new/turf/Terrain/Grass/Path(usr.loc)

	Pillar
		icon = 'Pillar.dmi'
		Click()
			new/obj/Pillar(usr.loc)


obj/SmallHouse
	icon = 'Small House.dmi'
	density = 1
	New()
		new/obj/Prison_Door(src)









turf
	Wall1
		icon = 'Wall1.dmi'
		density = 1
	OutsideWall1
		icon = 'OWall1.dmi'
		density
	Wall2
		icon = 'Wall2.dmi'
		density
	LargeWindowWall
		icon = 'LargeWindowWall.dmi'
		density
	Door1
		icon = 'Door1.dmi'
		layer = 2
	DoorTopperTB
		icon = 'RamenInside.dmi'
		icon_state = "tbwall"
		layer = 100
	DoorTopperLR
		icon = 'RamenInside.dmi'
		icon_state = "lrwall"
		layer = 100

obj
	BlueBed
		icon = 'BlueBed.dmi'
		layer = 2
	UpDense
		icon = 'Updense.dmi'
	SixthDense
		icon = 'SixthDense.dmi'
	RightDense
		icon = 'Dense.dmi'
	SingleDense
		density = 1
	Pillar
		icon = 'Pillar.dmi'
		density = 1
		layer = 100