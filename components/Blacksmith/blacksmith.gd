extends Node2D

class_name Blacksmith

@onready var item_modal = $ItemModal
@onready var ui_container = $UIContainer

var blacksmith_building = Building.new("blacksmith", 1)
var is_ui_displayed = false

func _ready():
	is_ui_displayed = false
	item_modal.visible = false

func _process(_delta):
	ui_container.visible = is_ui_displayed

func _on_button_pressed():
	is_ui_displayed = !is_ui_displayed

func save():
	var saveData = {
		"building_level": blacksmith_building.building_level,
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
	}
	return saveData

func _on_buy_item_button_pressed():
	item_modal.visible = true

func _on_close_button_pressed():
	is_ui_displayed = false
