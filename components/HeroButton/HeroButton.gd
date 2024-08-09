extends Button

class_name HeroButton

var currentHeroId: HeroManager.HEROID

func _on_pressed():
	HeroManager.set_current_hero_selected(currentHeroId)
	GlobalEventBus.hero_selected.emit()
