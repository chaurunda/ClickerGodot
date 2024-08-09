extends Node2D

class_name Blacksmith

@onready var upgradeButton = $UpgradeButton
@onready var itemModal = $ItemModal
@onready var uiContainer = $UIContainer

var blacksmithBuilding = Building.new("blacksmith", 1)

func _on_button_pressed():
	uiContainer.visible = true

func save():
	var saveData = {
		"building_level": blacksmithBuilding.building_level,
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
	}
	return saveData

func _on_buy_item_button_pressed():
	itemModal.visible = true
