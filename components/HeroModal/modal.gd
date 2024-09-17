extends Node2D

class_name HeroModal

@export var new_hero_button_packed_scene: PackedScene
@onready var grid = $PanelContainer/MarginContainer/HBoxContainer/GridContainer

func _ready():
	generate_hero()
	GlobalEventBus.connect("tavern_level_up", reset_generated_hero)
	self.visible = false

func compute_price(rarity):
	var price = 0
	if int(rarity) == HeroManager.RARITY.COMMON:
		price = 200
	elif int(rarity) == HeroManager.RARITY.UNCOMMON:
		price = 1000
	elif int(rarity) == HeroManager.RARITY.RARE:
		price = 5000
	elif int(rarity) == HeroManager.RARITY.LEGENDARY:
		price = 15000
	return price

func generate_hero():
	var list_of_heros_name = DbManager.get_heros_list()
	if list_of_heros_name.size() > 0 :
		for i in 4:
			var entry_number = randi() % list_of_heros_name.size()
			var hero = list_of_heros_name[entry_number]
			var hero_button = new_hero_button_packed_scene.instantiate()
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
