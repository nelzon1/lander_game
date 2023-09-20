extends Node
signal start_game
signal load_level(levelId)

# Called when the node enters the scene tree for the first time.
func _ready():
	show_start_screen()
	$BackgroundMusic.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_start_screen():
	start_game.emit()

func on_start_game():
	var level = preload("res://scenes/level_view.tscn").instantiate()
	remove_child(get_node("StartScreen"))
	add_child(level)
	#level.onStartLevel("1")
	load_level.emit(1)
	
	
