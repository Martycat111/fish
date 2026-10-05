extends Node2D

@export var animation_player: AnimationPlayer
@export var options: Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await animation_player.animation_finished
	options.show()


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit(0)
