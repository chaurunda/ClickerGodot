extends Area2D

@onready var UINode = $UI
@onready var upgradeButton = $UI/UpgradeButton
@onready var getNewHeroButton = $UI/GetNewHeroButton
@export var heroBaseCost := 200
@export var growth := 1.07

var tavernBuilding = Building.new("tavern", 1)
var tavernUpgradeCost = tavernBuilding.getCostPerLevel()

func _ready():
	setUpgradeButtonLabel()
	setNewHeroButtonLabel()

func _process(_delta):
	pass

func _on_manage_button_pressed():
	UINode.visible = true

func _on_upgrade_button_pressed():
	var hasUpgrade = tavernBuilding.upgradeBuilding()
	if hasUpgrade:
		tavernUpgradeCost += tavernUpgradeCost
		setUpgradeButtonLabel()

func _on_get_new_hero_button_pressed():
	if MoneyHandler.getCurrentMoney() >= getCostPerLevel():
		MoneyHandler.decreaseMoney(getCostPerLevel())
		if Heroes.listOfHeroes.size() > GameState.obtainedHeroes.size():
			var newHero = Heroes.listOfHeroes[GameState.obtainedHeroes.size() - 1]
			newHero.create()
			setNewHeroButtonLabel()

func _on_close_button_pressed():
	UINode.visible = false

func setUpgradeButtonLabel():
	upgradeButton.text = "Level %d Upgrade $ %d" % [tavernBuilding.buildingLevel, tavernUpgradeCost]

func setNewHeroButtonLabel():
	getNewHeroButton.text = "Get New Hero $ %d" % [getCostPerLevel()]

func getCostPerLevel():
	return heroBaseCost * (growth ** GameState.obtainedHeroes.size())
