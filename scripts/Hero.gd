class_name Hero

var heroName: String
var level: int
var baseStats: Stats
var currentStats: Dictionary = {
	"health": null,
	"attack": null,
	"armor": null
}

var item: Dictionary = {
	"weapon": null,
	"chest": null,
	"legs": null,
	"helmet": null,
}

func _init(newName: String, newLevel: int, newStats: Stats):
	heroName = newName
	level = newLevel
	baseStats = newStats
	computeStats()

func computeStats():
	currentStats.health = baseStats.health
	currentStats.attack = baseStats.attack
	currentStats.armor = baseStats.armor
	if item.weapon != null:
		currentStats.attack += item.weapon.stat.attack

func equipItem(itemType: String, newItem: Item):
	item[itemType] = newItem
	computeStats()

func unequipItem(itemType: String):
	item[itemType] = null
	computeStats()


func getCost():
	var flo = floor(level / 10) * (50 * floor(level / 10)) * 10
	return (50 * (floor((level/10) + 1)) * (level % 10 + 1)) + flo
