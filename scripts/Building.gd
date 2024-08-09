class_name Building

var buildingLevel: int
var buildingName: String
@export var costBase = 4
@export var growth = 1.07

func _init(newName: String, level: int):
	buildingLevel = level
	buildingName = newName

func upgradeBuilding() -> bool:
	var cost = getCostPerLevel()
	var canUpgrade = MoneyHandler.get_current_money() >= cost
	if canUpgrade:
		MoneyHandler.decrease_money(cost)
		buildingLevel += 1

	return canUpgrade

func increase_money(cost: int):
	MoneyHandler.increase_money(cost)

func getCostPerLevel():
	return costBase * (growth ** buildingLevel)

