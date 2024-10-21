class_name Items

func item_to_json(item_name: String, level: int, health: int, attack: int, armor: int, type: Item.ITEMS, rarity: Item.RARITY):
  return {
    "name": item_name,
    "level": level,
    "stats": {
      "health": health,
      "attack": attack,
      "armor": armor
    },
    "type": type,
    "rarity": rarity
  }

var list_of_wooden_items = [
  item_to_json('Wooden Sword', 1, 0, 10, 0, Item.ITEMS.WEAPON, Item.RARITY.COMMON),
  item_to_json('Wooden Helmet', 1, 1, 0, 1, Item.ITEMS.HELMET, Item.RARITY.COMMON),
  item_to_json('Wooden Legs', 1, 1, 0, 1, Item.ITEMS.LEGS, Item.RARITY.COMMON),
  item_to_json('Wooden Chest', 1, 1, 0, 1, Item.ITEMS.CHEST, Item.RARITY.COMMON)
]

var list_of_iron_items = [
  item_to_json('Iron Sword', 1, 0, 20, 0, Item.ITEMS.WEAPON, Item.RARITY.UNCOMMON),
  item_to_json('Iron Helmet', 1, 2, 0, 2, Item.ITEMS.HELMET, Item.RARITY.UNCOMMON),
  item_to_json('Iron Legs', 1, 2, 0, 2, Item.ITEMS.LEGS, Item.RARITY.UNCOMMON),
  item_to_json('Iron Chest', 1, 2, 0, 2, Item.ITEMS.CHEST, Item.RARITY.UNCOMMON)
]

var list_of_gold_items = [
  item_to_json('Golden Sword', 1, 0, 30, 0, Item.ITEMS.WEAPON, Item.RARITY.RARE),
  item_to_json('Golden Helmet', 1, 3, 0, 3, Item.ITEMS.HELMET, Item.RARITY.RARE),
  item_to_json('Golden Legs', 1, 3, 0, 3, Item.ITEMS.LEGS, Item.RARITY.RARE),
  item_to_json('Golden Chest', 1, 3, 0, 3, Item.ITEMS.CHEST, Item.RARITY.RARE)
]
var list_of_diamond_items = [
  item_to_json('Diamond Sword', 1, 0, 40, 0, Item.ITEMS.WEAPON, Item.RARITY.LEGENDARY),
  item_to_json('Diamond Helmet', 1, 4, 0, 4, Item.ITEMS.HELMET, Item.RARITY.LEGENDARY),
  item_to_json('Diamond Legs', 1, 4, 0, 4, Item.ITEMS.LEGS, Item.RARITY.LEGENDARY),
  item_to_json('Diamond Chest', 1, 4, 0, 4, Item.ITEMS.CHEST, Item.RARITY.LEGENDARY)
]

func available_items() -> Array:
  var array_of_item = []
  array_of_item.append_array(list_of_wooden_items)
  array_of_item.append_array(list_of_iron_items)
  array_of_item.append_array(list_of_gold_items)
  array_of_item.append_array(list_of_diamond_items)
  return array_of_item
