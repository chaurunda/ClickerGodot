extends Area2D

class_name Farm

@onready var current_multiplier_label = $CurrentMultiplier
@onready var upgrade_button = $UpgradeButton

var farm_building = Building.new("farm", 1)
var multiplier = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	update_button_label()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	current_multiplier_label.text = str(multiplier)

func _input_event(_viewport:Viewport, event:InputEvent, _shape_idx:int):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	farm_building.increase_money(multiplier)

func _on_upgrade_button_pressed():
	var has_upgrade = farm_building.upgrade_building()
	if(has_upgrade):
		multiplier = 6
		update_button_label()

func update_button_label():
	upgrade_button.text = tr("UPGRADE_WITH_COST") % [farm_building.building_level+1, farm_building.get_cost_per_level()]

func _on_input_event(_viewport:Node, event:InputEvent, _shape_idx:int):
	if event is InputEventMouseButton:
		if event.is_pressed():
			pass
		if event.is_released():
			pass

func save():
	var save_data = {
		"building_level": farm_building.building_level,
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
	}
	return save_data
