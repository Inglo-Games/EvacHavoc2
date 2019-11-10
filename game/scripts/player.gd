extends KinematicBody2D
class_name Player

# Constants
const MOVE_SPEED : int = 400
const MOVE_ANGLE : float = 23.0

# State variables
var velocity : Vector2 = Vector2()

func _physics_process(delta):
	
	var direction : Vector2 = Vector2(0, 0)
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		direction.y -= 0.2
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		direction.y -= 0.2
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	
	velocity.x = lerp(velocity.x, direction.x * MOVE_SPEED, 0.1)
	velocity.y = lerp(velocity.y, direction.y * MOVE_SPEED, 0.1)
	rotation = lerp_angle(rotation, deg2rad(direction.x * MOVE_ANGLE), 0.04)
	move_and_collide(velocity * delta)
