extends GutTest

func test_init():
  var stats = Stats.new(10, 20, 30)
  assert_eq(10, stats.health)
  assert_eq(20, stats.attack)
  assert_eq(30, stats.armor)
