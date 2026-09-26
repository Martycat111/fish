extends CharacterBody2D

@export var player: CharacterBody2D
@export var fish_cover: Sprite2D
@export var ship_interior: ShipInterior
@export var wall_layer_1: TileMapLayer
@export var wall_layer_2: TileMapLayer

var speed: float = 10
var rotation_speed: float = 2



func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("toggle_ship_mode"):
		player.frozen = !player.frozen
		var ship_active: bool = player.frozen
		
		fish_cover.visible = ship_active
		player.visible = !ship_active
		ship_interior.enabled = !ship_active
		wall_layer_1.enabled = !ship_active
		wall_layer_2.enabled = !ship_active
	
	if !player.frozen:
		return
	
	if Input.is_action_pressed("move_forward"):
		velocity += speed * Vector2.RIGHT.rotated(rotation)
	
	rotation_degrees -= rotation_speed * (Input.get_action_strength("rotate_ship_left") - Input.get_action_strength("rotate_ship_right"))
	move_and_slide()
