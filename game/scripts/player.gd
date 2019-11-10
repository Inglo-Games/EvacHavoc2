extends KinematicBody2D
class_name Player

# Constants
const MOVE_SPEED : int = 400
const MOVE_ANGLE : float = 23.0
const FUEL_MAX : float = 500.0

# State variables
var velocity : Vector2 = Vector2()
var fuel : float = FUEL_MAX

# Signals
signal remaining_fuel

func _physics_process(delta):
	
	var direction : Vector2 = Vector2(0, 0)
	
	if fuel > 0:
		if Input.is_action_pressed("move_right"):
			direction.x += 1
			direction.y -= 0.2
			fuel -= 0.06
		if Input.is_action_pressed("move_left"):
			direction.x -= 1
			direction.y -= 0.2
			fuel -= 0.06
		if Input.is_action_pressed("move_down"):
			direction.y += 1
			fuel -= 0.04
		if Input.is_action_pressed("move_up"):
			direction.y -= 1
			fuel -= 0.07
	else:
		direction.y += 3
	
	velocity.x = lerp(velocity.x, direction.x * MOVE_SPEED, 0.1)
	velocity.y = lerp(velocity.y, direction.y * MOVE_SPEED, 0.1)
	rotation = lerp_angle(rotation, deg2rad(direction.x * MOVE_ANGLE), 0.04)
	var collision_info = move_and_collide(velocity * delta)
	
	if is_on_floor():
		# If just sitting on ground...
		fuel -= 0.03
	elif direction.y > 0:
		# If moving down (and maybe sideways)...
		fuel -= 0.04
	elif direction.y <= 1:
		# If moving up (and maybe sideways)...
		fuel -= 0.09
	elif direction.x == 1 or direction.x == -1:
		# If moving sideways without up or down...
		fuel -= 0.07
	else:
		# If just hovering...
		fuel -= 0.05
	
	emit_signal("remaining_fuel", fuel)
