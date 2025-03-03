mob/Move() // Move proc
	if(src.move) // If the move var is 1...
		if(usr.grabber)
			usr.Escape_Chance()
			return
		else
			..() // Continue process
	else // If its not 1...
		return // Stop movement