extends Area2D

signal person_saved

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body is Player:
		emit_signal("person_saved")
		queue_free()
