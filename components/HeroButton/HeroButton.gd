extends Button

var currentHeroId: String

func _on_pressed():
	HeroManager.setCurrentHeroSelected(currentHeroId)
