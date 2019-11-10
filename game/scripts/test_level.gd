extends Node2D

onready var player = $player
onready var fuel_label = $Label

func _ready():
	player.connect("remaining_fuel", self, "_on_fuel_update")

func _on_fuel_update(fuel : float):
	fuel_label.text = "REMAINING FUEL: %f" % fuel
