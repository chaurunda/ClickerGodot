extends Node

class_name HUD

@onready var moneyLabel = $MarginContainer/MoneyLabel

func _process(_delta):
	updateDisplay()

func updateDisplay():
	moneyLabel.text = "$ %d" % MoneyHandler.get_current_money()
