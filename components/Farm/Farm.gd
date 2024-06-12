extends Area2D

class_name Farm

@onready var currentMultiplierLabel = $CurrentMultiplier
@onready var upgradeButton = $UpgradeButton

var farmBuilding = Building.new("farm", 1)
var multiplier = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	updateButtonLabel()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	currentMultiplierLabel.text = str(multiplier)

func _input_event(_viewport:Viewport, event:InputEvent, _shape_idx:int):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	farmBuilding.increaseMoney(multiplier)

func _on_upgrade_button_pressed():
	var hasUpgrade = farmBuilding.upgradeBuilding()
	if(hasUpgrade):
		multiplier = 6
		updateButtonLabel()

func updateButtonLabel():
	upgradeButton.text = "Level %d Upgrade $ %d" % [farmBuilding.buildingLevel+1, farmBuilding.getCostPerLevel()]

func _on_input_event(_viewport:Node, event:InputEvent, _shape_idx:int):
	if event is InputEventMouseButton:
		if event.is_pressed():
			pass
		if event.is_released():
			pass

func save():
	var saveData = {
		"buildingLevel": farmBuilding.buildingLevel,
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
	}
	return saveData
