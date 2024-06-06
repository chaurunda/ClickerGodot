extends Node2D

@export var heroButtonPackedScene: PackedScene
@onready var grid = $GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	var listOfHerosName = HeroManager.listOfHeroName
	for hero in listOfHerosName:
		var heroButton = heroButtonPackedScene.instantiate()
		heroButton.heroCost = hero.cost
		heroButton.text = hero.name
		heroButton.heroID = hero.id
		grid.add_child(heroButton)
