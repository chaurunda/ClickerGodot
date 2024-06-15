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

var heroId: Dictionary = {
	1: "Seraphine Wildheart",
	2: "Roderic Bloodclaw",
	3: "Sylx Shadowcloak",
	4: "Alaric Gloomgazer",
	5: "Valara Windwhisper",
	6: "Lyrianelm",
	7: "Aeris Windwhisper",
	8: "Teyrion Leafwhisper",
	9: "Narielis",
	10: "Finnian Stormborn",
	11: "Vaelen Frostbane",
	12: "Aldric Stormrage",
	13: "Draekos",
	14: "Zephyrath Drakemoon",
	15: "Grulmok",
}

func _init(id: HeroManager.HEROID, newLevel: int, newStats: Stats):
	heroName = computeName(id)
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

func computeName(heroID: HeroManager.HEROID):
	return heroId[heroID]

func equipItem(itemType: Item.ITEMS, newItem: Item):
	item[itemType] = newItem.id
	computeStats()

func unequipItem(itemType: String):
	item[itemType] = null
	computeStats()

func create():
	HeroManager.setObtainedHeroes(self)
