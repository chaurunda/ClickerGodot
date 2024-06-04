class_name Hero

var heroName: String
var level: int
var baseStats: Stats
var uuid: HEROID
var currentStats: Dictionary = {
	"health": null,
	"attack": null,
	"armor": null
}
var thumbmailPath: String

var item: Dictionary = {
	Item.ITEMS.WEAPON: null,
	Item.ITEMS.CHEST: null,
	Item.ITEMS.LEGS: null,
	Item.ITEMS.HELMET: null,
}

var heroId: Dictionary = {
	1: "Seraphine Wildheart",
	2: "Roderic Bloodclaw",
	3: "Sylx Shadowcloak",
	4: "Alaric Gloomgazer",
}

enum HEROID {
	SERAPHINE_WILDHEART = 1,
	RODERIC_BLOODCLAW = 2,
	SYLX_SHADOWCLOAK = 3,
	ALARIC_GLOOMGAZER = 4,
}

func _init(id: HEROID, newLevel: int, newStats: Stats):
	heroName = computeName(id)
	level = newLevel
	baseStats = newStats
	uuid = id
	computeStats()

func computeStats():
	currentStats.health = baseStats.health
	currentStats.attack = baseStats.attack
	currentStats.armor = baseStats.armor
	if item[Item.ITEMS.WEAPON] != null:
		currentStats.attack += item[Item.ITEMS.WEAPON].stat.attack

func computeName(heroID: HEROID):
	return heroId[heroID]

func equipItem(itemType: Item.ITEMS, newItem: Item):
	item[itemType] = newItem.id
	computeStats()

func unequipItem(itemType: String):
	item[itemType] = null
	computeStats()

func create():
	HeroManager.setObtainedHeroes(self)
