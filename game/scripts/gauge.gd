extends Control

const EMPTY_ANGLE : float = -PI / 3.0

onready var needle = $needle

func _on_fuel_update(percentage : float):
	needle.rotation = lerp_angle(EMPTY_ANGLE, -EMPTY_ANGLE, percentage)
	if percentage < 0.15:
		$warning_audio.play()
