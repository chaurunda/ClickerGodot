extends GutTest


func test_init_item():
  var stats = Stats.new(10, 20, 30)
  var item = Item.new("Sword", 1, stats, Item.ITEMS.WEAPON, 1, Item.RARITY.COMMON)
  assert_eq(item.name, "Sword")
  assert_eq(item.level, 1)
  assert_eq(item.stats.health, 10)
  assert_eq(item.stats.attack, 20)
  assert_eq(item.stats.armor, 30)
  assert_eq(item.id, 1)
  assert_eq(item.type, Item.ITEMS.WEAPON)
  assert_eq(item.rarity, Item.RARITY.COMMON)
  assert_eq(item.cost, 10)

func test_compute_price():
  var item = Item.new("Sword", 1, Stats.new(10, 20, 30), Item.ITEMS.WEAPON, 1, Item.RARITY.COMMON)
  assert_eq(item.compute_price(Item.RARITY.COMMON), 10)
  assert_eq(item.compute_price(Item.RARITY.UNCOMMON), 100)
  assert_eq(item.compute_price(Item.RARITY.RARE), 1000)
  assert_eq(item.compute_price(Item.RARITY.LEGENDARY), 10000)
