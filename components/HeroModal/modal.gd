extends Node2D

@export var heroButtonPackedScene: PackedScene
@onready var grid = $GridContainer


func _ready():
	generateHero()

func computePrice(rarity):
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

func generateHero():
	var listOfHerosName = DbManager.getHerosList()
	for i in 4:
		var entryNumber = randi() % listOfHerosName.size()
		var hero = listOfHerosName[entryNumber]
		var heroButton = heroButtonPackedScene.instantiate()
		var price = computePrice(hero.rarity)
		heroButton.heroCost = price
		heroButton.text = "{hero} : {price} $".format({"hero": hero.name, "price": price})
		heroButton.heroID = hero.id
		grid.add_child(heroButton)
		listOfHerosName.pop_at(entryNumber)
