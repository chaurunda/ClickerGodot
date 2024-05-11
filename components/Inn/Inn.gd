extends Area2D

@onready var timer = $Timer
@onready var timerUpgradeButton = $UpgradeUI/TimerUpgradeButton
@onready var amountUpgradeButton = $UpgradeUI/AmountUpgradeButton
@onready var upgradeUI = $UpgradeUI
@onready var amountOfGoldLabel = $AmountofGoldLabel

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
	setAmountOfGold()
	upgradeUI.visible = false

func _on_timer_timeout():
	GameState.increaseMoney(amountOfGold)

func _on_timer_upgrade_button_pressed():
	var hasUpgrade = timerInnBuilding.upgradeBuilding(timerUpgradeCount)
	if hasUpgrade:
		timerUpgradeCount += timerUpgradeCount
		setTimer()
		setTimerButtonLabel()

func _on_amount_upgrade_button_pressed():
	var hasUpgrade = amountInnBuilding.upgradeBuilding(amountUpgradeCount)
	if hasUpgrade:
		amountUpgradeCount += amountUpgradeCount
		setAmountButtonLabel()
		setAmountOfGold()

func setTimer():
	timer.wait_time = arrayOfWaitingTimes[timerInnBuilding.buildingLevel]

func _on_close_button_pressed():
	upgradeUI.visible = false

func _on_upgrade_button_pressed():
	upgradeUI.visible = true

func setAmountOfGoldLabel():
	amountOfGoldLabel.text = str(amountOfGold)

func setTimerButtonLabel():
	timerUpgradeButton.text = "Level %d Upgrade %d " % [timerInnBuilding.buildingLevel + 1, timerUpgradeCount]

func setAmountButtonLabel():
	amountUpgradeButton.text = "Level %d Upgrade %d " % [amountInnBuilding.buildingLevel, amountUpgradeCount]

func setAmountOfGold():
	amountOfGold = baseAmount * amountInnBuilding.buildingLevel
	setAmountOfGoldLabel()
