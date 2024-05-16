extends Node2D

var heroManager = HeroManager.new()
@onready var listOfHeroLabel = $ListOfHeroesLabel

func _on_display_heroes_button_pressed():
	self.visible = true

func _ready():
	var heroes = heroManager.getListOfHeroes()
	GlobalEventBus.connect("newHeroObtained", displayHeroes)

	if(heroes.size() > 0):
		displayHeroes(heroes)

func displayHeroes(heroes: Array[Hero]):
	print("NEW HERO")
	for hero in heroes:
		listOfHeroLabel.text += hero.heroName + "\n"
