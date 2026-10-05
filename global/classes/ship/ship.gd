@tool
extends TileMapLayer
class_name ShipInterior

const DEFAULT_SHIP_TILE_SET = preload("uid://ejp47dcn53oo")

@export var player_ship: CharacterBody2D

@export var breakable_panel: TileMapLayer
@export var breakable_electrical: TileMapLayer
@export var breakable_glass: TileMapLayer

var last_child_count: int = 0

class BrokenWarning:
	extends Sprite2D
	
	func _ready() -> void:
		pass
	
	func popup():
		pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile_set = DEFAULT_SHIP_TILE_SET
	await get_tree().process_frame
	if !Engine.is_editor_hint():
		damage_over_time()

func damage_over_time() -> void:
	damage_ship()
	await get_tree().create_timer(randi_range(30, 40)).timeout
	damage_over_time()

func damage_ship() -> void:
	
	for i in range(randi_range(0, 1)):
		var count: int = 0
		for cell_position in breakable_panel.get_used_cells():
			count += 1
		for cell_position in breakable_panel.get_used_cells():
			if breakable_panel.get_cell_tile_data(cell_position).get_custom_data("broken") == false:
				if randf() > 1.0 / count:
					player_ship.add_warning(cell_position)
					breakable_panel.erase_cell(cell_position)
					breakable_panel.set_cell(cell_position, 0, Vector2(0, 1))
					break
		var broken: int = 0
		for cell_position in breakable_panel.get_used_cells():
			if breakable_panel.get_cell_tile_data(cell_position).get_custom_data("broken") == true:
				broken += 1
		if broken >= count:
			get_tree().change_scene_to_file.call_deferred("res://scenes/main/CutsceneIntro/node_2d.tscn")
	
	
	for i in range(randi_range(0, 1)):
		var count: int = 0
		for cell_position in breakable_glass.get_used_cells():
			count += 1
		for cell_position in breakable_glass.get_used_cells():
			if breakable_glass.get_cell_tile_data(cell_position).get_custom_data("broken") == false:
				if randf() > 1.0 / count:
					player_ship.add_warning(cell_position)
					breakable_glass.erase_cell(cell_position)
					breakable_glass.set_cell(cell_position, 0, Vector2(3, 2))
					break
		var broken: int = 0
		for cell_position in breakable_glass.get_used_cells():
			if breakable_glass.get_cell_tile_data(cell_position).get_custom_data("broken") == true:
				broken += 1
	
		if broken >= count:
			get_tree().change_scene_to_file.call_deferred("res://scenes/main/CutsceneIntro/node_2d.tscn")
	
	
	for i in range(randi_range(0, 1)):
		var count: int = 0
		for cell_position in breakable_electrical.get_used_cells():
			count += 1
		for cell_position in breakable_electrical.get_used_cells():
			if breakable_electrical.get_cell_tile_data(cell_position).get_custom_data("broken") == false:
				if randf() > 1.0 / count:
					player_ship.add_warning(cell_position)
					breakable_electrical.erase_cell(cell_position)
					breakable_electrical.set_cell(cell_position, 0, Vector2(2, 1))
					break
		var broken: int = 0
		for cell_position in breakable_electrical.get_used_cells():
			if breakable_electrical.get_cell_tile_data(cell_position).get_custom_data("broken") == true:
				broken += 1
		if broken >= count:
			get_tree().change_scene_to_file.call_deferred("res://scenes/main/CutsceneIntro/node_2d.tscn")


func _validate_property(property: Dictionary) -> void:
	if property.name == "tile_set":
		property.usage &= PROPERTY_USAGE_NO_EDITOR
