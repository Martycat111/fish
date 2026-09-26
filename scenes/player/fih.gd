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


func _on_rigid_body_2d_body_entered(body: Node) -> void:
	print("oga boga")
