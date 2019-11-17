extends Node2D

var PausePopup = preload("res://scripts/pause_popup.gd")

export var dialogue_text = []
export var next_scene = "res://scenes/menu.tscn"

func _ready():
	$player.connect("remaining_fuel", $ui/gauge, "_on_fuel_update")
	$helipad.connect("body_entered", self, "_on_helipad_land")
	for person in get_tree().get_nodes_in_group("people"):
		person.connect("person_saved", self, "_on_person_saved")
	
	_on_person_saved()
	if dialogue_text != []:
		$ui/dialog.set_lines(dialogue_text)
		$ui/dialog.visible = true

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_pause_game()

func _pause_game():
	var pause_menu = PausePopup.new()
	$ui.add_child(pause_menu)
	pause_menu.popup_centered()
	pause_menu.connect("quit_game", self, "_on_quit_game")
	get_tree().set_pause(true)

func _on_quit_game():
	get_tree().quit()

func _on_person_saved():
	var rem = len(get_tree().get_nodes_in_group("people"))
	$ui/remain_label.text = "%d people left" % rem

func _on_helipad_land(body):
	if body is Player and len(get_tree().get_nodes_in_group("people")) == 0:
		$applause.play()
		yield($applause, "finished")
		if next_scene != "":
			get_tree().change_scene(next_scene)
