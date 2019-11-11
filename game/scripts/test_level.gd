extends Node2D

onready var player = $player
onready var fuel_gauge = $gauge

func _ready():
	player.connect("remaining_fuel", $gauge, "_on_fuel_update")
