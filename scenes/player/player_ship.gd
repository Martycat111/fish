extends CharacterBody2D

@export var player: CharacterBody2D
@export var fish_cover: Sprite2D
@export var ship_interior: ShipInterior
@export var wall_layer_1: TileMapLayer
@export var wall_layer_2: TileMapLayer
@export var breakable_panel: TileMapLayer
@export var breakable_electrical: TileMapLayer
@export var breakable_glass: TileMapLayer
@export var camera: Camera2D
@export var label: Label
@export var timer: Timer
@export var parallax_2d: Parallax2D
@export var bg: ColorRect

@onready var music = get_node("../AudioStreamPlayer2D")

const SPEED_TOWARDS_EARTH = 20

var speed: float = 10
var rotation_speed: float = 2

var position_towards_earth: Vector2 = Vector2.ZERO

var warnings: Dictionary[Vector2, Sprite2D] = {}



func add_warning(warning_position: Vector2) -> void:
	var warning: Sprite2D = Sprite2D.new()
	warning.texture = preload("uid://uij5mlym4bpf")
	ship_interior.add_child(warning)
	warnings[warning_position] = warning
	warning.position = warning_position * ship_interior.tile_set.tile_size.x
	warning.centered = false

func remove_warning(warning_position: Vector2) -> void:
	warnings[warning_position].free()
	warnings.erase(warning_position)


func _process(_delta: float) -> void:
	label.text = "Time till planetfall: %s seconds" % str(round(timer.time_left))
	if timer.time_left < 1:
		get_tree().change_scene_to_file.call_deferred("res://scenes/main/CutsceneOutro/Outro cutscene.tscn")
	Globals.xpos = self.position[0]
	Globals.ypos = self.position[1]



func _physics_process(_delta: float) -> void:
	
	position_towards_earth.x += SPEED_TOWARDS_EARTH
	bg.material.set_shader_parameter("offset", global_position + position_towards_earth)
	
	
	if Input.is_action_just_pressed("toggle_ship_mode"):
		music.change_music()
		player.frozen = !player.frozen
		var ship_active: bool = player.frozen
		if ship_active:
			camera.zoom = Vector2(1, 1)
		else:
			camera.zoom = Vector2(1.6, 1.6)
		
		fish_cover.visible = ship_active
		player.visible = !ship_active
		ship_interior.enabled = !ship_active
		wall_layer_1.enabled = !ship_active
		wall_layer_2.enabled = !ship_active
		breakable_panel.enabled = !ship_active
		breakable_electrical.enabled = !ship_active
		breakable_glass.enabled = !ship_active
	
	if !player.frozen:
		return
	
	if is_on_wall():
		velocity = velocity.move_toward(Vector2.ZERO, 0.1)
	
	if Input.is_action_pressed("move_forward"):
		velocity += speed * Vector2.RIGHT.rotated(rotation)
	
	rotation_degrees -= rotation_speed * (Input.get_action_strength("rotate_ship_left") - Input.get_action_strength("rotate_ship_right"))
	
	#bg.rotation = -global_rotation
	
	move_and_slide()
