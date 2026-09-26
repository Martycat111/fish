@tool
extends TileMapLayer
class_name ShipInterior

const DEFAULT_SHIP_TILE_SET = preload("uid://ejp47dcn53oo")


var last_child_count: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile_set = DEFAULT_SHIP_TILE_SET


func _validate_property(property: Dictionary) -> void:
	if property.name == "tile_set":
		property.usage &= PROPERTY_USAGE_NO_EDITOR
