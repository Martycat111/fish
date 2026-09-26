extends Panel

func _ready() -> void:
	get_tree().paused = true

func _on_button_pressed() -> void:
	queue_free()
	get_tree().paused = false
