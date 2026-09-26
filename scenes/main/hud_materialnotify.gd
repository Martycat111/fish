extends Node2D


var notification_scene = load("res://scenes/notification/notification.tscn")
var note_is_available = true
signal gaming
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func notify_array(items: Array):
	for i in items:
		notify(i, 1)

func notify(item_name: String, amount: int):
	var instance = notification_scene.instantiate()
	add_child(instance)
	instance.set_text("+" + str(amount) + " " + item_name)
	var anim = instance.get_node("AnimationPlayer")
	print(anim)
	anim.play("Note")
	await anim.animation_finished
	instance.queue_free()
	emit_signal("gaming")
