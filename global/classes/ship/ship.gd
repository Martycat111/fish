@tool
extends TileMapLayer
class_name Ship

const DEFAULT_SHIP_TILE_SET = preload("uid://ejp47dcn53oo")

enum Tiles {
	TestTile,
}

const TILES_TO_RESOURCE: Dictionary = {
	0 : preload("res://misc/datas/TestTile.tres")
}


@export var tile_to_place: Tiles = Tiles.TestTile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile_set = DEFAULT_SHIP_TILE_SET



func _validate_property(property: Dictionary) -> void:
	if property.name == "tile_set":
		property.usage &= PROPERTY_USAGE_NO_EDITOR
