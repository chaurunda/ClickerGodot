extends Node

func decrease_money(value: int):
	GameState.current_money -= value

func get_current_money():
	return GameState.current_money

func set_current_money(money: int):
	GameState.current_money = money
