extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var rod_bent = load("res://misc/textures/Fishingrodbent.png")
var rod = load("res://misc/textures/Fishingrod.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()



func _on_rod_area_body_entered(body: Node2D) -> void:
	if body is RigidBody2D and !body.has_meta("collected"):
		var collect_tween: Tween = create_tween()
		body.set_meta("collected", true)
		body.get_child(1).set_deferred("disabled", true)
		collect_tween.tween_property(body, "scale", Vector2(0.01, 0.01), 1)
		await get_tree().create_timer(1).timeout
		body.get_parent().queue_free()
		Asteroid.breakdown()
