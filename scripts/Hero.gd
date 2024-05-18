class_name Hero

var heroName: String
var level: int
var baseStats: Stats
var uuid: String
var currentStats: Dictionary = {
	"health": null,
	"attack": null,
	"armor": null
}
const uuid_util = preload("res://addons/uuid.gd")

var item: Dictionary = {
	Item.ITEMS.WEAPON: null,
	Item.ITEMS.CHEST: null,
	Item.ITEMS.LEGS: null,
	Item.ITEMS.HELMET: null,
}

func _init(newName: String, newLevel: int, newStats: Stats):
	heroName = newName
	level = newLevel
	baseStats = newStats
	uuid = uuid_util.v4()
	computeStats()

func computeStats():
	currentStats.health = baseStats.health
	currentStats.attack = baseStats.attack
	currentStats.armor = baseStats.armor
	if item[Item.ITEMS.WEAPON] != null:
		currentStats.attack += item[Item.ITEMS.WEAPON].stat.attack

func equipItem(itemType: Item.ITEMS, newItem: Item):
	item[itemType] = newItem
	computeStats()

func unequipItem(itemType: String):
	item[itemType] = null
	computeStats()


func getCost():
	var flo = floor(level / 10) * (50 * floor(level / 10)) * 10
	return (50 * (floor((level/10) + 1)) * (level % 10 + 1)) + flo

func create():
	var newStuff = Item.new("sword", 1, Stats.new(0, 10, 0))

	equipItem(Item.ITEMS.WEAPON, newStuff)
	HeroManager.setObtainedHeroes(self)
