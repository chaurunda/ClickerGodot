extends Button

class_name HeroButton

var currentHeroId: String

func _on_pressed():
	HeroManager.setCurrentHeroSelected(currentHeroId)
