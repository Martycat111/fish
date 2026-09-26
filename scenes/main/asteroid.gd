extends Node2D

var chance
var items: Array[String] = []

enum Chances {
	COPPER = 2,
	IRON = 3,
	GOLD = 1,
	STONE = 4,
}

@onready var noter = get_node("../Notifier")

func _process(_delta: float) -> void: pass

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
			items.append("Copper")
	
	#iron
	for i in range(Chances.IRON):
		roll_chance()
		if chance > 0.5:
			items.append("Iron")
	
	#gold
	roll_chance()
	if chance > 0.75:
		items.append("Gold")
	
	#stone
	for i in range(Chances.STONE):
		roll_chance()
		if chance > 0.5:
			items.append("Stone")
