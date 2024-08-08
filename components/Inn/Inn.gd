extends Area2D

@onready var timer = $Timer
@onready var timerUpgradeButton = $UpgradeUI/TimerUpgradeButton
@onready var amountUpgradeButton = $UpgradeUI/AmountUpgradeButton
@onready var upgradeUI = $UpgradeUI

@export var baseAmount = 10


var timerInnBuilding = Building.new("InnTimer", 0)
var amountInnBuilding = Building.new("InnAmout", 1)

const arrayOfWaitingTimes = [10, 6, 2, 1, .5, .1]
var timerUpgradeCount = timerInnBuilding.getCostPerLevel()

var amountOfGold = 0
var amountUpgradeCount = amountInnBuilding.getCostPerLevel()

func _ready():
	setTimerButtonLabel()
	setAmountButtonLabel()
	setTimer()
	upgradeUI.visible = false

func _on_timer_timeout():
	timerInnBuilding.increaseMoney(amountOfGold)

func _on_timer_upgrade_button_pressed():
	var hasUpgrade = timerInnBuilding.upgradeBuilding()
	if hasUpgrade:
		timerUpgradeCount += timerUpgradeCount
		setTimer()
		setTimerButtonLabel()

func _on_amount_upgrade_button_pressed():
	var hasUpgrade = amountInnBuilding.upgradeBuilding()
	if hasUpgrade:
		amountUpgradeCount += amountUpgradeCount
		setAmountButtonLabel()

func setTimer():
	timer.wait_time = arrayOfWaitingTimes[timerInnBuilding.buildingLevel]

func _on_close_button_pressed():
	upgradeUI.visible = false

func _on_upgrade_button_pressed():
	upgradeUI.visible = true

func setTimerButtonLabel():
	timerUpgradeButton.text = tr("UPGRADE_WITH_COST") % [timerInnBuilding.buildingLevel + 1, timerInnBuilding.getCostPerLevel()]

func setAmountButtonLabel():
	amountUpgradeButton.text = tr("UPGRADE_WITH_COST") % [amountInnBuilding.buildingLevel, amountInnBuilding.getCostPerLevel()]

func save():
	var saveData = {
		"buildingLevel": timerInnBuilding.buildingLevel,
		"amountInnBuildingLevel": amountInnBuilding.buildingLevel,
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
	}
	return saveData
