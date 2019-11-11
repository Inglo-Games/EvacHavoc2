extends Node2D

onready var player = $player
onready var fuel_gauge = $ui/gauge

func _ready():
	player.connect("remaining_fuel", fuel_gauge, "_on_fuel_update")
