class_name Hero

var heroName: String
var level: int
var baseStats: Stats
var uuid: HeroManager.HEROID
var currentStats: Dictionary = {
	"health": null,
	"attack": null,
	"armor": null
}
var thumbmailPath: String
var spritePath: String

var item: Dictionary = {
	Item.ITEMS.WEAPON: null,
	Item.ITEMS.CHEST: null,
	Item.ITEMS.LEGS: null,
	Item.ITEMS.HELMET: null,
}

func _init(id: HeroManager.HEROID, newLevel: int, newStats: Stats, name: String):
	heroName = name
	level = newLevel
	baseStats = newStats
	uuid = id
	computeStats()
	spritePath = 'res://components/HeroesSprites/' + str(id)

func computeStats():
	currentStats.health = baseStats.health
	currentStats.attack = baseStats.attack
	currentStats.armor = baseStats.armor
	if item[Item.ITEMS.WEAPON] != null:
		currentStats.attack += item[Item.ITEMS.WEAPON].stat.attack

func equipItem(itemType: Item.ITEMS, newItem: Item):
	item[itemType] = newItem.id
	computeStats()

func unequipItem(itemType: String):
	item[itemType] = null
	computeStats()

func create():
	HeroManager.setobtained_heroes(self)
