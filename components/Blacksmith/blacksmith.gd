extends Node2D

class_name Blacksmith

@onready var upgradeButton = $UpgradeButton

var blacksmithBuilding = Building.new("blacksmith", 1)

func _ready():
	updateUpgradeButtonLabel()

func _on_button_pressed():
	var didUpgrade = blacksmithBuilding.upgradeBuilding()
	if didUpgrade:
		updateUpgradeButtonLabel()

func updateUpgradeButtonLabel():
	upgradeButton.text = "Level %d Upgrade : $%d" % [blacksmithBuilding.buildingLevel +1, blacksmithBuilding.getCostPerLevel()]

func getBuildingLevel():
	return blacksmithBuilding.buildingLevel

func _on_input_event(_viewport:Node, event:InputEvent, _shape_idx:int):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		print("weapon obtained")

func save():
	var saveData = {
		"buildingLevel": blacksmithBuilding.buildingLevel,
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
	}
	return saveData
