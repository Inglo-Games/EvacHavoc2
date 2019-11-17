extends Control

func _on_start_btn_up():
	get_tree().change_scene("res://scenes/levels/01.tscn")

func _on_tut_btn_up():
	get_tree().change_scene("res://scenes/levels/tutorial.tscn")

func _on_quit_btn_up():
	get_tree().quit()
