extends Node2D

onready var player = $player
onready var fuel_gauge = $ui/gauge

func _ready():
	player.connect("remaining_fuel", fuel_gauge, "_on_fuel_update")
	for person in get_tree().get_nodes_in_group("people"):
		person.connect("person_saved", self, "_on_person_saved")

func _on_person_saved():
	var people = get_tree().get_nodes_in_group("people")
	if len(people) == 1:
		print("You win!")
		get_tree().quit()
