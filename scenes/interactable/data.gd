@tool
extends Resource
class_name InteractableData

signal data_changed

@export var texture: Texture2D:
	set(new_texture):
		texture = new_texture
		data_changed.emit()
