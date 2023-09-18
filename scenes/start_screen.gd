extends Node2D
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	start_game.emit()

func onStartLevel(_levelNumber):
	hide()
	
func onStartGame():
	show()
