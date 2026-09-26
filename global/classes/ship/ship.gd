@tool
extends TileMapLayer
class_name Ship

const DEFAULT_SHIP_TILE_SET = preload("uid://ejp47dcn53oo")

signal tile_changed

enum Tiles {
	TestTile,
	Fish,
}

const TILES_TO_RESOURCE: Dictionary = {
	0 : preload("uid://dc06guispl5r7"),
	1 : preload("uid://c5s2uqlo5vy0s")
}


@export var tile_to_place: Tiles = Tiles.TestTile

var last_child_count: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile_set = DEFAULT_SHIP_TILE_SET
	last_child_count = get_child_count(true)
	tile_changed.connect(_changed)

func _notification(what: int) -> void:
	if what == NOTIFICATION_CHILD_ORDER_CHANGED:
		tile_changed.emit()

func _changed() -> void:
	if !get_tree():
		return
	await get_tree().process_frame
	await get_tree().process_frame
	var child_count: int = get_child_count()
	if child_count > last_child_count:
		get_child(-1).data = TILES_TO_RESOURCE[tile_to_place]
	last_child_count = get_child_count()


func _validate_property(property: Dictionary) -> void:
	if property.name == "tile_set":
		property.usage &= PROPERTY_USAGE_NO_EDITOR
