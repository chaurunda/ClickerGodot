extends GridContainer

class_name LootOptionButtons

@onready var HelmetOptionButton = %HelmetOptionButton as OptionButton
@onready var ChestOptionButton = %ChestOptionButton as OptionButton
@onready var LegsOptionButton = %LegsOptionButton as OptionButton
@onready var WeaponOptionButton = %WeaponOptionButton as OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	fill_option_buttons()

func set_option_value(option_button: OptionButton, items: Array[Item]):
	for item in items:
		option_button.add_item(item.name, item.id)

func fill_option_buttons():
	set_option_value(ChestOptionButton, ItemManager.find_all_obtained_items_by_type(Item.ITEMS.CHEST))
	set_option_value(LegsOptionButton, ItemManager.find_all_obtained_items_by_type(Item.ITEMS.LEGS))
	set_option_value(WeaponOptionButton, ItemManager.find_all_obtained_items_by_type(Item.ITEMS.WEAPON))
	set_option_value(HelmetOptionButton, ItemManager.find_all_obtained_items_by_type(Item.ITEMS.HELMET))


func _on_helmet_option_button_item_selected(index:int):
	print(index)
