extends Area2D

class_name Farm

@onready var farmSprite = $FarmSprite as Sprite2D
@onready var currentMultiplierLabel = $CurrentMultiplier
@onready var upgradeButton = $UpgradeButton

var farmBuilding = Building.new("farm", 1)
var multiplier = 3

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
	farmBuilding.increaseMoney(multiplier)

func _on_upgrade_button_pressed():
	var hasUpgrade = farmBuilding.upgradeBuilding()
	if(hasUpgrade):
		multiplier = 6
		updateButtonLabel()

func updateButtonLabel():
	print(farmBuilding.getCostPerLevel())
	print(farmBuilding.buildingLevel)
	upgradeButton.text = "Level %d Upgrade $ %d" % [farmBuilding.buildingLevel, farmBuilding.getCostPerLevel()]
