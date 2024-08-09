extends Button

class_name HeroButton

var currentHeroId: HeroManager.HEROID

func _on_pressed():
	HeroManager.setCurrentHeroSelected(currentHeroId)
	GlobalEventBus.hero_selected.emit()
