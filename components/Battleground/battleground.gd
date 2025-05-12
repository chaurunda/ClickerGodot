extends Node2D

@export var battleground_hero_scene: PackedScene
@onready var hero_box_container: VBoxContainer = $Control/HBoxContainer/HeroBoxContainer

var isFocusOnScreen :bool = false
var heroesHasBeenDisplayed: bool = false
func _ready() -> void:
	GlobalEventBus.connect("go_to_battle_zone", display_heroes)
	GlobalEventBus.connect("back_to_village", hide_heroes)

func display_heroes() -> void:
	isFocusOnScreen = true

func hide_heroes() -> void:
	heroesHasBeenDisplayed = false
	isFocusOnScreen = false

func _process(_delta: float) -> void:
	if isFocusOnScreen:
		print('Wait, battling ..')
		if !heroesHasBeenDisplayed :
			displayHeroes()

func displayHeroes():
	var obtained_heroes = HeroDbManager.get_obtained_heroes()
	for hero in obtained_heroes:
		var hero_text = Label.new()
		# hero_text.text = hero[0].name
		hero_box_container.add_child(hero_text)
	heroesHasBeenDisplayed = true
