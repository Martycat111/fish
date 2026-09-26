extends Node2D


var notification_scene = load("res://scenes/notification/notification.tscn")
var anim

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_rotation = 0

func notify_array(al: Array):
	for i in al:
		notify(i, 1)
		await anim.animation_finished
	

func notify(item_name: String, amount: int):
	var instance = notification_scene.instantiate()
	add_child(instance)
	instance.set_text("+" + str(amount) + " " + item_name)
	anim = instance.get_node("AnimationPlayer")
	anim.play("Note")
	await anim.animation_finished
	instance.queue_free()
