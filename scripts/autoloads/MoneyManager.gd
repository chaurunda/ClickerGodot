extends Node

func decrease_money(value: int):
	GameState.currentMoney -= value

func get_current_money():
	return GameState.currentMoney

func set_current_money(money: int):
	GameState.currentMoney = money
