extends Control
signal redo

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_redo_button_pressed():
	redo.emit()

func reset_HUD():
	$CrashLabel.hide()
	$LandedLabel.hide()
	$RestartButton.hide()
	$HealthPanel/HealthBar.set_value(100)


func _on_restart_button_pressed():
	redo.emit() 

func updateHealth(hp):
	$HealthPanel/HealthBar.set_value(hp)
	
func updateVelocity(vel):
	$SpeedPanel/SpeedLabelsContainer/SpeedLabel.set_text(str(round(vel.length() / 10.0)))
	$SpeedControls/SpeedBall.material.set_shader_parameter("velocity", vel)
