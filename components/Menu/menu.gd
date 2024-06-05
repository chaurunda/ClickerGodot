extends Node2D

@onready var loadButton = $GridContainer/LoadButton
@onready var saveButton = $GridContainer/SaveButton
@onready var newGameButton = $GridContainer/NewGameButton
var isGameLaunched = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if SaveManager.hasSave():
		loadButton.visible = true

func _on_new_game_button_pressed():
	self.visible = false
	isGameLaunched = true

func _on_save_button_pressed():
	SaveManager.save()

func _on_load_button_pressed():
	SaveManager.load()
	self.visible = false
	isGameLaunched = true

func _on_quit_button_pressed():
	get_tree().quit()

func _process(_delta):
	if isGameLaunched:
		saveButton.visible = true
		loadButton.visible = false
		newGameButton.visible = false

	if Input.is_action_pressed("escape"):
		self.visible = true
