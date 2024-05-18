extends Area2D

@onready var UINode = $UI
@onready var upgradeButton = $UI/UpgradeButton

var tavernBuilding = Building.new("tavern", 1)
var tavernUpgradeCost = tavernBuilding.getCostPerLevel()



func _ready():
	setUpgradeButtonLabel()

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
	var newHero = Hero.new(1, Stats.new(20,10,0))
	newHero.create()

func _on_close_button_pressed():
	UINode.visible = false

func setUpgradeButtonLabel():
	upgradeButton.text = "Level %d Upgrade $ %d" % [tavernBuilding.buildingLevel, tavernUpgradeCost]
