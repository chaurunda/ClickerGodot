class_name Items

var list_of_wooden_items: Array[Item]= [
  Item.new('Wooden Sword', 1, Stats.new(0, 10, 0), Item.ITEMS.WEAPON, 1),
  Item.new('Wooden Helmet', 1, Stats.new(1, 0, 1), Item.ITEMS.HELMET, 2),
  Item.new('Wooden Legs', 1, Stats.new(1, 0, 1), Item.ITEMS.LEGS, 3),
  Item.new('Wooden Chest', 1, Stats.new(1, 0, 1), Item.ITEMS.CHEST, 4)
]

func available_items():
  return list_of_wooden_items
