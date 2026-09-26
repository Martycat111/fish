extends TileMapLayer


var speed = randi_range(5, 25)

var a = randi_range(0, 3)
var b = randi_range(0, 3)

func _ready() -> void:
	set_cell(Vector2i(0, 0), 0, Vector2i(a, b))
	
	self.rotate(randi_range(0, 360))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position += speed * Vector2.RIGHT.rotated(rotation)
