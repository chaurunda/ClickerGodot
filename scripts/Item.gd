class_name Item

var name: String
var id: int
var level: int
var stats: Stats
var thumbmail_path: String
var type: ITEMS
var rarity: int
var cost: int = 0


enum ITEMS {
  WEAPON,
  CHEST,
  LEGS,
  HELMET,
}

enum RARITY {
  COMMON,
  UNCOMMON,
  RARE,
  LEGENDARY
}

func _init(new_name: String, new_level: int, new_stats: Stats, new_type: ITEMS, new_id:int, new_rarity: RARITY):
  name = new_name
  level = new_level
  stats = new_stats
  id = new_id
  type = new_type
  rarity = new_rarity
  cost = compute_price(new_rarity)

func compute_price(new_rarity: RARITY):
  var price: int
  match new_rarity:
    0:
      price = 10
    1:
      price = 100
    2:
      price = 1000
    3:
      price = 10000
  return price
