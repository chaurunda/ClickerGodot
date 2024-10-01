extends PanelContainer

@onready var grid = $MarginContainer/VBoxContainer/GridContainer
@export var new_item_button_packed_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	for item in ItemDbManager.get_items_list():
		var item_button = new_item_button_packed_scene.instantiate()
		item_button.item_name = item.name
		item_button.item_id = item.id
		item_button.item_cost = 10
		item_button.text = "{item} : {cost} $".format({"item": item.name, "cost": 10})
		grid.add_child(item_button)

func _on_close_button_pressed():
	self.visible = false
