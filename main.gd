extends Node2D

@onready var camera = $Camera2D

var camera_initial_position = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	camera_initial_position = camera.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_test_button_pressed():
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(camera, "position", camera_initial_position + Vector2(0, 1200), 1.0)
