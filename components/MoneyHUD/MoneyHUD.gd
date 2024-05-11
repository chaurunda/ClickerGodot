extends Node

class_name MoneyHUD

@onready var moneyLabel = $MoneyLabel

func _process(delta):
	updateDisplay()

func updateDisplay():
	moneyLabel.text = "$ %d" % GameState.currentMoney
