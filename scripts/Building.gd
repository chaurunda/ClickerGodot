class_name Building

var buildingLevel: int
var buildingName: String


func _init(newName: String, level: int):
	buildingLevel = level
	buildingName = newName

func upgradeBuilding() -> bool:
	var cost = getCostPerLevel()
	var canUpgrade = GameState.currentMoney >= cost
	if canUpgrade:
		GameState.decreaseMoney(cost)
		buildingLevel += 1

	return canUpgrade

func getCostPerLevel():
	var flo = floor(buildingLevel / 10) * (50 * floor(buildingLevel / 10)) * 10
	return (50 * (floor((buildingLevel/10) + 1)) * (buildingLevel % 10 + 1)) + flo
