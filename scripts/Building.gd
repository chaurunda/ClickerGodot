class_name Building

var building_level: int
var building_name: String
@export var cost_base = 4
@export var growth = 1.07

func _init(new_name: String, level: int):
	building_level = level
	building_name = new_name

func upgrade_building() -> bool:
	var cost = get_cost_per_level()
	var can_upgrade = MoneyHandler.get_current_money() >= cost
	if can_upgrade:
		MoneyHandler.decrease_money(cost)
		building_level += 1

	return can_upgrade

func increase_money(cost: int):
	MoneyHandler.set_current_money(cost)

func get_cost_per_level():
	return round(cost_base * (growth ** building_level))

