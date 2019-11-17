extends Control

onready var label = $label

var lines = []
var current_line = 0

func _ready():
	set_process_input(true)
	connect("gui_input", self, "_on_dialog_clicked")

func _on_dialog_clicked(ev):
	if ev is InputEventMouseButton and not ev.pressed:
		print("Dialog clicked...")
		if current_line < len(lines) - 1:
			current_line += 1
			label.text = lines[current_line]
		else:
			get_tree().paused = false
			queue_free()

func set_lines(string_array):
	lines = string_array
	current_line = 0
	label.text = lines[current_line]
