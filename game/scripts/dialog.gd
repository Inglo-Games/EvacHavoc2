extends Control

var lines = []
var current_line = 0

func _ready():
	set_process_input(true)
	connect("gui_input", self, "_on_dialog_event")

func _input(event):
	_on_dialog_event(event)

func _on_dialog_event(ev):
	if (ev is InputEventMouseButton or ev is InputEventKey) and not ev.pressed:
		if current_line < len(lines) - 1:
			current_line += 1
			$label.text = lines[current_line]
		else:
			get_tree().paused = false
			queue_free()

func set_lines(string_array):
	lines = string_array
	current_line = 0
	$label.text = lines[current_line]
