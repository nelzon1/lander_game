extends Node2D
var currentLevel
var startPos = Vector2(500.0,500.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	onStartLevel(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onStartLevel(levelNumber):
	#$Player.start()
	#$Level_1
	#Get the appropriate level scene and add it to the node
	var level = load("res://scenes/level_" + str(levelNumber) + ".tscn").instantiate()
	add_child(level)
	if (currentLevel):
		remove_child(currentLevel)
	currentLevel = level
	#Get the new scene's location for the player
	#Set the player location
	#Show the new scene
	#Delete the old one
	#var level = preload("res://scenes/level_" + levelNumber + ".tscn")
	show()

func onStartgame():
	hide()
