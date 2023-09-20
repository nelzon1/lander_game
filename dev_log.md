Lander Game Dev Log
-------------------------------------

2023-09-16
----------

	Level 1 art assets created
	Lander art created
	Main scene created

	TO DO:
	------
	Create a start menu
	Create a level housing scene DONE
	Wire up controls for player DONE
	Set collisions on level DONE
	Get a generic sound for the thrusters
	Get a win sound
	Get a bump sound
	Get a crash sound

	Try out a shader for the rocket fire


2023-09-17
----------

	Moving the lander -> x seems to be right ,but I get no movement in the y and and there's no collision detection.

	Scene Transitioning:
		We should change the level to have a start location node
		Change the level to just load it it up from file for now
		remove teh start screen scene
		swap that back in when we quit to menu?
		We need a hud
		We should show an explosion if crash is too hard
			Crash detection


2023-09-19
-----------
	HUD:
		Speed Meter
		Life Meter?
		Restart button
		LevelView will own an instance of the hud and show it when the level starts
		We need to wire the signal of the restart button back to the level view DONE

