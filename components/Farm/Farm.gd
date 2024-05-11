extends Area2D

class_name Farm

@onready var farmSprite = $FarmSprite as Sprite2D
@onready var currentMultiplierLabel = $CurrentMultiplier
@onready var updagrateButton = $UpgradeButton

var building = Building.new("farm", 1)
var multiplier = 3
const arrayOfLevelUp = [1,300,1000,2000,6000,10000]

var currentLevelUp = arrayOfLevelUp[building.buildingLevel - 1] :
	get:
		return arrayOfLevelUp[building.buildingLevel - 1]

# Called when the node enters the scene tree for the first time.
func _ready():
	updateButtonLabel()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	currentMultiplierLabel.text = str(multiplier)

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	GameState.increaseMoney(multiplier)

func _on_upgrade_button_pressed():
	var hasUpgrade = building.upgradeBuilding(currentLevelUp)
	if(hasUpgrade):
		multiplier = 6
		updateButtonLabel()

func updateButtonLabel():
	updagrateButton.text = "Upgrade : $ %d" % currentLevelUp

