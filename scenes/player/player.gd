extends CharacterBody2D

var jump_velocity: float = 10
var speed: float = 10

func _physics_process(delta: float) -> void:
	
	velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jump_velocity
	
	velocity.x += speed * (Input.get_action_strength("move_left") - Input.get_action_strength("move_right"))
	
	move_and_slide()
