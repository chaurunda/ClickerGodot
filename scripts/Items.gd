class_name Items

var list_of_wooden_items: Array[Item]= [
  Item.new('Wooden Sword', 1, Stats.new(0, 10, 0), Item.ITEMS.WEAPON, 1, Item.RARITY.COMMON),
  Item.new('Wooden Helmet', 1, Stats.new(1, 0, 1), Item.ITEMS.HELMET, 2, Item.RARITY.COMMON),
  Item.new('Wooden Legs', 1, Stats.new(1, 0, 1), Item.ITEMS.LEGS, 3, Item.RARITY.COMMON),
  Item.new('Wooden Chest', 1, Stats.new(1, 0, 1), Item.ITEMS.CHEST, 4, Item.RARITY.COMMON),
  Item.new('Iron Sword', 1, Stats.new(0, 20, 0), Item.ITEMS.WEAPON, 5, Item.RARITY.UNCOMMON),
  Item.new('Iron Helmet', 1, Stats.new(2, 0, 2), Item.ITEMS.HELMET, 6, Item.RARITY.UNCOMMON),
  Item.new('Iron Legs', 1, Stats.new(2, 0, 2), Item.ITEMS.LEGS, 7, Item.RARITY.UNCOMMON),
  Item.new('Iron Chest', 1, Stats.new(2, 0, 2), Item.ITEMS.CHEST, 8, Item.RARITY.UNCOMMON)
]

func available_items():
  return list_of_wooden_items
