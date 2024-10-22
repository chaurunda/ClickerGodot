extends Control

@onready var item_type_option_button = %ItemTypeOptionButton
@onready var rarity_option_button = %RarityOptionButton
@onready var name_input = %NameInput
@onready var health_input = %HealthInput
@onready var attack_input = %AttackInput
@onready var armor_input = %ArmorInput


# Called when the node enters the scene tree for the first time.
func _ready():
	set_rarity_option_button()
	set_item_type_option_button()

func _on_button_pressed():
	DbManager.reset()

func set_rarity_option_button():
	for rarity in Item.RARITY:
		rarity_option_button.add_item(rarity, Item.RARITY[rarity])

func set_item_type_option_button():
	for itemType in Item.ITEMS:
		item_type_option_button.add_item(itemType, Item.ITEMS[itemType])


func _on_add_item_submit_button_pressed():
	if (name_input.text == "" || health_input.text == "" || attack_input.text == "" || armor_input.text == ""):
		print("Please fill all the fields")
		return
	var add_item = Item.new(name_input.text, 1, Stats.new(health_input.text.to_int(), attack_input.text.to_int(), armor_input.text.to_int()), item_type_option_button.get_selected(), rarity_option_button.get_selected(), 1)
	DbManager.add_item(add_item)
	clean_item_input()

func clean_item_input():
	name_input.text = ""
	health_input.text = ""
	attack_input.text = ""
	armor_input.text = ""
