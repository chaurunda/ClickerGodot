extends Button

class_name HeroButton

var current_hero_id: HeroManager.HEROID

func _on_pressed():
	HeroManager.set_current_hero_selected(current_hero_id)
	GlobalEventBus.hero_selected.emit()
