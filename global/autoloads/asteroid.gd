extends Node2D

var chance
var items: Array[String] = []

enum Chances {
	COPPER = 2,
	IRON = 3,
	GOLD = 1,
	STONE = 4,
}

var asteroid_spawn_interval = 0
var time_since_spawn = 0

@onready var noter = get_tree().root.get_node("Main/PlayerShip/Notifier")

var asteroid_scene = load("res://scenes/asteroid/asteroid.tscn")

func ready() -> void:
	pass

func _process(delta: float) -> void: 
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
		print(Globals.xpos)
		print(Globals.ypos)
		var posx = Globals.xpos + randi_range(-200, 200)
		var posy = Globals.ypos + randi_range(-200, 200)
		instance.position = Vector2(posx, posy)


func breakdown():
	roll_items()
	print(items)
	if noter:
		noter.notify_array(items)
		items = []

func roll_chance(): chance = randf()

func roll_items():
	
	#copper
	for i in range(Chances.COPPER):
		roll_chance()
		if chance > 0.66:
			Globals.copper += 1
			items.append("Copper")
	
	#iron
	for i in range(Chances.IRON):
		roll_chance()
		if chance > 0.5:
			Globals.iron += 1
			items.append("Iron")
	
	#gold
	roll_chance()
	if chance > 0.75:
		Globals.gold += 1
		items.append("Gold")
	
	#stone
	for i in range(Chances.STONE):
		roll_chance()
		if chance > 0.5:
			Globals.stone += 1
			items.append("Stone")
