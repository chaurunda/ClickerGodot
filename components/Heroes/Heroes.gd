extends Node2D

@onready var listOfHeroLabel = $ListOfHeroesLabel
@onready var nameLabel = $NameLabel
@onready var currentHeroStatsLabel = $CurrentHeroStatLabel
@onready var listOfHeroZone = $ListOfHeroZone

@onready var heroes = HeroManager.getListOfHeroes()

func _on_display_heroes_button_pressed():
	self.visible = true
	var i = 0

	for hero in GameState.obtainedHeroes:
		var node2d = Node2D.new()
		var heroButton = preload("res://components/HeroButton/HeroButton.tscn").instantiate()
		heroButton.currentHeroId = hero.uuid
		heroButton.text = hero.heroName
		heroButton.position = Vector2(node2d.position.x + (heroButton.position.x + heroButton.get_size().x * i ), node2d.position.y + (heroButton.position.y + heroButton.get_size().y * i ))
		node2d.add_child(heroButton)
		i += 1
		add_child(node2d)


func _ready():
	GlobalEventBus.connect("newHeroObtained", displayHeroes)

func _process(_delta):
	displaySelectedHero()

func displayHeroes():
	var listOfHeros = HeroManager.getListOfHeroes()
	for hero in listOfHeros:
		listOfHeroLabel.text += hero.heroName + "\n"
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
