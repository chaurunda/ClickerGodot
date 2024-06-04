extends Node

func increaseMoney(value: int):
	GameState.currentMoney += value

func decreaseMoney(value: int):
	GameState.currentMoney -= value

func getCurrentMoney():
	return GameState.currentMoney

func setCurrentMoney(money: int):
	GameState.currentMoney = money
