extends Node2D
var currentLevel
var currentLevelNum
var startPos = Vector2(500.0,500.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	onStartLevel(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onStartLevel(levelNumber):
	var level = load("res://scenes/level_" + str(levelNumber) + ".tscn").instantiate()
	add_child(level)
	if (currentLevel):
		remove_child(currentLevel)
	currentLevel = level
	currentLevelNum = levelNumber
	connectLevelSignals()
	$HUD.reset_HUD()
	show()

func connectLevelSignals():
	currentLevel.get_node("Player").land.connect(onPlayerLand)
	currentLevel.get_node("Player").crash.connect(onPlayerCrash)
	currentLevel.get_node("Player").update_velocity.connect($HUD.updateVelocity)
	currentLevel.get_node("Player").update_health.connect($HUD.updateHealth)

func onStartgame():
	hide()

func onPlayerCrash():
	$HUD/CrashLabel.show()
	$HUD/RestartButton.show()
	
func onPlayerLand():
	$HUD/LandedLabel.show()
	$HUD/RestartButton.show()

func onRestartLevel():
	onStartLevel(currentLevelNum)

func _on_hud_redo():
	onStartLevel(currentLevelNum)
