extends Area2D
signal hit


@export var velocity = Vector2.ZERO
@export var velocity_max = Vector2(1000,1000)
@export var velocity_min = Vector2(-1000,-1000)
@export var velocity_angle = 45
@export var acceleration = 1000
var vel_vec_left = Vector2(cos( velocity_angle / 180 * PI), 1 * sin( velocity_angle / 180 * PI))
var vel_vec_right = Vector2(-1 * cos( velocity_angle / 180 * PI), 1 * sin( velocity_angle / 180 * PI))

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x = velocity.x + (cos( velocity_angle / 180 * PI) * acceleration)
		velocity.y = velocity.y - (sin( velocity_angle / 180 * PI) * acceleration) * 100
	if Input.is_action_pressed("move_right"):
		velocity.x = velocity.x - (cos( velocity_angle / 180 * PI) * acceleration)
		velocity.y = velocity.y - (sin( velocity_angle / 180 * PI) * acceleration) * 100
		
	#velocity = velocity.clamp(velocity_min, velocity_max)
	position += velocity * delta
	
	
		
	
