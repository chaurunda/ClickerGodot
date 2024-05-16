extends Node

class_name HUD

@onready var moneyLabel = $MoneyLabel

func _process(_delta):
	updateDisplay()

func updateDisplay():
	moneyLabel.text = "$ %d" % GameState.currentMoney
