extends Node2D

var PausePopup = preload("res://scripts/pause_popup.gd")

onready var player = $player
onready var fuel_gauge = $ui/gauge

func _ready():
	player.connect("remaining_fuel", fuel_gauge, "_on_fuel_update")
	for person in get_tree().get_nodes_in_group("people"):
		person.connect("person_saved", self, "_on_person_saved")

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_pause_game()

func _on_person_saved():
	var people = get_tree().get_nodes_in_group("people")
	if len(people) == 1:
		print("You win!")
		get_tree().quit()

func _pause_game():
	$ui/pause_menu.popup_centered()
	$ui/pause_menu.connect("quit_game", self, "_on_quit_game")
	get_tree().set_pause(true)

func _on_quit_game():
	get_tree().quit()
