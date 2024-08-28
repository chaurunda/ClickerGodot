extends GutTest

func test_init_hero():
  var stats = Stats.new(10, 20, 30)
  var hero = Hero.new(HeroManager.HEROID.AERIS_WINDWHISPER, 1, stats, "Sword")
  assert_eq(hero.hero_name, "Sword")
  assert_eq(hero.level, 1)
  assert_eq(hero.base_stats.health, 10)
  assert_eq(hero.base_stats.attack, 20)
  assert_eq(hero.base_stats.armor, 30)
  assert_eq(hero.uuid, 7)

func test_compute_stats():
  var stats = Stats.new(10, 20, 30)
  var hero = Hero.new(HeroManager.HEROID.AERIS_WINDWHISPER, 1, stats, "Sword")
  assert_eq(hero.current_stats.health, 10)
  assert_eq(hero.current_stats.attack, 20)
  assert_eq(hero.current_stats.armor, 30)
  var item = Item.new("Sword", 1, Stats.new(10, 20, 30), Item.ITEMS.WEAPON, 1, Item.RARITY.COMMON)
  hero.equip_item(Item.ITEMS.WEAPON, item)
  assert_eq(hero.current_stats.health, 10)
  assert_eq(hero.current_stats.attack, 40)
  assert_eq(hero.current_stats.armor, 30)
  hero.unequip_item(Item.ITEMS.WEAPON)
  assert_eq(hero.current_stats.health, 10)
  assert_eq(hero.current_stats.attack, 20)
  assert_eq(hero.current_stats.armor, 30)
