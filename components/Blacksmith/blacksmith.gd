extends Node2D

class_name Blacksmith

@onready var item_modal = $ItemModal
@onready var ui_container = $UIContainer

var blacksmith_building = Building.new("blacksmith", 1)

func _on_button_pressed():
	ui_container.visible = true

func save():
	var saveData = {
		"building_level": blacksmith_building.building_level,
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
	}
	return saveData

func _on_buy_item_button_pressed():
	item_modal.visible = true
