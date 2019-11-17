extends Node2D

var PausePopup = preload("res://scripts/pause_popup.gd")

onready var player = $player
onready var helipad = $helipad
onready var fuel_gauge = $ui/gauge

var dialogue_text = []

func _ready():
	player.connect("remaining_fuel", fuel_gauge, "_on_fuel_update")
	helipad.connect("body_entered", self, "_on_helipad_land")

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_pause_game()

func _pause_game():
	var pause_menu = PausePopup.instance()
	add_child(pause_menu)
	pause_menu.popup_centered()
	pause_menu.connect("quit_game", self, "_on_quit_game")
	get_tree().set_pause(true)

func _on_quit_game():
	get_tree().quit()

func _on_helipad_land(body):
	if body is Player and len(get_tree().get_nodes_in_group("people")) == 0:
		$applause.play()
		yield($applause, "finished")
		_on_quit_game()
