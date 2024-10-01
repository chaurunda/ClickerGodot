extends GutTest


func test_init_item():
  var stats = Stats.new(10, 20, 30)
  var item = Item.new("Sword", 1, stats, Item.ITEMS.WEAPON, Item.RARITY.COMMON)
  assert_eq(item.name, "Sword", "item.name")
  assert_eq(item.level, 1, "item.level")
  print('=======STATS======')
  assert_eq(item.stats.health, 10, "health")
  assert_eq(item.stats.attack, 20, "attack")
  assert_eq(item.stats.armor, 30, "armor")
  print('===================')
  assert_eq(item.type, Item.ITEMS.WEAPON, "item.type")
  assert_eq(item.rarity, Item.RARITY.COMMON, "item.rarity")
  assert_eq(item.cost, 10, "item.cost")
  item.id = 10
  assert_eq(item.id, 10, "item.id")

func test_compute_price():
  var item = Item.new("Sword", 1, Stats.new(10, 20, 30), Item.ITEMS.WEAPON, Item.RARITY.COMMON)
  assert_eq(item.compute_price(Item.RARITY.COMMON), 10)
  assert_eq(item.compute_price(Item.RARITY.UNCOMMON), 100)
  assert_eq(item.compute_price(Item.RARITY.RARE), 1000)
  assert_eq(item.compute_price(Item.RARITY.LEGENDARY), 10000)
