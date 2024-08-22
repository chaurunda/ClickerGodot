extends Button

var item_cost: int
var item_id: int
var item_name: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_pressed():
	if MoneyHandler.get_current_money() >= item_cost:
		MoneyHandler.decrease_money(item_cost)
		ItemManager.set_obtained_item(item_id)
		self.queue_free()
