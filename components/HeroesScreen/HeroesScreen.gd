extends Control

@onready var name_label = %NameLabel
@onready var current_hero_stats_label = %CurrentHeroStatLabel
@onready var list_of_hero_zone = %ListOfHeroZone
@onready var obtained_heroes_sprite = %ObtainedHeroesSprite
@onready var heroes = HeroManager.get_list_of_heroes()
@onready var hero_scene = load("res://components/Hero/hero.tscn")
@onready var loot_option_buttons = load("res://components/LootOptionButtons/loot_option_buttons.tscn")
@onready var main_container = %MainContainer
@export var hero_button_packed_scene: PackedScene

var margin = 10

func _on_display_heroes_button_pressed():
	self.visible = true

	for hero in GameState.obtained_heroes:
		var hero_button = hero_button_packed_scene.instantiate()
		hero_button.current_hero_id = hero.uuid
		hero_button.text = hero.hero_name + " - " + str(hero.uuid)
		list_of_hero_zone.add_child(hero_button)

	if GameState.obtained_heroes.size() > 0:
		update_hero_image()

	var loot_option_buttons_instance = loot_option_buttons.instantiate()
	main_container.add_child(loot_option_buttons_instance)

func _ready():
	GlobalEventBus.connect("new_hero_obtained", display_heroes)
	GlobalEventBus.connect("hero_selected", update_hero_image)


func _process(_delta):
	display_selected_hero()

func display_heroes():
	var list_of_heros = HeroManager.get_list_of_heroes()
	set_current_hero_selected(list_of_heros[0])

func set_current_hero_selected(hero: Hero):
	HeroManager.set_current_hero_selected(hero.uuid)

func display_selected_hero():
	var current_hero = HeroManager.get_current_Hero_selected()
	if current_hero:
		update_hero_name_label(current_hero)
		update_hero_stats_label(current_hero)

func update_hero_name_label(current_hero: Hero):
	name_label.text = tr("LEVEL_HERO_NAME") % [current_hero.hero_name, current_hero.level]

func update_hero_stats_label(current_hero: Hero):
	current_hero_stats_label.text = tr("HERO_STATS") % [current_hero.current_stats.health, current_hero.current_stats.attack, current_hero.current_stats.armor]

func _on_close_button_pressed():
	self.visible = false
	for child in list_of_hero_zone.get_children():
		if child is HeroButton:
			child.queue_free()

	for child in main_container.get_children():
		if child is LootOptionButtons:
			child.queue_free()

	remove_current_hero_sprite()

func update_hero_image():
	remove_current_hero_sprite()
	var current_hero = HeroManager.get_current_Hero_selected()
	var new_hero_sprite = load(current_hero.sprite_path + "/animated_sprite.tres")
	var new_hero_animated_sprite = hero_scene.instantiate()
	new_hero_animated_sprite.sprite_frames = new_hero_sprite
	obtained_heroes_sprite.add_child(new_hero_animated_sprite)
	new_hero_animated_sprite.play()

func remove_current_hero_sprite():
	for child in obtained_heroes_sprite.get_children():
		child.queue_free()

