extends GutTest

func test_available_item():
  var items = Items.new()
  var available_items = items.available_items()
  assert_eq(available_items.size(), 8)
  assert_eq(available_items[0].name, "Wooden Sword")
  assert_eq(available_items[1].name, "Wooden Helmet")
  assert_eq(available_items[2].name, "Wooden Legs")
  assert_eq(available_items[3].name, "Wooden Chest")
  assert_eq(available_items[4].name, "Iron Sword")
  assert_eq(available_items[5].name, "Iron Helmet")
  assert_eq(available_items[6].name, "Iron Legs")
  assert_eq(available_items[7].name, "Iron Chest")