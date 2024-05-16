class_name MoneyManager

func increaseMoney(value: int):
	GameState.currentMoney += value

func decreaseMoney(value: int):
	GameState.currentMoney -= value
