extends Node

onready var bgm_player : AudioStreamPlayer = AudioStreamPlayer.new()
onready var stream : AudioStreamOGGVorbis = preload("res://assets/sfx/RevvedUp.ogg")

func _ready():
	bgm_player.volume_db = -18.5
	bgm_player.set_stream(stream)
	get_tree().get_root().call_deferred("add_child", bgm_player)
	bgm_player.play()
