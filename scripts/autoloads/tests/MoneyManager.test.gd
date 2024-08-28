extends GutTest

func before_each():
  GameState.currentMoney = 100

func test_decrease_money():
  # Arrange

  # Act
  MoneyHandler.decrease_money(50)

  # Assert
  assert_eq(GameState.currentMoney, 50)

func test_get_current_money():
  # Arrange

  # Act
  var current_money = MoneyHandler.get_current_money()

  # Assert
  assert_eq(current_money, 100)

func test_set_current_money():
  # Arrange

  # Act
  MoneyHandler.set_current_money(6185)

  # Assert
  assert_eq(GameState.currentMoney, 6185)
