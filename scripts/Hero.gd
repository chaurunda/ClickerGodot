extends AnimatedSprite2D
class_name Hero

var hero_name: String
var level: int
var base_stats: Stats
var uuid: HeroManager.HEROID = HeroManager.HEROID.JOHN_DOE
var current_stats: Dictionary = {
	"health": null,
	"attack": null,
	"armor": null
}
var thumbmail_path: String
var sprite_path: String

var item: Dictionary = {
	Item.ITEMS.WEAPON: null,
	Item.ITEMS.CHEST: null,
	Item.ITEMS.LEGS: null,
	Item.ITEMS.HELMET: null,
}

func _init(id: HeroManager.HEROID, new_level: int, new_stats: Stats, new_name: String):
	hero_name = new_name
	level = new_level
	base_stats = new_stats
	uuid = id
	compute_stats()
	sprite_path = 'res://components/HeroesSprites/' + str(id)

func compute_stats():
	current_stats.health = base_stats.health
	current_stats.attack = base_stats.attack
	current_stats.armor = base_stats.armor
	if item[Item.ITEMS.WEAPON] != null:
		print(item[Item.ITEMS.WEAPON].stats.attack)
		current_stats.attack += item[Item.ITEMS.WEAPON].stats.attack

func equip_item(itemType: Item.ITEMS, newItem: Item):
	item[itemType] = newItem
	compute_stats()

func unequip_item(itemType: Item.ITEMS):
	item[itemType] = null
	compute_stats()

func create():
	HeroManager.set_obtained_heroes(self)
