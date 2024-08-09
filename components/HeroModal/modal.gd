extends Node2D

class_name HeroModal

@export var hero_button_packed_scene: PackedScene
@onready var grid = $PanelContainer/HBoxContainer/MarginContainer/GridContainer

func _ready():
	generate_hero()
	GlobalEventBus.connect("tavern_level_up", reset_generated_hero)

func compute_price(rarity):
	var price = 0
	if int(rarity) == 0:
		price = 200
	elif int(rarity) == 1:
		price = 1000
	elif int(rarity) == 2:
		price = 5000
	elif int(rarity) == 3:
		price = 15000
	return price

func generate_hero():
	var list_of_heros_name = DbManager.get_heros_list()
	for i in 4:
		var entry_number = randi() % list_of_heros_name.size()
		var hero = list_of_heros_name[entry_number]
		var hero_button = hero_button_packed_scene.instantiate()
		var price = compute_price(hero.rarity)
		hero_button.hero_cost = price
		hero_button.text = "{hero} : {price} $".format({"hero": hero.name, "price": price})
		hero_button.hero_id = hero.id
		hero_button.hero_name = hero.name
		grid.add_child(hero_button)
		list_of_heros_name.pop_at(entry_number)

func reset_generated_hero():
	for child in grid.get_children():
		child.queue_free()
	generate_hero()


func _on_close_button_pressed():
	self.visible = false
