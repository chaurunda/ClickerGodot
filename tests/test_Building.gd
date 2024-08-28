extends GutTest

# Mock de MoneyHandler

# Variables de test
var building: Building

func test_upgrade_building():
  building = Building.new("Test", 1)
  # Arrange
  var cost = building.get_cost_per_level()
  MoneyHandler.set_current_money(cost) # Set money to cost
  var currentMoney = MoneyHandler.get_current_money()
  # Act
  var result = building.upgrade_building()
  # Assert
  assert_true(result)
  assert_eq(currentMoney - cost, MoneyHandler.get_current_money())
  assert_eq(2, building.building_level)

func test_upgrade_building_not_enough_money():
  building = Building.new("Test", 1)
  # Arrange
  var cost = building.get_cost_per_level()
  MoneyHandler.set_current_money(cost - 1) # Set money to cost - 1
  var currentMoney = MoneyHandler.get_current_money()
  # Act
  var result = building.upgrade_building()
  # Assert
  assert_false(result)
  assert_eq(currentMoney, MoneyHandler.get_current_money())
  assert_eq(1, building.building_level)

func test_get_cost_per_level():
  building = Building.new("Test", 1)
  # Arrange
  var expected = round(4 * (1.07 ** 1))
  # Act
  var result = building.get_cost_per_level()
  # Assert
  assert_eq(expected, result)

func test_increase_money():
  building = Building.new("Test", 1)
  # Arrange
  var cost = building.get_cost_per_level()
  MoneyHandler.set_current_money(0) # Set money to 0
  var currentMoney = MoneyHandler.get_current_money()
  # Act
  building.increase_money(cost)
  # Assert
  assert_eq(currentMoney + cost, MoneyHandler.get_current_money())
