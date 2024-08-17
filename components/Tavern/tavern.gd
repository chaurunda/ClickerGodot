extends Area2D

@onready var ui_node = $UI
@onready var upgrade_button = %UpgradeHeroButton
@onready var get_new_hero_button = %GetNewHeroButton
@onready var modal = $Modal
@export var hero_base_cost := 200
@export var growth := 1.07

var tavern_building = Building.new("tavern", 1)
var tavern_upgrade_cost = tavern_building.get_cost_per_level()

func _ready():
	set_upgrade_button_label()

func _process(_delta):
	pass

func _on_manage_button_pressed():
	ui_node.visible = true

func _on_upgrade_button_pressed():
	var has_upgrade = tavern_building.upgrade_building()
	if has_upgrade:
		tavern_upgrade_cost += tavern_upgrade_cost
		set_upgrade_button_label()
		GlobalEventBus.tavern_level_up.emit() # Emit event for modal to update


func _on_close_button_pressed():
	ui_node.visible = false

func set_upgrade_button_label():
	upgrade_button.text = tr("UPGRADE_WITH_COST") % [tavern_building.building_level, tavern_upgrade_cost]

func get_cost_per_level():
	return hero_base_cost * (growth ** GameState.obtained_heroes.size())

func save():
	var save_data = {
		"building_level": tavern_building.building_level,
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
	}
	return save_data

func _on_get_new_hero_pressed():
	modal.visible = true
