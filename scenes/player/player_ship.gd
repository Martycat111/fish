extends CharacterBody2D

var speed: float = 10
var rotation_speed: float = 2


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_forward"):
		velocity += speed * Vector2.RIGHT.rotated(rotation)
	rotation_degrees -= rotation_speed * (Input.get_action_strength("rotate_ship_left") - Input.get_action_strength("rotate_ship_right"))
	
	
	move_and_slide()
