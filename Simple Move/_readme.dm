/*

				-- Introduction --

This library provides users with simple alternatives to BYOND's default
KEY+REP control scheme. It uses KEY+UP and KEY+DOWN macros as a way to
process different movement commands at once.



				-- Movement Types --

DEFAULT (move-default.dm)
	This is very similar to the KEY+REP control scheme, the only major
	difference is it keeps track of key dominance. It will prefer to
	move the player in whichever direction they pressed first.

DIAGONAL (move-diagonal.dm)
	This enables fluid 8-directional movement. It combines
	cardinal directions (north,south,east,west) and outputs
	ordinal directions (northeast,northwest,southeast,southwest)
	which enables players to step diagonally.

STRAFE (move-strafe.dm)
	This is almost the same as move-diagonal.dm, the difference being
	it intelligently chooses when to update the player's direction.
	It allows the player to face in one direction while moving in another.



				-- Implementation --

To use this library you must include macros.dm and whichever movement type
you prefer. You may only include one movement type, they don't work together.
If you want to switch between all three movement types at runtime then use
move-dynamic.dm - the variable move_type is used to pick the movement type.

All movement commands are tied to /mob/player. This is strictly for mobs being
controlled by human players, it is not intended to be used for NPC's. If your
game uses a different mob type for players, simply change the type path to suit
your needs.

Call MovementLoop() when first spawning your player's mob to enable movement.

The file demo.dm, the icons, and the map are used strictly for demo purposes,
do not include them in your game.

*/