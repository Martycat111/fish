extends Node2D

@export var animation_player: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")
