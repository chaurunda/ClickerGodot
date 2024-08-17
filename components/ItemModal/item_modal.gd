extends PanelContainer

@onready var grid = $MarginContainer/VBoxContainer/GridContainer
@export var new_item_button_packed_scene: PackedScene

var items = Items.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in items.available_items() :
		var item_button = new_item_button_packed_scene.instantiate()
		item_button.name = item.name
		item_button.hero_cost = item.level
		item_button.text = "{item} : {cost} $".format({"item": item.name, "cost": item.stats.health})
		grid.add_child(item_button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_close_button_pressed():
	self.visible = false
