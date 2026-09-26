extends RigidBody2D

@export var sprite_2d: AnimatedSprite2D

var speed = randi_range(50, 100)

var a = randi_range(1, 2)

func _ready() -> void:
	sprite_2d.animation = str(a)
	
	rotate(randi_range(0, 360))
	linear_velocity = speed * Vector2.RIGHT.rotated(rotation)
