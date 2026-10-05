extends Node2D

var chance
var items: Array[String] = []
var last_items: Array[String] = []

enum Chances {
	COPPER = 3,
	IRON = 2,
	GOLD = 1,
	STONE = 4,
}

var asteroid_spawn_interval = 0
var time_since_spawn = 0

var noter

var asteroid_scene = load("res://scenes/asteroid/asteroid.tscn")


var first_process: bool = true

func _process(delta: float) -> void:
	if first_process and has_node("/root/Main"):
		noter = get_node("/root/Main/PlayerShip/Notifier")
		first_process = false
	
	time_since_spawn += delta
	if time_since_spawn > asteroid_spawn_interval:
		time_since_spawn = 0
		if !asteroid_spawn_interval > 5:
			asteroid_spawn_interval += randf()
		else:
			asteroid_spawn_interval -= randf()
		#spawn asteroid
		var instance = asteroid_scene.instantiate()
		add_child(instance)
		var posx = Globals.xpos + randi_range(-200, 200)
		var posy = Globals.ypos + randi_range(-200, 200)
		instance.position = Vector2(posx, posy)


func breakdown():
	roll_items()
	var new_items: Array = items.duplicate()
	for item in last_items:
		new_items.erase(item)
	noter.notify_array(new_items)
	last_items = items.duplicate()

func roll_chance(): chance = randf()

func roll_items():
	
	#copper
	for i in range(Chances.COPPER):
		roll_chance()
		if chance > 0.80:
			Globals.copper += 1
			items.append("Copper")
	
	#iron
	for i in range(Chances.IRON):
		roll_chance()
		if chance > 0.85:
			Globals.iron += 1
			items.append("Iron")
	
	#gold
	roll_chance()
	if chance > 0.85:
		Globals.gold += 1
		items.append("Gold")
	
	#stone
	for i in range(Chances.STONE):
		roll_chance()
		if chance > 0.80:
			Globals.stone += 1
			items.append("Stone")
