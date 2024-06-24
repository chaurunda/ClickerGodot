extends Area2D

@onready var UINode = $UI
@onready var upgradeButton = $UI/GridContainer/UpgradeButton
@onready var getNewHeroButton = $UI/GridContainer/GetNewHero
@onready var modal = $Modal
@export var heroBaseCost := 200
@export var growth := 1.07

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
		GlobalEventBus.tavernLevelUp.emit() # Emit event for modal to update


func _on_close_button_pressed():
	UINode.visible = false

func setUpgradeButtonLabel():
	upgradeButton.text = "Level %d Upgrade $ %d" % [tavernBuilding.buildingLevel, tavernUpgradeCost]

func getCostPerLevel():
	return heroBaseCost * (growth ** GameState.obtainedHeroes.size())

func save():
	var saveData = {
		"buildingLevel": tavernBuilding.buildingLevel,
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
	}
	return saveData

func _on_get_new_hero_pressed():
	modal.visible = true
