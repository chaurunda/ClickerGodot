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

const listOfFirstName = ["John", "Jane", "Doe", "Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Heidi"]
const listOfLastName = ["Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson"]

func computeFullName() -> String :
	var firstName = listOfFirstName[randi() % listOfFirstName.size()]
	var lastName = listOfLastName[randi() % listOfLastName.size()]
	return firstName + " " + lastName

func _init(newLevel: int, newStats: Stats):
	heroName = computeFullName()
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

func create():
	var newStuff = Item.new("sword", 1, Stats.new(0, 10, 0))

	equipItem(Item.ITEMS.WEAPON, newStuff)
	HeroManager.setObtainedHeroes(self)

func _to_string():
	return "weapons: %d" % item[Item.ITEMS.WEAPON]
	# return "currentStats : \nArmor : %d\nHealth : %d\nAttack : %d" % [currentStats.armor, currentStats.health, currentStats.attack]
