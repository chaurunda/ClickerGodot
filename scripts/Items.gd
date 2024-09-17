class_name Items

var list_of_wooden_items: Array[Item] = [
  Item.new('Wooden Sword', 1, Stats.new(0, 10, 0), Item.ITEMS.WEAPON, 1, Item.RARITY.COMMON),
  Item.new('Wooden Helmet', 1, Stats.new(1, 0, 1), Item.ITEMS.HELMET, 2, Item.RARITY.COMMON),
  Item.new('Wooden Legs', 1, Stats.new(1, 0, 1), Item.ITEMS.LEGS, 3, Item.RARITY.COMMON),
  Item.new('Wooden Chest', 1, Stats.new(1, 0, 1), Item.ITEMS.CHEST, 4, Item.RARITY.COMMON)
]

var list_of_iron_items: Array[Item] = [
  Item.new('Iron Sword', 1, Stats.new(0, 20, 0), Item.ITEMS.WEAPON, 5, Item.RARITY.UNCOMMON),
  Item.new('Iron Helmet', 1, Stats.new(2, 0, 2), Item.ITEMS.HELMET, 6, Item.RARITY.UNCOMMON),
  Item.new('Iron Legs', 1, Stats.new(2, 0, 2), Item.ITEMS.LEGS, 7, Item.RARITY.UNCOMMON),
  Item.new('Iron Chest', 1, Stats.new(2, 0, 2), Item.ITEMS.CHEST, 8, Item.RARITY.UNCOMMON)
]

var list_of_gold_items: Array[Item] = [
  Item.new('Golden Sword', 1, Stats.new(0, 30, 0), Item.ITEMS.WEAPON, 9, Item.RARITY.RARE),
  Item.new('Golden Helmet', 1, Stats.new(3, 0, 3), Item.ITEMS.HELMET, 10, Item.RARITY.RARE),
  Item.new('Golden Legs', 1, Stats.new(3, 0, 3), Item.ITEMS.LEGS, 11, Item.RARITY.RARE),
  Item.new('Golden Chest', 1, Stats.new(3, 0, 3), Item.ITEMS.CHEST, 12, Item.RARITY.RARE)
]
var list_of_diamond_items: Array[Item] = [
  Item.new('Diamond Sword', 1, Stats.new(0, 40, 0), Item.ITEMS.WEAPON, 13, Item.RARITY.LEGENDARY),
  Item.new('Diamond Helmet', 1, Stats.new(4, 0, 4), Item.ITEMS.HELMET, 14, Item.RARITY.LEGENDARY),
  Item.new('Diamond Legs', 1, Stats.new(4, 0, 4), Item.ITEMS.LEGS, 15, Item.RARITY.LEGENDARY),
  Item.new('Diamond Chest', 1, Stats.new(4, 0, 4), Item.ITEMS.CHEST, 16, Item.RARITY.LEGENDARY)
]

func available_items():
  var array_of_item = []
  array_of_item.append_array(list_of_wooden_items)
  array_of_item.append_array(list_of_iron_items)
  array_of_item.append_array(list_of_gold_items)
  array_of_item.append_array(list_of_diamond_items)
  return array_of_item
