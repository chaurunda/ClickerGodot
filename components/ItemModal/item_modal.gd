extends PanelContainer

@onready var grid = $MarginContainer/VBoxContainer/GridContainer
@export var new_item_button_packed_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	for item in ItemManager.get_available_items() :
		var item_button = new_item_button_packed_scene.instantiate()
		item_button.item_name = item.name
		item_button.item_cost = item.cost
		item_button.item_id = item.id
		item_button.text = "{item} : {cost} $".format({"item": item.name, "cost": item.cost})
		grid.add_child(item_button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_close_button_pressed():
	self.visible = false
