extends Area2D

@onready var timer = $Timer
@onready var timer_upgrade_button = $UpgradeUI/TimerUpgradeButton
@onready var amount_upgrade_button = $UpgradeUI/AmountUpgradeButton
@onready var upgrade_ui = $UpgradeUI

@export var base_amount = 10


var timer_inn_building = Building.new("InnTimer", 0)
var amount_inn_building = Building.new("InnAmout", 1)

const array_of_waiting_times = [10, 6, 2, 1, .5, .1]
var timer_upgrade_count = timer_inn_building.get_cost_per_level()

var amount_of_gold = 0
var amount_upgrade_count = amount_inn_building.get_cost_per_level()

func _ready():
	set_timer_button_label()
	set_amount_button_label()
	set_timer()
	upgrade_ui.visible = false

func _on_timer_timeout():
	timer_inn_building.increase_money(amount_of_gold)

func _on_timer_upgrade_button_pressed():
	var has_upgrade = timer_inn_building.upgrade_building()
	if has_upgrade:
		timer_upgrade_count += timer_upgrade_count
		set_timer()
		set_timer_button_label()

func _on_amount_upgrade_button_pressed():
	var has_upgrade = amount_inn_building.upgrade_building()
	if has_upgrade:
		amount_upgrade_count += amount_upgrade_count
		set_amount_button_label()

func set_timer():
	timer.wait_time = array_of_waiting_times[timer_inn_building.building_level]

func _on_close_button_pressed():
	upgrade_ui.visible = false

func _on_upgrade_button_pressed():
	upgrade_ui.visible = true

func set_timer_button_label():
	timer_upgrade_button.text = tr("UPGRADE_WITH_COST") % [timer_inn_building.building_level + 1, timer_inn_building.get_cost_per_level()]

func set_amount_button_label():
	amount_upgrade_button.text = tr("UPGRADE_WITH_COST") % [amount_inn_building.building_level, amount_inn_building.get_cost_per_level()]

func save():
	var save_data = {
		"building_level": timer_inn_building.building_level,
		"amountInnBuildingLevel": amount_inn_building.building_level,
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
	}
	return save_data
