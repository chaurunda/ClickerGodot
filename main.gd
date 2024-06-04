extends Node2D


func _on_save_button_pressed():
	SaveManager.save()


func _on_load_button_pressed():
	SaveManager.load()
