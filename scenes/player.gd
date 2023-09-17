extends CharacterBody2D

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

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_left"):
		velocity += vel_vec_left * acceleration
		rotation += rotation_speed
	if Input.is_action_pressed("move_right"):
		velocity += vel_vec_right * acceleration
		rotation -= rotation_speed

func _physics_process(delta):
	
	velocity += vec_gravity
	#velocity = velocity.clamp(velocity_min, velocity_max)
	var collision_info = move_and_collide(velocity * delta)
	if (collision_info):
		velocity = velocity.bounce(collision_info.get_normal())
		velocity *= 0.5
		

