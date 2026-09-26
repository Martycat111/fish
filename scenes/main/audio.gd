extends AudioStreamPlayer2D


var audio1 = load("res://misc/music/Background Music Loop for Shooting.mp3")
var audio2 = load("res://misc/music/Repair music.mp3")
var is_alt = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func changemusic():
	if is_alt:
		is_alt = false
		self.set_stream(audio1)
	else:
		is_alt = true
		self.set_stream(audio2)
	self.play()
