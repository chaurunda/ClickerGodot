class_name Building

var buildingLevel: int
var buildingName: String
@export var costBase = 4
@export var growth = 1.07
@export var productionBase = 1.67

func _init(newName: String, level: int):
	buildingLevel = level
	buildingName = newName

func upgradeBuilding() -> bool:
	var cost = getCostPerLevel()
	var canUpgrade = GameState.currentMoney >= cost
	if canUpgrade:
		MoneyManager.decreaseMoney(cost)
		buildingLevel += 1

	return canUpgrade

func increaseMoney(cost: int):
	MoneyManager.increaseMoney(cost)

func getCostPerLevel():
	return costBase * (growth ** buildingLevel)

