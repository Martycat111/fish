@tool
extends TileMapLayer
class_name Ship


const DEFAULT_SHIP_TILE_SET = preload("uid://ejp47dcn53oo")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile_set = DEFAULT_SHIP_TILE_SET


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _validate_property(property: Dictionary) -> void:
	if property.name == "tile_set":
		property.usage &= PROPERTY_USAGE_NO_EDITOR
