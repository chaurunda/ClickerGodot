extends Control

@onready var listOfHeroLabel = $ListOfHeroesLabel
@onready var nameLabel = $NameLabel
@onready var currentHeroStatsLabel = $CurrentHeroStatLabel
@onready var listOfHeroZone = $MarginContainer/ListOfHeroZone

@onready var heroes = HeroManager.getListOfHeroes()

var margin = 10

func _on_display_heroes_button_pressed():
	self.visible = true

	for hero in GameState.obtainedHeroes:
		var heroButton = preload("res://components/HeroButton/HeroButton.tscn").instantiate()
		heroButton.currentHeroId = hero.uuid
		heroButton.text = hero.heroName
		listOfHeroZone.add_child(heroButton)

func _ready():
	GlobalEventBus.connect("newHeroObtained", displayHeroes)

func _process(_delta):
	displaySelectedHero()

func displayHeroes():
	var listOfHeros = HeroManager.getListOfHeroes()
	setCurrentHeroSelected(listOfHeros[0])

func setCurrentHeroSelected(hero: Hero):
	HeroManager.setCurrentHeroSelected(hero.uuid)

func displaySelectedHero():
	var currentHero = HeroManager.getCurrentHeroSelected()
	if currentHero:
		updateHeroNameLabel(currentHero)
		updateHeroStatsLabel(currentHero)

func updateHeroNameLabel(currentHero: Hero):
	nameLabel.text = "%s level %s" % [currentHero.heroName, currentHero.level]

func updateHeroStatsLabel(currentHero: Hero):
	currentHeroStatsLabel.text = "Health: %s\nAttack: %s\nArmor: %s" % [currentHero.currentStats.health, currentHero.currentStats.attack, currentHero.currentStats.armor]

func _on_close_button_pressed():
	self.visible = false
	for child in listOfHeroZone.get_children():
		if child is HeroButton:
			child.queue_free()
