extends Node2D

var chance
var items: Array[String] = []

enum Chances {
	COPPER = 2,
	IRON = 3,
	GOLD = 1,
	STONE = 4,
}

var asteroid_spawn_interval = 5
var time_since_spawn = 0

@onready var noter = get_node("../Notifier")

func _process(delta: float) -> void: 
	time_since_spawn += delta
	if time_since_spawn > asteroid_spawn_interval:
		time_since_spawn = 0
		asteroid_spawn_interval += randi_range(0, 2)
		print("spawn a beor")

func breakdown():
	roll_items()
	print(items)
	noter.notify_array(items)

func roll_chance(): chance = randf()

func roll_items():
	items.clear()
	
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
