extends Control

@onready var nameLabel = $NameLabel
@onready var currentHeroStatsLabel = $CurrentHeroStatLabel
@onready var listOfHeroZone = $MarginContainer/ListOfHeroZone
@onready var obtainedHeroesSprite = $ObtainedHeroesSprite
@onready var heroes = HeroManager.getListOfHeroes()
@export var heroButtonPackedScene: PackedScene

var margin = 10

func _on_display_heroes_button_pressed():
	self.visible = true

	for hero in GameState.obtainedHeroes:
		var heroButton = heroButtonPackedScene.instantiate()
		heroButton.currentHeroId = hero.uuid
		heroButton.text = hero.heroName
		listOfHeroZone.add_child(heroButton)

	if GameState.obtainedHeroes.size() > 0:
		updateHeroImage()


func _ready():
	GlobalEventBus.connect("newHeroObtained", displayHeroes)
	GlobalEventBus.connect("heroSelected", updateHeroImage)

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

	removeCurrentHeroSprite()

func updateHeroImage():
	removeCurrentHeroSprite()
	var currentHero = HeroManager.getCurrentHeroSelected()
	var heroAnimatedSprite = null
	match currentHero.uuid:
		Hero.HEROID.RODERIC_BLOODCLAW:
			heroAnimatedSprite = preload("res://components/HeroesSprites/roderic_animated_sprite.tscn").instantiate()
		Hero.HEROID.SERAPHINE_WILDHEART:
			heroAnimatedSprite = preload("res://components/HeroesSprites/seraphine_animated_sprite.tscn").instantiate()
		Hero.HEROID.SYLX_SHADOWCLOAK:
			heroAnimatedSprite = preload("res://components/HeroesSprites/sylx_animated_sprite.tscn").instantiate()
		Hero.HEROID.ALARIC_GLOOMGAZER:
			heroAnimatedSprite = preload("res://components/HeroesSprites/alaric_animated_sprite.tscn").instantiate()

	obtainedHeroesSprite.add_child(heroAnimatedSprite)

func removeCurrentHeroSprite():
	for child in obtainedHeroesSprite.get_children():
		child.queue_free()

