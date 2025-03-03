var/list/players=list()

client
	New()
		players+=src
		for(var/client/C in players) //for every player online
			C.OutputPlayers() //Update their players grid
		..()
	Del()
		players-=src
		..()
	proc/OutputPlayers()
		for(var/client/C in players)
			//for each client in the players list
			src<<output("[C] ([C.key])", "players")
			//output it to the players grid