extends Node2D

var chance
var items = []
@onready var notifier = get_node("../Material-Notify")


func _ready() -> void:
	roll_items()
	print(items)
	notifier.notify_array(items)


func _process(_delta: float) -> void:
	pass

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

func roll_chance():
	chance = randf()
