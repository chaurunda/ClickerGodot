extends Node

class_name HUD

@onready var money_label = $MarginContainer/MoneyLabel

func _process(_delta):
	updateDisplay()

func updateDisplay():
	money_label.text = "$ %d" % MoneyHandler.get_current_money()
