extends CharacterBody2D
signal crash
signal land
signal update_velocity(vel)
signal update_health(hp)

var velocity_max = Vector2(1000.0,1000.0)
var velocity_min = Vector2(-1000.0,-1000.0)
@export var velocity_angle = 45.0
@export var acceleration = 10.0
@export var rotation_speed = 0.01
var theta = velocity_angle / 180.0 * PI
var x_comp = cos(theta)
var y_comp = sin(theta)
var vel_vec_left = Vector2(x_comp, -1.0 * y_comp)
var vel_vec_right = Vector2(-1.0 * x_comp, -1.0 * y_comp)
@export var gravity_strength = 20.0
var vec_gravity = Vector2(0,1.0) * gravity_strength
var isInWinArea = false
var maxRotation = PI / 12.0
var active = true
var hitPoints = 100

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	$Explosion.hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if active:
		if Input.is_action_pressed("move_left"):
			velocity += vel_vec_left * acceleration
			rotation += rotation_speed
			rotation = clamp(rotation,0, maxRotation)
			$RocketParticlesRight.set_emitting(true)
		else:
			$RocketParticlesRight.set_emitting(false)
			
		if Input.is_action_pressed("move_right"):
			velocity += vel_vec_right * acceleration
			rotation -= rotation_speed
			rotation = clamp(rotation,-1.0 * maxRotation,0)
			$RocketParticlesLeft.set_emitting(true)
		else:
			$RocketParticlesLeft.set_emitting(false)
		update_velocity.emit(velocity)

func _physics_process(delta):
	velocity += vec_gravity
	#velocity = velocity.clamp(velocity_min, velocity_max)
	var collision_info = move_and_collide(velocity * delta)
	if (collision_info):
		_collide(collision_info)
		
func _collide(collision_info):
	var vel = velocity.length_squared()
	if (vel > 100000.0):
		_crash()
		hitPoints = 0
	elif (vel < 400.0 && isInWinArea):
		_land()
	var bouncedVelocity = velocity.bounce(collision_info.get_normal())
	var hitIntensity = (velocity - bouncedVelocity).length() / 50.0
	if hitIntensity > 3.0:
		hitPoints = clamp(hitPoints - hitIntensity, 0, 100)
	if hitPoints == 0:
		_crash()
	velocity = bouncedVelocity * 0.5
	update_health.emit(hitPoints)


func _crash():
	crash.emit()
	$Explosion.show()
	var r = randi() % 3 + 1
	get_node("CrashSound" + str(r)).play()
	self.set_physics_process(false)
	active = false

func _land():
	land.emit()
	$LandSound.play()
	self.set_physics_process(false)
	active = false

func startLevel():
	pass


func _on_win_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body == self:
		isInWinArea = true
