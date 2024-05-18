extends Node2D

@onready var listOfHeroLabel = $ListOfHeroesLabel
@onready var nameLabel = $NameLabel
@onready var currentHeroStatsLabel = $CurrentHeroStatLabel
@onready var listOfHeroZone = $ListOfHeroZone

@onready var heroes = HeroManager.getListOfHeroes()
var heroButton = preload("res://components/HeroButton/HeroButton.tscn").instantiate()
var node2d = Node2D.new()

func _on_display_heroes_button_pressed():
	self.visible = true

	for hero in GameState.obtainedHeroes:
		heroButton.currentHeroId = hero.uuid
		heroButton.text = hero.heroName
		node2d.add_child(heroButton)

	add_child(node2d)

func _ready():
	GlobalEventBus.connect("newHeroObtained", displayHeroes)

	if(heroes.size() > 0):
		displayHeroes()
		setCurrentHeroSelected(heroes[0])


func displayHeroes():
	var listOfHeros = HeroManager.getListOfHeroes()
	for hero in listOfHeros:
		listOfHeroLabel.text += hero.heroName + "\n"
	setCurrentHeroSelected(listOfHeros[0])

func setCurrentHeroSelected(hero: Hero):
	HeroManager.setCurrentHeroSelected(hero)
	updateHeroNameLabel(hero)
	updateHeroStatsLabel(hero)

func updateHeroNameLabel(currentHero: Hero):
	nameLabel.text = "%s level %s" % [currentHero.heroName, currentHero.level]

func updateHeroStatsLabel(currentHero: Hero):
	currentHeroStatsLabel.text = "Health: %s\nAttack: %s\nArmor: %s" % [currentHero.currentStats.health, currentHero.currentStats.attack, currentHero.currentStats.armor]

