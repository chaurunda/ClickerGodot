class_name Items

var list_of_wooden_items: Array[Item] = [
  Item.new('Wooden Sword', 1, Stats.new(0, 10, 0), Item.ITEMS.WEAPON, Item.RARITY.COMMON),
  Item.new('Wooden Helmet', 1, Stats.new(1, 0, 1), Item.ITEMS.HELMET, Item.RARITY.COMMON),
  Item.new('Wooden Legs', 1, Stats.new(1, 0, 1), Item.ITEMS.LEGS, Item.RARITY.COMMON),
  Item.new('Wooden Chest', 1, Stats.new(1, 0, 1), Item.ITEMS.CHEST, Item.RARITY.COMMON)
]

var list_of_iron_items: Array[Item] = [
  Item.new('Iron Sword', 1, Stats.new(0, 20, 0), Item.ITEMS.WEAPON, Item.RARITY.UNCOMMON),
  Item.new('Iron Helmet', 1, Stats.new(2, 0, 2), Item.ITEMS.HELMET, Item.RARITY.UNCOMMON),
  Item.new('Iron Legs', 1, Stats.new(2, 0, 2), Item.ITEMS.LEGS, Item.RARITY.UNCOMMON),
  Item.new('Iron Chest', 1, Stats.new(2, 0, 2), Item.ITEMS.CHEST, Item.RARITY.UNCOMMON)
]

var list_of_gold_items: Array[Item] = [
  Item.new('Golden Sword', 1, Stats.new(0, 30, 0), Item.ITEMS.WEAPON, Item.RARITY.RARE),
  Item.new('Golden Helmet', 1, Stats.new(3, 0, 3), Item.ITEMS.HELMET, Item.RARITY.RARE),
  Item.new('Golden Legs', 1, Stats.new(3, 0, 3), Item.ITEMS.LEGS, Item.RARITY.RARE),
  Item.new('Golden Chest', 1, Stats.new(3, 0, 3), Item.ITEMS.CHEST, Item.RARITY.RARE)
]
var list_of_diamond_items: Array[Item] = [
  Item.new('Diamond Sword', 1, Stats.new(0, 40, 0), Item.ITEMS.WEAPON, Item.RARITY.LEGENDARY),
  Item.new('Diamond Helmet', 1, Stats.new(4, 0, 4), Item.ITEMS.HELMET, Item.RARITY.LEGENDARY),
  Item.new('Diamond Legs', 1, Stats.new(4, 0, 4), Item.ITEMS.LEGS, Item.RARITY.LEGENDARY),
  Item.new('Diamond Chest', 1, Stats.new(4, 0, 4), Item.ITEMS.CHEST, Item.RARITY.LEGENDARY)
]

func available_items() -> Array:
  var array_of_item = []
  array_of_item.append_array(list_of_wooden_items)
  array_of_item.append_array(list_of_iron_items)
  array_of_item.append_array(list_of_gold_items)
  array_of_item.append_array(list_of_diamond_items)
  return array_of_item
