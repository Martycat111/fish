extends CharacterBody2D

@export var breakable_panel: TileMapLayer
@export var breakable_electrical: TileMapLayer
@export var breakable_glass: TileMapLayer


var jump_velocity: float = 500
var speed: float = 10
var frozen: bool = true

func _physics_process(delta: float) -> void:
	if frozen:
		return
	
	
	velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jump_velocity
			
	if Input.is_action_just_pressed("repair"):
		var rounded_position: Vector2i = (position / 32).floor()
		if breakable_panel.get_used_cells().has(rounded_position):
			if Asteroid.items.has("Stone") and Asteroid.items.has("Iron"):
				breakable_panel.erase_cell(rounded_position)
				breakable_panel.set_cell(rounded_position, 0, Vector2(1, 1))
			else:
				Asteroid.noter.notify_string("Not enough items")
			
		if breakable_electrical.get_used_cells().has(rounded_position):
			if Asteroid.items.has("Gold") and Asteroid.items.has("Copper"):
				breakable_electrical.erase_cell(rounded_position)
				breakable_electrical.set_cell(rounded_position, 0, Vector2(3, 1))
			else:
				Asteroid.noter.notify_string("Not enough items")
		
		if breakable_glass.get_used_cells().has(rounded_position):
			if Asteroid.items.has("Stone") and Asteroid.items.has("Copper"):
				breakable_glass.erase_cell(rounded_position)
				breakable_glass.set_cell(rounded_position, 0, Vector2(2, 2))
			else:
				Asteroid.noter.notify_string("Not enough items")
	
	velocity.x -= speed * (Input.get_action_strength("move_left") - Input.get_action_strength("move_right"))
	
	move_and_slide()
