extends Control

@onready var loadButton = %LoadButton
@onready var saveButton = %SaveButton
@onready var newGameButton = %NewGameButton
var isGameLaunched = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if SaveManager.has_save():
		loadButton.disabled = false

func _on_new_game_button_pressed():
	self.visible = false
	isGameLaunched = true
	DbManager.newGame()

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
