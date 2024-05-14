extends Area2D

@onready var UINode = $UI
@onready var upgradeButton = $UI/UpgradeButton

var tavernBuilding = Building.new("tavern", 1)
var tavernUpgradeCost = tavernBuilding.getCostPerLevel()


func addHero():
	## to move to Hero.gd
	var newHero = Hero.new("hero1", 1, Stats.new(20, 10, 5))
	var newStuff = Item.new("sword", 1, Stats.new(0, 10, 0))

	newHero.equipItem(Item.ITEMS.WEAPON, newStuff)
	GameState.setObtainedHeroes(newHero)

func _ready():
	setUpgradeButtonLabel()

func _process(_delta):
	var heroes = GameState.getListOfHeroes()
	for hero in heroes:
		print(hero.baseStats.attack)
		print(hero.currentStats.attack)


func _on_manage_button_pressed():
	UINode.visible = true


func _on_upgrade_button_pressed():
	var hasUpgrade = tavernBuilding.upgradeBuilding()
	if hasUpgrade:
		tavernUpgradeCost += tavernUpgradeCost
		setUpgradeButtonLabel()


func _on_get_new_hero_button_pressed():
	addHero()


func _on_close_button_pressed():
	UINode.visible = false

func setUpgradeButtonLabel():
	upgradeButton.text = "Level %d Upgrade $ %d" % [tavernBuilding.buildingLevel, tavernUpgradeCost]
