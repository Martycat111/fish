extends Node2D

var chance
var items = []

@onready var noter = get_node("../Notifier")

func _process(_delta: float) -> void: pass

func breakdown():
	roll_items()
	print(items)
	noter.notify_array(items)

func roll_chance(): chance = randf()

func roll_items():
	items = []
	
	#copper
	roll_chance()
	if chance > 0.66:
		items.append("Copper")
	roll_chance()
	if chance > 0.66:
		items.append("Copper")
	
	#iron
	roll_chance()
	if chance > 0.5:
		items.append("Iron")
	roll_chance()
	if chance > 0.5:
		items.append("Iron")
	roll_chance()
	if chance > 0.5:
		items.append("Iron")
	
	#gold
	roll_chance()
	if chance > 0.75:
		items.append("Gold")
	
	#stone
	roll_chance()
	if chance > 0.5:
		items.append("Stone")
	roll_chance()
	if chance > 0.5:
		items.append("Stone")
	roll_chance()
	if chance > 0.5:
		items.append("Stone")
	roll_chance()
	if chance > 0.5:
		items.append("Stone")
