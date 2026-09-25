extends Sprite2D
class_name Interactable

@export var data: InteractableData

func _enter_tree() -> void:
	data.data_changed.connect(_data_changed)
	data.data_changed.emit()

func _data_changed() -> void:
	texture = data.texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
