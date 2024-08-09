extends Control

@onready var load_button = %LoadButton
@onready var save_button = %SaveButton
@onready var new_game_button = %NewGameButton
var is_game_launched = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if SaveManager.has_save():
		load_button.disabled = false

func _on_new_game_button_pressed():
	self.visible = false
	is_game_launched = true
	DbManager.new_game()

func _on_save_button_pressed():
	SaveManager.save()

func _on_load_button_pressed():
	SaveManager.load()
	self.visible = false
	is_game_launched = true

func _on_quit_button_pressed():
	get_tree().quit()

func _process(_delta):
	if is_game_launched:
		save_button.visible = true
		load_button.visible = false
		new_game_button.visible = false

	if Input.is_action_pressed("escape"):
		self.visible = true
