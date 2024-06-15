extends Node2D

@export var heroButtonPackedScene: PackedScene
@onready var grid = $GridContainer


func _ready():
	var listOfHerosName = DbManager.getHerosList()
	for hero in listOfHerosName:
		var heroButton = heroButtonPackedScene.instantiate()
		heroButton.heroCost = computePrice(hero.rarity)
		heroButton.text = hero.name
		heroButton.heroID = hero.id
		grid.add_child(heroButton)

func computePrice(rarity):
	var price = 0
	if int(rarity) == 1:
		price = 200
	elif int(rarity) == 2:
		price = 1000
	elif int(rarity) == 3:
		price = 5000
	elif int(rarity) == 4:
		price = 15000
	return price
