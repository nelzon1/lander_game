extends Area2D
signal hit


@export var velocity = Vector2.ZERO
@export var velocity_max = Vector2(1000.0,1000.0)
@export var velocity_min = Vector2(-1000.0,-1000.0)
@export var velocity_angle = 45.0
@export var acceleration = 10.0
var theta = velocity_angle / 180.0 * PI
var x_comp = cos(theta)
var y_comp = sin(theta)
var vel_vec_left = Vector2(x_comp, -1.0 * y_comp)
var vel_vec_right = Vector2(-1.0 * x_comp, -1.0 * y_comp)
@export var gravity_strength = 4.0
var vec_gravity = Vector2(0,1.0) * gravity_strength

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_left"):
		velocity += vel_vec_left * acceleration
	if Input.is_action_pressed("move_right"):
		velocity += vel_vec_right * acceleration
	velocity += vec_gravity
	#velocity = velocity.clamp(velocity_min, velocity_max)
	position += velocity * delta
	
	
		
	
